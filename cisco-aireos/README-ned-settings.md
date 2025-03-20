# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-aireos/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-aireos/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-aireos/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-aireos

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-aireos
  2. cisco-aireos-config-warning
  3. cisco-aireos-remove-sync-from-config
  4. cisco-aireos-cached-show-enable
  5. live-status
     5.1. auto-prompts
  6. connection
  7. proxy
  8. logger
  ```


# 1. ned-settings cisco-aireos
------------------------------


    - cisco-aireos use-startup-commands <true|false> (default false)

      This ned-setting executes 'show run-config startup-commands' in sync-from.
      By default executing 'show run-config startup-commands' is disabled.

      For example, to enable startup-commands:
      admin@ncs(config)# devices device aireosdev ned-settings cisco-aireos use-startup-commands true
          admin@ncs(config)# commit
          Commit complete.
          admin@ncs(config)# devices device aireosdev disconnect
          admin@ncs(config)# devices device aireosdev connect
          result true
          info (admin) Connected to aireosdev
          admin@ncs(config)# devices device aireosdev sync-from
          result true
          admin@ncs(config)
      Note that in order for the above ned-setting to take effect, you
          must disconnect and connect again, to re-read ned-settings.


    - cisco-aireos extended-parser <enum> (default auto)

      Make the cisco-aireos NED handle CLI parsing (i.e. transform the running-config from the
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
                        data to NSO. If NSO doesn't support data-loading from CLI NED, robust-mode
                        is used.


# 2. ned-settings cisco-aireos cisco-aireos-config-warning
----------------------------------------------------------

  This section describes how device output (warnings/errors) can be filtered.

    - cisco-aireos cisco-aireos-config-warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. .* does not exist.*.

    After having sent a config command to the device the NED will treat
    any text reply as an error and abort the transaction. The config
    command that caused the failed transaction will be shown together
    with the error message returned by the device. Sometimes the text
    message is not an actual error. It could be a warning that should be
    ignored. The NED has a static list of known warnings, presently these:

          // general
          "deleted auth-list entry",
          "warning! system name change disrupts the existing rf grouping.",
          "ssid updated successfully."

          etc

    If you stumble upon a warning not already in the NED, which is quite
    likely due to the large number of warnings, you can configure the
    NED to ignore them using this ned-setting.

    The list key is a regular expression with a warning that should be
    ignored.

    For example, to add a new warning exception:

     admin@ncs(config)# devices global-settings ned-settings 
          cisco-aireos cisco-aireos-config-warning "Failed in adding cpu acl rule"
     admin@ncs(config)# commit
     Commit complete.
     admin@ncs(config)# devices device aireosdev disconnect
     admin@ncs(config)# devices device aireosdev connect
     result true
     info (admin) Connected to aireosdev

    Note that in order for the above ned-setting to take effect, you
    must disconnect and connect again, to re-read ned-settings.


# 3. ned-settings cisco-aireos cisco-aireos-remove-sync-from-config
-------------------------------------------------------------------

  This section describes how to remove/filter configs during sync-from.

    - cisco-aireos cisco-aireos-remove-sync-from-config <remove-config>

      - remove-config <WORD>

        command regular expression, e.g. "\s*rogue client alert .*".

    For example:

    To add a new config to remove:

     admin@ncs(config)# devices device aireosdev ned-settings cisco-aireos 
          cisco-aireos-remove-sync-from-config "\s*rogue client alert .*"
     admin@ncs(config)# commit
     Commit complete.
     admin@ncs(config)# devices device aireosdev disconnect
     admin@ncs(config)# devices device aireosdev sync-from
     result true
     admin@ncs(config)#

    Note that in order for the above ned-setting to take effect, you
    must disconnect and connect again, to re-read ned-settings.


# 4. ned-settings cisco-aireos cisco-aireos-cached-show-enable
--------------------------------------------------------------

  This ned-setting is used to inject settings of some show commands
  into the config, when reading from device. The following show
  commands have some cached info


    - cisco-aireos-cached-show-enable version <true|false> (default true)

      Enable caching of some output of 'show sysinfo' command (enabled by default).

    For example:

    show sysinfo

    The injected config can be usable in service code to check
    version. The values are injected under the  /aireos:cached-show container.

    Example of injected config:

    cached-show version product-version 8.4.1.138
     admin@ncs(config)# devices device aireosdev ned-settings cisco-aireos 
          cisco-aireos-cached-show-enable false|true(default)
     admin@ncs(config)# commit
     Commit complete.
     admin@ncs(config)# devices device aireosdev disconnect
     admin@ncs(config)# devices device aireosdev sync-from
     result true
     admin@ncs(config)#

    Note that in order for the above ned-setting to take effect, you
    must disconnect and connect again, to re-read ned-settings.


# 5. ned-settings cisco-aireos live-status
------------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


## 5.1. ned-settings cisco-aireos live-status auto-prompts
----------------------------------------------------------

  This ned-setting is used to set auto-ptompts to answers to device 
  prompting questions.

    - live-status auto-prompts <id> <question> <answer>

      - id <WORD>

        List id, any string.

      - question <WORD>

        Device question, regular expression.

      - answer <WORD>

        Answer to device question.

    Generally the command output parsing halts when the NED detects
    an operational or config prompt, however sometimes the command
    requests additional input, answer(s) to questions.

    Use "EXIT" in answer to Halt parsing and return output

       Use this ned-setting to create auto-prompt question and answer, like below

       devices global-settings ned-settings cisco-aireos live-status auto-prompts Q1 question "<question>" answer "<answer>"

    examples:

    devices global-settings ned-settings cisco-aireos live-status auto-prompts Q1 question "Would you like to save?" answer "N"
    devices global-settings ned-settings cisco-aireos live-status auto-prompts Q2 question "Are you sure you would like to reset the system?" answer "y"
    devices global-settings ned-settings cisco-aireos live-status auto-prompts Q3 question "System will now restart!" answer EXIT

    Note that in order for the above ned-setting to take effect, you
    must disconnect and connect again, to re-read ned-settings.


# 6. ned-settings cisco-aireos connection
-----------------------------------------

  This section lists the connection ned-settings used when connecting
  to the device:


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


# 7. ned-settings cisco-aireos proxy
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

      Prompt pattern on the proxy host.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


# 8. ned-settings cisco-aireos logger
-------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


