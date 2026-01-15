# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/nokia-srlinux_gnmi/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/nokia-srlinux_gnmi/
  device
    /ncs:/device/devices/device:<name>/ned-settings/nokia-srlinux_gnmi/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings nokia-srlinux_gnmi

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings nokia-srlinux_gnmi
  2. live-status
  3. logger
  4. connection
     4.1. keep-alive
     4.2. tls
          4.2.1. mutual-tls
     4.3. ssh
  5. gnmi
     5.1. origin
     5.2. inbound
     5.3. outbound
          5.3.1. confirmed-commit
     5.4. notif
          5.4.1. stream
     5.5. cache
  6. gnoi
  7. general
     7.1. capabilities
          7.1.1. regex-exclude
          7.1.2. regex-include
          7.1.3. inject
     7.2. config
     7.3. live-status
  ```


# 1. ned-settings nokia-srlinux_gnmi
------------------------------------


# 2. ned-settings nokia-srlinux_gnmi live-status
------------------------------------------------

  Settings for live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.


# 3. ned-settings nokia-srlinux_gnmi logger
-------------------------------------------

  Settings for controlling logs output.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 4. ned-settings nokia-srlinux_gnmi connection
-----------------------------------------------

  Settings for the gNMI connection.


    - connection idle-timeout <uint32> (default 30)

      Set the duration without ongoing gNMI RPCs before going to idle mode. Value in minutes.


    - connection connect-retries <uint8> (default 1)

      Set number of connect retries.


## 4.1. ned-settings nokia-srlinux_gnmi connection keep-alive
-------------------------------------------------------------

  Connection keep alive settings.


    - keep-alive enable <true|false> (default false)

      Enable keep alive on the connection. Default false.


    - keep-alive time <uint32> (default 60)

      Sets the time without read activity before sending a keepalive ping. Value in seconds.


    - keep-alive timeout <uint32> (default 20)

      Sets the time waiting for read activity after sending a keepalive ping. Value in seconds.


    - keep-alive without-calls <true|false> (default false)

      Sets whether keepalive will be performed when there are no outstanding RPC on a connection.
      Default false.


## 4.2. ned-settings nokia-srlinux_gnmi connection tls
------------------------------------------------------

  TLS authentication settings.


    - tls enable <true|false> (default false)

      Enable TLS authentication.


    - tls accept-any <true|false> (default false)

      Accept any server or trust manager certificate. Setting this to true is unsafe and shall only
      be used for testing purposes.


    - tls ciphers <union>

      Configure permitted ciphers to use when doing TLS handshake. Leave empty to use system
      default.


    - tls protocols <union>

      Configure permitted protocol versions to use when doing TLS handshake. Leave empty to use
      system default.


    - tls certificate <string>

      SSL/TLS certificate stored in PEM format including banners like
          "----- BEGIN CERTIFICATE -----".

      Default uses the default trusted certificates installed in Java JVM.

      Simple method to get the PEM of a server:
          openssl s_client -connect HOST:PORT


    - tls override-authority <string>

      Specify names to override authority for. Shall only be used for testing.


### 4.2.1. ned-settings nokia-srlinux_gnmi connection tls mutual-tls
--------------------------------------------------------------------

  Settings related to mTLS.


    - mutual-tls client certificate <string>

      SSL/TLS certificate stored in PEM format including banners like
         "----- BEGIN CERTIFICATE -----".


    - mutual-tls client key <string>

      SSL/TLS certificate stored in PEM format including banners like
         "-----BEGIN PRIVATE KEY-----".


    - mutual-tls client key-password <string>

      Configure password for the client key, if encrypted.


## 4.3. ned-settings nokia-srlinux_gnmi connection ssh
------------------------------------------------------

  SCP and SFTP provide alternative methods for downloading YANG files from devices that store these files locally but do not support gNOI file transfer or similar options.
  Please note that the SSH connection used for this transfer is subject to certain limitations. In particular, it does not have access to the key store in NSO.
  As a result, special measures must be taken to ensure that the SSH host key of the device is accepted.

  You can choose one of the following three options:
  1. Ensure the host key is already present in the OpenSSH known_hosts file on the NSO host (by default, `<NSO HOME DIR>/.ssh/known_hosts`).
  This path can also be set using the NED setting `host-key/known-hosts-file`.
  2. Configure the NED setting `host-key/public-key-file` with the device's host key.
  3. Use the NED setting `host-key/accept-any` to completely bypass host key verification.

  Additionally, only public-key and password authentication methods are supported for this connection.


    - ssh remote-port <uint32> (default 22)

      Port used by the SCP/SFTP server on the device.


    - ssh remote-dir <string>

      Specifies the path to the directory on the device where the YANG files are stored. This path
      is used during SCP/SFTP transfers.


      Either of:

        - devices device ned-settings nokia-srlinux_gnmi connection ssh host-key known-hosts-file <string>

          Path to openssh formatted 'known_hosts' file containing valid host keys.

        - devices device ned-settings nokia-srlinux_gnmi connection ssh host-key public-key-file <string>

          Path to openssh formatted public (.pub) host key file.

      OR:

        - devices device ned-settings nokia-srlinux_gnmi connection ssh host-key accept-any <true|false> (default false)

          Accept any host key, i.e. no host key checking is performed.


    - ssh auth-key private-key-file <string>

      Path to openssh formatted private key file for doing public key auth to device.


# 5. ned-settings nokia-srlinux_gnmi gnmi
-----------------------------------------

  Settings for the gNMI operations.


    - gnmi include-use-models-list <true|false> (default false)

      Let the NED include the list of YANG models to use in each gNMI Get/Subscribe message.


    - gnmi path do-full-sync-from-using-root-path <true|false> (default true)

      Set to true if the device supports fetching all config from the root path, i.e '/'. If set to
      false the NED will perform one fetch on each top node below the root.


## 5.1. ned-settings nokia-srlinux_gnmi gnmi path origin
--------------------------------------------------------

  The origin is an optional message field to be used to disambiguate the gNMI path if necessary.
  Some devices require the origin to be set in all gNMI operations. One use case where origin can be
  extra relevant is when dealing with devices that support multiple different YANG model packages.
  For example native and openconfig. In this case the device might require the origin field in each
  gNMI to be set such that it maps to the YANG model package the operation maps to.


      Either of:

        - devices device ned-settings nokia-srlinux_gnmi gnmi path origin map <regex> <origin>

          Configure origin key words to be used for certain YANG models. The key in this list shall
          be a regular expression matching one or many YANG models.

          - regex <string>

            Regular expression matching certain YANG models.

          - origin <string>

            Tag to set in origin field.


## 5.2. ned-settings nokia-srlinux_gnmi gnmi config inbound
-----------------------------------------------------------

  Settings for customising the NED regarding inbound config data.


    - inbound get-type <enum> (default ALL)

      Configure the type flag in the gNMI GET message used when the NED is fetching config from the
      device. By default, the value CONFIG is used. Some gNMI devices do not support this flag. Then
      it is better to use the ALL setting.

      CONFIG  - CONFIG.

      ALL     - ALL.


    - inbound ignore-get-error-codes <string> (default unknown module)

      When doing a get operation the following pattern match error codes returned by the device
      indicating 'no data found' and shall be ignored.


## 5.3. ned-settings nokia-srlinux_gnmi gnmi config outbound
------------------------------------------------------------

  Settings for customising the NED regarding outbound config data.


    - outbound create-method <enum> (default update)

      Configure how the NED shall perform list entry creates on the device.

      update   - Update using merge. A gNMI UPDATE operation is used.

      replace  - Update using replace. A gNMI REPLACE operation is used. Means replacing the whole
                 list. In most cases a bad idea.


    - outbound update-method <enum> (default update)

      Configure how the NED shall perform configuration updates on the device.

      update   - Update using merge. A gNMI UPDATE operation is used.

      replace  - Update using replace. A gNMI REPLACE operation is used.


### 5.3.1. ned-settings nokia-srlinux_gnmi gnmi config outbound confirmed-commit
--------------------------------------------------------------------------------

  Confirmed commit is a new gNMI feature that makes it possible to tell the gNMI server to auto
  rollback the applied configuration after a certain duration. For example if a bad configuration
  was pushed. The feature is very similar to the corresponding in NETCONF (rfc6241).


    - confirmed-commit enable <true|false> (default false)

      Enable confirmed commit. The device must have full support for gNMI version 0.1.0 or newer to
      make this work properly.


    - confirmed-commit timeout <string>

      Specify the rollback timeout in number of seconds and fractions. Shall be specified as a
      string ending with 's' indicating seconds. Example: '3s' means 3 seconds, '3.000001s' means 3
      seconds and one microsecond.


## 5.4. ned-settings nokia-srlinux_gnmi gnmi notif
--------------------------------------------------

  Configure notification streams available on the device.


    - notif encoding <enum> (default JSON)

      The notification payload is delivered to NSO as a string value encoded in JSON or XML.  By
      default JSON encoding is used.

      JSON  - JSON.

      XML   - XML.


### 5.4.1. ned-settings nokia-srlinux_gnmi gnmi notif stream
------------------------------------------------------------

  Manually configure custom streams on the device
  The gNMI protocol allows for subscribing on changes anywhere in the data tree.

    - notif stream <name> <paths> <mode> <interval> <suppress-redundant> <gather-updates> <heartbeat-interval> <allow-aggregation> <updates-only> <description>

      - name <string>

        Name of the stream.

      - paths <string>

        The paths pointing into the data tree that shall be covered by this subscription. The xpath
        syntax shall be used.

      - mode <enum> (default ON_CHANGE)

        Specify type of subscription.

        SAMPLE     - The gNMI server sends notifications at the specified sampling interval.

        ON_CHANGE  - The gNMI server returns notifications only when the value of a subscribed field
                     changes.

      - interval <uint64>

        Sample interval when mode is either SAMPLE or TARGET_DEFINED. Specified in milliseconds.
        Default 0, meaning 10s.

      - suppress-redundant <true|false> (default false)

        Optional setting for sampled subscription. If set to true the device should not generate a
        telemetry update unless the value of the path being reported on has changed since the last
        update was generated.

      - gather-updates <true|false> (default false)

        Optional setting for sampled subscriptions. Some devices do send the samples in a scattered
        way. I.e small chunks from different parts of the data tree are sent separately. This is not
        optimal if the listener expects to receive a full snapshot on the subscribed paths. The NED
        can be configured to gather all chunks into one snapshot before relaying it to NSO. It is
        required that the device supports the correct 'sync_response' signalling that tells the NED
        that all segments have been transmitted.

      - heartbeat-interval <uint32> (default 0)

        Specify a heartbeat interval in milliseconds. For ON_CHANGE this means a full telemetry
        update will be re-sent once per heartbeat interval regardless of whether the value has
        changed or not. For SAMPLE in combination with suppress-redundant the server generate one
        full telemetry update per heartbeat interval even if data has not changed. Default 0,
        meaning disabled.

      - allow-aggregation <true|false> (default false)

        Tell server to allow schema elements that are marked as eligible for aggregation to be
        combined into single telemetry messages.

      - updates-only <true|false> (default false)

        Tell server that only updates to current state should be sent to the NED. If set, the
        initial state is not sent to the client but rather only the sync message followed by any
        subsequent updates to the current state.

      - description <string>

        Description of this stream.


## 5.5. ned-settings nokia-srlinux_gnmi gnmi cache
--------------------------------------------------

  The NED is able to cache certain data that is typically probed for when a new connection is setup.
  Caching has good impact on performance, since it reduces the number of necessary round trips to
  the device on subsequent connections.


    - cache capability <true|false> (default false)

      Configure the NED to cache the list of capabilities supported by the device.


# 6. ned-settings nokia-srlinux_gnmi gnoi
-----------------------------------------

  Settings related to gNOI operations.


    - gnoi file yang-model-download enable <true|false> (default true)

      Enable gNOI YANG model download.


    - gnoi file yang-model-download source <string> (default /opt/srlinux/models)

      Source path to be used when downloading YANG models from the device.


# 7. ned-settings nokia-srlinux_gnmi general
--------------------------------------------

  General NED settings.


## 7.1. ned-settings nokia-srlinux_gnmi general capabilities
------------------------------------------------------------

  Settings related to device capabilities.


    - capabilities strict-model-revision-check <true|false> (default true)

      Configure the NED to do a strict revision check of the models published if possible. With this
      setting enabled the exact revision needs to match the corresponding model built into the NED.
      Otherwise support for it will be dropped by NSO. I.e not possible to read or write config
      using that model.


### 7.1.1. ned-settings nokia-srlinux_gnmi general capabilities regex-exclude
-----------------------------------------------------------------------------

  Configure a pattern for matching models to exclude from the capabilities list advertised by the
  device. To be used to limit the scope of models registered into NSO by the NED.

    - capabilities regex-exclude <pattern>

      - pattern <string>


### 7.1.2. ned-settings nokia-srlinux_gnmi general capabilities regex-include
-----------------------------------------------------------------------------

  Configure a pattern for matching models to include from the capabilities list advertised by the
  device. To be used to limit the scope of models registered into NSO by the NED.

    - capabilities regex-include <pattern>

      - pattern <string>


### 7.1.3. ned-settings nokia-srlinux_gnmi general capabilities inject
----------------------------------------------------------------------

  Configure additional names of models to include in the capabilities list. If a device is not able
  to advertise any capability list, the names of the models to be used must be manually added to
  this inject list.

    - capabilities inject <capa>

      - capa <string>


## 7.2. ned-settings nokia-srlinux_gnmi general config
------------------------------------------------------

  General settings related to config handling.


    - config trans-id-method <enum> (default custom)

      Configure how the NED shall calculate the transaction id. Typically used after each commit and
      for check-sync operations.

      config-hash  - Calculate transaction id by doing a md5 sum on the config dumps received from
                     the device.

      custom       - Calculate transaction id by fetching the latest commit id from the device.

      disabled     - Disable the calculation of transaction id completely.


    - config filter-unmodeled <true|false> (default false)

      Filter all nodes that are not represented in the YANG schema from the JSON payload received
      from the device, before passing it to NSO. This can be useful if config applied to the device
      is not displayed properly in NSO. Some versions of NSO have problems reading JSON payloads
      containing unmodelled data.


    - config filter-invalid-list-entries <true|false> (default false)

      Filter all config data list entry nodes containing incomplete key sets. A list entry that does
      not contain complete key sets will make NSO bail out the read operation completely. This
      setting will prevent such issues.


    - config inbound-transforms <enum>

      Configure the following built-in transforms to be applied on the inbound payload before it is
      passed to NSO.

      sort-keys             - sort-keys.

      trim-namespace        - trim-namespace.

      restore-namespace     - restore-namespace.

      restore-identityrefs  - restore-identityrefs.


    - config partial-sync-from do-full-sync-from-on-error <true|false> (default true)

      The main reason is that the partial show feature is used internally by NSO during abort.
      I.e when a commit has failed and NSO tries to calculate a reverse diff for restoring the device
      to its original state. In this case it is better to let the NED revert to a full sync-from instead of
      bailing out. The latter would result in a device in unknown state. Set this setting to false to instead
      let the NED bail out on error.


## 7.3. ned-settings nokia-srlinux_gnmi general live-status
-----------------------------------------------------------

  General settings related to live-status handling.


    - live-status show-stats-filter <true|false> (default false)

      Use the filter API from NSO to do live-status requests (available in NSO 6.1.4 and later).
      This API is more flexible and will result in fewer round-trips to the device and possibly less
      data transferred from the device. The live-status time-to-live settings are not applicable
      when using this API.


    - live-status filter-unmodeled <true|false> (default false)

      Filter all nodes that are not represented in the YANG schema from the JSON payload received
      from the device, before passing it to NSO. This can be useful if operational data is not
      displayed properly in NSO. Some versions of NSO have problems reading JSON payloads containing
      unmodelled data.


    - live-status filter-invalid-list-entries <true|false> (default false)

      Filter all config data list entry nodes containing incomplete key sets. A list entry that does
      not contain complete key sets will make NSO bail out the read operation completely. This
      setting will prevent such issues.


    - live-status inbound-transforms <enum> (default sort-keys)

      Configure the following built-in transforms to be applied on the inbound payload before it is
      passed to NSO.

      sort-keys             - sort-keys.

      trim-namespace        - trim-namespace.

      restore-namespace     - restore-namespace.

      restore-identityrefs  - restore-identityrefs.


# 8. Using the NED to receive gNMI telemetry updates

The gNMI protocol has an advanced built-in method for subscribing on telemetry updates from a device.
This feature is fully supported by Nokia SRLinux gNMI devices.

It is a very flexible feature regarding what kind of events to subscribe on. The gNMI specification allows for subscriptions on events anywhere in the data tree of a device. You can subscribe on config changes and/or operational data.

The nodes to subscribe on are specified using a list of xpaths that points to the nodes. A xpath can point to a single leaf, a subtree or a full tree.

This NED has full support for receiving telemetry subscriptions. Each received event is relayed into the standard NSO API for notifications as usual.

There are however limitations regarding how NSO currently can handle this kind of events.

The NSO API for notifications is designed to be compliant with NETCONF notifications (RFC5277) which makes it partly incompatible with gNMI events.

Hence a few additional steps are required to make this work with NSO:

1. The NSO API does require streams to subscribe on. These streams are expected to be advertised by
   the device which is not possible with gNMI. Instead the NED provides a simple method to configure
   virtual streams that NSO can subscribe on. These streams will be advertised by the NED instead.

2. The NSO API expects each received notification to be of a well defined structure as declared in
   a 'notification' YANG construct. This is not compliant with gNMI where a telemety update can contain
   data of any structure. The data is simply a JSON/XML dump representing the nodes that are being
   subscribed on.

The NED bridges these incompatible concepts by using an *internal* notification YANG construct, shown
below. It has the same structure as used by the YANG-PUSH standard (RFC8641) but a bit simplified and with a special NED internal namespace

```
  notification push-update {
    description
      "This notification contains a push update that in turn contains
       data subscribed to via a subscription.  In the case of a
       periodic subscription, this notification is sent for periodic
       updates.  It can also be used for synchronization updates of
       an on-change subscription.  This notification shall only be
       sent to receivers of a subscription.  It does not constitute
       a general-purpose notification that would be subscribable as
       part of the NETCONF event stream by any receiver.";
    anydata datastore-contents {
      description
        "This contains the updated data.  It constitutes a snapshot
         at the time of update of the set of data that has been
         subscribed to.  The snapshot corresponds to the same
         snapshot that would be returned in a corresponding 'get'
         operation with the same selection filter parameters
         applied.";
    }
    leaf incomplete-update {
      type empty;
      description
        "This is a flag that indicates that not all datastore
         nodes subscribed to are included with this update.  In
         other words, the publisher has failed to fulfill its full
         subscription obligations and, despite its best efforts, is
         providing an incomplete set of objects.";
    }
  }

  notification push-change-update {
    description
      "This notification contains an on-change push update.  This
       notification shall only be sent to the receivers of a
       subscription.  It does not constitute a general-purpose
       notification that would be subscribable as part of the
       NETCONF event stream by any receiver.";
    container datastore-changes {
      description
        "This contains the set of datastore changes of the target
         datastore, starting at the time of the previous update, per
         the terms of the subscription.";
      uses ypatch:yang-patch;
    }
    leaf incomplete-update {
      type empty;
      description
        "The presence of this object indicates that not all changes
         that have occurred since the last update are included with
         this update.  In other words, the publisher has failed to
         fulfill its full subscription obligations -- for example,
         in cases where it was not able to keep up with a burst of
         changes.";
    }
  }
