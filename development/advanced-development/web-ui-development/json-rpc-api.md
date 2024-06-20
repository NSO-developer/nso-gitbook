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

```json5
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

```json5
{} |
                {"warnings": <array of strings>}
```

**Errors (specific)**

```json5
{"type": "data.already_exists"}
{"type": "data.not_found"}
{"type": "data.not_writable"}
{"type": "db.locked"}
```

**Example**

{% code title="Example: Method set_value" %}
```json5
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

<summary>deref</summary>

Dereferences a leaf with a leafref type

**Params**

```
{"th": <integer>,
 "path": <string>,
 "result_as": <"paths" | "target" | "list-target", default: "paths">}
```

The _path_ param is a keypath pointing to a leaf with a leafref type.

**Result**

```
{"paths": <array of string, a keypath to a leaf>}
```

```
{"target": <a keypath to a leaf>}
```

```
{"list-target": <a keypath to a list>}
```

</details>

<details>

<summary>get_leafref_values</summary>

Gets all possible values for a leaf with a leafref type

**Params**

```
{"th": <integer>,
 "path": <string>,
 "offset": <integer, default: 0>,
 "limit": <integer, default: -1>,
 "starts_with": <string, optional>,
 "skip_grouping": <boolean, default: false>,
 "keys": <object>}
```

The _th_ param is as returned from a call to _new\_read\_trans_ or _new\_write\_trans_. The _path_ param is a keypath pointing to a leaf with a leafref type. _Note_: If the leafref is within an action or rpc, _th_ should be created with an _action\_path_.

The _offset_ param is used to skip as many values as it is set to. E.g. an _offset_ of 2 will skip the first 2 values. If not given the value defaults to '0', which means no values are skipped. Offset needs to be a non-negative integer or an "invalid params" error will be returned. An offset that is bigger than the length of the leafref list will result in an "method failed" error being returned.

_NOTE_: _offset_ used together with _limit_ (see below) can be used repeatedly to paginate the leafref values.

The _limit_ param can be set to limit the number of returned values. E.g. a limit of 5 will return a list with 5 values. If not given the value defaults to '-1', which means no limit. Limit needs to be -1 or a non-negative integer or an "invalid params" error will be returned. A Limit of 0 will result in an empty list being returned

The _starts\_with_ param can be used to filter values by prefix.

The _skip\_grouping_ param is by default set to false and is only needed to be set to true if if a set of sibling leafref leafs points to a list instance with multiple keys _and_ if _get\_leafref\_values_ should return an array of possible leaf values instead an array of arrays with possible key value combinations.

The _keys_ param is an optional array of values that should be set if a more than one leafref statement is used within action/rpc input parameters _and_ if they refer to each other using \`deref()\` or \`current()\` XPath functions. For example consider this model:

<pre><code><strong>  rpc create-service {
</strong><strong>    tailf:exec "./run.sh";
</strong><strong>    input {
</strong><strong>      leaf name {
</strong><strong>        type leafref {
</strong><strong>          path "/myservices/service/name";
</strong>        }
      }
<strong>      leaf if {
</strong><strong>        type leafref {
</strong><strong>          path "/myservices/service[name=current()/../name]/interfaces/name"
</strong>        }
      }
    }
<strong>    output {
</strong><strong>      leaf result { type string; }
</strong>    }
  }
</code></pre>

The leaf _if_ refers to leaf _name_ in its XPath expression so to be able to successfully run _get\_leafref\_values_ on that node you need to provide a valid value for the _name_ leaf using the _keys_ parameter. The _keys_ parameter could for example look like this:

```
{"/create-service/name": "service1"}
```

**Result**

```
{"values": <array of string>,
 "source": <string> | false}
```

The _source_ param will point to the keypath where the values originate. If the keypath cannot be resolved due to missing/faulty items in the _keys_ parameter _source_ will be _false_.

</details>

### data - lists <a href="#methods-data-lists" id="methods-data-lists"></a>

<details>

<summary>rename_list_entry</summary>



Renames a list entry.

**Params**

```
{"th": <integer>,
 "from_path": <string>,
 "to_keys": <array of string>}
