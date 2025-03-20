# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/arista-dcs/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/arista-dcs/
  device
    /ncs:/device/devices/device:<name>/ned-settings/arista-dcs/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings arista-dcs

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings arista-dcs
  2. proxy
  3. connection
  4. logger
  5. live-status
  6. read
     6.1. show-running-all-match-pattern
  7. write
  ```


# 1. ned-settings arista-dcs
----------------------------

  arista-dcs ned-settings.


    - arista-dcs extended-parser <enum> (default auto)

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


# 2. ned-settings arista-dcs proxy
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


    - proxy proxy-prompt <string>

      Prompt pattern on the proxy host.


    - proxy remote-prompt <string>

      Prompt pattern on the remote (proxy) host.


    - proxy remote-name <string>

      User name on the device behind the proxy.


    - proxy remote-password <string>

      Password on the device behind the proxy.


# 3. ned-settings arista-dcs connection
---------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection connector <WORD>

      Change the default connector, e.g. 'ned-connector-default.json'.


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


# 4. ned-settings arista-dcs logger
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


# 5. ned-settings arista-dcs live-status
----------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


    - live-status auto-prompts <id> <question> <answer>

      See chapter 5 in README.md for information on this ned-setting.

      - id <WORD>

        List id, any string.

      - question <WORD>

        Device question, regular expression.

      - answer <WORD>

        Answer to device question.


# 6. ned-settings arista-dcs read
---------------------------------

  Settings used when reading from device.


    - read show-running-method <command> (default show running-config)

      Normally the NED uses "show running-config" to show configuration.
      This can be changed using this ned-setting, for example:

      devices device dev-1 ned-settings arista-dcs read show-running-method
                                             "show running-config all | include (interface Ethernet)"

      Note: Using custom show running-config commands could lead to NED
      unexpected behavior and performance issues, therefore it is strongly
      recommended to be careful with it.


## 6.1. ned-settings arista-dcs read show-running-all-match-pattern
-------------------------------------------------------------------

  The list of the patterns included in the "show running-config all" command, for example:

  devices device arista ned-settings arista-dcs read show-running-all-match-pattern "^logging trap"
  devices device arista ned-settings arista-dcs read show-running-all-match-pattern "^aaa authorization config-commands"

    - read show-running-all-match-pattern <regexp>

      - regexp <WORD>

        Regular Expression.


# 7. ned-settings arista-dcs write
----------------------------------

  Settings used when writing to device.


    - write interface-mac-address-learning-wait-before-configure <uint16> (default 0)

      This setting allows for configuring a small delay before setting of an interface 'mac address
      learning disabled'. Some use cases require a small delay before this configuration being
      available.


    - write memory-setting <enum> (default on-commit)

      Configure how and when an applied config is saved to persistent memory on the device.

      on-commit   - Save configuration immediately after the config has been successfully applied on
                    the device. If an error occurs when saving the whole running config will be
                    rolled back.

      on-persist  - Save configuration during the NED persist handler. Called after the config has
                    been successfully applied and commited If an error occurs when saving an alarm
                    will be triggered. No rollback of the running config is done.

      disabled    - Disable saving the applied config to persistent memory.


