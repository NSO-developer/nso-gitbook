---
description: API documentation for JSON-RPC API.
---

# JSON-RPC API

## Protocol Overview

The [JSON-RPC 2.0 Specification](https://www.jsonrpc.org/specification) contains all the details you need to understand the protocol but a short version is given here:

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

### Trace Context

JSON-RPC supports the Trace Context functionality corresponding to the IETF Draft [I-D.draft-ietf-netconf-restconf-trace-ctx-headers-00](https://www.ietf.org/archive/id/draft-ietf-netconf-restconf-trace-ctx-headers-00.html), that is an adaption of the [W3C Trace Context](https://www.w3.org/TR/2021/REC-trace-context-1-20211123/) standard. Trace Context makes it possible to follow a client's functionality via progress trace (logging) by trace-id, span-id and tracestate. Trace Context standardizes the format of trace-id, span-id and key-value pairs to be sent between distributed entities. The terms span-id and parent-span-id in NSO correspond to the naming of parent-id used in the Trace Context standard.

Trace Context consists of two HTTP headers `traceparent` and `tracestate`. Header `traceparent` must be of the format

```
traceparent = <version>-<trace-id>-<parent-id>-<flags>
```

where `version = "00"` and `flags = "01"`. The support for the values of `version` and `flags` may change in the future depending on the extension of standard or functionality.

An example of header `traceparent` in use is:

```
traceparent: 00-100456789abcde10123456789abcde10-001006789abcdef0-01
```

Header `tracestate` is a vendor-specific list of key-value pairs. An example of header `tracestate` in use is:

```
tracestate: key1=value1,key2=value2
```

where a value may contain space characters but not end with a space.

NSO implements Trace Context alongside the legacy way of handling trace-id, where the trace-id comes as a flag parameter to `validate_commit`. For flags usage see method `commit`. These two different ways of handling trace-id cannot be used at the same time. If both are used, the request generates an error response.

NSO will consider the headers of Trace Context in JSON-RPC requests if the element `<trace-id>true</trace-id>` is set in the logs section of the configuration file. Trace Context is handled by the progress trace functionality, see also [Progress Trace](../progress-trace.md).

The information in Trace Context will be presented by the progress trace output when invoking JSON-RPC methods `validate_commit`, `apply`, or `run_action`. Those methods will also generate a Trace Context if it has not already been given in a request.

The functionality a client aims to perform can consist of several JSON-RPC methods up to a transaction commit being executed. Those methods are carried out at the transaction commit and should share a common trace-id. Such a scenario calls for the need to store Trace Context in the transaction involved. For this reason JSON-RPC will only consider a Trace Context header for methods that take a transaction as parameter, with the exception of the method `commit`, which will ignore the Trace Context header.

{% hint style="info" %}
You can either let methods `validate_commit`, `apply`, or `run_action` automatically generate a Trace Context, or you can add a Trace Context header for one of the involved JSON-RPC methods sharing the same transaction.

If two methods, using the same transaction, are provided with different Trace Context, the latter Trace Context will be used - a procedure not recommended.
{% endhint %}

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

### FAQs <a href="#ug.jsonrpc.faq" id="ug.jsonrpc.faq"></a>

<details>

<summary>What are the security characteristics of the JSON-RPC API?</summary>

JSON-RPC runs on top of the embedded web server (see [Web Server](../../connected-topics/web-server.md)), which accepts HTTP and/or HTTPS.

The JSON-RPC session ties the client and the server via an HTTP cookie, named `sessionid` which contains a randomly server-generated number. This cookie is not only secure (when the requests come over HTTPS), meaning that HTTPS cookies do not leak over HTTP, but even more importantly this cookie is also HTTP-only, meaning that only the server and the browser (e.g. not the JavaScript code) have access to the cookie. Furthermore, this cookie is a session cookie, meaning that a browser restart would delete the cookie altogether.

The JSON-RPC session lives as long as the user does not request to log out, as long as the user is active within a 30-minute (default value, which is configurable) time frame, and as long as there are no severe server crashes. When the session dies, the server will reply with the intention to delete any `sessionid` cookies stored in the browser (to prevent any leaks).

When used in a browser, the JSON-RPC API does not accept cross-domain requests by default but can be configured to do so via the custom headers functionality in the embedded web server, or by adding a reverse proxy (see [Web Server](../../connected-topics/web-server.md)).

</details>

<details>

<summary>What is the proper way to use the JSON-RPC API in a CORS setup?</summary>

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

<summary>What is a tag/keypath?</summary>

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

<summary>How to restrict access to methods?</summary>

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

You can read more about the command rules in [AAA Infrastructure](../../../administration/management/aaa-infrastructure.md).

</details>

<details>

<summary>What is <code>session.overload</code> error?</summary>

A series of limits are imposed on the load that one session can put on the system. This reduces the risk that a session takes over the whole system and brings it into a DoS situation.

The response will include details about the limit that triggered the error.

Known limits:

* Only 10000 commands/subscriptions are allowed per session

</details>

## Methods

### Commands

<details>

<summary><mark style="color:green;"><code>get_cmds</code></mark></summary>

`get_cmds` - Get a list of the session's batch commands.

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

`init_cmd` - Starts a batch command.

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

```json
{"handle": <string>}
```

A handle to the batch command is returned (equal to `handle` if provided).

</details>

<details>

<summary><mark style="color:green;"><code>send_cmd_data</code></mark></summary>

`send_cmd_data` - Sends data to batch command started with `init_cmd`_._

**Params**

```json
{"handle": <string>,
 "data": <string>}
```

The `handle` param is as returned from a call to `init_cmd` and the `data` param is what is to be sent to the batch command started with `init_cmd`.

**Result**

```json
{}
```

**Errors (specific)**

```json
{"type": "cmd.not_initialized"}
```

</details>

<details>

<summary><mark style="color:green;"><code>start_cmd</code></mark></summary>

`start_cmd` - Signals that a batch command can start to generate output.

**Note**: This method must be called to actually start the activity initiated by calls to one of the methods `init_cmd`.

**Params**

```json
{"handle": <string>}
```

The `handle` param is as returned from a call to `init_cmd`.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>suspend_cmd</code></mark></summary>

`suspend_cmd` - Suspends output from a batch command.

**Note**: the `init_cmd` method must have been called with the `emulate` param set to true for this to work

**Params**

```json
{"handle": <string>}
```

The `handle` param is as returned from a call to `init_cmd`.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>resume_cmd</code></mark></summary>

`resume_cmd` - Resumes a batch command started with `init_cmd`_._

**Note**: the `init_cmd` method must have been called with the `emulate` param set to `true` for this to work.

**Params**

```json
{"handle": <string>}
```

The `handle` param is as returned from a call to `init_cmd`.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>stop_cmd</code></mark></summary>

`stop_cmd` - Stops a batch command.

**Note**: This method must be called to stop the activity started by calls to one of the methods `init_cmd`.

**Params**

```json
{"handle": <string>}
```

The `handle` param is as returned from a call to `init_cmd`.

**Result**

```json
{}
```

</details>

### Commands - Subscribe <a href="#methods-commands-subscribe" id="methods-commands-subscribe"></a>

<details>

<summary><mark style="color:green;"><code>get_subscriptions</code></mark></summary>

`get_subscriptions` - Get a list of the session's subscriptions.

**Params**

```json
{}
```

**Result**

```json
{"subscriptions": <array of subscription>}

subscription =
 {"params": <object>,
  "comet_id": <string>,
  "handle": <string>,
  "tag": <"string">,
  "started": <boolean>,
  "stopped": <boolean; should be always false>}
```

</details>

<details>

<summary><mark style="color:green;"><code>subscribe_cdboper</code></mark></summary>

`subscribe_cdboper` - Starts a subscriber to operational data in CDB. Changes done to configuration data will not be seen here.

**Note**: The `start_subscription` method must be called to actually get the subscription to generate any messages unless the `handle` is provided as input.

**Note**: The `unsubscribe` method should be used to end the subscription.

**Note**: As soon as a subscription message is generated it will be sent as a message and turn up as result to your polling call to the `comet` method.

**Params**

```json
{"comet_id": <string>,
 "handle": <string, optional>,
 "path": <string>}
```

The `path` param is a keypath restricting the subscription messages to only be about changes done under that specific keypath.

**Result**

```json
{"handle": <string>}
```

A handle to the subscription is returned (equal to `handle` if provided).

Subscription messages will end up in the `comet` method and the format of that message will be an array of changes of the same type as returned by the `subscribe_changes` method. See below.

**Errors (specific)**

```json
{"type": "db.cdb_operational_not_enabled"}
```

</details>

<details>

<summary><mark style="color:green;"><code>subscribe_changes</code></mark></summary>

`subscribe_changes` - Starts a subscriber to configuration data in CDB. Changes done to operational data in CDB data will not be seen here. Furthermore, subscription messages will only be generated when a transaction is successfully committed.

**Note**: The `start_subscription` method must be called to actually get the subscription to generate any messages, unless the `handle` is provided as input.

**Note**: The `unsubscribe` method should be used to end the subscription.

**Note**: As soon as a subscription message is generated, it will be sent as a message and turn up as result to your polling call to the `comet` method.

**Params**

```json
{"comet_id": <string>,
 "handle": <string, optional>,
 "path": <string>,
 "skip_local_changes": <boolean, default: false>,
 "hide_changes": <boolean, default: false>,
 "hide_values": <boolean, default: false>}
```

The `path` param is a keypath restricting the subscription messages to only be about changes done under that specific keypath.

The `skip_local_changes` param specifies if configuration changes done by the owner of the read-write transaction should generate subscription messages.

The `hide_changes` and `hide_values` params specify a lower level of information in subscription messages, in case it is enough to receive just a "ping" or a list of changed keypaths, respectively, but not the new values resulted in the changes.

**Result**

```json
{"handle": <string>}
```

A handle to the subscription is returned (equal to `handle` if provided).

Subscription messages will end up in the `comet` method and the format of that message will be an object such as:

```json
{"db": <"running" | "startup" | "candidate">,
 "user": <string>,
 "ip": <string>,
 "changes": <array>}
```

The `user` and `ip` properties are the username and IP address of the committing user.

The `changes` param is an array of changes of the same type as returned by the `changes` method. See above.

</details>

<details>

<summary><mark style="color:green;"><code>subscribe_poll_leaf</code></mark></summary>

`subscribe_poll_leaf` - Starts a polling subscriber to any type of operational and configuration data (outside of CDB as well).

**Note**: The `start_subscription` method must be called to actually get the subscription to generate any messages unless the `handle` is provided as input.

**Note**: The `unsubscribe` method should be used to end the subscription.

**Note**: As soon as a subscription message is generated, it will be sent as a message and turn up as result to your polling call to the `comet` method.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "interval": <integer between 0 and 3600>,
 "comet_id": <string>,
 "handle": <string, optional>}
```

The `path` param is a keypath pointing to a leaf value.

The `interval` is a timeout in seconds between when to poll the value.

**Result**

```json
{"handle": <string>}
```

A handle to the subscription is returned (equal to `handle` if provided).

Subscription messages will end up in the `comet` method and the format is a simple string value.

</details>

<details>

<summary><mark style="color:green;"><code>subscribe_upgrade</code></mark></summary>

`subscribe_upgrade` - Starts a subscriber to upgrade messages.

**Note**: The `start_subscription` method must be called to actually get the subscription to generate any messages unless the `handle` is provided as input.

**Note**: The `unsubscribe` method should be used to end the subscription.

**Note**: As soon as a subscription message is generated, it will be sent as a message and turn up as result to your polling call to the `comet` method.

**Params**

```json
{"comet_id": <string>,
 "handle": <string, optional>}
```

**Result**

```json
{"handle": <string>}
```

A handle to the subscription is returned (equal to `handle` if provided).

Subscription messages will end up in the `comet` method and the format of that message will be an object such as:

```json
{"upgrade_state": <"wait_for_init" | "init" | "abort" | "commit">,
 "timeout": <number, only if "upgrade_state" === "wait_for_init">}
```

</details>

<details>

<summary><mark style="color:green;"><code>subscribe_jsonrpc_batch</code></mark></summary>

`subscribe_jsonrpc_batch` - Starts a subscriber to JSONRPC messages for batch requests.

**Note**: The `start_subscription` method must be called to actually get the subscription to generate any messages unless the `handle` is provided as input.

**Note**: The `unsubscribe` method should be used to end the subscription.

**Note**: As soon as a subscription message is generated it will be sent as a message and turn up as result to your polling call to the `comet` method.

**Params**

```json
{"comet_id": <string>,
 "handle": <string, optional>}
```

**Result**

```json
{"handle": <string>}
```

A handle to the subscription is returned (equal to `handle` if provided).

Subscription messages will end up in the `comet` method having exact same structure like a JSON-RPC response:

```json
{"jsonrpc":"2.0",
 "result":"admin",
 "id":1}

{"jsonrpc": "2.0",
 "id": 1,
 "error":
 {"code": -32602,
  "type": "rpc.method.unexpected_params",
  "message": "Unexpected params",
  "data":
  {"param": "foo"}}}
```

</details>

<details>

<summary><mark style="color:green;"><code>subscribe_progress_trace</code></mark></summary>

`subscribe_progress_trace` - Starts a subscriber to progress trace events.

**Note**: The `start_subscription` method must be called to actually get the subscription to generate any messages unless the `handle` is provided as input.

**Note**: The `unsubscribe` method should be used to end the subscription.

**Note**: As soon as a subscription message is generated, it will be sent as a message and turn up as result to your polling call to the `comet` method.

**Params**

```json
{"comet_id": <string>,
 "handle": <string, optional>,
 "verbosity": <"normal" | "verbose" | "very_verbose" | "debug", default: "normal">
 "filter_context": <"webui" | "cli" | "netconf" | "rest" | "snmp" | "system" | string, optional>}
```

The `verbosity` param specifies the verbosity of the progress trace.

The `filter_context` param can be used to only get progress events from a specific context For example, if `filter_context` is set to `cli` only progress trace events from the CLI are returned.

**Result**

```json
{"handle": <string>}
```

A handle to the subscription is returned (equal to `handle` if provided).

Subscription messages will end up in the `comet` method and the format of that message will be an object such as:

```json
{"timestamp": <string>,
 "duration": <string, optional if end of span>,
 "span-id": <string>,
 "parent-span-id": <string, optional if parent span exists>,
 "trace-id": <string>,
 "session-id": <integer>,
 "transaction-id": <integer, optional if transaction exists>,
 "datastore": <string, optional if transaction exists>,
 "context": <string>,
 "subsystem": <string, optional if in subsystem>,
 "message": <string>,
 "annotation": <string, optional if end of span>,
 "attributes":  <object with key-value attributes, optional>,
 "links":  <array with objects, each containing a trace-id and span-id
 key, optional>}
```

</details>

<details>

<summary><mark style="color:green;"><code>start_subscription</code></mark></summary>

`start_subscription` - Signals that a subscribe command can start to generate output.

**Note**: This method must be called to actually start the activity initiated by calls to one of the methods `subscribe_cdboper`, `subscribe_changes`, `subscribe_messages`, `subscribe_poll_leaf` or `subscribe_upgrade` \*\*with no `handle`.

**Params**

```json
{"handle": <string>}
```

The `handle` param is as returned from a call to `subscribe_cdboper`, `subscribe_changes`, `subscribe_messages`, `subscribe_poll_leaf` or `subscribe_upgrade`.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>unsubscribe</code></mark></summary>

`unsubscribe` - Stops a subscriber.

**Note**: This method must be called to stop the activity started by calls to one of the methods `subscribe_cdboper`, `subscribe_changes`, `subscribe_messages`, `subscribe_poll_leaf` or `subscribe_upgrade`.

**Params**

```json
{"handle": <string>}
```

The `handle` param is as returned from a call to `subscribe_cdboper`, `subscribe_changes`, `subscribe_messages`, `subscribe_poll_leaf` or `subscribe_upgrade`.

**Result**

```json
{}
```

</details>

### data

<details>

<summary><mark style="color:green;"><code>create</code></mark></summary>

`create` - Create a list entry, a presence container, or a leaf of type empty (unless in a union, then use `set_value`).

**Params**

```json
{"th": <integer>,
 "path": <string>}
```

The `path` param is a keypath pointing to data to be created.

**Result**

```json
{}
```

**Errors (specific)**

```json
{"type": "db.locked"}
```

</details>

<details>

<summary><mark style="color:green;"><code>delete</code></mark></summary>

`delete` - Deletes an existing list entry, a presence container, or an optional leaf and all its children (if any).

**Note**: If the permission to delete is denied on a child, the 'warnings' array in the result will contain a warning 'Some elements could not be removed due to NACM rules prohibiting access.'. The `delete` method will still delete as much as is allowed by the rules. See [AAA Infrastructure](../../../administration/management/aaa-infrastructure.md) for more information about permissions and authorization.

**Params**

```json
{"th": <integer>,
 "path": <string>}
```

The `path` param is a keypath pointing to data to be deleted.

**Result**

```json
{} |
                {"warnings": <array of strings>}
```

**Errors (specific)**

```json
{"type": "db.locked"}
```

</details>

<details>

<summary><mark style="color:green;"><code>exists</code></mark></summary>

`exists` - Checks if optional data exists.

**Params**

```json
{"th": <integer>,
 "path": <string>}
```

The `path` param is a keypath pointing to data to be checked for existence.

**Result**

```json
{"exists": <boolean>}
```

</details>

<details>

<summary><mark style="color:green;"><code>get_case</code></mark></summary>

`get_case` - Get the case of a choice leaf.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "choice": <string>}
```

The `path` param is a keypath pointing to data that contains the choice leaf given by the `choice` param.

**Result**

```json
{"case": <string>}
```

</details>

<details>

<summary><mark style="color:green;"><code>show_config</code></mark></summary>

`show_config` - Retrieves configuration and operational data from the provided transaction.

**Params**

```json
{"th": <integer>,
 "path": <string>
 "result_as": <"string" | "json" | "json2", default: "string">
 "with_oper": <boolean, default: false>
 "max_size": <"integer", default: 0>}
```

The `path` param is a keypath to the configuration to be returned. `result_as` controls the output format, string for a compact string format, `json` for JSON-compatible with RESTCONF and `json2` for a variant of the RESTCONF JSON format. `max_size` sets the maximum size of the data field in kb, set to 0 to disable the limit.

**Result**

`result_as` string:

```json
{"config": <string>}
```

`result_as` JSON:

```json
{"data": <json>}
```

</details>

<details>

<summary><mark style="color:green;"><code>load</code></mark></summary>

`load` - Load XML configuration into the current transaction.

**Params**

```json
{"th": <integer>,
 "data": <string>
 "path": <string, default: "/">
 "format": <"json" | "xml", default: "xml">
 "mode": <"create" | "merge" | "replace", default: "merge">}
```

The `data` param is the data to be loaded into the transaction. `mode` controls how the data is loaded into the transaction, analogous with the CLI command load. `format` informs load about which format `data` is in. If `format` is `xml`, the data must be an XML document encoded as a string. If `format` is `json`, data can either be a JSON document encoded as a string or the JSON data itself.

**Result**

```json
{}
```

**Errors (specific)**

```json
{"row": <integer>, "message": <string>}
```

</details>

### data - attrs <a href="#methods-data-attrs" id="methods-data-attrs"></a>

<details>

<summary><mark style="color:green;"><code>get_attrs</code></mark></summary>

`get_attrs` - Get node attributes.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "names": <array of string>}
```

The `path` param is a keypath pointing to the node and the `names` param is a list of attribute names that you want to retrieve.

**Result**

```json
{"attrs": <object of attribute name/value>}
```

</details>

<details>

<summary><mark style="color:green;"><code>set_attrs</code></mark></summary>

`set_attrs` - Set node attributes.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "attrs": <object of attribute name/value>}
```

