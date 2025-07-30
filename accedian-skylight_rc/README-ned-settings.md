# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/accedian-skylight_rc/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/accedian-skylight_rc/
  device
    /ncs:/device/devices/device:<name>/ned-settings/accedian-skylight_rc/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings accedian-skylight_rc

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings accedian-skylight_rc
  2. connection
     2.1. authentication
          2.1.1. token-request
          2.1.2. token-revoke
     2.2. ssl
          2.2.1. mtls
  3. live-status
  4. restconf
     4.1. cache
     4.2. config
          4.2.1. deviations
     4.3. live-status
     4.4. notif
     4.5. yang-push
  5. logger
  6. general
     6.1. capabilities
     6.2. config
     6.3. live-status
     6.4. notif
  ```


# 1. ned-settings accedian-skylight_rc
--------------------------------------


# 2. ned-settings accedian-skylight_rc connection
-------------------------------------------------

  Settings for the RESTCONF connection.


    - connection use-host-name <true|false> (default false)

      Configure the NED whether to use the host name or the ip address to the device when
      connecting. If set to true the host name will be used if possible.


    - connection custom-hostname <string>

      The hostname of the device. This is used to connect to the device.


## 2.1. ned-settings accedian-skylight_rc connection authentication
-------------------------------------------------------------------

  Authentication related settings.


    - authentication method <enum> (default basic)

      Configure authentication method to use when the NED interacts with the RESTCONF device.

      basic         - Use standard 'Basic' authentication.

      none          - No additional authentication is done. This option shall for instance be used
                      on devices that only rely on authentication via mTLS.

      bearer-token  - Use a 'bearer token' based authentication. This does require additional
                      configurations. Either a static token or address info etc to a token broker.


    - authentication use-token-cache <true|false> (default false)

      When set to true, the NED will cache the negotiated authentication token for later use in any subsequent connections.
      The cache reduces the number of round trips needed when connecting to the target. Applicable token based mechanisms
      like the "bearer-token".
      The feature do require adaptions of the NED to detect when cached token is regarded as expired by the device, I.e the
      NED needs to be instrumented with pattern for typical device replies that indicate "token expired".
      Use with caution when NED is interacting with any other device.


    - authentication mode <enum>

      The bearer-token method has the following additional settings.

      probe         - Do a dynamic probe for the bearer token to be used via a token broker. This
                      does require the additional 'token-request' settings to be configured.

      static-token  - Use a statically configured token configured in the 'token-value' setting.


    - authentication token-value <string>

      Configure a static token value.


### 2.1.1. ned-settings accedian-skylight_rc connection authentication token-request
------------------------------------------------------------------------------------

  Bearer token request settings.


    - token-request url <string> (default /restconf/auth)

      URL path to bearer token broker. This does not use the base-url. Default: /restconf/auth.


    - token-request port <uint32>

      Port used used by bearer token broker. Default: use same as restconf connection.


    - token-request address <string>

      Address used used by bearer token broker. Default: use same as restconf connection.


    - token-request username-parameter <string>

      Username parameter name if different from 'username' in configured auth group.


    - token-request password-parameter <string>

      Password parameter name if different from 'password' in configured auth group.


### 2.1.2. ned-settings accedian-skylight_rc connection authentication token-revoke
-----------------------------------------------------------------------------------

  Bearer token revoke settings. If configured, the used token will be automatically closed when the
  NED is closing.


    - token-revoke url <string>

      URL path to bearer token broker. This does not use the base-url.


    - token-revoke port <uint32>

      Port used used by bearer token broker. Default: use same as for requesting token.


    - token-revoke address <string>

      Address used used by bearer token broker. Default: use same as for requesting token.


    - token-revoke query <string>

      Additional query parameter(s) used when doing the token revokation.


## 2.2. ned-settings accedian-skylight_rc connection ssl
--------------------------------------------------------

  Settings related to SSL/TLS enabled connections.


    - ssl accept-any <true|false>

      Accept any SSL certificate presented by the device.
      Warning! This enables Man in the Middle attacks and should only be used for testing and troubleshooting.


    - ssl hostname <string>

      Device hostname/fqdn. Useful when SSL certificate CN verification fails because NSO uses IP
      address instead of hostname. Note: when accept-any = false and there is no
      connection/ssl/certificate defined, the NED will automatically fetch the server certificate.


    - ssl ciphers <union>

      Configure permitted ciphers to use when doing TLS handshake. Leave empty to use system
      default.


    - ssl protocols <union>

      Configure permitted protocol versions to use when doing TLS handshake. Leave empty to use
      system default.


    - ssl certificate <Base64 binary>

      Configure a certificate to be used for identifying the device to connect to. It can be either
      a host certificate identifying the device or a self signed root certificate that has been used
      for signing the certificate on the device.

      SSL certificate stored in DER format but since it is entered as Base64 it is very similar to PEM but
      without banners like:
      "----- BEGIN CERTIFICATE -----".

      Default uses the default trusted certificates installed in Java JVM.

      An easy way to get the PEM of a server:
        openssl s_client -connect HOST:PORT


### 2.2.1. ned-settings accedian-skylight_rc connection ssl mtls
----------------------------------------------------------------

  Settings related to mutual TLS (mTLS) Note, if mTLS is to be used without any further
  authentication mechanism, then ned-settings accedian-skylight_rc connection authentication must be
  configured to 'none'.


    - mtls client certificate <Base64 binary>

      Configure a certificate to be used by the NED in a mutual TLS (mTLS) setup. This certificate
      will be used for identifying the NED by the device.

      SSL/TLS certificate stored in DER format but since it is entered as Base64 it is very similar to
      PEM but without banners like:
      "----- BEGIN CERTIFICATE -----".


    - mtls client private-key <string>

      Private key stored in DER format but since it is entered as Base64 it is very similar to PEM but
      without banners like:
      "----- BEGIN PRIVATE KEY -----".

      The private key is stored encrypted in NSO.


    - mtls client key-password <string>

      Configure a optional password to the private key from the previous step. The password is
      stored encrypted in NSO.


# 3. ned-settings accedian-skylight_rc live-status
--------------------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


# 4. ned-settings accedian-skylight_rc restconf
-----------------------------------------------

  Settings related to the RESTCONF API.


    - restconf url-base <auto|string> (default auto)

      Device RESTCONF API URL base. Note: this setting is automatically configured when one of the
      pre-set RESTCONF profiles is used.


    - restconf get ignore-http-status-code <[ <http code> <http code>... ]>

      Configure additional HTTP status codes that shall not trigger and error when the
      NED checks the device response upon a RESTCONF GET call. By default the NED will
      not trigger an HTTP status codes 400 (bad request) and 404 (not found) when trying
      to fetch configuration and/or operational data from the device.

      In case a device returns another status code meaning "no data was found", it needs
      to be configured with this setting to make the NED fully operational.


    - restconf model-discovery <enabled|disabled> (default enabled)

      Configure the NED to auto probe for models supported by the device. This API call is part of
      the RESTCONF specification, but is not supported by all devices.  Note: this setting is
      automatically configured when one of the pre-set RESTCONF profiles is used.

      enabled   - Enabled.

      disabled  - Disabled.


    - restconf capability-discovery <enabled|disabled> (default enabled)

      Configure the NED to auto probe for capabilities supported by the device. This API call is
      part of the RESTCONF specification, but is not supported by all devices.  Note: this setting
      is automatically configured when one of the pre-set RESTCONF profiles is used.

      enabled   - Enabled.

      disabled  - Disabled.


    - restconf protocol <enum> (default default)

      Configure the protocol to be used by the NED when applying config to the device. By default
      the standard RESTCONF protocol is used. For devices supporting the newer YANG-PACH extension
      it is recommended to use "yang-patch" or "auto". The YANG-PATCH extension is superior to
      standard RESTCONF since it does provide full transactionality when applying config to the device.
      The setting "auto" does require that capability-discovery is enabled as well.

      default     - Use standard RESTCONF.

      yang-patch  - Use the YANG-PATCH extension. Only works with devices supporting YANG-PATCH.

      auto        - Enable YANG-PATCH if device advertises support for it. Otherwise use default
                    RESTCONF.


    - restconf model-download accept-header <application/yang|string> (default application/yang)

      Configure accept header to use by the built-in YANG downloader tool when fetching the models
      from the device.


## 4.1. ned-settings accedian-skylight_rc restconf cache
--------------------------------------------------------

  The NED is able to cache certain data that is typically probed for when a new connection is setup.
  Caching has good impact on performance, since reduces the number of necessary round trips to the
  device on fro subsequent connections.


    - cache model <enabled|disabled> (default disabled)

      Configure the NED to cache the list of models supported by the device. Using the cache in
      combination with models discovery enabled does save one additional round trip to the device
      upon each connect.

      enabled   - Enabled.

      disabled  - Disabled.


    - cache capability <enabled|disabled> (default disabled)

      Configure the NED to cache the list of capabilities supported by the device. Using the cache
      in combination with capabilities discovery enabled does save one additional round trip to the
      device upon each connect.

      enabled   - Enabled.

      disabled  - Disabled.


    - cache url-base <enabled|disabled> (default disabled)

      Configure the NED to cache the url base used by the device. Using the cache in combination
      with url-base set to 'auto' does save one additional round trip to the device upon each
      connect.

      enabled   - Enabled.

      disabled  - Disabled.


## 4.2. ned-settings accedian-skylight_rc restconf config
---------------------------------------------------------

  Settings related to RESTCONF operations on config.


    - config update-method <patch|put> (default patch)

      Configure NED behaviour when updating config on the device.

      patch  - Update using merge. A RESTCONF PATCH call is used.

      put    - Update using replace. A RESTCONF PUT call is used.


    - config gather-updates-into-single-patch <true|false> (default false)

      When set to true the NED tries to gather updates on leafs with the same parent into one single
      PATCH call. When set to false the NED generates one PATCH for each update. Default: false.


    - config force-top-node-prefix on-create <true|false> (default true)

      On create operations.


    - config force-top-node-prefix on-update <true|false> (default false)

      On update operations (PATCH / PUT).


    - config yang-patch update-method <enum> (default merge)

      Configure NED behaviour when updating config on the device.

      merge    - Update using YANG-PATCH merge.

      replace  - Update using YANG-PATCH replace.


    - config get-method <enum> (default default)

      Configure NED behaviour when fetching config from the device when doing sync-from etc.

      default                    - A full depth RESTCONF GET call is issued on each top node in the
                                   config tree.

      use-custom-get-callpoints  - Configure custom call points in the schema model. These will used
                                   as paths when reading operational data. See chapter 'Configuring
                                   Custom Call Points' for more information.


    - config device-requires-consecutive-gets <true|false> (default true)

      A device with custom call points might require the NED to execute additional consecutive GET
      calls on sub levels to fetch all data. Then configure this setting to true. Note: this setting
       is automatically configured when one of the pre-set RESTCONF profiles is used.


    - config custom-get-call-points <path>

      Specify schema paths to be used as call points when the NED is doing RESTCONF GET calls. See
      chapter 'Configuring Custom Call Points' for more information. Note: this setting is
      automatically configured when one of the pre-set RESTCONF profiles is used.

      - path <string>

      - query depth <uint16|unbounded>

        Used to limit the number of levels of child nodes returned by the server.

      - query fields <string>

        Used to identify data nodes within the target resource to be retrieved (see RFC8040 for
        format details).

      - list-entry query depth <uint16|unbounded>

        Used to limit the number of levels of child nodes returned by the server.

      - list-entry query fields <string>

        Used to identify data nodes within the target resource to be retrieved (see RFC8040 for
        format details).

      - sub-nodes <fields>

        Use this call point to populate one of its sub nodes. When a request for the path that
        corresponds to the sub node, the NED will use this call point instead, together with a query
        composed by the path as a fields query and optionally a depth query configured for this
        entry.

        - fields <string>


    - config append-content-config-query <true|false> (default false)

      Appends the content=config query to the url on all GET calls. This instructs the device to
      filter out operational data from the dumps to be returned. This can have good impact on
      sync-from performance. Required that the content query feature is supported by the device.


### 4.2.1. ned-settings accedian-skylight_rc restconf config deviations
-----------------------------------------------------------------------

  Configure NED adaptions for device deviations.


    - deviations list-entry move method <enum> (default default)

      The RESTCONF protocol does specify special REST operations to use when moving or inserting
      entries in lists that are ordered by user (a certain YANG annotation). Some devices
      can not handle move operations properly. This does apply to older versions of ConfD.
      For such devices the NED can be configured to implement a move by doing a delete on the entry
      followed by a insert on the right position.

      delete-and-insert  - delete-and-insert.

      default            - default.


    - deviations list-entry update wrap-in-list <true|false> (default true)

      When updating configuration inside a list entry, the NED by default wraps the payload in a list.

      Example:
        Updating the leaf X inside the entry with key KEY=100 in the list LIST.
        The HTTP PATCH is used:

        RESTCONF PATCH :: <URL to device>/restconf/data/LIST=100
             {
                  "LIST":[{
                       "KEY":"100",
                       "X":"FOO"
                   }]
             }

        Some devices require the payload to point at the entry itself. Example:

         RESTCONF PATCH :: <URL to device>/restconf/data/LIST=100
            {
                 "LIST":{
                      "KEY":"100",
                      "X":"FOO"
                  }
            }

      This NED setting makes the NED adapt accordingly.


## 4.3. ned-settings accedian-skylight_rc restconf live-status
--------------------------------------------------------------

  NED settings related to RESTCONF operations for operational data.


    - live-status get-method <enum> (default nearest-container)

      Configure NED behaviour when fetching operational data from the device.

      nearest-container          - Execute a RESTCONF GET using a path representing nearest
                                   container / list entry in the requested path.

      top-nodes                  - Execute a RESTCONF GET using a path representing the top node of
                                   the requested path.

      use-custom-get-callpoints  - Configure custom call points in the schema model. These will be
                                   used as paths when reading operational data.


    - live-status append-content-nonconfig-query <true|false> (default false)

      Appends the content=nonconfig query to the url on all live-status GET calls. This instructs
      the device to filter out config data from the dumps to be returned. Required that the content
      query feature is supported by the device.


    - live-status device-requires-consecutive-gets <true|false> (default true)

      A device with custom call points might require the NED to execute additional consecutive GET
      calls on sub levels to fetch all data. Then configure this setting to true. Note: this setting
       is automatically configured when one of the pre-set RESTCONF profiles is used.


    - live-status custom-get-call-points <path>

      Specify schema paths to be used as call points when the NED is doing RESTCONF GET calls. See
      chapter 'Configuring Custom Call Points' for more information. Note: this setting is
      automatically configured when one of the pre-set RESTCONF profiles is used.

      - path <string>

      - query depth <uint16|unbounded>

        Used to limit the number of levels of child nodes returned by the server.

      - query fields <string>

        Used to identify data nodes within the target resource to be retrieved (see RFC8040 for
        format details).

      - list-entry query depth <uint16|unbounded>

        Used to limit the number of levels of child nodes returned by the server.

      - list-entry query fields <string>

        Used to identify data nodes within the target resource to be retrieved (see RFC8040 for
        format details).

      - sub-nodes <fields>

        Use this call point to populate one of its sub nodes. When a request for the path that
        corresponds to the sub node, the NED will use this call point instead, together with a query
        composed by the path as a fields query and optionally a depth query configured for this
        entry.

        - fields <string>


## 4.4. ned-settings accedian-skylight_rc restconf notif
--------------------------------------------------------

  Configure notification streams available on the device.


    - notif inactive-stream-reset timeout <uint32> (default 0)

      Configure the maximum allowed number of seconds of inactivity on a stream. The value 0 means
      indefinite time.


    - notif automatic-stream-discovery <enum> (default enabled)

      Let the NED automatically probe the device for supported streams.

      enabled   - Enabled.

      disabled  - Disabled.


    - notif preferred-encoding <enum> (default xml)

      json  - JSON encoding.

      xml   - XML encoding.


    - notif stream <name> <path> <replay-support> <description>

      Manually configure info about stream on the device. This is useful when interacting with
      devices not capable of advertising the supported streams automatically.

      - name <string>

        Name of the stream.

      - path <string>

        The path to access the stream.

      - replay-support <true|false> (default false)

        Replay support. Set to true if device supports it.

      - description <string>

        Description of this stream.


## 4.5. ned-settings accedian-skylight_rc restconf yang-push
------------------------------------------------------------

  Experimental feature. Configure yang-push enabled streams / datastores available on the device.

    - restconf yang-push <name> <subscription-type> <xpath-filter> <encoding>

      - name <string>

        Name of emulated YANG-PUSH telemetry stream.

      - subscription-type <enum>

        Spceify type of subscription for this emulated stream.

        periodic   - periodic.

        on-change  - on-change.

      - xpath-filter <string>

        Specify the xpath to the location in the device datatree to subscribe events from.

      - encoding <enum> (default xml)

        Specify the encoding type to be used for the telemetry data delivered as a notification to
        NSO.

        json  - json.

        xml   - xml.


        Either of:

          - devices device ned-settings accedian-skylight_rc restconf yang-push device datastore <identityref>

        OR:

          - devices device ned-settings accedian-skylight_rc restconf yang-push device stream <string>

      - on-change-settings dampening-period <uint32> (default 0)

        Specify dampening period a dampening period to be used to specify the interval that has to
        pass before successive update records for the same subscription are generated.

      - on-change-settings sync-on-start <true|false> (default true)

        When set to 'true' (default), in order to facilitate a receiver's synchronization, a full
        update is sent, via a 'push-update' notification, when the subscription starts.

      - on-change-settings excluded-change <enum>

        Used to restrict which changes trigger an update. For example, if a 'replace' operation is
        excluded, only thecreation and deletion of objects are reported.

        create   - A change that refers to the creation of a new
           datastore node.

        delete   - A change that refers to the deletion of a
           datastore node.

        insert   - A change that refers to the insertion of a new
           user-ordered datastore
                   node.

        move     - A change that refers to a reordering of the target
           datastore node.

        replace  - A change that refers to a replacement of the target
           datastore node's
                   value.

      - periodic-settings period <uint32>

        Specify the periodicity of the telemetry updates sent on this subscription.

      - periodic-settings anchor-time <string>

        Designates a timestamp before or after which a series of periodic push updates are
        determined.  The next update will take place at a point in time that is a multiple of a
        period from the 'anchor-time'.


# 5. ned-settings accedian-skylight_rc logger
---------------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 6. ned-settings accedian-skylight_rc general
----------------------------------------------

  General NED settings.


## 6.1. ned-settings accedian-skylight_rc general capabilities
--------------------------------------------------------------

  Settings related to device capabilities.


    - capabilities strict-model-revision-check <true|false> (default true)

      Configure the NED to do a strict revision check of the models published if possible. With this setting
      enabled the exact revision needs to match the corresponding model built into the NED. Otherwise support
      for it will be dropped by NSO. I.e not possible to read or write config using that model.


    - capabilities defaults-mode-override <enum>

      Configure default value mode.

      report-all  - Default mode 'report-all'.

      explicit    - Default mode 'explicit'.

      trim        - Default mode 'trim'.


    - capabilities regex-exclude <pattern>

      Configure a pattern for matching models to exclude from the capabilities list advertised by the device.
      To be used to limit the scope of models registered into NSO by the NED.

      - pattern <string>


    - capabilities regex-include <pattern>

      Configure a pattern for matching models to include from the capabilities list advertised by the device.
      To be used to limit the scope of models registered into NSO by the NED.

      - pattern <string>


    - capabilities inject <capa>

      Configure additional names of models / urn:s to include in the capabilities list. If a device
      is not able to advertise any capability list, the names of the models to be used must be
      manually added to this inject list.

      - capa <string>


## 6.2. ned-settings accedian-skylight_rc general config
--------------------------------------------------------

  General settings related to config handling.


    - config trans-id-method <enum> (default disabled)

      A transaction id is a hash that the NED optionally can calculate upon operations like commit and
      check-sync. This NED does by default have trans-id calculation disabled.
      If the NED is connected to a RESTCONF device that supports the "Last-Modified" time stamp header it can
      use this feature to calculate a transaction id. This is a fast trans-id method.

      If the NED is connected to a RESTCONF device that supports the "Etag" header it can use this feature to
      calculate a transaction id. This is also a fast trans-id method.

      If the NED is connected to a RESTCONF device that supports the "content=config" query, the config-hash
      method can be used instead. This method does however require a full fetch of config. I.e it is much
      slower than the time stamp and etag methods.

      last-modified-timestamp  - Use the 'Last-Modified' http header in the response from a RESTCONF
                                 GET call. Use this setting only with devices that supports it.

      etag                     - Use the 'Etag' http header in the response from a RESTCONF GET
                                 call. Use this setting only with devices that supports it.

      config-hash              - Calculate a transaction id based on the config dumps received from
                                 the device.

      disabled                 - Disable the calculation of transaction id completely.


    - config inbound-transforms <enum>

      Configure the following built-in transforms to be applied on the inbound payload before it is
      passed to NSO.

      sort-keys             - sort-keys.

      trim-namespace        - trim-namespace.

      restore-namespace     - restore-namespace.

      restore-identityrefs  - restore-identityrefs.


    - config filter-unmodeled <true|false> (default false)

      Filter all nodes that are not represented in the YANG schema from the JSON payload received
      from the device, before passing it to NSO. This can be useful if config applied to the device
      is not displayed properly in NSO. Some versions of NSO have problems reading JSON payloads
      containing unmodelled data.


    - config filter-invalid-list-entries <true|false> (default false)

      Filter all config data list entry nodes containing incomplete key sets. A list entry that does
      not contain complete key sets will make NSO bail out the read operation completely. This
      setting will prevent such issues.


    - config partial-sync-from do-full-sync-from-on-error <true|false> (default true)

      If a partial-sync-from operation fails, the NED can automatically try a full sync-from instead. This is
      the default behaviour. The main reason is that the partial show feature is used internally by NSO during
      abort. I.e when a commit has failed and NSO tries to calculate a reverse diff for restoring the device
      to its original state. In this case it is better to let the NED revert to a full sync-from instead of
      bailing out. The latter would result in a device in unknown state. Set this setting to false to instead
      let the NED bail out on error.


## 6.3. ned-settings accedian-skylight_rc general live-status
-------------------------------------------------------------

  General settings related to live-status.


    - live-status show-stats-filter <true|false> (default false)

      Use the filter API from NSO to do live-status requests. This API is more flexible and will
      result in fewer round-trips to the device and possibly less data transferred from the device.
      The live-status time-to-live settings are not applicable when using this API.


    - live-status filter-unmodeled <true|false> (default false)

      Filter all nodes that are not represented in the YANG schema from the JSON payload received
      from the device, before passing it to NSO. This can be useful if config applied to the device
      is not displayed properly in NSO. Some versions of NSO have problems reading JSON payloads
      containing unmodelled data.


    - live-status inbound-transforms <enum> (default sort-keys)

      Configure the following built-in transforms to be applied on the inbound payload before it is
      passed to NSO.

      sort-keys             - sort-keys.

      trim-namespace        - trim-namespace.

      restore-namespace     - restore-namespace.

      restore-identityrefs  - restore-identityrefs.


    - live-status filter-invalid-list-entries <true|false> (default false)

      Filter all config data list entry nodes containing incomplete key sets. A list entry that does
      not contain complete key sets will make NSO bail out the read operation completely. This
      setting will prevent such issues.


## 6.4. ned-settings accedian-skylight_rc general notif
-------------------------------------------------------

  General settings related to notifications.


    - notif filter-unmodeled <true|false> (default false)

      Filter all nodes that are not represented in the YANG schema from the JSON payload received
      from the device, before passing it to NSO. This can be useful if config applied to the device
      is not displayed properly in NSO. Some versions of NSO have problems reading JSON payloads
      containing unmodelled data.


    - notif inbound-transforms <enum> (default sort-keys)

      Configure the following built-in transforms to be applied on the inbound payload before it is
      passed to NSO.

      sort-keys             - sort-keys.

      trim-namespace        - trim-namespace.

      restore-namespace     - restore-namespace.

      restore-identityrefs  - restore-identityrefs.


    - notif filter-invalid-list-entries <true|false> (default false)

      Filter all config data list entry nodes containing incomplete key sets. A list entry that does
      not contain complete key sets will make NSO bail out the read operation completely. This
      setting will prevent such issues.


    - notif restore-namespaces-and-identityrefs <true|false> (default true)

      Make the NED go through the operational data dump and fix/restore the namespace information
      and prefixes on identityref values etc. This is a common problem on many Skylight devices. NSO
      is very strict about namespaces and will typically bail out the operation completely if it
      finds a namespace issue. This setting will prevent such issues. Enabled by default.


