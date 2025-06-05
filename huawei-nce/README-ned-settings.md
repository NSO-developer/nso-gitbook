# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/huawei-nce/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/huawei-nce/
  device
    /ncs:/device/devices/device:<name>/ned-settings/huawei-nce/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings huawei-nce

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings huawei-nce
  2. connection
  3. logger
  4. features
  5. timers
  ```


# 1. ned-settings huawei-nce
----------------------------


    - huawei-nce debugFlag <true|false> (default false)

      Enabled extra debugging in NED.


    - huawei-nce fetch-l3vpn-method <enum> (default file)

      method used to fetch the L3VPN services (via APIs or downloading a file with configuration).

      file  - L3VPN configuration is read from a file<default method>.

      api   - L3VPN configuration is fetched using APIs for every L3VPN service.


    - huawei-nce fetch-platform-oper-data <enum> (default file)

      choose a method to fetch network-elements and LTPS (platform operational data).

      file  - 'network-elements' and 'ltp' are fetched from files<default method>.

      api   - 'network-elements' and 'ltp' are fetched using APIs.


    - huawei-nce enable-vpn-node-count-check <true|false> (default true)

      flag used to check the 'vpn-node-count' parameter, so NED decides if 1 or 2 APIs are needed to
      fetch a specific L3VPN entry.


    - huawei-nce client-svc-instance-completed-method <enum> (default old-method)

      choose if 'client-svc-instance' creation should be completed during
      'time-provisioning-service-DWDM' timer or not.

      old-method  - if creating time exceeds 'time-provisioning-service-DWDM' timer, then service
                    creation fails.

      new-method  - if creating time exceeds 'time-provisioning-service-DWDM' timer and no error
                    occurs in the meantime, service creation is considered successful.


# 2. ned-settings huawei-nce connection
---------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection api-base-url <string>

      API base URL for device REST API.


    - connection ssl accept-any <true|false> (default true)

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


# 3. ned-settings huawei-nce logger
-----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default debug)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 4. ned-settings huawei-nce features
-------------------------------------

  Features that are enabled on device.


    - features IP-services-feature <true|false> (default false)


    - features DWDM-feature <true|false> (default false)


# 5. ned-settings huawei-nce timers
-----------------------------------

  choose timers;.


    - timers time-retry-delete-service <uint32> (default 9000)

      there are 3 attempts to check if a service was successfully deleted the time between retries
      is given by this parameter. Value is in ms.


    - timers time-l3vpn-download-file <time in seconds> (default 70)

      Time to wait (in seconds) until a file name occurs for L3VPN download file.Used when L3VPN
      config is fetched using file method.


    - timers time-provisioning-service-DWDM <time in seconds> (default 30)

      Time to wait (in seconds) until a client-svc-instance is complete, meaning that
      'provisioning-state' become 'lsp-state-up'.


