# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/redhat-ansible/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/redhat-ansible/
  device
    /ncs:/device/devices/device:<name>/ned-settings/redhat-ansible/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings redhat-ansible

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings redhat-ansible
  2. connection
  3. logger
  4. developer
  ```


# 1. ned-settings redhat-ansible
--------------------------------


# 2. ned-settings redhat-ansible connection
-------------------------------------------

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


    - connection api-base-url <string>

      API base URL for device REST API.


    - connection api-key <string>

      API authentication key if needed.


# 3. ned-settings redhat-ansible logger
---------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 4. ned-settings redhat-ansible developer
------------------------------------------

  Contains settings used by the NED developers.


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