The `path` param is a keypath pointing to the node and the `attrs` param is an object that maps attribute names to their values.

**Result**

```json
{}
```

</details>

### data - leafs <a href="#methods-data-leafs" id="methods-data-leafs"></a>

<details>

<summary><mark style="color:green;"><code>get_value</code></mark></summary>

`get_value` - Gets a leaf value.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "check_default": <boolean, default: false>}
```

The `path` param is a keypath pointing to a value.

The `check_default` param adds `is_default` to the result if set to `true`. `is_default` is set to `true` if the default value handling returned the value.

**Result**

```json
{"value": <string>}
```

**Example**

{% code title="Example: Method get_value" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "get_value",
         "params": {"th": 4711,
                    "path": "/dhcp:dhcp/max-lease-time"}}' \
    http://127.0.0.1:8008/jsonrpc
    
{
  "jsonrpc": "2.0",
  "id": 1,
  "result": {"value": "7200"}
}
```
{% endcode %}

</details>

<details>

<summary><mark style="color:green;"><code>get_values</code></mark></summary>

`get_values` - Get leaf values.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "check_default": <boolean, default: false>,
 "leafs": <array of string>}
```

The `path` param is a keypath pointing to a container. The `leafs` param is an array of children names residing under the parent container in the YANG module.

The `check_default` param adds `is_default` to the result if set to `true`. `is_default` is set to `true` if the default value handling returned the value.

**Result**

```json
{"values": <array of value/error>}

value  = {"value": <string>, "access": <access>}
error  = {"error": <string>, "access": <access>} |
         {"exists": true, "access": <access>} |
         {"not_found": true, "access": <access>}
access = {"read": true, write: true}
```

**Note**: The access object has no `read` and/or `write` properties if there are no read and/or access rights.

</details>

<details>

<summary><mark style="color:green;"><code>set_value</code></mark></summary>

`set_value` - Sets a leaf value.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "value": <string | boolean | integer | array | null>,
 "dryrun": <boolean, default: false}
```

The `path` param is the keypath to give a new value as specified with the `value` param.