```

Which notification structure to be used depends on how the telemetry subscription is configured.

#### Periodic subscriptions

For periodic subscriptions the *push-update* notification is used. A snapshot of the whole contents on the subscribed paths is delivered inside the datastore-contents as a raw JSON or XML snippet.

Example with JSON formatted snippet:

```
<?xml version="1.0" encoding="UTF-8"?><notification xmlns="urn:ietf:params:xml:ns:netconf:notification:1.0">
    <eventTime>2023-06-16T06:16:18.023000+00:00</eventTime>
    <push-update xmlns="urn:tail-f.com:internal-yang-push">
        <datastore-contents>{"srl_nokia-interfaces:interface":[{"name":"ethernet-1/1","srl_nokia-qos:qos":{"output":{"multicast-queue":[{"queue-id":"1","template":"default","forwarding-class":["fc1"],"queue-depth":{"maximum-burst-size":0},"scheduling":{"peak-rate-percent":100,"peak-rate-bps":"0","scheduler-node":0}},{"queue-id":"2","template":"default","forwarding-class":["fc2"],"queue-depth":{"maximum-burst-size":0},"scheduling":{"peak-rate-percent":100,"peak-rate-bps":"0","scheduler-node":0}},{"queue-id":"3","template":"default","forwarding-class":["fc3"],"queue-depth":{"maximum-burst-size":0},"scheduling":{"peak-rate-percent":100,"peak-rate-bps":"0","scheduler-node":0}},{"queue-id":"4","template":"default","forwarding-class":["fc4"],"queue-depth":{"maximum-burst-size":0},"scheduling":{"peak-rate-percent":100,"peak-rate-bps":"0","scheduler-node":0}},{"queue-id":"5","template":"default","forwarding-class":["fc5"],"queue-depth":{"maximum-burst-size":0},"scheduling":{"peak-rate-percent":100,"peak-rate-bps":"0","scheduler-node":0}},{"queue-id":"6","template":"default","forwarding-class":["fc6"],"queue-depth":{"maximum-burst-size":0},"scheduling":{"peak-rate-percent":100,"peak-rate-bps":"0","scheduler-node":0}},{"queue-id":"7","template":"default","forwarding-class":["fc7"],"queue-depth":{"maximum-burst-size":0},"scheduling":{"peak-rate-percent":100,"peak-rate-bps":"0","scheduler-node":0}}]}}}]}</datastore-contents>
    </push-update>
