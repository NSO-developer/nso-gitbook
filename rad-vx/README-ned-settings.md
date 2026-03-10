# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/rad-vx/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/rad-vx/
  device
    /ncs:/device/devices/device:<name>/ned-settings/rad-vx/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings rad-vx

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings rad-vx
  2. connection
  3. deprecated
  4. development_settings
  5. logger
  6. developer
  ```


# 1. ned-settings rad-vx
------------------------

  Configure settings specific to the connection between NED and device.


    - rad-vx extended-parser <enum> (default auto)

      Make the NED handle CLI parsing (i.e. transform the running-config from the device to the
      model based config tree).

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


    - rad-vx save_delay <uint32> (default 10)

      this will add a delay after the save command.


# 2. ned-settings rad-vx connection
-----------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection connector <WORD>

      Change the default connector, e.g. 'ned-connector-default.json'.


    - connection ssh client <enum> (default ganymed)

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


# 3. ned-settings rad-vx deprecated
-----------------------------------

  Deprecated ned-settings.


    - deprecated connection legacy-mode <enum> (default disabled)

      enabled   - enabled.

      disabled  - disabled.


# 4. ned-settings rad-vx development_settings
---------------------------------------------


    - development_settings enable_device_save <true|false> (default true)

      Set this to FALSE when you don't want the changes to be persistent on the device. USE WITH
      CARE.


# 5. ned-settings rad-vx logger
-------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 6. ned-settings rad-vx developer
----------------------------------

  Contains settings used by the NED developers.


    - developer trace-connection <true|false> (default false)

      Enable developer connection tracing. WARNING: may choke NSO with large printouts.


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log file.

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


