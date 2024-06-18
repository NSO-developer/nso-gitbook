---
description: NSO Web UI development information.
---

# Web UI Development

Web UI development is thought to be in the hands of the customer's front-end developers. They know best the requirements and how to fulfill those requirements in terms of aesthetics, functionality, and toolchain (frameworks, libraries, external data sources, and services).

NSO comes with a nortbound interface in the shape of a JSON-RPC API. This API is designed with Web UI applications in mind, and it complies with the [JSON-RPC 2.0 specification](https://www.jsonrpc.org/specification) while using HTTP/S as the transport mechanism.

The JSON-RPC API contains a handful of methods with well-defined input `method` and `params`, along with the output `result`.

In addition, the API also implements a Comet model, as long polling, to allow the client to subscribe to different server events and receive event notifications about those events in near real-time.

You can call these from a browser via:&#x20;

* AJAX (e.g., XMLHTTPRequest, [jQuery \[https://jquery.com/\]](https://jquery.com/))
* Or from the command line (e.g., [curl \[https://github.com/bagder/curl\]](https://github.com/bagder/curl), [httpie \[https://github.com/jkbr/httpie\]](https://github.com/jkbr/httpie))

{% code title="With JQuery" %}
```
      // with jQuery
      $.ajax({
        type: 'post',
        url: '/jsonrpc',
        contentType: 'application/json',
        data: JSON.stringify({
        jsonrpc: '2.0',
        id: 1,
        method: 'login',
        params: {
          'user': 'joe',
          'passwd': 'SWkkasE32'
        }
        }),
        dataType: 'json'
      })
      .done(function(data) {
        if (data.result)
        alert(data.result);
        else
        alert(data.error.type);
        });
```
{% endcode %}

{% code title="With Curl" %}
```
      # with curl
      curl \
      -X POST \
      -H 'Content-Type: application/json' \
      -d '{"jsonrpc": "2.0", "id": 1,
           "method": "login",
           "params": {"user": "joe",
                      "passwd": "SWkkasE32"}}' \
      http://127.0.0.1:8008/jsonrpc

      # with httpie
      http POST http://127.0.0.1:8008/jsonrpc \
      jsonrpc=2.0 id:=1 \
      method=login \
      params:='{"user": "joe", "passwd": "SWkkasE32"}'
```
{% endcode %}

## Example of a Common Flow <a href="#d5e55" id="d5e55"></a>

You can read in the JSON-RPC API section about all the available methods and their signatures, but here is a working example of how a common flow would look like:

1. Log in.
2. Create a new read transaction.
3. Read a value.
4. Create a new WebUI (read-write) transaction, in preparation for changing the value.
5. Change a value.
6. Commit (save) the changes.
7. Meanwhile, subscribe to changes and receive a notification.

In the release package, under `${NCS_DIR}/var/ncs/webui/example`, you will find the working code to run the example below.

```
      /*jshint devel:true*/
// !!!
// The following code is purely for example purposes.
// The code has inline comments for a better understanding.
// Your mileage might vary.
// !!!

define([
  'lodash',
  'bluebird',
  './JsonRpc',
  './Comet'
], function(
  _,
  Promise,
  JsonRpc,
  Comet
) {
  'use strict';

  // CHANGE AT LEAST THESE
  // IN ORDER TO MAKE THIS EXAMPLE WORK IN YOUR SETUP
  var jsonrpcUrl = '/jsonrpc', // 'http://localhost:8008/jsonrpc';
      path = '/dhcp:dhcp/max-lease-time',
      value = Math.floor(Math.random() * 800) + 7200;

  var log,
      jsonRpc,
      comet,
      funs = {},
      ths = {
        read: undefined,
        webui: undefined
      };

  // UTILITY
  log = function(msg) {
    document.body.innerHTML =
      '<pre>' +
      msg +
      '</pre>' +
      document.body.innerHTML;
  };

  // SETUP
  jsonRpc = new JsonRpc({
    url: jsonrpcUrl,
    onError: function(method, params, deferred, reply) {
      var error = reply.error,
          msg = [method,
                 params,
                 reply.id,
                 error.code,
                 error.type,
                 error.message
                ];

      if (method === 'comet') {
        return;
      }

      window.alert('JsonRpc error: ' + msg);
    }
  });

  comet = new Comet({
    jsonRpc: jsonRpc,
    onError: function(reply) {
      var error = reply.error,
          msg = [reply.id, error.code, error.type, error.message];

      window.alert('Comet error: ' + msg);
    }
  });

  // CALLS FOR A COMMON SCENARIO
  funs.login = function() {
    log('Logging in as admin:admin...');
    return jsonRpc.call('login', {
      user: 'admin',
      passwd: 'admin'
    }).done(function() {
      log('Logged in.');
    });
  };

  funs.getSystemSetting = function() {
    log('Getting system settings...');
    return jsonRpc.call('get_system_setting').done(function(result) {
      log(JSON.stringify(result, null, 1));
    });
  };

  funs.newReadTrans = function() {
    log('Create a new read-only transaction...');
    return jsonRpc.call('new_read_trans', {
      db: 'running'
    }).done(function(result) {
      ths.read = result.th;
      log('Read-only transaction with th (transaction handle) id: ' +
          result.th + '.');
    });
  };

  funs.newWebuiTrans = function() {
    log('Create a new webui (read-write) transaction...');
    return jsonRpc.call('new_webui_trans', {
      conf_mode: 'private',
      db: 'candidate'
    }).done(function(result) {
      ths.webui = result.th;
      log('webui (read-write) transaction with th (transaction handle) id: ' +
          result.th + '.');
    });
  };

  funs.getValue = function(args /*{th, path}*/) {
    log('Get value for ' + args.path + ' in ' + args.th + ' transaction...');
    if (typeof args.th === 'string') {
      args.th = ths[args.th];
    }
    return jsonRpc.call('get_value', {
      th: args.th,
      path: path
    }).done(function(result) {
      log(path + ' is now set to: ' + result.value + '.');
    });
  };

  funs.setValue = function(args /*{th, path, value}*/) {
    log('Set value for ' + args.path +
        ' to ' + args.value +
        ' in ' + args.th + ' transaction...');
    if (typeof args.th === 'string') {
      args.th = ths[args.th];
    }
    return jsonRpc.call('set_value', {
      th: args.th,
      path: path,
      value: args.value
    }).done(function(result) {
      log(path + ' is now set to: ' + result.value + '.');
    });
  };

  funs.validate = function(args /*{th}*/) {
    log('Validating changes in ' + args.th + ' transaction...');
    if (typeof args.th === 'string') {
      args.th = ths[args.th];
    }
    return jsonRpc.call('validate_commit', {
      th: args.th
    }).done(function() {
      log('Validated.');
    });
  };

  funs.commit = function(args /*{th}*/) {
    log('Commiting changes in ' + args.th + ' transaction...');
    if (typeof args.th === 'string') {
      args.th = ths[args.th];
    }
    return jsonRpc.call('commit', {
      th: args.th
    }).done(function() {
      log('Commited.');
    });
  };

  funs.subscribeChanges = function(args /*{path, handle}*/) {
    log('Subcribing to changes of ' + args.path +
        ' (with handle ' + args.handle + ')...');
    return jsonRpc.call('subscribe_changes', {
      comet_id: comet.id,
      path: args.path,
      handle: args.handle,
    }).done(function(result) {
      log('Subscribed with handle id ' + result.handle + '.');
    });
  };

  // RUN
  Promise.resolve([
    funs.login,
    funs.getSystemSetting,
    funs.newReadTrans,
    function() {
      return funs.getValue({th: 'read', path: path});
    },
    function() {
      var handle = comet.id + '-max-lease-time';
      comet.on(handle, function(msg) {
        log('>>> Notification >>>\n' +
            JSON.stringify(msg, null, 2) +
            '\n<<< Notification <<<');
      });
      return funs.subscribeChanges({th: 'read', path: path, handle: handle});
    },
    funs.newWebuiTrans,
    function() {
      return funs.setValue({th: 'webui', path: path, value: value.toString()});
    },
    function() {
      return funs.getValue({th: 'webui', path: path});
    },
    function() {
      return funs.validate({th: 'webui'});
    },
    function() {
      return funs.commit({th: 'webui'});
    },
    function() {
      return new Promise(function(resolve) {
        log('Waiting 2.5 seconds before one last call to get_value');
        window.setTimeout(function() {
          resolve();
        }, 2500);
      });
    },
    function() {
      return funs.getValue({th: 'read', path: path});
    },
  ]).each(function(fn){
    return fn().then(function() {
      log('--------------------------------------------------');
    });
  });
});


// Local Variables:
// mode: js
// js-indent-level: 2
// End:
```

## Example of a JSON-RPC Client <a href="#d5e76" id="d5e76"></a>

In the example above describing a common flow, a reference is made to using a JSON-RPC client to make the RPC calls.

An example implementation of a JSON-RPC client, used in the example above:

```
      /*jshint devel:true*/
// !!!
// The following code is purely for example purposes.
// The code has inline comments for a better understanding.
// Your mileage might vary.
// !!!

define([
  'jquery',
  'lodash'
], function(
  $,
  _
) {
  'use strict';

  var JsonRpc;

  JsonRpc = function(params) {
    $.extend(this, {
      // API

      // Call a JsonRpc method with params
      call: undefined,

      // API (OPTIONAL)

      // Decide what to do when there is no active session
      onNoSession: undefined,
      // Decide what to do when the request errors
      onError: undefined,
      // Set an id to start using in requests
      id: 0,
      // Set another url for the JSON-RPC API
      url: '/jsonrpc',


      // INTERNAL

      makeOnCallDone: undefined,
      makeOnCallFail: undefined
    }, params || {});

    _.bindAll(this, [
      'call',
      'onNoSession',
      'onError',
      'makeOnCallDone',
      'makeOnCallFail'
    ]);
  };

  JsonRpc.prototype = {
    call: function(method, params, timeout) {
      var deferred = $.Deferred();

      // Easier to associate request/response logs
      // when the id is unique to each request
      this.id = this.id + 1;

      $.ajax({
        // HTTP method is always POST for the JSON-RPC API
        type: 'POST',
        // Let's show <method> rather than just "jsonrpc"
        // in the browsers' Developer Tools - Network tab - Name column
        url: this.url + '/' + method,
        // Content-Type is mandatory
        // and is always "application/json" for the JSON-RPC API
        contentType: 'application/json',
        // Optionally set a timeout for the request
        timeout: timeout,
        // Request payload
        data: JSON.stringify({
          jsonrpc: '2.0',
          id: this.id,
          method: method,
          params: params
        }),
        dataType: 'json',
        // Just in case you are doing cross domain requests
        // NOTE: make sure you are setting CORS headers similarly to
        // --
        // Access-Control-Allow-Origin: http://server1.com, http://server2.com
        // Access-Control-Allow-Credentials: true
        // Access-Control-Allow-Headers: Origin, Content-Type, Accept
        // Access-Control-Request-Method: POST
        // --
        // if you want to allow JSON-RPC calls from server1.com and server2.com
        crossDomain: true,
        xhrFields: {
          withCredentials: true
        }
      })
      // When done, or on failure,
      // call a function that has access to both
      // the request and the response information
      .done(this.makeOnCallDone(method, params, deferred))
      .fail(this.makeOnCallFail(method, params, deferred));
      return deferred.promise();
    },

    makeOnCallDone: function(method, params, deferred) {
      var me = this;

      return function(reply/*, status, xhr*/) {
        if (reply.error) {
          return me.onError(method, params, deferred, reply);
        }
        deferred.resolve(reply.result);
      };
    },

    onNoSession: function() {
      // It is common practice that when missing a session identifier
      // or when the session crashes or it times out due to inactivity
      // the user is taken back to the login page
      _.defer(function() {
        window.location.href = 'login.html';
      });
    },

    onError: function(method, params, deferred, reply) {
      if (reply.error.type === 'session.missing_sessionid' ||
          reply.error.type === 'session.invalid_sessionid') {
        this.onNoSession();
      }

      deferred.reject(reply.error);
    },

    makeOnCallFail: function(method, params, deferred) {
      return function(xhr, status, errorMessage) {
        var error;

        error = $.extend(new Error(errorMessage), {
          type: 'ajax.response.error',
          detail: JSON.stringify({method: method, params: params})
        });

        deferred.reject(error);
      };
    }
  };

  return JsonRpc;
});

// Local Variables:
// mode: js
// js-indent-level: 2
// End:
```

## Example of a Comet Client <a href="#d5e81" id="d5e81"></a>

In the example above describing a common flow, a reference is made to starting a Comet channel and subscribing to changes on a specific path.

An example implementation of a Comet client, used in the example above:

```
      /*jshint devel:true*/
// !!!
// The following code is purely for example purposes.
// The code has inline comments for a better understanding.
// Your mileage might vary.
// !!!

define([
  'jquery',
  'lodash',
  './JsonRpc'
], function(
  $,
  _,
  JsonRpc
) {
  'use strict';

  var Comet;

  Comet = function(params) {
    $.extend(this, {
      // API

      // Add a callback for a notification handle
      on: undefined,
      // Remove a specific callback or all callbacks for a notification handle
      off: undefined,
      // Stop all comet notifications
      stop: undefined,

      // API (OPTIONAL)

      // Decide what to do when the comet errors
      onError: undefined,
      // Optionally set a different id for this comet channel
      id: 'main-1.' + String(Math.random()).substring(2),
      // Optionally give an existing JsonRpc client
      jsonRpc: new JsonRpc(),
      // Optionally wait 1 second in between polling the comet channel
      sleep: 1 * 1000,

      // INTERNAL

      handlers: [],
      polling: false,
      poll: undefined,
      onPollDone: undefined,
      onPollFail: undefined
    }, params || {});

    _.bindAll(this, [
      'on',
      'off',
      'stop',
      'onError',
      'poll',
      'onPollDone',
      'onPollFail'
    ]);
  };

  Comet.prototype = {
    on: function(handle, callback) {
      if (!callback) {
        throw new Error('Missing a callback for handle ' + handle);
      }

      // Add a handler made of handle id and a callback function
      this.handlers.push({handle: handle, callback: callback});

      // Start polling
      _.defer(this.poll);
    },

    off: function(handle, callback) {
      if (!handle) {
        throw new Error('Missing a handle');
      }

      // Remove all handlers matching the handle,
      // and optionally also the callback function
      _.remove(this.handlers, {handle: handle, callback: callback});

      // If there are no more handlers matching the handle,
      // then unsubscribe from notifications, in order to releave
      // the server and the network from redundancy
      if (!_.find(this.handlers, {handle: handle}).length) {
        this.jsonRpc.call('unsubscribe', {handle: handle});
      }
    },

    stop: function() {
      var me = this,
          deferred = $.Deferred(),
          deferreds = [];

      if (this.polling) {
        // Unsubcribe from all known notifications, in order to releave
        // the server and the network from redundancy
        _.each(this.handlers, function(handler) {
          deferreds.push(me.jsonRpc('unsubscribe', {
            handle: handler.handle
          }));
        });

        $.when.apply($, deferreds).done(function() {
          deferred.resolve();
        }).fail(function(err) {
          deferred.reject(err);
        }).always(function() {
          me.polling = false;
          me.handlers = [];
        });
      } else {
        deferred.resolve();
      }

      return deferred.promise();
    },

    poll: function() {
      var me = this;

      if (this.polling) {
        return;
      }

      this.polling = true;

      this.jsonRpc.call('comet', {
        comet_id: this.id
      }).done(function(notifications) {
        me.onPollDone(notifications);
      }).fail(function(err) {
        me.onPollFail(err);
      }).always(function() {
        me.polling = false;
      });
    },

    onPollDone: function(notifications) {
      var me = this;

      // Polling has stopped meanwhile
      if (!this.polling) {
        return;
      }

      _.each(notifications, function(notification) {
        var handle = notification.handle,
            message = notification.message,
            handlers = _.where(me.handlers, {handle: handle});

        // If we received a notification that we cannot handle,
        // then unsubcribe from it, in order to releave
        // the server and the network from redundancy
        if (!handlers.length) {
          return this.jsonRpc.call('unsubscribe', {handle: handle});
        }

        _.each(handlers, function(handler) {
          _.defer(function() {handler.callback(message);});
        });
      });

      _.defer(this.poll);
    },

    onPollFail: function(error) {
      switch (error.type) {
        case 'comet.duplicated_channel':
        this.onError(error);
        break;

        default:
        this.onError(error);
        _.wait(this.poll, this.sleep);
      }
    },

    onError: function(reply) {
      var error = reply.error,
          msg = [reply.id, error.code, error.type, error.message].join(' ');

      console.error('Comet error: ' + msg);
    }
  };

  return Comet;
});

// Local Variables:
// mode: js
// js-indent-level: 2
// End:
```

## Single Sign-on (SSO)

The Single Sign-On functionality enables users to log in via HTTP-based northbound APIs with a single sign-on authentication scheme, such as SAMLv2. Currently, it is only supported for the JSON-RPC northbound interface.

{% hint style="info" %}
For Single Sign-On to work, the Package Authentication needs to be enabled, see [Package Authentication](../../../administration/management/aaa-infrastructure.md#ug.aaa.packageauth)).
{% endhint %}

When enabled, the endpoint `/sso` is made public and handles Single Sign-on attempts.

An example configuration for the cisco-nso-saml2-auth Authentication Package is presented below. Note that `/ncs-config/aaa/auth-order` does not need to be set for Single Sign-On to work!

{% code title="Example: Example ncs.conf to enable SAMLv2 Single Sign-On" %}
```
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

A client attempting single sign-on authentication should request the `/sso` endpoint and then follow the continued authentication operation from there. For example, for `cisco-nso-saml2-auth`,  the client is redirected to an Identity Provider (IdP), which subsequently handles the authentication, and then redirects the client back to the `/sso` endpoint to validate the authentication and set up the session.

## Web Server

An embedded basic web server can be used to deliver static and Common Gateway Interface (CGI) dynamic content to a web client, such as a web browser. See [Web Server](../../connected-topics/web-server.md) for more information.