```

The _from\_path_ is a keypath pointing out the list entry to be renamed.

The list entry to be renamed will, under the hood, be deleted all together and then recreated with the content from the deleted list entry copied in.

The _to\_keys_ param is an array with the new key values. The array must contain a full set of key values.

**Result**

```
{}
```

**Errors (specific)**

```
{"type": "data.already_exists"}
{"type": "data.not_found"}
{"type": "data.not_writable"}
```

</details>

<details>

<summary>copy_list_entry</summary>



Copies a list entry.

**Params**

```
{"th": <integer>,
 "from_path": <string>,
 "to_keys": <array of string>}
```

The _from\_path_ is a keypath pointing out the list entry to be copied.

The _to\_keys_ param is an array with the new key values. The array must contain a full set of key values.

Copying between different ned-id versions works as long as the schema nodes being copied has not changed between the versions.

**Result**

```
{}
```

**Errors (specific)**

```
{"type": "data.already_exists"}
{"type": "data.not_found"}
{"type": "data.not_writable"}
```

</details>

<details>

<summary>move_list_entry</summary>



Moves an ordered-by user list entry relative to its siblings.

**Params**

```
{"th": <integer>,
 "from_path": <string>,
 "to_path": <string>,
 "mode": <"first" | "last" | "before" | "after">}
```

The _from\_path_ is a keypath pointing out the list entry to be moved.

The list entry to be moved can either be moved to the first or the last position, i.e. if the _mode_ param is set to _first_ or _last_ the _to\_path_ keypath param has no meaning.

If the _mode_ param is set to _before_ or _after_ the _to\_path_ param must be specified, i.e. the list entry will be moved to the position before or after the list entry which the _to\_path_ keypath param points to.

**Result**

```
{}
```

**Errors (specific)**

```
{"type": "db.locked"}
```

</details>

<details>

<summary>append_list_entry</summary>



Append a list entry to a leaf-list.

**Params**

```
{"th": <integer>,
 "path": <string>,
 "value": <string>}
```

The _path_ is a keypath pointing to a leaf-list.

**Result**

```
{}
```

</details>

<details>

<summary>count_list_keys</summary>



Counts the number of keys in a list.

**Params**

```
{"th": <integer>
 "path": <string>}
```

The _path_ parameter is a keypath pointing to a list.

**Result**

```
{"count": <integer>}
```

</details>

<details>

<summary>get_list_keys</summary>

Enumerates keys in a list.

**Params**

```
{"th": <integer>,
 "path": <string>,
 "chunk_size": <integer greater than zero, optional>,
 "start_with": <array of string, optional>,
 "lh": <integer, optional>,
 "empty_list_key_as_null": <boolean, optional>}
```

The _th_ parameter is the transaction handle.

The _path_ parameter is a keypath pointing to a list. Required on first invocation - optional in following.

The _chunk\_size_ parameter is the number of requested keys in the result. Optional - default is unlimited.

The _start\_with_ parameter will be used to filter out all those keys that do not start with the provided strings. The parameter supports multiple keys e.g. if the list has two keys, then _start\_with_ can hold two items.

The _lh_ (list handle) parameter is optional (on the first invocation) but must be used in following invocations.

The _empty\_list\_key\_as\_null_ parameter controls whether list keys of type empty are represented as the name of the list key (default) or as \`\[null]\`.

**Result**

```
{"keys": <array of array of string>,
 "total_count": <integer>,
 "lh": <integer, optional>}
```

Each invocation of _get\_list\_keys_ will return at most _chunk\_size_ keys. The returned _lh_ must be used in following invocations to retrieve next chunk of keys. When no more keys are available the returned _lh_ will be set to \`-1\`.

On the first invocation _lh_ can either be omitted or set to \`-1\`.

</details>

### data - query <a href="#methods-data-query" id="methods-data-query"></a>

<details>

<summary>query</summary>

Starts a new query attached to a transaction handle, retrieves the results, and stops the query immediately. This is a convenience method for calling _start\_query_, _run\_query_ and _stop\_query_ in a one-time sequence.

This method should not be used for paginated results, as it results in performance degradation - use _start\_query_, multiple _run\_query_and _stop\_query_instead.

**Example**

Example 3. Method query

```
curl \
    --cookie "sessionid=sess11635875109111642;" \
    -X POST \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "query",
         "params": {"th": 1,
                    "xpath_expr": "/dhcp:dhcp/dhcp:foo",
                    "result_as": "keypath-value"}}' \
    http://127.0.0.1:8008/jsonrpc
