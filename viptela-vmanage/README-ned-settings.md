# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/viptela-vmanage/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/viptela-vmanage/
  device
    /ncs:/device/devices/device:<name>/ned-settings/viptela-vmanage/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings viptela-vmanage

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings viptela-vmanage
  2. connection
  3. logger
  4. developer
  5. licensing
  ```


# 1. ned-settings viptela-vmanage
---------------------------------

  vManage NED configuration.


    - viptela-vmanage check-status-timeout <seconds> (default 90)

      The timeout in seconds used when checking status for a success after successfully starting a
      task.


# 2. ned-settings viptela-vmanage connection
--------------------------------------------

  Per device connection configuration.


    - connection ssl accept-any <true|false> (default false)

      Accept any SSL certificate presented by the device.
      Warning! This enables Man in the Middle attacks and
      should only be used for testing and troubleshooting.


    - connection ssl certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like
      "----- BEGIN CERTIFICATE -----".

      Default uses the default trusted certificates installed in
      Java JVM.

      An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


    - connection api-base-url <string> (default /dataservice)

      API base URL for device REST API.


    - connection api-key <string>

      API authentication key if needed.


    - connection auth-token api-auth-token <string>

      API authentication token if needed.


    - connection template-threads-count <uint32> (default 8)

      Number of threads/connections used to fetch CLI/master/feature templates.


    - connection proxy-settings enabled <true|false> (default false)


    - connection proxy-settings remote-address <string>

      Proxy server address.


    - connection proxy-settings remote-port <uint32> (default 8080)

      Proxy server port.


    - connection proxy-settings remote-protocol <enum> (default http)

      Proxy server protocol.

      http   - http.

      https  - https.

      socks  - socks.


# 3. ned-settings viptela-vmanage logger
----------------------------------------

  Java logging settings.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 4. ned-settings viptela-vmanage developer
-------------------------------------------

  Contains settings used by the NED developers.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


# 5. ned-settings viptela-vmanage licensing
-------------------------------------------

  DNA Licensing configuration settings.


    - licensing enabled <true|false> (default false)

      Enable synchronization of DNA Licensing content.


    - licensing authentication username <string>


    - licensing authentication password <string>


    - licensing configuration mode <union> (default online)


    - licensing configuration licenseType <union> (default mixed)


    - licensing configuration multipleEntitlement <true|false> (default true)


    - licensing configuration accountName <string>

      Smart account name.


    - licensing configuration virtualAccountName <string>

      Virtual account name.


