# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/ericsson-enm/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/ericsson-enm/
  device
    /ncs:/device/devices/device:<name>/ned-settings/ericsson-enm/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings ericsson-enm

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings ericsson-enm
  2. logger
  3. connection
     3.1. timeouts
  4. platform
  5. developer
  6. sync-from
     6.1. filter
  ```


# 1. ned-settings ericsson-enm
------------------------------


# 2. ned-settings ericsson-enm logger
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


# 3. ned-settings ericsson-enm connection
-----------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection api-base-url <string>

      API base URL for device REST API.


    - connection ssl accept-any <true|false>

      Accept any SSL certificate presented by the device.
      Warning! This enables Man in the Middle attacks and
      should only be used for testing and troubleshooting.


    - connection ssl certificate <string>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like
      "----- BEGIN CERTIFICATE -----".

      Default uses the default trusted certificates installed in
      Java JVM.

      An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


    - connection logger silent <true|false> (default false)

      Toggle detailed logs to only written to store.


## 3.1. ned-settings ericsson-enm connection timeouts
-----------------------------------------------------

  These files will determine how long the NED will wait for a reply from the device
  The total delay is (read_number_of_attempts * read_delay_between_attempts) seconds


    - timeouts read_number_of_attempts <uint32> (default 120)

      how many times the NED will pool the device for a status update during a READ operation.


    - timeouts read_delay_between_attempts <uint32> (default 1)

      how long the NED will wait between status pooling attempts, in seconds, during a READ
      operation.


# 4. ned-settings ericsson-enm platform
---------------------------------------

  Platform info overrides.


    - platform model <string>

      Override device model name/number.


    - platform name <string>

      Override device name.


    - platform version <string>

      Override device version.


# 5. ned-settings ericsson-enm developer
----------------------------------------

  Contains settings used by the NED developers.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - developer trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer sync_from_debug read_raw_config_from_file <string>

      If set, the NED will load the specified XML file instead of the device.


    - developer sync_from_debug save_raw_config_to_file <string>

      If set, the NED will save the raw config to this file.


# 6. ned-settings ericsson-enm sync-from
----------------------------------------

  controls various aspects of the sync-from operation.


## 6.1. ned-settings ericsson-enm sync-from filter
--------------------------------------------------

  .

    - sync-from filter <matchCondition> <value>

      - matchCondition <enum>

        EQUALS       - EQUALS.

        STARTS_WITH  - STARTS_WITH.

        ENDS_WITH    - ENDS_WITH.

        CONTAINS     - CONTAINS.

      - value <string>