```

```
{"jsonrpc": "2.0",
 "id": 1,
 "result":
 {"current_position": 2,
  "total_number_of_results": 4,
  "number_of_results": 2,
  "number_of_elements_per_result": 2,
  "results": ["foo", "bar"]}}
```

</details>

<details>

<summary>start_query</summary>

Starts a new query attached to a transaction handle. On success a query handle is returned to be in subsequent calls to _run\_query_.

**Params**

```
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

The _xpath\_expr_ param is the primary XPath expression to base the query on. Alternatively, one can give a keypath as the _path_ param, and internally the keypath will be translated into an XPath expression.

A query is a way of evaluating an XPath expression and returning the results in chunks. The primary XPath expression must evaluate to a node-set, i.e. the result. For each node in the result a _selection_ Xpath expression is evaluated with the result node as its context node.

_Note_: The terminology used here is as defined in http://en.wikipedia.org/wiki/XPath.

For example, given this YANG snippet:

```
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

The _xpath\_expr_ could be \`/interface\[enabled='true']\` and _selection_ could be \`{ "name", "number" }\`.

Note that the _selection_ expressions must be valid XPath expressions, e.g. to figure out the name of an interface and whether its number is even or not, the expressions must look like: \`{ "name", "(number mod 2) == 0" }\`.

The result are then fetched using _run\_query_, which returns the result on the format specified by _result\_as_ param.

There are two different types of result:

* _string_ result is just an array with resulting strings of evaluating the _selection_ XPath expressions
* \`keypath-value\` result is an array the keypaths or values of the node that the _selection_ XPath expression evaluates to.

This means that care must be taken so that the combination of _selection_ expressions and return types actually yield sensible results (for example \`1 + 2\` is a valid _selection_ XPath expression, and would result in the string _3_ when setting the result type to _string_ - but it is not a node, and thus have no keypath-value.

It is possible to sort the result using the built-in XPath function \`sort-by()\` but it is also also possible to sort the result using expressions specified by the _sort_ param. These expressions will be used to construct a temporary index which will live as long as the query is active. For example to start a query sorting first on the enabled leaf, and then on number one would call:

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

The _context\_node_ param is a keypath pointing out the node to apply the query on; only taken into account when the _xpath\_expr_ uses relatives paths. Lack of a _context\_node_, turns relatives paths into absolute paths.

The _chunk\_size_ param specifies how many result entries to return at a time. If set to 0 a default number will be used.

The _initial\_offset_ param is the result entry to begin with (1 means to start from the beginning).

**Result**

```
{"qh": <integer>}
```

A new query handler handler id to be used when calling _run\_query_ etc

**Example**

Example 4. Method start\_query

```
curl \
    --cookie "sessionid=sess11635875109111642;" \
    -X POST \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "start_query",
         "params": {"th": 1,
                    "xpath_expr": "/dhcp:dhcp/dhcp:foo",
                    "result_as": "keypath-value"}}' \
    http://127.0.0.1:8008/jsonrpc
```

```
{"jsonrpc": "2.0",
 "id": 1,
 "result": 47}
```

\


</details>

<details>

<summary>run_query</summary>



Retrieves the result to a query (as chunks). For more details on queries please read the description of "start\_query".

**Params**

```
{"qh": <integer>}
```

The _qh_ param is as returned from a call to "start\_query".

**Result**

```
{"position": <integer>,
 "total_number_of_results": <integer>,
 "number_of_results": <integer>,
 "chunk_size": <integer greater than zero, optional>,
 "result_as": <"string" | "keypath-value" | "leaf_value_as_string">,
 "results": <array of result>}

result = <string> |
         {"keypath": <string>, "value": <string>}
```

The _position_ param is the number of the first result entry in this chunk, i.e. for the first chunk it will be 1.

How many result entries there are in this chunk is indicated by the _number\_of\_results_ param. It will be 0 for the last chunk.

The _chunk\_size_ and the _result\_as_ properties are as given in the call to _start\_query_.

The _total\_number\_of\_results_ param is total number of result entries retrieved so far.

The _result_ param is as described in the description of _start\_query_.

**Example**

Example 5. Method run\_query

```
curl \
    --cookie "sessionid=sess11635875109111642;" \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "run_query",
         "params": {"qh": 22}}' \
    http://127.0.0.1:8008/jsonrpc