`value` can be an array when the _path_ is a leaf-list node.

When `value` is `null`, the `set_value` method acts like `delete`.

When `dryrun` is `true`, this function can be used to test if a value is valid or not.

**Note**: If this method is used for deletion and permission to delete is denied on a child, the 'warnings' array in the result will contain a warning ''Some elements could not be removed due to NACM rules prohibiting access.'. The delete will still delete as much as is allowed by the rules. See [AAA Infrastructure](../../../administration/management/aaa-infrastructure.md) for more information about permissions and authorization.

**Note**: In the case type empty is in a union, the expected `value` is \``[null]`\`. Due to implementation specifics, it is also possible to use the empty string and the leaf's name as value to express type empty. If type empty is positioned before type string in a union, the implication is that you can't set the leaf (as type string) to the empty string or the leaf name. You can only set the empty part of the union using the empty string or the leaf name.

**Result**

```json
{} |
                {"warnings": <array of strings>}
```

**Errors (specific)**

```json
{"type": "data.already_exists"}
{"type": "data.not_found"}
{"type": "data.not_writable"}
{"type": "db.locked"}
```

**Example**

{% code title="Example: Method set_value" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "set_value",
         "params": {"th": 4711,
                    "path": "/dhcp:dhcp/max-lease-time",
                    "value": "4500"}}' \
    http://127.0.0.1:8008/jsonrpc
    
{"jsonrpc": "2.0",
 "id": 1,
 "result": {}
}
```
{% endcode %}

</details>

### data - leafref <a href="#methods-data-leafref" id="methods-data-leafref"></a>

<details>

<summary><mark style="color:green;"><code>deref</code></mark></summary>

`deref` - Dereferences a leaf with a leafref type.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "result_as": <"paths" | "target" | "list-target", default: "paths">}
```

The `path` param is a keypath pointing to a leaf with a leafref type.

**Result**

```json
{"paths": <array of string, a keypath to a leaf>}
```

```json
{"target": <a keypath to a leaf>}
```

```json
{"list-target": <a keypath to a list>}
```

</details>

<details>

<summary><mark style="color:green;"><code>get_leafref_values</code></mark></summary>

`get_leafref_values` - Gets all possible values for a leaf with a leafref type.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "offset": <integer, default: 0>,
 "limit": <integer, default: -1>,
 "starts_with": <string, optional>,
 "skip_grouping": <boolean, default: false>,
 "keys": <object>}
```

The `th` param is as returned from a call to `new_read_trans` or `new_write_trans`. The `path` param is a keypath pointing to a leaf with a leafref type.

**Note**: If the leafref is within an action or RPC, `th` should be created with an `action_path`.

The `offset` param is used to skip as many values as it is set to. E.g. an `offset` of 2 will skip the first 2 values. If not given the value defaults to 0, which means no values are skipped. The offset needs to be a non-negative integer or an `invalid params` error will be returned. An offset that is bigger than the length of the leafref list will result in a `method failed` error being returned.

**Note**: `offset` used together with `limit` (see below) can be used repeatedly to paginate the leafref values.

The `limit` param can be set to limit the number of returned values. E.g. a limit of 5 will return a list with 5 values. If not given, the value defaults to -1, which means no limit. The limit needs to be -1 or a non-negative integer or an `invalid params` error will be returned. A Limit of 0 will result in an empty list being returned

The `starts_with` param can be used to filter values by prefix.

The `skip_grouping` param is by default set to false and is only needed to be set to `true` if a set of sibling leafref leafs points to a list instance with multiple keys and if `get_leafref_values` should return an array of possible leaf values instead an array of arrays with possible key value combinations.

The `keys` param is an optional array of values that should be set if more than one leafref statement is used within action/RPC input parameters and if they refer to each other using \``deref()`\` or \``current()`\` XPath functions. For example, consider this model:

```
  rpc create-service {
    tailf:exec "./run.sh";
    input {
      leaf name {
        type leafref {
          path "/myservices/service/name";
        }
      }
      leaf if {
        type leafref {
          path "/myservices/service[name=current()/../name]/interfaces/name"
        }
      }
    }
    output {
      leaf result { type string; }
    }
  }
```

The leaf `if` refers to leaf _name_ in its XPath expression so to be able to successfully run `get_leafref_values` on that node you need to provide a valid value for the _name_ leaf using the _keys_ parameter. The `keys` parameter could for example look like this:

```json
{"/create-service/name": "service1"}
```

**Result**

```json
{"values": <array of string>,
 "source": <string> | false}
```

The `source` param will point to the keypath where the values originate. If the keypath cannot be resolved due to missing/faulty items in the `keys` parameter `source` will be `false`.

</details>

### data - lists <a href="#methods-data-lists" id="methods-data-lists"></a>

<details>

<summary><mark style="color:green;"><code>rename_list_entry</code></mark></summary>

`rename_list_entry` - Renames a list entry.

**Params**

```json
{"th": <integer>,
 "from_path": <string>,
 "to_keys": <array of string>}
```

The `from_path` is a keypath pointing out the list entry to be renamed.

The list entry to be renamed will, under the hood, be deleted all together and then recreated with the content from the deleted list entry copied in.

The `to_keys` param is an array with the new key values. The array must contain a full set of key values.

**Result**

```json
{}
```

**Errors (specific)**

```json
{"type": "data.already_exists"}
{"type": "data.not_found"}
{"type": "data.not_writable"}
```

</details>

<details>

<summary><mark style="color:green;"><code>copy_list_entry</code></mark></summary>

`copy_list_entry` - Copies a list entry.

**Params**

```json
{"th": <integer>,
 "from_path": <string>,
 "to_keys": <array of string>}
```

The `from_path` is a keypath pointing out the list entry to be copied.

The `to_keys` param is an array with the new key values. The array must contain a full set of key values.

Copying between different ned-id versions works as long as the schema nodes being copied has not changed between the versions.

**Result**

```json
{}
```

**Errors (specific)**

```json
{"type": "data.already_exists"}
{"type": "data.not_found"}
{"type": "data.not_writable"}
```

</details>

<details>

<summary><mark style="color:green;"><code>move_list_entry</code></mark></summary>

`move_list_entry` - Moves an ordered-by user list entry relative to its siblings.

**Params**

```json
{"th": <integer>,
 "from_path": <string>,
 "to_path": <string>,
 "mode": <"first" | "last" | "before" | "after">}
```

The `from_path` is a keypath pointing out the list entry to be moved.

The list entry to be moved can either be moved to the first or the last position, i.e. if the `mode` param is set to `first` or `last` the `to_path` keypath param has no meaning.

If the `mode` param is set to `before` or `after` the `to_path` param must be specified, i.e. the list entry will be moved to the position before or after the list entry which the `to_path` keypath param points to.

**Result**

```json
{}
```

**Errors (specific)**

```json
{"type": "db.locked"}
```

</details>

<details>

<summary><mark style="color:green;"><code>append_list_entry</code></mark></summary>

`append_list_entry` - Append a list entry to a leaf-list.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "value": <string>}
```

The `path` is a keypath pointing to a leaf-list.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>count_list_keys</code></mark></summary>

`count_list_keys` - Counts the number of keys in a list.

**Params**

```json
{"th": <integer>
 "path": <string>}
```

The `path` parameter is a keypath pointing to a list.

**Result**

```json
{"count": <integer>}
```

</details>

<details>

<summary><mark style="color:green;"><code>get_list_keys</code></mark></summary>

`get_list_keys` - Enumerates keys in a list.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "chunk_size": <integer greater than zero, optional>,
 "start_with": <array of string, optional>,
 "lh": <integer, optional>,
 "empty_list_key_as_null": <boolean, optional>}
```

The `th` parameter is the transaction handle.

The `path` parameter is a keypath pointing to a list. Required on first invocation - optional in following.

The `chunk_size` parameter is the number of requested keys in the result. Optional - default is unlimited.

The `start_with` parameter will be used to filter out all those keys that do not start with the provided strings. The parameter supports multiple keys e.g. if the list has two keys, then `start_with` can hold two items.

The `lh` (list handle) parameter is optional (on the first invocation) but must be used in the following invocations.

The `empty_list_key_as_null` parameter controls whether list keys of type empty are represented as the name of the list key (default) or as \`\[null]\`.

**Result**

```json
{"keys": <array of array of string>,
 "total_count": <integer>,
 "lh": <integer, optional>}
```

Each invocation of `get_list_keys` will return at most `chunk_size` keys. The returned `lh` must be used in the following invocations to retrieve the next chunk of keys. When no more keys are available the returned `lh` will be set to \`-1\`.

On the first invocation `lh` can either be omitted or set to \`-1\`.

</details>

### data - query <a href="#methods-data-query" id="methods-data-query"></a>

<details>

<summary><mark style="color:green;"><code>query</code></mark></summary>

`query` - Starts a new query attached to a transaction handle, retrieves the results, and stops the query immediately. This is a convenience method for calling `start_query`, `run_query` and `stop_query` in a one-time sequence.

This method should not be used for paginated results, as it results in performance degradation - use `start_query`, multiple `run_query` and `stop_query` instead.

**Example**

{% code title="Example: Method query" %}
```bash
curl \
    --cookie "sessionid=sess11635875109111642;" \
    -X POST \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "query",
         "params": {"th": 1,
                    "xpath_expr": "/dhcp:dhcp/dhcp:foo",
                    "result_as": "keypath-value"}}' \
    http://127.0.0.1:8008/jsonrpc
    
{"jsonrpc": "2.0",
 "id": 1,
 "result":
 {"current_position": 2,
  "total_number_of_results": 4,
  "number_of_results": 2,
  "number_of_elements_per_result": 2,
  "results": ["foo", "bar"]}}
```
{% endcode %}

</details>

<details>

<summary><mark style="color:green;"><code>start_query</code></mark></summary>

`start_query` - Starts a new query attached to a transaction handle. On success, a query handle is returned to be in subsequent calls to `run_query`.

**Params**

```json
{"th": <integer>,
 "xpath_expr": <string, optional if path is given>,
 "path": <string, keypath, optional if xpath_expr is given>,
 "selection": <array of xpath expressions, optional>
 "chunk_size": <integer greater than zero, optional>
 "initial_offset": <integer, optional>,
 "sort", <array of xpath expressions, optional>,
 "sort_order": <"ascending" | "descending", optional>,
 "include_total": <boolean, default: true>,
 "context_node": <string, keypath, optional>,
 "result_as": <"string" | "keypath-value" | "leaf_value_as_string", default: "string">}