</notification>
```

Example with XML formatted snippet:

```
<?xml version="1.0" encoding="UTF-8"?><notification xmlns="urn:ietf:params:xml:ns:netconf:notification:1.0">
    <eventTime>2023-06-16T06:18:02.609000+00:00</eventTime>
    <push-update xmlns="urn:tail-f.com:internal-yang-push">
        <datastore-contents>
    &lt;interface xmlns="urn:srl_nokia/interfaces"&gt;
        &lt;name&gt;ethernet-1/1&lt;/name&gt;
        &lt;qos xmlns="urn:srl_nokia/qos"&gt;
            &lt;output&gt;
                &lt;multicast-queue&gt;
                    &lt;queue-id&gt;3&lt;/queue-id&gt;
                    &lt;template&gt;default&lt;/template&gt;
                    &lt;forwarding-class&gt;fc3&lt;/forwarding-class&gt;
                    &lt;queue-depth&gt;
                        &lt;maximum-burst-size&gt;0&lt;/maximum-burst-size&gt;
                    &lt;/queue-depth&gt;
                    &lt;scheduling&gt;
                        &lt;peak-rate-percent&gt;100&lt;/peak-rate-percent&gt;
                        &lt;peak-rate-bps&gt;0&lt;/peak-rate-bps&gt;
                        &lt;scheduler-node&gt;0&lt;/scheduler-node&gt;
                    &lt;/scheduling&gt;
                &lt;/multicast-queue&gt;
                &lt;multicast-queue&gt;
                    &lt;queue-id&gt;4&lt;/queue-id&gt;
                    &lt;template&gt;default&lt;/template&gt;
                    &lt;forwarding-class&gt;fc4&lt;/forwarding-class&gt;
                    &lt;queue-depth&gt;
                        &lt;maximum-burst-size&gt;0&lt;/maximum-burst-size&gt;
                    &lt;/queue-depth&gt;
                    &lt;scheduling&gt;
                        &lt;peak-rate-percent&gt;100&lt;/peak-rate-percent&gt;
                        &lt;peak-rate-bps&gt;0&lt;/peak-rate-bps&gt;
                        &lt;scheduler-node&gt;0&lt;/scheduler-node&gt;
                    &lt;/scheduling&gt;
                &lt;/multicast-queue&gt;
                &lt;multicast-queue&gt;
                    &lt;queue-id&gt;5&lt;/queue-id&gt;
                    &lt;template&gt;default&lt;/template&gt;
                    &lt;forwarding-class&gt;fc5&lt;/forwarding-class&gt;
                    &lt;queue-depth&gt;
                        &lt;maximum-burst-size&gt;0&lt;/maximum-burst-size&gt;
                    &lt;/queue-depth&gt;
                    &lt;scheduling&gt;
                        &lt;peak-rate-percent&gt;100&lt;/peak-rate-percent&gt;
                        &lt;peak-rate-bps&gt;0&lt;/peak-rate-bps&gt;
                        &lt;scheduler-node&gt;0&lt;/scheduler-node&gt;
                    &lt;/scheduling&gt;
                &lt;/multicast-queue&gt;
                &lt;multicast-queue&gt;
                    &lt;queue-id&gt;6&lt;/queue-id&gt;
                    &lt;template&gt;default&lt;/template&gt;
                    &lt;forwarding-class&gt;fc6&lt;/forwarding-class&gt;
                    &lt;queue-depth&gt;
                        &lt;maximum-burst-size&gt;0&lt;/maximum-burst-size&gt;
                    &lt;/queue-depth&gt;
                    &lt;scheduling&gt;
                        &lt;peak-rate-percent&gt;100&lt;/peak-rate-percent&gt;
                        &lt;peak-rate-bps&gt;0&lt;/peak-rate-bps&gt;
                        &lt;scheduler-node&gt;0&lt;/scheduler-node&gt;
                    &lt;/scheduling&gt;
                &lt;/multicast-queue&gt;
                &lt;multicast-queue&gt;
                    &lt;queue-id&gt;7&lt;/queue-id&gt;
                    &lt;template&gt;default&lt;/template&gt;
                    &lt;forwarding-class&gt;fc7&lt;/forwarding-class&gt;
                    &lt;queue-depth&gt;
                        &lt;maximum-burst-size&gt;0&lt;/maximum-burst-size&gt;
                    &lt;/queue-depth&gt;
                    &lt;scheduling&gt;
                        &lt;peak-rate-percent&gt;100&lt;/peak-rate-percent&gt;
                        &lt;peak-rate-bps&gt;0&lt;/peak-rate-bps&gt;
                        &lt;scheduler-node&gt;0&lt;/scheduler-node&gt;
                    &lt;/scheduling&gt;
                &lt;/multicast-queue&gt;
            &lt;/output&gt;
        &lt;/qos&gt;
    &lt;/interface&gt;

