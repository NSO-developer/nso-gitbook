# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/eci-muse/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/eci-muse/
  device
    /ncs:/device/devices/device:<name>/ned-settings/eci-muse/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings eci-muse

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings eci-muse
  2. connection
     2.1. for-version
     2.2. for-version
  3. logger
  4. developer
  ```


# 1. ned-settings eci-muse
--------------------------


# 2. ned-settings eci-muse connection
-------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection ssl accept-any <true|false> (default false)

      Accept any SSL certificate presented by the device. Warning!
      This enables Man in the Middle attacks and should only be used
      for testing and troubleshooting.


    - connection ssl certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like "-----
      BEGIN CERTIFICATE -----". Default uses the default trusted certificates
      installed in Java JVM. An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


    - connection ssl private-key key <binary>

      Private Key (just the key, without any additional data).


    - connection ssl private-key standard <enum> (default PKCS1)

      Private Key Standard.

      PKCS1  - PKCS1.


    - connection ssl private-key enc algo <enum> (default DES-EDE3-CBC)

      Private Key Encryption Algorithm: enc-algo (DEK-Info: enc-algo,enc-algo-params).

      DES-CBC       - DES-CBC.

      DES-EDE3-CBC  - DES-EDE3-CBC.

      AES-128-CBC   - AES-128-CBC.

      AES-192-CBC   - AES-192-CBC.

      AES-256-CBC   - AES-256-CBC.


    - connection ssl private-key enc params <string>

      Private Key Encryption Algorithm Params: enc-algo-params (DEK-Info:
      enc-algo,enc-algo-params)


    - connection ssl private-key passphrase <string>

      Passphrase for Private Key.


    - connection ssl tls version <enum> (default TLSv1.3)

      Use specific TLS version.

      TLSv1    - TLSv1.

      TLSv1.1  - TLSv1.1.

      TLSv1.2  - TLSv1.2.

      TLSv1.3  - TLSv1.3.


    - connection api-base-url <string>

      API base URL for device REST API.


    - connection api-key <string>

      API authentication key if needed.


    - connection api version <enum> (default 1)

      1  - 1.

      2  - 2.


    - connection api vpn-level <enum> (default L2VPN)

      VPN level for the API.

      L2VPN  - L2VPN.

      L3VPN  - L3VPN.


    - connection api request service action update id-value-as <enum> (default DOMAIN_SERVICE_ID)

      SERVICE_ID         - SERVICE_ID.

      DOMAIN_SERVICE_ID  - DOMAIN_SERVICE_ID.


    - connection api request service action update id-value-locked <true|false> (default false)

      If true, OperCDB value is used, otherwise the config leaf (serviceId|domainServiceId)
      value is used.


    - connection api request service payload customerName length <uint16> (default 30)


    - connection api address default <string>

      API default host.


    - connection api address service <string>

      API host for device Service.


    - connection api base-url default <string> (default /MuseApplication/ServiceManager/V1.1)

      API default base URL.


    - connection api base-url service <string>

      API base URL for device Service.


    - connection api proto default <string>

      API default proto.


    - connection api sync service ids <string>

      IDs of Services to be retrieved on sync-from.


    - connection api sync service all <true|false> (default false)

      If "true", retrieve all services. Otherwise, retrieve only services
      with provided ids.


    - connection api number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection api time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection api key <string>

      API authentication key if needed.


## 2.1. ned-settings eci-muse connection api address for-version
----------------------------------------------------------------

  Device REST API host for specific API version.

    - connection api address for-version <version> <default> <service>

      - version <enum>

        1  - 1.

        2  - 2.

      - default <string>

        Device REST API default host for specific API version.

      - service <string>


## 2.2. ned-settings eci-muse connection api base-url for-version
-----------------------------------------------------------------

  Device REST API base URL for specific API version.

    - connection api base-url for-version <version> <default> <service>

      - version <enum>

        1  - 1.

        2  - 2.

      - default <string>

        Device REST API default base URL for specific API version.

      - service <string>


# 3. ned-settings eci-muse logger
---------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 4. ned-settings eci-muse developer
------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - developer trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log
      file

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