```

The `xpath_expr` param is the primary XPath expression to base the query on. Alternatively, one can give a keypath as the `path` param, and internally the keypath will be translated into an XPath expression.

A query is a way of evaluating an XPath expression and returning the results in chunks. The primary XPath expression must evaluate to a node-set, i.e. the result. For each node in the result, a `selection` Xpath expression is evaluated with the result node as its context node.

**Note**: The terminology used here is as defined in http://en.wikipedia.org/wiki/XPath.

For example, given this YANG snippet:

```yang
list interface {
  key name;
  unique number;
  leaf name {
    type string;
  }
  leaf number {
    type uint32;
    mandatory true;
  }
  leaf enabled {
    type boolean;
    default true;
  }
}
```

The `xpath_expr` could be \``/interface[enabled='true']`\` and `selection` could be \``{ "name", "number" }`\`.

Note that the `selection` expressions must be valid XPath expressions, e.g. to figure out the name of an interface and whether its number is even or not, the expressions must look like: \``{ "name", "(number mod 2) == 0" }`\`.

The result are then fetched using `run_query`, which returns the result on the format specified by `result_as` param.

There are two different types of results:

* `string` result is just an array with resulting strings of evaluating the `selection` XPath expressions
* \``keypath-value`\` result is an array the keypaths or values of the node that the `selection` XPath expression evaluates to.

This means that care must be taken so that the combination of `selection` expressions and return types actually yield sensible results (for example \``1 + 2`\` is a valid `selection` XPath expression, and would result in the string `3` when setting the result type to `string` - but it is not a node, and thus have no keypath-value.

It is possible to sort the result using the built-in XPath function \``sort-by()`\` but it is also also possible to sort the result using expressions specified by the `sort` param. These expressions will be used to construct a temporary index which will live as long as the query is active. For example, to start a query sorting first on the enabled leaf, and then on number one would call:

```
$.post("/jsonrpc", {
  jsonrpc: "2.0",
  id: 1,
  method: "start_query",
  params:  {
    th: 1,
    xpath_expr: "/interface[enabled='true']",
    selection: ["name", "number", "enabled"],
    sort: ["enabled", "number"]
  }
})
    .done(...);
```

The `context_node` param is a keypath pointing out the node to apply the query on; only taken into account when the `xpath_expr` uses relatives paths. Lack of a `context_node`, turns relatives paths into absolute paths.

The `chunk_size` param specifies how many result entries to return at a time. If set to `0`, a default number will be used.

The `initial_offset` param is the result entry to begin with (`1` means to start from the beginning).

**Result**

```json
{"qh": <integer>}
```

A new query handler handler id to be used when calling _run\_query_ etc

**Example**

{% code title="Example: Method start_query" %}
```bash
curl \
    --cookie "sessionid=sess11635875109111642;" \
    -X POST \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "start_query",
         "params": {"th": 1,
                    "xpath_expr": "/dhcp:dhcp/dhcp:foo",
                    "result_as": "keypath-value"}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result": 47}
```
{% endcode %}

</details>

<details>

<summary><mark style="color:green;"><code>run_query</code></mark></summary>

`run_query` - Retrieves the result to a query (as chunks). For more details on queries, read the description of [`start_query`](json-rpc-api.md#start_query).

**Params**

```json
{"qh": <integer>}
```

The `qh` param is as returned from a call to `start_query`.

**Result**

```json
{"position": <integer>,
 "total_number_of_results": <integer>,
 "number_of_results": <integer>,
 "chunk_size": <integer greater than zero, optional>,
 "result_as": <"string" | "keypath-value" | "leaf_value_as_string">,
 "results": <array of result>}

result = <string> |
         {"keypath": <string>, "value": <string>}
```

The `position` param is the number of the first result entry in this chunk, i.e. for the first chunk it will be 1.

How many result entries there are in this chunk is indicated by the `number_of_results` param. It will be 0 for the last chunk.

The `chunk_size` and the `result_as` properties are as given in the call to `start_query`.

The `total_number_of_results` param is total number of result entries retrieved so far.

The `result` param is as described in the description of `start_query`.

**Example**

{% code title="Example: Method run_query" %}
```bash
curl \
    --cookie "sessionid=sess11635875109111642;" \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "run_query",
         "params": {"qh": 22}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result":
 {"current_position": 2,
  "total_number_of_results": 4,
  "number_of_results": 2,
  "number_of_elements_per_result": 2,
  "results": ["foo", "bar"]}}
```
{% endcode %}

</details>

<details>

<summary><mark style="color:green;"><code>reset_query</code></mark></summary>

`reset_query` - Reset/rewind a running query so that it starts from the beginning again. The next call to `run_query` will then return the first chunk of result entries.

**Params**

```json
{"qh": <integer>}
```

The `qh` param is as returned from a call to `start_query`.

**Result**

```json
{}
```

**Example**

{% code title="Example: Method reset_query" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "reset_query",
         "params": {"qh": 67}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result": true}
```
{% endcode %}

</details>

<details>

<summary><mark style="color:green;"><code>stop_query</code></mark></summary>

`stop_query` - Stops the running query identified by query handler. If a query is not explicitly closed using this call, it will be cleaned up when the transaction the query is linked to ends.

**Params**

```json
{"qh": <integer>}
```

The `qh` param is as returned from a call to `start_query`.

**Result**

```json
{}
```

**Example**

