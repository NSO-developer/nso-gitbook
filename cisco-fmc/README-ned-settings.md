# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-fmc/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-fmc/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-fmc/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-fmc

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-fmc
  2. logger
  3. platform
  4. cisco-fmc-connection
  5. cisco-fmc-settings
     5.1. skipAtSyncFrom
  ```


# 1. ned-settings cisco-fmc
---------------------------


# 2. ned-settings cisco-fmc logger
----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings cisco-fmc platform
------------------------------------

  Platform info overrides.


    - platform model <string>

      Override device model name/number.


    - platform name <string>

      Override device name.


    - platform version <string>

      Override device version.


# 4. ned-settings cisco-fmc cisco-fmc-connection
------------------------------------------------

  Per device connection configuration.


    - cisco-fmc-connection ssl accept-any <true|false> (default false)

      Accept any SSL certificate presented by the device.
      Warning! This enables Man in the Middle attacks and
      should only be used for testing and troubleshooting.


    - cisco-fmc-connection ssl certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like.

      Default uses the default trusted certificates installed in
      Java JVM.

      An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


# 5. ned-settings cisco-fmc cisco-fmc-settings
----------------------------------------------

  Bellow are NED behaviour settings.


    - cisco-fmc-settings async-task-timeout <uint32> (default 600)

      This setting is used to configure the time in seconds that the NED will wait for
      an asynchronous task like slave device registration.

      Eg:
      ned-settings cisco-fmc cisco-fmc-settings async-task-timeout 600


    - cisco-fmc-settings wait-for-accesspolicy <true|false> (default false)

      Development feature.

      If enabled, when registering a new slave device, the NED will do a GET /devices/devicerecords 
      until accessPolicy/name is populated. After accessPolicy/name appears in the JSON response,
      the NED will declare the commit complete.


## 5.1. ned-settings cisco-fmc cisco-fmc-settings skipAtSyncFrom
----------------------------------------------------------------

  This list is used to define what will be skiped at sync-from.

    - cisco-fmc-settings skipAtSyncFrom <path>

      - path <string>

        This setting is used to configure the NED so it skips certain paths from sync-from.
        For example when ISE is enabled a GET on /object/securitygrouptags
        will result in error response. To disable this GET at sync-from a path like /object/securitygrouptags
        needs to be added in skipAtSyncFrom list.

        Eg:
          ned-settings cisco-fmc cisco-fmc-settings skipAtSyncFrom /object/securitygrouptags

        If the path used at sync-from contains the path added in skipAtSyncFrom list,
        it will be skipped and not HTTP GET will be performed.

        This ned-setting could also be use to speed up the sync-from, by removing
        configuration items that are not use.


