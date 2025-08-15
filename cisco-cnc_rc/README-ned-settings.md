# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-cnc_rc/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-cnc_rc/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-cnc_rc/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-cnc_rc

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-cnc_rc
  2. connection
     2.1. authentication
     2.2. ssl
          2.2.1. mtls
  3. live-status
  4. restconf
     4.1. cache
     4.2. config
     4.3. live-status
     4.4. notif
  5. logger
  6. general
     6.1. capabilities
     6.2. config
     6.3. live-status
  ```


# 1. ned-settings cisco-cnc_rc
------------------------------


# 2. ned-settings cisco-cnc_rc connection
-----------------------------------------

  Settings for the RESTCONF connection.


    - connection use-host-name <true|false> (default false)

      Configure the NED whether to use the host name or the ip address to the device when
      connecting. If set to true the host name will be used if possible.


## 2.1. ned-settings cisco-cnc_rc connection authentication
-----------------------------------------------------------

  Authentication related settings.


    - authentication use-token-cache <true|false> (default false)

      When set to true, the NED will cache the negotiated authentication token for later use in any subsequent connections.
      The cache reduces the number of round trips needed when connecting to the target. Applicable token based mechanisms
      like the "bearer-token".
      The feature do require adaptions of the NED to detect when cached token is regarded as expired by the device, I.e the
      NED needs to be instrumented with pattern for typical device replies that indicate "token expired".
      Use with caution when NED is interacting with any other device.


## 2.2. ned-settings cisco-cnc_rc connection ssl
------------------------------------------------

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


### 2.2.1. ned-settings cisco-cnc_rc connection ssl mtls
--------------------------------------------------------

  Settings related to mutual TLS (mTLS) Note, if mTLS is to be used without any further
  authentication mechanism, then ned-settings cisco-cnc_rc connection authentication must be
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


# 3. ned-settings cisco-cnc_rc live-status
------------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


# 4. ned-settings cisco-cnc_rc restconf
---------------------------------------

  Settings related to the RESTCONF API.


    - restconf url-base <auto|string> (default /crosswork/proxy/nso/restconf)

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


    - restconf protocol <enum> (default yang-patch)

      Configure the protocol to be used by the NED when applying config to the device. By default
      the standard RESTCONF protocol is used. For devices supporting the newer YANG-PACH extension
      it is recommended to use "yang-patch" or "auto". The YANG-PATCH extension is superior to
      standard RESTCONF since it does provide full transactionality when applying config to the device.
      The setting "auto" does require that capability-discovery is enabled as well.

      default     - Use standard RESTCONF.

      yang-patch  - Use the YANG-PATCH extension. Only works with devices supporting YANG-PATCH.

      auto        - Enable YANG-PATCH if device advertises support for it. Otherwise use default
                    RESTCONF.


    - restconf model-download accept-header <application/yang+json|string> (default application/yang-data+json)

      Configure accept header to use by the built-in YANG downloader tool when fetching the models
      from the device.


    - restconf profile <enum> (default cnc)

      cnc     - cnc.

      netsim  - netsim.


## 4.1. ned-settings cisco-cnc_rc restconf cache
------------------------------------------------

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


## 4.2. ned-settings cisco-cnc_rc restconf config
-------------------------------------------------

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


    - config append-content-config-query <true|false> (default false)

      Appends the content=config query to the url on all GET calls. This instructs the device to
      filter out operational data from the dumps to be returned. This can have good impact on
      sync-from performance. Required that the content query feature is supported by the device.


## 4.3. ned-settings cisco-cnc_rc restconf live-status
------------------------------------------------------

  NED settings related to RESTCONF operations for operational data.


    - live-status append-content-nonconfig-query <true|false> (default false)

      Appends the content=nonconfig query to the url on all live-status GET calls. This instructs
      the device to filter out config data from the dumps to be returned. Required that the content
      query feature is supported by the device.


## 4.4. ned-settings cisco-cnc_rc restconf notif
------------------------------------------------

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


# 5. ned-settings cisco-cnc_rc logger
-------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 6. ned-settings cisco-cnc_rc general
--------------------------------------

  General NED settings.


    - general outbound transforms trim-defaults <true|false> (default false)

      Trim default values from outbound payload on create operations.


## 6.1. ned-settings cisco-cnc_rc general capabilities
------------------------------------------------------

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


## 6.2. ned-settings cisco-cnc_rc general config
------------------------------------------------

  General settings related to config handling.


    - config trans-id-method <enum> (default config-hash)

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


## 6.3. ned-settings cisco-cnc_rc general live-status
-----------------------------------------------------

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