</datastore-contents>
    </push-update>
</notification>

```



#### On-change subscriptions

For on-change subscriptions the *push-change-update* is used instead. This notification contains a edit list with the type of operations that has triggered the event. The structure is the same as used for YANG-PATCH (RFC8072). Each entry in the edit list represents either a *merge*, *a create* or *a delete*. For *merge* operations the changed data is delivered in the *value* field as a JSON or XML formatted snippet.

Example with XML snippet:

```
<?xml version="1.0" encoding="UTF-8"?><notification xmlns="urn:ietf:params:xml:ns:netconf:notification:1.0">
    <eventTime>2023-06-16T06:21:50.946000+00:00</eventTime>
    <push-change-update xmlns="urn:tail-f.com:internal-yang-push">
        <datastore-changes>
            <yang-patch>
                <edit>
                    <edit-id>0</edit-id>
                    <operation>merge</operation>
                    <target>/srl_nokia-if:interface[name=ethernet-1/1]</target>
                    <value>
    &lt;description&gt;TEST&lt;/description&gt;
    &lt;admin-state&gt;enable&lt;/admin-state&gt;

</value>
                </edit>
            </yang-patch>
        </datastore-changes>
    </push-change-update>
</notification>
```

Example with JSON snippet:

```
<?xml version="1.0" encoding="UTF-8"?><notification xmlns="urn:ietf:params:xml:ns:netconf:notification:1.0">
    <eventTime>2023-06-16T06:25:10.780000+00:00</eventTime>
    <push-change-update xmlns="urn:tail-f.com:internal-yang-push">
        <datastore-changes>
            <yang-patch>
                <edit>
                    <edit-id>0</edit-id>
                    <operation>merge</operation>
                    <target>/srl_nokia-if:interface[name=ethernet-1/1]</target>
                    <value>{"admin-state":"disable","oper-down-reason":"port-admin-disabled"}</value>
                </edit>
                <edit>
                    <edit-id>1</edit-id>
                    <operation>delete</operation>
                    <target>/srl_nokia-if:interface[name=ethernet-1/1]/description</target>
                </edit>
            </yang-patch>
        </datastore-changes>
    </push-change-update>
