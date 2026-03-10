# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/hpe-ihss/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/hpe-ihss/
  device
    /ncs:/device/devices/device:<name>/ned-settings/hpe-ihss/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings hpe-ihss

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings hpe-ihss
  2. proxy
  3. connection
     3.1. ENTITY
          3.1.1. KEYS
                 3.1.1.1. PATTERN
  4. console
     4.1. warning
     4.2. command
     4.3. pattern
     4.4. action
          4.4.1. state
  5. logger
  6. developer
  ```


# 1. ned-settings hpe-ihss
--------------------------


    - hpe-ihss extended-parser <enum> (default auto)

      Make the cisco-nx NED handle CLI parsing (i.e. transform the running-config from the device to
      the model based config tree).

      auto            - Uses turbo-mode when available, will use fastest availablemethod to load
                        data to NSO.

      turbo-mode      - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO using maapi
                        setvalues call.

      turbo-xml-mode  - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO in XML
                        format.


# 2. ned-settings hpe-ihss proxy
--------------------------------

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

      Prompt pattern on the proxy host before connecting to device.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


# 3. ned-settings hpe-ihss connection
-------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection character-set <string> (default UTF-8)

      Character set to use for telnet session.


    - connection device-capabilities disable-probe <true|false> (default true)

      Set as true in order to bypass the device probe when connecting.


    - connection device-capabilities commit <true|false> (default true)


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


## 3.1. ned-settings hpe-ihss connection sync ENTITY
----------------------------------------------------

    - connection sync ENTITY <ENTITY>

      - ENTITY <enum>

        HOMEADDR        - HOMEADDR.

        GSUB            - GSUB.

        EPSSUB          - EPSSUB.

        COSPAPN         - COSPAPN.

        PDPCTXCOS       - PDPCTXCOS.

        APNCONFIGENTRY  - APNCONFIGENTRY.


### 3.1.1. ned-settings hpe-ihss connection sync ENTITY KEYS
------------------------------------------------------------

    - KEYS <PATTERN_TYPE>

      - PATTERN_TYPE <STRING<length:1-6><default:IMSI>>

        The identifying key or subscriber identity type used to represent a subscriber for the
        purpose of finding the HLR number.

        <NONE>  - <NONE>.

        IMSI    - IMSI.

        MSISDN  - MSISDN.

        SMSC    - SMSC.

        ExtId   - ExtId.

        IMPI    - IMPI.

        IMPU    - IMPU/PSI.

        .       - Any.

        APN     - APN.


#### 3.1.1.1. ned-settings hpe-ihss connection sync ENTITY KEYS PATTERN
-----------------------------------------------------------------------

    - PATTERN <PATTERN>

      - PATTERN <STRING<default:.>>

        The pattern used to find the most specific subscriber match during Pattern Matching and Data
        Retrieval (PMDR) lookups.


# 4. ned-settings hpe-ihss console
----------------------------------

  Settings used while interacting with a device.


    - console ignore-errors <true|false> (default false)

      Flag indicating if errors should be ignored.


    - console ignore-warnings <true|false> (default false)

      Flag indicating if warnings should be ignored.


    - console ignore-retries <true|false> (default false)

      Flag indicating if retries should be ignored.


    - console max-retries <uint16> (default 100)

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


## 4.1. ned-settings hpe-ihss console extension warning
-------------------------------------------------------

  Device warning regex entry list. Use to ignore warnings/errors etc.

    - console extension warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.*.


## 4.2. ned-settings hpe-ihss console extension command
-------------------------------------------------------

  Extend available commands to send.

    - console extension command <name> <data>

      - name <string>

        Key id of the command.

      - data <string>

        Command.


## 4.3. ned-settings hpe-ihss console extension pattern
-------------------------------------------------------

  Extend available patterns to expect.

    - console extension pattern <name> <data>

      - name <string>

        Key id of the pattern.

      - data <string>

        A regular expression.


## 4.4. ned-settings hpe-ihss console extension action
------------------------------------------------------

  Extend available actions to perform.

    - console extension action <name> <init> <flush>

      - name <string>

        A name for the action.

      - init <string>

        Command sent to intialize action.

      - flush <true|false>

        Flush device buffer once action is completed.


### 4.4.1. ned-settings hpe-ihss console extension action state
---------------------------------------------------------------

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


# 5. ned-settings hpe-ihss logger
---------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 6. ned-settings hpe-ihss developer
------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


    - developer trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log
      file

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


