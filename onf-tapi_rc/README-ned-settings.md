# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/onf-tapi_rc/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/onf-tapi_rc/
  device
    /ncs:/device/devices/device:<name>/ned-settings/onf-tapi_rc/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings onf-tapi_rc

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings onf-tapi_rc
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
     4.5. deviations
          4.5.1. automatic-uuid-mapping
  5. logger
  6. general
     6.1. capabilities
     6.2. config
     6.3. live-status
  ```


# 1. ned-settings onf-tapi_rc
-----------------------------


# 2. ned-settings onf-tapi_rc connection
----------------------------------------

  Settings for the RESTCONF connection.


    - connection use-host-name <true|false> (default false)

      Configure the NED whether to use the host name or the ip address to the device when
      connecting. If set to true the host name will be used if possible.


## 2.1. ned-settings onf-tapi_rc connection authentication
----------------------------------------------------------

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


### 2.1.1. ned-settings onf-tapi_rc connection authentication token-request
---------------------------------------------------------------------------

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


### 2.1.2. ned-settings onf-tapi_rc connection authentication token-revoke
--------------------------------------------------------------------------

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


## 2.2. ned-settings onf-tapi_rc connection ssl
-----------------------------------------------

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


### 2.2.1. ned-settings onf-tapi_rc connection ssl mtls
-------------------------------------------------------

  Settings related to mutual TLS (mTLS) Note, if mTLS is to be used without any further
  authentication mechanism, then ned-settings onf-tapi_rc connection authentication must be
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


# 3. ned-settings onf-tapi_rc live-status
-----------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


# 4. ned-settings onf-tapi_rc restconf
--------------------------------------

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


    - restconf profile <enum> (default none)

      The NED supports a set of preconfigured RESTCONF profiles. Each profile has been customised
      for a certain device type. A profile configures RESTCONF settings  like default url-base, model-discovery,
      get-methods for config and live-status. It does also setup
      custom call points for config and live-status when applicable. Furthermore is configures
      the NED to handle any possible RESTCONF deviations known for the configured device.

      none              - No profile selected. This is the default setting.

      netsim            - Use with a netsim (ConfD) target.

      infinera-tnms     - Use with a INFINERA TNMS TR-NBI controller.

      adva-ensemble     - Use with a ADVA Ensemble Controller.

      nokia-nrct        - Use with a NOKIA NRC-T version 22.6 or newer.

      ciena-mcp         - Use with CIENA MCP controller.

      kratos-openspace  - Use with Kratos Openspace controller.


## 4.1. ned-settings onf-tapi_rc restconf cache
-----------------------------------------------

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


## 4.2. ned-settings onf-tapi_rc restconf config
------------------------------------------------

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


### 4.2.1. ned-settings onf-tapi_rc restconf config deviations
--------------------------------------------------------------

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


## 4.3. ned-settings onf-tapi_rc restconf live-status
-----------------------------------------------------

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


## 4.4. ned-settings onf-tapi_rc restconf notif
-----------------------------------------------

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


## 4.5. ned-settings onf-tapi_rc restconf deviations
----------------------------------------------------

  The NED does include a set of workarounds to handle RESTCONF and/or TAPI model deviations that
  have been found on some device models from certain vendors. This setting is used to enable such
  workarounds in the NED. It can only be used when "restconf profile" is set to "none" or
  "netsim".


    - deviations infinera-tnms <true|false> (default false)

      Apply additional transforms needed to read the TAPI config from an Infinera TNMS TR-NBI
      controller.


    - deviations do-restore-end-point-list-keys <true|false> (default false)

      Some devices treat the /context/connectivity-context/connectivity-service/end-point list in a
      non TAPI/YANG compliant way.The key node 'local-id' set by the NSO is ignored. Instead the
      device auto generates a value for 'local-id' when creating a new entry in the list. This
      results in immediate out of sync issues. If the restore-end-point-list-keys is enabled, the
      NED will replace the autogenerated 'local-id' with the value of
      'service-interface-point/service-interface-point-uuid' in the same list entry. So, if the UUID
      of the service-interface-point was used as 'local-id' from the beginning the config will
      remain in sync. The following device types do have this kind of problem: Nokia NRC-T, Ciena
      MCP.


    - deviations do-restore-end-point-list-layer-protocol-constraint-keys <true|false> (default false)

      Some devices treat the list 
      /context/connectivity-context/connectivity-service/end-point/do-restore-end-point-list-layer-protocol-constraint-keys
      in a non TAPI/YANG compliant way.
      The key node 'local-id' set by the NSO is ignored. Instead the device auto generates a value for 'local-id' when
      creating a new entry in the list. This results in immediate out of sync issues. If this NED setting is enabled, the NED
      will replace the autogenerated 'local-id' with the value of 'service-interface-point/service-interface-point-uuid' in the same
      list entry. So, if the UUID of the service-interface-point was used as 'local-id' from the beginning the config will remain in sync.
      Note: this only works if the layer-protocol-constraint list contains exactly one entry!
      The following device types do have this kind of problem: Ciena MCP


    - deviations do-filter-invalid-connectivity-services <true|false> (default false)

      Filter the connectivity service list from invalid entries. When dumping this list, some
      devices do return entries with invalid number of end-points. According to the TAPI
      specification a connectivity service must contain at least 2 end-points, thus NSO will bail
      out if it detects entries with less than 2. This NED filter removes all invalid entries before
      passing the data to NSO. The following device types do have this kind of problem: Ciena MCP.


### 4.5.1. ned-settings onf-tapi_rc restconf deviations automatic-uuid-mapping
------------------------------------------------------------------------------

  Enable the automatic uuid map in the NED. Some devices do create their own uuid:s on objects
  instead of using the ones provisioned through NSO. This will off course immediately cause
  out-of-sync issues. The NED can solve this problem by keeping a uuid translation map and
  automatically convert between the uuids set by NSO and the device. This feature does currently
  work with devices of type Ciena MCP and Kratos OpenSpace.


    - automatic-uuid-mapping do-enable <true|false> (default false)

      Enable the uuid map.


    - automatic-uuid-mapping do-automatic-delete <true|false> (default true)

      Let the NED delete entries from the uuid map when the corresponding entries are deleted from
      CDB. If this option is set to false, the uuid entries will stay in the map until they are
      explicitly deleted using the flush action. This can for instance be done manually from the CLI
      or programatically from a service application. Example for the CLI: devices device dev-1
      live-status flush uuid <uuid>.


# 5. ned-settings onf-tapi_rc logger
------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 6. ned-settings onf-tapi_rc general
-------------------------------------

  General NED settings.


## 6.1. ned-settings onf-tapi_rc general capabilities
-----------------------------------------------------

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


    - capabilities inject-tapi-version <enum>

      Configure the TAPI version used by the device. This setting is intended only for TAPI devices
      that are not able to advertise the YANG models used ny themselves. Note: this setting is
      automatically configured when one of the pre-set RESTCONF profiles is used.

      v2.1.3  - TAPI bundle 2.1.3.

      v2.2.0  - TAPI bundle 2.2.0.

      v2.3    - TAPI bundle 2.3.

      v2.3.1  - TAPI bundle 2.3.1.

      v2.4.0  - TAPI bundle 2.4.0.


## 6.2. ned-settings onf-tapi_rc general config
-----------------------------------------------

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


## 6.3. ned-settings onf-tapi_rc general live-status
----------------------------------------------------

  General settings related to live-status.


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


# 7. Configuring Custom Call Points
-----------------------------------

  Many devices supporting the ONF TAPI models have restrictions regarding which URLs that
  can be used for fetching data from the device. Some points in the data tree can not be
  accessed directly at all. Others can only be accessed if a RESTCONF query has been specified.

  A query is used to instruct the device to limit the scope of the returned data in accordance with
  a provided specification. This can be a 'depth' parameter which will limit the depth of the
  return payload to a certain number of levels. It can also be a 'fields' parameter specifying
  certain nodes in the data tree that shall be returned.

  Another common restriction is that lists in the data tree can not be fetched directly. Such lists
  can only be fetched entry by entry. To achieve this it is necessary to fetch the key elements in the
  list first. Typically done by doing a fetch with a narrowing query done to an URL representing a
  node on a level above the list itself.

  The NED supports configuring custom call points in the data tree for both config and operational data.
  The feature is very flexible and can be used with any type of ONF TAPI device. Configuring custom call
  points can however be a complex task and often error prone.

  It is recommended to use one of the preconfigured restconf profiles in the NED settings if applicable.

  Custom call points are configured via the NED settings. There are separate lists for call points for
  config and for operational data. The lists are located here:

  onf-tapi_rc restconf config custom-get-call-points <string>
  onf-tapi_rc restconf live-status custom-get-call-points <string>

  The structure of both lists is identical. An entry in any of the lists consists of a schema path that
  corresponds to the call point. Optionally a query can be specified to limit to scope of the fetch operation
  on a call point. For list nodes it is possible to configure one query to be used for the list itself and/or
  one for each entry in the list.

  Examples:
  A selection of the ONF TAPI schema will be used throughout the examples below.

   ```
   tapi-common:context
                     |-service-interface-point
                     |-tapi-connectivity:connectivity-context
                                                            |-connection
                                                            |-connectivity-service
                     |-tapi-topology:topology-context
                                                    |-topology
                                                             |-link
                                                             |-node
   ```

  The examples will use call points for operational data. The approach is identical for config data.
  Note that the examples do not map to real relevant use cases.

  Example 1:
  Configure a call point on /tapi-common:context. Limit the scope with a depth=3 query

  ```
  # devices device tapi-1 ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context
  # query depth 3
  # commit
  ```

  Example 2:
  Configure a call point on the /tapi-common:context/service-interface-point list. Query must be
  list-entry specific since the device does only support the list to be fetched entry by entry.
  The keys to the list will automatically be fetched by the NED as a result of the call point configured
  in example 1. The query is set to depth=unbounded, meaning fetch all under this list entry.

  ```
  # devices device tapi-1 ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/service-interface-point
  # list-entry query depth unbounded
  # commit
  ```

  Example 3:
  Configure a call point on the container /tapi-common:context/tapi-connectivity:connectivity-context.
  Limit the scope using a field query to only extract the key elements in the sub lists
  connection and connectivity-service.

  ```
  # devices device tapi-1 ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-connectivity:connectivity-context
  # query fields "connectivity-service(uuid);connection(uuid)"
  # commit
  ```

  Example 4:
  Configure a call point on the container /tapi-common:context/tapi-topology:topology-context with no limitation on
  the scope.

  Alt 1:
  ```
  # devices device tapi-1 ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context
  # commit
  ```

  Alt 2:
  ```
  # devices device tapi-1 ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context
  # query depth unbounded
  # commit
  ```

  Example 5:
  Configure a call point on the /tapi-common:context/tapi-topology:topology-context/topology/node list. Limit the
  scope for the list with a query to just return the keys to the list. Add an additional list entry query to fetch
  all in each entry.

  ```
  # devices device tapi-1 ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/topology/node
  # query field "uuid"
  # list-entry query depth unbounded
  ```

  Example 6:
  Configure a call point on the /tapi-common:context/tapi-topology:topology-context/topology/link list.
  Unlimited scope for both list and individual list entries.

  ```
  # devices device tapi-1 ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/topology/link
  # query depth unbounded
  # list-entry query depth unbounded
  ```

  How it works
  ------------
  The NED will automatically try to figure out the correct RESTCONF GET operations to be executed for a certain
  requested path based on the call points configured. If a requestested node does not map to a call point, the
  NED will search upwards in the schema until it finds a call point configured with an appropriate query.

  Using the examples 1 and 2 to illustrate.

  If the requested path is the whole /tapi-common:context/service-interface-point list, the NED will detect that
  it can not be populated directly. There is only a list-entry query on this call point. The NED will then step
  upwards to /tapi-common:context and find a new call point with a matching standard query. First RESTCONF GET
  call will be done on this URL. The NED remembers the list-entry query on the service-interface-point and will
  obey it afterwards. One RESTCONF call for each list entry found in the list will then be executed.

  The NED will only execute these sequential calls if the first call point has a query with a scope limitation.
  In this example /tapi-common:context has its scope limited to depth=3. If the scope instead is unlimited, the
  NED will regard all sub nodes as populated and ignore any call points between the first call point and the
  requested path.

  If the requested path instead is a certain list entry /tapi-common:context/service-interface-point{"foo"} the
  NED will execute the RESTCONF GET call immediately on the corresponding URL.

  Some devices ignore scope limiting querys. In this case the behavior can be similar to as described above.
  If all data was populated in the first call no further calls will be done. This is because NSO considers it
  to have all data in the cache already. See section 8:2 for info on how this can be avoided.


  Definitions & Rules
  -------------------
  A call point with no query configured means "standard query=unbound and no list-entry query"
  A call point with only a list-entry query is regarded as without a standard query
  A call point representing a list with no scope limitations for list nor entry, shall be configured as
  "query depth=unbounded list-entry query=unbounded".

  If you have a call point that is unbound but you still want the NED to execute consecutive RESTCONF GET calls on
  levels below it, then configure it as depth=<some big number>. For example depth=100


# 8. Details about pre-configured runtime profiles
---------------------------------------------------

  This section describes the details for each of the preconfigured RESTCONF profiles

  ciena-mcp
  ---------

   ```
   ned-settings onf-tapi_rc restconf model-discovery disabled
   ned-settings onf-tapi_rc restconf url-base /tapi
   ned-settings onf-tapi_rc restconf live-status get-method use-custom-get-callpoints
   ned-settings onf-tapi_rc restconf config get-method use-custom-get-callpoints
   ned-settings onf-tapi_rc general config filter-unmodeled true
   ned-settings onf-tapi_rc general live-status filter-unmodeled true

   ned-settings onf-tapi_rc restconf config custom-get-call-points /tapi-common:context
    query fields=uuid;name
   !
   ned-settings onf-tapi_rc restconf config custom-get-call-points /tapi-common:context/connectivity-context/connectivity-service
    query depth unbounded
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf config custom-get-call-points /tapi-common:context/connectivity-context/service-interface-point
    query depth unbounded
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points /tapi-common:context
    query fields=uuid;name
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points /tapi-common:context/connectivity-context/connectivity-service
    query depth unbounded
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points /tapi-common:context/connectivity-context/service-interface-point
    query depth unbounded
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points /tapi-common:context/tapi-topology:topology-context/topology
      query "force consecutive gets"
      list-entry query "force consecutive gets"
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points /tapi-common:context/tapi-topology:topology-context/topology/node
      query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points /tapi-common:context/tapi-topology:topology-context/topology/link
      query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points /tapi-common:context/tapi-equipment:physical-context/physical-span
      query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points /tapi-common:context/tapi-equipment:physical-context/device
    query depth unbounded
    list-entry query depth unbounded
   !
   ```

  nokia-nrct
  ----------

  Corresponds to the following NED setting configuration:

   ```
   ned-settings onf-tapi_rc restconf model-discovery disabled
   ned-settings onf-tapi_rc restconf url-base /tapi
   ned-settings onf-tapi_rc restconf config update-method put
   ned-settings onf-tapi_rc restconf live-status get-method use-custom-get-callpoints
   ned-settings onf-tapi_rc restconf config get-method use-custom-get-callpoints

   ned-settings onf-tapi_rc restconf config custom-get-call-points tapi-common:context
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf config custom-get-call-points tapi-common:context/connectivity-context
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf config custom-get-call-points tapi-common:context/connectivity-context/connectivity-service
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf config custom-get-call-points tapi-common:context/service-interface-point
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf config custom-get-call-points tapi-common:context/notification-context
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf config custom-get-call-points tapi-common:context/oam-context
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf config custom-get-call-points tapi-common:context/path-computation-context
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf config custom-get-call-points tapi-common:context/virtual-network-context
    query depth unbounded
   !

   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/connectivity-context
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/connectivity-context/connectivity-service
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/service-interface-point
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/notification-context
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/oam-context
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/path-computation-context
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/virtual-network-context
    query depth unbounded
   !
   ```


  infinera-tnms:
  -------------

  Corresponds to the following NED setting configuration:

   ```
   ned-settings onf-tapi_rc restconf model-discovery disabled
   ned-settings onf-tapi_rc restconf url-base /trnbi/restconf
   ned-settings onf-tapi_rc restconf deviations infinera-tnms true
   ned-settings onf-tapi_rc restconf live-status get-method use-custom-get-callpoints
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context
    query depth 3
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/service-interface-point
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-connectivity:connectivity-context
    query fields "connectivity-service(uuid;end-point(local-id))"
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-connectivity:connectivity-context/connection
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-connectivity:connectivity-context/connectivity-service
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-equipment:physical-context
    query fields "device(uuid;name);physical-span(uuid;name)"
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-equipment:physical-context/device
    list-entry query fields "uuid;name;equipment;access-port(uuid)"
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-equipment:physical-context/device/access-port
   list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-equipment:physical-context/physical-span
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/nw-topology-service
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/topology
    list-entry query depth 3
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/topology/link
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/topology/node
    list-entry query fields "owned-node-edge-point(uuid;name)"
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/topology/node/owned-node-edge-point
    list-entry query depth unbounded
   !
   ```

  adva-ensemble:
  --------------

   ```
   ned-settings onf-tapi_rc restconf model-discovery disabled
   ned-settings onf-tapi_rc restconf url-base /restconf
   ned-settings onf-tapi_rc restconf live-status get-method use-custom-get-callpoints

   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context
    query depth 3
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/service-interface-point
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-connectivity:connectivity-context
    query depth 3
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-connectivity:connectivity-context/connection
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-connectivity:connectivity-context/connectivity-service
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/nw-topology-service
    query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/topology
    list-entry query depth 3
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/topology/link
    list-entry query depth unbounded
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/topology/node
    list-entry query depth 3
   !
   ned-settings onf-tapi_rc restconf live-status custom-get-call-points tapi-common:context/tapi-topology:topology-context/topology/node/owned-node-edge-point
    list-entry query depth unbounded
   !
   ```
