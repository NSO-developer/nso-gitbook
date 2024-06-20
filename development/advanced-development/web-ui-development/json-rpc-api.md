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

You can read more about the command rules in [AAA infrastructure](../../../administration/management/aaa-infrastructure.md).

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

```json
{"handle": <string>}
```

A handle to the batch command is returned (equal to `handle` if provided).

</details>

<details>

<summary><mark style="color:green;"><code>send_cmd_data</code></mark></summary>

Sends data to batch command started with `init_cmd`_._

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

Signals that a batch command can start to generate output.

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

Suspends output from a batch command.

**Note**: the `init_cmd` method must have been called with the `emulate` param set to true for this to work

**Params**

```json
{"handle": <string>}
```

The `handle` param is as returned from a call to `init_cmd`.

**Result**

```
{}
```

</details>

<details>

<summary><mark style="color:green;"><code>resume_cmd</code></mark></summary>

Resumes a batch command started with `init_cmd`_._

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

Stops a batch command.

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

Get a list of the session's subscriptions.

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

Starts a subscriber to operational data in CDB. Changes done to configuration data will not be seen here.

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

Starts a subscriber to configuration data in CDB. Changes done to operational data in CDB data will not be seen here. Furthermore, subscription messages will only be generated when a transaction is successfully committed.

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

Starts a polling subscriber to any type of operational and configuration data (outside of CDB as well).

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

Subscription messages will end up in the `comet` method and the format of is a simple string value.

</details>

<details>

<summary><mark style="color:green;"><code>subscribe_upgrade</code></mark></summary>

Starts a subscriber to upgrade messages.

**Note**: The `start_subscription` method must be called to actually get the subscription to generate any messages, unless the `handle` is provided as input.

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

Starts a subscriber to JSONRPC messages for batch requests.

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
```

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

</details>

<details>

<summary><mark style="color:green;"><code>subscribe_progress_trace</code></mark></summary>

Starts a subscriber to progress trace events.

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

Signals that a subscribe command can start to generate output.

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

Stops a subscriber.

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

### Data

<details>

<summary><mark style="color:green;"><code>create</code></mark></summary>

Create a list entry, a presence container, or a leaf of type empty (unless in a union, then use `set_value`).

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

Deletes an existing list entry, a presence container, or an optional leaf and all its children (if any).

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

Checks if optional data exists.

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

Get the case of a choice leaf.

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

Retrieves configuration and operational data from the provided transaction

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

Load XML configuration into the current transaction.

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

Get node attributes.

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

<summary><mark style="color:green;">set_attrs</mark></summary>

Set node attributes.

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

<summary><mark style="color:green;">get_value</mark></summary>

Gets a leaf value.

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
```json
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

Get leaf values.

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

Sets a leaf value.

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
```json
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
