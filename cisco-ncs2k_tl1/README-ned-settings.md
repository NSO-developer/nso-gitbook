# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-ncs2k_tl1/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-ncs2k_tl1/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-ncs2k_tl1/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-ncs2k_tl1

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-ncs2k_tl1
  ```


# 1. ned-settings cisco-ncs2k_tl1
---------------------------------

  Configure ncs2k settings.


    - cisco-ncs2k_tl1 tl1 connection <enum> (default telnet)

      Configure the connection type for the TL1 session.

      telnet  - telnet.

      ssh     - ssh.


    - cisco-ncs2k_tl1 tl1 ctag <uint32> (default 123)

      Configure the TL1 CTAG used when executing commands etc.


    - cisco-ncs2k_tl1 tl1 sleep-between-each-command <uint8> (default 0)

      Configure number of seconds to wait before sending next TL1 command.This settings applies to
      operations that involve multiple TL1 commands.


    - cisco-ncs2k_tl1 live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.


    - cisco-ncs2k_tl1 logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - cisco-ncs2k_tl1 logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


