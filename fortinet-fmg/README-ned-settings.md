# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/fortinet-fmg/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/fortinet-fmg/
  device
    /ncs:/device/devices/device:<name>/ned-settings/fortinet-fmg/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings fortinet-fmg

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings fortinet-fmg
  2. connection
  3. logger
  4. read
  5. install-config-to-fortigate
  ```


# 1. ned-settings fortinet-fmg
------------------------------

  Fortinet FMG ned-settings.


    - fortinet-fmg fortinet-check-sync <enum> (default enable)

      Check fortigate and fortimanager are in sync before pushing config.

      enable   - enable fortigate and fortimanager check-sync before pushing config.

      disable  - disable fortigate and fortimanager check-sync.


    - fortinet-fmg specific-adom-sync-from <string>

      Specify adom names to fetch from device.

      Example-1:
      # devices device <device-name> ned-settings fortinet-fmg specific-adom-sync-from [ root ]

      Example-2:
      # devices device <device-name> ned-settings fortinet-fmg specific-adom-sync-from [ root other ]

      NOTE: only configured adoms will be fetched during sync-from/check-sync.


    - fortinet-fmg proceed-sync-from-on-invalid-value <true|false> (default false)

      The value ranges or types on all versions of fortimanager may not have
      been accounted for by the NED. By default, invalid values cause the
      NED to fail. In some cases, however, it may be advantageous to have
      the NED ignore an invalid value, and proceed with sync-from for other
      objects. In that case, this ned-setting may be set to 'true' to enable
      such behavior.


    - fortinet-fmg workspace-mode <enum> (default disabled)

      FMG workspace mode.

      disabled  - Workspace disabled.

      normal    - Workspace lock mode.

      workflow  - Workspace workflow mode.

      If workspace mode set to normal, NED will do following.

        1. lock adom workspace
        2. apply config changes
        3. commit adom workspace changes
        4. install changes
        5. unlock adom workspace.

      If workspace mode set to workflow, NED will do following.

        1. check all workflow sessions, if following matched NED will return with an error.
           - state 1, flag 0 - created but not saved,
           - state 1, flag 1 - saved but not submitted
           - state 2, flag 0 - submitted but not approved
        2. lock adom workspace
        3. start workflow session
        4. apply config changes
        5. save workflow session
        6. submit workflow session
        7. approve workflow session
        8. install changes
        9. unlock adom workspace


# 2. ned-settings fortinet-fmg connection
-----------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection remote-protocol <enum> (default https)

      Connection type.

      http   - http.

      https  - https.


    - connection secondary-remote-address <union>

      Secondary Ip address.


    - connection secondary-remote-name <string>

      Secondary Ip remote name.


    - connection secondary-remote-password <string>

      Secondary Ip remote password.


    - connection ha-status-check <enum> (default enable)

      Check sys ha status during device connection.

      disable  - Disable ha status check during device connection.

      enable   - Enable ha status check during device connection.


# 3. ned-settings fortinet-fmg logger
-------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


# 4. ned-settings fortinet-fmg read
-----------------------------------

  Settings used when reading from device.


    - read parallel-api-calls <enum> (default disable)

      Enable/Disable parallel API calls during sync-from/partial-sync using JAVA Threads.

      disable  - disable.

      enable   - enable.


    - read transaction-id-provisional <true|false> (default true)

      Enable/Disable use of new NSO feature to set provisional transaction-id in show() to save a
      call to getTransId() with sync-from.


# 5. ned-settings fortinet-fmg install-config-to-fortigate
----------------------------------------------------------

  These ned-settings are used to control NED behavior when pushing configurations to fortigate
  device (installation phase).


    - install-config-to-fortigate install-mode <enum> (default enable)

      enable or disable install-config to fortigate device.

      enable   - enable.

      disable  - disable.


    - install-config-to-fortigate install-status-check-max-retries <NUM> (default 5)

      Max number of retries, when checking status.


    - install-config-to-fortigate install-status-check-interval <NUM> (default 30)

      Specify retry interval in seconds.