```

```
{"jsonrpc": "2.0",
 "id": 1,
 "result":
 {"current_position": 2,
  "total_number_of_results": 4,
  "number_of_results": 2,
  "number_of_elements_per_result": 2,
  "results": ["foo", "bar"]}}
```

</details>

<details>

<summary>reset_query</summary>



Reset/rewind a running query so that it starts from the beginning again. Next call to "run\_query" will then return the first chunk of result entries.

**Params**

```
{"qh": <integer>}
```

The _qh_ param is as returned from a call to _start\_query_.

**Result**

```
{}
```

**Example**

Example 6. Method reset\_query

```
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "reset_query",
         "params": {"qh": 67}}' \
    http://127.0.0.1:8008/jsonrpc
```

```
{"jsonrpc": "2.0",
 "id": 1,
 "result": true}
```

</details>

<details>

<summary>stop_query</summary>



Stops the running query identified by query handler. If a query is not explicitly closed using this call it will be cleaned up when the transaction the query is linked to ends.

**Params**

```
{"qh": <integer>}
```

The _qh_ param is as returned from a call to "start\_query".

**Result**

```
{}
```

**Example**

Example 7. Method stop\_query

```
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "stop_query",
         "params": {"qh": 67}}' \
    http://127.0.0.1:8008/jsonrpc
```

```
{"jsonrpc": "2.0",
 "id": 1,
 "result": true}
```

</details>

### database <a href="#methods-database" id="methods-database"></a>

<details>

<summary>reset_candidate_db</summary>



Resets the candidate datastore

**Result**

```
{}
```

</details>

<details>

<summary>lock_db</summary>

Takes a database lock

**Params**

```
{"db": <"startup" | "running" | "candidate">}
```

The _db_ param specifies which datastore to lock.

**Result**

```
{}
```

**Errors (specific)**

```
{"type": "db.locked", "data": {"sessions": <array of string>}}
```

The \`data.sessions\` param is an array of strings describing the current sessions of the locking user, e.g. an array of "admin tcp (cli from 192.245.2.3) on since 2006-12-20 14:50:30 exclusive".

</details>

<details>

<summary>unlock_db</summary>



Releases a database lock

**Params**

```
{"db": <"startup" | "running" | "candidate">}
```

The _db_ param specifies which datastore to unlock.

**Result**

```
{}
```

</details>

<details>

<summary>copy_running_to_startup_db</summary>



Copies the running datastore to the startup datastore

**Result**

```
{}
```

</details>

### general <a href="#methods-general" id="methods-general"></a>

<details>

<summary>comet</summary>

Listens on a comet channel, i.e. all asynchronous messages from batch commands started by calls to _start\_cmd_, _subscribe\_cdboper_, _subscribe\_changes_, _subscribe\_messages_, _subscribe\_poll\_leaf_ or _subscribe\_upgrade_ ends up on the comet channel.

You are expected to have a continuous long polling call to the _comet_ method at any given time. As soon as the browser or server closes the socket, due to browser or server connect timeout, the _comet_ method should be called again.

As soon as the _comet_ method returns with values they should be dispatched and the _comet_ method should be called again.

**Params**

```
{"comet_id": <string>}
```

**Result**

```
[{"handle": <integer>,
  "message": <a context specific json object, see example below>},
 ...]
```

**Errors (specific)**

```
{"type": "comet.duplicated_channel"}
```

**Example**

Example 8. Method comet

```
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "subscribe_changes",
         "params": {"comet_id": "main",
                    "path": "/dhcp:dhcp"}}' \
    http://127.0.0.1:8008/jsonrpc
```

```
{"jsonrpc": "2.0",
 "id": 1,
 "result": {"handle": "2"}}
```

```
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", "id": 1,
         "method": "batch_init_done",
         "params": {"handle": "2"}}' \
    http://127.0.0.1:8008/jsonrpc
```

```
{"jsonrpc": "2.0",
 "id": 1,
 "result": {}}
```

```
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

hangs... and finally...

