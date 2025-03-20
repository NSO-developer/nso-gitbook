# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/extreme-xos/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/extreme-xos/
  device
    /ncs:/device/devices/device:<name>/ned-settings/extreme-xos/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings extreme-xos

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings extreme-xos
  2. developer
  3. platform
  4. proxy
  5. connection
  6. console
     6.1. warning
     6.2. command
     6.3. pattern
     6.4. action
          6.4.1. state
  7. logger
  8. write
     8.1. inject-command
  ```


# 1. ned-settings extreme-xos
-----------------------------


    - extreme-xos extended-parser <enum> (default turbo-mode)

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

      robust-mode     - Makes the NED filter the configuration so that unmodeled content is removed
                        before being passed to the NSO CLI-engine. This protects against
                        configuration ending up at the wrong level when NSO CLI parser fallbacks
                        (which potentially can cause following config to be skipped).


# 2. ned-settings extreme-xos developer
---------------------------------------

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


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer progress-verbosity <enum> (default verbose)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


# 3. ned-settings extreme-xos platform
--------------------------------------

  Platform info overrides.


    - platform model <string>

      Override device model name/number.


    - platform name <string>

      Override device name.


    - platform version <string>

      Override device version.


# 4. ned-settings extreme-xos proxy
-----------------------------------

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


# 5. ned-settings extreme-xos connection
----------------------------------------

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


# 6. ned-settings extreme-xos console
-------------------------------------

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


    - console obfuscate-secret <true|false> (default true)

      Secrets will be obfuscated in trace & log files.


## 6.1. ned-settings extreme-xos console extension warning
----------------------------------------------------------

  Device warning regex entry list. Use to ignore warnings/errors etc.

    - console extension warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.*.


## 6.2. ned-settings extreme-xos console extension command
----------------------------------------------------------

  Extend available commands to send.

    - console extension command <name> <data>

      - name <string>

        Key id of the command.

      - data <string>

        Command.


## 6.3. ned-settings extreme-xos console extension pattern
----------------------------------------------------------

  Extend available patterns to expect.

    - console extension pattern <name> <data>

      - name <string>

        Key id of the pattern.

      - data <string>

        A regular expression.


## 6.4. ned-settings extreme-xos console extension action
---------------------------------------------------------

  Extend available actions to perform.

    - console extension action <name> <init> <flush>

      - name <string>

        A name for the action.

      - init <string>

        Command sent to intialize action.

      - flush <true|false>

        Flush device buffer once action is completed.


### 6.4.1. ned-settings extreme-xos console extension action state
------------------------------------------------------------------

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


# 7. ned-settings extreme-xos logger
------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 8. ned-settings extreme-xos write
-----------------------------------

  Settings used when writing to device.


## 8.1. ned-settings extreme-xos write inject-command
-----------------------------------------------------

  This ned-setting list can be used to inject commands (e.g. config
  lines) when writing to the device (i.e. upon commit). This can be
  used, for example, to undo undesired dynamic config automatically
  set by the device.
  Example: toogling the policy when modifying it:

  admin@ncs(config-device-exos-30.5)# ned-settings extreme-xos write inject-command c1 config-line "(?:un)?configure policy.*" command "enable policy" after-each        
  admin@ncs(config-device-exos-30.5)# ned-settings extreme-xos write inject-command c2 config-line "(?:un)?configure policy.*" command "disable policy" before-each
  admin@ncs(config-device-exos-30.5)# commit

  admin@ncs(config-device-exos-30.5)# config 

  admin@ncs(config-config)# configure policy rule-model access-list 
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
  device {
  name exos-30.5
  data disable policy
  configure policy rule-model access-list
  enable policy
  }
  }
  admin@ncs(config-config)# 

  admin@ncs(config-config)# configure policy profile 2 access-list ACL2
  admin@ncs(config-config)# configure policy profile 3 access-list ACL3
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
  device {
  name vz32
  data disable policy
  configure policy profile 2 name ACL2 access-list ACL2
  configure policy profile 3 name ACL3 access-list ACL3
  enable policy
  }
  }

    - write inject-command <id> <config-line> <command> <where>

      - id <WORD>

        List id, any string.

      - config-line <WORD>

        The config line where command should be injected (DOTALL regex) [optional].

      - command <WORD>

        The command to inject after|before config-line.

      - where <enum>

        before-each     - insert command before each matching <config-line>.

        before-first    - insert command before first matching <config-line>.

        after-each      - insert command after each matching <config-line>.

        after-last      - insert command after last matching <config-line>.

        before-topmode  - insert command before regex <config-line> topmode.

        after-topmode   - insert command after regex <config-line> topmode.

        first           - inject command first if regex <config-line> matches or is unset.

        last            - inject command last if regex <config-line> matches or is unset.


