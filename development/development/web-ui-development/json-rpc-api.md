---
description: API documentation for JSON-RPC API.
---

# JSON-RPC API

## Protocol Overview

The [JSON-RPC 2.0 Specification](https://www.jsonrpc.org/specification) contains all the details you need to understand the protocol but a short version is given here:&#x20;

{% tabs %}
{% tab title="Request Payload" %}
A request payload typically looks like this:

```json
{"jsonrpc": "2.0",
 "id": 1,
 "method": "subtract",
 "params": [42, 23]}
```

Where, the `method` and `params` properties are as defined in this manual page.
{% endtab %}

{% tab title="Response Payload" %}
A response payload typically looks like this:

```json
{"jsonrpc": "2.0",
 "id": 1,
 "result": 19}
```

Or:

```json
{"jsonrpc": "2.0",
 "id": 1,
 "error":
 {"code": -32601,
   "type": "rpc.request.method.not_found",
   "message": "Method not found"}}
```

The request `id` param is returned as-is in the response to make it easy to pair requests and responses.
{% endtab %}
{% endtabs %}

The batch JSON-RPC standard is dependent on matching requests and responses by `id`, since the server processes requests in any order it sees fit e.g.:

```json
[{"jsonrpc": "2.0",
  "id": 1,
  "method": "subtract",
  "params": [42, 23]}
,{"jsonrpc": "2.0",
  "id": 2,
  "method": "add",
  "params": [42, 23]}]
```

With a possible response like (first result for `add`, the second result for `subtract`):

```json
[{"jsonrpc": "2.0",
  "id": 2,
  "result": 65}
,{"jsonrpc": "2.0",
  "id": 1,
  "result": 19}]
```

### Common Concepts <a href="#ug.jsonrpc.commonconcepts" id="ug.jsonrpc.commonconcepts"></a>

The URL for the JSON-RPC API is `` `/jsonrpc` ``. For logging and debugging purposes, you can add anything as a subpath to the URL, for example turning the URL into `` `/jsonrpc/<method>` `` which will allow you to see the exact method in different browsers' **Developer Tools** - **Network** tab - **Name** column, rather than just an opaque `jsonrpc`.

{% hint style="info" %}
For brevity, in the upcoming descriptions of each method, only the input `params` and the output `result` are mentioned, although they are part of a fully formed JSON-RPC payload.
{% endhint %}

* Authorization is based on HTTP cookies. The response to a successful call to `login` would create a session, and set an HTTP-only cookie, and even an HTTP-only secure cookie over HTTPS, named `sessionid`. All subsequent calls are authorized by the presence and the validity of this cookie.
* The `th` param is a transaction handle identifier as returned from a call to `new_read_trans` or `new_write_trans`.
* The `comet_id` param is a unique ID (decided by the client) that must be given first in a call to the `comet` method, and then to upcoming calls which trigger comet notifications.
* The `handle` param needs to have a semantic value (not just a counter) prefixed with the `comet` ID (for disambiguation), and overrides the handle that would have otherwise been returned by the call. This gives more freedom to the client and sets semantic handles.

### **Common Errors**

The JSON-RPC specification defines the following error `code` values:

* `-32700` - Invalid JSON was received by the server. An error occurred on the server while parsing the JSON text.
* `-32600` - The JSON sent is not a valid Request object.
* `-32601` - The method does not exist/is not available.
* `-32602` - Invalid method parameter(s).
* `-32603` - Internal JSON-RPC error.
* `-32000` to `-32099` - Reserved for application-defined errors (see below).

To make server errors easier to read, along with the numeric `code`, we use a `type` param that yields a literal error token. For all application-defined errors, the `code` is always `-32000`. It's best to ignore the `code` and just use the `type` param.

```json
{"jsonrpc": "2.0",
 "id": 1,
 "method": "login",
 "params":
 {"foo": "joe",
  "bar": "SWkkasE32"}}
```

Which results in:

```json
{"jsonrpc": "2.0",
 "id": 1,
 "error":
 {"code": -32602,
  "type": "rpc.method.unexpected_params",
  "message": "Unexpected params",
  "data":
  {"param": "foo"}}}
```

The `message` param is a free text string in English meant for human consumption, which is a one-to-one match with the `type` param. To remove noise from the examples, this param is omitted from the following descriptions.

An additional method-specific `data` param may be added to give further details on the error, most predominantly a `reason` param which is also a free text string in English meant for human consumption. To remove noise from the examples, this param is omitted from the following descriptions. However any additional `data` params will be noted by each method description.

### **Application-defined Errors**

All methods may return one of the following JSON RPC or application-defined errors, in addition to others, specific to each method.

```json
{"type": "rpc.request.parse_error"}
{"type": "rpc.request.invalid"}
{"type": "rpc.method.not_found"}
{"type": "rpc.method.invalid_params", "data": {"param": <string>}}
{"type": "rpc.internal_error"}


{"type": "rpc.request.eof_parse_error"}
{"type": "rpc.request.multipart_broken"}
{"type": "rpc.request.too_big"}
{"type": "rpc.request.method_denied"}


{"type": "rpc.method.unexpected_params", "data": {"param": <string>}}
{"type": "rpc.method.invalid_params_type", "data": {"param": <string>}}
{"type": "rpc.method.missing_params", "data": {"param": <string>}}
{"type": "rpc.method.unknown_params_value", "data": {"param": <string>}}


{"type": "rpc.method.failed"}
{"type": "rpc.method.denied"}
{"type": "rpc.method.timeout"}

{"type": "session.missing_sessionid"}
{"type": "session.invalid_sessionid"}
{"type": "session.overload"}
```

### FAQ <a href="#ug.jsonrpc.faq" id="ug.jsonrpc.faq"></a>

<details>

<summary><strong>What are the security characteristics of the JSON-RPC API?</strong></summary>

JSON-RPC runs on top of the embedded web server (see [Web Server](../../connected-topics/web-server.md)), which accepts HTTP and/or HTTPS.

The JSON-RPC session ties the client and the server via an HTTP cookie, named `sessionid` which contains a randomly server-generated number. This cookie is not only secure (when the requests come over HTTPS), meaning that HTTPS cookies do not leak over HTTP, but even more importantly this cookie is also HTTP-only, meaning that only the server and the browser (e.g. not the JavaScript code) have access to the cookie. Furthermore, this cookie is a session cookie, meaning that a browser restart would delete the cookie altogether.

The JSON-RPC session lives as long as the user does not request to log out, as long as the user is active within a 30-minute (default value, which is configurable) time frame, and as long as there are no severe server crashes. When the session dies, the server will reply with the intention to delete any `sessionid` cookies stored in the browser (to prevent any leaks).

When used in a browser, the JSON-RPC API does not accept cross-domain requests by default but can be configured to do so via the custom headers functionality in the embedded web server, or by adding a reverse proxy (see [Web Server](../../connected-topics/web-server.md)).

</details>

<details>

<summary><strong>What is the proper way to use the JSON-RPC API in a CORS setup?</strong></summary>

The embedded server allows for custom headers to be set, in this case, CORS headers, like:

```
Access-Control-Allow-Origin: http://webpage.com
Access-Control-Allow-Credentials: true
Access-Control-Allow-Headers: Origin, Content-Type, Accept
Access-Control-Request-Method: POST
```

A server hosted at `http://server.com` responding with these headers would mean that the JSON-RPC API can be contacted from a browser that is showing a web page from `http://webpage.com`, and will allow the browser to make POST requests, with a limited amount of headers and with credentials (i.e. cookies).

This is not enough though, because the browser also needs to be told that your JavaScript code really wants to make a CORS request. A jQuery example would show like this:

```json
// with jQuery
$.ajax({
  type: 'post',
  url: 'http://server.com/jsonrpc',
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
  dataType: 'json',
  crossDomain: true,       // CORS specific
  xhrFields: {             // CORS specific
    withCredentials: true  // CORS specific
  }                        // CORS specific
})
```

Without this setup, you will notice that the browser will not send the `sessionid` cookie on post-login JSON-RPC calls.

</details>

<details>

<summary><strong>What is a tag/keypath?</strong></summary>

A `tagpath` is a path pointing to a specific position in a YANG module's schema.

A `keypath` is a path pointing to a specific position in a YANG module's instance.

These kinds of paths are used for several of the API methods (e.g. `set_value`, `get_value`, `subscribe_changes`), and could be seen as XPath path specifications in abbreviated format.

Let's look at some examples using the following YANG module as input:

```json
module devices {
    namespace "http://acme.com/ns/devices";
    prefix d;

    container config {
        leaf description { type string; }
        list device {
            key "interface";
            leaf interface { type string; }
            leaf date { type string; }
        }
    }
}
```

Valid tagpaths:

* `` `/d:config/description` ``
* `` `/d:config/device/interface` ``

Valid keypaths:

* `` `/d:config/device{eth0}/date` `` - the date leaf value within a device with an `interface` key set to `eth0`_._

Note how the prefix is prepended to the first tag in the path. This prefix is compulsory.

</details>

<details>

<summary>How to r<strong>estrict access to methods?</strong></summary>

The AAA infrastructure can be used to restrict access to library functions using command rules:

```xml
<cmdrule xmlns="http://tail-f.com/yang/acm">
  <name>webui</name>
  <context xmlns="http://tail-f.com/yang/acm">webui</context>
  <command>::jsonrpc:: get_schema</command>
  <access-operations>read exec</access-operations>
  <action>deny</action>
</cmdrule>
```

Note how the command is prefixed with `::jsonrpc::`. This tells the AAA engine to apply the command rule to JSON-RPC API functions.

You can read more about the command rules in [AAA infrastructure](../../../administration/management/aaa-infrastructure.md).

</details>

<details>

<summary><strong>What is <code>session.overload</code> error?</strong></summary>

A series of limits are imposed on the load that one session can put on the system. This reduces the risk that a session takes over the whole system and brings it into a DoS situation.

The response will include details about the limit that triggered the error.

Known limits:

* Only 10000 commands/subscriptions are allowed per session

</details>

## Methods - Commands

<details>

<summary><mark style="color:green;"><code>get_cmds</code></mark></summary>

Get a list of the session's batch commands.

**Params**

```json
{}
```

**Result**

```json
{"cmds": <array of cmd>}

cmd =
 {"params": <object>,
  "comet_id": <string>,
  "handle": <string>,
  "tag": <"string">,
  "started": <boolean>,
  "stopped": <boolean; should be always false>}
```

</details>

<details>

<summary><mark style="color:green;"><code>init_cmd</code></mark></summary>

Starts a batch command.

**Note**: The `start_cmd` method must be called to actually get the batch command to generate any messages unless the `handle` is provided as input.

**Note**: As soon as the batch command prints anything on stdout, it will be sent as a message and turn up as a result to your polling call to the `comet` method.

**Params**

```json
{"th": <integer>,
 "name": <string>,
 "args": <string>,
 "emulate": <boolean, default: false>,
 "width": <integer, default: 80>,
 "height": <integer, default: 24>,
 "scroll": <integer, default: 0>,
 "comet_id": <string>,
 "handle": <string, optional>}
```

* The `name` param is one of the named commands defined in `ncs.conf`.
* The `args` param specifies any extra arguments to be provided to the command except for the ones specified in `ncs.conf`.
* The `emulate` param specifies if terminal emulation should be enabled.
* The `width`, `height`, `scroll` properties define the screen properties.

**Result**

```
{"handle": <string>}
```

A handle to the batch command is returned (equal to `handle` if provided).

</details>



