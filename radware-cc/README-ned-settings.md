# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/radware-cc/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/radware-cc/
  device
    /ncs:/device/devices/device:<name>/ned-settings/radware-cc/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings radware-cc

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings radware-cc
  2. logger
  3. connection
  4. developer
  ```


# 1. ned-settings radware-cc
----------------------------


# 2. ned-settings radware-cc logger
-----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings radware-cc connection
---------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection api-base-url <string>

      API base URL for device REST API.


    - connection auth-token api-auth-token <string> (default /mgmt/system/user/login)

      API authentication token if needed.


    - connection remote-protocol <enum> (default https)

      Connection type.

      http   - http.

      https  - https.


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


# 4. ned-settings radware-cc developer
--------------------------------------

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


