# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/arris-cmts/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/arris-cmts/
  device
    /ncs:/device/devices/device:<name>/ned-settings/arris-cmts/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings arris-cmts

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings arris-cmts
  2. connection
  3. deprecated
  4. transaction
  5. development_settings
  6. proxy
  7. logger
  8. developer
  9. proxy-settings
  10. ignore-error-messages
  ```


# 1. ned-settings arris-cmts
----------------------------

  Configure settings specific to the connection between NED and device.


    - arris-cmts extended-parser <enum> (default auto)

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


    - arris-cmts persist <true|false> (default true)

      this option will disable the 'copy running config to start up config' command that's issued
      after commit.


    - arris-cmts confFromFileEnable <true|false> (default false)

      choose if a config file should be used instead of a real device.


    - arris-cmts confFromFileName <string>

      Specify a file to be used for sync-from, instead of a real device.


# 2. ned-settings arris-cmts connection
---------------------------------------

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


# 3. ned-settings arris-cmts deprecated
---------------------------------------

  Deprecated ned-settings.


    - deprecated connection legacy-mode <enum> (default disabled)

      enabled   - enabled.

      disabled  - disabled.


# 4. ned-settings arris-cmts transaction
----------------------------------------

  Transaction specific settings.


    - transaction trans-id-method <enum> (default modeled-config)

      Select the method for calculating transaction-id.

      modeled-config  - Use a snapshot of the data of only the modeled parts of running config for
                        calculation.

      full-config     - Use a snapshot of the full running config for calculation.

      device-custom   - Use a device custom method to get a value to use for trans-id.


# 5. ned-settings arris-cmts development_settings
-------------------------------------------------


    - development_settings enable_device_save <true|false> (default true)

      Set this to FALSE when you don't want the changes to be persistent on the device. USE WITH
      CARE.


# 6. ned-settings arris-cmts proxy
----------------------------------

  Configure NED to access device via a proxy.


    - proxy remote-connection <enum>

      Connection type between proxy and device.

      ssh     - ssh.

      telnet  - telnet.

      serial  - serial.


    - proxy remote-address <union>

      Address of host behind the proxy.


    - proxy remote-port <uint16>

      Port of host behind the proxy.


    - proxy remote-name <string>

      User name on the device behind the proxy.


    - proxy remote-password <string>

      Password on the device behind the proxy.


    - proxy proxy-prompt <string>

      Prompt pattern on the proxy host.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


# 7. ned-settings arris-cmts logger
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


# 8. ned-settings arris-cmts developer
--------------------------------------


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


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer sync-from-verbose <enum> (default brief)

      Set info level for sync-from verbose output.

      brief  - brief.

      full   - full.


# 9. ned-settings arris-cmts proxy-settings
-------------------------------------------


    - proxy-settings enable-connection <true|false> (default false)

      enable proxy connection.


    - proxy-settings address <string>


    - proxy-settings port <string>


    - proxy-settings user-name <string>


    - proxy-settings password <string>


    - proxy-settings expect-string <string>


# 10. ned-settings arris-cmts ignore-error-messages
---------------------------------------------------

  Add a list of valid error messages, or part of them.

    - arris-cmts ignore-error-messages <id>

      - id <string>


