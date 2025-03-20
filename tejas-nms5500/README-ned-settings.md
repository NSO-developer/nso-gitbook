# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/tejas-nms5500/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/tejas-nms5500/
  device
    /ncs:/device/devices/device:<name>/ned-settings/tejas-nms5500/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings tejas-nms5500

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings tejas-nms5500
  2. connection
  3. logger
  4. platform
  5. developer
  6. context
  ```


# 1. ned-settings tejas-nms5500
-------------------------------


# 2. ned-settings tejas-nms5500 connection
------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection ssh client <enum>

      Configure the SSH client to use. Relevant only when using the NED with NSO 5.6 or later.

      ganymed  - The legacy SSH client. Used on all older versions of NSO.

      sshj     - The new SSH client with support for the latest crypto features. This is the default
                 when using the NED on NSO 5.6 or later.


    - connection ssh host-key known-hosts-file <string>

      Path to openssh formatted 'known_hosts' file containing valid host keys.


    - connection ssh host-key public-key-file <string>

      Path to openssh formatted public (.pub) host key file.


    - connection ssh auth-key private-key-file <string>

      Path to openssh formatted private key file.


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


    - connection logger silent <true|false> (default false)

      Toggle detailed logs to only written to store.


# 3. ned-settings tejas-nms5500 logger
--------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 4. ned-settings tejas-nms5500 platform
----------------------------------------

  Platform info overrides.


    - platform model <string>

      Override device model name/number.


    - platform name <string>

      Override device name.


    - platform version <string>

      Override device version.


# 5. ned-settings tejas-nms5500 developer
-----------------------------------------

  Contains settings used by the NED developers.


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - developer trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


# 6. ned-settings tejas-nms5500 context
---------------------------------------

  Settings related to fetching the context config.


    - context sync-from-only-conf <true|false> (default false)

      Only sync from the serial numbers in the serial-number leaf-list.


    - context paginated-get-size <uint16> (default 50)

      How many objects to fetch per GET call.


    - context serial-number <string>

      Contains serial number to fetch physical context ont and node-edgepoint data.