{% code title="Example: Method stop_query" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "stop_query",
         "params": {"qh": 67}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result": true}
```
{% endcode %}

</details>

### database <a href="#methods-database" id="methods-database"></a>

<details>

<summary><mark style="color:green;"><code>reset_candidate_db</code></mark></summary>

`reset_candidate_db` - Resets the candidate datastore.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>lock_db</code></mark></summary>

`lock_db` - Takes a database lock.

**Params**

```json
{"db": <"startup" | "running" | "candidate">}
```

The `db` param specifies which datastore to lock.

**Result**

```json
{}
```

**Errors (specific)**

```json
{"type": "db.locked", "data": {"sessions": <array of string>}}
```

The \``data.sessions`\` param is an array of strings describing the current sessions of the locking user, e.g., an array of "admin tcp (cli from 192.245.2.3) on since 2006-12-20 14:50:30 exclusive".

</details>

<details>

<summary><mark style="color:green;"><code>unlock_db</code></mark></summary>

`unlock_db` - Releases a database lock.

**Params**

```json
{"db": <"startup" | "running" | "candidate">}
```

The `db` param specifies which datastore to unlock.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>copy_running_to_startup_db</code></mark></summary>

`copy_running_to_startup_db` - Copies the running datastore to the startup datastore.

**Result**

```json
{}
```

</details>

### general <a href="#methods-general" id="methods-general"></a>

<details>

<summary><mark style="color:green;"><code>comet</code></mark></summary>

`comet` - Listens on a comet channel, i.e. all asynchronous messages from batch commands started by calls to `start_cmd`, `subscribe_cdboper`, `subscribe_changes`, `subscribe_messages`, `subscribe_poll_leaf`, or `subscribe_upgrade` ends up on the comet channel.

You are expected to have a continuous long polling call to the `comet` method at any given time. As soon as the browser or server closes the socket, due to browser or server connect timeout, the `comet` method should be called again.

As soon as the `comet` method returns with values they should be dispatched and the `comet` method should be called again.

**Params**

```json
{"comet_id": <string>}
```

**Result**

```
[{"handle": <integer>,
  "message": <a context specific json object, see example below>},
 ...]
```

**Errors (specific)**

```json
{"type": "comet.duplicated_channel"}
```

**Example**

{% code title="Example: Method comet" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "subscribe_changes",
         "params": {"comet_id": "main",
                    "path": "/dhcp:dhcp"}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result": {"handle": "2"}}
 
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "batch_init_done",
         "params": {"handle": "2"}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result": {}}
 
curl \
    -m 15 \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "comet",
         "params": {"comet_id": "main"}}' \
    http://127.0.0.1:8008/jsonrpc
```
{% endcode %}

Hangs, and finally:

```json
{"jsonrpc": "2.0",
 "id": 1,
 "result":
 [{"handle": "1",
   "message":
   {"db": "running",
    "changes":
    [{"keypath": "/dhcp:dhcp/default-lease-time",
      "op": "value_set",
      "value": "100"}],
    "user": "admin",
    "ip": "127.0.0.1"}}]}
```

In this case, the admin user seems to have set \`/dhcp:dhcp/default-lease-time\` to 100.

</details>

<details>

<summary><mark style="color:green;"><code>get_system_setting</code></mark></summary>

`get_system_setting` - Extracts system settings such as capabilities, supported datastores, etc.

**Params**

```json
{"operation": <"capabilities" | "customizations" | "models" | "user" | "version" | "all" | "namespaces", default: "all">}
```

The `operation` param specifies which system setting to get:

* `capabilities` - the server-side settings are returned, e.g. is rollback and confirmed commit supported.
* `customizations` - an array of all WebUI customizations.
* `models` - an array of all loaded YANG modules are returned, i.e. prefix, namespace, name.
* `user` - the username of the currently logged in user is returned.
* `version` - the system version.
* `all` - all of the above is returned.
* (DEPRECATED) `namespaces` - an object of all loaded YANG modules are returned, i.e. prefix to namespace.

**Result**

```json
{"user:" <string>,
 "models:" <array of YANG modules>,
 "version:" <string>,
 "customizations": <array of customizations>,
 "capabilities":
 {"rollback": <boolean>,
  "copy_running_to_startup": <boolean>,
  "exclusive": <boolean>,
  "confirmed_commit": <boolean>
 },
 "namespaces": <object of YANG modules prefix/namespace>}
```

The above is the result if using the `all` operation.

</details>

<details>

<summary><mark style="color:green;"><code>abort</code></mark></summary>

`abort` - Abort a JSON-RPC method by its associated ID.

**Params**

```json
{"id": <integer>}
```

The `id` param is the id of the JSON-RPC method to be aborted.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>eval_XPath</code></mark></summary>

`eval_XPath` - Evaluates an xpath expression on the server side.

**Params**

```json
{"th": <integer>,
 "xpath_expr": <string>}
```

The `xpath_expr` param is the XPath expression to be evaluated.

**Result**

```json
{"value": <string>}
```

</details>

### messages <a href="#methods-messages" id="methods-messages"></a>

<details>

<summary><mark style="color:green;"><code>send_message</code></mark></summary>

`send_message` - Sends a message to another user in the CLI or Web UI.

**Params**

```json
{"to": <string>,
 "message": <string>}
```

The `to` param is the user name of the user to send the message to and the `message` param is the actual message.

**Note**: The username `all` will broadcast the message to all users.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>subscribe_messages</code></mark></summary>

`subscribe_messages` - Starts a subscriber to messages.

**Note**: The `start_subscription` method must be called to actually get the subscription to generate any messages unless the `handle` is provided as input.

**Note**: The `unsubscribe` method should be used to end the subscription.

**Note**: As soon as a subscription message is generated, it will be sent as a message and turn up as a result to your polling call to the `comet` method.

**Params**

```json
{"comet_id": <string>,
 "handle": <string, optional>}
```

**Result**

```xml
<string>
```

A handle to the subscription is returned (equal to `handle` if provided).

Subscription messages will end up in the `comet` method and the format of these messages depend on what has happened.

When a new user has logged in:

```json
{"new_user": <integer, a session id to be used by "kick_user">
 "me": <boolean, is it myself?>
 "user": <string>,
 "proto": <"ssh" | "tcp" | "console" | "http" | "https" | "system">,
 "ctx": <"cli" | "webui" | "netconf">
 "ip": <string, user's ip-address>,
 "login": <string, login timestamp>}
```

When a user logs out:

```json
{"del_user": <integer, a session id>,
 "user": <string>}
```

When receiving a message:

```json
{"sender": <string>,
 "message": <string>}
```

</details>

### rollbacks <a href="#methods-rollbacks" id="methods-rollbacks"></a>

<details>

<summary><mark style="color:green;"><code>get_rollbacks</code></mark></summary>

`get_rollbacks` - Lists all available rollback files.

**Result**

```json
{"rollbacks": <array of rollback>}

rollback =
 {"nr": <integer>,
  "creator": <string>,
  "date": <string>,
  "via": <"system" | "cli" | "webui" | "netconf">,
  "comment": <string>,
  "label": <string>}
```

The `nr` param is a rollback number to be used in calls to `load_rollback` etc.

The `creator` and `date` properties identify the name of the user responsible for committing the configuration stored in the rollback file and when it happened.

The `via` param identifies the interface that was used to create the rollback file.

The `label` and `comment` properties is as given calling the methods `set_comment` and `set_label` on the transaction.

</details>

<details>

<summary><mark style="color:green;"><code>get_rollback</code></mark></summary>

`get_rollback` - Gets the content of a specific rollback file. The rollback format is as defined in a curly bracket format as defined in the CLI.

**Params**

```json
{"nr": <integer>}
```

**Result**

```xml
<string, rollback file in curly bracket format>
```

</details>

<details>

<summary><mark style="color:green;"><code>install_rollback</code></mark></summary>

`install_rollback` - Installs a specific rollback file into a new transaction and commits it. The configuration is restored to the one stored in the rollback file and no further operations are needed. It is the equivalent of creating a new private write private transaction handler with `new_write_trans`, followed by calls to the methods `load_rollback`, `validate_commit` and `commit`.

**Note:** If the permission to rollback is denied on some nodes, the 'warnings' array in the result will contain a warning 'Some changes could not be applied due to NACM rules prohibiting access.'. The `install_rollback` will still rollback as much as is allowed by the rules. See [AAA Infrastructure](../../../administration/management/aaa-infrastructure.md) for more information about permissions and authorization.

**Params**

```json
{"nr": <integer>}
```

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>load_rollback</code></mark></summary>

`load_rollback` - Rolls back within an existing transaction, starting with the latest rollback file, down to a specified rollback file, or selecting only the specified rollback file (also known as "selective rollback").

**Note**: If the permission to rollback is denied on some nodes, the 'warnings' array in the result will contain a warning 'Some changes could not be applied due to NACM rules prohibiting access.'. The `load_rollback` will still rollback as much as is allowed by the rules. See [AAA Infrastructure](../../../administration/management/aaa-infrastructure.md) for more information about permissions and authorization.

**Params**

```json
{"th": <integer>,
 "nr": <integer>,
 "path": <string>,
 "selective": <boolean, default: false>}
```

The `nr` param is a rollback number returned by `get_rollbacks`.

The `path` param is a keypath that restricts the rollback to be applied only to a subtree.

The `selective` param, false by default, can restrict the rollback process to use only the rollback specified by `nr`, rather than applying all known rollback files starting with the latest down to the one specified by `nr`.

**Result**

```json
{}
```

</details>

### schema <a href="#methods-schema" id="methods-schema"></a>

<details>

<summary><mark style="color:green;"><code>get_description</code></mark></summary>

`get_description` - Get description. To be able to get the description in the response, the `fxs` file needs to be compiled with the flag `--include-doc`. This operation can be heavy so instead of calling get\_description directly, we can confirm that there is a description before calling in `CS_HAS_DESCR` flag that we get from `get_schema` response.

**Params**

```json
{"th": <integer>,
 "path": <string, optional>
```

A `path` is a tagpath/keypath pointing into a specific sub-tree of a YANG module.

**Result**

```json
{"description": <string>}
```

</details>

<details>

<summary><mark style="color:green;"><code>get_schema</code></mark></summary>

`get_schema` - Exports a JSON schema for a selected part (or all) of a specific YANG module (with optional instance data inserted).

**Params**

```json
{"th": <integer>,
 "namespace": <string, optional>,
 "path": <string, optional>,
 "levels": <integer, default: -1>,
 "insert_values": <boolean, default: false>,
 "evaluate_when_entries": <boolean, default: false>,
 "stop_on_list": <boolean, default: false>,
 "cdm_namespace": <boolean, default: false>}
```

One of the properties `namespace` or `path` must be specified.

A `namespace` is as specified in a YANG module.

A `path` is a tagpath/keypath pointing into a specific sub-tree of a YANG module.

The `levels` param limits the maximum depth of containers and lists from which a JSON schema should be produced (-1 means unlimited depth).

The `insert_values` param signals that instance data for leafs should be inserted into the schema. This way the need for explicit forthcoming calls to `get_elem` are avoided.

The `evaluate_when_entries` param signals that schema entries should be included in the schema even though their `when` or `tailf:display-when` statements evaluate to false, i.e. instead a boolean `evaluated_when_entry` param is added to these schema entries.

The `stop_on_list` param limits the schema generation to one level under the list when true.

The `cdm_namespace` param signals the inclusion of `cdm-namespace` entries where appropriate.

**Result**

```json
{"meta":
 {"namespace": <string, optional>,
  "keypath": <string, optional>,
  "prefix": <string>,
  "types": <array of type>},
 "data": <array of child>}

type = <array of {<string, type name with prefix>: <type_stack>}>

type_stack = <array of type_stack_entry>

type_stack_entry =
 {"bits": <array of string>, "size": <32 | 64>} |
 {"leaf_type": <type_stack>, "list_type": <type_stack>} |
 {"union": <array of type_stack>} |
 {"name": <primitive_type | "user_defined">,
  "info": <string, optional>,
  "readonly": <boolean, optional>,
  "facets": <array of facet, only if not primitive type>}

primitive_type =
 "empty" |
 "binary" |
 "bits" |
 "date-and-time" |
 "instance-identifier" |
 "int64" |
 "int32" |
 "int16" |
 "uint64" |
 "uint32" |
 "uint16" |
 "uint8" |
 "ip-prefix" |
 "ipv4-prefix" |
 "ipv6-prefix" |
 "ip-address-and-prefix-length" |
 "ipv4-address-and-prefix-length" |
 "ipv6-address-and-prefix-length" |
 "hex-string" |
 "dotted-quad" |
 "ip-address" |
 "ipv4-address" |
 "ipv6-address" |
 "gauge32" |
 "counter32" |
 "counter64" |
 "object-identifier"

facet_entry =
 {"enumeration": {"label": <string>, "info": <string, optional>}} |
 {"fraction-digits": {"value": <integer>}} |
 {"length": {"value": <integer>}} |
 {"max-length": {"value": <integer>}} |
 {"min-length": {"value": <integer>}} |
 {"leaf-list": <boolean>} |
 {"max-inclusive": {"value": <integer>}} |
 {"max-length": {"value": <integer>}} |
 {"range": {"value": <array of range_entry>}} |
 {"min-exclusive": {"value": <integer>}} |
 {"min-inclusive": {"value": <integer>}} |
 {"min-length": {"value": <integer>}} |
 {"pattern": {"value": <string, regular expression>}} |
 {"total-digits": {"value": <integer>}}

range_entry =
 "min" |
 "max" |
 <integer> |
 [<integer, min value>, <integer, max value>]

child =
 {"kind": <kind>,
  "name": <string>,
  "qname": <string, same as "name" but with prefix prepended>,
  "info": <string>,
  "namespace": <string>,
  "xml-namespace": <string>,
  "is_action_input": <boolean>,
  "is_action_output": <boolean>,
  "is_cli_preformatted": <boolean>,
  "is_mount_point": <boolean>
  "presence": <boolean>,
  "ordered_by": <boolean>,
  "is_config_false_callpoint": <boolean>,
  "key": <boolean>,
  "exists": <boolean>,
  "value": <string | number | boolean>,
  "is_leafref": <boolean>,
  "leafref_target": <string>,
  "when_targets": <array of string>,
  "deps": <array of string>
  "hidden": <boolean>,
  "default_ref":
  {"namespace": <string>,
   "tagpath": <string>
  },
  "access":
  {"create": <boolean>,
   "update": <boolean>,
   "delete": <boolean>,
   "execute": <boolean>
  },
  "config": <boolean>,
  "readonly": <boolean>,
  "suppress_echo": <boolean>,
  "type":
  {"name": <primitive_type>,
   "primitive": <boolean>
  }
  "generated_name": <string>,
  "units": <string>,
  "leafref_groups": <array of string>,
  "active": <string, active case, only if "kind" is "choice">,
  "cases": <array of case, only of "kind" is "choice">,
  "default": <string | number | boolean>,
  "mandatory": <boolean>,
  "children": <children>
 }

kind =
 "module" |
 "access-denies" |
 "list-entry" |
 "choice" |
 "key" |
 "leaf-list" |
 "action" |
 "container" |
 "leaf" |
 "list" |
 "notification"

case_entry =
 {"kind": "case",
  "name": <string>,
  "children": <array of child>
 }
```

This is a fairly complex piece of JSON but it essentially maps what is seen in a YANG module. Keep that in mind when scrutinizing the above.

The `meta` param contains meta-information about the YANG module such as namespace and prefix but it also contains type stack information for each type used in the YANG module represented in the `data` param. Together with the `meta` param, the `data` param constitutes a complete YANG module in JSON format.

**Example**

{% code title="Example: Method get_schema" %}
```bash
curl \
    --cookie "sessionid=sess11635875109111642;" \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "get_schema",
         "params": {"th": 2,
                    "path": "/aaa:aaa/authentication/users/user{admin}",
                    "levels": -1,
                    "insert_values": true}}' \
    http://127.0.0.1:8008/jsonrpc
{"jsonrpc": "2.0",
 "id": 1,
 "result":
 {"meta":
  {"namespace": "http://tail-f.com/ns/aaa/1.1",
   "keypath": "/aaa:aaa/authentication/users/user{admin}",
   "prefix": "aaa",
   "types":
   {"http://tail-f.com/ns/aaa/1.1:passwdStr":
    [{"name": "http://tail-f.com/ns/aaa/1.1:passwdStr"},
     {"name": "MD5DigestString"}]}}},
 "data":
 {"kind": "list-entry",
  "name": "user",
  "qname": "aaa:user",
  "access":
  {"create": true,
   "update": true,
   "delete": true},
  "children":
  [{"kind": "key",
    "name": "name",
    "qname": "aaa:name",
    "info": {"string": "Login name of the user"},
    "mandatory": true,
    "access": {"update": true},
    "type": {"name": "string", "primitive": true}},
   ...]}}
```
{% endcode %}

</details>

<details>

<summary><mark style="color:green;"><code>hide_schema</code></mark></summary>

`hide_schema` - Hides data that has been adorned with a `hidden` statement in YANG modules. `hidden` statement is an extension defined in the tail-common YANG module (http://tail-f.com/yang/common).

**Params**

```json
{"th": <integer>,
 "group_name": <string>
```

The `group_name` param is as defined by a `hidden` statement in a YANG module.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>unhide_schema</code></mark></summary>

`unhide_schema` - Unhides data that has been adorned with a `hidden` statement in the YANG modules. `hidden` statement is an extension defined in the tail-common YANG module (http://tail-f.com/yang/common).

**Params**

```json
{"th": <integer>,
 "group_name": <string>,
 "passwd": <string>}
```

The `group_name` param is as defined by a `hidden` statement in a YANG module.

The `passwd` param is a password needed to hide the data that has been adorned with a `hidden` statement. The password is as defined in the `ncs.conf` file.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>get_module_prefix_map</code></mark></summary>

`get_module_prefix_map` - Returns a map from module name to module prefix.

**Params**

Method takes no parameters.

**Result**

```xml
<key-value object>

result = {"module-name": "module-prefix"}
```

**Example**

{% code title="Example: Method get_module_prefix_map" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", id: 1,
         "method": "get_module_prefix_map",
         "params": {}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result": {
     "cli-builtin": "cli-builtin",
     "confd_cfg": "confd_cfg",
     "iana-crypt-hash": "ianach",
     "ietf-inet-types": "inet",
     "ietf-netconf": "nc",
     "ietf-netconf-acm": "nacm",
     "ietf-netconf-monitoring": "ncm",
     "ietf-netconf-notifications": "ncn",
     "ietf-netconf-with-defaults": "ncwd",
     "ietf-restconf": "rc",
     "ietf-restconf-monitoring": "rcmon",
     "ietf-yang-library": "yanglib",
     "ietf-yang-types": "yang",
     "tailf-aaa": "aaa",
     "tailf-acm": "tacm",
     "tailf-common-monitoring2": "tfcg2",
     "tailf-confd-monitoring": "tfcm",
     "tailf-confd-monitoring2": "tfcm2",
     "tailf-kicker": "kicker",
     "tailf-netconf-extensions": "tfnce",
     "tailf-netconf-monitoring": "tncm",
     "tailf-netconf-query": "tfncq",
     "tailf-rest-error": "tfrerr",
     "tailf-rest-query": "tfrestq",
     "tailf-rollback": "rollback",
     "tailf-webui": "webui",
    }
}
```
{% endcode %}

</details>

<details>

<summary><mark style="color:green;"><code>run_action</code></mark></summary>

`run_action` - Invokes an action or RPC defined in a YANG module.

**Params**

```json
{"th": <integer>,
 "path": <string>,
 "params": <json, optional>
 "format": <"normal" | "bracket" | "json", default: "normal">,
 "comet_id": <string, optional>,
 "handle": <string, optional>,
 "details": <"normal" | "verbose" | "very_verbose" | "debug", optional>}
```

Actions are as specified in the YANG module, i.e. having a specific name and a well-defined set of parameters and result. The `path` param is a keypath pointing to an action or RPC and the `params` param is a JSON object with action parameters.

The `format` param defines if the result should be an array of key values or a pre-formatted string in bracket format as seen in the CLI. The result is also as specified by the YANG module.

Both a `comet_id` and `handle` need to be provided in order to receive notifications.

The `details` param can be given together with `comet_id` and `handle` in order to get a progress trace for the action. `details` specifies the verbosity of the progress trace. After the action has been invoked, the `comet` method can be used to get the progress trace for the action. If the `details` param is omitted progress trace will be disabled.

The `debug` param can be used the same way as the `details` param to get debug trace events for the action. These are the same trace events that can be displayed in the CLI with the "debug" pipe command when invoking the action. The `debug` param is an array with all debug flags for which debug events should be displayed. Valid values are "service", "template", "xpath", "kicker", and "subscriber". Any other values will result in "invalid params" error. The `debug` param can be used together with the `details` param to get both progress and debug trace events for the operation.

The `debug_service_name` and `debug_template_name` params can be used to specify a service or template name respectively for which to display debug events.

**Note**_:_ This method is often used to call an action that uploads binary data (e.g. images) and retrieving them at a later time. While retrieval is not a problem, uploading is a problem, because JSON-RPC request payloads have a size limitation (e.g. 64 kB). The limitation is needed for performance concerns because the payload is first buffered before the JSON string is parsed and the request is evaluated. When you have scenarios that need binary uploads, please use the CGI functionality instead which has a size limitation that can be configured, and which is not limited to JSON payloads, so one can use streaming techniques.

**Result**

```xml
<string | array of result | key-value object>

result = {"name": <string>, "value": <string>}
```

**Errors (specific)**

```json
{"type": "action.invalid_result", "data": {"path": <string, path to invalid result>}}
```

**Example**

{% code title="Example: Method run_action" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", id: 1,
         "method": "run_action",
         "params": {"th": 2,
                    "path": "/dhcp:dhcp/set-clock",
                    "params": {"clockSettings": "2014-02-11T14:20:53.460%2B01:00"}}}' \
    http://127.0.0.1:8008/jsonrpc
    
{"jsonrpc": "2.0",
 "id": 1,
 "result": [{"name":"systemClock", "value":"0000-00-00T03:00:00+00:00"},
            {"name":"inlineContainer/bar", "value":"false"},
            {"name":"hardwareClock","value":"0000-00-00T04:00:00+00:00"}]}
curl \
    -s \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d'{"jsonrpc": "2.0", "id": 1,
        "method": "run_action",
        "params": {"th": 2,
                   "path": "/dhcp:dhcp/set-clock",
                   "params": {"clockSettings":
    "2014-02-11T14:20:53.460%2B01:00"},
                   "format": "bracket"}}' \
    http://127.0.0.1:8008/jsonrpc
    
{"jsonrpc": "2.0",
 "id": 1,
 "result": "systemClock 0000-00-00T03:00:00+00:00\ninlineContainer  {\n    \
                    bar false\n}\nhardwareClock 0000-00-00T04:00:00+00:00\n"}
                    
curl \
    -s \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d'{"jsonrpc": "2.0", "id": 1,
        "method": "run_action",
        "params": {"th": 2,
                   "path": "/dhcp:dhcp/set-clock",
                   "params": {"clockSettings":
    "2014-02-11T14:20:53.460%2B01:00"},
                   "format": "json"}}' \
    http://127.0.0.1:8008/jsonrpc
    
