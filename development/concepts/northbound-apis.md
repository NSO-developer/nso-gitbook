---
description: Understand different types of northbound APIs and their working mechanism.
---

# Northbound APIs

This section describes the various northbound programmatic APIs in NSO NETCONF, REST, and SNMP. These APIs are used by external systems that need to communicate with NSO, such as portals, OSS, or BSS systems.

NSO has two northbound interfaces intended for human usage, the CLI and the WebUI. These interfaces are described in [NSO CLI](../../operation-and-usage/ops/) and [Web User Interface](../../operation-and-usage/webui/) respectively.

There are also programmatic Java, Python, and Erlang APIs intended to be used by applications integrated with NSO itself. See [Running Application Code](../introduction-to-automation/applications-in-nso.md#ncs.development.applications.running) for more information about these APIs.

## Integrating an External System with NSO <a href="#d5e48" id="d5e48"></a>

There are two APIs to choose from when an external system should communicate with NSO:

* NETCONF
* REST

Which one to choose is mostly a subjective matter. REST may, at first sight, appear to be simpler to use, but is not as feature-rich as NETCONF. By using a NETCONF client library such as the open source Java library [JNC](https://github.com/tail-f-systems/JNC) or Python library [ncclient](https://github.com/ncclient/ncclient), the integration task is significantly reduced.

Both NETCONF and REST provide functions for manipulating the configuration (including creating services) and reading the operational state from NSO. NETCONF provides more powerful filtering functions than REST.

NETCONF and SNMP can be used to receive alarms as notifications from NSO. NETCONF provides a reliable mechanism to receive notifications over SSH, whereas SNMP notifications are sent over UDP.

Regardless of the protocol you choose for integration, keep in mind all of them communicate with the NSO server over network sockets, which may be unreliable. Additionally, write transactions in NSO can fail if they conflict with another, concurrent transaction. As a best practice, the client implementation should be able to gracefully handle such errors and be prepared to retry requests. For details on the NSO concurrency, refer to the [NSO Concurrency Model.](nso-concurrency-model.md)

## The NSO NETCONF Server <a href="#the-nso-netconf-server" id="the-nso-netconf-server"></a>

This section describes the northbound NETCONF implementation in NSO. As of this writing, the server supports the following specifications:

* [RFC 4741](https://www.ietf.org/rfc/rfc4741.txt): NETCONF Configuration Protocol
* [RFC 4742](https://www.ietf.org/rfc/rfc4742.txt): Using the NETCONF Configuration Protocol over Secure Shell (SSH)
* [RFC 5277](https://www.ietf.org/rfc/rfc5277.txt): NETCONF Event Notifications
* [RFC 5717](https://www.ietf.org/rfc/rfc5717.txt): Partial Lock Remote Procedure Call (RPC) for NETCONF
* [RFC 6020](https://www.ietf.org/rfc/rfc6020.txt): YANG - A Data Modeling Language for the Network Configuration Protocol (NETCONF)
* [RFC 6021](https://www.ietf.org/rfc/rfc6021.txt): Common YANG Data Types
* [RFC 6022](https://www.ietf.org/rfc/rfc6022.txt): YANG Module for NETCONF Monitoring
* [RFC 6241](https://www.ietf.org/rfc/rfc6241.txt): Network Configuration Protocol (NETCONF)
* [RFC 6242](https://www.ietf.org/rfc/rfc4742.txt): Using the NETCONF Configuration Protocol over Secure Shell (SSH)
* [RFC 6243](https://www.ietf.org/rfc/rfc6243.txt): With-defaults capability for NETCONF
* [RFC 6470](https://www.ietf.org/rfc/rfc6470.txt): NETCONF Base Notifications
* [RFC 6536](https://www.ietf.org/rfc/rfc6536.txt): NETCONF Access Control Model
* [RFC 6991](https://www.ietf.org/rfc/rfc6991.txt): Common YANG Data Types
* [RFC 7895](https://www.ietf.org/rfc/rfc7895.txt): YANG Module Library
* [RFC 7950](https://www.ietf.org/rfc/rfc7950.txt): The YANG 1.1 Data Modeling Language
* [RFC 8071](https://www.ietf.org/rfc/rfc8071.txt): NETCONF Call Home and RESTCONF Call Home
* [RFC 8342](https://www.ietf.org/rfc/rfc8342.txt): Network Management Datastore Architecture (NMDA)
* [RFC 8525](https://www.ietf.org/rfc/rfc8525.txt): YANG Library
* [RFC 8528](https://www.ietf.org/rfc/rfc8528.txt): YANG Schema Mount
* [RFC 8526](https://www.ietf.org/rfc/rfc8526.txt): NETCONF Extensions to Support the Network Management Datastore Architecture
* [RFC 8639](https://www.ietf.org/rfc/rfc8639.txt): Subscription to YANG Notifications
* [RFC 8640](https://www.ietf.org/rfc/rfc8640.txt): Dynamic Subscription to YANG Events and Datastores over NETCONF
* [RFC 8641](https://www.ietf.org/rfc/rfc8641.txt): Subscription to YANG Notifications for Datastore Updates

{% hint style="info" %}
For the `<delete-config>` operation specified in RFC 4741 / RFC 6241, only `<url>` with scheme `file` is supported for the `<target>` parameter - i.e. no data stores can be deleted. The concept of deleting a data store is not well defined and is at odds with the transaction-based configuration management of NSO. To delete the entire contents of a data store, with full transactional support, a `<copy-config>` with an empty `<config/>` element for the `<source>` parameter can be used.
{% endhint %}

{% hint style="info" %}
For the `<partial-lock>` operation, RFC 5717, section 2.4.1 says that if a node in the scope of the lock is deleted by the session owning the lock, it is removed from the scope of the lock. In NSO this is not true; the deleted node is kept in the scope of the lock.
{% endhint %}

NSO NETCONF northbound API can be used by arbitrary NETCONF clients. A simple Python-based NETCONF client called `netconf-console` is shipped as source code in the distribution. See [Using netconf-console](northbound-apis.md#ug.netconf\_agent.netconf\_console) for details. Other NETCONF clients will work too, as long as they adhere to the NETCONF protocol. If you need a Java client, the open-source client [JNC](https://github.com/tail-f-systems/JNC) can be used.

When integrating NSO into larger OSS/NMS environments, the NETCONF API is a good choice of integration point.

### Protocol Capabilities <a href="#d5e142" id="d5e142"></a>

The NETCONF server in NSO supports the following capabilities in both NETCONF 1.0 ([RFC 4741](https://www.ietf.org/rfc/rfc4741.txt)) and NETCONF 1.1 ([RFC 6241](https://www.ietf.org/rfc/rfc6241.txt)).

<table><thead><tr><th width="234">Capability</th><th>Description</th></tr></thead><tbody><tr><td><code>:writable-running</code></td><td>This capability is always advertised.</td></tr><tr><td><code>:candidate</code></td><td>Not supported by NSO.</td></tr><tr><td><code>:confirmed-commit</code></td><td>Not supported by NSO.</td></tr><tr><td><code>:rollback-on-error</code></td><td>This capability allows the client to set the <code>&#x3C;error-option></code> parameter to <code>rollback-on-error</code>. The other permitted values are <code>stop-on-error</code> (default) and <code>continue-on-error</code>. Note that the meaning of the word "error" in this context is not defined in the specification. Instead, the meaning of this word must be defined by the data model. Also, note that if <code>stop-on-error</code> or <code>continue-on-error</code> is triggered by the server, it means that some parts of the edit operation succeeded, and some parts didn't. The error <code>partial-operation</code> must be returned in this case. <code>partial-operation</code> is obsolete and should not be returned by a server. If some other error occurs (i.e. an error not covered by the meaning of "error" above), the server generates an appropriate error message, and the data store is unaffected by the operation.<br><br>The NSO server never allows partial configuration changes, since it might result in inconsistent configurations, and recovery from such a state can be very difficult for a client. This means that regardless of the value of the <code>&#x3C;error-option></code> parameter, NSO will always behave as if it had the value <code>rollback-on-error</code>. So in NSO, the meaning of the word "error" in <code>stop-on-error</code> and <code>continue-on-error</code>, is something that never can happen.<br><br>It is possible to configure the NETCONF server to generate an <code>operation-not-supported</code> error if the client asks for the <code>error-option</code> <code>continue-on-error</code>. See <a href="https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-5/man.5.ncs.conf">ncs.conf(5)</a> in Manual Pages.</td></tr><tr><td><code>:validate</code></td><td>NSO supports both version 1.0 and 1.1 of this capability.</td></tr><tr><td><code>:startup</code></td><td>Not supported by NSO.</td></tr><tr><td><code>:url</code></td><td><p>The URL schemes supported are <code>file</code>, <code>ftp</code>, and <code>sftp</code> (SSH File Transfer Protocol). There is no standard URL syntax for the <em><code>sftp</code></em> scheme, but NSO supports the syntax used by <code>curl</code>:</p><pre><code>sftp://&#x3C;user>:&#x3C;password>@&#x3C;host>/&#x3C;path>
</code></pre><p>Note that user name and password must be given for <code>sftp</code> URLs. NSO does not support <code>validate</code> from a URL.</p></td></tr><tr><td><code>:xpath</code></td><td>The NETCONF server supports XPath according to the W3C XPath 1.0 specification (<a href="https://www.w3.org/TR/xpath">https://www.w3.org/TR/xpath</a>).</td></tr></tbody></table>

The following list of optional standard capabilities is also supported:

<table><thead><tr><th width="237">Capability</th><th>Description</th></tr></thead><tbody><tr><td><code>:notification</code></td><td>NSO implements the <code>urn:ietf:params:netconf:capability:notification:1.0</code> capability, including support for the optional replay feature. See <a href="northbound-apis.md#ug.netconf_agent.notif">Notification Capability</a> for details.</td></tr><tr><td><code>:with-defaults</code></td><td><p>NSO implements the <code>urn:ietf:params:netconf:capability:with-defaults:1.0</code> capability, which is used by the server to inform the client how default values are handled by the server, and by the client to control whether default values should be generated to replies or not.</p><p>If the capability is enabled, NSO also implements the <code>urn:ietf:params:netconf:capability:with-operational-defaults:1.0</code> capability, which targets the operational state datastore while the <code>:with-defaults</code> capability targets configuration data stores.</p></td></tr><tr><td><code>:yang-library:1.0</code></td><td>NSO implements the <code>urn:ietf:params:netconf:capability:yang-library:1.0</code> capability, which informs the client that the server implements the YANG module library <a href="https://www.ietf.org/rfc/rfc7895.txt">RFC 7895</a>, and informs the client about the current <code>module-set-id</code>.</td></tr><tr><td><code>:yang-library:1.1</code></td><td>NSO implements the <code>urn:ietf:params:netconf:capability:yang-library:1.1</code> capability, which informs the client that the server implements the YANG library <a href="https://www.ietf.org/rfc/rfc8525.txt">RFC 8525</a>, and informs the client about the current <code>content-id</code>.</td></tr></tbody></table>

### Protocol YANG Modules <a href="#d5e255" id="d5e255"></a>

In addition to the protocol capabilities listed above, NSO also implements a set of YANG modules that are closely related to the protocol.

* `ietf-netconf-nmda`: This module from [RFC 8526](https://www.ietf.org/rfc/rfc8526.txt) defines the NMDA extension to NETCONF. It defines the following features:
* `origin`: Indicates that the server supports the origin annotation. It is not advertised by default. The support for `origin` can be enabled in `ncs.conf` (see [ncs.conf(5)](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-5/man.5.ncs.conf) in Manual Pages ). If it is enabled, the `origin` feature is advertised.
* `with-defaults`: Advertised if the server supports the `:with-defaults` capability, which NSO does.
* `ietf-subscribed-notifications`: This module from [RFC 8639](https://www.ietf.org/rfc/rfc8639.txt) defines operations, configuration data nodes, and operational state data nodes related to notification subscriptions. It defines the following features:
* `configured`: Indicates that the server supports configured subscriptions. This feature is not advertised.
* `dscp`: Indicates that the server supports the ability to set the Differentiated Services Code Point (DSCP) value in outgoing packets. This feature is not advertised.
* `encode-json`: Indicates that the server supports JSON encoding of notifications. This is not applicable to NETCONF, and this feature is not advertised.
* `encode-xml`: Indicates that the server supports XML encoding of notifications. This feature is advertised by NSO.
* `interface-designation`: Indicates that a configured subscription can be configured to send notifications over a specific interface. This feature is not advertised.
* `qos`: Indicates that a publisher supports absolute dependencies of one subscription's traffic over another as well as weighted bandwidth sharing between subscriptions. This feature is not advertised.
* `replay`: Indicates that historical event record replay is supported. This feature is advertised by NSO.
* `subtree`: Indicates that the server supports subtree filtering of notifications. This feature is advertised by NSO.
* `supports-vrf`: Indicates that a configured subscription can be configured to send notifications from a specific VRF. This feature is not advertised.
* `xpath`: Indicates that the server supports XPath filtering of notifications. This feature is advertised by NSO.

In addition to this, NSO does not support pre-configuration or monitoring of subtree filters, and thus advertises a deviation module that deviates `/filters/stream-filter/filter-spec/stream-subtree-filter` and `/subscriptions/subscription/target/stream/stream-filter/within-subscription/filter-spec/stream-subtree-filter` as "not-supported".

There is basic support for monitoring subscriptions via the `/subscriptions` container. Currently, it is possible to view dynamic subscriptions' attributes: `subscription-id`, `stream`, `encoding`, `receiver`, `stop-time`, and `stream-xpath-filter`. Unsupported attributes are: `stream-subtree-filter`, `receiver/sent-event-records`, `receiver/excluded-event-records`, and `receiver/state`.

* `ietf-yang-push`: This module from [RFC 8641](https://www.ietf.org/rfc/rfc8641.txt) extends operations, data nodes, and operational state defined in `ietf-subscribed-notifications;` and also introduces continuous and customizable notification subscriptions for updates from running and operational datastores. It defines the same features as `ietf-subscribed-notifications` and also the following feature:
  * `on-change`: Indicates that on-change triggered notifications are supported. This feature is advertised by NSO but only supported on the running datastore.

In addition to this, NSO does not support pre-configuration or monitoring of subtree filters and thus advertises a deviation module that deviates `/filters/selection-filter/filter-spec/datastore-subtree-filter` and `/subscriptions/subscription/target/datastore/selection-filter/within-subscription/filter-spec/datastore-subtree-filter` as "not-supported".

The monitoring of subscriptions via the `subscriptions` container does currently not support the attributes: `periodic/period`, `periodic/state`, `on-change/dampening-period`, `on-change/sync-on-start`, `on-change/excluded-change`.

### Advertising Capabilities and YANG Modules <a href="#d5e376" id="d5e376"></a>

All enabled NETCONF capabilities are advertised in the hello message that the server sends to the client.

A YANG module is supported by the NETCONF server if its fxs file is found in NSO's loadPath, and if the fxs file is exported to NETCONF.

The following YANG modules are built-in, which means that their `fxs` files need not be present in the loadPath. If they are found in the loadPath they are skipped.

* `ietf-netconf`
* `ietf-netconf-with-defaults`
* `ietf-yang-library`
* `ietf-yang-types`
* `ietf-inet-types`
* `ietf-restconf`
* `ietf-datastores`
* `ietf-yang-patch`

All built-in modules are always supported by the server.

All YANG version 1 modules supported by the server are advertised in the hello message, according to the rules defined in [RFC 6020](https://www.ietf.org/rfc/rfc6020.txt).

All YANG version 1 and version 1.1 modules supported by the server are advertised in the YANG library.

If a YANG module (any version) is supported by the server, and its .yang or .yin file is found in the `fxs` file or in the loadPath, then the module is also advertised in the `schema` list defined in `ietf-netconf-monitoring`, made available for download with the RPC operation `get-schema`, and if RESTCONF is enabled, also advertised in the `schema` leaf in `ietf-yang-library`. See [Monitoring of the NETCONF Server](northbound-apis.md#ug.netconf\_agent.monitoring).

### Advertising Device YANG Modules <a href="#d5e417" id="d5e417"></a>

NSO uses [YANG Schema Mount](https://www.ietf.org/rfc/rfc8528.txt) to mount the data models for the devices. There are two mount points, one for the configuration (in `/devices/device/config`), and one for operational state data (in `/devices/device/live-status`). As defined in [YANG Schema Mount](https://www.ietf.org/rfc/rfc8528.txt), a client can read the `module` list from the YANG library in each of these mount points to learn which YANG models each device supports via NSO.

For example, to get the YANG library data for the device `x0`, we can do:

```
$ netconf-console --get -x '/devices/device[name="x0"]/config/yang-library'
<?xml version="1.0" encoding="UTF-8"?>
<rpc-reply xmlns="urn:ietf:params:xml:ns:netconf:base:1.0" message-id="1">
  <data>
    <devices xmlns="http://tail-f.com/ns/ncs">
      <device>
        <name>x0</name>
        <config>
          <yang-library xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-library">
            <module-set>
              <name>common</name>
              <module>
                <name>a</name>
                <namespace>urn:a</namespace>
              </module>
              <module>
                <name>b</name>
                <namespace>urn:b</namespace>
              </module>
            </module-set>
            <schema>
              <name>common</name>
              <module-set>common</module-set>
            </schema>
            <datastore>
              <name xmlns:ds="urn:ietf:params:xml:ns:yang:ietf-datastores">\
                 ds:running\
              </name>
              <schema>common</schema>
            </datastore>
            <datastore>
              <name xmlns:ds="urn:ietf:params:xml:ns:yang:ietf-datastores">\
                ds:intended\
              </name>
              <schema>common</schema>
            </datastore>
            <datastore>
              <name xmlns:ds="urn:ietf:params:xml:ns:yang:ietf-datastores">\
                ds:operational\
              </name>
              <schema>common</schema>
            </datastore>
            <content-id>f0071b28c1e586f2e8609da036379a58</content-id>
          </yang-library>
        </config>
      </device>
    </devices>
  </data>
</rpc-reply>
```

The set of modules reported for a device is the set of modules that NSO knows, i.e., the set of modules compiled for the specific device type. This means that all devices of the same device type will report the same set of modules. Also, note that the device may support other modules that are not known to NSO. Such modules are not reported here.

### NETCONF Transport Protocols <a href="#ug.netconf_agent.transport" id="ug.netconf_agent.transport"></a>

The NETCONF server natively supports the mandatory SSH transport, i.e., SSH is supported without the need for an external SSH daemon (such as `sshd`). It also supports integration with OpenSSH.

#### Using OpenSSH <a href="#d5e432" id="d5e432"></a>

NSO is delivered with a program **netconf-subsys** which is an OpenSSH subsystem program. It is invoked by the OpenSSH daemon after successful authentication. It functions as a relay between the ssh daemon and NSO; it reads data from the ssh daemon from standard input and writes the data to NSO over a loopback socket, and vice versa. This program is delivered as source code in `$NCS_DIR/src/ncs/netconf/netconf-subsys.c`. It can be modified to fit the needs of the application. For example, it could be modified to read the group names for a user from an external LDAP server.

When using OpenSSH, the users are authenticated by OpenSSH, i.e., the user names are not stored in NSO. To use OpenSSH, compile the `netconf-subsys` program, and put the executable in e.g. `/usr/local/bin`. Then add the following line to the ssh daemon's config file, `sshd_config`:

```
Subsystem     netconf   /usr/local/bin/netconf-subsys
```

The connection from `netconf-subsys` to NSO can be arranged in one of two different ways:

1. Make sure NSO is configured to listen to TCP traffic on localhost, port 2023, and disable SSH in `ncs.conf` (see [ncs.conf(5)](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-5/man.5.ncs.conf) in Manual Pages ). (Re)start `sshd` and NSO. Or:
2. Compile `netconf-subsys` to use a connection to the IPC port instead of the NETCONF TCP transport (see the `netconf-subsys.c` source for details), and disable both TCP and SSH in `ncs.conf`. (Re)start `sshd` and NSO. This method may be preferable since it makes it possible to use the IPC Access Check (see [Restricting Access to the IPC Port](../../administration/advanced-topics/ipc-ports.md#ug.ncs\_advanced.ipc.restricting)) to restrict the unauthenticated access to NSO that is needed by `netconf-subsys`.

By default, the `netconf-subsys` program sends the names of the UNIX groups the authenticated user belongs to. To test this, make sure that NSO is configured to give access to the group(s) the user belongs to. The easiest for test is to give access to all groups.

### Configuring the NETCONF Server <a href="#d5e461" id="d5e461"></a>

NSO itself is configured through a configuration file called `ncs.conf`. For a description of the parameters in this file, please see the [ncs.conf(5)](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-5/man.5.ncs.conf) in Manual Pages man page.

#### Error Handling <a href="#d5e466" id="d5e466"></a>

When NSO processes `<get>`, `<get-config>`, and `<copy-config>` requests, the resulting data set can be very large. To avoid buffering huge amounts of data, NSO streams the reply to the client as it traverses the data tree and calls data provider functions to retrieve the data.

If a data provider fails to return the data it is supposed to return, NSO can take one of two actions. Either it simply closes the NETCONF transport (default), or it can reply with an inline RPC error and continue to process the next data element. This behavior can be controlled with the `/ncs-config/netconf/rpc-errors` configuration parameter (see [ncs.conf(5)](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-5/man.5.ncs.conf) in Manual Pages).

An inline error is always generated as a child element to the parent of the faulty element. For example, if an error occurs when retrieving the leaf element `mac-address` of an `interface` the error might be:

```
<interface>
  <name>atm1</name>
  <rpc-error xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <error-type>application</error-type>
    <error-tag>operation-failed</error-tag>
    <error-severity>error</error-severity>
    <error-message xml:lang="en">Failed to talk to hardware</error-message>
    <error-info>
      <bad-element>mac-address</bad-element>
    </error-info>
  </rpc-error>
  ...
</interface>
```

If a `get_next` call fails in the processing of a list, a reply might look like this:

```
<interface>
  <!-- successfully retrieved list entry -->
  <name>eth0</name>
  <mtu>1500</mtu>
  <!-- more leafs here -->
</interface>
<rpc-error xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
  <error-type>application</error-type>
  <error-tag>operation-failed</error-tag>
  <error-severity>error</error-severity>
  <error-message xml:lang="en">Failed to talk to hardware</error-message>
  <error-info>
    <bad-element>interface</bad-element>
  </error-info>
</rpc-error>
```

### Using `netconf-console` <a href="#ug.netconf_agent.netconf_console" id="ug.netconf_agent.netconf_console"></a>

The `netconf-console` program is a simple NETCONF client. It is delivered as Python source code and can be used as-is or modified.

When NSO has been started, we can use `netconf-console` to query the configuration of the NETCONF Access Control groups:

```
$ netconf-console --get-config -x /nacm/groups
<?xml version="1.0" encoding="UTF-8"?>
<rpc-reply xmlns="urn:ietf:params:xml:ns:netconf:base:1.0" message-id="1">
  <data>
    <nacm xmlns="urn:ietf:params:xml:ns:yang:ietf-netconf-acm">
      <groups>
        <group>
          <name>admin</name>
          <user-name>admin</user-name>
          <user-name>private</user-name>
        </group>
        <group>
          <name>oper</name>
          <user-name>oper</user-name>
          <user-name>public</user-name>
        </group>
      </groups>
    </nacm>
  </data>
</rpc-reply>
```

With the `-x` flag an XPath expression can be specified, to retrieve only data matching that expression. This is a very convenient way to extract portions of the configuration from the shell or from shell scripts.

### Monitoring the NETCONF Server <a href="#ug.netconf_agent.monitoring" id="ug.netconf_agent.monitoring"></a>

[RFC 6022 - YANG Module for NETCONF Monitoring](https://www.ietf.org/rfc/rfc6022.txt) defines a YANG module, `ietf-netconf-monitoring`for monitoring of the NETCONF server. It contains statistics objects such as the number of RPCs received, status objects such as user sessions, and an operation to retrieve data models from the NETCONF server.

This data model defines an RPC operation, `get-schema`, which is used to retrieve YANG modules from the NETCONF server. NSO will report the YANG modules for all fxs files that are reported as capabilities, and for which the corresponding YANG or YIN file is stored in the fxs file or found in the loadPath. If a file is found in the loadPath, it has priority over a file stored in the `fxs` file. Note that by default, the module and its submodules are stored in the `fxs` file by the compiler.

If the YANG (or YIN files) are copied into the loadPath, they can be stored as is or compressed with gzip. The filename extension MUST be `.yang`, `.yin`, `.yang.gz`, or `.yin.gz`.

Also available is a Tail-f-specific data model, `tailf-netconf-monitoring`, which augments `ietf-netconf-monitoring` with additional data about files available for usage with the `<copy-config>` command with a `file` `<url>` source or target. `/ncs-config/netconf-north-bound/capabilities/url/enabled` and `/ncs-config/netconf-north-bound/capabilities/url/file/enabled` must both be set to true. If rollbacks are enabled, those files are listed as well, and they can be loaded using `<copy-config>`.

This data model also adds data about which notification streams are present in the system and data about sessions that subscribe to the streams.

### Notification Capability <a href="#ug.netconf_agent.notif" id="ug.netconf_agent.notif"></a>

This section describes how NETCONF notifications are implemented within NSO, and how the applications generate these events.

Central to NETCONF notifications is the concept of a stream. The stream serves two purposes. It works like a high-level filtering mechanism for the client. For example, if the client subscribes to notifications on the `security` stream, it can expect to get security-related notifications only. Second, each stream may have its own log mechanism. For example, by keeping all debug notifications in a `debug` stream, they can be logged separately from the `security` stream.

#### Built-in Notification Streams <a href="#d5e521" id="d5e521"></a>

NSO has built-in support for the well-known stream `NETCONF`, defined in [RFC 5277](https://www.ietf.org/rfc/rfc5277.txt) and [RFC 8639](https://www.ietf.org/rfc/rfc8639.txt). NSO supports the notifications defined in [RFC 6470 - NETCONF Base Notifications](https://www.ietf.org/rfc/rfc6470.txt) on this stream. If the application needs to send any additional notifications on this stream, it can do so.

NSO can be configured to listen to notifications from devices and send those notifications to northbound NETCONF clients. The stream `device-notifications` is used for this purpose. To enable this, the stream `device-notifications` must be configured in `ncs.conf`, and additionally, subscriptions must be created in `/ncs:devices/device/notifications`.

#### Defining Notification Streams <a href="#d5e533" id="d5e533"></a>

It is up to the application to define which streams it supports. In NSO, this is done in `ncs.conf` (see [ncs.conf(5)](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-5/man.5.ncs.conf) in Manual Pages). Each stream must be listed, and whether it supports replay or not. The following example enables the built-in stream `device-notifications` with replay support, and an additional, application-specific stream `debug` without replay support:

```
<notifications>
  <event-streams>
    <stream>
      <name>device-notifications</name>
      <description>Notifications received from devices</description>
      <replay-support>true</replay-support>
      <builtin-replay-store>
        <enabled>true</enabled>
        <dir>/var/log</dir>
        <max-size>S10M</max-size>
        <max-files>50</max-files>
      </builtin-replay-store>
    </stream>
    <stream>
      <name>debug</name>
      <description>Debug notifications</description>
      <replay-support>false</replay-support>
    </stream>
  </event-streams>
</notifications>
```

The well-known stream `NETCONF` does not have to be listed, but if it isn't listed, it will not support replay.

#### Automatic Replay <a href="#d5e544" id="d5e544"></a>

NSO has built-in support for logging of notifications, i.e., if replay support has been enabled for a stream, NSO automatically stores all notifications on disk ready to be replayed should a NETCONF client ask for logged notifications. In the `ncs.conf` fragment above the security stream has been set up to use the built-in notification log/replay store. The replay store uses a set of wrapping log files on a disk (of a certain number and size) to store the security stream notifications.

The reason for using a wrap log is to improve replay performance whenever a NETCONF client asks for notifications in a certain time range. Any problems with log files not being properly closed due to hard power failures etc. are also kept to a minimum, i.e., automatically taken care of by NSO.

### Subscribed Notifications <a href="#ug.netconf_agent.subscribed_notif" id="ug.netconf_agent.subscribed_notif"></a>

This section describes how Subscribed Notifications are implemented for NETCONF within NSO.

Subscribed Notifications is defined in [RFC 8639](https://www.ietf.org/rfc/rfc8639.txt) and the NETCONF transport binding is defined in [RFC 8640](https://www.ietf.org/rfc/rfc8640.txt). Subscribed Notifications build upon NETCONF notifications defined in [RFC 5277](https://www.ietf.org/rfc/rfc5277.txt) and have a number of key improvements:

* Multiple subscriptions on a single transport session
* Support for dynamic and configured subscriptions
* Modification of an existing subscription in progress
* Per-subscription operational counters
* Negotiation of subscription parameters (through the use of hints returned as part of declined subscription requests)
* Subscription state change notifications (e.g., publisher-driven suspension, parameter modification)
* Independence from transport

#### Compatibility with NETCONF Notifications <a href="#d5e571" id="d5e571"></a>

Both NETCONF notifications and Subscribed Notifications can be used at the same time and are configured the same way in `ncs.conf`. However, there are some differences and limitations.

For Subscribed Notifications, a new subscription is requested by invoking the RPC `establish-subscription`. For NETCONF notifications, the corresponding RPC is `create-subscription`.

A NETCONF session can only have either the subscribers started with `create-subscription` or `establish-subscription` simultaneously.

*   If a session has subscribers established with `establish-subscription` and receives a request to create subscriptions with `create-subscription`, an `<rpc-error>` is sent containing `<error-tag>` `operation-not-supported`.

    If a session has subscribers created with `create-subscription` and receives a request to establish subscriptions with `establish-subscription`, an `<rpc-error>` is sent containing `<error-tag>` `operation-not-supported`.

Dynamic subscriptions send all notifications on the transport session where they were established.

#### Monitoring Subscriptions <a href="#ug.netconf_agent.subscribed_notif.monitoring" id="ug.netconf_agent.subscribed_notif.monitoring"></a>

Existing subscriptions and their configuration can be found in the `/subscriptions` container.

For example, for viewing all established subscriptions, we can do:

```
$ netconf-console --get -x /subscriptions
<?xml version="1.0" encoding="UTF-8"?>
<rpc-reply xmlns="urn:ietf:params:xml:ns:netconf:base:1.0" message-id="1">
  <data>
    <subscriptions xmlns="urn:ietf:params:xml:ns:yang:ietf-subscribed-notifications">
      subscription>
       <id>3</id>
       <stream-xpath-filter>/if:interfaces/interface[name='eth0']/enabled</stream-xpath-filter>
       <stream>interface</stream>
       <stop-time>2030-10-04T14:00:00+02:00</stop-time>
       <encoding>encode-xml</encoding>
       <receivers>
         <receiver>
           <name>127.0.0.1:57432</name>
           <state>active</state>
         </receiver>
       </receivers>
      /subscription>
    </subsrcriptions>
  </data>
</rpc-reply>
```

#### **Limitations**

It is not possible to establish a subscription with a stored filter from `/filters`.

The support for monitoring subscriptions has basic functionality. It is possible to read `subscription-id`, `stream`, `stream-xpath-filter`, `replay-start-time`, `stop-time`, `encoding`, `receivers/receiver/name`, and `receivers/receiver/state`.

The leaf `stream-subtree-filter` is deviated as "not-supported", hence can not be read.

The unsupported leafs in the subscriptions container are the following: `stream-subtree-filter`, `receiver/sent-event-records`, and `receiver/excluded-event-records`.

### YANG-Push <a href="#ug.netconf_agent.yang_push" id="ug.netconf_agent.yang_push"></a>

This section describes how YANG-Push is implemented for NETCONF within NSO.

YANG-Push is defined in [RFC 8641](https://www.ietf.org/rfc/rfc8641.txt) and the NETCONF transport binding is defined in [RFC 8640](https://www.ietf.org/rfc/rfc8640.txt). YANG-Push implementation in NSO introduces a subscription service that provides updates from a datastore. This implementation supports dynamic subscriptions on updates of datastore nodes. A subscribed receiver is provided with update notifications according to the terms of the subscription. There are two types of notification messages defined to provide updates and these are used according to subscription terms.

*   `push-update` notification is a complete, filtered update that reflects the data of the subscribed datastore. It is the type of notification that is used for `periodic` subscriptions. A `push-update` notification can also be used for the `on-change` subscriptions in case of a receiver asks for synchronization, either at the start of a new subscription or by sending a resync request for an established subscription.

    An example `push-update` notification:

    ```
    <notification xmlns="urn:ietf:params:xml:ns:netconf:notification:1.0">
      <eventTime>2020-06-10T10:00:00.00Z</eventTime>
      <push-update xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-push">
        <id>1</id>
        <datastore-contents>
          <interfaces xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">
            <interface>
              <name>eth0</name>
              <oper-status>up</oper-status>
            </interface>
          </interfaces>
        </datastore-contents>
      </push-update>
    </notification>
    ```
*   `push-change-update` notification is the most common type of notification that is used for `on-change` subscriptions. It provides a set of filtered changes that happened on the subscribed datastore since the last update notification. The update records are constructed in the form of `YANG-Patch Media Type` that is defined in [RFC 8072](https://www.ietf.org/rfc/rfc8072.txt).

    \
    An example `push-change-update` notification:

    ```
    <notification xmlns="urn:ietf:params:xml:ns:netconf:notification:1.0">
      <eventTime>2020-06-10T10:05:00.00Z</eventTime>
      <push-change-update
        xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-push">
        <id>2</id>
        <datastore-changes>
          <yang-patch>
            <patch-id>s2-p4</patch-id>
            <edit>
              <edit-id>edit1</edit-id>
              <operation>merge</operation>
              <target>/ietf-interfaces:interfaces</target>
              <value>
                <interfaces xmlns="urn:ietf:params:xml:ns:yang:ietf-interfaces">
                  <interface>
                    <name>eth0</name>
                    <oper-status>down</oper-status>
                  </interface>
                </interfaces>
              </value>
            </edit>
          </yang-patch>
        </datastore-changes>
      </push-change-update>
    </notification>
    ```

#### Periodic Subscriptions <a href="#d5e649" id="d5e649"></a>

For periodic subscriptions, updates are triggered periodically according to specified time interval. Optionally a reference `anchor-time` can be provided for a specified `period`.

#### On-Change Subscriptions <a href="#d5e654" id="d5e654"></a>

For on-change subscriptions, updates are triggered whenever a change is detected on the subscribed information. In the case of rapidly changing data, instead of receiving frequent notifications for every change, a receiver may specify a `dampening-period` to receive update notifications in a lower frequency. A receiver may request for synchronization at the start of a subscription by using `sync-on-start` option. A receiver may filter out specific types of changes by providing a list of `excluded-change` parameters.

To provide updates for `on-change` subscriptions on `operational` datastore, data provider applications are required to implement push-on-change callbacks. For more details, see the [PUSH ON-CHANGE CALLBACKS](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-3/fn.confd\_push\_on\_change) in the Manual Pages section of [confd\_lib\_dp(3)](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-3/man.3.confd\_lib\_dp) in Manual Pages.

#### YANG-Push Operations <a href="#d5e665" id="d5e665"></a>

In addition to RPCs defined in subscribed notifications, YANG-Push defines `resync-subscription` RPC. Upon receipt of `resync-subscription`, if the subscription is an on-change triggered type, a `push-update` notification is sent to the receiver according to the terms of the subscription. Otherwise, an appropriate error response is sent.

* `resync-subscription`

#### Monitoring the YANG-Push Subscriptions <a href="#d5e675" id="d5e675"></a>

YANG-Push subscriptions can be monitored in a similar way to Subscribed Notifications through /subscriptions container. For more information, see [Monitoring Subscriptions](northbound-apis.md#ug.netconf\_agent.subscribed\_notif.monitoring).

YANG-Push filters differ from the filters of Subscribed Notifications and they are specified as `datastore-xpath-filter` and `datastore-subtree-filter`. The leaf `datastore-subtree-filter` is deviated as "not-supported", and hence can not be monitored. Also, YANG-Push specific update trigger parameters `periodic/period`, `periodic/anchor-time`, `on-change/dampening-period`, `on-change/sync-on-start` and `on-change/excluded-change` are not supported for monitoring.

#### Limitations <a href="#d5e688" id="d5e688"></a>

* `modify-subscriptions` operation does not support changing a subscriptions update trigger type from `periodic` to `on-change` or vice versa.
* `on-change` subscriptions do not work for changes that are made through the CDB-API.
* `on-change` subscriptions do not work on internal callpoints such as `ncs-state`, `ncs-high-availability`, and `live-status`.

### Actions Capability <a href="#ug.netconf_agent.actions_ncs" id="ug.netconf_agent.actions_ncs"></a>

{% hint style="info" %}
This capability is deprecated since actions are now supported in standard YANG 1.1. It is recommended to use standard YANG 1.1 for actions.
{% endhint %}

This capability introduces a new RPC operation that is used to invoke actions defined in the data model. When an action is invoked, the instance on which the action is invoked is explicitly identified by a hierarchy of configuration or state data.

Here is a simple example that invokes the action `sync-from` on the device `ce1`. It uses the `netconf-console` command:

```
$ cat ./sync-from-ce1.xml
<action xmlns="http://tail-f.com/ns/netconf/actions/1.0">
  <data>
    <devices xmlns="http://tail-f.com/ns/ncs">
      <device>
        <name>ce1</name>
        <sync-from/>
      </device>
    </devices>
  </data>
</action>
$ netconf-console --rpc sync-from-ce1.xml
<?xml version="1.0" encoding="UTF-8"?>
<rpc-reply xmlns="urn:ietf:params:xml:ns:netconf:base:1.0" message-id="1">
  <data>
    <devices xmlns="http://tail-f.com/ns/ncs">
      <device>
        <name>ce1</name>
        <sync-from>
          <result>true</result>
        </sync-from>
      </device>
    </devices>
  </data>
</rpc-reply>
```

#### Capability Identifier <a href="#d5e717" id="d5e717"></a>

The action capability is identified by the following capability string:

```
  http://tail-f.com/ns/netconf/actions/1.0
```

### `transactions` Capability <a href="#ug.netconf_agent.transactions" id="ug.netconf_agent.transactions"></a>

This capability introduces four new RPC operations that are used to control a two-phase commit transaction on the NETCONF server. The normal `<edit-config>` operation is used to write data in the transaction, but the modifications are not applied until an explicit `<commit-transaction>` is sent.

This capability is formally defined in the YANG module `tailf-netconf-transactions`. It is recommended that this module be enabled.

A typical sequence of operations looks like this:

```
               C                           S
               |                           |
               |  capability exchange      |
               |-------------------------->|
               |<------------------------->|
               |                           |
               |   <start-transaction>     |
               |-------------------------->|
               |<--------------------------|
               |         <ok/>             |
               |                           |
               |     <edit-config>         |
               |-------------------------->|
               |<--------------------------|
               |         <ok/>             |
               |                           |
               |  <prepare-transaction>    |
               |-------------------------->|
               |<--------------------------|
               |         <ok/>             |
               |                           |
               |   <commit-transaction>    |
               |-------------------------->|
               |<--------------------------|
               |         <ok/>             |
               |                           |
```

#### Dependencies <a href="#d5e731" id="d5e731"></a>

None.

#### Capability Identifier <a href="#d5e734" id="d5e734"></a>

The `transactions` capability is identified by the following capability string:

```
  http://tail-f.com/ns/netconf/transactions/1.0
```

#### New Operation: `<start-transaction>` <a href="#d5e739" id="d5e739"></a>

**Description**

Starts a transaction towards a configuration datastore. There can be a single ongoing transaction per session at any time.

When a transaction has been started, the client can send any NETCONF operation, but any `<edit-config>` or `<copy-config>` operation sent from the client must specify the same `<target>` as the `<start-transaction>`, and any `<get-config>` must specify the same \<source> as `<start-transaction>`.

If the server receives an `<edit-config>` or `<copy-config>` with another `<target>`, or a `<get-config>` with another `<source>`, an error must be returned with an `<error-tag>` set to `invalid-value`.

The modifications sent in the `<edit-config>` operations are not immediately applied to the configuration datastore. Instead, they are kept in the transaction state of the server. The transaction state is only applied when a `<commit-transaction>` is received.

The client sends a `<prepare-transaction>` when all modifications have been sent.

**Parameters**

* `target:`\
  Name of the configuration datastore towards which the transaction is started.
* `with-inactive:`\
  If this parameter is given, the transaction will handle the `inactive` and `active` attributes. If given, it must also be given in the `<edit-config>` and `<get-config>` invocations in the transaction.

**Positive Response**

If the device can satisfy the request, an `<rpc-reply>` is sent that contains an `<ok>` element.

**Negative Response**

An `<rpc-error>` element is included in the `<rpc-reply>` if the request cannot be completed for any reason.

If there is an ongoing transaction for this session already, an error must be returned with `<error-app-tag>` set to `bad-state`.

**Example**

```
  <rpc message-id="101"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <start-transaction xmlns="http://tail-f.com/ns/netconf/transactions/1.0">
      <target>
       <running/>
      </target>
    </start-transaction>
  </rpc>

  <rpc-reply message-id="101"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <ok/>
  </rpc-reply>
```

#### New Operation: `<prepare-transaction>` <a href="#d5e772" id="d5e772"></a>

**Description**

Prepares the transaction state for commit. The server may reject the prepare request for any reason, for example, due to lack of resources or if the combined changes would result in an invalid configuration datastore.

After a successful `<prepare-transaction>`, the next transaction-related RPC operation must be `<commit-transaction>` or `<abort-transaction>`. Note that an `<edit-config>` cannot be sent before the transaction is either committed or aborted.

Care must be taken by the server to make sure that if `<prepare-transaction>` succeeds then the `<commit-transaction>` should not fail, since this might result in an inconsistent distributed state. Thus, `<prepare-transaction>` should allocate any resources needed to make sure the `<commit-transaction>` will succeed.

**Parameters**

None.

**Positive Response**

If the device was able to satisfy the request, an `<rpc-reply>` is sent that contains an `<ok>` element.

**Negative Response**

An `<rpc-error>` element is included in the `<rpc-reply>` if the request cannot be completed for any reason.

If there is no ongoing transaction in this session, or if the ongoing transaction already has been prepared, an error must be returned with `<error-app-tag>` set to `bad-state`.

**Example**

```
  <rpc message-id="103"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <prepare-transaction
       xmlns="http://tail-f.com/ns/netconf/transactions/1.0"/>
  </rpc>

  <rpc-reply message-id="103"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <ok/>
  </rpc-reply>
```

#### New Operation: `<commit-transaction>` <a href="#d5e793" id="d5e793"></a>

**Description**

Applies the changes made in the transaction to the configuration datastore. The transaction is closed after a `<commit-transaction>`.

**Parameters**

None.

**Positive Response**

If the device was able to satisfy the request, an `<rpc-reply>` is sent that contains an `<ok>` element.

**Negative Response**

An `<rpc-error>` element is included in the `<rpc-reply>` if the request cannot be completed for any reason.

If there is no ongoing transaction in this session, or if the ongoing transaction already has not been prepared, an error must be returned with `<error-app-tag>` set to `bad-state`.

**Example**

```
  <rpc message-id="104"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <commit-transaction
       xmlns="http://tail-f.com/ns/netconf/transactions/1.0"/>
  </rpc>

  <rpc-reply message-id="104"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <ok/>
  </rpc-reply>
```

#### New Operation: `<abort-transaction>` <a href="#d5e812" id="d5e812"></a>

**Description**

Aborts the ongoing transaction, and all pending changes are discarded. `<abort-transaction>` can be given at any time during an ongoing transaction.

**Parameters**

None.

**Positive Response**

If the device was able to satisfy the request, an `<rpc-reply>` is sent that contains an `<ok>` element.

**Negative Response**

An `<rpc-error>` element is included in the `<rpc-reply>` if the request cannot be completed for any reason.

If there is no ongoing transaction in this session, an error must be returned with `<error-app-tag>` set to `bad-state`.

**Example**

```
  <rpc message-id="104"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <abort-transaction
       xmlns="http://tail-f.com/ns/netconf/transactions/1.0"/>
  </rpc>

  <rpc-reply message-id="104"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <ok/>
  </rpc-reply>
```

#### Modifications to Existing Operations <a href="#d5e831" id="d5e831"></a>

The `<edit-config>` operation is modified so that if it is received during an ongoing transaction, the modifications are not immediately applied to the configuration target. Instead, they are kept in the transaction state of the server. The transaction state is only applied when a `<commit-transaction>` is received.

Note that it doesn't matter if the `<test-option>` is 'set' or 'test-then-set' in the `<edit-config>`, since nothing is actually set when the `<edit-config>` is received.

### Inactive Capability <a href="#ug.netconf_agent.inactive" id="ug.netconf_agent.inactive"></a>

This capability is used by the NETCONF server to indicate that it supports marking nodes as being inactive. A node that is marked as inactive exists in the data store but is not used by the server. Any node can be marked as inactive.

To not confuse clients who do not understand this attribute, the client has to instruct the server to display and handle the inactive nodes. An inactive node is marked with an `inactive` XML attribute, and to make it active, the `active` XML attribute is used.

This capability is formally defined in the YANG module `tailf-netconf-inactive`.

#### Dependencies <a href="#d5e842" id="d5e842"></a>

None.

#### Capability Identifier <a href="#d5e845" id="d5e845"></a>

The inactive capability is identified by the following capability string:

```
  http://tail-f.com/ns/netconf/inactive/1.0
```

#### New Operations <a href="#d5e850" id="d5e850"></a>

None.

#### Modifications to Existing Operations <a href="#d5e853" id="d5e853"></a>

A new parameter, `<with-inactive>`, is added to the `<get>`, `<get-config>`, `<edit-config>`, `<copy-config>`, and `<start-transaction>` operations.

The `<with-inactive>` element is defined in the http://tail-f.com/ns/netconf/inactive/1.0 namespace, and takes no value.

If this parameter is present in `<get>`, `<get-config>`, or `<copy-config>`, the NETCONF server will mark inactive nodes with the `inactive` attribute.

If this parameter is present in `<edit-config>` or `<copy-config>`, the NETCONF server will treat inactive nodes as existing so that an attempt to create a node that is inactive will fail, and an attempt to delete a node that is inactive will succeed. Further, the NETCONF server accepts the `inactive` and `active` attributes in the data hierarchy, to make nodes inactive or active, respectively.

If the parameter is present in `<start-transaction>`, it must also be present in any `<edit-config>`, `<copy-config>`, `<get>`, or `<get-config>` operations within the transaction. If it is not present in `<start-transaction>`, it must not be present in any `<edit-config>` operation within the transaction.

The `inactive` and `active` attributes are defined in the http://tail-f.com/ns/netconf/inactive/1.0 namespace. The `inactive` attribute's value is the string `inactive`, and the `active` attribute's value is the string `active`.

**Example**

This request creates an `inactive` interface:

```
  <rpc message-id="101"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <edit-config>
      <target>
        <running/>
      </target>
      <with-inactive
         xmlns="http://tail-f.com/ns/netconf/inactive/1.0"/>
      <config>
        <top xmlns="http://example.com/schema/1.2/config">
          <interface inactive="inactive">
            <name>Ethernet0/0</name>
            <mtu>1500</mtu>
          </interface>
        </top>
      </config>
    </edit-config>
  </rpc>

  <rpc-reply message-id="101"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <ok/>
  </rpc-reply>
```

This request shows the `inactive` interface:

```
  <rpc message-id="102"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <get-config>
      <source>
        <running/>
      </source>
      <with-inactive
         xmlns="http://tail-f.com/ns/netconf/inactive/1.0"/>
    </get-config>
  </rpc>

  <rpc-reply message-id="102"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <data>
      <top xmlns="http://example.com/schema/1.2/config">
        <interface inactive="inactive">
          <name>Ethernet0/0</name>
          <mtu>1500</mtu>
        </interface>
      </top>
    </data>
  </rpc-reply>
```

This request shows that inactive data is not returned unless the client asks for it:

```
  <rpc message-id="103"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <get-config>
      <source>
        <running/>
      </source>
    </get-config>
  </rpc>

  <rpc-reply message-id="103"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <data>
    </data>
  </rpc-reply>
```

This request activates the interface:

This request creates an `inactive` interface:

```
  <rpc message-id="104"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <edit-config>
      <target>
        <running/>
      </target>
      <with-inactive
         xmlns="http://tail-f.com/ns/netconf/inactive/1.0"/>
      <config>
        <top xmlns="http://example.com/schema/1.2/config">
          <interface active="active">
            <name>Ethernet0/0</name>
          </interface>
        </top>
      </config>
    </edit-config>
  </rpc>

  <rpc-reply message-id="104"
       xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <ok/>
  </rpc-reply>
```

### Rollback ID Capability <a href="#ug.netconf_agent.with-rollback-id" id="ug.netconf_agent.with-rollback-id"></a>

This module extends existing operations with a with-rollback-id parameter which will, when set, extend the result with information about the rollback that was generated for the operation if any.

The rollback ID returned is the ID from within the rollback file which is stable with regards to new rollbacks being created.

#### Dependencies <a href="#d5e882" id="d5e882"></a>

None.

#### Capability Identifier <a href="#d5e885" id="d5e885"></a>

The transactions capability is identified by the following capability string:

```
  http://tail-f.com/ns/netconf/with-rollback-id
```

#### Modifications to Existing Operations <a href="#d5e890" id="d5e890"></a>

This module adds a parameter `with-rollback-id` to the following RPCs:

```
  o  edit-config
  o  copy-config
  o  commit
  o  commit-transaction
```

If `with-rollback-id` is given, rollbacks are enabled, and the operation results in a rollback file being created the response will contain a rollback reference.

### Trace Context <a href="#trace-context" id="trace-context"></a>

NETCONF supports the IETF standard draft [I-D.draft-ietf-netconf-trace-ctx-extension-00](https://www.ietf.org/archive/id/draft-ietf-netconf-trace-ctx-extension-00.html), that is an adaption of the [W3C Trace Context](https://www.w3.org/TR/2021/REC-trace-context-1-20211123/) standard. Trace Context standardizes the format of `trace-id`, `parent-id`, and key-value pairs sent between distributed entities. The `parent-id` will become the `parent-span-id` for the next generated `span-id` in NSO.

Trace Context consists of two XML attributes `traceparent` and `tracestate` corresponding to the capabilities `urn:ietf:params:xml:ns:yang:traceparent:1.0` and `urn:ietf:params:xml:ns:yang:tracestate:1.0` respectively. The attributes belong to the start XML element `rpc` in a NETCONF request.

Attribute `traceparent` must be of the format:

```
traceparent = <version>-<trace-id>-<parent-id>-<flags>
```

where `version` = "00" and `flags` = "01". The support for the values of `version` and `flags` may change in the future depending on the extension of the standard or functionality.

Attribute `tracestate` is a vendor-specific list of key-value pairs and must be of the format:

```
tracestate = key1=value1,key2=value2
```

Where a value may contain space characters but not end with a space.

Here is an example of the usage of the attributes `traceparent` and `tracestate`:

{% code title="Example: Attributes traceparent and tracestate in NETCONF Request" %}
```
<rpc message-id="101"
     xmlns="urn:ietf:params:xml:ns:netconf:base:1.0"
     xmlns:w3ctc="urn:ietf:params:xml:ns:netconf:w3ctc:1.0"
     w3ctc:traceparent="00-100456789abcde10123456789abcde10-001006789abcdef0-01"
     w3ctc:tracestate="key1=value1,key2=value2">
  <edit-config>
    <target>
      <running/>
    </target>
    <config>
      <interfaces xmlns="http://example.com/ns/if">
        <interface>
          <name>eth0</name>
          ...
        </interface>
      </interfaces>
    </config>
  </edit-config>
</rpc>
```
{% endcode %}

NSO implements Trace Context alongside the legacy way of handling trace-id found in [NETCONF Extensions in NSO](northbound-apis.md#d5e896). The support of Trace Context covers the same scenarios as the legacy `trace-id` functionality, except for the scenario where both `trace-id` and Trace Context are absent in a request, in which case legacy `trace-id` is generated. The two different ways of handling `trace-id` cannot be used at the same time. If both are used, the request generates an error response. Read about `trace-id` legacy functionality in [NETCONF Extensions in NSO](northbound-apis.md#d5e896).

NETCONF also lets LSA clusters to be part of Trace Context handling. A top LSA node will pass down the Trace Context to all LSA nodes beneath. For NSO to consider the attributes of Trace Context in a NETCONF request, the `trace-id` element in the configuration file must be enabled. As Trace Context is handled by the progress trace functionality, see also [Progress Trace](../connected-topics/progress-trace.md).

### NETCONF Extensions in NSO <a href="#d5e896" id="d5e896"></a>

The YANG module `tailf-netconf-ncs` augments some NETCONF operations with additional parameters to control the behavior in NSO over NETCONF. See that YANG module for all the details. In this section, the options are summarized.

To control the commit behavior of NSO the following input parameters are available:

* `no-revision-drop`\
  NSO will not run its data model revision algorithm, which requires all participating managed devices to have all parts of the data models for all data contained in this transaction. Thus, this flag forces NSO to never silently drop any data set operations towards a device.
* `no-overwrite`\
  NSO will check that the data that should be modified has not changed on the device compared to NSO's view of the data.
* `no-networking`\
  Do not send any data to the devices. This is a way to manipulate CDB in NSO without generating any southbound traffic.
* `no-out-of-sync-check`\
  Continue with the transaction even if NSO detects that a device's configuration is out of sync.
* `no-deploy`\
  Commit without invoking the service create method, i.e., write the service instance data without activating the service(s). The service(s) can later be redeployed to write the changes of the service(s) to the network.
* `reconcile/keep-non-service-config`\
  Reconcile the service data. All data which existed before the service was created will now be owned by the service. When the service is removed that data will also be removed. In technical terms, the reference count will be decreased by one for everything that existed prior to the service. If manually configured data exists below in the configuration tree that data is kept.
* `reconcile/discard-non-service-config`\
  Reconcile the service data but do not keep manually configured data that exists below in the configuration tree.
* `use-lsa`\
  Force handling of the LSA nodes as such. This flag tells NSO to propagate applicable commit flags and actions to the LSA nodes without applying them on the upper NSO node itself. The commit flags affected are `dry-run`, `no-networking`, `no-out-of-sync-check`, `no-overwrite` and `no-revision-drop`.
* `no-lsa`\
  Do not handle any of the LSA nodes as such. These nodes will be handled as any other device.
* `commit-queue/async`\
  Commit the transaction data to the commit queue. The operation returns successfully if the transaction data has been successfully placed in the queue.
* `commit-queue/sync/timeout`\
  Commit the transaction data to the commit queue. The operation does not return until the transaction data has been sent to all devices, or a timeout occurs. The timeout value specifies a maximum number of seconds to wait for the completion.
* `commit-queue/sync/infinity`\
  Commit the transaction data to the commit queue. The operation does not return until the transaction data has been sent to all devices.
* `commit-queue/bypass`\
  If `/devices/global-settings/commit-queue/enabled-by-default` is _true_ the data in this transaction will bypass the commit queue. The data will be written directly to the devices.
* `commit-queue/atomic`\
  Sets the atomic behavior of the resulting queue item. Possible values are: `true` and `false`. If this is set to `false`, the devices contained in the resulting queue item can start executing if the same devices in other non-atomic queue items ahead of it in the queue are completed. If set to `true`, the atomic integrity of the queue item is preserved.
* `commit-queue/block-others`\
  The resulting queue item will block subsequent queue items, which use any of the devices in this queue item, from being queued.
* `commit-queue/lock`\
  Place a lock on the resulting queue item. The queue item will not be processed until it has been unlocked, see the actions **unlock** and **lock** in `/devices/commit-queue/queue-item`. No following queue items, using the same devices, will be allowed to execute as long as the lock is in place.
* `commit-queue/tag`\
  The value is a user-defined opaque tag. The tag is present in all notifications and events sent referencing the specific queue item.
* `commit-queue/error-option`\
  The error option to use. Depending on the selected error option NSO will store the reverse of the original transaction to be able to undo the transaction changes and get back to the previous state. This data is stored in the `/devices/commit-queue/completed` tree from where it can be viewed and invoked with the `rollback` action. When invoked the data will be removed. Possible values are: `continue-on-error`, `rollback-on-error`, and `stop-on-error`. The `continue-on-error` value means that the commit queue will continue on errors. No rollback data will be created. The `rollback-on-error` value means that the commit queue item will roll back on errors. The commit queue will place a lock with `block-others` on the devices and services in the failed queue item. The `rollback` action will then automatically be invoked when the queue item has finished its execution. The lock will be removed as part of the rollback. The `stop-on-error` means that the commit queue will place a lock with `block-others` on the devices and services in the failed queue item. The lock must then either manually be released when the error is fixed or the `rollback` action under `/devices/commit-queue/completed` be invoked.\
  \
  Read about error recovery in [Commit Queue](../../operation-and-usage/ops/nso-device-manager.md#user\_guide.devicemanager.commit-queue) for a more detailed explanation.
* `trace-id`\
  Use the provided trace ID as part of the log messages emitted while processing. If no trace ID is given, NSO will generate and assign a trace ID to the processing.\
  **Note**: `trace-id` within NETCONF extensions is deprecated from NSO version 6.3. Capabilities within Trace Context will provide support for `trace-id`, see the section [Trace Context](northbound-apis.md#trace-context).

These optional input parameters are augmented into the following NETCONF operations:

* `commit`
* `edit-config`
* `copy-config`
* `prepare-transaction`

The operation `prepare-transaction` is also augmented with an optional parameter `dry-run`, which can be used to show the effects that would have taken place, but not actually commit anything to the datastore or to the devices. `dry-run` takes an optional parameter `outformat`, which can be used to select in which format the result is returned. Possible formats are `xml` (default), `cli`_,_ and `native`. The optional `reverse` parameter can be used together with the `native` format to display the device commands for getting back to the current running state in the network if the commit is successfully executed. Beware that if any changes are done later on the same data the reverse device commands returned are invalid.

FASTMAP attributes such as back pointers and reference counters are typically internal to NSO and are not shown by default. The optional parameter `with-service-meta-data` can be used to include these in the NETCONF reply. The parameter is augmented into the following NETCONF operations:

* `get`
* `get-config`
* `get-data`

### The Query API <a href="#d5e1063" id="d5e1063"></a>

The Query API consists of several RPC operations to start queries, fetch chunks of the result from a query, restart a query, and stop a query.

In the installed release there are two YANG files named `tailf-netconf-query.yang` and `tailf-common-query.yang` that defines these operations. An easy way to find the files is to run the following command from the top directory of the release installation:

```
$ find . -name tailf-netconf-query.yang
```

The API consists of the following operations:

* `start-query`: Start a query and return a query handle.
* `fetch-query-result`: Use a query handle to repeatedly fetch chunks of the result.
* `immediate-query`: Start a query and return the entire result immediately.
* `reset-query`: (Re)set where the next fetched result will begin from.
* `stop-query`: Stop (and close) the query.

In the following examples, the following data model is used:

```
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
}
```

Here is an example of a `start-query` operation:

```
<start-query xmlns="http://tail-f.com/ns/netconf/query">
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
</start-query>
```

An informal interpretation of this query is:

For each `/x/host` where `enabled` is true, select its `name`, and `address`, and return the result sorted by `name`, in chunks of 100 results at the time.

Let us discuss the various pieces of this request.

The actual XPath query to run is specified by the `foreach` element. The example below will search for all `/x/host` nodes that have the `enabled` node set to `true`:

```
<foreach>
  /x/host[enabled = 'true']
</foreach>
```

Now we need to define what we want to have returned from the node set by using one or more `select` sections. What to actually return is defined by the XPath `expression`.

We must also choose how the result should be represented. Basically, it can be the actual value or the path leading to the value. This is specified per select chunk The possible result types are: `string` , `path` , `leaf-value` and `inline`.

The difference between `string` and `leaf-value` is somewhat subtle. In this case of `string` the result will be processed by the XPath function `string()` (which if the result is a node-set will concatenate all the values). The `leaf-value` will return the value of the first node in the result. As long as the result is a leaf node, `string` and `leaf-value` will return the same result. In the example above, we are using `string` as shown below. At least one `result-type` must be specified.

The result-type `inline` makes it possible to return the full sub-tree of data in XML format. The data will be enclosed with a tag: `data`.

Finally, we can specify an optional `label` for a convenient way of labeling the returned data. In the example we have the following:

```
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

The returned result can be sorted. This is expressed as XPath expressions, which in most cases are very simple and refer to the found node-set. In this example, we sort the result by the content of the `name` node:

```
<sort-by>name</sort-by>
```

To limit the maximum amount of results in each chunk that `fetch-query-result` will return we can set the `limit` element. The default is to get all results in one chunk.

```
<limit>100</limit>
```

With the `offset` element we can specify at which node we should start to receive the result. The default is 1, i.e., the first node in the resulting node set.

```
<offset>1</offset>
```

Now, if we continue by putting the operation above in a file `query.xml` we can send a request, using the command `netconf-console`, like this:

```
$ netconf-console --rpc query.xml
```

The result would look something like this:

```
<start-query-result>
  <query-handle>12345</query-handle>
</start-query-result>
```

The query handle (in this example `12345`) must be used in all subsequent calls. To retrieve the result, we can now send:

```
<fetch-query-result xmlns="http://tail-f.com/ns/netconf/query">
  <query-handle>12345</query-handle>
</fetch-query-result>
```

Which will result in something like the following:

```
<query-result xmlns="http://tail-f.com/ns/netconf/query">
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
      <value>10.0.0.1</value>
    </select>
  </result>
</query-result>
```

If we try to get more data with the `fetch-query-result` we might get more `result` entries in return until no more data exists and we get an empty query result back:

```
<query-result xmlns="http://tail-f.com/ns/netconf/query">
</query-result>
```

If we want to send the query and get the entire result with only one request, we can do this by using `immediate-query`. This function takes similar arguments as `start-query` and returns the entire result analogous `fetch-query-result`. Note that it is not possible to paginate or set an offset start node for the result list; i.e. the options `limit` and `offset` are ignored.

An example request and response:

```
<immediate-query xmlns="http://tail-f.com/ns/netconf/query">
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
  <timeout>600</timeout>
</immediate-query>
```

```
<query-result xmlns="http://tail-f.com/ns/netconf/query">
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

If we want to go back in the "stream" of received data chunks and have them repeated, we can do that with the `reset-query` operation. In the example below, we ask to get results from the 42nd result entry:

```
<reset-query xmlns="http://tail-f.com/ns/netconf/query">
  <query-handle>12345</query-handle>
  <offset>42</offset>
</reset-query>
```

Finally, when we are done we stop the query:

```
<stop-query xmlns="http://tail-f.com/ns/netconf/query">
  <query-handle>12345</query-handle>
</stop-query>
```

### Meta-data in Attributes <a href="#ug.netconf_agent.attributes" id="ug.netconf_agent.attributes"></a>

NSO supports three pieces of meta-data data nodes: tags, annotations, and inactive.

An annotation is a string that acts as a comment. Any data node present in the configuration can get an annotation. An annotation does not affect the underlying configuration but can be set by a user to comment what the configuration does.

An annotation is encoded as an XML attribute `annotation` on any data node. To remove an annotation, set the `annotation` attribute to an empty string.

Any configuration data node can have a set of tags. Tags are set by the user for data organization and filtering purposes. A tag does not affect the underlying configuration.

All tags on a data node are encoded as a space-separated string in an XML attribute `tags`. To remove all tags, set the `tags` attribute to an empty string.

Annotation, tags, and inactive attributes can be present in `<edit-config>`, `<copy-config>`, `<get-config>`, and `<get>`. For example:

```
<rpc message-id="101"
     xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
  <edit-config>
    <target>
      <running/>
    </target>
    <config>
      <interfaces xmlns="http://example.com/ns/if">
        <interface annotation="this is the management interface"
                   tags=" important ethernet ">
          <name>eth0</name>
          ...
        </interface>
      </interfaces>
    </config>
  </edit-config>
</rpc>
```

### Namespace for Additional Error Information <a href="#d5e1189" id="d5e1189"></a>

NSO adds an additional namespace which is used to define elements that are included in the `<error-info>` element. This namespace also describes which `<error-app-tag/>` elements the server might generate, as part of an `<rpc-error/>`.

```
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema targetNamespace="http://tail-f.com/ns/netconf/params/1.1"
           xmlns:xs="http://www.w3.org/2001/XMLSchema"
           xml:lang="en">

  <xs:annotation>
    <xs:documentation>
      Tail-f's namespace for additional error information.
      This namespace is used to define elements which are included
      in the 'error-info' element.

      The following are the app-tags used by the NETCONF agent:

        o  not-writable

          Means that an edit-config or copy-config operation was
          attempted on an element which is read-only
          (i.e. non-configuration data).

        o  missing-element-in-choice

          Like the standard error missing-element, but generated when
          one of a set of elements in a choice is missing.

        o  pending-changes

          Means that a lock operation was attempted on the candidate
          database, and the candidate database has uncommitted
          changes. This is not allowed according to the protocol
          specification.

        o  url-open-failed

          Means that the URL given was correct, but that it could not
          be opened. This can e.g. be due to a missing local file, or
          bad ftp credentials. An error message string is provided in
          the &lt;error-message&gt; element.

        o  url-write-failed

          Means that the URL given was opened, but write failed. This
          could e.g. be due to lack of disk space. An error message
          string is provided in the &lt;error-message&gt; element.

        o  bad-state

          Means that an rpc is received when the session is in a state
          which don't accept this rpc.  An example is
          &lt;prepare-transaction&gt; before &lt;start-transaction&gt;

    </xs:documentation>
  </xs:annotation>

  <xs:element name="bad-keyref">
    <xs:annotation>
      <xs:documentation>
        This element will be present in the 'error-info' container when
        'error-app-tag' is "instance-required".
      </xs:documentation>
    </xs:annotation>
    <xs:complexType>
      <xs:sequence>
        <xs:element name="bad-element" type="xs:string">
          <xs:annotation>
            <xs:documentation>
              Contains an absolute XPath expression pointing to the element
              which value refers to a non-existing instance.
            </xs:documentation>
          </xs:annotation>
        </xs:element>
        <xs:element name="missing-element" type="xs:string">
          <xs:annotation>
            <xs:documentation>
              Contains an absolute XPath expression pointing to the missing
              element referred to by 'bad-element'.
            </xs:documentation>
          </xs:annotation>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>

  <xs:element name="bad-instance-count">
    <xs:annotation>
      <xs:documentation>
        This element will be present in the 'error-info' container when
        'error-app-tag' is "too-few-elements" or "too-many-elements".
      </xs:documentation>
    </xs:annotation>
    <xs:complexType>
      <xs:sequence>
        <xs:element name="bad-element" type="xs:string">
          <xs:annotation>
            <xs:documentation>
              Contains an absolute XPath expression pointing to an
              element which exists in too few or too many instances.
            </xs:documentation>
          </xs:annotation>
        </xs:element>
        <xs:element name="instances" type="xs:unsignedInt">
          <xs:annotation>
            <xs:documentation>
              Contains the number of existing instances of the element
              referd to by 'bad-element'.
            </xs:documentation>
          </xs:annotation>
        </xs:element>
        <xs:choice>
          <xs:element name="min-instances" type="xs:unsignedInt">
            <xs:annotation>
              <xs:documentation>
                Contains the minimum number of instances that must
                exist in order for the configuration to be consistent.
                This element is present only if 'app-tag' is
                'too-few-elems'.
              </xs:documentation>
            </xs:annotation>
          </xs:element>
          <xs:element name="max-instances" type="xs:unsignedInt">
            <xs:annotation>
              <xs:documentation>
                Contains the maximum number of instances that can
                exist in order for the configuration to be consistent.
                This element is present only if 'app-tag' is
                'too-many-elems'.
              </xs:documentation>
            </xs:annotation>
          </xs:element>
        </xs:choice>
      </xs:sequence>
    </xs:complexType>
  </xs:element>

  <xs:attribute name="annotation" type="xs:string">
    <xs:annotation>
      <xs:documentation>
        This attribute can be present on any configuration data node.  It
        acts as a comment for the node.  The annotation does not affect the
        underlying configuration data.
      </xs:documentation>
    </xs:annotation>
  </xs:attribute>

  <xs:attribute name="tags" type="xs:string">
    <xs:annotation>
      <xs:documentation>
        This attribute can be present on any configuration data node.  It
        is a space separated string of tags for the node.  The tags of a
        node does not affect the underlying configuration data, but can
        be used by a user for data organization, and data filtering.
      </xs:documentation>
    </xs:annotation>
  </xs:attribute>

</xs:schema>
```

## The RESTCONF API <a href="#the-restconf-api" id="the-restconf-api"></a>

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

### Getting started <a href="#ncs.northbound.restconf.getting_started" id="ncs.northbound.restconf.getting_started"></a>

To enable RESTCONF in NSO, RESTCONF must be enabled in the `ncs.conf` configuration file. The web server configuration for RESTCONF is shared with the WebUI's config, but you may define a separate RESTCONF transport section. The WebUI does not have to be enabled for RESTCONF to work.

Here is a minimal example of what is needed in the `ncs.conf`.

{% code title="Example: NSO Configuration for RESTCONF" %}
```
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
```
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
```
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
```
GET /restconf/data
Accept: application/yang-data+xml

# Any reply with relevant headers will be displayed here!
HTTP/1.1 200 OK
```
{% endcode %}

Note the HTTP return code (200 OK) in the example, which will be displayed together with any relevant HTTP headers returned and a possible body of content.

#### Top-level GET request <a href="#d5e1282" id="d5e1282"></a>

Send a RESTCONF query to get a representation of the top-level resource, which is accessible through the path: `/restconf`.

{% code title="Example: A Top-level RESTCONF Request" %}
```
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

#### Get Resources Under the `data` Resource <a href="#d5e1302" id="d5e1302"></a>

To fetch configuration, operational data, or both, from the server, a request to the `data` resource is made. To restrict the amount of returned data, the following example will prune the amount of output to only consist of the topmost nodes. This is achieved by using the `depth` query argument as shown in the example below:

{% code title="Example: Get the Top-most Resources Under " %}
```
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

#### Manipulating config data with RESTCONF

Let's assume we are interested in the `dhcp/subnet` resource in our configuration. In the following examples, assume that it is defined by a corresponding Yang module that we have named `dhcp.yang`, looking like this:

{% code title="Example: The " %}
```
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
```
GET /restconf/data/dhcp:dhcp/subnet

HTTP/1.1 204 No Content
```
{% endcode %}

We can now create the `dhcp/subnet` resource by sending an HTTP POST request + the data that we want to store. Note the `Content-Type` HTTP header, which indicates the format of the provided body. Two formats are supported: XML or JSON. In this example, we are using XML, which is indicated by the `Content-Type` value: `application/yang-data+xml`.

{% code title="Example: Create a New " %}
```
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
```
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
```
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
```
DELETE /restconf/data/dhcp:dhcp/subnet=10.254.239.0%2F27

HTTP/1.1 204 No Content
```
{% endcode %}

### Root Resource Discovery

RESTCONF makes it possible to specify where the RESTCONF API is located, as described in the RESTCONF [RFC 8040](https://www.ietf.org/rfc/rfc8040.txt#section-3.1).

As per default, the RESTCONF API root is `/restconf`. Typically there is no need to change the default value although it is possible to change this by configuring the RESTCONF API root in the `ncs.conf` file as:

{% code title="Example: NSO Configuration for RESTCONF" %}
```
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

### Capabilities <a href="#d5e1399" id="d5e1399"></a>

A RESTCONF capability is a set of functionality that supplements the base RESTCONF specification. The capability is identified by a uniform resource identifier [(URI)](https://www.ietf.org/rfc/rfc3986.txt). The RESTCONF server includes a `capability` URI leaf-list entry identifying each supported protocol feature. This includes the `basic-mode` default-handling mode, optional query parameters, and may also include other, NSO-specific, capability URIs.

#### How to View the Capabilities of the RESTCONF Server <a href="#ncs.northbound.restconf.capabilities" id="ncs.northbound.restconf.capabilities"></a>

To view currently enabled capabilities, use the `ietf-restconf-monitoring` YANG model, which is available as: `/restconf/data/ietf-restconf-monitoring:restconf-state`.

{% code title="Example: NSO RESTCONF Capabilities" %}
```
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

#### The `defaults` Capability

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

#### Query Parameter Capabilities <a href="#d5e1469" id="d5e1469"></a>

A set of optional RESTCONF Capability URIs are defined to identify the specific query parameters that are supported by the server. They are defined as:

The table shows query parameter capabilities.

<table><thead><tr><th width="184">Name</th><th>URI</th></tr></thead><tbody><tr><td>depth</td><td>urn:ietf:params:restconf:capability:depth:1.0</td></tr><tr><td>fields</td><td>urn:ietf:params:restconf:capability:fields:1.0</td></tr><tr><td>filter</td><td>urn:ietf:params:restconf:capability:filter:1.0</td></tr><tr><td>replay</td><td>urn:ietf:params:restconf:capability:replay:1.0</td></tr><tr><td>with.defaults</td><td>urn:ietf:params:restconf:capability:with.defaults:1.0</td></tr></tbody></table>

For a description of the query parameter functionality, see [Query Parameters](northbound-apis.md#ncs.northbound.restconf.query\_params).

### Query Parameters <a href="#ncs.northbound.restconf.query_params" id="ncs.northbound.restconf.query_params"></a>

Each RESTCONF operation allows zero or more query parameters to be present in the request URI. Query parameters can be given in any order, but can appear at most once. Supplying query parameters when invoking RPCs and actions is not supported, if supplied the response will be 400 (Bad Request) and the `error-app-tag` will be set to `invalid-value`. However, the query parameters `trace-id` and `unhide` are exempted from this rule and supported for RPC and action invocation. The defined query parameters and in what type of HTTP request they can be used are shown in the table below (Query parameters).

<table><thead><tr><th width="185">Name</th><th width="154">Method</th><th>Description</th></tr></thead><tbody><tr><td><code>content</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Select config and/or non-config data resources.</td></tr><tr><td><code>depth</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Request limited subtree depth in the reply content.</td></tr><tr><td><code>fields</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Request a subset of the target resource contents.</td></tr><tr><td><code>exclude</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Exclude a subset of the target resource contents.</td></tr><tr><td><code>filter</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Boolean notification filter for event stream resources.</td></tr><tr><td><code>insert</code></td><td><code>POST</code>,<code>PUT</code></td><td>Insertion mode for <em>ordered-by user</em> data resources</td></tr><tr><td><code>point</code></td><td><code>POST</code>,<code>PUT</code></td><td>Insertion point for <em>ordered-by user</em> data resources</td></tr><tr><td><code>start-time</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Replay buffer start time for event stream resources.</td></tr><tr><td><code>stop-time</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Replay buffer stop time for event stream resources.</td></tr><tr><td><code>with-defaults</code></td><td><code>GET</code>,<code>HEAD</code></td><td>Control the retrieval of default values.</td></tr><tr><td><code>with-origin</code></td><td><code>GET</code></td><td>Include the "origin" metadata annotations, as detailed in the NMDA.</td></tr></tbody></table>

#### The `content` Query Parameter

The `content` query parameter controls if configuration, non-configuration, or both types of data should be returned. The `content` query parameter values are listed below.

The allowed values are:

<table><thead><tr><th width="148">Value</th><th>Description</th></tr></thead><tbody><tr><td><code>config</code></td><td>Return only configuration descendant data nodes.</td></tr><tr><td><code>nonconfig</code></td><td>Return only non-configuration descendant data nodes.</td></tr><tr><td><code>all</code></td><td>Return all descendant data nodes.</td></tr></tbody></table>

#### The `depth` Query Parameter

The `depth` query parameter is used to limit the depth of subtrees returned by the server. Data nodes with a value greater than the `depth` parameter are not returned in response to a GET request.

The value of the `depth` parameter is either an integer between 1 and 65535 or the string `unbounded`. The default value is: `unbounded`.

#### The `fields` Query Parameter <a href="#d5e1600" id="d5e1600"></a>

The `fields` query parameter is used to optionally identify data nodes within the target resource to be retrieved in a GET method. The client can use this parameter to retrieve a subset of all nodes in a resource.

For a full definition of the `fields` value can be constructed, refer to the [RFC 8040, Section 4.8.3](https://tools.ietf.org/html/rfc8040#section-4.8.3).

Note that the `fields` query parameter cannot be used together with the `exclude` query parameter. This will result in an error.

{% code title="Example: Example of How to Use the " %}
```
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

#### The `exclude` Query Parameter

The `exclude` query parameter is used to optionally exclude data nodes within the target resource from being retrieved with a GET request. The client can use this parameter to exclude a subset of all nodes in a resource. Only nodes below the target resource can be excluded, not the target resource itself.

Note that the `exclude` query parameter cannot be used together with the `fields` query parameter. This will result in an error.

The `exclude` query parameter uses the same syntax and has the same restrictions as the `fields` query parameter, as defined in [RFC 8040, Section 4.8.3](https://tools.ietf.org/html/rfc8040#section-4.8.3).

Selecting multiple nodes to exclude can be done the same way as for the `fields` query parameter, as described in [RFC 8040, Section 4.8.3](https://tools.ietf.org/html/rfc8040#section-4.8.3).

`exclude` using wildcards (\*) will exclude all child nodes of the node. For lists and presence containers, the parent node will be visible in the output but not its children, i.e. it will be displayed as an empty node. For non-presence containers, the parent node will be excluded from the output as well.

`exclude` can be used together with the `depth` query parameter to limit the depth of the output. In contrast to `fields`, where `depth` is counted from the node selected by `fields`, for `exclude` the depth is counted from the target resource, and the nodes are excluded if `depth` is deep enough to encounter an excluded node.

When `exclude` is not used:

{% code title="Example: Example of How to Use the " %}
```
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

```
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

#### The `filter`, `start-time`, and `stop-time` Query Parameters.

These query parameters are only allowed on an event stream resource and are further described in [Streams](northbound-apis.md#ncs.northbound.restconf.streams).

#### The `insert` Query Parameter <a href="#d5e1657" id="d5e1657"></a>

The `insert` query parameter is used to specify how a resource should be inserted within an `ordered-by user` list. The allowed values are shown in the table below (The `content` query parameter values).

<table><thead><tr><th width="142">Value</th><th>Description</th></tr></thead><tbody><tr><td><code>first</code></td><td>Insert the new data as the new first entry.</td></tr><tr><td><code>last</code></td><td>Insert the new data as the new last entry. This is the default value.</td></tr><tr><td><code>before</code></td><td>Insert the new data before the insertion point, as specified by the value of the <code>point</code> parameter.</td></tr><tr><td><code>after</code></td><td>Insert the new data after the insertion point, as specified by the value of the <code>point</code> parameter.</td></tr></tbody></table>

This parameter is only valid if the target data represents a YANG list or leaf-list that is `ordered-by user`. In the example below, we will insert a new `router` value, first, in the `ordered-by user` leaf-list of `dhcp-options/router` values. Remember that the default behavior is for new entries to be inserted last in an `ordered-by user` leaf-list.

{% code title="Example: Insert " %}
```
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

```
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

#### The `point` Query Parameter <a href="#d5e1703" id="d5e1703"></a>

The `point` query parameter is used to specify the insertion point for a data resource that is being created or moved within an `ordered-by user` list or leaf-list. In the example below, we will insert the new `router` value: `two.acme.org`, after the first value: `one.acme.org` in the `ordered-by user` leaf-list of `dhcp-options/router` values.

{% code title="Example: Insert " %}
```
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

```
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

#### Additional Query Parameters <a href="#d5e1722" id="d5e1722"></a>

There are additional NSO query parameters available for the RESTCONF API. These additional query parameters are described in the table below (Additional Query Parameters).

<table><thead><tr><th width="200">Name</th><th width="161">Methods</th><th>Description</th></tr></thead><tbody><tr><td><code>dry-run</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Validate and display the configuration changes but do not perform the actual commit. Neither CDB nor the devices are affected. Instead, the effects that would have taken place are shown in the returned output. Possible values are: <code>xml</code>, <code>cli</code><em>,</em> and <code>native</code>. The value used specifies in what format we want the returned diff to be.</td></tr><tr><td><code>dry-run-reverse</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Used together with the <code>dry-run=native</code> parameter to display the device commands for getting back to the current running state in the network if the commit is successfully executed. Beware that if any changes are done later on the same data the reverse device commands returned are invalid.</td></tr><tr><td><code>no-networking</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Do not send any data to the devices. This is a way to manipulate CDB in NSO without generating any southbound traffic.</td></tr><tr><td><code>no-out-of-sync-check</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Continue with the transaction even if NSO detects that a device's configuration is out of sync. Can't be used together with no-overwrite.</td></tr><tr><td><code>no-overwrite</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>NSO will check that the data that should be modified has not changed on the device compared to NSO's view of the data. Can't be used together with no-out-of-sync-check.</td></tr><tr><td><code>no-revision-drop</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>NSO will not run its data model revision algorithm, which requires all participating managed devices to have all parts of the data models for all data contained in this transaction. Thus, this flag forces NSO to never silently drop any data set operations towards a device.</td></tr><tr><td><code>no-deploy</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Commit without invoking the service create method, i.e, write the service instance data without activating the service(s). The service(s) can later be re-deployed to write the changes of the service(s) to the network.</td></tr><tr><td><code>reconcile</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Reconcile the service data. All data which existed before the service was created will now be owned by the service. When the service is removed that data will also be removed. In technical terms, the reference count will be decreased by one for everything that existed prior to the service. If the manually configured data exists below in the configuration tree, that data is kept unless the option <code>discard-non-service-config</code> is used.</td></tr><tr><td><code>use-lsa</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Force handling of the LSA nodes as such. This flag tells NSO to propagate applicable commit flags and actions to the LSA nodes without applying them on the upper NSO node itself. The commit flags affected are <code>dry-run</code>, <code>no-networking</code>, <code>no-out-of-sync-check</code>, <code>no-overwrite</code> and <code>no-revision-drop</code>.</td></tr><tr><td><code>no-lsa</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Do not handle any of the LSA nodes as such. These nodes will be handled as any other device.</td></tr><tr><td><code>commit-queue</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Commit the transaction data to the commit queue. Possible values are: <code>async</code>, <code>sync</code>, and <code>bypass</code>. If the <code>async</code> value is set the operation returns successfully if the transaction data has been successfully placed in the queue. The <code>sync</code> value will cause the operation to not return until the transaction data has been sent to all devices, or a timeout occurs. The <code>bypass</code> value means that if <code>/devices/global-settings/commit-queue/enabled-by-default</code> is <code>true</code> the data in this transaction will bypass the commit queue. The data will be written directly to the devices.</td></tr><tr><td><code>commit-queue-atomic</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Sets the atomic behavior of the resulting queue item. Possible values are: <code>true</code> and <code>false</code>. If this is set to <code>false</code>, the devices contained in the resulting queue item can start executing if the same devices in other non-atomic queue items ahead of it in the queue are completed. If set to <code>true</code>, the atomic integrity of the queue item is preserved.</td></tr><tr><td><code>commit-queue-block-others</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>The resulting queue item will block subsequent queue items, which use any of the devices in this queue item, from being queued.</td></tr><tr><td><code>commit-queue-lock</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Place a lock on the resulting queue item. The queue item will not be processed until it has been unlocked, see the actions <code>unlock</code> and <code>lock</code> in <code>/devices/commit-queue/queue-item</code>. No following queue items, using the same devices, will be allowed to execute as long as the lock is in place.</td></tr><tr><td><code>commit-queue-tag</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>The value is a user-defined opaque tag. The tag is present in all notifications and events sent referencing the specific queue item.</td></tr><tr><td><code>commit-queue-timeout</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Specifies a maximum number of seconds to wait for completion. Possible values are <code>infinity</code> or a positive integer. If the timer expires, the transaction is kept in the commit-queue, and the operation returns successfully. If the timeout is not set, the operation waits until completion indefinitely.</td></tr><tr><td><code>commit-queue-error-option</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>The error option to use. Depending on the selected error option, NSO will store the reverse of the original transaction to be able to undo the transaction changes and get back to the previous state. This data is stored in the <code>/devices/commit-queue/completed</code> tree from where it can be viewed and invoked with the <code>rollback</code> action. When invoked, the data will be removed. Possible values are: <code>continue-on-error</code>, <code>rollback-on-error</code>, and <code>stop-on-error</code>. The <code>continue-on-error</code> value means that the commit queue will continue on errors. No rollback data will be created. The <code>rollback-on-error</code> value means that the commit queue item will roll back on errors. The commit queue will place a lock with <code>block-others</code> on the devices and services in the failed queue item. The <code>rollback</code> action will then automatically be invoked when the queue item has finished its execution. The lock will be removed as part of the rollback. The <code>stop-on-error</code> means that the commit queue will place a lock with <code>block-others</code> on the devices and services in the failed queue item. The lock must then either manually be released when the error is fixed or the <code>rollback</code> action under <code>/devices/commit-queue/completed</code> be invoked. Read about error recovery in <a href="../../operation-and-usage/ops/nso-device-manager.md#user_guide.devicemanager.commit-queue">Commit Queue</a> for a more detailed explanation.</td></tr><tr><td><code>trace-id</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Use the provided trace ID as part of the log messages emitted while processing. If no trace ID is given, NSO will generate and assign a trace ID to the processing. The <code>trace-id</code> query parameter can also be used with RPCs and actions to relay a <code>trace-id</code> from northbound requests. The <code>trace-id</code> will be included in the <code>X-Cisco-NSO-Trace-ID</code> header in the response.<br><strong>NOTE:</strong> <code>trace-id</code> as a query parameter is deprecated from NSO version 6.3. Capabilities within Trace Context will provide support for <code>trace-id</code>, see <a href="northbound-apis.md#trace-context">Trace Context</a>.</td></tr><tr><td><code>limit</code></td><td><code>GET</code></td><td>Used by the client to specify a limited set of list entries to retrieve. See The value of the <code>limit</code> parameter is either an integer greater than or equal to <code>1</code>, or the string <code>unbounded</code>. The string <code>unbounded</code> is the default value. See <a href="northbound-apis.md#ncs.northbound.partial_response">Partial Responses</a> for an example.</td></tr><tr><td><code>offset</code></td><td><code>GET</code></td><td>Used by the client to specify the number of list elements to skip before returning the requested set of list entries. See The value of the <code>offset</code> parameter is an integer greater than or equal to <code>0</code>. The default value is <code>0</code>. See <a href="northbound-apis.md#ncs.northbound.partial_response">Partial Responses</a> for an example.</td></tr><tr><td><code>rollback-comment</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Used to specify a comment to be attached to the Rollback File that will be created as a result of the <code>POST</code> operation. This assumes that Rollback File handling is enabled.</td></tr><tr><td><code>rollback-label</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Used to specify a label to be attached to the Rollback File that will be created as a result of the POST operation. This assume that Rollback File handling is enabled.</td></tr><tr><td><code>rollback-id</code></td><td><code>POST</code><br><code>PUT</code><br><code>PATCH</code><br><code>DELETE</code></td><td>Return the rollback ID in the response if a rollback file was created during this operation. This requires rollbacks to be enabled in the NSO to take effect.</td></tr><tr><td><code>with-service-meta-data</code></td><td><code>GET</code></td><td>Include FASTMAP attributes such as backpointers and reference counters in the reply. These are typically internal to NSO and thus not shown by default.</td></tr></tbody></table>

### Edit Collision Prevention

Two edit collision detection and prevention mechanisms are provided in RESTCONF for the datastore resource: a timestamp and an entity tag. Any change to configuration data resources will update the timestamp and entity tag of the datastore resource. This makes it possible for a client to apply precondition HTTP headers to a request.

The NSO RESTCONF API honors the following HTTP response headers: `Etag` and `Last-Modified`, and the following request headers: `If-Match`, `If-None-Match`, `If-Modified-Since`, and `If-Unmodified-Since`.

#### Response Headers <a href="#d5e1892" id="d5e1892"></a>

* `Etag`: This header will contain an entity tag which is an opaque string representing the latest transaction identifier in the NSO database. This header is only available for the running datastore and hence, only relates to configuration data (non-operational).
* `Last-Modified`: This header contains the timestamp for the last modification made to the NSO database. This timestamp can be used by a RESTCONF client in subsequent requests, within the `If-Modified-Since` and `If-Unmodified-Since` header fields. This header is only available for the running datastore and hence, only relates to configuration data (non-operational).

#### Request Headers <a href="#d5e1907" id="d5e1907"></a>

* `If-None-Match`: This header evaluates to true if the supplied value does not match the latest `Etag` entity-tag value. If evaluated to false, an error response with status 304 (Not Modified) will be sent with no body. This header carries only meaning if the entity tag of the `Etag` response header has previously been acquired. The usage of this could for example be a HEAD operation to get information if the data has changed since the last retrieval.
* `If-Modified-Since`: This request-header field is used with an HTTP method to make it conditional, i.e if the requested resource has not been modified since the time specified in this field, the request will not be processed by the RESTCONF server; instead, a 304 (Not Modified) response will be returned without any message-body. Usage of this is for instance for a GET operation to retrieve the information if (and only if) the data has changed since the last retrieval. Thus, this header should use the value of a `Last-Modified` response header that has previously been acquired.
* `If-Match`: This header evaluates to true if the supplied value matches the latest `Etag` value. If evaluated to false, an error response with status 412 (Precondition Failed) will be sent with no body. This header carries only meaning if the entity tag of the `Etag` response header has previously been acquired. The usage of this can be in the case of a `PUT`, where `If-Match` can be used to prevent the lost update problem. It can check if the modification of a resource that the user wants to upload will not override another change that has been done since the original resource was fetched.
* `If-Unmodified-Since`: This header evaluates to true if the supplied value has not been last modified after the given date. If the resource has been modified after the given date, the response will be a 412 (Precondition Failed) error with no body. This header carries only meaning if the `Last-Modified` response header has previously been acquired. The usage of this can be the case of a `POST`, where editions are rejected if the stored resource has been modified since the original value was retrieved.

### Using Rollbacks <a href="#ug.restconf.using_rollbacks" id="ug.restconf.using_rollbacks"></a>

#### Rolling Back Configuration Changes <a href="#d5e1936" id="d5e1936"></a>

If rollbacks have been enabled in the configuration using the `rollback-id` query parameter, the fixed ID of the rollback file created during an operation is returned in the results. The below examples show the creation of a new resource and the removal of that resource using the rollback created in the first step.

{% code title="Example: Create a New dhcp/subnet Resource" %}
```
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

```
POST /restconf/data/tailf-rollback:rollback-files/apply-rollback-file
Content-Type: application/yang-data+xml

<input xmlns="http://tail-f.com/ns/rollback">
  <fixed-number>10002</fixed-number>
</input>

HTTP/1.1 204 No Content
```

### Streams <a href="#ncs.northbound.restconf.streams" id="ncs.northbound.restconf.streams"></a>

#### Introduction <a href="#d5e1949" id="d5e1949"></a>

The RESTCONF protocol supports YANG-defined event notifications. The solution preserves aspects of NETCONF event notifications \[RFC5277] while utilizing the Server-Sent Events, [W3C.REC-eventsource-20150203](https://www.w3.org/TR/2015/REC-eventsource-20150203), transport strategy.

RESTCONF event notification streams are described in Sections 6 and 9.2 of [RFC 8040](https://www.ietf.org/rfc/rfc8040.txt), where also notification examples can be found.

RESTCONF event notification is a way for RESTCONF clients to retrieve notifications for different event streams. Event streams configured in NSO can be subscribed to using different channels such as the RESTCONF or the NETCONF channel.

More information on how to define a new notification event using Yang is described in [RFC 6020](https://www.ietf.org/rfc/rfc6020.txt).

How to add and configure notifications support in NSO is described in the `ncs.conf(3)` man page.

The design of RESTCONF event notification is inspired by how NETCONF event notification is designed. More information on NETCONF event notification can be found in [RFC 5277](https://www.ietf.org/rfc/rfc5277.txt).

#### Configuration <a href="#d5e1964" id="d5e1964"></a>

For this example, we will define a notification stream, named `interface` in the `ncs.conf` configuration file as shown below.

We also enable the built-in replay store which means that NSO automatically stores all notifications on disk, ready to be replayed should a RESTCONF event notification subscriber ask for logged notifications. The replay store uses a set of wrapping log files on a disk (of a certain number and size) to store the notifications.

{% code title="Example: Configure an Example Notification" %}
```
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
```
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

#### Subscribe to Notification Events <a href="#d5e1982" id="d5e1982"></a>

RESTCONF clients can determine the URL for the subscription resource (to receive notifications) by sending an HTTP GET request for the `location` leaf with the `stream` list entry. The value returned by the server can be used for the actual notification subscription.

The client will send an HTTP GET request for the (location) URL returned by the server with the `Accept` type `text/event-stream` as shown in the example below. Note that this request works like a long polling request which means that the request will not return. Instead, server-side notifications will be sent to the client where each line of the notification will be prepended with `data:`.

{% code title="Example: View the Example RESTCONF Stream" %}
```
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
```
GET /restconf/streams/interface/xml?start-time=2007-07-28T15%3A23%3A36Z
Accept: text/event-stream

HTTP/1.1 200 OK
Content-Type: text/event-stream

data: ...any existing notification since given date will be delivered here...

   ...NOTE: when all notifications are delivered, we will be waiting here for more...
```
{% endcode %}

#### Errors

Errors occurring during streaming of events will be reported as Server-Sent Events (SSE) comments as described in [W3C.REC-eventsource-20150203](https://www.w3.org/TR/2015/REC-eventsource-20150203) as shown in the example below.

{% code title="Example: NSO RESTCONF Errors During Streaming" %}
```
: error: notification stream NETCONF temporarily unavailable
```
{% endcode %}

### Schema Resource

RFC 8040, Section 3.7 describes the retrieval of YANG modules used by the server via the RPC operation `get-schema`. The YANG source is made available by NSO in two ways: compiled into the `fxs` file or put in the loadPath. See [Monitoring of the NETCONF Server](northbound-apis.md#ug.netconf\_agent.monitoring).

The example below shows how to list the available Yang modules. Since we are interested in the `dhcp` module, we only show that part of the output:

{% code title="Example: List the Available Yang Modules" %}
```
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

```
GET /restconf/tailf/modules/dhcp/2019-02-14

HTTP/1.1 200 OK
module dhcp {
  namespace "http://yang-central.org/ns/example/dhcp";
  prefix dhcp;

  import ietf-yang-types {

  ...the rest of the Yang module removed here...
```

### YANG Patch Media Type <a href="#d5e2028" id="d5e2028"></a>

The NSO RESTCONF API also supports the YANG Patch Media Type, as defined in [RFC 8072](https://www.ietf.org/rfc/rfc8072.txt).

A _YANG_ `Patch` is an ordered list of edits that are applied to the target datastore by the RESTCONF server. A YANG Patch request is sent as an HTTP PATCH request containing a body describing the edit operations to be performed. The format of the body is defined in the [RFC 8072](https://www.ietf.org/rfc/rfc8072.txt).

Referring to the example above (dhcp Yang model) in the [Getting Started](northbound-apis.md#ncs.northbound.restconf.getting\_started) section; we will show how to use YANG Patch to achieve the same result but with fewer amount of requests.

#### Create Two New Resources with the YANG Patch <a href="#d5e2039" id="d5e2039"></a>

To create the resources, we send an HTTP PATCH request where the `Content-Type` indicates that the body in the request consists of a `Yang-Patch` message. Our `Yang-Patch` request will initiate two edit operations where each operation will create a new subnet. In contrast, compare this with using plain RESTCONF where we would have needed two `POST` requests to achieve the same result.

{% code title="Example: Create a Two New dhcp/subnet Resources" %}
```
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

#### Modify and Delete in the Same Yang-Patch Request

Let us modify the `max-lease-time` of one subnet and delete the `max-lease-time` value of the second subnet. Note that the delete will cause the default value of `max-lease-time` to take effect, which we will verify using a RESTCONF GET request.

{% code title="Example: Modify and Delete in the Same Yang-Patch Request" %}
```
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
```
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
```
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

### NMDA <a href="#d5e2067" id="d5e2067"></a>

Network Management Datastore Architecture (NMDA), as defined in [RFC 8527](https://www.ietf.org/rfc/rfc8527.txt), extends the RESTCONF protocol. This enables RESTCONF clients to discover which datastores are supported by the RESTCONF server, determine which modules are supported in each datastore, and interact with all the datastores supported by the NMDA.

A RESTCONF client can test if a server supports the NMDA by using either the `HEAD` or `GET` methods on `/restconf/ds/ietf- datastores:operational`, as shown below:

{% code title="Example: Check if the RESTCONF Server Support NMDA" %}
```
HEAD /restconf/ds/ietf-datastores:operational

HTTP/1.1 200 OK
```
{% endcode %}

A RESTCONF client can discover which datastores and YANG modules the server supports by reading the YANG library information from the operational state datastore. Note in the example below that, since the result consists of three top nodes, it can't be represented in XML; hence we request the returned content to be in JSON format. See also [Collections](northbound-apis.md#ncs.northbound.restconf.extensions.collections).

{% code title="Example: Check Which Datastores the RESTCONF Server Supports" %}
```
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

### Extensions

To avoid any potential future conflict with the RESTCONF standard, any extensions made to the NSO implementation of RESTCONF are located under the URL path: `/restconf/tailf`, or is controlled by means of a vendor-specific media type.

{% hint style="info" %}
There is no index of extensions under `/restconf/tailf`. To list extensions, access `/restconf/data/ietf-yang-library:modules-state` and follow published links for schemas.
{% endhint %}

### Collections <a href="#ncs.northbound.restconf.extensions.collections" id="ncs.northbound.restconf.extensions.collections"></a>

The RESTCONF specification states that a result containing multiple instances (e.g. a number of list entries) is not allowed if XML encoding is used. The reason for this is that an XML document can only have one root node.

This functionality is supported if the `http://tail-f.com/ns/restconf/collection/1.0` capability is presented. See also [How to View the Capabilities of the RESTCONF Server](northbound-apis.md#ncs.northbound.restconf.capabilities).

To remedy this, an HTTP GET request can make use of the `Accept:` media type: `application/vnd.yang.collection+xml` as shown in the following example. The result will then be wrapped within a `collection` element.

{% code title="Example: Use of Collections" %}
```
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

### The RESTCONF Query API

The NSO RESTCONF Query API consists of a number of operations to start a query which may live over several RESTCONF requests, where data can be fetched in suitable chunks. The data to be returned is produced by applying an XPath expression where the data also may be sorted.

The RESTCONF client can check if the NSO RESTCONF server supports this functionality by looking for the `http://tail-f.com/ns/restconf/query-api/1.0` capability. See also [How to View the Capabilities of the RESTCONF Server](northbound-apis.md#ncs.northbound.restconf.capabilities).

The `tailf-rest-query.yang` and the `tailf-common-query.yang` YANG models describe the structure of the RESTCONF Query API messages. By using the Schema Resource functionality, as described in [Schema Resource](northbound-apis.md#schema-resource), you can get hold of them.

#### Request and Replies <a href="#d5e2116" id="d5e2116"></a>

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
```
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
```
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
```
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

```
<start-query xmlns="http://tail-f.com/ns/tailf-rest-query">
```

The actual XPath query to run is specified by the `foreach` element. The example below will search for all `/x/host` nodes that have the `enabled` node set to `true`:

```
<foreach>
  /x/host[enabled = 'true']
</foreach>
```

Now we need to define what we want to have returned from the node set by using one or more `select` sections. What to actually return is defined by the XPath `expression`.

Choose how the result should be represented. Basically, it can be the actual value or the path leading to the value. This is specified per select chunk. The possible result types are `string`, `path`, `leaf-value`_,_ and `inline`.

The difference between `string` and `leaf-value` is somewhat subtle. In the case of `string`, the result will be processed by the XPath function: `string()` (which if the result is a node-set will concatenate all the values). The `leaf-value` will return the value of the first node in the result. As long as the result is a leaf node, `string` and `leaf-value` will return the same result. In the example above, the `string` is used as shown below. Note that at least one `result-type` must be specified.

The result-type `inline` makes it possible to return the full sub-tree of data, either in XML or in JSON format. The data will be enclosed with a tag: `data`.

It is possible to specify an optional `label` for a convenient way of labeling the returned data:

```
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

The returned result can be sorted. This is expressed as an XPath expression, which in most cases is very simple and refers to the found node-set. In this example, we sort the result by the content of the _name_ node:

```
<sort-by>name</sort-by>
```

With the `offset` element, we can specify at which node we should start to receive the result. The default is 1, i.e., the first node in the resulting node set.

```
<offset>1</offset>
```

It is possible to set a custom timeout when starting or resetting a query. Each time a function is called, the timeout timer resets. The default is 600 seconds, i.e. 10 minutes.

```
<timeout>600</timeout>
```

The reply to this request would look something like this:

```
<start-query-result>
  <query-handle>12345</query-handle>
</start-query-result>
```

The query handle (in this example '12345') must be used in all subsequent calls. To retrieve the result, we can now send:

```
<fetch-query-result xmlns="http://tail-f.com/ns/tailf-rest-query">
  <query-handle>12345</query-handle>
</fetch-query-result>
```

Which will result in something like the following:

```
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

```
<query-result xmlns="http://tail-f.com/ns/tailf-rest-query">
</query-result>
```

Finally, when we are done we stop the query:

```
<stop-query xmlns="http://tail-f.com/ns/tailf-rest-query">
  <query-handle>12345</query-handle>
</stop-query>
```

#### Reset a Query <a href="#d5e2222" id="d5e2222"></a>

If we want to go back into the stream of received data chunks and have them repeated, we can do that with the `reset-query` request. In the example below, we ask to get results from the 42nd result entry:

```
<reset-query xmlns="http://tail-f.com/ns/tailf-rest-query">
  <query-handle>12345</query-handle>
  <offset>42</offset>
</reset-query>
```

#### Immediate Query <a href="#d5e2226" id="d5e2226"></a>

If we want to get the entire result sent back to us, using only one request, we can do this by using the `immediate-query`. This function takes similar arguments as `start-query` and returns the entire result analogous with the result from a `fetch-query-result` request. Note that it is not possible to paginate or set an offset start node for the result list; i.e. the options `limit` and `offset` are ignored.

### Partial Responses <a href="#ncs.northbound.partial_response" id="ncs.northbound.partial_response"></a>

This functionality is supported if the `http://tail-f.com/ns/restconf/partial-response/1.0` capability is presented. See also [How to View the Capabilities of the RESTCONF Server](northbound-apis.md#ncs.northbound.restconf.capabilities).

By default, the server sends back the full representation of a resource after processing a request. For better performance, the server can be instructed to send only the nodes the client really needs in a partial response.

To request a partial response for a set of list entries, use the `offset` and `limit` query parameters to specify a limited set of entries to be returned.

In the following example, we retrieve only two entries, skipping the first entry and then returning the next two entries:

{% code title="Example: Partial Response" %}
```
GET /restconf/data/example-jukebox:jukebox/library/artist?offset=1&limit=2
Accept: application/yang-data+json

...in return we will get the second and third elements of the list...
```
{% endcode %}

### Hidden Nodes

This functionality is supported if the `http://tail-f.com/ns/restconf/unhide/1.0` capability is presented. See also [How to View the Capabilities of the RESTCONF Server](northbound-apis.md#ncs.northbound.restconf.capabilities).

By default, hidden nodes are not visible in the RESTCONF interface. To unhide hidden nodes for retrieval or editing, clients can use the query parameter `unhide` or set parameter `showHidden` to `true` under `/confdConfig/restconf` in `confd.conf` file. The query parameter `unhide` is supported for RPC and action invocation.

The format of the `unhide` parameter is a comma-separated list of

```
<groupname>[;<password>]
```

As an example:

```
unhide=extra,debug;secret
```

This example unhides the unprotected group _extra_ and the password-protected group `debug` with the password `secret;`.

### Trace Context <a href="#trace-context" id="trace-context"></a>

This functionality is supported if the `urn:ietf:params:xml:ns:yang:traceparent:1.0` and `urn:ietf:params:xml:ns:yang:tracestate:1.0` capability is presented. See also [How to View the Capabilities of the RESTCONF Server](northbound-apis.md#ncs.northbound.restconf.capabilities).

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

NSO implements Trace Context alongside the legacy way of handling `trace-id`, where the `trace-id` comes as a query parameter. These two different ways of handling `trace-id` cannot be used at the same time. If both are used, the request generates an error response. If a request does not include `trace-id` or the header `traceparent`, a `traceparent` will be generated internally in NSO. NSO will consider the headers of Trace Context in RESTCONF requests if the `trace-id` element is enabled in the configuration file. Trace Context is handled by the progress trace functionality, see also [Progress Trace](../connected-topics/progress-trace.md) in Development.

### Configuration Metadata <a href="#d5e2268" id="d5e2268"></a>

It is possible to associate metadata with the configuration data. For RESTCONF, resources such as containers, lists as well as leafs and leaf-lists can have such meta-data. For XML, this meta-data is represented as attributes attached to the XML element in question. For JSON, there does not exist a natural way to represent this info. Hence a special special notation has been introduced, based on the [RFC 7952](https://www.ietf.org/rfc/rfc7952.txt), see the example below.

{% code title="Example: XML Representation of Metadata" %}
```
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
```
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

| Meta-data type    | Prefix                   |
| ----------------- | ------------------------ |
| `origin`          | `ietf-origin`            |
| `inactive/active` | `tailf-netconf-inactive` |
| `default`         | `tailf-netconf-defaults` |
| `All other`       | `tailf_netconf`          |

Compare this to the encoding in NSO versions prior to 6.3, where we represented meta-data for an object by another object constructed of the object name prefixed with either one or two "@" signs. The meta-data object "@x" referred to the sibling object "x" and the "@@x" object referred to the parent object. No module name prefixes were included for the meta-data data object types. This did not conform to [RFC 7952](https://www.rfc-editor.org/rfc/rfc7952.html) for legacy reasons. See the example below.

{% code title="Example: Legacy JSON Representation of Meta-data" %}
```
{
  "x": {
    "foo": 42,
    "@foo": {"tags": ["tags","for","foo"], "annotation": "annotation for foo"},
    "y": {
      "@@y": {"annotation": "Annotation for parent y"},
      "y": 1,
      "@y": {"annotation": "Annotation for sibling y"}
    }
  }
}
```
{% endcode %}

To continue using the old meta-data format, set `legacy-attribute-format` to `true` in `ncs.conf`. The default is `false`, which uses the [RFC 7952](https://www.rfc-editor.org/rfc/rfc7952.html) format. The `legacy-attribute-format` setting is deprecated and will be removed in a future release.

It is also possible to set meta-data objects in JSON format, which was previously only possible with XML. Note that the new attribute format must be used and `legacy-attribute-format` set to `false`. Except for setting the `default` and `insert` meta-data types, which are not supported using JSON.

### Authentication Cache <a href="#d5e2282" id="d5e2282"></a>

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

### Client IP via Proxy

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

### External Token Authentication/Validation

The NSO RESTCONF server can be set up to pass a long, a token used for authentication and/or validation of the client. Note that this requires `external authentication/validation` to be set up properly. See [External Token Validation](../../administration/management/aaa-infrastructure.md#ug.aaa.external\_validation) and [External Authentication](../../administration/management/aaa-infrastructure.md#ug.aaa.external\_authentication) for details.

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

### Custom Response HTTP Headers

The RESTCONF server can be configured to reply with particular HTTP headers in the HTTP response. For example, to support Cross-Origin Resource Sharing (CORS, [https://www.w3.org/TR/cors/](https://www.w3.org/TR/cors/)) there is a need to add a couple of headers to the HTTP Response.

We add the extra configuration parameter in `ncs.conf`.

{% code title="Example: NSO RESTCONF Custom Header Configuration" %}
```
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

### Generating Swagger for RESTCONF <a href="#d5e2380" id="d5e2380"></a>

Swagger is a documentation language used to describe RESTful APIs. The resulting specifications are used to both document APIs as well as generating clients in a variety of languages. For more information about the Swagger specification itself and the ecosystem of tools available for it, see [swagger.io](https://swagger.io/).

The RESTCONF API in NSO provides an HTTP-based interface for accessing data. The YANG modules loaded into the system define the schema for the data structures that can be manipulated using the RESTCONF protocol. The `yanger` tool provides options to generate Swagger specifications from YANG files. The tool currently supports generating specifications according to OpenAPI/Swagger 2.0 using JSON encoding. The tool supports the validation of JSON bodies in body parameters and response bodies, and XML content validation is not supported.

YANG and Swagger are two different languages serving slightly different purposes. YANG is a data modeling language used to model configuration data, state data, Remote Procedure Calls, and notifications for network management protocols such as NETCONF and RESTCONF. Swagger is an API definition language that documents API resource structure as well as HTTP body content validation for applicable HTTP request methods. Translation from YANG to Swagger is not perfect in the sense that there are certain constructs and features in YANG that is not possible to capture completely in Swagger. The design of the translation is designed such that the resulting Swagger definitions are _more_ restrictive than what is expressed in the YANG definitions. This means that there are certain cases where a client can do more in the RESTCONF API than what the Swagger definition expresses. There is also a set of well-known resources defined in the [RESTCONF RFC 8040](https://tools.ietf.org/html/rfc8040) that are not part of the generated Swagger specification, notably resources related to event streams.

#### Using Y**anger** to Generate Swagger <a href="#d5e2390" id="d5e2390"></a>

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

## The NSO SNMP Agent

The SNMP agent in NSO is used mainly for monitoring and notifications. It supports SNMPv1, SNMPv2c, and SNMPv3.

The following standard MIBs are supported by the SNMP agent:

* SNMPv2-MIB [RFC 3418](https://www.ietf.org/rfc/rfc3418.txt)
* SNMP-FRAMEWORK-MIB [RFC 3411](https://www.ietf.org/rfc/rfc3411.txt)
* SNMP-USER-BASED-SM-MIB [RFC 3414](https://www.ietf.org/rfc/rfc3414.txt)
* SNMP-VIEW-BASED-ACM-MIB [RFC 3415](https://www.ietf.org/rfc/rfc3415.txt)
* SNMP-COMMUNITY-MIB [RFC 3584](https://www.ietf.org/rfc/rfc3584.txt)
* SNMP-TARGET-MIB and SNMP-NOTIFICATION-MIB [RFC 3413](https://www.ietf.org/rfc/rfc3413.txt)
* SNMP-MPD-MIB [RFC 3412](https://www.ietf.org/rfc/rfc3412.txt)
* TRANSPORT-ADDRESS-MIB [RFC 3419](https://www.ietf.org/rfc/rfc3419.txt)
* SNMP-USM-AES-MIB [RFC 3826](https://www.ietf.org/rfc/rfc3826.txt)
* IPV6-TC [RFC 2465](https://www.ietf.org/rfc/rfc2465.txt)

{% hint style="info" %}
The usmHMACMD5AuthProtocol authentication protocol and the usmDESPrivProtocol privacy protocol specified in SNMP-USER-BASED-SM-MIB are not supported, since they are not considered secure. The usmHMACSHAAuthProtocol authentication protocol specified in SNMP-USER-BASED-SM-MIB and the usmAesCfb128Protocol privacy protocol specified in SNMP-USM-AES-MIB are supported.
{% endhint %}

### Configuring the SNMP Agent <a href="#d5e2459" id="d5e2459"></a>

The SNMP agent is configured through any of the normal NSO northbound interfaces. It is possible to control most aspects of the agent through for example the CLI.

The YANG models describing all configuration capabilities of the SNMP agent reside under `$NCS_DIR/src/ncs/snmp/snmp-agent-config/*.yang` in the NSO distribution.

An example session configuring the SNMP agent through the CLI may look like:

```
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# snmp agent udp-port 3457
admin@ncs(config)# snmp community public name foobaz
admin@ncs(config-community-public)# commit
Commit complete.
admin@ncs(config-community-public)# top
admin@ncs(config)# show full-configuration snmp
snmp agent enabled
snmp agent ip    0.0.0.0
snmp agent udp-port 3457
snmp agent version v1
snmp agent version v2c
snmp agent version v3
snmp agent engine-id enterprise-number 32473
snmp agent engine-id from-text testing
snmp agent max-message-size 50000
snmp system contact ""
snmp system name ""
snmp system location ""
snmp usm local user initial
 auth sha password GoTellMom
 priv aes password GoTellMom
!
snmp target monitor
 ip       127.0.0.1
 udp-port 162
 tag      [ monitor ]
 timeout  1500
 retries  3
 v2c sec-name public
!
snmp community public
 name     foobaz
 sec-name public
!
snmp notify foo
 tag  monitor
 type trap
!
snmp vacm group initial
 member initial
  sec-model [ usm ]
 !
 access usm no-auth-no-priv
  read-view   internet
  notify-view internet
 !
 access usm auth-no-priv
  read-view   internet
  notify-view internet
 !
 access usm auth-priv
  read-view   internet
  notify-view internet
 !
!
snmp vacm group public
 member public
  sec-model [ v1 v2c ]
 !
 access any no-auth-no-priv
  read-view   internet
  notify-view internet
 !
!
snmp vacm view internet
 subtree 1.3.6.1
  included
 !
!
snmp vacm view restricted
 subtree 1.3.6.1.6.3.11.2.1
  included
 !
 subtree 1.3.6.1.6.3.15.1.1
  included
 !
!
```

The SNMP agent configuration data is stored in CDB as any other configuration data, but is handled as a transformation between the data shown above and the data stored in the standard MIBs.

If you want to have a default configuration of the SNMP agent, you must provide that in an XML file. The initialization data of the SNMP agent is stored in an XML file that has precisely the same format as CDB initialization XML files, but it is not loaded by CDB, rather it is loaded at first startup by the SNMP agent. The XML file must be called `snmp_init.xml` and it must reside in the load path of NSO. In the NSO distribution, there is such an initialization file in `$NCS_DIR/etc/ncs/snmp/snmp_init.xml`. It is strongly recommended that this file be customized with another engine ID and other community strings and v3 users.

If no `snmp_init.xml` file is found in the load path a default configuration with the agent disabled is loaded. Thus, the easiest way to start NSO without the SNMP agent is to ensure that the directory `$NCS_DIR/etc/ncs/snmp/` is not part of the NSO load path.

Note, that this only relates to initialization the first time NSO is started. On subsequent starts, all the SNMP agent configuration data is stored in CDB and the `snmp_init.xml` is never used again.

### Alarm MIB <a href="#d5e2482" id="d5e2482"></a>

The NSO SNMP alarm MIB is designed for ease of use in alarm systems. It defines a table of alarms and SNMP alarm notifications corresponding to alarm state changes. Based on the alarm model in NSO (see [NSO Alarms](https://developer.cisco.com/docs/nso-guides-6.1/#!northbound-apis-nso-alarms)), the notifications as well as the alarm table contain the parameters that are required for alarm standards compliance (X.733 and 3GPP). The MIB files are located in `$NCS_DIR/src/ncs/snmp/mibs`.

* **TAILF-TOP-MIB.mib**\
  **T**he tail-f enterprise OID.
* **TAILF-TC-MIB.mib**\
  Textual conventions for the alarm mib.
* **TAILF-ALARM-MIB.mib**\
  **T**he actual alarm MIB.
* **IANA-ITU-ALARM-TC-MIB.mib**\
  Import of IETF mapping of X.733 parameters.
* **ITU-ALARM-TC-MIB.mib**\
  Import of IETF mapping of X.733 parameters.

<figure><img src="../../images/alarm-mib.png" alt=""><figcaption><p>The NSO Alarm MIB</p></figcaption></figure>

The alarm table has the following columns:

* **tfAlarmIndex**\
  An imaginary index for the alarm row that is persistent between restarts.
* **tfAlarmType**\
  This provides an identification of the alarm type and together with tfAlarmSpecificProblem forms a unique identification of the alarm.
* **tfAlarmDevice**\
  The alarming network device - can be NSO itself.
* **tfAlarmObject**\
  The alarming object within the device.
* **tfAlarmObjectOID**\
  In case the original alarm notification was an SNMP notification this column identifies the alarming SNMP object.
* **tfAlarmObjectStr**\
  Name of alarm object based on any other naming.
* **tfAlarmSpecificProblem**\
  This object is used when the 'tfAlarmType' object cannot uniquely identify the alarm type.
* **tfAlarmEventType**\
  The event type according to X.733 and based on the mapping of the alarm type in the NSO alarm model.
* **tfAlarmProbableCause**\
  The probable cause to X.733 and based on the mapping of the alarm type in the NSO alarm model. Note that you can configure this to match the probable cause values in the receiving alarm system.
* **tfAlarmOrigTime**\
  The time for the first occurrence of this alarm.
* **tfAlarmTime**\
  The time for the last state change of this alarm.
* **tfAlarmSeverity**\
  The latest severity (non-clear) reported for this alarm.
* **tfAlarmCleared**\
  Boolean indicated if the latest state change reports a clear.
* **tfAlarmText**\
  The latest alarm text.
* **tfAlarmOperatorState**\
  The latest operator alarm state such as ack.
* **tfAlarmOperatorNote**\
  The latest operator note.

The MIB defines separate notifications for every severity level to support SNMP managers that only can map severity levels to individual notifications. Every notification contains the parameters of the alarm table.

#### SNMP Object Identifiers <a href="#d5e2580" id="d5e2580"></a>

{% code title="Example: Object Identifiers" %}
```
 tfAlarmMIB             node         1.3.6.1.4.1.24961.2.103
 tfAlarmObjects         node         1.3.6.1.4.1.24961.2.103.1
 tfAlarms               node         1.3.6.1.4.1.24961.2.103.1.1
 tfAlarmNumber          scalar       1.3.6.1.4.1.24961.2.103.1.1.1
 tfAlarmLastChanged     scalar       1.3.6.1.4.1.24961.2.103.1.1.2
 tfAlarmTable           table        1.3.6.1.4.1.24961.2.103.1.1.5
 tfAlarmEntry           row          1.3.6.1.4.1.24961.2.103.1.1.5.1
 tfAlarmIndex           column       1.3.6.1.4.1.24961.2.103.1.1.5.1.1
 tfAlarmType            column       1.3.6.1.4.1.24961.2.103.1.1.5.1.2
 tfAlarmDevice          column       1.3.6.1.4.1.24961.2.103.1.1.5.1.3
 tfAlarmObject          column       1.3.6.1.4.1.24961.2.103.1.1.5.1.4
 tfAlarmObjectOID       column       1.3.6.1.4.1.24961.2.103.1.1.5.1.5
 tfAlarmObjectStr       column       1.3.6.1.4.1.24961.2.103.1.1.5.1.6
 tfAlarmSpecificProblem column       1.3.6.1.4.1.24961.2.103.1.1.5.1.7
 tfAlarmEventType       column       1.3.6.1.4.1.24961.2.103.1.1.5.1.8
 tfAlarmProbableCause   column       1.3.6.1.4.1.24961.2.103.1.1.5.1.9
 tfAlarmOrigTime        column       1.3.6.1.4.1.24961.2.103.1.1.5.1.10
 tfAlarmTime            column       1.3.6.1.4.1.24961.2.103.1.1.5.1.11
 tfAlarmSeverity        column       1.3.6.1.4.1.24961.2.103.1.1.5.1.12
 tfAlarmCleared         column       1.3.6.1.4.1.24961.2.103.1.1.5.1.13
 tfAlarmText            column       1.3.6.1.4.1.24961.2.103.1.1.5.1.14
 tfAlarmOperatorState   column       1.3.6.1.4.1.24961.2.103.1.1.5.1.15
 tfAlarmOperatorNote    column       1.3.6.1.4.1.24961.2.103.1.1.5.1.16
 tfAlarmNotifications   node         1.3.6.1.4.1.24961.2.103.2
 tfAlarmNotifsPrefix    node         1.3.6.1.4.1.24961.2.103.2.0
 tfAlarmNotifsObjects   node         1.3.6.1.4.1.24961.2.103.2.1
 tfAlarmStateChangeText scalar       1.3.6.1.4.1.24961.2.103.2.1.1
 tfAlarmIndeterminate   notification 1.3.6.1.4.1.24961.2.103.2.0.1
 tfAlarmWarning         notification 1.3.6.1.4.1.24961.2.103.2.0.2
 tfAlarmMinor           notification 1.3.6.1.4.1.24961.2.103.2.0.3
 tfAlarmMajor           notification 1.3.6.1.4.1.24961.2.103.2.0.4
 tfAlarmCritical        notification 1.3.6.1.4.1.24961.2.103.2.0.5
 tfAlarmClear           notification 1.3.6.1.4.1.24961.2.103.2.0.6
 tfAlarmConformance     node         1.3.6.1.4.1.24961.2.103.10
 tfAlarmCompliances     node         1.3.6.1.4.1.24961.2.103.10.1
 tfAlarmCompliance      compliance   1.3.6.1.4.1.24961.2.103.10.1.1
 tfAlarmGroups          node         1.3.6.1.4.1.24961.2.103.10.2
 tfAlarmNotifs          group        1.3.6.1.4.1.24961.2.103.10.2.1
 tfAlarmObjs            group        1.3.6.1.4.1.24961.2.103.10.2.2
```
{% endcode %}

#### Using the SNMP Alarm MIB

Alarm Managers should subscribe to the notifications and read the alarm table to synchronize the alarm list. To do this you need an access view that matches the alarm MIB and creates a SNMP target. Default SNMP settings in NSO let you read the alarm MIB with v2c and community public. A target is set up in the following way, (assuming the SNMP Alarm Manager has IP address 192.168.1.1 and wants community string public in the v2c notifications):

{% code title="Example: Subscribing to SNMP Alarms" %}
```
$ ncs_cli -u admin -C
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# snmp notify monitor type trap tag monitor
admin@ncs(config-notify-monitor)# snmp target alarm-system ip 192.168.1.1 udp-port 162 \
        tag monitor v2c sec-name public
admin@ncs(config-target-alarm-system)# commit
Commit complete.
admin@ncs(config-target-alarm-system)# show full-configuration snmp target
snmp target alarm-system
 ip       192.168.1.1
 udp-port 162
 tag      [ monitor ]
 timeout  1500
 retries  3
 v2c sec-name public
!
snmp target monitor
 ip       127.0.0.1
 udp-port 162
 tag      [ monitor ]
 timeout  1500
 retries  3
 v2c sec-name public
!
admin@ncs(config-target-alarm-system)#
```
{% endcode %}
