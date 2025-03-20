# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/brocade-ironware/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/brocade-ironware/
  device
    /ncs:/device/devices/device:<name>/ned-settings/brocade-ironware/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings brocade-ironware

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings brocade-ironware
  2. connection
  3. dummy-connection
  4. deprecated
  5. logger
  6. live-status
  ```


# 1. ned-settings brocade-ironware
----------------------------------

  Configure settings specific to the connection between NED and device.


    - brocade-ironware extended-parser <enum> (default auto)

      Make the brocade-ironware NED handle CLI parsing (i.e. transform the running-config from the
      device to the model based config tree).

      auto            - Uses turbo-mode when available, will use fastest availablemethod to load
                        data to NSO. If NSO doesn't support data-loading from CLI NED, robust-mode
                        is used.

      turbo-mode      - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO using maapi
                        setvalues call.

      turbo-xml-mode  - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO in XML
                        format.

      robust-mode     - Makes the NED filter the configuration so that unmodeled content is removed
                        before being passed to the NSO CLI-engine. This protects against
                        configuration ending up at the wrong level when NSO CLI parser fallbacks
                        (which potentially can cause following config to be skipped).


    - brocade-ironware ironware-transaction-id-method <enum>

      Method of the brocade-ironware NED to use for calculating a transaction id. Typically used for
      check-sync operations.

      config-hash  - Use a snapshot of the running config for calculation.

      dir          - Use the timestamp of the latest startup-configuration save time done via 'write
                     memory'for calculation.


    - brocade-ironware banner-delimeter-fastiron <string> (default {)

      This is a single character delimiter used for setting a banner.This character must not be used
      inside the banner text!.


# 2. ned-settings brocade-ironware connection
---------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection connector <WORD>

      Change the default connector, e.g. 'ned-connector-default.json'.


    - connection terminal width <uint32> (default 200)

      Terminal width reported by SSH/TELNET upon connect.


    - connection terminal height <uint32> (default 24)

      Terminal height reported by SSH/TELNET upon connect.


    - connection terminal println-mode <enum> (default onocr)

      This setting controls how the NED feeds lines, i.e. whether to
      send carriage return and/or newline. Typically you may only need
      to modify this setting if you are connecting to the device via a
      terminal server. Four different methods are supported:

      default  - System property line.separator default.

      ocrnl    - Translate carriage return to newline.

      onocr    - Translate newline to carriage return-newline.

      onlret   - Newline performs a carriage return.


    - connection ssh client <enum>

      Configure the SSH client to use. Relevant only when using the NED with NSO 5.6 or later.

      ganymed  - The legacy SSH client. Used on all older versions of NSO.

      sshj     - The new SSH client with support for the latest crypto features. This is the default
                 when using the NED on NSO 5.6 or later.


# 3. ned-settings brocade-ironware dummy-connection
---------------------------------------------------

  Simulates a dummy connection, ONLY to be used with the 'load-native-config' feature, when the real
  connection is not possible and the NED can't identify the Yang model.


    - dummy-connection version <union> (default )

      Set version as below to choose the device type and the related Yang model. When set on empty,
      a real connection is performed.


# 4. ned-settings brocade-ironware deprecated
---------------------------------------------

  Deprecated ned-settings.


    - deprecated live-status legacy-mode <enum> (default disabled)

      enabled   - enabled.

      disabled  - disabled.


    - deprecated connection legacy-mode <enum> (default disabled)

      enabled   - enabled.

      disabled  - disabled.


# 5. ned-settings brocade-ironware logger
-----------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default debug)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 6. ned-settings brocade-ironware live-status
----------------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