{"jsonrpc": "2.0",
 "id": 1,
 "result": {"systemClock": "0000-00-00T03:00:00+00:00",
            "inlineContainer": {"bar": false},
            "hardwareClock": "0000-00-00T04:00:00+00:00"}}
```
{% endcode %}

</details>

### session <a href="#methods-session" id="methods-session"></a>

<details>

<summary><mark style="color:green;"><code>login</code></mark></summary>

`login` - Creates a user session and sets a browser cookie.

**Params**

```json
{}
```

```json
{"user": <string>, "passwd": <string>, "ack_warning": <boolean, default: false>}
```

There are two versions of the `login` method. The method with no parameters only invokes Package Authentication, since credentials can be supplied with the whole HTTP request. The method with parameters is used when credentials may need to be supplied with the method parameters, this method invokes all authentication methods including Package Authentication.

The `user` and `passwd` are the credentials to be used in order to create a user session. The common AAA engine in NSO is used to verify the credentials.

If the method fails with a warning, the warning needs to be displayed to the user, along with a checkbox to allow the user to acknowledge the warning. The acknowledgment of the warning translates to setting `ack_warning` to `true`.

**Result**

```json
{"warning": <string, optional>}
```

**Note**_:_ The response will have a \`Set-Cookie\` HTTP header with a `sessionid` cookie which will be your authentication token for upcoming JSON-RPC requests.

The `warning` is a free-text string that should be displayed to the user after a successful login. This is not to be mistaken with a failed login that has a `warning` as well. In case of a failure, the user should also acknowledge the warning, not just have it displayed for optional reading.

**Multi-factor authentication**

```json
{"challenge_id": <string>, "challenge_prompt": <string>}
```

**Note**_:_ A challenge response will have a `challenge_id` and `challenge_prompt` which needs to be responded to with an upcoming JSON-RPC `challenge_response` requests.

**Note**: The `challenge_prompt` may be a multi-line, why it is base64 encoded.

**Example**

{% code title="Example: Method login" %}
```bash
curl \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "login",
         "params": {"user": "joe",
                    "passwd": "SWkkasE32"}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "error":
 {"code": -32000,
  "type": "rpc.method.failed",
  "message": "Method failed"}}

curl \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "login",
         "params": {"user": "admin",
                    "passwd": "admin"}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result": {}}
```
{% endcode %}

**Note**_:_ `sessionid` cookie is set at this point in your User Agent (browser). In our examples, we set the cookie explicitly in the upcoming requests for clarity.

```bash
curl \
    --cookie "sessionid=sess4245223558720207078;" \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "get_trans"}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result": {"trans": []}}
```

</details>

<details>

<summary><mark style="color:green;"><code>challenge_response</code></mark></summary>

`challenge_response` - Creates a user session and sets a browser cookie.

**Params**

```json
{"challenge_id": <string>, "response": <string>, "ack_warning": <boolean, default: false>}
```

The `challenge_id` and `response` is the multi-factor response to be used in order to create a user session. The common AAA engine in NSO is used to verify the response.

If the method fails with a warning, the warning needs to be displayed to the user, along with a checkbox to allow the user to acknowledge the warning. The acknowledgment of the warning translates to setting `ack_warning` to `true`.

**Result**

```json
{"warning": <string, optional>}
```

**Note**_:_ The response will have a \`Set-Cookie\` HTTP header with a `sessionid` cookie which will be your authentication token for upcoming JSON-RPC requests.

The `warning` is a free-text string that should be displayed to the user after a successful challenge response. This is not to be mistaken with a failed challenge response that has a `warning` as well. In case of a failure, the user should also acknowledge the warning, not just have it displayed for optional reading.

**Example**

{% code title="Example: Method challenge-response" %}
```bash
curl \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "challenge_response",
         "params": {"challenge_id": "123",
                    "response": "SWkkasE32"}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "error":
 {"code": -32000,
  "type": "rpc.method.failed",
  "message": "Method failed"}}

curl \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "challenge_response",
         "params": {"challenge_id": "123",
                    "response": "SWEddrk1"}}' \
    http://127.0.0.1:8008/jsonrpc
 
 {"jsonrpc": "2.0",
 "id": 1,
 "result": {}}
```
{% endcode %}

**Note**_:_ `sessionid` cookie is set at this point in your User Agent (browser). In our examples, we set the cookie explicitly in the upcoming requests for clarity.

```bash
curl \
    --cookie "sessionid=sess4245223558720207078;" \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "get_trans"}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result": {"trans": []}}
```

</details>

<details>

<summary><mark style="color:green;"><code>logout</code></mark></summary>

`logout` - Removes a user session and invalidates the browser cookie.

The HTTP cookie identifies the user session so no input parameters are needed.

**Params**

None.

**Result**

```json
{}
```

**Example**

{% code title="Example: Method logout" %}
```bash
curl \
    --cookie "sessionid=sess4245223558720207078;" \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "logout"}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result": {}}

