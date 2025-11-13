---
description: NSO Web UI development information.
---

# Web UI Development

The [NSO Web UI](/operation-and-usage/webui/README.md) provides a comprehensive baseline interface designed to cover common network management needs with a focus on usability and core functionality. It serves as a reliable starting point for customers who want immediate access to essential features without additional development effort.

For customers with specialized requirements—such as unique workflows, custom aesthetics, or integration with external systems—the NSO platform offers flexibility to build tailored Web UIs. This enables teams to create user experiences that precisely match their operational needs and branding guidelines.

At the core of NSO’s Web UI capabilities is the northbound [JSON-RPC API](json-rpc-api.md) which adheres to the [JSON-RPC 2.0 specification](https://www.jsonrpc.org/specification) and uses HTTP/S as the transport protocol

The JSON-RPC API contains a handful of methods with well-defined input `method` and `params`, along with the output `result`.

In addition, the API also implements a Comet model, as long polling, to allow the client to subscribe to different server events and receive event notifications about those events in near real-time.

You can call these from a browser using the modern [fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) API:

{% code title="With fetch" %}
``` javascript
fetch('http://127.0.0.1:8080/jsonrpc', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    jsonrpc: '2.0',
    id: 1,
    method: 'login',
    params: {
      user: 'admin',
      passwd: 'admin'
    }
  })
})
.then(response => response.json())
.then(data => {
  if (data.result) {
    console.log(data.result);
  } else {
    console.log(data.error.type);
  }
});
```
{% endcode %}

Or from the command line using [curl](https://curl.se):

{% code title="With curl" %}
``` bash
curl \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1, "method": "login", "params": {"user": "admin", "passwd": "admin"}}' \
    http://127.0.0.1:8080/jsonrpc
```
{% endcode %}


## Example of a Common Flow <a href="#d5e55" id="d5e55"></a>

You can read in the JSON-RPC API section about all the available methods and their signatures, but here is a working example of how a common flow would look like:

1. Log in.
2. Get system settings.
3. Create a new (read) transaction handle.
4. Read a value.
5. Create a new (read-write) transaction, in preparation for changing the value.
6. Set a value.
7. Validate and commit (save) the changes.

A secondary example is also provided that demonstrates the use and implementation of a Comet channel client for receiving notifications:

1. Log in.
2. Initialize comet channel subscription.
3. Commit a change to trigger a comet notification.
4. Stop and clean up the comet.

For a complete working example with a web UI, see the `webui-basic-example` NSO package in `${NCS_DIR}/examples.ncs/northbound-interfaces/webui`. This package demonstrates basic JSON-RPC API usage and 
can be run with `make demo`.

{% code title="index.js" overflow="wrap" lineNumbers="true" %}

```javascript
// The following code is purely for example purposes.
// The code has inline comments for a better understanding.
// Your mileage might vary.

const jsonrpcUrl = 'http://127.0.0.1:8080/jsonrpc';
const ths = {};
let cookie;

function log(msg) {
    console.log(msg);
}

function logAsciiTitle(titleText) {
    const border = '='.repeat(titleText.length + 8); // +8 for padding and corners
    const padding = ' '.repeat(titleText.length);

    log(''); // Add a blank line for spacing
    log(border);
    log(`==  ${padding}  ==`);
    log(`==  ${titleText}  ==`);
    log(`==  ${padding}  ==`);
    log(border);
    log(''); // Add a blank line for spacing
}

/**
 * CometChannel - Modern comet notification channel for NSO JSON-RPC API
 * 
 * Usage:
 *   const comet = new CometChannel({ jsonRpcCall, onError });
 *   comet.on('notification-handle', (message) => { console.log(message); });
 *   comet.stop();
 */
class CometChannel {
    constructor(options = {}) {
        this.jsonRpcCall = options.jsonRpcCall;
        this.onError = options.onError;
        this.id = options.id || 'comet-' + String(Math.random()).substring(2);
        this.sleep = options.sleep || 1000;

        this.handlers = new Map();
        this.polling = false;
        this.stopped = false;
    }

    on(handle, callback) {
        if (!callback || typeof callback !== 'function') {
            throw new Error(`Missing callback function for handle: ${handle}`);
        }

        if (!this.handlers.has(handle)) {
            this.handlers.set(handle, []);
        }

        this.handlers.get(handle).push(callback);

        // Start polling if not already running
        if (!this.polling && !this.stopped) {
            this._poll();
        }
    }

    async stop() {
        if (this.stopped) {
            return;
        }

        this.stopped = true;
        this.polling = false;

        const handles = Array.from(this.handlers.keys());
        const unsubscribePromises = handles.map(handle =>
            this.jsonRpcCall('unsubscribe', { handle }).catch((err) => {
                console.warn(`Failed to unsubscribe from ${handle}:`, err.message);
            }),
        );

        await Promise.all(unsubscribePromises);
        this.handlers.clear();
    }

    async _poll() {
        if (this.polling || this.stopped || this.handlers.size === 0) {
            return;
        }

        this.polling = true;

        try {
            const notifications = await this.jsonRpcCall('comet', {
                comet_id: this.id,
            });

            if (!this.stopped) {
                await this._handleNotifications(notifications);
            }
        } catch (error) {
            if (!this.stopped) {
                this._handlePollError(error);
                return; // Don't continue polling on error, error handler will retry
            }
        } finally {
            this.polling = false;
        }

        // Continue polling if not stopped
        if (!this.stopped && this.handlers.size > 0) {
            setTimeout(() => this._poll(), 0);
        }
    }

    async _handleNotifications(notifications) {
        if (!Array.isArray(notifications)) {
            return;
        }

        for (const notification of notifications) {
            const { handle, message } = notification;
            const callbacks = this.handlers.get(handle);

            // If we received a notification with no handlers, unsubscribe
            if (!callbacks || callbacks.length === 0) {
                try {
                    await this.jsonRpcCall('unsubscribe', { handle });
                } catch (error) {
                    console.warn(`Failed to unsubscribe from ${handle}:`, error.message);
                }
                continue;
            }

            // Call all registered callbacks for this handle
            callbacks.forEach((callback) => {
                try {
                    callback(message);
                } catch (error) {
                    console.error(`Error in notification handler for ${handle}:`, error);
                }
            });
        }
    }

    _handlePollError(error) {
        const errorType = error.type || error.message;

        if (errorType === 'comet.duplicated_channel') {
            this.onError(error);
            this.stopped = true;
        } else {
            this.onError(error);
            // Retry after sleep interval
            setTimeout(() => this._poll(), this.sleep);
        }
    }
}

async function jsonRpcCall(method, params = {}) {
    const headers = {
        Accept: 'application/json;charset=utf-8',
        'Content-Type': 'application/json;charset=utf-8',
    };

    if (cookie) {
        headers.Cookie = cookie;
    }

    const body = JSON.stringify({
        jsonrpc: '2.0',
        id: 1,
        method,
        params,
    });

    try {
        log(`REQUEST /jsonrpc/${method}:`);
        log(JSON.stringify(params, undefined, 2));

        const response = await fetch(jsonrpcUrl, {
            method: 'POST',
            headers,
            body,
        });

        if (!cookie) {
            const setCookieHeader = response.headers.get('set-cookie');
            if (setCookieHeader) {
                cookie = setCookieHeader.split(';')[0];
            }
        }

        if (!response.ok) {
            throw new Error(`Network error: ${response.status} ${response.statusText}`);
        }

        const data = await response.json();

        if (data.error) {
            const reasons = data.error.data
                && data.error.data.errors
                && data.error.data.errors[0]
                && data.error.data.errors[0].reason;
            let errorMessage = `JSON-RPC error: ${data.error.code} ${data.error.message}`;

            if (reasons) {
                errorMessage += ` (Reason: ${reasons})`;
            }

            throw new Error(errorMessage);
        }

        log(`RESPONSE /jsonrpc/${method}:`);
        log(JSON.stringify(data.result, undefined, 2));
        log('');
        return data.result;
    } catch (error) {
        log(`ERROR in ${method}: ${error.message}`);
        throw error;
    }
}

async function login() {
    return jsonRpcCall('login', { user: 'admin', passwd: 'admin' });
}

async function getSystemSetting() {
    return jsonRpcCall('get_system_setting');
}

async function newTrans(mode, tag) {
    const result = await jsonRpcCall('new_trans', { mode, tag, db: 'running' });
    ths[tag] = result.th;
    return result;
}

async function getValue(tag, valuePath) {
    const th = ths[tag];
    return jsonRpcCall('get_value', { th, path: valuePath });
}

async function setValue(tag, valuePath, newValue) {
    const th = ths[tag];
    return jsonRpcCall('set_value', { th, path: valuePath, value: newValue });
}

async function deleteValue(tag, path) {
    const th = ths[tag];
    return jsonRpcCall('delete', { th, path });
}

async function validateTrans(tag) {
    const th = ths[tag];
    try {
        return jsonRpcCall('validate_trans', { th });
    } catch (error) {
        return error.message;
    }
}

async function validateAndCommit(tag) {
    const th = ths[tag];
    await jsonRpcCall('validate_commit', { th });
    await jsonRpcCall('commit', { th });
}

const commonExample = async () => {
    try {
        const readTag = 'webui-read';
        const writeTag = 'webui-write';
        const path = '/ncs:devices/global-settings/connect-timeout';
        await login();
        await getSystemSetting();
        await newTrans('read', readTag);
        await getValue(readTag, path);
        await newTrans('read_write', writeTag);
        await setValue(writeTag, path, 20);
        await getValue(writeTag, path);
        const validationError = await validateTrans(writeTag);
        if (validationError) {
            // NOTE handle validation error if any
        }
        await validateAndCommit(writeTag);
        log(`INFO Note, using read tag: ${readTag}`);
        await getValue(readTag, path);
    } catch (error) {
        log(`ERROR Sequence aborted due to error: ${error.message}`);
        log(error);
    }
};

const cometExample = async () => {
    try {
        await login();

        const comet = new CometChannel({
            jsonRpcCall,
            onError: (error) => {
                log(`ERROR Comet error: ${error.message}`);
            },
        });
        const path = '/ncs:devices/global-settings/connect-timeout';
        const handle = `${comet.id}-connect-timeout`;
        log(`INFO Setting up subscription with handle: ${handle}`);

        comet.on(handle, (message) => {
            log('=== COMET NOTIFICATION RECEIVED ===');
            log(JSON.stringify(message, null, 2));
            log('=============================');
        });

        await jsonRpcCall('subscribe_changes', {
            path,
            handle,
            comet_id: comet.id,
        });

        // Check subscriptions are registered
        const subs = await jsonRpcCall('get_subscriptions');
        log(`INFO Active subscriptions count: ${subs.subscriptions.length}`);

        // Now make a change to trigger notification
        log('INFO Comiting a change to trigger comet notification...');
        const writeTag = 'test-write';
        await newTrans('read_write', writeTag);
        await setValue(writeTag, path, 42);
        await validateAndCommit(writeTag);

        await newTrans('read_write', writeTag);
        await deleteValue(writeTag, path);
        await validateAndCommit(writeTag);

        comet.stop().then(() => {
            log('INFO Comet channel stopped.');
            process.exit(0);
        });
    } catch (error) {
        log(`ERROR Comet sequence failed: ${error.message}`);
        log(error);
    }
};

(async () => {
    logAsciiTitle('Vanilla JS fetch common flow example');
    await commonExample();

    logAsciiTitle('Vanilla JS fetch comet example');
    await cometExample();
})();

```
{% endcode %}


## Single Sign-on (SSO)

The Single Sign-On functionality enables users to log in via HTTP-based northbound APIs with a single sign-on authentication scheme, such as SAMLv2. Currently, it is only supported for the JSON-RPC northbound interface.

{% hint style="info" %}
For Single Sign-On to work, the Package Authentication needs to be enabled, see [Package Authentication](../../../administration/management/aaa-infrastructure.md#ug.aaa.packageauth)).
{% endhint %}

When enabled, the endpoint `/sso` is made public and handles Single Sign-on attempts.

An example configuration for the cisco-nso-saml2-auth Authentication Package is presented below. Note that `/ncs-config/aaa/auth-order` does not need to be set for Single Sign-On to work!

{% code title="Example: Example ncs.conf to enable SAMLv2 Single Sign-On" %}
```xml
<aaa>
  <package-authentication>
    <enabled>true</enabled>
    <packages>
      <package>cisco-nso-saml2-auth</package>
    </packages>
  </package-authentication>
  <single-sign-on>
    <enabled>true</enabled>
  </single-sign-on>
</aaa>
```
{% endcode %}

A client attempting single sign-on authentication should request the `/sso` endpoint and then follow the continued authentication operation from there. For example, for `cisco-nso-saml2-auth`, the client is redirected to an Identity Provider (IdP), which subsequently handles the authentication, and then redirects the client back to the `/sso` endpoint to validate the authentication and set up the session.

## Web Server

An embedded basic web server can be used to deliver static and Common Gateway Interface (CGI) dynamic content to a web client, such as a web browser. See [Web Server](../../connected-topics/web-server.md) for more information.