```
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

In this case the admin user seems to have set \`/dhcp:dhcp/default-lease-time\` to _100_.

</details>

<details>

<summary>get_system_setting</summary>

Extracts system settings such as capabilities, supported datastores, etc.

**Params**

```
{"operation": <"capabilities" | "customizations" | "models" | "user" | "version" | "all" | "namespaces", default: "all">}
```

The _operation_ param specifies which system setting to get:

* _capabilities_ - the server-side settings are returned, e.g. is rollback and confirmed commit supported
* _customizations_ - an array of all webui customizations
* _models_ - an array of all loaded YANG modules are returned, i.e. prefix, namespace, name
* _user_ - the username of the currently logged in user is returned
* _version_ - the system version
* _all_ - all of the above is returned.
* (DEPRECATED) _namespaces_ - an object of all loaded YANG modules are returned, i.e. prefix to namespace

**Result**

```
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

The above is the result if using the _all_ operation.

</details>

<details>

<summary>abort</summary>



Abort a JSON-RPC method by its associated id.

**Params**

```
{"id": <integer>}
```

The _id_ param is the id of the JSON-RPC method to be aborted.

**Result**

```
{}
```

</details>

<details>

<summary>eval_XPath</summary>



Evaluates an xpath expression on the server side

**Params**

```
{"th": <integer>,
 "xpath_expr": <string>}
```

The _xpath\_expr_ param is the XPath expression to be evaluated.

**Result**

```
{"value": <string>}
```

</details>

### messages <a href="#methods-messages" id="methods-messages"></a>

<details>

<summary>send_message</summary>



Sends a message to another user in the CLI or Web UI

**Params**

```
{"to": <string>,
 "message": <string>}
```

The _to_ param is the user name of the user to send the message to and the _message_ param is the actual message.

_NOTE_: The username "all" will broadcast the message to all users.

**Result**

```
{}
```

</details>

<details>

<summary>subscribe_messages</summary>



Starts a subscriber to messages.

_NOTE_: the _start\_subscription_ method must be called to actually get the subscription to generate any messages, unless the _handle_ is provided as input.

_NOTE_: the _unsubscribe_ method should be used to end the subscription.

_NOTE_: As soon as a subscription message is generated it will be sent as a message and turn up as result to your polling call to the _comet_ method.

**Params**

```
{"comet_id": <string>,
 "handle": <string, optional>}
```

**Result**

```
<string>
```

A handle to the subscription is returned (equal to _handle_ if provided).

Subscription messages will end up in the _comet_ method and the format of these messages depend on what has happened.

When a new user has logged in:

```
{"new_user": <integer, a session id to be used by "kick_user">
 "me": <boolean, is it myself?>
 "user": <string>,
 "proto": <"ssh" | "tcp" | "console" | "http" | "https" | "system">,
 "ctx": <"cli" | "webui" | "netconf">
 "ip": <string, user's ip-address>,
 "login": <string, login timestamp>}
```

When a user logs out:

```
{"del_user": <integer, a session id>,
 "user": <string>}
```

When receiving a message:

```
{"sender": <string>,
 "message": <string>}
```

</details>

### rollbacks <a href="#methods-rollbacks" id="methods-rollbacks"></a>

<details>

<summary>get_rollbacks</summary>

Lists all available rollback files

**Result**

```
{"rollbacks": <array of rollback>}

rollback =
 {"nr": <integer>,
  "creator": <string>,
  "date": <string>,
  "via": <"system" | "cli" | "webui" | "netconf">,
  "comment": <string>,
  "label": <string>}
```

The _nr_ param is a rollback number to be used in calls to _load\_rollback_ etc.

The _creator_ and _date_ properties identify the name of the user responsible for committing the configuration stored in the rollback file and when it happened.

The _via_ param identifies the interface that was used to create the rollback file.

The _label_ and _comment_ properties is as given calling the methods _set\_comment_ and _set\_label_ on the transaction.

</details>

<details>

<summary>get_rollback</summary>



Gets the content of a specific rollback file. The rollback format is as defined in a curly bracket format as defined in the CLI.

**Params**

```
{"nr": <integer>}
```

**Result**

```
<string, rollback file in curly bracket format>
```

</details>

<details>

<summary>install_rollback</summary>



