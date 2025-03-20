# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/oneaccess-oneos/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/oneaccess-oneos/
  device
    /ncs:/device/devices/device:<name>/ned-settings/oneaccess-oneos/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings oneaccess-oneos

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings oneaccess-oneos
  2. live-status
  3. connection
  4. proxy
  5. proxy-2
  6. developer
  7. write
     7.1. config-warning
  8. console
     8.1. warning
     8.2. command
     8.3. pattern
     8.4. action
          8.4.1. state
  9. logger
  ```


# 1. ned-settings oneaccess-oneos
---------------------------------

  oneaccess-oneos ned-settings.


    - oneaccess-oneos extended-parser <enum> (default auto)

      Make the NED enable extensions to ease the task of the NSO CLI command parser. A common
      problem with this parser is that it can easily get lost when trying to parse configuration not
      supported by the YANG model. In particular it is very sensitive for unsupported config that
      generates a mode switch.

      auto            - Uses turbo-mode when available, will use fastest availablemethod to load
                        data to NSO. If NSO doesn't support data-loading from CLI NED, robust-mode
                        is used.

      robust-mode     - The configuration dump is run through a pre-parser which is cleaning it from
                        all elements currently not supported in the YANG model (default).

      turbo-mode      - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO using a
                        Maapi SetValues() call.

      turbo-xml-mode  - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO in XML
                        format.


# 2. ned-settings oneaccess-oneos live-status
---------------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


# 3. ned-settings oneaccess-oneos connection
--------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection ssh client <enum> (default default)

      default  - default.

      sshj     - sshj.

      ganymed  - ganymed.


    - connection ssh keyboard-interactive <true|false> (default false)

      Enable this when the ssh connection is done via Duo push or similar keyboard
      interactive methods


# 4. ned-settings oneaccess-oneos proxy
---------------------------------------

  Configure NED to access device via a proxy.


    - proxy remote-connection <enum>

      Connection type between proxy and device.

      ssh     - SSH jump host proxy.

      telnet  - TELNET jump host proxy.

      serial  - Terminal server proxy.


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


    - proxy authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy proxy-prompt <string>

      Prompt pattern on the proxy host.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection (appended to end of ssh cmd line).


# 5. ned-settings oneaccess-oneos proxy-2
-----------------------------------------

  Configure NED to access device via a second proxy.


    - proxy-2 remote-connection <enum>

      Connection type between proxy and device.

      ssh     - SSH jump host proxy.

      telnet  - TELNET jump host proxy.

      serial  - Terminal server proxy.


    - proxy-2 remote-address <union>

      Address of host behind the proxy.


    - proxy-2 remote-port <uint16>

      Port of host behind the proxy.


    - proxy-2 remote-command <string>

      Connection command used to initiate proxy on device. Optional for ssh/telnet. Accepts
      $(proxy/remote-xxx) for inserting remote-xxx config.


    - proxy-2 remote-name <string>

      User name on the device behind the proxy.


    - proxy-2 remote-password <string>

      Password on the device behind the proxy.


    - proxy-2 authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy-2 proxy-prompt <string>

      Prompt pattern on the proxy host.


    - proxy-2 remote-ssh-args <string>

      Additional arguments used to establish proxy connection (appended to end of ssh cmd line).


# 6. ned-settings oneaccess-oneos developer
-------------------------------------------

  Contains settings used by the NED developers.


    - developer prepare-dry-model <WORD>

      Specify temporary device model for prepare-dry output.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level reported by the NED. Default debug.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with IPC messages.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer trace-level <uint8> (default 6)

      DEPRECATED and not used.


    - developer trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


# 7. ned-settings oneaccess-oneos write
---------------------------------------

  Settings used when writing to device.


    - write memory-setting <enum> (default persist)

      Select the config persistence method for ONEOS device (default is 'persist').

      persist  - Save device config to persistent storage as part of NCS transaction (default).

      none     - Never save config on device as part of NCS transaction.


## 7.1. ned-settings oneaccess-oneos write config-warning
---------------------------------------------------------

  Device warning regex entry list.

    - write config-warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.* creating vlan.


# 8. ned-settings oneaccess-oneos console
-----------------------------------------

  Settings used while interacting with a device.


    - console ignore-errors <true|false> (default false)

      Flag indicating if errors should be ignored.


    - console ignore-warnings <true|false> (default false)

      Flag indicating if warnings should be ignored.


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


    - console line-feed <string>

      Overwrites default line-feed character.


    - console obfuscate-secret <true|false>

      Secrets will be obfuscated in trace & log files.


## 8.1. ned-settings oneaccess-oneos console extension warning
--------------------------------------------------------------

  Extend which messages to ignore warnings/errors etc.

    - console extension warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.*.


## 8.2. ned-settings oneaccess-oneos console extension command
--------------------------------------------------------------

  Extend available commands to send.

    - console extension command <name> <data>

      - name <string>

        Key id of the command.

      - data <string>

        Command.


## 8.3. ned-settings oneaccess-oneos console extension pattern
--------------------------------------------------------------

  Extend available patterns to expect.

    - console extension pattern <name> <data>

      - name <string>

        Key id of the pattern.

      - data <string>

        A regular expression.


## 8.4. ned-settings oneaccess-oneos console extension action
-------------------------------------------------------------

  Extend available actions to perform.

    - console extension action <name> <init> <flush>

      - name <string>

        A name for the action.

      - init <string>

        Command sent to intialize action.

      - flush <true|false>

        Flush device buffer once action is completed.


### 8.4.1. ned-settings oneaccess-oneos console extension action state
----------------------------------------------------------------------

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


# 9. ned-settings oneaccess-oneos logger
----------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


