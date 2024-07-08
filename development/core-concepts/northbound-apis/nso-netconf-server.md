---
description: Description of northbound NETCONF implementation in NSO.
---

# NSO NETCONF Server

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

NSO NETCONF northbound API can be used by arbitrary NETCONF clients. A simple Python-based NETCONF client called `netconf-console` is shipped as source code in the distribution. See [Using netconf-console](nso-netconf-server.md#ug.netconf\_agent.netconf\_console) for details. Other NETCONF clients will work too, as long as they adhere to the NETCONF protocol. If you need a Java client, the open-source client [JNC](https://github.com/tail-f-systems/JNC) can be used.

When integrating NSO into larger OSS/NMS environments, the NETCONF API is a good choice of integration point.

## Protocol Capabilities <a href="#d5e142" id="d5e142"></a>

The NETCONF server in NSO supports the following capabilities in both NETCONF 1.0 ([RFC 4741](https://www.ietf.org/rfc/rfc4741.txt)) and NETCONF 1.1 ([RFC 6241](https://www.ietf.org/rfc/rfc6241.txt)).

<table data-full-width="true"><thead><tr><th width="234">Capability</th><th>Description</th></tr></thead><tbody><tr><td><code>:writable-running</code></td><td>This capability is always advertised.</td></tr><tr><td><code>:candidate</code></td><td>Not supported by NSO.</td></tr><tr><td><code>:confirmed-commit</code></td><td>Not supported by NSO.</td></tr><tr><td><code>:rollback-on-error</code></td><td>This capability allows the client to set the <code>&#x3C;error-option></code> parameter to <code>rollback-on-error</code>. The other permitted values are <code>stop-on-error</code> (default) and <code>continue-on-error</code>. Note that the meaning of the word "error" in this context is not defined in the specification. Instead, the meaning of this word must be defined by the data model. Also, note that if <code>stop-on-error</code> or <code>continue-on-error</code> is triggered by the server, it means that some parts of the edit operation succeeded, and some parts didn't. The error <code>partial-operation</code> must be returned in this case. <code>partial-operation</code> is obsolete and should not be returned by a server. If some other error occurs (i.e. an error not covered by the meaning of "error" above), the server generates an appropriate error message, and the data store is unaffected by the operation.<br><br>The NSO server never allows partial configuration changes, since it might result in inconsistent configurations, and recovery from such a state can be very difficult for a client. This means that regardless of the value of the <code>&#x3C;error-option></code> parameter, NSO will always behave as if it had the value <code>rollback-on-error</code>. So in NSO, the meaning of the word "error" in <code>stop-on-error</code> and <code>continue-on-error</code>, is something that never can happen.<br><br>It is possible to configure the NETCONF server to generate an <code>operation-not-supported</code> error if the client asks for the <code>error-option</code> <code>continue-on-error</code>. See <a href="https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-5/man.5.ncs.conf">ncs.conf(5)</a> in Manual Pages.</td></tr><tr><td><code>:validate</code></td><td>NSO supports both version 1.0 and 1.1 of this capability.</td></tr><tr><td><code>:startup</code></td><td>Not supported by NSO.</td></tr><tr><td><code>:url</code></td><td><p>The URL schemes supported are <code>file</code>, <code>ftp</code>, and <code>sftp</code> (SSH File Transfer Protocol). There is no standard URL syntax for the <em><code>sftp</code></em> scheme, but NSO supports the syntax used by <code>curl</code>:</p><pre><code>sftp://&#x3C;user>:&#x3C;password>@&#x3C;host>/&#x3C;path>
</code></pre><p>Note that user name and password must be given for <code>sftp</code> URLs. NSO does not support <code>validate</code> from a URL.</p></td></tr><tr><td><code>:xpath</code></td><td>The NETCONF server supports XPath according to the W3C XPath 1.0 specification (<a href="https://www.w3.org/TR/xpath">https://www.w3.org/TR/xpath</a>).</td></tr></tbody></table>

The following list of optional standard capabilities is also supported:

<table data-full-width="true"><thead><tr><th width="237">Capability</th><th>Description</th></tr></thead><tbody><tr><td><code>:notification</code></td><td>NSO implements the <code>urn:ietf:params:netconf:capability:notification:1.0</code> capability, including support for the optional replay feature. See <a href="nso-netconf-server.md#ug.netconf_agent.notif">Notification Capability</a> for details.</td></tr><tr><td><code>:with-defaults</code></td><td><p>NSO implements the <code>urn:ietf:params:netconf:capability:with-defaults:1.0</code> capability, which is used by the server to inform the client how default values are handled by the server, and by the client to control whether default values should be generated to replies or not.</p><p>If the capability is enabled, NSO also implements the <code>urn:ietf:params:netconf:capability:with-operational-defaults:1.0</code> capability, which targets the operational state datastore while the <code>:with-defaults</code> capability targets configuration data stores.</p></td></tr><tr><td><code>:yang-library:1.0</code></td><td>NSO implements the <code>urn:ietf:params:netconf:capability:yang-library:1.0</code> capability, which informs the client that the server implements the YANG module library <a href="https://www.ietf.org/rfc/rfc7895.txt">RFC 7895</a>, and informs the client about the current <code>module-set-id</code>.</td></tr><tr><td><code>:yang-library:1.1</code></td><td>NSO implements the <code>urn:ietf:params:netconf:capability:yang-library:1.1</code> capability, which informs the client that the server implements the YANG library <a href="https://www.ietf.org/rfc/rfc8525.txt">RFC 8525</a>, and informs the client about the current <code>content-id</code>.</td></tr></tbody></table>

## Protocol YANG Modules <a href="#d5e255" id="d5e255"></a>

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

## Advertising Capabilities and YANG Modules <a href="#d5e376" id="d5e376"></a>

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

If a YANG module (any version) is supported by the server, and its .yang or .yin file is found in the `fxs` file or in the loadPath, then the module is also advertised in the `schema` list defined in `ietf-netconf-monitoring`, made available for download with the RPC operation `get-schema`, and if RESTCONF is enabled, also advertised in the `schema` leaf in `ietf-yang-library`. See [Monitoring of the NETCONF Server](nso-netconf-server.md#ug.netconf\_agent.monitoring).

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

## NETCONF Transport Protocols <a href="#ug.netconf_agent.transport" id="ug.netconf_agent.transport"></a>

The NETCONF server natively supports the mandatory SSH transport, i.e., SSH is supported without the need for an external SSH daemon (such as `sshd`). It also supports integration with OpenSSH.

### Using OpenSSH <a href="#d5e432" id="d5e432"></a>

NSO is delivered with a program **netconf-subsys** which is an OpenSSH subsystem program. It is invoked by the OpenSSH daemon after successful authentication. It functions as a relay between the ssh daemon and NSO; it reads data from the ssh daemon from standard input and writes the data to NSO over a loopback socket, and vice versa. This program is delivered as source code in `$NCS_DIR/src/ncs/netconf/netconf-subsys.c`. It can be modified to fit the needs of the application. For example, it could be modified to read the group names for a user from an external LDAP server.

When using OpenSSH, the users are authenticated by OpenSSH, i.e., the user names are not stored in NSO. To use OpenSSH, compile the `netconf-subsys` program, and put the executable in e.g. `/usr/local/bin`. Then add the following line to the ssh daemon's config file, `sshd_config`:

```
Subsystem     netconf   /usr/local/bin/netconf-subsys
```

The connection from `netconf-subsys` to NSO can be arranged in one of two different ways:

1. Make sure NSO is configured to listen to TCP traffic on localhost, port 2023, and disable SSH in `ncs.conf` (see [ncs.conf(5)](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-5/man.5.ncs.conf) in Manual Pages ). (Re)start `sshd` and NSO. Or:
2. Compile `netconf-subsys` to use a connection to the IPC port instead of the NETCONF TCP transport (see the `netconf-subsys.c` source for details), and disable both TCP and SSH in `ncs.conf`. (Re)start `sshd` and NSO. This method may be preferable since it makes it possible to use the IPC Access Check (see [Restricting Access to the IPC Port](../../../administration/advanced-topics/ipc-ports.md#ug.ncs\_advanced.ipc.restricting)) to restrict the unauthenticated access to NSO that is needed by `netconf-subsys`.

By default, the `netconf-subsys` program sends the names of the UNIX groups the authenticated user belongs to. To test this, make sure that NSO is configured to give access to the group(s) the user belongs to. The easiest for test is to give access to all groups.

## Configuring the NETCONF Server <a href="#d5e461" id="d5e461"></a>

NSO itself is configured through a configuration file called `ncs.conf`. For a description of the parameters in this file, please see the [ncs.conf(5)](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-5/man.5.ncs.conf) in Manual Pages man page.

### Error Handling <a href="#d5e466" id="d5e466"></a>

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

## Using `netconf-console` <a href="#ug.netconf_agent.netconf_console" id="ug.netconf_agent.netconf_console"></a>

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

## Monitoring the NETCONF Server <a href="#ug.netconf_agent.monitoring" id="ug.netconf_agent.monitoring"></a>

[RFC 6022 - YANG Module for NETCONF Monitoring](https://www.ietf.org/rfc/rfc6022.txt) defines a YANG module, `ietf-netconf-monitoring`for monitoring of the NETCONF server. It contains statistics objects such as the number of RPCs received, status objects such as user sessions, and an operation to retrieve data models from the NETCONF server.

This data model defines an RPC operation, `get-schema`, which is used to retrieve YANG modules from the NETCONF server. NSO will report the YANG modules for all fxs files that are reported as capabilities, and for which the corresponding YANG or YIN file is stored in the fxs file or found in the loadPath. If a file is found in the loadPath, it has priority over a file stored in the `fxs` file. Note that by default, the module and its submodules are stored in the `fxs` file by the compiler.

If the YANG (or YIN files) are copied into the loadPath, they can be stored as is or compressed with gzip. The filename extension MUST be `.yang`, `.yin`, `.yang.gz`, or `.yin.gz`.

Also available is a Tail-f-specific data model, `tailf-netconf-monitoring`, which augments `ietf-netconf-monitoring` with additional data about files available for usage with the `<copy-config>` command with a `file` `<url>` source or target. `/ncs-config/netconf-north-bound/capabilities/url/enabled` and `/ncs-config/netconf-north-bound/capabilities/url/file/enabled` must both be set to true. If rollbacks are enabled, those files are listed as well, and they can be loaded using `<copy-config>`.

This data model also adds data about which notification streams are present in the system and data about sessions that subscribe to the streams.

## Notification Capability <a href="#ug.netconf_agent.notif" id="ug.netconf_agent.notif"></a>

This section describes how NETCONF notifications are implemented within NSO, and how the applications generate these events.

Central to NETCONF notifications is the concept of a stream. The stream serves two purposes. It works like a high-level filtering mechanism for the client. For example, if the client subscribes to notifications on the `security` stream, it can expect to get security-related notifications only. Second, each stream may have its own log mechanism. For example, by keeping all debug notifications in a `debug` stream, they can be logged separately from the `security` stream.

### Built-in Notification Streams <a href="#d5e521" id="d5e521"></a>

NSO has built-in support for the well-known stream `NETCONF`, defined in [RFC 5277](https://www.ietf.org/rfc/rfc5277.txt) and [RFC 8639](https://www.ietf.org/rfc/rfc8639.txt). NSO supports the notifications defined in [RFC 6470 - NETCONF Base Notifications](https://www.ietf.org/rfc/rfc6470.txt) on this stream. If the application needs to send any additional notifications on this stream, it can do so.

NSO can be configured to listen to notifications from devices and send those notifications to northbound NETCONF clients. The stream `device-notifications` is used for this purpose. To enable this, the stream `device-notifications` must be configured in `ncs.conf`, and additionally, subscriptions must be created in `/ncs:devices/device/notifications`.

### Defining Notification Streams <a href="#d5e533" id="d5e533"></a>

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

### Automatic Replay <a href="#d5e544" id="d5e544"></a>

NSO has built-in support for logging of notifications, i.e., if replay support has been enabled for a stream, NSO automatically stores all notifications on disk ready to be replayed should a NETCONF client ask for logged notifications. In the `ncs.conf` fragment above the security stream has been set up to use the built-in notification log/replay store. The replay store uses a set of wrapping log files on a disk (of a certain number and size) to store the security stream notifications.

The reason for using a wrap log is to improve replay performance whenever a NETCONF client asks for notifications in a certain time range. Any problems with log files not being properly closed due to hard power failures etc. are also kept to a minimum, i.e., automatically taken care of by NSO.

## Subscribed Notifications <a href="#ug.netconf_agent.subscribed_notif" id="ug.netconf_agent.subscribed_notif"></a>

This section describes how Subscribed Notifications are implemented for NETCONF within NSO.

Subscribed Notifications is defined in [RFC 8639](https://www.ietf.org/rfc/rfc8639.txt) and the NETCONF transport binding is defined in [RFC 8640](https://www.ietf.org/rfc/rfc8640.txt). Subscribed Notifications build upon NETCONF notifications defined in [RFC 5277](https://www.ietf.org/rfc/rfc5277.txt) and have a number of key improvements:

* Multiple subscriptions on a single transport session
* Support for dynamic and configured subscriptions
* Modification of an existing subscription in progress
* Per-subscription operational counters
* Negotiation of subscription parameters (through the use of hints returned as part of declined subscription requests)
* Subscription state change notifications (e.g., publisher-driven suspension, parameter modification)
* Independence from transport

### Compatibility with NETCONF Notifications <a href="#d5e571" id="d5e571"></a>

Both NETCONF notifications and Subscribed Notifications can be used at the same time and are configured the same way in `ncs.conf`. However, there are some differences and limitations.

For Subscribed Notifications, a new subscription is requested by invoking the RPC `establish-subscription`. For NETCONF notifications, the corresponding RPC is `create-subscription`.

A NETCONF session can only have either the subscribers started with `create-subscription` or `establish-subscription` simultaneously.

*   If a session has subscribers established with `establish-subscription` and receives a request to create subscriptions with `create-subscription`, an `<rpc-error>` is sent containing `<error-tag>` `operation-not-supported`.

    If a session has subscribers created with `create-subscription` and receives a request to establish subscriptions with `establish-subscription`, an `<rpc-error>` is sent containing `<error-tag>` `operation-not-supported`.

Dynamic subscriptions send all notifications on the transport session where they were established.

### Monitoring Subscriptions <a href="#ug.netconf_agent.subscribed_notif.monitoring" id="ug.netconf_agent.subscribed_notif.monitoring"></a>

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

### **Limitations**

It is not possible to establish a subscription with a stored filter from `/filters`.

The support for monitoring subscriptions has basic functionality. It is possible to read `subscription-id`, `stream`, `stream-xpath-filter`, `replay-start-time`, `stop-time`, `encoding`, `receivers/receiver/name`, and `receivers/receiver/state`.

The leaf `stream-subtree-filter` is deviated as "not-supported", hence can not be read.

The unsupported leafs in the subscriptions container are the following: `stream-subtree-filter`, `receiver/sent-event-records`, and `receiver/excluded-event-records`.

## YANG-Push <a href="#ug.netconf_agent.yang_push" id="ug.netconf_agent.yang_push"></a>

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

### Periodic Subscriptions <a href="#d5e649" id="d5e649"></a>

For periodic subscriptions, updates are triggered periodically according to specified time interval. Optionally a reference `anchor-time` can be provided for a specified `period`.

### On-Change Subscriptions <a href="#d5e654" id="d5e654"></a>

For on-change subscriptions, updates are triggered whenever a change is detected on the subscribed information. In the case of rapidly changing data, instead of receiving frequent notifications for every change, a receiver may specify a `dampening-period` to receive update notifications in a lower frequency. A receiver may request for synchronization at the start of a subscription by using `sync-on-start` option. A receiver may filter out specific types of changes by providing a list of `excluded-change` parameters.

To provide updates for `on-change` subscriptions on `operational` datastore, data provider applications are required to implement push-on-change callbacks. For more details, see the [PUSH ON-CHANGE CALLBACKS](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-3/fn.confd\_push\_on\_change) in the Manual Pages section of [confd\_lib\_dp(3)](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-3/man.3.confd\_lib\_dp) in Manual Pages.

### YANG-Push Operations <a href="#d5e665" id="d5e665"></a>

In addition to RPCs defined in subscribed notifications, YANG-Push defines `resync-subscription` RPC. Upon receipt of `resync-subscription`, if the subscription is an on-change triggered type, a `push-update` notification is sent to the receiver according to the terms of the subscription. Otherwise, an appropriate error response is sent.

* `resync-subscription`

### Monitoring the YANG-Push Subscriptions <a href="#d5e675" id="d5e675"></a>

YANG-Push subscriptions can be monitored in a similar way to Subscribed Notifications through /subscriptions container. For more information, see [Monitoring Subscriptions](nso-netconf-server.md#ug.netconf\_agent.subscribed\_notif.monitoring).

YANG-Push filters differ from the filters of Subscribed Notifications and they are specified as `datastore-xpath-filter` and `datastore-subtree-filter`. The leaf `datastore-subtree-filter` is deviated as "not-supported", and hence can not be monitored. Also, YANG-Push specific update trigger parameters `periodic/period`, `periodic/anchor-time`, `on-change/dampening-period`, `on-change/sync-on-start` and `on-change/excluded-change` are not supported for monitoring.

### Limitations <a href="#d5e688" id="d5e688"></a>

* `modify-subscriptions` operation does not support changing a subscriptions update trigger type from `periodic` to `on-change` or vice versa.
* `on-change` subscriptions do not work for changes that are made through the CDB-API.
* `on-change` subscriptions do not work on internal callpoints such as `ncs-state`, `ncs-high-availability`, and `live-status`.

## Actions Capability <a href="#ug.netconf_agent.actions_ncs" id="ug.netconf_agent.actions_ncs"></a>

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

### Capability Identifier <a href="#d5e717" id="d5e717"></a>

The action capability is identified by the following capability string:

```
  http://tail-f.com/ns/netconf/actions/1.0
```

## `transactions` Capability <a href="#ug.netconf_agent.transactions" id="ug.netconf_agent.transactions"></a>

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

### Dependencies <a href="#d5e731" id="d5e731"></a>

None.

### Capability Identifier <a href="#d5e734" id="d5e734"></a>

The `transactions` capability is identified by the following capability string:

```
  http://tail-f.com/ns/netconf/transactions/1.0
```

### New Operation: `<start-transaction>` <a href="#d5e739" id="d5e739"></a>

#### **Description**

Starts a transaction towards a configuration datastore. There can be a single ongoing transaction per session at any time.

When a transaction has been started, the client can send any NETCONF operation, but any `<edit-config>` or `<copy-config>` operation sent from the client must specify the same `<target>` as the `<start-transaction>`, and any `<get-config>` must specify the same \<source> as `<start-transaction>`.

If the server receives an `<edit-config>` or `<copy-config>` with another `<target>`, or a `<get-config>` with another `<source>`, an error must be returned with an `<error-tag>` set to `invalid-value`.

The modifications sent in the `<edit-config>` operations are not immediately applied to the configuration datastore. Instead, they are kept in the transaction state of the server. The transaction state is only applied when a `<commit-transaction>` is received.

The client sends a `<prepare-transaction>` when all modifications have been sent.

#### **Parameters**

* `target:`\
  Name of the configuration datastore towards which the transaction is started.
* `with-inactive:`\
  If this parameter is given, the transaction will handle the `inactive` and `active` attributes. If given, it must also be given in the `<edit-config>` and `<get-config>` invocations in the transaction.

#### **Positive Response**

If the device can satisfy the request, an `<rpc-reply>` is sent that contains an `<ok>` element.

#### **Negative Response**

An `<rpc-error>` element is included in the `<rpc-reply>` if the request cannot be completed for any reason.

If there is an ongoing transaction for this session already, an error must be returned with `<error-app-tag>` set to `bad-state`.

#### **Example**

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

### New Operation: `<prepare-transaction>` <a href="#d5e772" id="d5e772"></a>

#### **Description**

Prepares the transaction state for commit. The server may reject the prepare request for any reason, for example, due to lack of resources or if the combined changes would result in an invalid configuration datastore.

After a successful `<prepare-transaction>`, the next transaction-related RPC operation must be `<commit-transaction>` or `<abort-transaction>`. Note that an `<edit-config>` cannot be sent before the transaction is either committed or aborted.

Care must be taken by the server to make sure that if `<prepare-transaction>` succeeds then the `<commit-transaction>` should not fail, since this might result in an inconsistent distributed state. Thus, `<prepare-transaction>` should allocate any resources needed to make sure the `<commit-transaction>` will succeed.

#### **Parameters**

None.

#### **Positive Response**

If the device was able to satisfy the request, an `<rpc-reply>` is sent that contains an `<ok>` element.

#### **Negative Response**

An `<rpc-error>` element is included in the `<rpc-reply>` if the request cannot be completed for any reason.

If there is no ongoing transaction in this session, or if the ongoing transaction already has been prepared, an error must be returned with `<error-app-tag>` set to `bad-state`.

#### **Example**

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

### New Operation: `<commit-transaction>` <a href="#d5e793" id="d5e793"></a>

#### **Description**

Applies the changes made in the transaction to the configuration datastore. The transaction is closed after a `<commit-transaction>`.

#### **Parameters**

None.

#### **Positive Response**

If the device was able to satisfy the request, an `<rpc-reply>` is sent that contains an `<ok>` element.

#### **Negative Response**

An `<rpc-error>` element is included in the `<rpc-reply>` if the request cannot be completed for any reason.

If there is no ongoing transaction in this session, or if the ongoing transaction already has not been prepared, an error must be returned with `<error-app-tag>` set to `bad-state`.

#### **Example**

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

### New Operation: `<abort-transaction>` <a href="#d5e812" id="d5e812"></a>

#### **Description**

Aborts the ongoing transaction, and all pending changes are discarded. `<abort-transaction>` can be given at any time during an ongoing transaction.

#### **Parameters**

None.

#### **Positive Response**

If the device was able to satisfy the request, an `<rpc-reply>` is sent that contains an `<ok>` element.

#### **Negative Response**

An `<rpc-error>` element is included in the `<rpc-reply>` if the request cannot be completed for any reason.

If there is no ongoing transaction in this session, an error must be returned with `<error-app-tag>` set to `bad-state`.

#### **Example**

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

### Modifications to Existing Operations <a href="#d5e831" id="d5e831"></a>

The `<edit-config>` operation is modified so that if it is received during an ongoing transaction, the modifications are not immediately applied to the configuration target. Instead, they are kept in the transaction state of the server. The transaction state is only applied when a `<commit-transaction>` is received.

Note that it doesn't matter if the `<test-option>` is 'set' or 'test-then-set' in the `<edit-config>`, since nothing is actually set when the `<edit-config>` is received.

## Inactive Capability <a href="#ug.netconf_agent.inactive" id="ug.netconf_agent.inactive"></a>

This capability is used by the NETCONF server to indicate that it supports marking nodes as being inactive. A node that is marked as inactive exists in the data store but is not used by the server. Any node can be marked as inactive.

To not confuse clients who do not understand this attribute, the client has to instruct the server to display and handle the inactive nodes. An inactive node is marked with an `inactive` XML attribute, and to make it active, the `active` XML attribute is used.

This capability is formally defined in the YANG module `tailf-netconf-inactive`.

### Dependencies <a href="#d5e842" id="d5e842"></a>

None.

### Capability Identifier <a href="#d5e845" id="d5e845"></a>

The inactive capability is identified by the following capability string:

```
  http://tail-f.com/ns/netconf/inactive/1.0
```

### New Operations <a href="#d5e850" id="d5e850"></a>

None.

### Modifications to Existing Operations <a href="#d5e853" id="d5e853"></a>

A new parameter, `<with-inactive>`, is added to the `<get>`, `<get-config>`, `<edit-config>`, `<copy-config>`, and `<start-transaction>` operations.

The `<with-inactive>` element is defined in the http://tail-f.com/ns/netconf/inactive/1.0 namespace, and takes no value.

If this parameter is present in `<get>`, `<get-config>`, or `<copy-config>`, the NETCONF server will mark inactive nodes with the `inactive` attribute.

If this parameter is present in `<edit-config>` or `<copy-config>`, the NETCONF server will treat inactive nodes as existing so that an attempt to create a node that is inactive will fail, and an attempt to delete a node that is inactive will succeed. Further, the NETCONF server accepts the `inactive` and `active` attributes in the data hierarchy, to make nodes inactive or active, respectively.

If the parameter is present in `<start-transaction>`, it must also be present in any `<edit-config>`, `<copy-config>`, `<get>`, or `<get-config>` operations within the transaction. If it is not present in `<start-transaction>`, it must not be present in any `<edit-config>` operation within the transaction.

The `inactive` and `active` attributes are defined in the http://tail-f.com/ns/netconf/inactive/1.0 namespace. The `inactive` attribute's value is the string `inactive`, and the `active` attribute's value is the string `active`.

#### **Example**

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

## Rollback ID Capability <a href="#ug.netconf_agent.with-rollback-id" id="ug.netconf_agent.with-rollback-id"></a>

This module extends existing operations with a with-rollback-id parameter which will, when set, extend the result with information about the rollback that was generated for the operation if any.

The rollback ID returned is the ID from within the rollback file which is stable with regards to new rollbacks being created.

### Dependencies <a href="#d5e882" id="d5e882"></a>

None.

### Capability Identifier <a href="#d5e885" id="d5e885"></a>

The transactions capability is identified by the following capability string:

```
  http://tail-f.com/ns/netconf/with-rollback-id
```

### Modifications to Existing Operations <a href="#d5e890" id="d5e890"></a>

This module adds a parameter `with-rollback-id` to the following RPCs:

```
  o  edit-config
  o  copy-config
  o  commit
  o  commit-transaction
```

If `with-rollback-id` is given, rollbacks are enabled, and the operation results in a rollback file being created the response will contain a rollback reference.

## NETCONF Extensions in NSO <a href="#d5e896" id="d5e896"></a>

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
  Read about error recovery in [Commit Queue](../../../operation-and-usage/operations/nso-device-manager.md#user\_guide.devicemanager.commit-queue) for a more detailed explanation.
* `trace-id`\
  Use the provided trace ID as part of the log messages emitted while processing. If no trace ID is given, NSO will generate and assign a trace ID to the processing.

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

## The Query API <a href="#d5e1063" id="d5e1063"></a>

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

## Meta-data in Attributes <a href="#ug.netconf_agent.attributes" id="ug.netconf_agent.attributes"></a>

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

## Namespace for Additional Error Information <a href="#d5e1189" id="d5e1189"></a>

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