Installs a specific rollback file into a new transaction and commits it. The configuration is restored to the one stored in the rollback file and no further operations are needed. It is the equivalent of creating a new private write private transaction handler with _new\_write\_trans_, followed by calls to the methods _load\_rollback_, _validate\_commit_ and _commit_.

#### Note

If the permission to rollback is denied on some nodes, the 'warnings' array in the result will contain a warning 'Some changes could not be applied due to NACM rules prohibiting access.'. The _install\_rollback_ will still rollback as much as is allowed by the rules. See "The AAA infrastructure" chapter in this User Guide for more information about permissions and authorization.

**Params**

```
{"nr": <integer>}
```

**Result**

```
{}
```

</details>

<details>

<summary>load_rollback</summary>



Rolls back within an existing transaction, starting with the latest rollback file, down to a specified rollback file, or selecting only the specified rollback file (also known as "selective rollback").

#### Note

If the permission to rollback is denied on some nodes, the 'warnings' array in the result will contain a warning 'Some changes could not be applied due to NACM rules prohibiting access.'. The _load\_rollback_ will still rollback as much as is allowed by the rules. See "The AAA infrastructure" chapter in this User Guide for more information about permissions and authorization.

**Params**

```
{"th": <integer>,
 "nr": <integer>,
 "path": <string>,
 "selective": <boolean, default: false>}
```

The _nr_ param is a rollback number returned by _get\_rollbacks_.

The _path_ param is a keypath that restrict the rollback to be applied only to a subtree.

The _selective_ param, false by default, can restrict the rollback process to use only the rollback specified by _nr_, rather than applying all known rollbacks files starting with the latest down to the one specified by _nr_.

**Result**

```
{}
```

</details>

### schema <a href="#methods-schema" id="methods-schema"></a>

<details>

<summary>get_description</summary>



Get description. To be able to get the description in the response the fxs file need to be compiled with the flag "--include-doc". This operation can be heavy so instead of calling get\_description directly, we can confirm that there is a description before calling in "CS\_HAS\_DESCR" flag that we get from "get\_schema" response.

**Params**

```
{"th": <integer>,
 "path": <string, optional>
```

A _path_ is a tagpath/keypath pointing into a specific sub-tree of a YANG module.

**Result**

```
{"description": <string>}
```

</details>

<details>

<summary>get_schema</summary>

Exports a JSON schema for a selected part (or all) of a specific YANG module (with optional instance data inserted)

**Params**

```
{"th": <integer>,
 "namespace": <string, optional>,
 "path": <string, optional>,
 "levels": <integer, default: -1>,
 "insert_values": <boolean, default: false>,
 "evaluate_when_entries": <boolean, default: false>,
 "stop_on_list": <boolean, default: false>,
 "cdm_namespace": <boolean, default: false>}
```

One of the properties _namespace_ or _path_ must be specified.

A _namespace_ is as specified in a YANG module.

A _path_ is a tagpath/keypath pointing into a specific sub-tree of a YANG module.

The _levels_ param limits the maximum depth of containers and lists from which a JSON schema should be produced (-1 means unlimited depth).

The _insert\_values_ param signals that instance data for leafs should be inserted into the schema. This way the need for explicit forthcoming calls to _get\_elem_ are avoided.

The _evaluate\_when\_entries_ param signals that schema entries should be included in the schema even though their "when" or "tailf:display-when" statements evaluate to false, i.e. instead a boolean _evaluated\_when\_entry_ param is added to these schema entries.

The _stop\_on\_list_ param limits the schema generation to one level under the list when true.

The _cdm\_namespace_ param signals inclusion of cdm-namespace entries where appropriate.

**Result**

```
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

The _meta_ param contains meta-information about the YANG module such as namespace and prefix but it also contains type stack information for each type used in the YANG module represented in the _data_ param. Together with the _meta_ param, the _data_ param constitutes a complete YANG module in JSON format.

**Example**

Example 9. Method get\_schema

```
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
```

```
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

\


</details>

<details>

<summary>hide_schema</summary>



