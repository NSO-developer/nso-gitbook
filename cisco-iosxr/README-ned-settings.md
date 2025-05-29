# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-iosxr/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-iosxr/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-iosxr/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-iosxr

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-iosxr
  2. logger
  3. connection
  4. proxy
  5. read
     5.1. replace-config
  6. write
     6.1. config-warning
     6.2. inject-command
     6.3. config-dependency
  7. live-status
     7.1. auto-prompts
  8. api
  9. auto
  10. developer
     10.1. simulate-command
  ```


# 1. ned-settings cisco-iosxr
-----------------------------

  The following top level ned-settings can be modified.


    - extended-parser <enum> (default auto)

      Configure method for loading running-config to NSO.

      disabled        - DEPRECATED, do not use.

      turbo-mode      - The configuration dump is transferred to NSO using maapi setvalues call.

      turbo-xml-mode  - The configuration dump is transferred to NSO in XML format.

      robust-mode     - DEPRECATED, do not use.

      auto            - Set to auto to use fastest available method to load data to NSO.


    - internal-xml-transfer-timeout <uint32> (default 2147483647)

      Configure maximum time in milliseconds allowed for transferring XML from NED to NSO.


# 2. ned-settings cisco-iosxr logger
------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging, four values are supported: error|info|verbose|debug

      Warning: Setting logger level to verbose or debug will greatly increase the number of IPC
      messages sent between the NED and NSO, potentially reducing overall performance. Hence,
      only raise the logger level if you are experiencing issues which need investigation.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings cisco-iosxr connection
----------------------------------------

  This section lists the connection ned-settings used when connecting
  to the device:


    - connection connector <WORD>

      Change the default connector used for this device, profile or
      global setup. The new connector must be located in the
      src/metadata folder in the NED package, where also the README
      file is located for more information on configuring connectors.
      Default 'ned-connector-default.json'


    - connection number-of-retries <0-255> (default 0)

      Configure max number of extra retries the NED will try to
      connect to the device before giving up.


    - connection time-between-retry <1-255> (default 1)

      Configure the time in seconds the NED will wait between each connect retry.


    - connection prompt-timeout <0|1000-1000000> (default 0)

      This ned-setting can be used to configure a timeout in the
      connection process which can be used to wake the device if the
      device requires additional newlines to be sent before proceeding.


    - connection send-login-newline <true|false> (default false)

      This ned-setting is used to send an initial newline in the login phase
      in order to wake the device. This can be usable, for example, if the
      banner config on the device causes the login code to miss a prompt.


    - connection prefer-platform-serial-number <true|false> (default true)

      Set to false if the NED should not report the serial-number from devices device platform, i.e.
      always call show inventory|diag when NED connects to the device.


    - connection serial-number-method <enum> (default auto)

      If prefer-platform-serial-number is set to false or the serial-number
      is not set in 'devices device platform yet', this option controls how
      it is retrieved from device. Five config options are available:

      disabled          - Do not attempt to retrieve serial number from device.

      diag              - Only use '[admin] show diag [chassis]'.

      inventory         - Only use 'show inventory'.

      prefer-diag       - First try '[admin] show diag [chassis]' then 'show inventory'.

      prefer-inventory  - First try 'show inventory' then '[admin] show diag [chassis]'.

      auto              - prefer-inventory for 'cisco CRS' and 'cisco NCS', else prefer-diag.


    - connection platform-model-regex <WORD>

      Change the regex used to extract the device model name at connect.
      The default regex is "\ncisco (.+?) (?:Series |\\().*"


    - connection admin name <string>

      Specify device admin name used to list and modify admin mode config.


    - connection admin password <string>

      Specify device admin password used to list and modify admin mode config.


    - connection ssh client <enum>

      Configure which SSH client to use. Default is sshj.

      default  - default.

      sshj     - The new SSH client with support for the latest crypto features (default after NSO
                 version 5.6).

      ganymed  - The legacy SSH client (used on all NSO version older than 5.6).


    - connection ssh sshj-force-legacy-sftp <true|false> (default true)

      When using the default ssh client (sshj), certain servers announce a faulty sftp protocol
      version causing the sshj client to fail file transfers.


# 4. ned-settings cisco-iosxr proxy
-----------------------------------

  See sections 9 and 10 in README.md for information on proxy ned-settings
  used to connect via a jump host, terminal server or "exec" proxy,
  i.e. executing a command/script to connect to device.

  Note: The NED also supports a second jump host by configuring
        'ned-settings cisco-iosxr proxy2' ned-settings.


# 5. ned-settings cisco-iosxr read
----------------------------------

  Settings used when reading from device.


    - read method <<command> | sftp-transfer> (default show running-config)

      This setting controls how the NED shall fetch the running config from the
      device. This is typically done upon NSO operations like 'sync-from',
      'compare-config' and sometimes also when generating a transaction id.

      The NED does by default dump the running configuration through the CLI
      session by using the command 'show running-config'. This method
      may be slow for large configurations, hence the introduction of
      the SFTP transfer mode.

      To enable get device config by SFTP, method must be set to "sftp-transfer"
      and 'read file' set to path and name where the running-config can be
      temporarily copied on before download. For example:

      devices device asr9k-1 ned-settings cisco-iosxr read
                              method sftp-transfer
      devices device asr9k-1 ned-settings cisco-iosxr read
                              file "disk0a:/usr/running-config.tmp"


    - read file <FILE> (default disk0a:/usr/running-config.tmp)

      The path to the file containing running-config, see read method above for info.


    - read admin-show-running-config <true|false> (default true)

      Also enter admin mode and show running config there when showing config.


    - read transaction-id-method <enum> (default commit-list)

      Method used for calculating the transaction id.

      config-hash  - Use a snapshot of the running config for calculation.

      commit-list  - Use the configuration commit list time of the latest commit for calculation.


    - read transaction-id-provisional <true|false> (default true)

      Set to false to disable use of new NSO feature to set provisional transaction-id in show() to
      save a call to getTransId() with sync-from.


    - read strip-comments <true|false> (default true)

      This setting is used to disable the default behaviour of stripping
      comments (starting with !) from the device. Set to false to
      disable. Hence if left at its default (true), comments are stripped.


    - read show-running-strict-mode <true|false> (default false)

      Enable to replace all submode ! with exit in sync-from show running-config.


    - read partial-show-method <enum> (default walk-mode)

      This ned-setting is used to decide how config is fetched from the device
      when the NSO feature "partial show" is used (i.e. with 'commit no-overwrite'
      or 'devices partial-sync-from ...').

      By default (walk-mode) the config is fetched "chunk by chunk" with explicit
      show commands for each part NSO requests (i.e. one round-trip per
      chunk). The 'filter-mode' on the other hand fetches the full configuration
      and filters out the requested parts before sending it to NSO (reducing
      overhead in NSO handling the full configuration).

      walk-mode      - The NED 'walks' the config tree on the device step by step and extracts the
                       config from the requested locations (i.e. doing a 'show' for each path NSO
                       checks).

      filter-mode    - The NED fetches a full configuration dump from the device. It then filters
                       out everything except the requested parts. The filtered config is then sent
                       back to NSO.

      cmd-path-full  - Hardwire NSO show-partial capability to 'cmd-path-full' (instead of
                       'cmd-path-modes-only' with walk-mode).


    - read show-hidden-interfaces <true|false> (default false)

      Interfaces in up state, with no config, can be hidden in running-config, use this ned-setting
      to do an extra 'show interface all | inc "line protocol"' to discover all interfaces.


    - read strip-descriptions <true|false> (default false)

      To strip whitespace added by device at end of line of descriptions, enable this setting.


    - read show-running-xml <true|false> (default true)

      Enable to use show running-config | xml for retrieving some config. YANG agent must be enabled
      on device.


## 5.1. ned-settings cisco-iosxr read replace-config
----------------------------------------------------

  Replace (or filter) config when reading from device.

    - read replace-config <id> <regexp> <replacement>

      - id <WORD>

        List id, any string.

      - regexp <WORD>

        The regular expression (DOTALL) to which the config is to be matched.

      - replacement <WORD>

        The string which would replace all found matches. May use groups from regex. Leave unset for
        filtering.

    The replace-config list ned-setting can be used to replace or filter
    out config line(s) upon reading from device.

    Here is an example of filtering out a single interface when reading:

    devices device asr9k-2 ned-settings cisco-iosxr read replace-config X
      regexp "\ninterface TenGigE0/1/2/0\r\n.+?\n!"

    The NED trace (in raw mode) will show the ned-setting in use when
    doing a compare-config or sync-from:

    -- transformed <= replaced "\ninterface TenGigE0/0/0/21\r\n shutdown\r\n!\r" with ""

    Finally, a word of warning, if you replace or filter out config
    from the show running-config, you most likely will have
    difficulties modifying this config.


# 6. ned-settings cisco-iosxr write
-----------------------------------

  Settings used when writing to device.


    - write commit-method <enum> (default confirmed)

      Commit method to use for commit/rollback behaviour.

      confirmed  - Use 'commit confirmed' along with a confirming 'commit' when transaction is done,
                   utilizing the implict device rollback if network connectivity is lost.

      direct     - When using this method, the NED follows the NCS flow by doing 'commit' when NCS
                   commits the transaction. If transaction is reverted, the NED calls 'rollback
                   configuration last 1' to rollback the commit.


    - write commit-options <WORD> (default show-error)

      Option(s) to commit [confirmed] command.


    - write commit-confirmed-timeout <30-65535> (default 30)

      Number of seconds used with commit confirmed command.


    - write commit-confirmed-delay <0-2147483647> (default 0)

      Number of milliseconds to delay between commit confirmed and commit.


    - write commit-override-changes <enum> (default yes)

      The answer when commiting and other sessions have commited since this session started.

      yes  - yes.

      no   - no.


    - write revert-method <enum> (default rollback)

      Set in order to change the method used to rollback config in the
      REVERT phase. Default is to use native XR rollback command. This
      can now be changed to instead apply the reverse diff calculated
      by NSO, and apply in a new internal commit. This can be used to
      avoid a failing rollback due to CSCtk60033 bug where policy-map
      can't be deleted in same commit (the rollback).

      rollback            - Use native OS rollback command.

      apply-reverse-diff  - Apply the reverse diff (calculated by NSO) and apply in a new commit.


    - write config-method <enum> (default exclusive)

      Config method to use when entering config mode.

      exclusive  - Configure exclusively from this terminal.

      terminal   - Configure from the terminal.


    - write number-of-lines-to-send-in-chunk <1-1000> (default 100)

      Number of commands lines in a chunk sent by the cisco-iosxr NED to the device. A higher number
      normally result in better performance but will also have negative impact on the error
      handling.


    - write sftp-threshold <0-2147483647> (default 2147483647)

      This setting controls how the NED shall transfer configuration to the
      device. This is typically done by connecting to the device using
      SSH or TELNET, entering all the config lines and then calling
      commit. Committing large configuration files like this may not be
      optimal for speed.

      An alternate method can then be used, SFTP transfer. With this
      method the NED uses SFTP to transfer the config file to the device
      and then load it into the candidate config.

      To enable this method, sftp-threshold must be set to the minimum
      number of lines for this method to kick in, i.e. set to 0 for
      using SFTP always. The path and file name of the temporary config
      file may also be changed from its default. Example config:

      devices device <devname> ned-settings cisco-iosxr write sftp-threshold 100
      devices device <devname> ned-settings cisco-iosxr write file "disk0a:/usr/commit-config.tmp"


    - write file <FILE> (default disk0a:/usr/commit-config.tmp)

      The name of the temporary file to use when transferring the config.


    - write oob-exclusive-retries <uint32> (default 1)

      Maximum number of retries (one per second) when trying to enter config mode or commit on
      certain errors which may be solved by retrying.


## 6.1. ned-settings cisco-iosxr write config-warning
-----------------------------------------------------

  List specifying device warnings to ignore.

    - write config-warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.* creating vlan.

    After having sent a config command to the device the NED will treat
    the following text replies an an error and abort the transaction:

             error
             aborted
             exceeded
             invalid
             incomplete
             duplicate name
             may not be configured
             should be in range
             is used by
             being used
             cannot be deleted
             bad mask
             failed

    Sometimes a warning may contain any of the words above and will be
    treated as an error. This can be avoided by adding an exception to
    the above rule in the 'cisco-iosxr write config-warning' ned-setting.

    The list key is a regular expression with a warning that should be
    ignored.

    For example, to add a new warning exception:

      admin@ncs(config)# devices global-settings ned-settings
          cisco-iosxr write config-warning "XHM .* is using a bad mask"
      admin@ncs(config)# commit
      Commit complete.
      admin@ncs(config)# devices disconnect
      admin@ncs(config)# devices connect
      result true

    Note that in order for the warning exception to take effect, you
    must disconnect and connect again, to re-read ned-settings.


## 6.2. ned-settings cisco-iosxr write inject-command
-----------------------------------------------------

  Inject command (before or after) specified config-line upon commit.

    - write inject-command <id> <config> <command> <where>

      - id <WORD>

        List id, any string.

      - config <WORD>

        The config line(s) where command should be injected (DOTALL regex).

      - command <WORD>

        The command(s) to inject after|before config-line.

      - where <enum>

        before-each   - insert command before each matching config-line.

        before-first  - insert command before first matching config-line.

        after-each    - insert command after each matching config-line.

        after-last    - insert command after last matching config-line.

    This ned-setting list can be used to inject commands (e.g. config
    lines) when writing to the device (i.e. upon commit). This can be
    used, for example, to undo undesired dynamic config automatically
    set by the device.

    An example to solve a XR bug:

     devices device asr9k-1 ned-settings cisco-iosxr write inject-command
     CSCuz19873 config "snmp-server traps bgp cbgp2" command "commit\nsnmp-server" traps" after-last

    Note: You can use \n to inject multiple lines.
    Note2: It is also possible to use $1-$9 to insert catch groups from the config regexp.


## 6.3. ned-settings cisco-iosxr write config-dependency
--------------------------------------------------------

  Add a dynamic diff dependency to solve unsolved dependencies in the NED before next release.

    - write config-dependency <id> <mode> <move> <action> <stay> <options>

      - id <WORD>

        List id, any string.

      - mode <WORD>

        Regex specifying config mode where the rule is checked, don't set for top-mode.

      - move <WORD>

        Regex|match-expr specifying line(s) to move.

      - action <enum>

        before  - Move 'move' line(s) before 'stay' line(s).

        after   - Move 'move' line(s) before 'stay' line(s).

        last    - Move 'move' line(s) last.

        first   - Move 'move' line(s) first.

      - stay <WORD>

        Regex|match-expr specifying where 'move' lines will be moved before|after.

      - options <WORD>

        Optional rule option(s).


# 7. ned-settings cisco-iosxr live-status
-----------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.


    - live-status exec-done-pattern <WORD>

      This ned-setting can be used when the exec command does not end with
      a device prompt. If the regexp is matched, the NED will return all
      text up to and including this regexp. The default setting is set to
      the output of the "issu runversion" command:
      "(Initiating active RP failover)|(Target RP will now reload)"


    - live-status exec-done-pattern-only <WORD>

      Same as exec-done-pattern except that command will ignore all other prompts, including
      config|exec prompts.


    - live-status exec-strict-prompt <WORD>

      Set prompt <regex> to enable strict prompt matching for live-status commands. %p = device
      prompt (auto-retrieved by sending newline).

      This ned-setting can be used to enable to enable stricter prompt
      matching for 'live-status exec any' commands. Setting it to include
      %p will make the NED send an initial newline to determine the device
      prompt, there after use that exact prompt in the following command(s).
      Default false.


## 7.1. ned-settings cisco-iosxr live-status auto-prompts
---------------------------------------------------------

  Pre-stored answers to device prompting questions.

    - live-status auto-prompts <id> <question> <answer>

      - id <WORD>

        List id, any string.

      - question <WORD>

        Device question, regular expression.

      - answer <WORD>

        Answer to device question.

    See section 5 for detailed information on this ned-setting.


# 8. ned-settings cisco-iosxr api
---------------------------------

  Configure API (new API features/changes).


    - api edit-route-policy <true|false> (default false)

      This ned-setting is used to switch to the alternate route-policy
      API which orders route-policy value(s) on the line number instead
      of using a single string. See tailf-ned-cisco-ios-xr.yang for syntax.


    - api edit-banner <true|false> (default false)

      This ned-setting is used to switch to the alternate banner
      API which orders banner line(s) on the line number instead
      of using a single string. See tailf-ned-cisco-ios-xr.yang for syntax.


    - api service-policy-list <true|false> (default false)

      Enable support for multiple service-policy list entries in:
      interface * / service-policy
      interface * / pvc * / service-policy
      interface * / l2transport / service-policy
      interface ATM* / pvc * / service-policy
      dynamic-template / type ipsubscriber * / service-policy


    - api class-map-match-access-group-list <true|false> (default false)

      Replace single class-map * / match access-group container+leaf with a list, supporting
      multiple entries.


    - api group-modeled <true|false> (default false)

      Enable support for minimalistic modeled group config. Unfortunately
      not all config can be in the group due to CONFD limitation with hard-
      coded model depth of 20.
      Default is to handle group config as a single string with \r\n for each
      newline, which allows any group config to be modeled. Use this
      default model if any group config is needed.
      NOTICE: EXPERIMENTAL


    - api strict-interface-name <true|false> (default false)

      Enable strict interface name checking to avoid config diff when device auto-corrects.


    - api snmp-server-enable-all-traps <int32> (default 0)

      Enable the all-traps API. Set to > 0 for minimum traps, < 0 for max missing traps and 0 to
      disable.


    - api line-secret-handled <true|false> (default false)

      Enable this to handle 'line * / secret' same as for example 'line * / password' to be able
      provision clear text secret.


# 9. ned-settings cisco-iosxr auto
----------------------------------

  Configure auto (dynamic behaviour).


    - auto vrf-forwarding-restore <true|false> (default true)

      This setting controls whether ipv4 and ipv6 addresses are
      restored on an interface after a vrf change. The native device
      behaviour is to delete all ip addresses if the vrf is changed.
      If this setting is set to true (default) then NSO will restore
      the ip addresses by re-sending them to the device in the same
      transaction (unless changed or deleted).

      If this behaviour is not desired, set this setting to
      'false'. Please note that there will be a compare-config diff
      after a commit where the interface vrf is changed, unless the ip
      addresses are also deleted in NSO.


    - auto CSCtk60033-patch <true|false> (default true)

      Enable the XR CSCtk60033 patch which insert a commit in the middle
      of a transaction in order to solve a bug where policy-map can't be
      deleted due to references to it (even though those references are
      also deleted in the same transaction).


    - auto CSCtk60033-patch2 <true|false> (default false)

      Extended CSCtk60033-patch; also delete all policy-maps last in separate commit.


    - auto acl-delete-patch <true|false> (default false)

      Delete referenced ipv4|ipv6 access-list last in separate commit due to XR OS bug.


    - auto aaa-tacacs-patch <true|false> (default true)

      Inject extra commit when deleting aaa group server tacacs+ with aaa authentication config.


    - auto snmp-server-community-patch <true|false> (default false)

      Auto strip snmp-server-community 'IPv4' to support single API for various XR API's.


    - auto router-static-patch <true|false> (default false)

      Inject extra commit when editing static routes, where entries are first removed, then added in
      new commit.


# 10. ned-settings cisco-iosxr developer
----------------------------------------

  Developer settings used for debugging only.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer trace-input-bytes <true|false> (default false)

      Enable tracing of input bytes. WARNING: may choke NSO with large commits|systems.


    - developer trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer load-native-config allow-delete <true|false> (default false)

      Enable this setting to be able to handle limited delete operations with 'load-native-config'. Please note that
      not all syntax available on a real device works, some delete operations can not be parsed by the NED. Use the
      'verbose' flag to 'load-native-config' to see if delete commands can be parsed. Currently this is only supported
      when 'extended-parser' is set to 'turbo-xml-mode'


    - developer load-native-config delete-with-remove <true|false> (default false)

      Enable this setting to use 'remove' instead of 'delete' when sending delete operations to NSO. This is useful when
      doing delete commands for data that might not be present in CDB. Please note that deletes for missing data will still
      be part of transaction, and will be sent to device. Use with care, and do proper testing to understand behaviour.


## 10.1. ned-settings cisco-iosxr developer simulate-command
------------------------------------------------------------

  Used for debugging to simulate a device response to a live-status command.

    - developer simulate-command <cmd> <file>

      - cmd <WORD>

        Full command, e.g. 'show version'.

      - file <WORD>

        Command output file.


