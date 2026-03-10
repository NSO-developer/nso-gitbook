# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/huawei-imanager/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/huawei-imanager/
  device
    /ncs:/device/devices/device:<name>/ned-settings/huawei-imanager/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings huawei-imanager

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings huawei-imanager
  2. connection
  3. logger
  4. developer
  ```


# 1. ned-settings huawei-imanager
---------------------------------


    - huawei-imanager certificate_path <string> (default )

      path to the client certificate, leave empty if not used.


    - huawei-imanager certificate_password <string> (default )

      password for the client certificate.


    - huawei-imanager certificate_alias <string> (default )

      certificate alias.


    - huawei-imanager fdfr_chunk_size <uint32> (default 2000)

      determines how many FDFR's are fetched in one request, during fdfrCache refresh.


    - huawei-imanager device_md <string> (default Huawei/U2000)

      Value of the MD field.


# 2. ned-settings huawei-imanager connection
--------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection api-base-url <string>

      API base URL for device REST API.


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


# 3. ned-settings huawei-imanager logger
----------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 4. ned-settings huawei-imanager developer
-------------------------------------------


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer sync-from-verbose <enum> (default brief)

      Set info level for sync-from verbose output.

      brief  - brief.

      full   - full.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


