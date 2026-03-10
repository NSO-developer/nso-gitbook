# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/proxmox-ve/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/proxmox-ve/
  device
    /ncs:/device/devices/device:<name>/ned-settings/proxmox-ve/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings proxmox-ve

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings proxmox-ve
  2. logger
  3. connection
  4. platform
  ```


# 1. ned-settings proxmox-ve
----------------------------


# 2. ned-settings proxmox-ve logger
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


# 3. ned-settings proxmox-ve connection
---------------------------------------

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


    - connection logger silent <true|false> (default false)

      Toggle detailed logs to only written to store.


# 4. ned-settings proxmox-ve platform
-------------------------------------

  Platform info overrides.


    - platform model <string>

      Override device model name/number.


    - platform name <string>

      Override device name.


    - platform version <string>

      Override device version.