Hides data which has been adorned with a "hidden" statement in YANG modules. "hidden" statements is an extension defined in the tail-common YANG module (http://tail-f.com/yang/common).

**Params**

```
{"th": <integer>,
 "group_name": <string>
```

The _group\_name_ param is as defined by a "hidden" statement in a YANG module.

**Result**

```
{}
```

</details>

<details>

<summary>unhide_schema</summary>



Unhides data which has been adorned with a "hidden" statement in YANG modules. "hidden" statements is an extension defined in the tail-common YANG module (http://tail-f.com/yang/common).

**Params**

```
{"th": <integer>,
 "group_name": <string>,
 "passwd": <string>}
```

The _group\_name_ param is as defined by a "hidden" statement in a YANG module.

The _passwd_ param is a password needed to hide the data that has been adorned with a "hidden" statement. The password is as defined in the ncs.conf file.

**Result**

```
{}
```

</details>

<details>

<summary>get_module_prefix_map</summary>

Returns a map from module name to module prefix.

**Params**

Method takes no parameters.

**Result**

```
<key-value object>

result = {"module-name": "module-prefix"}
```

**Example**

Example 10. Method get\_module\_prefix\_map

```
curl \
    --cookie 'sessionid=sess12541119146799620192;' \
    -X POST \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc": "2.0", id: 1,
         "method": "get_module_prefix_map",
         "params": {}}' \
    http://127.0.0.1:8008/jsonrpc
```

```
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

\


</details>

<details>

<summary>run_action</summary>



Invokes an action or rpc defined in a YANG module.

**Params**

```
{"th": <integer>,
 "path": <string>,
 "params": <json, optional>
 "format": <"normal" | "bracket" | "json", default: "normal">,
 "comet_id": <string, optional>,
 "handle": <string, optional>,
 "details": <"normal" | "verbose" | "very_verbose" | "debug", optional>}
```

Actions are as specified in th YANG module, i.e. having a specific name and a well defined set of parameters and result. the _path_ param is a keypath pointing to an action or rpc in and the _params_ param is a JSON object with action parameters.

The _format_ param defines if the result should be an array of key values or a pre-formatted string on bracket format as seen in the CLI. The result is also as specified by the YANG module.

Both a _comet\_id_ and _handle_ need to be provided in order to receive notifications.

The _details_ param can be given together with _comet\_id_ and _handle_ in order to get progress trace for the action. _details_ specifies the verbosity of the progress trace. After the action has been invoked, the _comet_ method can be used to get the progress trace for the action. If the _details_ param is omitted progress trace will be disabled.

_NOTE_ This method is often used to call an action that uploads binary data (e.g. images) and retrieving them at a later time. While retrieval is not a problem, uploading is a problem, because JSON-RPC request payloads have a size limitation (e.g. 64 kB). The limitation is needed for performance concerns because the payload is first buffered, before the JSON string is parsed and the request is evaluated. When you have scenarios that need binary uploads, please use the CGI functionality instead which has a size limitation that can be configured, and which is not limited to JSON payloads, so one can use streaming techniques.

**Result**

```
<string | array of result | key-value object>

result = {"name": <string>, "value": <string>}
```

**Errors (specific)**

```
{"type": "action.invalid_result", "data": {"path": <string, path to invalid result>}}
```

**Example**

Example 11. Method run\_action

```
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
```

```
{"jsonrpc": "2.0",
 "id": 1,
 "result": [{"name":"systemClock", "value":"0000-00-00T03:00:00+00:00"},
            {"name":"inlineContainer/bar", "value":"false"},
            {"name":"hardwareClock","value":"0000-00-00T04:00:00+00:00"}]}
```

```
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
```

```
{"jsonrpc": "2.0",
 "id": 1,
 "result": "systemClock 0000-00-00T03:00:00+00:00\ninlineContainer  {\n    \
                    bar false\n}\nhardwareClock 0000-00-00T04:00:00+00:00\n"}
```

```
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
```

```
{"jsonrpc": "2.0",
 "id": 1,
 "result": {"systemClock": "0000-00-00T03:00:00+00:00",
            "inlineContainer": {"bar": false},
            "hardwareClock": "0000-00-00T04:00:00+00:00"}}
```

</details>

### session <a href="#methods-session" id="methods-session"></a>



<details>

<summary></summary>



</details>

<details>

<summary></summary>



</details>

<details>

<summary></summary>



</details>

<details>

<summary></summary>



</details>
