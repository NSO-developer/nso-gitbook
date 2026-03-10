# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/accedian-spp/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/accedian-spp/
  device
    /ncs:/device/devices/device:<name>/ned-settings/accedian-spp/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings accedian-spp

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings accedian-spp
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
  7. live-status
     7.1. auto-prompts
  ```


# 1. ned-settings accedian-spp
------------------------------


    - extended-parser <enum> (default auto)

      Make the accedian-spp NED handle CLI parsing (i.e. transform the running-config from the
      device to the model based config tree).

      disabled        - Load configuration the standard way.

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

      auto            - Uses turbo-mode when available, will use fastest availablemethod to load
                        data to NSO.


    - trans-id-from-conf-changes <true|false> (default false)

      EXPERIMENTAL. Enables trans-id fetching with the
      'configuration changes' command sent to device.


# 2. ned-settings accedian-spp developer
----------------------------------------

  Contains settings used by the NED developers.


    - developer load-from-file <string>

      Make the NED load a file containing raw device config when doing sync-from. Does only work on
      NETSIM targets.


    - developer commit-wait-time <uint16> (default 1000)

      This ned-setting is used to add a sleep timer for the NED
      after sending a commit to the device. This is useful to give
      the device a small break to parse whatever config it has
      been given. Default setting is 1000 ms (1 second).
      Netsim device will not take this ned-setting into account.


    - developer delete-remote-devices-wait-time <uint16> (default 1000)

      This ned-setting is used to add a sleep timer for the NED
      after sending a 'remote-devices delete <name>' command to the device.
      This is useful to avoid false errors like: 'Error: Filter in use',
      that occurs when a filter is deleted immediately after its related
      remote-devices context was deleted.
      Default setting is 1000 ms (1 second).
      Netsim device will not take this ned-setting into account.


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


# 3. ned-settings accedian-spp proxy
------------------------------------

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


# 4. ned-settings accedian-spp connection
-----------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


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


# 5. ned-settings accedian-spp console
--------------------------------------

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


## 5.1. ned-settings accedian-spp console extension warning
-----------------------------------------------------------

  Device warning regex entry list. Use to ignore warnings/errors etc.

    - console extension warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.*.


## 5.2. ned-settings accedian-spp console extension command
-----------------------------------------------------------

  Extend available commands to send.

    - console extension command <name> <data>

      - name <string>

        Key id of the command.

      - data <string>

        Command.


## 5.3. ned-settings accedian-spp console extension pattern
-----------------------------------------------------------

  Extend available patterns to expect.

    - console extension pattern <name> <data>

      - name <string>

        Key id of the pattern.

      - data <string>

        A regular expression.


## 5.4. ned-settings accedian-spp console extension action
----------------------------------------------------------

  Extend available actions to perform.

    - console extension action <name> <init> <flush>

      - name <string>

        A name for the action.

      - init <string>

        Command sent to intialize action.

      - flush <true|false>

        Flush device buffer once action is completed.


### 5.4.1. ned-settings accedian-spp console extension action state
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


# 6. ned-settings accedian-spp logger
-------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default debug)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 7. ned-settings accedian-spp live-status
------------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


## 7.1. ned-settings accedian-spp live-status auto-prompts
----------------------------------------------------------

  Generally the command output parsing halts when the NED detects
  an operational or config prompt, however sometimes the command
  requests additional input, "answer(s)" to questions.

  Use "EXIT" in answer to Halt parsing and return output

  Use this ned-setting to create auto-prompt question and answer,
  example with "remote-devices factory-reset <remote-device>" command below:

  # devices device sppdevicename ned-settings accedian-spp live-status auto-prompts test question ".*Are you sure you want to factory-reset this device \? \(yes/no\):" answer yes

    - live-status auto-prompts <id> <question> <answer>

      - id <WORD>

        List id, any string.

      - question <WORD>

        Device question, regular expression.

      - answer <WORD>

        Answer to device question.


