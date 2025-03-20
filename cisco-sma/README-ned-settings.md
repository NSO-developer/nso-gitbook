# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-sma/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-sma/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-sma/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-sma

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-sma
  2. developer
  3. proxy
  4. proxy-2
  5. connection
  6. console
     6.1. warning
     6.2. command
     6.3. pattern
     6.4. action
          6.4.1. state
  7. logger
  8. live-status
  ```


# 1. ned-settings cisco-sma
---------------------------


# 2. ned-settings cisco-sma developer
-------------------------------------

  Contains settings used by the NED developers.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


    - developer load-from-file <string>

      Make the NED load a file containing raw device config when doing sync-from.


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


# 3. ned-settings cisco-sma proxy
---------------------------------

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

    Do as follows to setup to connect to a SMA device that resides
    behind a proxy or terminal server:

    +-----+  A   +-------+   B  +-----+
    | NCS | <--> | proxy | <--> | SMA |
    +-----+      +-------+      +-----+

    Setup connection (A):

    # devices device <smadev> address <proxy address>
    # devices device <smadev> port <proxy port>
    # devices device <smadev> device-type cli protocol <proxy proto - telnet or ssh>
    # devices authgroups group ciscogroup umap admin remote-name <proxy username>
    # devices authgroups group ciscogroup umap admin remote-password <proxy password>
    # devices device <smadev> authgroup ciscogroup

    Setup connection (B):

    Define the type of connection to the device:

    # devices device <smadev> ned-settings cisco-sma proxy remote-connection <ssh|telnet>

    Define login credentials for the device:

    # devices device <smadev> ned-settings cisco-sma proxy remote-name <user name on the SMA device>
    # devices device <smadev> ned-settings cisco-sma proxy remote-password <password on the SMA device>

    Define prompt on proxy server:

    # devices device <smadev> ned-settings cisco-sma proxy proxy-prompt <prompt pattern on proxy>

    Define address and port of SMA device:

    # devices device <smadev> ned-settings cisco-sma proxy remote-address <address to the SMA device>
    # devices device <smadev> ned-settings cisco-sma proxy remote-port <port used on the SMA device>
    # commit

    Complete example config:

    devices authgroups group jump-server default-map remote-name MYUSERNAME remote-password MYPASSWORD
    devices device sma-via-1234 address 1.2.3.4 port 22
    devices device sma-via-1234 authgroup jump-server device-type generic ned-id cisco-sma
    devices device sma-via-1234 connect-timeout 60 read-timeout 120 write-timeout 120
    devices device sma-via-1234 state admin-state unlocked
    devices device sma-via-1234 ned-settings cisco-sma proxy remote-connection telnet
    devices device sma-via-1234 ned-settings cisco-sma proxy proxy-prompt ".*#"
    devices device sma-via-1234 ned-settings cisco-sma proxy remote-address 5.6.7.8
    devices device sma-via-1234 ned-settings cisco-sma proxy remote-port 23
    devices device sma-via-1234 ned-settings cisco-sma proxy remote-name admin
    devices device sma-via-1234 ned-settings cisco-sma proxy remote-password admin987


# 4. ned-settings cisco-sma proxy-2
-----------------------------------

  Configure NED to access device via a second proxy.


    - proxy-2 remote-connection <enum>

      Connection type between proxy and device.

      ssh     - ssh.

      telnet  - telnet.

      serial  - serial.


    - proxy-2 remote-address <union>

      Address of host behind the proxy.


    - proxy-2 remote-port <uint16>

      Port of host behind the proxy.


    - proxy-2 remote-name <string>

      User name on the device behind the proxy.


    - proxy-2 remote-password <string>

      Password on the device behind the proxy.


    - proxy-2 proxy-prompt <string>

      Prompt pattern on the proxy host before connecting to device.


    - proxy-2 remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


# 5. ned-settings cisco-sma connection
--------------------------------------

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

      Configure the maximum number of extra retries the NED will try to
      connect to the device before giving up. Range 0-255. Default 1.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each
      connect retry. Range 1-255. Default 1 second.


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


# 6. ned-settings cisco-sma console
-----------------------------------

  Settings used while interacting with a device.


    - console ignore-errors <true|false>

      If set to true the ned will ignore any error messages while applying the
      configuration. Please note that this can lead to NSO being out of sync
      with the device, since some commands might not be accepted.


    - console ignore-warnings <true|false>

      If set to true the ned will ignore any warning messages while applying the
      configuration. Please note that this can lead to NSO being out of sync
      with the device, since some commands might not be accepted.


    - console ignore-retries <true|false>

      Flag indicating if retries should be ignored.


    - console max-retries <uint16>

      Changes the maximum number of attempts to get a device to accept a
      configuration command.


    - console retry-delay <uint16>

      Changes the delay in milliseconds that the ned will wait before
      resending a failed command.


    - console send-delay <uint32>

      Enable delay before sending commands.


    - console expect-timeout <uint32>

      Changes the default timeout in milliseconds that the ned will wait for
      a configuration command to be accepted.


    - console chunk-size <uint8>

      This config allows the NED to send several commands at once. Please note
      that error and retry handling will not work as expected, if the the size
      is set to greater than 1, since the NED evaluates the success of each
      chunk sent.


    - console line-feed <string>

      Overwrites default line-feed character.


    - console obfuscate-secret <true|false>

      Secrets will be obfuscated in trace & log files.


## 6.1. ned-settings cisco-sma console extension warning
--------------------------------------------------------

  Add regular expressions for warnings etc. which the ned should ignore when
  applying the configuration on a device.

    - console extension warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.*.


## 6.2. ned-settings cisco-sma console extension command
--------------------------------------------------------

  Extend available commands to send.

    - console extension command <name> <data>

      - name <string>

        Key id of the command.

      - data <string>

        Command.


## 6.3. ned-settings cisco-sma console extension pattern
--------------------------------------------------------

  Extend available patterns to expect.

    - console extension pattern <name> <data>

      - name <string>

        Key id of the pattern.

      - data <string>

        A regular expression.


## 6.4. ned-settings cisco-sma console extension action
-------------------------------------------------------

  Extend available actions to perform.

    - console extension action <name> <init> <flush>

      - name <string>

        A name for the action.

      - init <string>

        Command sent to intialize action.

      - flush <true|false>

        Flush device buffer once action is completed.


### 6.4.1. ned-settings cisco-sma console extension action state
----------------------------------------------------------------

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


# 7. ned-settings cisco-sma logger
----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 8. ned-settings cisco-sma live-status
---------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      This ned-setting is used to configure the time to live value in
      seconds for data fetched through the live-status hooks.
      The default value is 50 seconds.


# 9.Configure the NED using ned-settings
---------------------------------------

  The cisco-sma NED can be configured using the cisco-sma
  ned-settings config, located in three different locations;
  global, profile and device specific:

  /ncs:devices/global-settings/ned-settings/cisco-sma/
  /ncs:devices/ncs:profiles/profile:cisco-sma/ned-settings/cisco-sma/
  /ncs:/device/devices/device:<smadev>/ned-settings/cisco-sma/

  Note: profiles setting overrides global-settings and device settings
  override profile settings, hence the narrowest scope of the setting
  is used by the device.

  Note: if you change a ned-setting you must reconnect to the device,
  i.e. disconnect and connect in order for the new setting(for all above ned-setting) to take effect.
