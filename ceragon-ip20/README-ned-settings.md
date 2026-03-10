# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/ceragon-ip20/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/ceragon-ip20/
  device
    /ncs:/device/devices/device:<name>/ned-settings/ceragon-ip20/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings ceragon-ip20

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings ceragon-ip20
  2. developer
  3. proxy
  4. proxy-2
  5. connection
  6. transaction
  7. console
     7.1. warning
     7.2. command
     7.3. pattern
     7.4. action
          7.4.1. state
  8. logger
  ```


# 1. ned-settings ceragon-ip20
------------------------------


    - extended-parser <enum> (default auto)

      Make the NED handle CLI parsing (i.e. transform the running-config from the device to the
      model based config tree).

      auto            - Uses turbo-mode when available, will use fastest availablemethod to load
                        data to NSO.

      turbo-mode      - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO using maapi
                        setvalues call.

      turbo-xml-mode  - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO in XML
                        format.


# 2. ned-settings ceragon-ip20 developer
----------------------------------------

  Contains settings used by the NED developers.


    - developer load-from-file <string>

      Make the NED load a file containing raw device config when doing sync-from. Does only work on
      NETSIM targets.


    - developer model-id <uint32>

      Simulate a model number.


    - developer os-major <uint8>

      Simulate OS major number.


    - developer os-minor <uint8> (default 0)

      Simulate OS major number.


    - developer device-type <enum> (default netsim)

      Real or simulated device.

      netsim  - netsim.

      device  - device.


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - developer trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer progress-verbosity <enum> (default verbose)

      Maximum NED verbosity level which will get written in devel.log file.

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


# 3. ned-settings ceragon-ip20 proxy
------------------------------------

  Configure NED to access device via a proxy.


    - proxy remote-connection <enum>

      Connection type between ned, proxy and device.

      ssh            - Start a new ssh client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      telnet         - Start a new telnet client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      serial         - Connect through a terminal server to device.

      ssh-direct     - Direct forward to device using ned local ssh client (i.e. without shell on
                       proxy).

      telnet-direct  - Direct forward to device using ned local telnet client (i.e. without shell on
                       proxy).


    - proxy remote-address <union>

      Address of host behind the proxy.


    - proxy remote-port <uint16>

      Port of host behind the proxy.


    - proxy remote-name <string>

      User name on the device behind the proxy.


    - proxy remote-password <string>

      Password on the device behind the proxy.


    - proxy remote-secondary-password <string>

      Second password (e.g. enable) on the device behind the proxy .WARNING MUST UPDATE connector
      template to use!.


    - proxy authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy proxy-prompt <string>

      Prompt pattern on the proxy host before connecting to device.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


    - proxy auth-key private-key-file <string>

      Path to openssh formatted private key file for doing public key auth to device behind proxy.


    - proxy host-key-validation <true|false> (default false)

      Set this to true to force host-key validation of device behind proxy.


# 4. ned-settings ceragon-ip20 proxy-2
--------------------------------------

  Configure NED to access device via a second proxy.


    - proxy-2 remote-connection <enum>

      Connection type between ned, proxy and device.

      ssh            - Start a new ssh client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      telnet         - Start a new telnet client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      serial         - Connect through a terminal server to device.

      ssh-direct     - Direct forward to device using ned local ssh client (i.e. without shell on
                       proxy).

      telnet-direct  - Direct forward to device using ned local telnet client (i.e. without shell on
                       proxy).


    - proxy-2 remote-address <union>

      Address of host behind the proxy.


    - proxy-2 remote-port <uint16>

      Port of host behind the proxy.


    - proxy-2 remote-name <string>

      User name on the device behind the proxy.


    - proxy-2 remote-password <string>

      Password on the device behind the proxy.


    - proxy-2 remote-secondary-password <string>

      Second password (e.g. enable) on the device behind the proxy .WARNING MUST UPDATE connector
      template to use!.


    - proxy-2 authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy-2 proxy-prompt <string>

      Prompt pattern on the proxy host before connecting to device.


    - proxy-2 remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


    - proxy-2 auth-key private-key-file <string>

      Path to openssh formatted private key file for doing public key auth to device behind proxy.


    - proxy-2 host-key-validation <true|false> (default false)

      Set this to true to force host-key validation of device behind proxy.


# 5. ned-settings ceragon-ip20 connection
-----------------------------------------

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


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection character-set <string> (default UTF-8)

      Character set to use for telnet session.


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


    - connection logger silent <true|false> (default false)

      Toggle detailed logs to only written to store.


    - connection terminal width <uint32> (default 10000)


    - connection terminal height <uint32> (default 200)


# 6. ned-settings ceragon-ip20 transaction
------------------------------------------

  Transaction specific settings.


    - transaction trans-id-method <enum> (default modeled-config)

      Select the method for calculating transaction-id.

      modeled-config  - Use a snapshot of the data of only the modeled parts of running config for
                        calculation.

      full-config     - Use a snapshot of the full running config for calculation.

      device-custom   - Use a device custom method to get a value to use for trans-id.


    - transaction abort-on-diff <true|false> (default false)

      Enable to detect diff immediately when config is applied (i.e. in commit/abort/revert).
      If a diff is detected an exception is thrown, having the effect in commit that the transaction
      is aborted (showing the diff). Note that this means some overhead in commit, where whole config
      needs to be retrieved from device to do compare. It's a more exact way to detect OOB changes,
      silently dropped config, and unknown side-effects to config (i.e. all causing a diff compared 
      to NSO state). In fact, it's the only method which guarantees that the config was actually 
      applied as desired. Since this incurs overhead it is strongly adviced that this feature is
      only used during development.


# 7. ned-settings ceragon-ip20 console
--------------------------------------

  Settings used while interacting with a device.


    - console ignore-errors <true|false>

      Flag indicating if errors should be ignored.


    - console ignore-warnings <true|false>

      Flag indicating if warnings should be ignored.


    - console ignore-retries <true|false>

      Flag indicating if retries should be ignored.


    - console max-retries <uint16>

      Maximum number of retries of a command.


    - console retry-delay <uint16>

      Number of ms before retrying a command.


    - console send-delay <uint32>

      Enable delay before sending commands.


    - console expect-timeout <uint32>

      Set default timeout for sending commands.


    - console chunk-size <uint8>

      Enable executing commands in chunks.


    - console line-feed <string>

      Overwrites default line-feed character.


    - console obfuscate-secret <true|false>

      Secrets will be obfuscated in trace & log files.


## 7.1. ned-settings ceragon-ip20 console extension warning
-----------------------------------------------------------

  Device warning regex entry list. Use to ignore warnings/errors etc.

    - console extension warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.*.


## 7.2. ned-settings ceragon-ip20 console extension command
-----------------------------------------------------------

  Extend available commands to send.

    - console extension command <name> <data>

      - name <string>

        Key id of the command.

      - data <string>

        Command.


## 7.3. ned-settings ceragon-ip20 console extension pattern
-----------------------------------------------------------

  Extend available patterns to expect.

    - console extension pattern <name> <data>

      - name <string>

        Key id of the pattern.

      - data <string>

        A regular expression.


## 7.4. ned-settings ceragon-ip20 console extension action
----------------------------------------------------------

  Extend available actions to perform.

    - console extension action <name> <init> <flush>

      - name <string>

        A name for the action.

      - init <string>

        Command sent to intialize action.

      - flush <true|false>

        Flush device buffer once action is completed.


### 7.4.1. ned-settings ceragon-ip20 console extension action state
-------------------------------------------------------------------

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


# 8. ned-settings ceragon-ip20 logger
-------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