</notification>
```

Regardless of which subscription type is used, the data in the notification is delivered unparsed to any listening service application. It is up to the service application to parse it before acting upon it.

### Example:

The use case is to configure a virtual stream that will subscribe on interface events on the gNMI device.
This example is using the xpaths as defined by the Nokia SRLinux models.

1. Configure the virtual stream using the NED settings in the device instance, like below in a NSO CLI:

   ```
   # configure
   # devices device dev-1
   # ned-settings nokia-srlinux_gnmi gnmi notif stream INTERFACE-EVENTS
   # paths [ /srl_nokia-if:interface[name='ethernet-1/1'], /srl_nokia-if:interface[name='ethernet-1/2'] ]
   # mode ON_CHANGE
   # description "Monitor events on interface ethernet1/1 and ethernet1/2"
   # commit
   ```

2. Try letting NSO display information about available streams

   ```
   # do show devices device dev-1 notifications stream

                                                                                  REPLAY   REPLAY
                                                                                  LOG      LOG
                                                                                  REPLAY   CREATION  AGED
   NAME              DESCRIPTION                                                  SUPPORT  TIME      TIME
   ------------------------------------------------------------------------------------------------------
   INTERFACE-EVENTS  Monitor events on interface ethernet-1/1 and ethernet-1/2
                     paths: [/srl_nokia-if:interface[name='ethernet-1/1'], \
                     /srl_nokia-if:interfaces/interface[name='ethernet-1/2']], \
                     mode: ON_CHANGE                                                false  -         -
   ```

3. Configure a subscription on the stream named INTERFACE-EVENTS

   ```
   # devices device dev-1 notifications subscription SUBSCRIPTION stream INTERFACE-EVENTS local-user admin store-in-cdb true
   # commit
   ```

     Note, the configuration parameter 'store-in-cdb' is set to true in this example just to make sure the
     received telemetry updates can be displayed properly in step #5 and #6 below. This parameter shall
     usually be used with caution, since it can have impact on CDB performance and size.

4. Verify that the subscription is now active in NSO

   ```
   # do show devices device dev-1 notifications subscription SUBSCRIPTION
                            FAILURE  ERROR
     NAME          STATUS   REASON   INFO
     ---------------------------------------
     SUBSCRIPTION  running  -        -
   ```

5. Trigger a telemetry update notification by configuring an interface

   ```
    # devices device dev-1 config interface ethernet-1/1 config description TEST
    # commit
    # do show devices device dev-1 notifications received-notifications | display xml
   ```

    A new entry in the list shall now exist containing a JSON formatted string in the

   ```
   <config xmlns="http://tail-f.com/ns/config/1.0">
     <devices xmlns="http://tail-f.com/ns/ncs">
       <device>
         <name>nokia-srlinux-1</name>
         <notifications>
           <received-notifications>
             <clear-time>2023-06-15T17:59:25.19+00:00</clear-time>
             <notification>
               <event-time>2023-06-16T06:31:23.557+00:00</event-time>
               <sequence-no>0</sequence-no>
               <user>admin</user>
               <subscription>brownfield</subscription>
               <stream>brownfield</stream>
               <received-time>2023-06-16T06:31:23.564942+00:00</received-time>
               <data>
                 <push-change-update xmlns="urn:tail-f.com:internal-yang-push">
                   <datastore-changes>
                     <yang-patch>
                       <edit>
                         <edit-id>0</edit-id>
                         <operation>merge</operation>
                         <target>/srl_nokia-if:interface[name=ethernet-1/1]</target>
                         <value>{"description":"TEST"}</value>
                       </edit>
                     </yang-patch>
                   </datastore-changes>
                 </push-change-update>
               </data>
             </notification>
           </received-notifications>
         </notifications>
       </device>
     </devices>
   </config>
   ```

 6. Trigger a telemetry delete notification by reverting the previous commit

    ```
    # no devices device dev-1 config interface ethernet-1/1 config description
    # commit
    # do show devices device dev-1 notifications received-notifications | display xml
    ```

 7. A new entry in the list shall now exist containing a xpath representing the deleted node:

    ```
    <config xmlns="http://tail-f.com/ns/config/1.0">
      <devices xmlns="http://tail-f.com/ns/ncs">
        <device>
          <name>nokia-srlinux-1</name>
          <notifications>
            <received-notifications>
              <clear-time>2023-06-15T17:59:25.19+00:00</clear-time>
              <notification>
                <event-time>2023-06-16T06:38:12.52+00:00</event-time>
                <sequence-no>0</sequence-no>
                <user>admin</user>
                <subscription>brownfield</subscription>
                <stream>brownfield</stream>
                <received-time>2023-06-16T06:38:12.527544+00:00</received-time>
                <data>
                  <push-change-update xmlns="urn:tail-f.com:internal-yang-push">
                    <datastore-changes>
                      <yang-patch>
                        <edit>
                          <edit-id>0</edit-id>
                          <operation>delete</operation>
                          <target>/srl_nokia-if:interface[name=ethernet-1/1]/description</target>
                        </edit>
                      </yang-patch>
                    </datastore-changes>
                  </push-change-update>
                </data>
              </notification>
            </received-notifications>
          </notifications>
        </device>
      </devices>
    </config>
    ```
