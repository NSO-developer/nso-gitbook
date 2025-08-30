# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/huawei-ias/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/huawei-ias/
  device
    /ncs:/device/devices/device:<name>/ned-settings/huawei-ias/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings huawei-ias

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings huawei-ias
  2. developer
  3. proxy
  4. connection
  5. console
     5.1. warning
     5.2. command
     5.3. pattern
     5.4. action
          5.4.1. state
  6. logger
  7. read
  8. write
  9. live-status
  ```


# 1. ned-settings huawei-ias
----------------------------


    - extended-parser <enum> (default auto)

      Make the huawei-ias NED handle CLI parsing (i.e. transform the running-config from the device
      to the model based config tree).

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


# 2. ned-settings huawei-ias developer
--------------------------------------

  Contains settings used by the NED developers.


    - developer load-from-file <string>

      Make the NED load a file containing raw device config when doing sync-from. Does only work on
      NETSIM targets.


    - developer model <string>

      Simulate a model number. Include 'NETSIM' for netsim.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will be reported.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer load-native-config allow-delete <true|false> (default false)

      Enable this setting to be able to handle limited delete operations with 'load-native-config'. Please note that
      not all syntax available on a real device works, some delete operations can not be parsed by the NED. Use the
      'verbose' flag to 'load-native-config' to see if delete commands can be parsed. Currently this is only supported
      when 'extended-parser' is set to 'turbo-xml-mode'


    - developer load-native-config delete-with-remove <true|false> (default false)

      Enable this setting to use 'remove' instead of 'delete' when sending delete operations to NSO. This is useful when
      doing delete commands for data that might not be present in CDB. Please note that deletes for missing data will still
      be part of transaction, and will be sent to device. Use with care, and do proper testing to understand behaviour.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


# 3. ned-settings huawei-ias proxy
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


    - proxy remote-command <string>

      Connection command used to initiate proxy on device. Optional for ssh/telnet. Accepts
      $(proxy/remote-xxx) for inserting remote-xxx config.


    - proxy remote-name <string>

      User name on the device behind the proxy.


    - proxy remote-password <string>

      Password on the device behind the proxy.


    - proxy proxy-prompt <string>

      Prompt pattern on the proxy host before connecting to device.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


# 4. ned-settings huawei-ias connection
---------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection commands meta-data <WORD>

      Change the default connector. Default 'ned-connector.json'.


    - connection commands initial-action <union>

      Interactor action used to initialize a connection.


    - connection commands awaken-console <string>

      Command sent to awaken console during connection.


    - connection commands send-delay <uint32> (default 0)

      Delay in ms before sending a command during connection.


    - connection commands expect-timeout <uint32> (default 60000)

      Default limit in ms for waiting for command response.


# 5. ned-settings huawei-ias console
------------------------------------

  Settings used while interacting with a device.


    - console ignore-errors <true|false> (default false)

      Flag indicating if errors should be ignored.


    - console ignore-retries <true|false> (default false)

      Flag indicating if retries should be ignored.


    - console max-retries <uint8> (default 100)

      Maximum number of retries of a command.


    - console retry-delay <uint16> (default 1000)

      Number of ms before retrying a command.


    - console send-delay <uint32> (default 0)

      Enable delay before sending commands.


    - console expect-timeout <uint32> (default 60000)

      Set default timeout for sending commands.


    - console chunk-size <uint8> (default 1)

      Enable executing commands in chunks.


## 5.1. ned-settings huawei-ias console extension warning
---------------------------------------------------------

  Add regular expressions for warnings/errors which the ned should ignore when
  applying the configuration on a device.

    - console extension warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.*.


## 5.2. ned-settings huawei-ias console extension command
---------------------------------------------------------

  Extend available commands to send.

    - console extension command <name> <data>

      - name <string>

        Key id of the command.

      - data <string>

        Command.


## 5.3. ned-settings huawei-ias console extension pattern
---------------------------------------------------------

  Extend available patterns to expect.

    - console extension pattern <name> <data>

      - name <string>

        Key id of the pattern.

      - data <string>

        A regular expression.


## 5.4. ned-settings huawei-ias console extension action
--------------------------------------------------------

  Extend available actions to perform.

    - console extension action <name> <init> <flush>

      - name <string>

        A name for the action.

      - init <string>

        Command sent to intialize action.

      - flush <true|false>

        Flush device buffer once action is completed.


### 5.4.1. ned-settings huawei-ias console extension action state
-----------------------------------------------------------------

  Extend state machine with answers/questions to handle.

    - state <pattern> <method> <argument> <next>

      - pattern <string>

        Regular expression indicating action required.

      - method <enum>

        Method used to take action.

        reportInfo     - reportInfo.

        reportError    - reportError.

        reportWarning  - reportWarning.

        sendCommand    - sendCommand.

        sendSecret     - sendSecret.

        sendRetry      - sendRetry.

        recoverError   - recoverError.

      - argument <string>

        Additional info to method.

      - next <string> (default DONE)

        State once action is taken.


# 6. ned-settings huawei-ias logger
-----------------------------------

  Settings for controlling logs generated.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger connection verbose <true|false>

      Toggle additional verbose logs.


    - logger connection debug <true|false>

      Toggle debug logs for ned development.


    - logger connection silent <true|false> (default false)

      Toggle detailed logs to only be dumped on failure.


# 7. ned-settings huawei-ias read
---------------------------------

  Settings used when reading from device.


    - read translate-id-to-name <true|false> (default true)

      When enabled (default), the profile-name is filled with the lookup result based on the profile-id. These are special leafs that are not part of the device config.
      Set this to false to disable the index translation and keep in the cdb the same command as in the device


    - read dynamic-service-port <true|false> (default false)

      When this is enabled, the ned will ignore the dymically created service-port id, both at read and write
      and will use the (vlan gpon gemport) keys. This behavior also apply to mac-address max-mac-count


    - read transaction-id-method <enum> (default config-hash-cached)

      Configure how the NED shall calculate the transaction id. Typically used after each commit and
      for check-sync operations.

      config-hash         - Use a snapshot of the running config for calculation (default).

      config-hash-cached  - Use a snapshot of the running config filtered from all data is not part
                            of the device model for calculation.

      config-device       - Always read config from device.


    - read strip-encrypted-values <true|false> (default false)

      Strip encrypted values from the config dump. This is useful when the NED is used to read the
      config from device and the config contains encrypted values that are changing at every read.


# 8. ned-settings huawei-ias write
----------------------------------

  Settings used when writing to device.


    - write memory-setting <enum> (default persist)

      Select the config persistence method for Huawei device (default is 'persist').

      persist  - Save device config to persistent storage as part of NCS transaction (default).

      none     - Never save config on device as part of NCS transaction.


    - write ignore-all-warnings <true|false> (default false)

      When enabled, NED will ignore all device warnings.


    - write config-output-max-retries <NUM> (default 90)

      Max number of retries (one per second) when sending config command to device.


# 9. ned-settings huawei-ias live-status
----------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


