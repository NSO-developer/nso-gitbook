# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-staros/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-staros/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-staros/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-staros

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-staros
  2. connection
  3. live-status
  4. read
     4.1. replace-config
  5. write
     5.1. config-dependency
     5.2. inject-command
     5.3. replace-commit
  6. filter-config-in-sync-from
  7. hidden-mode
  8. behaviour
     8.1. config-error-retry
     8.2. config-warning-ignore
  9. developer-settings
  10. logger
  11. proxy
  ```


# 1. ned-settings cisco-staros
------------------------------

  cisco-staros ned-settings.


    - extended-parser <enum> (default auto)

      Make the cisco-staros NED handle CLI parsing (i.e. transform the running-config from the
      device to the model based config tree).

      disabled         - [DEPRECATED] Load configuration the standard way.

      old-robust-mode  - [DEPRECATED] Makes the NED alter the config dump such that all mode
                         switches are always done from top and down instead of from below and up
                         (with the 'exit' command) before given to the NCS/NSO parser.The number of
                         lines in the config dump will increase a lot with this feature enabled.
                         (default).

      turbo-mode       - The NED executes the whole command parsing by itself, completely bypassing
                         the NSO CLI parser. The configuration dump is transferred to NSO using
                         maapi setvalues call.

      turbo-xml-mode   - The NED executes the whole command parsing by itself, completely bypassing
                         the NSO CLI parser. The configuration dump is transferred to NSO in XML
                         format.

      robust-mode      - [DEPRECATED] Makes the NED filter the configuration so that unmodeled
                         content is removed before being passed to the NSO CLI-engine. This protects
                         against configuration ending up at the wrong level when NSO CLI parser
                         fallbacks (which potentially can cause following config to be skipped).

      auto             - Uses turbo-mode when available, will use fastest available method to load
                         data to NSO. If NSO doesn't support data-loading from CLI NED, robust-mode
                         is used.


    - write-memory-setting <enum> (default on-commit)

      Configure how and when an applied config is saved to persistent memory on the device.

      on-commit   - Save configuration immediately after the config has been successfully applied on
                    the device. If an error occurs when saving the whole running config will be
                    rolled back.

      on-persist  - Save configuration during the NED persist handler. Called after the config has
                    been successfully applied and committed, if an error occurs when saving an alarm
                    will be triggered. No rollback of the running config is done.

      disabled    - Disable saving the applied config to persistent memory.


    - write-config-file <string> (default /flash/system.cfg)

      Configure where configuration should be saved on the device.


    - disable-encrypted-configs <true|false> (default false)

      Disbale encrypted configs yang nodes in NED.


    - ruledef-rules-as-ordered-by-user <true|false> (default false)

      This ned-settings used to handle all rules as 'ordered-by user' inside
      /active-charging/service/ruledef. All rules(sub-nodes) inside ruledef are now just
      a string, and ordered-by user. By default this feature is disabled. Set this ned-setting
      to true to use 'ordered-by user' rules feature in NED.


    - host-pool-ip-as-ordered-by-user <true|false> (default false)

      This ned-settings used to handle all IPs as 'ordered-by user' inside
      /active-charging/service/host-pool/ip. All IPs are now just a string,
      and ordered-by user. By default this feature is disabled. Set this ned-setting to
      true to use 'ordered-by user' IP feature in NED.


    - apn-ip-qos-dscp-as-single-line-syntax <true|false> (default false)

      /context/apn/ip/qos-dscp entries can be configured as multiple lines
      or all entries in single line. New yang models introduced to support STAROS single
      line syntax. Multiple lines and single line yang nodes controlled by
      apn-ip-qos-dscp-as-single-line-syntax ned-setting. By default multiple lines yang
      syntax are supported. Set this ned-setting to true to use single line syntax feature in NED.


    - use-context-ssh-key <true|false> (default false)

      By default /context/ssh/generate/key enabled in yang model and
      'ssh key <key> len <length> type v2-rsa' command transformed to
      'ssh generate key type v2-rsa' during sync-from. Configure use-context-ssh-key to true,
      to enable /context/ssh/key yang model and to keep original ssh key during sync-from.


# 2. ned-settings cisco-staros connection
-----------------------------------------

  Configure settings specific to the connection between NED and device.


    - number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.


    - time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry.


# 3. ned-settings cisco-staros live-status
------------------------------------------

  Configure NED settings related to live-status.


    - time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.


# 4. ned-settings cisco-staros read
-----------------------------------

  Settings used when reading from device.


## 4.1. ned-settings cisco-staros read replace-config
-----------------------------------------------------

  Replace (or filter) config when reading from device.

    - replace-config <id> <regexp> <replacement> <when>

      - id <WORD>

        List id, any string.

      - regexp <WORD>

        The regular expression (DOTALL) to which the config is to be matched.

      - replacement <WORD>

        The string which would replace all found matches. May use groups from regex. Leave unset for
        filtering.

      - when <enum>

        trans-id-only  - Only replace/filter when calculating transaction id.

    Example:
    # devices device <name> ned-settings cisco-staros read replace-config tech-support-replace regexp
        "\s+tech-support test-commands encrypted password \S+" replacement "\n tech-support test-commands password test_password"


# 5. ned-settings cisco-staros write
------------------------------------

  Settings used when writing to device.


    - context-ip-pool-modify-syntax <true|false> (default false)

      Problem 1:
        /context/ip/pool yang model is compact-syntax and NSO can not generate
        individual leaf modification syntax. Moreover not all leaves inside
        /context/ip/pool can be modified, when sending modified value together
        with other leaves as compact-syntax, we get below errors.

        Failure: Cannot modify Pool, once pool is configured!
        or
        Failure: Modification of existing pools to NAT pools not allowed!

      Solution 1:
        NED removes and re-creates if there is any value change in a leaf.

      Problem 2:
        NAT pools (ip pool) which is mapped/shared with multiple customer, deleting
        and creating is highly impossible. Customer asked to StarOS BU to add below
        feature to modify the nat-binding-timer/port-chunk-hold-timer dynamically
        without effecting customer in existing NAT pools.
        i.e `ip pool test-pool-name nat-binding-timer <int> port-chunk-hold-timer <int>`

      Solution 2:
        If only nat-binding-timer/port-chunk-hold-timer value changed, send only these
        modification to device instead of remove and re-create.

        NOTE: solution 2 works only when changing nat-binding-timer/port-chunk-hold-timer,
        if other leafs modified together then syntax will be remove and re-create.


## 5.1. ned-settings cisco-staros write config-dependency
---------------------------------------------------------

  This ned-setting can be used to add dynamic dependency rules to
  the NED before being permanently fixed in the NED. This can be
  useful if a dependency bug is found and you do not want to upgrade
  the NED or are in a hurry for the fix.

    - config-dependency <id> <mode> <move> <action> <stay> <options>

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


## 5.2. ned-settings cisco-staros write inject-command
------------------------------------------------------

  Inject command (before or after) specified config-line upon commit.

    - inject-command <id> <config-line> <command> <where>

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

    Example:

    One use case is to inject sleep time before/after a specific config line.

    NOTE:
    sleep inject command must be "# NED-SLEEP <int_seconds> #"
    and can have white-spaces before or after #

    # devices device <name> ned-settings cisco-staros write inject-command sleep-monitor-bgp
        config-line "monitor bgp context \\S+ \\S+ group \\S+" command "  # NED-SLEEP 5 #" after-each
    # commit
    # disconnect
    # <configure-commands>
    # commit dry-run outformat native
    native {
        device {
            name <name>
            data context test
                  redundancy-configuration-module rcm
                   monitor bgp context n6 1.1.1.1 group 2
                   # NED-SLEEP 5 #
                   monitor bgp context n6 1.1.1.2 group 2
                   # NED-SLEEP 5 #
                   monitor bgp context n6 1.1.1.3 group 2
                   # NED-SLEEP 5 #
                   monitor bgp context n6 1.1.1.4 group 2
                   # NED-SLEEP 5 #
                  exit
                 exit
        }
    }


## 5.3. ned-settings cisco-staros write replace-commit
------------------------------------------------------

  Replace (or filter) config when writing to device.

    - replace-commit <id> <regexp> <replacement>

      - id <WORD>

        List id, any string.

      - regexp <WORD>

        The regular expression (DOTALL) to which the config is to be matched.

      - replacement <WORD>

        The string which would replace all found matches. May use groups from regex. Leave unset for
        filtering.

    Example:
    # devices device <name> ned-settings cisco-staros write replace-commit content-filtering-replace regexp
        "no content-filtering category policy-id (\\d+)" replacement "no content-filtering category category policy-id $1"


# 6. ned-settings cisco-staros filter-config-in-sync-from
---------------------------------------------------------

  regexp entry list to filter configs from sync-from.

    - filter-config-in-sync-from <remove-config>

      - remove-config <WORD>

        command regular expression, e.g. ^\s*snmp community encrypted name .*$.


# 7. ned-settings cisco-staros hidden-mode
------------------------------------------

  This ned-settings used to set/modify hidden configs on the device.
  To configure hidden configs through NED, user must configure both
  "enable-hidden-mode=true" and "test-commands-password=<password>".


    - enable-hidden-mode <true|false> (default false)

      enable hidden mode(default is false).


    - test-commands-password <string>

      Permits access to internal test and debug commands.


# 8. ned-settings cisco-staros behaviour
----------------------------------------

  NED specific behaviours.


## 8.1. ned-settings cisco-staros behaviour config-error-retry
--------------------------------------------------------------

  These ned-settings are used to retry config commands on certain device warning or error.

  Example:
  Sometime AAA server is overloaded, it throws an intermittent error
  back to device ( Ex GTAC Failure: communication link down), which in turn
  throws it back to NSO/NED which starts auto-rollback. In such a scenario,
  use this ned-settings to NED to retry the command and not start auto-rollback immediately.


    - errors <error>

      Add device error/warning regexp retry list.

      - error <WORD>

        Warning/error regular expression, e.g. GTAC Failure .*.


    - config-output-max-retries <NUM> (default 90)

      Max number of retries, when sending config command to device.


    - config-output-retry-intervel <NUM> (default 1)

      Specify retry interval in seconds.


## 8.2. ned-settings cisco-staros behaviour config-warning-ignore
-----------------------------------------------------------------

  After having sent a config command to the device the NED will treat
  any text reply as an error and abort the transaction. The config
  command that caused the failed transaction will be shown together
  with the error message returned by the device. Sometimes the text
  message is not an actual error. It could be a warning that should be
  ignored. The NED has a static list of known warnings.:

  If you stumble upon a warning not in NED's static list, which is quite
  likely due to the large number of warnings or some customers are interested
  in aborting commit if NED receives those warnings from device, you can configure
  NED to ignore them using this ned-settings.

    - config-warning-ignore <warning>

      - warning <WORD>

        Warning regular expression, e.g. .* does not exist.*.

    For example, to add a new warning exception:
      # devices device <name> ned-settings cisco-staros behaviour config-warning-ignore "address .* does not exits"
      # commit


# 9. ned-settings cisco-staros developer-settings
-------------------------------------------------

  Contains settings used by the NED developers.


    - load-from-file <string>

      Make the NED load a file containing raw device config when doing sync-from.


# 10. ned-settings cisco-staros logger
--------------------------------------

  Settings for controlling logs generated.


    - level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


# 11. ned-settings cisco-staros proxy
-------------------------------------

  Configure NED to access device via a proxy.


    - remote-connection <enum>

      Connection type between proxy and device.

      ssh     - ssh.

      telnet  - telnet.

      serial  - serial.


    - remote-address <ipv4|ipv6>

      Address of host behind the proxy.


    - remote-port <uint16>

      Port of host behind the proxy.


    - remote-name <string>

      User name on the device behind the proxy.


    - remote-password <string>

      Password on the device behind the proxy.


    - authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy-prompt <string>

      Prompt pattern on the proxy host.


    - remote-ssh-args <string>

      Additional arguments used to establish proxy connection.

    Do as follows to setup to connect to an STAROS device that
    resides behind a proxy or terminal server:

    +-----+  A   +-------+   B  +--------+
    | NSO | <--> | proxy | <--> | STAROS |
    +-----+      +-------+      +--------+

    Setup connection (A):

    # devices device dev-1 address <proxy address>
    # devices device dev-1 port <proxy port>
    # devices device dev-1 device-type cli protocol <proxy proto - telnet or ssh>
    # devices authgroups group <group-name> default-map remote-name <proxy username>
    # devices authgroups group <group-name> default-map remote-password <proxy password>
    # devices device dev-1 authgroup <group-name>


    Setup connection (B):


    Define the type of connection to the device. The type serial is
    used for terminal servers:

    # devices device dev-1 ned-settings cisco-staros proxy remote-connection <ssh|telnet|serial>

    Define login credentials for the device:

    # devices device dev-1 ned-settings cisco-staros proxy remote-name <user name on the STAROS device>
    # devices device dev-1 ned-settings cisco-staros proxy remote-password <password on the STAROS device>

    If protocol is ssh or telnet then configure the following as well:

    # devices device dev-1 ned-settings cisco-staros proxy proxy-prompt <prompt pattern on proxy>
    # devices device dev-1 ned-settings cisco-staros proxy remote-address <address to the STAROS device>
    # devices device dev-1 ned-settings cisco-staros proxy remote-port <port used on the STAROS device>
    # commit


