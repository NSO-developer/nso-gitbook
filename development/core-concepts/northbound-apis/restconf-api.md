---
description: Description of the RESTCONF API.
---

# RESTCONF API

RESTCONF is an HTTP-based protocol as defined in [RFC 8040](https://www.ietf.org/rfc/rfc8040.txt). RESTCONF standardizes a mechanism to allow Web applications to access the configuration data, state data, data-model-specific Remote Procedure Call (RPC) operations, and event notifications within a networking device.

RESTCONF uses HTTP methods to provide Create, Read, Update, Delete (CRUD) operations on a conceptual datastore containing YANG-defined data, which is compatible with a server that implements NETCONF datastores as defined in [RFC 6241](https://www.ietf.org/rfc/rfc6241.txt).

Configuration data and state data are exposed as resources that can be retrieved with the GET method. Resources representing configuration data can be modified with the DELETE, PATCH, POST, and PUT methods. Data is encoded with either XML ([W3C.REC-xml-20081126](https://www.w3.org/TR/2008/REC-xml-20081126)) or JSON ([RFC 7951](https://www.ietf.org/rfc/rfc7951.txt)).

This section describes the NSO implementation and extension to or deviation from [RFC 8040](https://www.ietf.org/rfc/rfc8040.txt) respectively.

As of this writing, the server supports the following specifications:

* [RFC 6020](https://www.ietf.org/rfc/rfc6020.txt) - YANG - A Data Modeling Language for the Network Configuration Protocol (NETCONF)
* [RFC 6021](https://www.ietf.org/rfc/rfc6021.txt) - Common YANG Data Types
* [RFC 6470](https://www.ietf.org/rfc/rfc6470.txt) - NETCONF Base Notifications
* [RFC 6536](https://www.ietf.org/rfc/rfc6536.txt) - NETCONF Access Control Model
* [RFC 6991](https://www.ietf.org/rfc/rfc6991.txt) - Common YANG Data Types
* [RFC 7950](https://www.ietf.org/rfc/rfc7950.txt) - The YANG 1.1 Data Modeling Language
* [RFC 7951](https://www.ietf.org/rfc/rfc7951.txt) - JSON Encoding of Data Modeled with YANG
* [RFC 7952](https://www.ietf.org/rfc/rfc7952.txt) - Defining and Using Metadata with YANG
* [RFC 8040](https://www.ietf.org/rfc/rfc8040.txt) - RESTCONF Protocol
* [RFC 8072](https://www.ietf.org/rfc/rfc8072.txt) - YANG Patch Media Type
* [RFC 8341](https://www.ietf.org/rfc/rfc8341.txt) - Network Configuration Access Control Model
* [RFC 8525](https://www.ietf.org/rfc/rfc8525.txt) - YANG Library
* [RFC 8528](https://www.ietf.org/rfc/rfc8528.txt) - YANG Schema Mount
* [I-D.draft-ietf-netconf-restconf-trace-ctx-headers-00](https://www.ietf.org/archive/id/draft-ietf-netconf-restconf-trace-ctx-headers-00.html) - RESTCONF Extension to support Trace Context Headers

## Getting Started <a href="#ncs.northbound.restconf.getting_started" id="ncs.northbound.restconf.getting_started"></a>

To enable RESTCONF in NSO, RESTCONF must be enabled in the `ncs.conf` configuration file. The web server configuration for RESTCONF is shared with the WebUI's config, but you may define a separate RESTCONF transport section. The WebUI does not have to be enabled for RESTCONF to work.

Here is a minimal example of what is needed in the `ncs.conf`.

{% code title="Example: NSO Configuration for RESTCONF" %}
```xml
<restconf>
  <enabled>true</enabled>
</restconf>

<webui>
  <transport>
    <tcp>
      <enabled>true</enabled>
      <ip>0.0.0.0</ip>
      <port>8080</port>
    </tcp>
  </transport>
</webui>
```
{% endcode %}

If you want to run RESTCONF with a different transport configuration than what the WebUI is using, you can specify a separate RESTCONF transport section.

{% code title="Example: NSO Separate Transport Configuration for RESTCONF" %}
```xml
<restconf>
  <enabled>true</enabled>
  <transport>
    <tcp>
      <enabled>true</enabled>
      <ip>0.0.0.0</ip>
      <port>8090</port>
    </tcp>
  </transport>
</restconf>

<webui>
  <enabled>false</enabled>
  <transport>
    <tcp>
      <enabled>true</enabled>
      <ip>0.0.0.0</ip>
      <port>8080</port>
    </tcp>
  </transport>
</webui>
```
{% endcode %}

It is now possible to do a RESTCONF requests towards NSO. Any HTTP client can be used, in the following examples curl will be used. The example below will show what a typical RESTCONF request could look like.

{% code title="Example: A RESTCONF Request using " %}
```bash
# Note that the command is wrapped in several lines in order to fit.
#
# The switch '-i' will include any HTTP reply headers in the output
# and the '-s' will suppress some superflous output.
#
# The '-u' switch specify the User:Password for login authentication.
#
# The '-H' switch will add a HTTP header to the request; in this case
# an 'Accept' header is added, requesting the preferred reply format.
#
# Finally, the complete URL to the wanted resource is specified,
# in this case the top of the configuration tree.
#
curl -is -u admin:admin \
-H "Accept: application/yang-data+xml" \
http://localhost:8080/restconf/data
```
{% endcode %}

In the rest of the document, in order to simplify the presentation, the example above will be expressed as:

{% code title="Example: A RESTCONF Request, Simplified" %}
```http
GET /restconf/data
Accept: application/yang-data+xml

# Any reply with relevant headers will be displayed here!
HTTP/1.1 200 OK
```
{% endcode %}

Note the HTTP return code (200 OK) in the example, which will be displayed together with any relevant HTTP headers returned and a possible body of content.

### Top-level GET request <a href="#d5e1282" id="d5e1282"></a>

Send a RESTCONF query to get a representation of the top-level resource, which is accessible through the path: `/restconf`.

{% code title="Example: A Top-level RESTCONF Request" %}
```http
GET /restconf
Accept: application/yang-data+xml

HTTP/1.1 200 OK
<restconf xmlns="urn:ietf:params:xml:ns:yang:ietf-restconf">
  <data/>
  <operations/>
  <yang-library-version>2019-01-04</yang-library-version>
</restconf>
```
{% endcode %}

As can be seen from the result, the server exposes three additional resources:

* `data`: This mandatory resource represents the combined configuration and state data resources that can be accessed by a client.
* `operations`: This optional resource is a container that provides access to the data-model-specific RPC operations supported by the server.
* `yang-library-version`: This mandatory leaf identifies the revision date of the `ietf-yang-library` YANG module that is implemented by this server. This resource exposes which YANG modules are in use by the NSO system.

### Get Resources Under the `data` Resource <a href="#d5e1302" id="d5e1302"></a>

To fetch configuration, operational data, or both, from the server, a request to the `data` resource is made. To restrict the amount of returned data, the following example will prune the amount of output to only consist of the topmost nodes. This is achieved by using the `depth` query argument as shown in the example below:

{% code title="Example: Get the Top-most Resources Under " %}
```http
GET /restconf/data?depth=1
Accept: application/yang-data+xml

<data xmlns="urn:ietf:params:xml:ns:yang:ietf-restconf">
  <yang-library xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-library"/>
  <modules-state xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-library"/>
  <dhcp xmlns="http://yang-central.org/ns/example/dhcp"/>
  <nacm xmlns="urn:ietf:params:xml:ns:yang:ietf-netconf-acm"/>
  <netconf-state xmlns="urn:ietf:params:xml:ns:yang:ietf-netconf-monitoring"/>
  <restconf-state xmlns="urn:ietf:params:xml:ns:yang:ietf-restconf-monitoring"/>
  <aaa xmlns="http://tail-f.com/ns/aaa/1.1"/>
  <confd-state xmls="http://tail-f.com/yang/confd-monitoring"/>
  <last-logins xmlns="http://tail-f.com/yang/last-login"/>
</data>
```
{% endcode %}

### Manipulating config data with RESTCONF

Let's assume we are interested in the `dhcp/subnet` resource in our configuration. In the following examples, assume that it is defined by a corresponding Yang module that we have named `dhcp.yang`, looking like this:

{% code title="Example: The " %}
```cli
> yanger -f tree examples.confd/restconf/basic/dhcp.yang
module: dhcp
  +--rw dhcp
  +--rw max-lease-time?       uint32
  +--rw default-lease-time?   uint32
  +--rw subnet* [net]
  |  +--rw net               inet:ip-prefix
  |  +--rw range!
  |  |  +--rw dynamic-bootp?   empty
  |  |  +--rw low              inet:ip-address
  |  |  +--rw high             inet:ip-address
  |  +--rw dhcp-options
  |  |  +--rw router*        inet:host
  |  |  +--rw domain-name?   inet:domain-name
  |  +--rw max-lease-time?   uint32
```
{% endcode %}

We can issue an HTTP GET request to retrieve the value content of the resource. In this case, we find that there is no such data, which is indicated by the HTTP return code `204 No Content`.

Note also how we have prefixed the `dhcp:dhcp` resource. This is how RESTCONF handles namespaces, where the prefix is the YANG module name and the namespace is as defined by the namespace statement in the YANG module.

{% code title="Example: Get the " %}
```http
GET /restconf/data/dhcp:dhcp/subnet

HTTP/1.1 204 No Content
```
{% endcode %}

We can now create the `dhcp/subnet` resource by sending an HTTP POST request + the data that we want to store. Note the `Content-Type` HTTP header, which indicates the format of the provided body. Two formats are supported: XML or JSON. In this example, we are using XML, which is indicated by the `Content-Type` value: `application/yang-data+xml`.

{% code title="Example: Create a New " %}
```http
POST /restconf/data/dhcp:dhcp
Content-Type: application/yang-data+xml

<subnet xmlns="http://yang-central.org/ns/example/dhcp"
          xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
  <net>10.254.239.0/27</net>
  <range>
    <dynamic-bootp/>
    <low>10.254.239.10</low>
    <high>10.254.239.20</high>
  </range>
  <dhcp-options>
    <router>rtr-239-0-1.example.org</router>
    <router>rtr-239-0-2.example.org</router>
  </dhcp-options>
  <max-lease-time>1200</max-lease-time>
</subnet>

# If the resource is created, the server might respond as follows:

HTTP/1.1 201 Created
Location: http://localhost:8080/restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27
```
{% endcode %}

Note the HTTP return code (`201 Created`) indicating that the resource was successfully created. We also got a Location header, which always is returned in a reply to a successful creation of a resource, stating the resulting URI leading to the created resource.

If we now want to modify a part of our `dhcp/subnet` config, we can use the HTTP `PATCH` method, as shown below. Note that the URI used in the request needs to be URL-encoded, such that the key value: `10.254.239.0/27` is URL-encoded as: `10.254.239.0%2F27`.

Also, note the difference of the `PATCH` URI compared to the earlier `POST` request. With the latter, since the resource does not yet exist, we `POST` to the parent resource (`dhcp:dhcp`), while with the `PATCH` request we address the (existing) resource (`10.254.239.0%2F27`).

{% code title="Example: Modify a Part of the " %}
```http
PATCH /restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27

<subnet>
  <max-lease-time>3333</max-lease-time>
</subnet>

# If our modification is successful, the server might respond as follows:

HTTP/1.1 204 No Content
```
{% endcode %}

We can also replace the subnet with some new configuration. To do this, we make use of the `PUT` HTTP method as shown below. Since the operation was successful and no body was returned, we will get a `204 No Content` return code.

{% code title="Example: Replace a " %}
```http
PUT /restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27
Content-Type: application/yang-data+xml

<subnet xmlns="http://yang-central.org/ns/example/dhcp"
          xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
  <net>10.254.239.0/27</net>

  <!-- ...config left out here... -->

</subnet>

# At success, the server will respond as follows:

HTTP/1.1 204 No Content
```
{% endcode %}

To delete the subnet, we make use of the `DELETE` HTTP method as shown below. Since the operation was successful and no body was returned, we will get a `204 No Content` return code.

{% code title="Example: Delete a " %}
```http
DELETE /restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27

HTTP/1.1 204 No Content
```
{% endcode %}

## Root Resource Discovery

RESTCONF makes it possible to specify where the RESTCONF API is located, as described in the RESTCONF [RFC 8040](https://www.ietf.org/rfc/rfc8040.txt#section-3.1).

As per default, the RESTCONF API root is `/restconf`. Typically there is no need to change the default value although it is possible to change this by configuring the RESTCONF API root in the `ncs.conf` file as:

{% code title="Example: NSO Configuration for RESTCONF" %}
```xml
<restconf>
  <enabled>true</enabled>
  <root-resource>my_own_restconf_root</root-resource>
</restconf>
```
{% endcode %}

The RESTCONF API root will now be `/my_own_restconf_root`.

A client may discover the root resource by getting the `/.well-known/host-meta` resource as shown in the example below:

{% code title="Example: Example Returning " %}
```
   The client might send the following:

      GET /.well-known/host-meta
      Accept: application/xrd+xml

   The server might respond as follows:

      HTTP/1.1 200 OK

      <XRD xmlns='http://docs.oasis-open.org/ns/xri/xrd-1.0'>
          <Link rel='restconf' href='/restconf'/>
      </XRD>
```
{% endcode %}

{% hint style="info" %}
In this guide, all examples will assume the RESTCONF API root to be `/restconf`.
{% endhint %}

## Capabilities <a href="#d5e1399" id="d5e1399"></a>

A RESTCONF capability is a set of functionality that supplements the base RESTCONF specification. The capability is identified by a uniform resource identifier [(URI)](https://www.ietf.org/rfc/rfc3986.txt). The RESTCONF server includes a `capability` URI leaf-list entry identifying each supported protocol feature. This includes the `basic-mode` default-handling mode, optional query parameters, and may also include other, NSO-specific, capability URIs.

### How to View the Capabilities of the RESTCONF Server <a href="#ncs.northbound.restconf.capabilities" id="ncs.northbound.restconf.capabilities"></a>

To view currently enabled capabilities, use the `ietf-restconf-monitoring` YANG model, which is available as: `/restconf/data/ietf-restconf-monitoring:restconf-state`.

{% code title="Example: NSO RESTCONF Capabilities" %}
```http
GET /restconf/data/ietf-restconf-monitoring:restconf-state
Host: example.com
Accept: application/yang-data+xml

<restconf-state xmlns="urn:ietf:params:xml:ns:yang:ietf-restconf-monitoring"
  xmlns:rcmon="urn:ietf:params:xml:ns:yang:ietf-restconf-monitoring">
<capabilities>
  <capability>
    urn:ietf:params:restconf:capability:defaults:1.0?basic-mode=explicit
  </capability>
  <capability>urn:ietf:params:restconf:capability:depth:1.0</capability>
  <capability>urn:ietf:params:restconf:capability:fields:1.0</capability>
  <capability>urn:ietf:params:restconf:capability:with-defaults:1.0</capability>
  <capability>urn:ietf:params:restconf:capability:filter:1.0</capability>
  <capability>urn:ietf:params:restconf:capability:replay:1.0</capability>
  <capability>http://tail-f.com/ns/restconf/collection/1.0</capability>
  <capability>http://tail-f.com/ns/restconf/query-api/1.0</capability>
  <capability>http://tail-f.com/ns/restconf/partial-response/1.0</capability>
  <capability>http://tail-f.com/ns/restconf/unhide/1.0</capability>
  <capability>urn:ietf:params:xml:ns:yang:traceparent:1.0</capability>
  <capability>urn:ietf:params:xml:ns:yang:tracestate:1.0</capability>
</capabilities>
</restconf-state>
```
{% endcode %}

### The `defaults` Capability

This Capability identifies the `basic-mode` default-handling mode that is used by the server for processing default leafs in requests for data resources.

{% code title="Example:The " %}
```
          urn:ietf:params:restconf:capability:defaults:1.0
```
{% endcode %}

The `capability` URL will contain a query parameter named `basic-mode` which value tells us what the default behavior of the RESTCONF server is when it returns a leaf. The possible values are shown in the table below (`basic-mode` values):

<table><thead><tr><th width="163">Value</th><th>Description</th></tr></thead><tbody><tr><td><code>report-all</code></td><td>Values set to the YANG default value are reported.</td></tr><tr><td><code>trim</code></td><td>Values set to the YANG default value are not reported.</td></tr><tr><td><code>explicit</code></td><td>Values that has been set by a client to the YANG default value will be reported.</td></tr></tbody></table>

The values presented in the table above can also be used by the Client together with the `with-defaults` query parameter to override the default RESTCONF server behavior. Added to these values, the Client can also use the `report-all-tagged` value.

The table below lists additional `with-defaults` value.

<table><thead><tr><th width="231">Value</th><th>Description</th></tr></thead><tbody><tr><td><code>report-all-tagged</code></td><td>Works as the <code>report-all</code> but a default value will include an XML/JSON attribute to indicate that the value is in fact a default value.</td></tr></tbody></table>

Referring back to the example: Example: NSO RESTCONF Capabilities, where the RESTCONF server returned the default capability:

```
urn:ietf:params:restconf:capability:defaults:1.0?basic-mode=explicit
```

It tells us that values that have been set by a client to the YANG default value will be reported but default values that have not been set by the Client will not be returned. Again, note that this is the default RESTCONF server behavior which can be overridden by the Client by using the `with-defaults` query argument.

### Query Parameter Capabilities <a href="#d5e1469" id="d5e1469"></a>

A set of optional RESTCONF Capability URIs are defined to identify the specific query parameters that are supported by the server. They are defined as:

The table shows query parameter capabilities.

<table><thead><tr><th width="184">Name</th><th>URI</th></tr></thead><tbody><tr><td>depth</td><td>urn:ietf:params:restconf:capability:depth:1.0</td></tr><tr><td>fields</td><td>urn:ietf:params:restconf:capability:fields:1.0</td></tr><tr><td>filter</td><td>urn:ietf:params:restconf:capability:filter:1.0</td></tr><tr><td>replay</td><td>urn:ietf:params:restconf:capability:replay:1.0</td></tr><tr><td>with.defaults</td><td>urn:ietf:params:restconf:capability:with.defaults:1.0</td></tr></tbody></table>

For a description of the query parameter functionality, see [Query Parameters](restconf-api.md#ncs.northbound.restconf.query_params).

## Query Parameters <a href="#ncs.northbound.restconf.query_params" id="ncs.northbound.restconf.query_params"></a>

Each RESTCONF operation allows zero or more query parameters to be present in the request URI. Query parameters can be given in any order, but can appear at most once. Supplying query parameters when invoking RPCs and actions is not supported, if supplied the response will be 400 (Bad Request) and the `error-app-tag` will be set to `invalid-value`. However, the query parameters `trace-id` and `unhide` are exempted from this rule and supported for RPC and action invocation. The defined query parameters and in what type of HTTP request they can be used are shown in the table below (Query parameters).

<table><thead><tr><th width="185">Name</th><th width="154">Method</th><th>Description</th></tr></thead><tbody><tr><td><code>content</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Select config and/or non-config data resources.</td></tr><tr><td><code>depth</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Request limited subtree depth in the reply content.</td></tr><tr><td><code>fields</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Request a subset of the target resource contents.</td></tr><tr><td><code>exclude</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Exclude a subset of the target resource contents.</td></tr><tr><td><code>filter</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Boolean notification filter for event stream resources.</td></tr><tr><td><code>insert</code></td><td><code>POST</code>,<code>PUT</code></td><td>Insertion mode for <em>ordered-by user</em> data resources</td></tr><tr><td><code>point</code></td><td><code>POST</code>,<code>PUT</code></td><td>Insertion point for <em>ordered-by user</em> data resources</td></tr><tr><td><code>start-time</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Replay buffer start time for event stream resources.</td></tr><tr><td><code>stop-time</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Replay buffer stop time for event stream resources.</td></tr><tr><td><code>with-defaults</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Control the retrieval of default values.</td></tr><tr><td><code>with-origin</code></td><td><code>GET</code></td><td>Include the "origin" metadata annotations, as detailed in the NMDA.</td></tr></tbody></table>

### The `content` Query Parameter

The `content` query parameter controls if configuration, non-configuration, or both types of data should be returned. The `content` query parameter values are listed below.

The allowed values are:

<table><thead><tr><th width="148">Value</th><th>Description</th></tr></thead><tbody><tr><td><code>config</code></td><td>Return only configuration descendant data nodes.</td></tr><tr><td><code>nonconfig</code></td><td>Return only non-configuration descendant data nodes.</td></tr><tr><td><code>all</code></td><td>Return all descendant data nodes.</td></tr></tbody></table>

### The `depth` Query Parameter

The `depth` query parameter is used to limit the depth of subtrees returned by the server. Data nodes with a value greater than the `depth` parameter are not returned in response to a GET request.

The value of the `depth` parameter is either an integer between 1 and 65535 or the string `unbounded`. The default value is: `unbounded`.

### The `fields` Query Parameter <a href="#d5e1600" id="d5e1600"></a>

The `fields` query parameter is used to optionally identify data nodes within the target resource to be retrieved in a GET method. The client can use this parameter to retrieve a subset of all nodes in a resource.

For a full definition of the `fields` value can be constructed, refer to the [RFC 8040, Section 4.8.3](https://tools.ietf.org/html/rfc8040#section-4.8.3).

Note that the `fields` query parameter cannot be used together with the `exclude` query parameter. This will result in an error.

{% code title="Example: Example of How to Use the " %}
```http
GET /restconf/data/dhcp:dhcp?fields=subnet/range(low;high)
Accept: application/yang-data+xml

HTTP/1.1 200 OK
<dhcp xmlns="http://yang-central.org/ns/example/dhcp" \
      xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
  <subnet>
    <range>
      <low>10.254.239.10</low>
      <high>10.254.239.20</high>
    </range>
  </subnet>
  <subnet>
    <range>
      <low>10.254.244.10</low>
      <high>10.254.244.20</high>
    </range>
  </subnet>
</dhcp>
```
{% endcode %}

### The `exclude` Query Parameter

The `exclude` query parameter is used to optionally exclude data nodes within the target resource from being retrieved with a GET request. The client can use this parameter to exclude a subset of all nodes in a resource. Only nodes below the target resource can be excluded, not the target resource itself.

Note that the `exclude` query parameter cannot be used together with the `fields` query parameter. This will result in an error.

The `exclude` query parameter uses the same syntax and has the same restrictions as the `fields` query parameter, as defined in [RFC 8040, Section 4.8.3](https://tools.ietf.org/html/rfc8040#section-4.8.3).

Selecting multiple nodes to exclude can be done the same way as for the `fields` query parameter, as described in [RFC 8040, Section 4.8.3](https://tools.ietf.org/html/rfc8040#section-4.8.3).

`exclude` using wildcards (\*) will exclude all child nodes of the node. For lists and presence containers, the parent node will be visible in the output but not its children, i.e. it will be displayed as an empty node. For non-presence containers, the parent node will be excluded from the output as well.

`exclude` can be used together with the `depth` query parameter to limit the depth of the output. In contrast to `fields`, where `depth` is counted from the node selected by `fields`, for `exclude` the depth is counted from the target resource, and the nodes are excluded if `depth` is deep enough to encounter an excluded node.

When `exclude` is not used:

{% code title="Example: Example of How to Use the " %}
```http
GET /restconf/data/dhcp:dhcp/subnet
Accept: application/yang-data+xml

HTTP/1.1 200 OK
<subnet xmlns="http://yang-central.org/ns/example/dhcp"
          xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
  <net>10.254.239.0/27</net>
  <range>
    <dynamic-bootp/>
    <low>10.254.239.10</low>
    <high>10.254.239.20</high>
  </range>
  <dhcp-options>
    <router>rtr-239-0-1.example.org</router>
    <router>rtr-239-0-2.example.org</router>
  </dhcp-options>
  <max-lease-time>1200</max-lease-time>
</subnet>
```
{% endcode %}

Using `exclude` to exclude `low` and `high` from `range`, note that these are absent in the output:

```http
GET /restconf/data/dhcp:dhcp/subnet?exclude=range(low;high)
Accept: application/yang-data+xml

HTTP/1.1 200 OK
<subnet xmlns="http://yang-central.org/ns/example/dhcp"
          xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
  <net>10.254.239.0/27</net>
  <range>
    <dynamic-bootp/>
  </range>
  <dhcp-options>
    <router>rtr-239-0-1.example.org</router>
    <router>rtr-239-0-2.example.org</router>
  </dhcp-options>
  <max-lease-time>1200</max-lease-time>
</subnet>
```

### The `filter`, `start-time`, and `stop-time` Query Parameters

These query parameters are only allowed on an event stream resource and are further described in [Streams](restconf-api.md#ncs.northbound.restconf.streams).

### The `insert` Query Parameter <a href="#d5e1657" id="d5e1657"></a>

The `insert` query parameter is used to specify how a resource should be inserted within an `ordered-by user` list. The allowed values are shown in the table below (The `content` query parameter values).

<table><thead><tr><th width="142">Value</th><th>Description</th></tr></thead><tbody><tr><td><code>first</code></td><td>Insert the new data as the new first entry.</td></tr><tr><td><code>last</code></td><td>Insert the new data as the new last entry. This is the default value.</td></tr><tr><td><code>before</code></td><td>Insert the new data before the insertion point, as specified by the value of the <code>point</code> parameter.</td></tr><tr><td><code>after</code></td><td>Insert the new data after the insertion point, as specified by the value of the <code>point</code> parameter.</td></tr></tbody></table>

This parameter is only valid if the target data represents a YANG list or leaf-list that is `ordered-by user`. In the example below, we will insert a new `router` value, first, in the `ordered-by user` leaf-list of `dhcp-options/router` values. Remember that the default behavior is for new entries to be inserted last in an `ordered-by user` leaf-list.

{% code title="Example: Insert " %}
```bash
# Note: we have to split the POST line in order to fit the page
POST /restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27/dhcp-options?\
     insert=first
Content-Type: application/yang-data+xml

<router>one.acme.org</router>

# If the resource is created, the server might respond as follows:

HTTP/1.1 201 Created
Location /restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27/dhcp-options/\
         router=one.acme.org
```
{% endcode %}

To verify that the `router` value really ended up first:

```http
GET /restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27/dhcp-options
Accept: application/yang-data+xml

HTTP/1.1 200 OK
<dhcp-options xmlns="http://yang-central.org/ns/example/dhcp"
              xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
  <router>one.acme.org</router>
  <router>rtr-239-0-1.example.org</router>
  <router>rtr-239-0-2.example.org</router>
</dhcp-options>
```

### The `point` Query Parameter <a href="#d5e1703" id="d5e1703"></a>

The `point` query parameter is used to specify the insertion point for a data resource that is being created or moved within an `ordered-by user` list or leaf-list. In the example below, we will insert the new `router` value: `two.acme.org`, after the first value: `one.acme.org` in the `ordered-by user` leaf-list of `dhcp-options/router` values.

{% code title="Example: Insert " %}
```bash
# Note: we have to split the POST line in order to fit the page
POST /restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27/dhcp-options?\
     insert=after&\
     point=/dhcp:dhcp/subnet=10.254.239.0%2F27/dhcp-options/router=one.acme.org
Content-Type: application/yang-data+xml

<router>two.acme.org</router>

# If the resource is created, the server might respond as follows:

HTTP/1.1 201 Created
Location /restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27/dhcp-options/\
         router=one.acme.org
```
{% endcode %}

To verify that the `router` value really ended up after our insertion point:

```http
GET /restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27/dhcp-options
Accept: application/yang-data+xml

HTTP/1.1 200 OK
<dhcp-options xmlns="http://yang-central.org/ns/example/dhcp"
              xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
  <router>one.acme.org</router>
  <router>two.acme.org</router>
  <router>rtr-239-0-1.example.org</router>
  <router>rtr-239-0-2.example.org</router>
</dhcp-options>
```

### Additional Query Parameters <a href="#d5e1722" id="d5e1722"></a>

There are additional NSO query parameters available for the RESTCONF API. These additional query parameters are described in the table below (Additional Query Parameters).

<table data-full-width="false"><thead><tr><th width="200">Name</th><th width="161">Methods</th><th>Description</th></tr></thead><tbody><tr><td><code>label</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Sets a user-defined label that is visible in rollback files, compliance reports, notifications, and events referencing the transaction and resulting commit queue items. If supported, the label will also be propagated down to the devices participating in the transaction.</td></tr><tr><td><code>comment</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Sets a comment visible in rollback files and compliance reports. If supported, the comment will also be propagated down to the devices participating in the transaction.</td></tr><tr><td><code>dry-run</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Validate and display the configuration changes but do not perform the actual commit. Neither CDB nor the devices are affected. Instead, the effects that would have taken place are shown in the returned output. Possible values are: <code>xml</code>, <code>cli</code><em>,</em> and <code>native</code>. The value used specifies in what format we want the returned diff to be.</td></tr><tr><td><code>dry-run-reverse</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Used together with the <code>dry-run=native</code> parameter to display the device commands for getting back to the current running state in the network if the commit is successfully executed. Beware that if any changes are done later on the same data the reverse device commands returned are invalid.</td></tr><tr><td><code>no-networking</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Do not send any data to the devices. This is a way to manipulate CDB in NSO without generating any southbound traffic.</td></tr><tr><td><code>no-out-of-sync-check</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Continue with the transaction even if NSO detects that a device's configuration is out of sync. Can't be used together with no-overwrite.</td></tr><tr><td><code>no-overwrite</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>NSO will check that the modified data and the data read when computing the device modifications have not changed on the device compared to NSO's view of the data. Can't be used together with no-out-of-sync-check.</td></tr><tr><td><code>no-revision-drop</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>NSO will not run its data model revision algorithm, which requires all participating managed devices to have all parts of the data models for all data contained in this transaction. Thus, this flag forces NSO to never silently drop any data set operations towards a device.</td></tr><tr><td><code>no-deploy</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Commit without invoking the service create method, i.e, write the service instance data without activating the service(s). The service(s) can later be re-deployed to write the changes of the service(s) to the network.</td></tr><tr><td><code>reconcile</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Reconcile the service data. All data which existed before the service was created will now be owned by the service. When the service is removed that data will also be removed. In technical terms, the reference count will be decreased by one for everything that existed prior to the service. If the manually configured data exists below in the configuration tree, that data is kept unless the option <code>discard-non-service-config</code> is used.</td></tr><tr><td><code>use-lsa</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Force handling of the LSA nodes as such. This flag tells NSO to propagate applicable commit flags and actions to the LSA nodes without applying them on the upper NSO node itself. The commit flags affected are <code>dry-run</code>, <code>no-networking</code>, <code>no-out-of-sync-check</code>, <code>no-overwrite</code> and <code>no-revision-drop</code>.</td></tr><tr><td><code>no-lsa</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Do not handle any of the LSA nodes as such. These nodes will be handled as any other device.</td></tr><tr><td><code>commit-queue</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Commit the transaction data to the commit queue. Possible values are: <code>async</code>, <code>sync</code>, and <code>bypass</code>. If the <code>async</code> value is set the operation returns successfully if the transaction data has been successfully placed in the queue. The <code>sync</code> value will cause the operation to not return until the transaction data has been sent to all devices, or a timeout occurs. The <code>bypass</code> value means that if <code>/devices/global-settings/commit-queue/enabled-by-default</code> is <code>true</code> the data in this transaction will bypass the commit queue. The data will be written directly to the devices.</td></tr><tr><td><code>commit-queue-atomic</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Sets the atomic behavior of the resulting queue item. Possible values are: <code>true</code> and <code>false</code>. If this is set to <code>false</code>, the devices contained in the resulting queue item can start executing if the same devices in other non-atomic queue items ahead of it in the queue are completed. If set to <code>true</code>, the atomic integrity of the queue item is preserved.</td></tr><tr><td><code>commit-queue-block-others</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>The resulting queue item will block subsequent queue items, which use any of the devices in this queue item, from being queued.</td></tr><tr><td><code>commit-queue-lock</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Place a lock on the resulting queue item. The queue item will not be processed until it has been unlocked, see the actions <code>unlock</code> and <code>lock</code> in <code>/devices/commit-queue/queue-item</code>. No following queue items, using the same devices, will be allowed to execute as long as the lock is in place.</td></tr><tr><td><code>commit-queue-tag</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>The value is a user-defined opaque tag. The tag is present in all notifications and events sent referencing the specific queue item.<br><strong>Note</strong>: <code>commit-queue-tag</code> as a query parameter is deprecated from NSO version 6.5. The <code>label</code> query parameter can be used instead.</td></tr><tr><td><code>commit-queue-timeout</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Specifies a maximum number of seconds to wait for completion. Possible values are <code>infinity</code> or a positive integer. If the timer expires, the transaction is kept in the commit-queue, and the operation returns successfully. If the timeout is not set, the operation waits until completion indefinitely.</td></tr><tr><td><code>commit-queue-error-option</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>The error option to use. Depending on the selected error option, NSO will store the reverse of the original transaction to be able to undo the transaction changes and get back to the previous state. This data is stored in the <code>/devices/commit-queue/completed</code> tree from where it can be viewed and invoked with the <code>rollback</code> action. When invoked, the data will be removed. Possible values are: <code>continue-on-error</code>, <code>rollback-on-error</code>, and <code>stop-on-error</code>. The <code>continue-on-error</code> value means that the commit queue will continue on errors. No rollback data will be created. The <code>rollback-on-error</code> value means that the commit queue item will roll back on errors. The commit queue will place a lock with <code>block-others</code> on the devices and services in the failed queue item. The <code>rollback</code> action will then automatically be invoked when the queue item has finished its execution. The lock will be removed as part of the rollback. The <code>stop-on-error</code> means that the commit queue will place a lock with <code>block-others</code> on the devices and services in the failed queue item. The lock must then either manually be released when the error is fixed or the <code>rollback</code> action under <code>/devices/commit-queue/completed</code> be invoked. Read about error recovery in <a href="../../../operation-and-usage/operations/nso-device-manager.md#user_guide.devicemanager.commit-queue">Commit Queue</a> for a more detailed explanation.</td></tr><tr><td><code>trace-id</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Use the provided trace ID as part of the log messages emitted while processing. If no trace ID is given, NSO will generate and assign a trace ID to the processing. The <code>trace-id</code> query parameter can also be used with RPCs and actions to relay a <code>trace-id</code> from northbound requests. The <code>trace-id</code> will be included in the <code>X-Cisco-NSO-Trace-ID</code> header in the response.<br><strong>Note:</strong> <code>trace-id</code> as a query parameter is deprecated from NSO version 6.3. Capabilities within Trace Context will provide support for <code>trace-id</code>, see <a href="restconf-api.md#trace-context">Trace Context</a>.</td></tr><tr><td><code>limit</code></td><td><code>GET</code></td><td>Used by the client to specify a limited set of list entries to retrieve. See The value of the <code>limit</code> parameter is either an integer greater than or equal to <code>1</code>, or the string <code>unbounded</code>. The string <code>unbounded</code> is the default value. See <a href="restconf-api.md#ncs.northbound.partial_response">Partial Responses</a> for an example.</td></tr><tr><td><code>offset</code></td><td><code>GET</code></td><td>Used by the client to specify the number of list elements to skip before returning the requested set of list entries. See The value of the <code>offset</code> parameter is an integer greater than or equal to <code>0</code>. The default value is <code>0</code>. See <a href="restconf-api.md#ncs.northbound.partial_response">Partial Responses</a> for an example.</td></tr><tr><td><code>rollback-comment</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Used to specify a comment to be attached to the rollback file that will be created as a result of the operation. This assumes that rollback file handling is enabled.<br><strong>Note</strong>: From NSO 6.5 it is recommended to instead use the <code>comment</code> parameter which in addition to storing the comment in the rollback file also propagates it down to the devices participating in the transaction.</td></tr><tr><td><code>rollback-label</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Used to specify a label to be attached to the rollback file that will be created as a result of the operation. This assume that rollback file handling is enabled.<br><strong>Note:</strong> From NSO 6.5 it is recommended to instead use the <code>label</code> parameter which in addition to storing the label in the rollback file also sets it in resulting commit queue items and propagates it down to the devices participating in the transaction.</td></tr><tr><td><code>rollback-id</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Return the rollback ID in the response if a rollback file was created during this operation. This requires rollbacks to be enabled in the NSO to take effect.</td></tr><tr><td><code>with-service-meta-data</code></td><td><code>GET</code></td><td>Include FASTMAP attributes such as backpointers and reference counters in the reply. These are typically internal to NSO and thus not shown by default.</td></tr></tbody></table>

## Edit Collision Prevention

Two edit collision detection and prevention mechanisms are provided in RESTCONF for the datastore resource: a timestamp and an entity tag. Any change to configuration data resources will update the timestamp and entity tag of the datastore resource. This makes it possible for a client to apply precondition HTTP headers to a request.

The NSO RESTCONF API honors the following HTTP response headers: `Etag` and `Last-Modified`, and the following request headers: `If-Match`, `If-None-Match`, `If-Modified-Since`, and `If-Unmodified-Since`.

### Response Headers <a href="#d5e1892" id="d5e1892"></a>

* `Etag`: This header will contain an entity tag which is an opaque string representing the latest transaction identifier in the NSO database. This header is only available for the running datastore and hence, only relates to configuration data (non-operational).
* `Last-Modified`: This header contains the timestamp for the last modification made to the NSO database. This timestamp can be used by a RESTCONF client in subsequent requests, within the `If-Modified-Since` and `If-Unmodified-Since` header fields. This header is only available for the running datastore and hence, only relates to configuration data (non-operational).

### Request Headers <a href="#d5e1907" id="d5e1907"></a>

* `If-None-Match`: This header evaluates to true if the supplied value does not match the latest `Etag` entity-tag value. If evaluated to false, an error response with status 304 (Not Modified) will be sent with no body. This header carries only meaning if the entity tag of the `Etag` response header has previously been acquired. The usage of this could for example be a HEAD operation to get information if the data has changed since the last retrieval.
* `If-Modified-Since`: This request-header field is used with an HTTP method to make it conditional, i.e if the requested resource has not been modified since the time specified in this field, the request will not be processed by the RESTCONF server; instead, a 304 (Not Modified) response will be returned without any message-body. Usage of this is for instance for a GET operation to retrieve the information if (and only if) the data has changed since the last retrieval. Thus, this header should use the value of a `Last-Modified` response header that has previously been acquired.
* `If-Match`: This header evaluates to true if the supplied value matches the latest `Etag` value. If evaluated to false, an error response with status 412 (Precondition Failed) will be sent with no body. This header carries only meaning if the entity tag of the `Etag` response header has previously been acquired. The usage of this can be in the case of a `PUT`, where `If-Match` can be used to prevent the lost update problem. It can check if the modification of a resource that the user wants to upload will not override another change that has been done since the original resource was fetched.
* `If-Unmodified-Since`: This header evaluates to true if the supplied value has not been last modified after the given date. If the resource has been modified after the given date, the response will be a 412 (Precondition Failed) error with no body. This header carries only meaning if the `Last-Modified` response header has previously been acquired. The usage of this can be the case of a `POST`, where editions are rejected if the stored resource has been modified since the original value was retrieved.

## Using Rollbacks <a href="#ug.restconf.using_rollbacks" id="ug.restconf.using_rollbacks"></a>

### Rolling Back Configuration Changes <a href="#d5e1936" id="d5e1936"></a>

If rollbacks have been enabled in the configuration using the `rollback-id` query parameter, the fixed ID of the rollback file created during an operation is returned in the results. The below examples show the creation of a new resource and the removal of that resource using the rollback created in the first step.

{% code title="Example: Create a New dhcp/subnet Resource" %}
```http
POST /restconf/data/dhcp:dhcp?rollback-id=true
Content-Type: application/yang-data+xml

<subnet xmlns="http://yang-central.org/ns/example/dhcp">
  <net>10.254.239.0/27</net>
</subnet>

HTTP/1.1 201 Created
Location: http://localhost:8008/restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27

<result xmlns="http://tail-f.com/ns/tailf-restconf">
<rollback>
  <id>10002</id>
</rollback>
</result>
```
{% endcode %}

Then using the fixed ID returned above as input to the `apply-rollback-file` action:

```http
POST /restconf/data/tailf-rollback:rollback-files/apply-rollback-file
Content-Type: application/yang-data+xml

<input xmlns="http://tail-f.com/ns/rollback">
  <fixed-number>10002</fixed-number>
</input>

HTTP/1.1 204 No Content
```

## Streams <a href="#ncs.northbound.restconf.streams" id="ncs.northbound.restconf.streams"></a>

### Introduction <a href="#d5e1949" id="d5e1949"></a>

The RESTCONF protocol supports YANG-defined event notifications. The solution preserves aspects of NETCONF event notifications \[RFC5277] while utilizing the Server-Sent Events, [W3C.REC-eventsource-20150203](https://www.w3.org/TR/2015/REC-eventsource-20150203), transport strategy.

RESTCONF event notification streams are described in Sections 6 and 9.2 of [RFC 8040](https://www.ietf.org/rfc/rfc8040.txt), where also notification examples can be found.

RESTCONF event notification is a way for RESTCONF clients to retrieve notifications for different event streams. Event streams configured in NSO can be subscribed to using different channels such as the RESTCONF or the NETCONF channel.

More information on how to define a new notification event using Yang is described in [RFC 6020](https://www.ietf.org/rfc/rfc6020.txt).

How to add and configure notifications support in NSO is described in the `ncs.conf(3)` man page.

The design of RESTCONF event notification is inspired by how NETCONF event notification is designed. More information on NETCONF event notification can be found in [RFC 5277](https://www.ietf.org/rfc/rfc5277.txt).

### Configuration <a href="#d5e1964" id="d5e1964"></a>

For this example, we will define a notification stream, named `interface` in the `ncs.conf` configuration file as shown below.

We also enable the built-in replay store which means that NSO automatically stores all notifications on disk, ready to be replayed should a RESTCONF event notification subscriber ask for logged notifications. The replay store uses a set of wrapping log files on a disk (of a certain number and size) to store the notifications.

{% code title="Example: Configure an Example Notification" %}
```xml
<notifications>
  <eventStreams>
    <stream>
      <name>interface</name>
      <description>Example notifications</description>
      <replaySupport>true</replaySupport>
      <builtinReplayStore>
        <dir>./</dir>
        <maxSize>S1M</maxSize>
        <maxFiles>5</maxFiles>
      </builtinReplayStore>
    </stream>
  </eventStreams>
</notifications>
```
{% endcode %}

To view the currently enabled event streams, use the `ietf-restconf-monitoring` YANG model. The streams are available under the `/restconf/data/ietf-restconf-monitoring:restconf-state/streams` container.

{% code title="Example: View the Example RESTCONF Stream" %}
```http
GET /restconf/data/ietf-restconf-monitoring:restconf-state/streams
Accept: application/yang-data+xml

HTTP/1.1 200 OK

<streams xmlns="urn:ietf:params:xml:ns:yang:ietf-restconf-monitoring"
         xmlns:rcmon="urn:ietf:params:xml:ns:yang:ietf-restconf-monitoring">

  ...other streams info removed here for brewity reason...

  <stream>
    <name>interface</name>
    <description>Example notifications</description>
    <replay-support>true</replay-support>
    <replay-log-creation-time>
      2020-05-04T13:45:31.033817+00:00
    </replay-log-creation-time>
    <access>
      <encoding>xml</encoding>
      <location>https://localhost:8888/restconf/streams/interface/xml</location>
    </access>
    <access>
      <encoding>json</encoding>
      <location>https://localhost:8888/restconf/streams/interface/json</location>
    </access>
  </stream>
</streams>
```
{% endcode %}

Note the URL value we get in the _location_ element in the example above. This URL should be used when subscribing to the notification events as is shown in the next example.

### Subscribe to Notification Events <a href="#d5e1982" id="d5e1982"></a>

RESTCONF clients can determine the URL for the subscription resource (to receive notifications) by sending an HTTP GET request for the `location` leaf with the `stream` list entry. The value returned by the server can be used for the actual notification subscription.

The client will send an HTTP GET request for the (location) URL returned by the server with the `Accept` type `text/event-stream` as shown in the example below. Note that this request works like a long polling request which means that the request will not return. Instead, server-side notifications will be sent to the client where each line of the notification will be prepended with `data:`.

{% code title="Example: View the Example RESTCONF Stream" %}
```http
GET /restconf/streams/interface/xml
Accept: text/event-stream

   ...NOTE: we will be waiting here until a notification is generated...

HTTP/1.1 200 OK
Content-Type: text/event-stream

data: <notification xmlns='urn:ietf:params:xml:ns:netconf:notification:1.0'>
data:     <eventTime>2020-05-04T13:48:02.291816+00:00</eventTime>
data:     <link-up xmlns='http://tail-f.com/ns/test/notif'>
data:       <if-index>2</if-index>
data:       <link-property>
data:         <newly-added/>
data:         <flags>42</flags>
data:         <extensions>
data:           <name>1</name>
data:           <value>3</value>
data:         </extensions>
data:         <extensions>
data:           <name>2</name>
data:           <value>4668</value>
data:         </extensions>
data:       </link-property>
data:     </link-up>
data: </notification>

   ...NOTE: we will still be waiting here for more notifications to come...
```
{% endcode %}

Since we have enabled the replay store, we can ask the server to replay any notifications generated since the specific date we specify. After those notifications have been delivered, we will continue waiting for new notifications to be generated.

{% code title="Example: View the Example RESTCONF Stream" %}
```http
GET /restconf/streams/interface/xml?start-time=2007-07-28T15%3A23%3A36Z
Accept: text/event-stream

HTTP/1.1 200 OK
Content-Type: text/event-stream

data: ...any existing notification since given date will be delivered here...

   ...NOTE: when all notifications are delivered, we will be waiting here for more...
```
{% endcode %}

### Errors

Errors occurring during streaming of events will be reported as Server-Sent Events (SSE) comments as described in [W3C.REC-eventsource-20150203](https://www.w3.org/TR/2015/REC-eventsource-20150203) as shown in the example below.

{% code title="Example: NSO RESTCONF Errors During Streaming" %}
```
: error: notification stream NETCONF temporarily unavailable
```
{% endcode %}

## Schema Resource

RFC 8040, Section 3.7 describes the retrieval of YANG modules used by the server via the RPC operation `get-schema`. The YANG source is made available by NSO in two ways: compiled into the `fxs` file or put in the loadPath. See [Monitoring of the NETCONF Server](restconf-api.md#ug.netconf_agent.monitoring).

The example below shows how to list the available Yang modules. Since we are interested in the `dhcp` module, we only show that part of the output:

{% code title="Example: List the Available Yang Modules" %}
```http
GET /restconf/data/ietf-yang-library:modules-state
Accept: application/yang-data+xml

HTTP/1.1 200 OK
<modules-state xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-library"
               xmlns:yanglib="urn:ietf:params:xml:ns:yang:ietf-yang-library">
  <module-set-id>f4709e88d3250bd84f2378185c2833c2</module-set-id>
  <module>
    <name>dhcp</name>
    <revision>2019-02-14</revision>
    <schema>http://localhost:8080/restconf/tailf/modules/dhcp/2019-02-14</schema>
    <namespace>http://yang-central.org/ns/example/dhcp</namespace>
    <conformance-type>implement</conformance-type>
  </module>

  ...rest of the output removed here...

</modules-state>
```
{% endcode %}

We can now retrieve the `dhcp` Yang module via the URL we got in the `schema` leaf of the reply. Note that the actual URL may point anywhere. The URL is configured by the `schemaServerUrl` setting in the `ncs.conf` file.

```http
GET /restconf/tailf/modules/dhcp/2019-02-14

HTTP/1.1 200 OK
module dhcp {
  namespace "http://yang-central.org/ns/example/dhcp";
  prefix dhcp;

  import ietf-yang-types {

  ...the rest of the Yang module removed here...
```

## YANG Patch Media Type <a href="#d5e2028" id="d5e2028"></a>

The NSO RESTCONF API also supports the YANG Patch Media Type, as defined in [RFC 8072](https://www.ietf.org/rfc/rfc8072.txt).

A YANG `Patch` is an ordered list of edits that are applied to the target datastore by the RESTCONF server. A YANG Patch request is sent as an HTTP PATCH request containing a body describing the edit operations to be performed. The format of the body is defined in the [RFC 8072](https://www.ietf.org/rfc/rfc8072.txt).

Referring to the example above (DHCP Yang model) in the [Getting Started](restconf-api.md#ncs.northbound.restconf.getting_started) section; we will show how to use YANG Patch to achieve the same result but with fewer amount of requests.

### Create Two New Resources with the YANG Patch <a href="#d5e2039" id="d5e2039"></a>

To create the resources, we send an HTTP PATCH request where the `Content-Type` indicates that the body in the request consists of a `Yang-Patch` message. Our `Yang-Patch` request will initiate two edit operations where each operation will create a new subnet. In contrast, compare this with using plain RESTCONF where we would have needed two `POST` requests to achieve the same result.

{% code title="Example: Create a Two New dhcp/subnet Resources" %}
```http
PATCH /restconf/data/dhcp:dhcp
Accept: application/yang-data+xml
Content-Type: application/yang-patch+xml

<yang-patch xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-patch">
  <patch-id>add-subnets</patch-id>
  <edit>
    <edit-id>add-subnet-239</edit-id>
    <operation>create</operation>
    <target>/subnet=10.254.239.0%2F27</target>
    <value>
      <subnet xmlns="http://yang-central.org/ns/example/dhcp" \
              xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
        <net>10.254.239.0/27</net>
          ...content removed here for brevity...
        <max-lease-time>1200</max-lease-time>
      </subnet>
    </value>
  </edit>
  <edit>
    <edit-id>add-subnet-244</edit-id>
    <operation>create</operation>
    <target>/subnet=10.254.244.0%2F27</target>
    <value>
      <subnet xmlns="http://yang-central.org/ns/example/dhcp" \
              xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
        <net>10.254.244.0/27</net>
          ...content removed here for brevity...
        <max-lease-time>1200</max-lease-time>
      </subnet>
    </value>
  </edit>
</yang-patch>

# If the YANG Patch request was successful,
# the server might respond as follows:

HTTP/1.1 200 OK
<yang-patch-status xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-patch">
  <patch-id>add-subnets</patch-id>
  <ok/>
</yang-patch-status>
```
{% endcode %}

### Modify and Delete in the Same Yang-Patch Request

Let us modify the `max-lease-time` of one subnet and delete the `max-lease-time` value of the second subnet. Note that the delete will cause the default value of `max-lease-time` to take effect, which we will verify using a RESTCONF GET request.

{% code title="Example: Modify and Delete in the Same Yang-Patch Request" %}
```http
PATCH /restconf/data/dhcp:dhcp
Accept: application/yang-data+xml
Content-Type: application/yang-patch+xml

<yang-patch xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-patch">
  <patch-id>modify-and-delete</patch-id>
  <edit>
    <edit-id>modify-max-lease-time-239</edit-id>
    <operation>merge</operation>
    <target>/dhcp:subnet=10.254.239.0%2F27</target>
    <value>
      <subnet xmlns="http://yang-central.org/ns/example/dhcp" \
              xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
        <net>10.254.239.0/27</net>
        <max-lease-time>1234</max-lease-time>
      </subnet>
    </value>
  </edit>
  <edit>
    <edit-id>delete-max-lease-time-244</edit-id>
    <operation>delete</operation>
    <target>/dhcp:subnet=10.254.244.0%2F27/max-lease-time</target>
  </edit>
</yang-patch>

# If the YANG Patch request was successful,
# the server might respond as follows:

HTTP/1.1 200 OK
<yang-patch-status xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-patch">
  <patch-id>modify-and-delete</patch-id>
  <ok/>
</yang-patch-status>
```
{% endcode %}

To verify that our modify and delete operations took place we make use of two RESTCONF `GET` requests as shown below.

{% code title="Example: Verify the Modified " %}
```http
GET /restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27/max-lease-time
Accept: application/yang-data+xml

HTTP/1.1 200 OK
<max-lease-time xmlns="http://yang-central.org/ns/example/dhcp"
                xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
                1234
</max-lease-time>
```
{% endcode %}

{% code title="Example: Verify the Default Values after Delete of the " %}
```http
GET /restconf/data/dhcp:dhcp/subnet=10.254.244.0%2F27/max-lease-time?\
      with-defaults=report-all-tagged
Accept: application/yang-data+xml

HTTP/1.1 200 OK
<max-lease-time wd:default="true"
                xmlns:wd="urn:ietf:params:restconf:capability:defaults:1.0"
                xmlns="http://yang-central.org/ns/example/dhcp"
                xmlns:dhcp="http://yang-central.org/ns/example/dhcp">
                7200
</max-lease-time>
```
{% endcode %}

Note how we in the last `GET` request make use of the `with-defaults` query parameter to request that a default value should be returned and also be tagged as such.

## NMDA <a href="#d5e2067" id="d5e2067"></a>

Network Management Datastore Architecture (NMDA), as defined in [RFC 8527](https://www.ietf.org/rfc/rfc8527.txt), extends the RESTCONF protocol. This enables RESTCONF clients to discover which datastores are supported by the RESTCONF server, determine which modules are supported in each datastore, and interact with all the datastores supported by the NMDA.

A RESTCONF client can test if a server supports the NMDA by using either the `HEAD` or `GET` methods on `/restconf/ds/ietf- datastores:operational`, as shown below:

{% code title="Example: Check if the RESTCONF Server Support NMDA" %}
```
HEAD /restconf/ds/ietf-datastores:operational

HTTP/1.1 200 OK
```
{% endcode %}

A RESTCONF client can discover which datastores and YANG modules the server supports by reading the YANG library information from the operational state datastore. Note in the example below that, since the result consists of three top nodes, it can't be represented in XML; hence we request the returned content to be in JSON format. See also [Collections](restconf-api.md#ncs.northbound.restconf.extensions.collections).

{% code title="Example: Check Which Datastores the RESTCONF Server Supports" %}
```http
GET /restconf/ds/ietf-datastores:operational/datastore
Accept: application/yang-data+json

HTTP/1.1 200 OK
{
  "ietf-yang-library:datastore": [
    {
      "name": "ietf-datastores:running",
      "schema": "common"
    },
    {
      "name": "ietf-datastores:intended",
      "schema": "common"
    },
    {
      "name": "ietf-datastores:operational",
      "schema": "common"
    }
  ]
}
```
{% endcode %}

## Extensions

To avoid any potential future conflict with the RESTCONF standard, any extensions made to the NSO implementation of RESTCONF are located under the URL path: `/restconf/tailf`, or is controlled by means of a vendor-specific media type.

{% hint style="info" %}
There is no index of extensions under `/restconf/tailf`. To list extensions, access `/restconf/data/ietf-yang-library:modules-state` and follow published links for schemas.
{% endhint %}

## Collections <a href="#ncs.northbound.restconf.extensions.collections" id="ncs.northbound.restconf.extensions.collections"></a>

The RESTCONF specification states that a result containing multiple instances (e.g. a number of list entries) is not allowed if XML encoding is used. The reason for this is that an XML document can only have one root node.

This functionality is supported if the `http://tail-f.com/ns/restconf/collection/1.0` capability is presented. See also [How to View the Capabilities of the RESTCONF Server](restconf-api.md#ncs.northbound.restconf.capabilities).

To remedy this, an HTTP GET request can make use of the `Accept:` media type: `application/vnd.yang.collection+xml` as shown in the following example. The result will then be wrapped within a `collection` element.

{% code title="Example: Use of Collections" %}
```http
GET /restconf/ds/ietf-datastores:operational/\
    ietf-yang-library:yang-library/datastore
Accept: application/vnd.yang.collection+xml

<collection xmlns="http://tail-f.com/ns/restconf/collection/1.0">
  <datastore xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-library"
            xmlns:yanglib="urn:ietf:params:xml:ns:yang:ietf-yang-library">
    <name xmlns:ds="urn:ietf:params:xml:ns:yang:ietf-datastores">
       ds:running
    </name>
    <schema>common</schema>
  </datastore>
  <datastore xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-library"
             xmlns:yanglib="urn:ietf:params:xml:ns:yang:ietf-yang-library">
    <name xmlns:ds="urn:ietf:params:xml:ns:yang:ietf-datastores">
      ds:intended
    </name>
    <schema>common</schema>
  </datastore>
  <datastore xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-library
             xmlns:yanglib="urn:ietf:params:xml:ns:yang:ietf-yang-library">
    <name xmlns:ds="urn:ietf:params:xml:ns:yang:ietf-datastores">
      ds:operational
    </name>
    <schema>common</schema>
  </datastore>
</collection>
```
{% endcode %}

## The RESTCONF Query API

The NSO RESTCONF Query API consists of a number of operations to start a query which may live over several RESTCONF requests, where data can be fetched in suitable chunks. The data to be returned is produced by applying an XPath expression where the data also may be sorted.

The RESTCONF client can check if the NSO RESTCONF server supports this functionality by looking for the `http://tail-f.com/ns/restconf/query-api/1.0` capability. See also [How to View the Capabilities of the RESTCONF Server](restconf-api.md#ncs.northbound.restconf.capabilities).

The `tailf-rest-query.yang` and the `tailf-common-query.yang` YANG models describe the structure of the RESTCONF Query API messages. By using the Schema Resource functionality, as described in [Schema Resource](restconf-api.md#schema-resource), you can get hold of them.

### Request and Replies <a href="#d5e2116" id="d5e2116"></a>

The API consists of the following requests:

* `start-query`: Start a query and return a query handle.
* `fetch-query-result`: Use a query handle to repeatedly fetch chunks of the result.
* `immediate-query`: Start a query and return the entire result immediately.
* `reset-query`: (Re)set where the next fetched result will begin from.
* `stop-query`: Stop (and close) the query.

The API consists of the following replies:

* `start-query-result`: Reply to the start-query request.
* `query-result`: Reply to the fetch-query-result and immediate-query requests.

In the following examples, we'll use this data model:

{% code title="Example: " %}
```yang
container x {
  list host {
    key number;
    leaf number {
      type int32;
    }
    leaf enabled {
      type boolean;
    }
    leaf name {
      type string;
    }
    leaf address {
      type inet:ip-address;
    }
  }
}]
```
{% endcode %}

The actual format of the payload should be represented either in XML or JSON. Note how we indicate the type of content using the `Content-Type` HTTP header. For XML, it could look like this:

{% code title="Example: Example of a " %}
```http
POST /restconf/tailf/query
Content-Type: application/yang-data+xml

<start-query xmlns="http://tail-f.com/ns/tailf-rest-query">
  <foreach>
    /x/host[enabled = 'true']
  </foreach>
  <select>
    <label>Host name</label>
    <expression>name</expression>
    <result-type>string</result-type>
  </select>
  <select>
    <expression>address</expression>
    <result-type>string</result-type>
  </select>
  <sort-by>name</sort-by>
  <limit>100</limit>
  <offset>1</offset>
  <timeout>600</timeout>
</start-query>]
```
{% endcode %}

The same request in JSON format would look like:

{% code title="Example: JSON Example of a " %}
```http
POST /restconf/tailf/query
Content-Type: application/yang-data+json

{
 "start-query": {
   "foreach": "/x/host[enabled = 'true']",
   "select": [
     {
       "label": "Host name",
       "expression": "name",
       "result-type": ["string"]
     },
     {
       "expression": "address",
       "result-type": ["string"]
     }
   ],
   "sort-by": ["name"],
   "limit": 100,
   "offset": 1,
   "timeout": 600
 }
}]
```
{% endcode %}

An informal interpretation of this query is:

For each `/x/host` where `enabled` is true, select its `name`, and `address`, and return the result sorted by `name`, in chunks of 100 result items at a time.

Let us discuss the various pieces of this request. To start with, when using XML, we need to specify the namespace as shown:

```xml
<start-query xmlns="http://tail-f.com/ns/tailf-rest-query">
```

The actual XPath query to run is specified by the `foreach` element. The example below will search for all `/x/host` nodes that have the `enabled` node set to `true`:

```xml
<foreach>
  /x/host[enabled = 'true']
</foreach>
```

Now we need to define what we want to have returned from the node set by using one or more `select` sections. What to actually return is defined by the XPath `expression`.

Choose how the result should be represented. Basically, it can be the actual value or the path leading to the value. This is specified per select chunk. The possible result types are `string`, `path`, `leaf-value`_,_ and `inline`.

The difference between `string` and `leaf-value` is somewhat subtle. In the case of `string`, the result will be processed by the XPath function: `string()` (which if the result is a node-set will concatenate all the values). The `leaf-value` will return the value of the first node in the result. As long as the result is a leaf node, `string` and `leaf-value` will return the same result. In the example above, the `string` is used as shown below. Note that at least one `result-type` must be specified.

The result-type `inline` makes it possible to return the full sub-tree of data, either in XML or in JSON format. The data will be enclosed with a tag: `data`.

It is possible to specify an optional `label` for a convenient way of labeling the returned data:

```xml
<select>
  <label>Host name</label>
  <expression>name</expression>
  <result-type>string</result-type>
</select>
<select>
  <expression>address</expression>
  <result-type>string</result-type>
</select>
```

The returned result can be sorted. This is expressed as an XPath expression, which in most cases is very simple and refers to the found node-set. In this example, we sort the result by the content of the `name` node:

```xml
<sort-by>name</sort-by>
```

With the `offset` element, we can specify at which node we should start to receive the result. The default is 1, i.e., the first node in the resulting node set.

```xml
<offset>1</offset>
```

It is possible to set a custom timeout when starting or resetting a query. Each time a function is called, the timeout timer resets. The default is 600 seconds, i.e. 10 minutes.

```xml
<timeout>600</timeout>
```

The reply to this request would look something like this:

```xml
<start-query-result>
  <query-handle>12345</query-handle>
</start-query-result>
```

The query handle (in this example '12345') must be used in all subsequent calls. To retrieve the result, we can now send:

```xml
<fetch-query-result xmlns="http://tail-f.com/ns/tailf-rest-query">
  <query-handle>12345</query-handle>
</fetch-query-result>
```

Which will result in something like the following:

```xml
<query-result xmlns="http://tail-f.com/ns/tailf-rest-query">
  <result>
    <select>
      <label>Host name</label>
      <value>One</value>
    </select>
    <select>
      <value>10.0.0.1</value>
    </select>
  </result>
  <result>
    <select>
      <label>Host name</label>
      <value>Three</value>
    </select>
    <select>
      <value>10.0.0.3</value>
    </select>
  </result>
</query-result>
```

If we try to get more data with the `fetch-query-result`, we might get more `result` entries in return until no more data exists and we get an empty query result back:

```xml
<query-result xmlns="http://tail-f.com/ns/tailf-rest-query">
</query-result>
```

Finally, when we are done we stop the query:

```xml
<stop-query xmlns="http://tail-f.com/ns/tailf-rest-query">
  <query-handle>12345</query-handle>
</stop-query>
```

### Reset a Query

If we want to go back into the stream of received data chunks and have them repeated, we can do that with the `reset-query` request. In the example below, we ask to get results from the 42nd result entry:

```xml
<reset-query xmlns="http://tail-f.com/ns/tailf-rest-query">
  <query-handle>12345</query-handle>
  <offset>42</offset>
</reset-query>
```

### Immediate Query <a href="#d5e2226" id="d5e2226"></a>

If we want to get the entire result sent back to us, using only one request, we can do this by using the `immediate-query`. This function takes similar arguments as `start-query` and returns the entire result analogous with the result from a `fetch-query-result` request. Note that it is not possible to paginate or set an offset start node for the result list; i.e. the options `limit` and `offset` are ignored.

## Partial Responses <a href="#ncs.northbound.partial_response" id="ncs.northbound.partial_response"></a>

This functionality is supported if the `http://tail-f.com/ns/restconf/partial-response/1.0` capability is presented. See also [How to View the Capabilities of the RESTCONF Server](restconf-api.md#ncs.northbound.restconf.capabilities).

By default, the server sends back the full representation of a resource after processing a request. For better performance, the server can be instructed to send only the nodes the client really needs in a partial response.

To request a partial response for a set of list entries, use the `offset` and `limit` query parameters to specify a limited set of entries to be returned.

In the following example, we retrieve only two entries, skipping the first entry and then returning the next two entries:

{% code title="Example: Partial Response" %}
```http
GET /restconf/data/example-jukebox:jukebox/library/artist?offset=1&limit=2
Accept: application/yang-data+json

...in return we will get the second and third elements of the list...
```
{% endcode %}

## Hidden Nodes

This functionality is supported if the `http://tail-f.com/ns/restconf/unhide/1.0` capability is presented. See also [How to View the Capabilities of the RESTCONF Server](restconf-api.md#ncs.northbound.restconf.capabilities).

By default, hidden nodes are not visible in the RESTCONF interface. To unhide hidden nodes for retrieval or editing, clients can use the query parameter `unhide` or set parameter `showHidden` to `true` under `/confdConfig/restconf` in `confd.conf` file. The query parameter `unhide` is supported for RPC and action invocation.

The format of the `unhide` parameter is a comma-separated list of

```xml
<groupname>[;<password>]
```

As an example:

```
unhide=extra,debug;secret
```

This example unhides the unprotected group _extra_ and the password-protected group `debug` with the password `secret;`.

## Trace Context

This functionality is supported if the `urn:ietf:params:xml:ns:yang:traceparent:1.0` and `urn:ietf:params:xml:ns:yang:tracestate:1.0` capability is presented. See also [How to View the Capabilities of the RESTCONF Server](restconf-api.md#ncs.northbound.restconf.capabilities).

RESTCONF supports the IETF standard draft [I-D.draft-ietf-netconf-restconf-trace-ctx-headers-00](https://www.ietf.org/archive/id/draft-ietf-netconf-restconf-trace-ctx-headers-00.html), that is an adaption of the [W3C Trace Context](https://www.w3.org/TR/2021/REC-trace-context-1-20211123/) standard. Trace Context standardizes the format of `trace-id`, `parent-id`, and key-value pairs to be sent between distributed entities. The `parent-id` will become the `parent-span-id` for the next generated `span-id` in NSO.

Trace Context consists of two HTTP headers `traceparent` and `tracestate`. Header `traceparent` must be of the format

```
traceparent = <version>-<trace-id>-<parent-id>-<flags>
```

where `version` = "00" and `flags` = "01". The support for the values of `version` and `flags` may change in the future depending on the extension of the standard or functionality.

An example of header `traceparent` in use is:

```
traceparent: 00-100456789abcde10123456789abcde10-001006789abcdef0-01
```

Header `tracestate` is a vendor-specific list of key-value pairs. An example of the header `tracestate` in use is:

```
tracestate: key1=value1,key2=value2
```

where a value may contain space characters but not end with a space.

NSO implements Trace Context alongside the legacy way of handling `trace-id`, where the `trace-id` comes as a query parameter. These two different ways of handling `trace-id` cannot be used at the same time. If both are used, the request generates an error response. If a request does not include `trace-id` or the header `traceparent`, a `traceparent` will be generated internally in NSO. NSO will consider the headers of Trace Context in RESTCONF requests if the `trace-id` element is enabled in the configuration file. Trace Context is handled by the progress trace functionality, see also [Progress Trace](../../advanced-development/progress-trace.md) in Development.

## Configuration Metadata <a href="#d5e2268" id="d5e2268"></a>

It is possible to associate metadata with the configuration data. For RESTCONF, resources such as containers, lists as well as leafs and leaf-lists can have such meta-data. For XML, this meta-data is represented as attributes attached to the XML element in question. For JSON, there does not exist a natural way to represent this info. Hence a special special notation has been introduced, based on the [RFC 7952](https://www.ietf.org/rfc/rfc7952.txt), see the example below.

{% code title="Example: XML Representation of Metadata" %}
```xml
<x xmlns="urn:x" xmlns:x="urn:x">
  <id tags=" important ethernet " annotation="hello world">42</id>
  <person annotation="This is a person">
    <name>Bill</name>
    <person annotation="This is another person">grandma</person>
  </person>
</x>
```
{% endcode %}

{% code title="Example: JSON Representation of Metadata" %}
```json
{
  "x": {
    "foo": 42,
    "@foo": {"tailf_netconf:tags": ["tags","for","foo"],
             "tailf_netconf:annotation": "annotation for foo"},
    "y": {
      "@": {"tailf_netconf:annotation": "Annotation for parent y"},
      "y": 1,
      "@y": {"tailf_netconf:annotation": "Annotation for sibling y"}
    }
  }
}

```
{% endcode %}

The meta-data for an object is represented by another object constructed either of an "@" sign if the meta-data object refers to the parent object, or by the object name prefixed with an "@" sign if the meta-data object refers to a sibling object.

Note that the meta-data node types, e.g., tags and annotations, are prefixed by the module name of the YANG module where the meta-data object is defined. This representation conforms to [RFC 7952 Section 5.2](https://www.rfc-editor.org/rfc/rfc7952.html#section-5.2). The YANG module name prefixes for meta-data node types are listed below:

| Meta-data type    | Prefix                       |
| ----------------- | ---------------------------- |
| `origin`          | `ietf-origin`                |
| `inactive/active` | `tailf-netconf-inactive`     |
| `default`         | `ietf-netconf-with-defaults` |
| `All other`       | `tailf_netconf`              |

It is also possible to set meta-data objects in JSON format, except for setting the `default` and `insert` meta-data types, which are not supported using JSON.

## Authentication Cache <a href="#d5e2282" id="d5e2282"></a>

The RESTCONF server maintains an authentication cache. When authenticating an incoming request for a particular `User:Password`, it is first checked if the User exists in the cache and if so, the request is processed. This makes it possible to avoid the, potentially time-consuming, login procedure that will take place in case of a cache miss.

Cache entries have a maximum Time-To-Live (TTL) and upon expiry, a cache entry is removed which will cause the next request for that User to perform the normal login procedure. The TTL value is configurable via the `auth-cache-ttl` parameter, as shown in the example. Note that, by setting the TTL value to `PT0S` (zero), the cache is effectively turned off.

It is also possible to combine the Client's IP address with the User name as a key into the cache. This behavior is disabled by default. It can be enabled by setting the `enable-auth-cache-client-ip` parameter to `true`. With this enabled, only a Client coming from the same IP address may get a hit in the authentication cache.

{% code title="Example: NSO Configuration of the Authentication Cache TTL" %}
```
  ...
  <aaa>
     ...
     <restconf>
        <!-- Set the TTL to 10 seconds! -->
        <auth-cache-ttl>PT10S</auth-cache-ttl>
        <!-- Use both "User" and "ClientIP" as key into the AuthCache -->
        <enable-auth-cache-client-ip>false</enable-auth-cache-client-ip>
     </restconf>
     ...
  </aaa>
  ...
```
{% endcode %}

## Client IP via Proxy

It is possible to configure the NSO RESTCONF server to pick up the client IP address via an HTTP header in the request. A list of HTTP headers to look for is configurable via the `proxy-headers` parameter as shown in the example.

To avoid misuse of this feature, only requests from trusted sources will be searched for such an HTTP header. The list of trusted sources is configured via the `allowed-proxy-ip-prefix` as shown in the example.

{% code title="Example: NSO Configuration of Client IP via Proxy" %}
```
  ...
  <webui>
     ...
    <use-forwarded-client-ip>
      <proxy-headers>X-Forwarded-For</proxy-headers>
      <proxy-headers>X-REAL-IP</proxy-headers>
      <allowed-proxy-ip-prefix>10.12.34.0/24</allowed-proxy-ip-prefix>
      <allowed-proxy-ip-prefix>2001:db8:1234::/48</allowed-proxy-ip-prefix>
    </use-forwarded-client-ip>
     ...
  </webui>
  ...
```
{% endcode %}

## External Token Authentication/Validation

The NSO RESTCONF server can be set up to pass a long, a token used for authentication and/or validation of the client. Note that this requires `external authentication/validation` to be set up properly. See [External Token Validation](../../../administration/management/aaa-infrastructure.md#ug.aaa.external_validation) and [External Authentication](../../../administration/management/aaa-infrastructure.md#ug.aaa.external_authentication) for details.

With token authentication, we mean that the client sends a `User:Password` to the RESTCONF server, which will invoke an external executable that performs the authentication and upon success produces a token that the RESTCONF server will return in the `X-Auth-Token` HTTP header of the reply.

With token validation, we mean that the RESTCONF server will pass along any token, provided in the `X-Auth-Token` HTTP header, to an external executable that performs the validation. This external program may produce a new token that the RESTCONF server will return in the `X-Auth-Token` HTTP header of the reply.

To make this work, the following need to be configured in the `ncs.conf` file:

{% code title="Example: Configure RESTCONF External Token Authentication/Validation" %}
```
  ...
  <restconf>
     ...
    <token-response>
      <x-auth-token>true</x-auth-token>
    </token-response>
     ...
  </restconf>
  ...
```
{% endcode %}

It is also possible to have the RESTCONF server to return a HTTP cookie containing the token.

An HTTP cookie (web cookie, browser cookie) is a small piece of data that a server sends to the user's web browser. The browser may store it and send it back with the next request to the same server. This can be convenient in certain solutions, where typically, it is used to tell if two requests came from the same browser, keeping a user logged in, for example.

To make this happen, the name of the cookie needs to be configured as well as a `directives` string which will be sent as part of the cookie.

{% code title="Example: Configure the RESTCONF Token Cookie" %}
```
  ...
  <restconf>
     ...
     <token-cookie>
       <name>X-JWT-ACCESS-TOKEN</name>
       <directives>path=/; Expires=Tue, 19 Jan 2038 03:14:07 GMT;</directives>
     </token-cookie>
     ...
  </restconf>
  ...
```
{% endcode %}

## Custom Response HTTP Headers

The RESTCONF server can be configured to reply with particular HTTP headers in the HTTP response. For example, to support Cross-Origin Resource Sharing (CORS, [https://www.w3.org/TR/cors/](https://www.w3.org/TR/cors/)) there is a need to add a couple of headers to the HTTP Response.

We add the extra configuration parameter in `ncs.conf`.

{% code title="Example: NSO RESTCONF Custom Header Configuration" %}
```xml
    <restconf>
      <enabled>true</enabled>
      <custom-headers>
        <header>
          <name>Access-Control-Allow-Origin</name>
          <value>*</value>
        </header>
      </custom-headers>
    </restconf>
```
{% endcode %}

A number of HTTP headers have been deemed so important by security reasons that they, with sensible default values, per default will be included in the RESTCONF reply. The values can be changed by configuration in the `ncs.conf` file. Note that a configured empty value will effectively turn off that particular header from being included in the RESTCONF reply. The headers and their default values are:

*   `xFrameOptions`: `DENY`

    The default value indicates that the page cannot be displayed in a frame/iframe/embed/object regardless of the site attempting to do so.
*   `xContentTypeOptions`: `nosniff`

    The default value indicates that the MIME types advertised in the Content-Type headers should not be changed and be followed. In particular, should requests for CSS or Javascript be blocked in case a proper MIME type is not used.
*   `xXssProtection`: `1; mode=block`

    This header is a feature of Internet Explorer, Chrome and Safari that stops pages from loading when they detect reflected cross-site scripting (XSS) attacks. It enables XSS filtering and tells the browser to prevent rendering of the page if an attack is detected.
*   `strictTransportSecurity`: `max-age=15552000; includeSubDomains`

    The default value tells browsers that the RESTCONF server should only be accessed using HTTPS, instead of using HTTP. It sets the time that the browser should remember this and states that this rule applies to all of the server's subdomains as well.
*   `contentSecurityPolicy`: `default-src 'self'; block-all-mixed-content; base-uri 'self'; frame-ancestors 'none';`

    The default value means that: Resources like fonts, scripts, connections, images, and styles will all only load from the same origin as the protected resource. All mixed contents will be blocked and frame-ancestors like iframes and applets are prohibited.

## Generating Swagger for RESTCONF <a href="#d5e2380" id="d5e2380"></a>

Swagger is a documentation language used to describe RESTful APIs. The resulting specifications are used to both document APIs as well as generating clients in a variety of languages. For more information about the Swagger specification itself and the ecosystem of tools available for it, see [swagger.io](https://swagger.io/).

The RESTCONF API in NSO provides an HTTP-based interface for accessing data. The YANG modules loaded into the system define the schema for the data structures that can be manipulated using the RESTCONF protocol. The `yanger` tool provides options to generate Swagger specifications from YANG files. The tool currently supports generating specifications according to OpenAPI/Swagger 2.0 using JSON encoding. The tool supports the validation of JSON bodies in body parameters and response bodies, and XML content validation is not supported.

YANG and Swagger are two different languages serving slightly different purposes. YANG is a data modeling language used to model configuration data, state data, Remote Procedure Calls, and notifications for network management protocols such as NETCONF and RESTCONF. Swagger is an API definition language that documents API resource structure as well as HTTP body content validation for applicable HTTP request methods. Translation from YANG to Swagger is not perfect in the sense that there are certain constructs and features in YANG that is not possible to capture completely in Swagger. The design of the translation is designed such that the resulting Swagger definitions are _more_ restrictive than what is expressed in the YANG definitions. This means that there are certain cases where a client can do more in the RESTCONF API than what the Swagger definition expresses. There is also a set of well-known resources defined in the [RESTCONF RFC 8040](https://tools.ietf.org/html/rfc8040) that are not part of the generated Swagger specification, notably resources related to event streams.

### Using Y**anger** to Generate Swagger <a href="#d5e2390" id="d5e2390"></a>

The `yanger` tool is a YANG parser and validator that provides options to convert YANG modules to a multitude of formats including Swagger. You use the `-f swagger` option to generate a Swagger definition from one or more YANG files. The following command generates a Swagger file named `example.json` from the `example.yang` YANG file:

```
yanger -t expand -f swagger example.yang -o example.json      
```

It is only supported to generate Swagger from one YANG module at a time. It is possible however to augment this module by supplying additional modules. The following command generates a Swagger document from `base.yang` which is augmented by `base-ext-1.yang` and `base-ext-2.yang`:

<pre><code><strong>yanger -t expand -f swagger base.yang base-ext-1.yang base-ext-2.yang -o base.json
</strong></code></pre>

Only supplying augmenting modules is not supported.

Use the `--help` option to the `yanger` command to see all available options:

```
yanger --help       
```

The complete list of options related to Swagger generation is:

```
Swagger output specific options:
  --swagger-host                    Add host to the Swagger output
  --swagger-basepath                Add basePath to the Swagger output
  --swagger-version                 Add version url to the Swagger output.
                                    NOTE: this will override any revision
                                    in the yang file
  --swagger-tag-mode                Set tag mode to group resources. Valid
                                    values are: methods, resources, all
                                    [default: all]
  --swagger-terms                   Add termsOfService to the Swagger
                                    output
  --swagger-contact-name            Add contact name to the Swagger output
  --swagger-contact-url             Add contact url to the Swagger output
  --swagger-contact-email           Add contact email to the Swagger output
  --swagger-license-name            Add license name to the Swagger output
  --swagger-license-url             Add license url to the Swagger output
  --swagger-top-resource            Generate only swagger resources from
                                    this top resource. Valid values are:
                                    root, data, operations, all [default:
                                    all]
  --swagger-omit-query-params       Omit RESTCONF query parameters
                                    [default: false]
  --swagger-omit-body-params        Omit RESTCONF body parameters
                                    [default: false]
  --swagger-omit-form-params        Omit RESTCONF form parameters
                                    [default: false]
  --swagger-omit-header-params      Omit RESTCONF header parameters
                                    [default: false]
  --swagger-omit-path-params        Omit RESTCONF path parameters
                                    [default: false]
  --swagger-omit-standard-statuses  Omit standard HTTP response statuses.
                                    NOTE: at least one successful HTTP
                                    status will still be included
                                    [default: false]
  --swagger-methods                 HTTP methods to include. Example:
                                    --swagger-methods "get, post"
                                    [default: "get, post, put, patch,
                                    delete"]
  --swagger-path-filter             Filter out paths matching a path filter.
                                    Example: --swagger-path-filter
                                    "/data/example-jukebox/jukebox"
  --swagger-only-actions            Only emit Swagger output for Yang actions
                                    [default: false]
  --swagger-only-nso-services       Only emit Swagger output for NSO Services
                                    [default: false]
  --swagger-hide-nso-services-data  Hide imported NSO services data
                                    [default: false]
  --swagger-only-list-keys          Only emit Swagger output for the keys in
                                    lists [default: false]
  --swagger-max-depth               Only emit Swagger output until Max-Depth
                                    is reached [default: -1]
  --swagger-unhide                  Unhide specified groups,
                                    example: --swagger-unhide "foo,bar"
  --swagger-unhide-all              Unhide all hidden groups [default: false]
```

Using the `example-jukebox.yang` from the [RESTCONF RFC 8040](https://tools.ietf.org/html/rfc8040), the following example generates a comprehensive Swagger definition using a variety of Swagger-related options:

{% code title="Example: Comprehensive Swagger Generation Example" %}
```
yanger -p . -t expand -f swagger example-jukebox.yang \
       --swagger-host 127.0.0.1:8080 \
       --swagger-basepath /restconf \
       --swagger-version "My swagger version 1.0.0.1" \
       --swagger-tag-mode all \
       --swagger-terms "http://my-terms.example.com" \
       --swagger-contact-name "my contact name" \
       --swagger-contact-url "http://my-contact-url.example.com" \
       --swagger-contact-email "my-contact-email@example.com" \
       --swagger-license-name "my license name" \
       --swagger-license-url "http://my-license-url.example.com" \
       --swagger-top-resource all \
       --swagger-omit-query-params false \
       --swagger-omit-body-params false \
       --swagger-omit-form-params false \
       --swagger-omit-header-params false \
       --swagger-omit-path-params false \
       --swagger-omit-standard-statuses false \
       --swagger-methods "post, get, patch, put, delete, head, options"
```
{% endcode %}

For a large YANG model the generated Swagger JSON output also becomes very large; so in order to restrict the amount of JSON output, a number of switches can be used, for example: `--swagger-only-actions` or `--swagger-max-depth`, etc.

Note that, per default, any hidden YANG elements will not show up in the JSON output. This behavior can be modified by using the switches: `--swagger-unhide-all` and `--swagger-unhide`.
