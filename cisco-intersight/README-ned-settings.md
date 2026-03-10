# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-intersight/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-intersight/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-intersight/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-intersight

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-intersight
  2. logger
  3. connection
  ```


# 1. ned-settings cisco-intersight
----------------------------------


    - access-key-id <string>

      Device access key id(public).


    - access-secret-key <string>

      Device secret key(private); the content of the SecretKey.txt file, generated from the
      Intersight UI, with or without "-----BEGIN EC PRIVATE KEY-----" and "-----END EC PRIVATE
      KEY-----".


    - crypto-algo-key <enum> (default EC PRIVATE KEY)

      The default type is EC PRIVATE KEY, since the secret key contains: "-----BEGIN EC PRIVATE
      KEY-----".

      EC PRIVATE KEY   - EC PRIVATE KEY.

      RSA PRIVATE KEY  - RSA PRIVATE KEY.


    - organization-name <string> (default )

      Set the Organization name associated to user permissions and privileges; it can takes values
      like: admin, guest, default.


    - keep-data-specific-user <true|false> (default false)

      If true, when sync-from command is called, only data that belongs to the current Organization
      user is kept, like(EthNetworkPolicy/vlan, EthNetworkGroupPolicies).


    - fetch-max-nb-entries <uint32> (default 1000)

      The maximum number of entries that can be fetched in one call.


    - use-hostname-for-connection <true|false> (default true)

      Use hostname of the cisco intersight device instead of its IP address for REST requests.


    - debugFlag <true|false> (default false)

      Enable extra debugging in NED, useful for analyzing issues.


# 2. ned-settings cisco-intersight logger
-----------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings cisco-intersight connection
---------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection api-base-url <string>

      API base URL for device REST API. If not configured, the default value used is: '/api'.


    - connection ssl accept-any <true|false>

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


    - connection logger silent <true|false> (default false)

      Toggle detailed logs to only written to store.


