# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/redback-se/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/redback-se/
  device
    /ncs:/device/devices/device:<name>/ned-settings/redback-se/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings redback-se

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings redback-se
  2. live-status
     2.1. auto-prompts
  3. remove-sync-from-config
  4. connection
  5. proxy
  6. proxy-2
  7. logger
  ```


# 1. ned-settings redback-se
----------------------------

  redback-se ned-settings.


    - redback-se redback-se-transaction-id-method <enum> (default last-config-change)

      Method of the redback NED to use for calculating a transaction id. Typically used for
      check-sync operations.

      config-hash         - Calculate MD5 on a snapshot of the entire running config for
                            calculation.

      last-config-change  - Use the 'Last configuration change' timestamp in running config only.
                            (WARNING: may be changed at reboot) (Default).


    - redback-se disable-context-configs <true|false> (default false)

      sync-from can take a lot of time when the device contains a lot of context config.
      If the context config is not used, sync-from would speed up if context was removed from the result.

      Solutions in NED:
      By default context config is enabled.
      To disable context config, set redback-se/disable-context-configs ned-settings to true.
      This setting will remove context from syncing and will disable the possibility to configure context.
      Example of disable context config:
      admin@ncs(config)# devices device <redback-se> ned-settings redback-se disable-context-configs true
      admin@ncs(config)# commit
      Commit complete.
      admin@ncs(config)# devices device <redback-se> disconnect
      admin@ncs(config)# devices device <redback-se> sync-from
      result true
      admin@ncs(config)#
      Note that in order for the ned-settings to take effect, you
      must disconnect and connect again, to re-read ned-settings.


    - redback-se extended-parser <enum> (default auto)

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


# 2. ned-settings redback-se live-status
----------------------------------------

  Configure NED settings related to live-status.


## 2.1. ned-settings redback-se live-status auto-prompts
--------------------------------------------------------

  Generally the command output parsing halts when the NED detects
  an operational or config prompt, however sometimes the command
  requests additional input, 'answer(s)' to questions.

    - live-status auto-prompts <id> <question> <answer>

      - id <WORD>

        List id, any string.

      - question <WORD>

        Device question, regular expression.

      - answer <WORD>

        Answer to device question.

    Use this ned-setting to create auto-prompt question and answer, like below
    devices global-settings ned-settings redback-se live-status auto-prompts Q1 question "<question>" answer "<answer>"
    below are some examples of auto-prompts ned-settings:
        devices global-settings ned-settings redback-se live-status auto-prompts Q1 question "Target IP address: $" answer "1.1.1.1"
        devices global-settings ned-settings redback-se live-status auto-prompts Q2 question "Repeat count .*: $" answer "5"
        devices global-settings ned-settings redback-se live-status auto-prompts Q3 question "ICMP datagram size .*: $" answer "36"
        devices global-settings ned-settings redback-se live-status auto-prompts Q4 question "Timeout in seconds .*: $" answer "3"
        devices global-settings ned-settings redback-se live-status auto-prompts Q5 question "Extended commands .*: $" answer "n"
    Note that in order for the ned-settings to take effect, you
        must disconnect and connect again, to re-read ned-settings.


# 3. ned-settings redback-se remove-sync-from-config
----------------------------------------------------

  This setting can be used ignore/filter configs in sync-from.
  There may be few commands NSO not authorized to configure on device,
  or in some scenario if we want to filter/ignore certain configs in sync-from.

    - redback-se remove-sync-from-config <regex>

      - regex <WORD>

        command regular expression, e.g. "\s*system hostname .*".

    remove-sync-from-config is a regular expression string list of
      configs that should also be ignored/filtered in sync-from.
    For example, to add a new entry:
    admin@ncs(config)# devices device redbackdev ned-settings redback-se remove-sync-from-config "system hostname.*"
      # commit
      Commit complete.
      # devices device redbackdev disconnect
      # devices device redbackdev connect
      # devices device redbackdev sync-from
    Note that in order for the ned-settings to take effect, you
      must disconnect and connect again, to re-read ned-settings.


# 4. ned-settings redback-se connection
---------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection send-yes-on-low-resources-warning <true|false> (default false)

      Ignore low resources warning after ssh/telnet connection.


# 5. ned-settings redback-se proxy
----------------------------------

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


# 6. ned-settings redback-se proxy-2
------------------------------------

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


# 7. ned-settings redback-se logger
-----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