curl \
    --cookie "sessionid=sess4245223558720207078;" \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "logout"}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "error":
 {"code": -32000,
  "type": "session.invalid_sessionid",
  "message": "Invalid sessionid"}}
```
{% endcode %}

</details>

<details>

<summary><mark style="color:green;"><code>kick_user</code></mark></summary>

`kick_user` - Kills a user session, i.e. kicking out the user.

**Params**

```json
{"user": <string | number>}
```

The `user` param is either the username of a logged-in user or session ID.

**Result**

```json
{}
```

</details>

### session data <a href="#methods-session-data" id="methods-session-data"></a>

<details>

<summary><mark style="color:green;"><code>get_session_data</code></mark></summary>

`get_session_data` - Gets session data from the session store.

**Params**

```json
{"key": <string>}
```

The `key` param for which to get the stored data for. Read more about the session store in the `put_session_data` method.

**Result**

```json
{"value": <string>}
```

</details>

<details>

<summary><mark style="color:green;"><code>put_session_data</code></mark></summary>

`put_session_data` - Puts session data into the session store. The session store is a small key-value server-side database where data can be stored under a unique key. The data may be an arbitrary object, but not a function object. The object is serialized into a JSON string and then stored on the server.

**Params**

```json
{"key": <string>,
 "value": <string>}
```

The key param is the unique key for which the data in the `value` param is to be stored.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>erase_session_data</code></mark></summary>

`erase_session_data` - Erases session data previously stored with `put_session_data`.

**Params**

```json
{"key": <string>}
```

The `key` param for which all session data will be erased. Read more about the session store in the `put_session_data` method.

**Result**

```json
{}
```

</details>

### transaction <a href="#methods-transaction" id="methods-transaction"></a>

<details>

<summary><mark style="color:green;"><code>get_trans</code></mark></summary>

`get_trans` - Lists all transactions.

**Params**

None.

**Result**

```json
{"trans": <array of transaction>}

transaction =
 {"db": <"running" | "startup" | "candidate">,
  "mode": <"read" | "read_write", default: "read">,
  "conf_mode": <"private" | "shared" | "exclusive", default: "private">,
  "tag": <string>,
  "th": <integer>}
```

**Example**

{% code title="Example: Method get_trans" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "get_trans"}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result":
 {"trans":
  [{"db": "running",
    "th": 2}]}}
```
{% endcode %}

</details>

<details>

<summary><mark style="color:green;"><code>new_trans</code></mark></summary>

`new_trans` - Creates a new transaction.



**Params**

```json
{"db": <"startup" | "running" | "candidate", default: "running">,
 "mode": <"read" | "read_write", default: "read">,
 "conf_mode": <"private" | "shared" | "exclusive", default: "private">,
 "tag": <string>,
 "action_path": <string>,
 "th": <integer>,
 "on_pending_changes": <"reuse" | "reject" | "discard", default: "reuse">}
```

The `conf_mode` param specifies which transaction semantics to use when it comes to lock and commit strategies. These three modes mimic the modes available in the CLI.

The meaning of `private`, `shared`, and `exclusive` have slightly different meaning depending on how the system is configured; with a writable running, startup, or candidate configuration.

* `private` (\*writable running enabled\*) - Edit a private copy of the running configuration, no lock is taken.

- `private` (\*writable running disabled, startup enabled\*) - Edit a private copy of the startup configuration, no lock is taken.

* `exclusive` (\*candidate enabled\*) - Lock the running configuration and the candidate configuration and edit the candidate configuration.

- `exclusive` (\*candidate disabled, startup enabled\*) - Lock the running configuration (if enabled) and the startup configuration and edit the startup configuration.

* `shared` (\*writable running enabled, candidate enabled\*) - Is a deprecated setting.

The `tag` param is a way to tag transactions with a keyword so that they can be filtered out when you call the `get_trans` method.

The `action_path` param is a keypath pointing to an action or RPC. Use `action_path` when you need to read action/rpc input parameters.

The `th` param is a way to create transactions within other `read_write` transactions. Note that it should always be possible to commit a child transaction (the transaction-in-transaction) to the parent transaction (the original transaction), even if no validation has been done on the child transaction, or if the validation failed due to invalid configuration. Validation on the child transaction is still possible in order to determine if the transaction is valid.

The `on_pending_changes` param decides what to do if the candidate already has been written to, e.g. a CLI user has started a shared configuration session and changed a value in the configuration (without committing it). If this parameter is omitted, the default behavior is to silently reuse the candidate. If `reject` is specified, the call to the `new_trans` method will fail if the candidate is non-empty. If `discard` is specified, the candidate is silently cleared if it is non-empty.

**Result**

```json
{"th": <integer>}
```

A new transaction handler ID.

**Errors (specific)**

```json
{"type": "trans.confirmed_commit_in_progress"}
{"type": "db.locked", "data": {"sessions": <array of string>}}
```

The \`data.sessions\` param is an array of strings describing the current sessions of the locking user, e.g., an array of "admin tcp (cli from 192.245.2.3) on since 2006-12-20 14:50:30 exclusive".

**Example**

{% code title="Example: Method new_trans" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "new_trans",
         "params": {"db": "running",
                    "mode": "read"}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result": 2}
```
{% endcode %}

</details>

<details>

<summary><mark style="color:green;"><code>delete_trans</code></mark></summary>

`delete_trans` - Deletes a transaction created by `new_trans` or `new_webui_trans`_._

**Params**

```json
{"th": <integer>}
```

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>set_trans_comment</code></mark></summary>

`set_trans_comment` - Adds a comment to the active read-write transaction. This comment will be stored in rollback files and can be seen with a call to `get_rollbacks`.

**Params**

```json
{"th": <integer>}
```

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>set_trans_label</code></mark></summary>

`set_trans_label` - Adds a label to the active read-write transaction. This label will be stored in rollback files and can be seen with a call to `get_rollbacks`.

**Params**

```json
{"th": <integer>}
```

**Result**

```json
{}
```

</details>

### transaction - changes <a href="#methods-transaction-changes" id="methods-transaction-changes"></a>

<details>

<summary><mark style="color:green;"><code>is_trans_modified</code></mark></summary>

`is_trans_modified` - Checks if any modifications have been done to a transaction.

**Params**

```json
{"th": <integer>}
```

**Result**

```json
{"modified": <boolean>}
```

</details>

<details>

<summary><mark style="color:green;"><code>get_trans_changes</code></mark></summary>

`get_trans_changes` - Extracts modifications done to a transaction.

**Params**

```json
{"th": <integer>},
 "output": <"compact" | "legacy", default: "legacy">
```

The `output` parameter controls the result content. `legacy` format include old and value for all operation types even if their value is undefined. undefined values are represented by an empty string. `compact` format excludes old and value if their value is undefined.

**Result**

```json
{"changes": <array of change>}

change =
 {"keypath": <string>,
  "op": <"created" | "deleted" | "modified" | "value_set">,
  "value": <string,>,
  "old": <string>
 }
```

The `value` param is only interesting if `op` is set to one of `modified` or `value_set`.

The `old` param is only interesting if `op` is set to `modified`.

**Example**

{% code title="Example: Method get_trans_changes" %}
```bash
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
        "method": "changes",
        "params": {"th": 2}}' \
    http://127.0.0.1:8008/jsonrpc

{"jsonrpc": "2.0",
 "id": 1,
 "result":
 [{"keypath":"/dhcp:dhcp/default-lease-time",
   "op": "value_set",
   "value": "100",
   "old": ""}]}
```
{% endcode %}

</details>

<details>

<summary><mark style="color:green;"><code>validate_trans</code></mark></summary>

`validate_trans` - Validates a transaction.

**Params**

```json
{"th": <integer>}
```

**Result**

```json
{}
```

Or:

```json
{"warnings": <array of warning>}

warning = {"paths": <array of string>, "message": <string>}
```

**Errors (specific)**

```json
{"type": "trans.resolve_needed", "data": {"users": <array string>}}
```

The `data.users` param is an array of conflicting usernames.

```json
{"type": "trans.validation_failed", "data": {"errors": <array of error>}}

error = {"paths": <array of string>, "message": <string>}
```

The `data.errors` param points to a keypath that is invalid.

</details>

<details>

<summary><mark style="color:green;"><code>get_trans_conflicts</code></mark></summary>

`get_trans_conflicts` - Gets the conflicts registered in a transaction.

**Params**

```json
{"th": <integer>}
```

**Result**

```json
{"conflicts:" <array of conflicts>}

conflict =
 {"keypath": <string>,
  "op": <"created" | "deleted" | "modified" | "value_set">,
  "value": <string>,
  "old": <string>}
```

The `value` param is only interesting if `op` is set to one of `created`, `modified` or `value_set`.

The `old` param is only interesting if `op` is set to `modified`.

</details>

<details>

<summary><mark style="color:green;"><code>resolve_trans</code></mark></summary>

`resolve_trans` - Tells the server that the conflicts have been resolved.

**Params**

```json
{"th": <integer>}
```

**Result**

```json
{}
```

</details>

### transaction - commit changes <a href="#methods-transaction-commit-changes" id="methods-transaction-commit-changes"></a>

<details>

<summary><mark style="color:green;"><code>validate_commit</code></mark></summary>

`validate_commit` - Validates a transaction before calling `commit`. If this method succeeds (with or without warnings) then the next operation must be a call to either `commit` or `clear_validate_lock`. The configuration will be locked for access by other users until one of these methods is called.

**Params**

```json
{"th": <integer>}
```

```json
{"comet_id": <string, optional>}
```

```json
{"handle": <string, optional>}
```

```json
{"details": <"normal" | "verbose" | "very_verbose" | "debug", optional>}
```

```json
{"debug": <array of string, optional>}
```

```json
{"debug_service_name": <string, optional>}
```

```json
{"debug_template_name": <string, optional>}
```

```json
{"flags": <flags, default: []>}
flags = <array of string or bitmask>
```

The `comet_id`, `handle`, and `details` params can be given together in order to get progress tracing for the `validate_commit` operation. The same `comet_id` can also be used to get the progress trace for any coming commit operations. In order to get progress tracing for commit operations, these three parameters have to be provided with the `validate_commit` operation. The `details` parameter specifies the verbosity of the progress trace. After the operation has been invoked, the `comet` method can be used to get the progress trace for the operation.

The `debug` param can be used the same way as the `details` param to get debug trace events for the validate\_commit and corresponding commit operation. These are the same trace events that can be displayed in the CLI with the "debug" pipe command for the commit operation. The `debug` param is an array with all debug flags for which debug events should be displayed. Valid values are "service", "template", "xpath", "kicker", and "subscriber". Any other values will result in "invalid params" error. The `debug` param can be used together with the `details` param to get both progress and debug trace events for the operation.

The `debug_service_name` and `debug_template_name` params can be used to specify a service or template name respectively for which to display debug events.

