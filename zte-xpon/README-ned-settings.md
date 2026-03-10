# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/zte-xpon/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/zte-xpon/
  device
    /ncs:/device/devices/device:<name>/ned-settings/zte-xpon/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings zte-xpon

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings zte-xpon
  2. live-status
  3. connection
  4. proxy
  5. proxy-2
  6. developer
  7. console
     7.1. warning
     7.2. command
     7.3. pattern
     7.4. action
          7.4.1. state
  8. logger
  ```


# 1. ned-settings zte-xpon
--------------------------

  Per-device settings for zte-xpon.


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


    - internal-xml-transfer-timeout <uint32> (default 2147483647)

      Configure maximum time in milliseconds allowed for transferring XML from NED to NSO.


    - use-write <true|false> (default true)

      -  set to True to send WRITE command at commit (Default)
      -  set to False to skip sending WRITE command


    - wait-time <uint32> (default 0)

      Some devices need more time to process some commands, before
      accepting others.
      E.g:  interface gpon-olt_*/onu */type *
      The  ned-settings zte-xpon wait-time is the value in seconds to wait after the
      above command was sent to the device.


# 2. ned-settings zte-xpon live-status
--------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


# 3. ned-settings zte-xpon connection
-------------------------------------

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


    - connection ssh keep-alive-interval <seconds> (default 0)

      Configure SSH client keep alive interval in seconds, default 0 (i.e. no keep-alive). The
      keep-alive is implemented in the client by sending an ssh 'ignore' message on the given
      interval.


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


    - connection terminal server-echo <true|false> (default false)

      Enable (TELNET) server echo, i.e. use DO ECHO instead of DONT ECHO.


    - connection terminal println-mode <enum> (default default)

      default  - System property line.separator default.

      ocrnl    - Translate carriage return to newline.

      onocr    - Translate newline to carriage return-newline.

      onlret   - Newline performs a carriage return.


    - connection device-prompt <REGEXP> (default \A[\S ]+#[ ]?$)

      When doing a READ, the ned will do a "show configuration" command and get everything until the prompt occurs. 
      To do that, we need a prompt regexp match. By default it is set to "\A[\S ]+#[ ]?$". In cases where the device actually 
      contains a configuration matching the prompt (e.g digit-map), there will be an early stop at reading the running config,
      caused by the false match. This can be avoided by changing the regexp to properly match the device prompt


# 4. ned-settings zte-xpon proxy
--------------------------------

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


# 5. ned-settings zte-xpon proxy-2
----------------------------------

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


# 6. ned-settings zte-xpon developer
------------------------------------

  Contains settings used by the NED developers.


    - developer load-from-file <string>

      Make the NED load a file containing raw device config when doing sync-from. Does only work on
      NETSIM targets.


    - developer model <uint32>

      Simulate a model number.


    - developer version <uint8>

      Simulate a version number.


    - developer device-type <enum> (default netsim)

      Real or simulated device.

      netsim  - netsim.

      device  - device.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level reported by the NED. Default debug.

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


# 7. ned-settings zte-xpon console
----------------------------------

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


## 7.1. ned-settings zte-xpon console extension warning
-------------------------------------------------------

  Extend which messages to ignore warnings/errors etc.

    - console extension warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.*.


## 7.2. ned-settings zte-xpon console extension command
-------------------------------------------------------

  Extend available commands to send.

    - console extension command <name> <data>

      - name <string>

        Key id of the command.

      - data <string>

        Command.


## 7.3. ned-settings zte-xpon console extension pattern
-------------------------------------------------------

  Extend available patterns to expect.

    - console extension pattern <name> <data>

      - name <string>

        Key id of the pattern.

      - data <string>

        A regular expression.


## 7.4. ned-settings zte-xpon console extension action
------------------------------------------------------

  Extend available actions to perform.

    - console extension action <name> <init> <flush>

      - name <string>

        A name for the action.

      - init <string>

        Command sent to intialize action.

      - flush <true|false>

        Flush device buffer once action is completed.


### 7.4.1. ned-settings zte-xpon console extension action state
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


# 8. ned-settings zte-xpon logger
---------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