See the `commit` method for available flags.

**Note**: If you intend to pass `flags` to the `commit` method, it is recommended to pass the same `flags` to `validate_commit` since they may have an effect during the validate step.

**Result**

```json5
{}
```

Or:

```json
{"warnings": <array of warning>}

warning = {"paths": <array of string>, "message": <string>}
```

**Errors (specific)**

Same as for the `validate_trans` method.

</details>

<details>

<summary><mark style="color:green;"><code>clear_validate_lock</code></mark></summary>

`clear_validate_lock` - Releases validate lock taken by `validate_commit`.

**Params**

```json
{"th": <integer>}
```

**Result**

```json5
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>commit</code></mark></summary>

`commit` - Copies the configuration into the running datastore.

**Params**

```json
{"th": <integer>,
 "timeout": <integer, default: 0>,
 "release_locks": <boolean, default: true>,
 "rollback-id": <boolean, default: true>}
```

The commit with a `timeout` parameter represents a confirmed commit.

If `rollback-id` is set to `true`, the response will include the ID of the rollback file created during the commit if any.

Commit behavior can be changed via an extra `flags` param:

```json
{"flags": <flags, default: []>}

flags = <array of string or bitmask>
```

The `flags` param is a list of flags that can change the commit behavior:

* `dry-run=FORMAT` - Where FORMAT is the desired output format: `xml`, `cli`, or `native`. Validate and display the configuration changes but do not perform the actual commit. Neither CDB nor the devices are affected. Instead, the effects that would have taken place is shown in the returned output.
* `dry-run-reverse` - Used with the dry-run=native flag this will display the device commands for getting back to the current running state in the network if the commit is successfully executed. Beware that if any changes are done later on the same data the reverse device commands returned are invalid.
* `no-revision-drop` - NSO will not run its data model revision algorithm, which requires all participating managed devices to have all parts of the data models for all data contained in this transaction. Thus, this flag forces NSO to never silently drop any data set operations towards a device.
* `no-overwrite` - NSO will check that the modified data and the data read when computing the device modifications have not changed on the device compared to NSO's view of the data. Can't be used with no-out-of-sync-check.
* `no-networking` - Do not send data to the devices; this is a way to manipulate CDB in NSO without generating any southbound traffic.
* `no-out-of-sync-check` - Continue with the transaction even if NSO detects that a device's configuration is out of sync. It can't be used with no-overwrite.
* `no-deploy` - Commit without invoking the service create method, i.e., write the service instance data without activating the service(s). The service(s) can later be redeployed to write the changes of the service(s) to the network.
* `reconcile=OPTION` - Reconcile the service data. All data which existed before the service was created will now be owned by the service. When the service is removed that data will also be removed. In technical terms, the reference count will be decreased by one for everything that existed prior to the service. If manually configured data exists below in the configuration tree, that data is kept unless the option `discard-non-service-config` is used.
* `use-lsa` - Force handling of the LSA nodes as such. This flag tells NSO to propagate applicable commit flags and actions to the LSA nodes without applying them on the upper NSO node itself. The commit flags affected are `dry-run`, `no-networking`, `no-out-of-sync-check`, `no-overwrite` and `no-revision-drop`.
* `no-lsa` - Do not handle any of the LSA nodes as such. These nodes will be handled as any other device.
* `commit-queue=MODE` - Where MODE is: `async`, `sync`, or `bypass`. Commit the transaction data to the commit queue.
  * If the `async` value is set, the operation returns successfully if the transaction data has been successfully placed in the queue.
  * The `sync` value will cause the operation to not return until the transaction data has been sent to all devices, or a timeout occurs.
  * The `bypass` value means that if `/devices/global-settings/commit-queue/enabled-by-default` is `true`, the data in this transaction will bypass the commit queue. The data will be written directly to the devices.
* `commit-queue-atomic=ATOMIC` - Where `ATOMIC` is: `true` or `false`. Sets the atomic behavior of the resulting queue item. If `ATOMIC` is set to `false`, the devices contained in the resulting queue item can start executing if the same devices in other non-atomic queue items ahead of it in the queue are completed. If set to `true`, the atomic integrity of the queue item is preserved.
* `commit-queue-block-others` - The resulting queue item will block subsequent queue items, that use any of the devices in this queue item, from being queued.
* `commit-queue-lock` - Place a lock on the resulting queue item. The queue item will not be processed until it has been unlocked, see the actions `unlock` and `lock` in `/devices/commit-queue/queue-item`. No following queue items, using the same devices, will be allowed to execute as long as the lock is in place.
* `commit-queue-tag=TAG` - Where `TAG` is a user-defined opaque tag. The tag is present in all notifications and events sent referencing the specific queue item.
* `commit-queue-timeout=TIMEOUT` - Where `TIMEOUT` is infinity or a positive integer. Specifies a maximum number of seconds to wait for the transaction to be committed. If the timer expires, the transaction data is kept in the commit queue, and the operation returns successfully. If the timeout is not set, the operation waits until completion indefinitely.
* `commit-queue-error-option=OPTION` - Where `OPTION` is: `continue-on-error`, `rollback-on-error` or `stop-on-error`. Depending on the selected error option NSO will store the reverse of the original transaction to be able to undo the transaction changes and get back to the previous state. This data is stored in the `/devices/commit-queue/completed` tree from where it can be viewed and invoked with the `rollback` action. When invoked, the data will be removed.
  * The `continue-on-error` value means that the commit queue will continue on errors. No rollback data will be created.
  * The `rollback-on-error` value means that the commit queue item will roll back on errors. The commit queue will place a lock with `block-others` on the devices and services in the failed queue item. The `rollback` action will then automatically be invoked when the queue item has finished its execution. The lock is removed as part of the rollback.
  *   The `stop-on-error` means that the commit queue will place a lock with `block-others` on the devices and services in the failed queue item. The lock must then either manually be released when the error is fixed or the `rollback` action under `/devices/commit-queue/completed` be invoked.

      **Note**: Read about error recovery in [Commit Queue](../../../operation-and-usage/operations/nso-device-manager.md#user_guide.devicemanager.commit-queue) for a more detailed explanation.
* `trace-id=TRACE_ID` - Use the provided trace ID as part of the log messages emitted while processing. If no trace ID is given, NSO is going to generate and assign a trace ID to the processing.

For backward compatibility, the `flags` param can also be a bit mask with the following limit values:

* \``1 << 0`\` - Do not release locks, overridden by the `release_locks` if set.
* \``1 << 2`\` - Do not drop revision.
* If a call to `confirm_commit` is not done within `timeout` seconds an automatic rollback is performed. This method can also be used to "extend" a confirmed commit that is already in progress, i.e. set a new timeout or add changes.
* A call to `abort_commit` can be made to abort the confirmed commit.

**Note**: Must be preceded by a call to `validate_commit`_._

**Note**: The transaction handler is deallocated as a side effect of this method.

**Result**

Successful commit without any arguments.

```json5
{}
```

Successful commit with `rollback-id=true`:

```json
{"rollback-id": {"fixed": 10001}}
```

Successful commit with `commit-queue=async`:

```json
{"commit_queue_id": <integer>}
```

The `commit_queue_id` is returned if the commit entered the commit queue, either by specifying `commit-queue=async` or by enabling it in the configuration.

**Errors (specific)**

```json
{"type": "trans.confirmed_commit_in_progress"}
```

```json
{"type": "trans.confirmed_commit_is_only_valid_for_candidate"}
```

```json
{"type": "trans.confirmed_commit_needs_config_writable_through_candidate"}
```

```json
{"type": "trans.confirmed_commit_not_supported_in_private_mode"}
```

</details>

<details>

<summary><mark style="color:green;"><code>abort_commit</code></mark></summary>

`abort_commit` - Aborts the active read-write transaction.

**Result**

```json
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>confirm_commit</code></mark></summary>

`confirm_commit` - Confirms the currently pending confirmed commit

**Result**

```json
{}
```

</details>

### transaction - webui <a href="#methods-transaction-webui" id="methods-transaction-webui"></a>

<details>

<summary><mark style="color:green;"><code>get_webui_trans</code></mark></summary>

`get_webui_trans` - Gets the WebUI read-write transaction.

**Result**

```json
{"trans": <array of trans>}

trans =
 {"db": <"startup" | "running" | "candidate", default: "running">,
  "conf_mode": <"private" | "shared" | "exclusive", default: "private">,
  "th": <integer>
 }
```

</details>

<details>

<summary><mark style="color:green;"><code>new_webui_trans</code></mark></summary>

`new_webui_trans` - Creates a read-write transaction that can be retrieved by `get_webui_trans`.

**Params**

```json
{"db": <"startup" | "running" | "candidate", default: "running">,
 "conf_mode": <"private" | "shared" | "exclusive", default: "private">
 "on_pending_changes": <"reuse" | "reject" | "discard", default: "reuse">}
```

See `new_trans` for the semantics of the parameters and specific errors.

The `on_pending_changes` param decides what to do if the candidate already has been written to, e.g. a CLI user has started a shared configuration session and changed a value in the configuration (without committing it). If this parameter is omitted, the default behavior is to silently reuse the candidate. If `reject` is specified, the call to the `new_webui_trans` method will fail if the candidate is non-empty. If `discard` is specified, the candidate is silently cleared if it is non-empty.

**Result**

```json
{"th": <integer>}
```

A new transaction handler ID.

</details>

### NSO specific <a href="#methods-nso-specific" id="methods-nso-specific"></a>

<details>

<summary><mark style="color:green;"><code>get_template_variables</code></mark></summary>

`get_template_variables` - Extracts all variables from an NSO service/device template.

**Params**

```json
{"th": <integer>,
 "name": <string>}
```

The `name` param is the name of the template to extract variables from.

**Result**

```json
{"template_variables": <array of string>}
```

</details>

<details>

<summary><mark style="color:green;"><code>list_packages</code></mark></summary>

`list_packages` - Lists packages in NSO.

**Params**

```json
{"status": <"installable" | "installed" | "loaded" | "all", default: "all">}
```

The `status` param specifies which package status to list:

* `installable` - an array of all packages that can be installed.
* `installed` - an array of all packages that are installed, but not loaded.
* `loaded` - an array of all loaded packages.
* `all` - all of the above is returned.

**Result**

```json
{"packages": <array of key-value objects>}
```

</details>

<details>

<summary><mark style="color:green;"><code>get_service_points</code></mark></summary>

`get_service_points` - List all service points. To be able to get the description part of the response the fxs files needs to be compiled with the flag "--include-doc".

**Result**

```json
{"description": <string of tailf:info or description of the list/presence container>,
 "keys": <if the path is to a list, an array of strings of the lists keys>,
 "path": <a keypath to the service point>}
```

</details>

<details>

<summary><mark style="color:green;"><code>apply</code></mark></summary>

`apply` - Performs validate, prepare and commit/abort in one go.

**Params**

```json
{"th": <integer>, "flags": <flags>}
```

See the `commit` method for available flags.

**Result**

See result for method `commit`.

</details>
