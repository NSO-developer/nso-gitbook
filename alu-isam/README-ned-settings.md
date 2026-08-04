# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/alu-isam/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/alu-isam/
  device
    /ncs:/device/devices/device:<name>/ned-settings/alu-isam/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings alu-isam

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings alu-isam
  2. developer-settings
  3. developer
  4. deprecated
  5. write
     5.1. config-dependency
  6. read
     6.1. replace-config
  7. alu-isam-config-warning
  8. alu-isam-extra-errors
  9. connection
  10. logger
  11. proxy
  ```


# 1. ned-settings alu-isam
--------------------------


    - extended-parser <enum> (default auto)

      Make the alu-isam NED enable extensions to ease the task of the NCS/NSO CLI command parser. A
      common problem with the alu-isam NED is that can get out of sync when trying to parse config
      that is not supported by the YANG model. This is especially the case for unsupported config
      that generates a mode switch.

      disabled         - Load configuration the standard way.

      turbo-mode       - The NED executes the whole command parsing by itself, completely bypassing
                         the NSO CLI parser. The configuration dump is transferred to NSO using
                         maapi setvalues call.

      turbo-xml-mode   - The NED executes the whole command parsing by itself, completely bypassing
                         the NSO CLI parser. The configuration dump is transferred to NSO in XML
                         format.

      robust-mode      - Makes the NED filter the configuration so that unmodeled content is removed
                         before being passed to the NSO CLI-engine. This protects against
                         configuration ending up at the wrong level when NSO CLI parser fallbacks
                         (which potentially can cause following config to be skipped).

      old-robust-mode  - Makes the NED alter the config dump such that all mode switches are always
                         done from top and down instead of from below and up (with the 'exit'
                         command) before given to the NCS/NSO parser.
The number of lines in the
                         config dump will increase a lot with this feature enabled.

      auto             - Uses turbo-mode when available, will use fastest availablemethod to load
                         data to NSO. If NSO doesn't support data-loading from CLI NED, robust-mode
                         is used. (default).


    - trans-id-method <enum> (default set-log-entry-sequence-number)

      Configure how the NED shall calculate the transaction id. Typically used after each commit and
      for check-sync operations.

      config-hash                    - Use a snapshot of the running config for
                                       calculation.(default).

      set-log-entry-sequence-number  - Use the sequence number of the latest entry in the ISAM
                                       transaction set log for calculation.


    - disable-interface-admin-state <true|false> (default false)

      This ned-setting can be used to disable all equipment/ont/interface/admin-state yang nodes.
      You can use this ned-settings, to skip admin-state during commit and compare-config/sync-from

      # devices global-settings ned-settings alu-isam disable-interface-admin-state true
           or
         # devices device isamdev ned-settings alu-isam disable-interface-admin-state true
      # commit
      # disconnect
      # sync-from

        Note: in order for the above settings to take effect, user must disconnect and do sync-from.


# 2. ned-settings alu-isam developer-settings
---------------------------------------------

  Contains settings used by the NED developers.


    - developer-settings load-from-file <string>

      Make the NED load a file containing raw device config when doing sync-from. Does only work on
      NETSIM targets.


# 3. ned-settings alu-isam developer
------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer progress-verbosity <enum> (default disabled)

      Maximum NED verbosity level which will be reported.

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


# 4. ned-settings alu-isam deprecated
-------------------------------------

  Deprecated ned-settings.


    - deprecated connection legacy-mode <enum> (default enabled)

      enabled   - enabled.

      disabled  - disabled.


# 5. ned-settings alu-isam write
--------------------------------

  Settings used when writing to device.


## 5.1. ned-settings alu-isam write config-dependency
-----------------------------------------------------

  This ned-setting can be used to add dynamic dependency rules to
  the NED before being permanently fixed in the NED. This can be
  useful if a dependency bug is found and you do not want to upgrade
  the NED or are in a hurry for the fix.

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

    Note that in order for the this ned-setting to take effect, you
          must disconnect and connect again.


# 6. ned-settings alu-isam read
-------------------------------

  Settings used when reading from device.


## 6.1. ned-settings alu-isam read replace-config
-------------------------------------------------

  The replace-config list ned-setting can be used to
  replace or filter out config line(s) upon reading from device

    - read replace-config <id> <regexp> <replacement>

      - id <WORD>

        List id, any string.

      - regexp <WORD>

        The regular expression (DOTALL) to which the config is to be matched.

      - replacement <WORD>

        The string which would replace all found matches. May use groups from regex.

    An example, on one device the config line "sernum ALCL:F961418E"
           which is a auto-generated config from device. This has to be filtered out.
           This can be done with the following ned-setting:
    #devices device <device-name> ned-settings alu-isam read replace-config sernum regexp "\\n\\s+sernum ALCL:F961418E"
    The above ned-setting will result in the line being stripped if available.
           Note how the replacement string is left empty when filtering. This
           means replacing with "".
    The NED trace (in raw mode) will show the ned-setting in use when
           doing a check-sync or sync-from:
      -- transformed <= replaced "\n      sernum ALCL:F961418E" with ""
    Finally, a word of warning, if you replace or filter out config
           from the show running-config, you most likely will have difficulties modifying this config
    Note: in order for the above settings to take effect, user must disconnect and do connect.


# 7. ned-settings alu-isam alu-isam-config-warning
--------------------------------------------------

  This section describes how device output (warnings/errors) can be filtered.

    - alu-isam-config-warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. .* does not exist.*.

    After having sent a config command to the device the NED will treat
         any text reply as an error and abort the transaction. The config
         command that caused the failed transaction will be shown together
         with the error message returned by the device. Sometimes the text
         message is not an actual error. It could be a warning that should be
         ignored. The NED has a static list of known warnings, presently these:
     // general
          "is in use",
          "already exists",
          "not completed its shutdown"
    If you stumble upon a warning not in the list above, which is quite
         likely due to the large number of warnings or some customers are interested
         in aborting commit if NED receives those warnings from device, you can configure the
         NED to ignore them under ned-settings in the alu-isam-config-warning
         list. The list resides in two places and you can configure a
         warning in any of these:
      devices device <device-name> ned-settings alu-isam alu-isam-config-warning
           devices global-settings ned-settings alu-isam alu-isam-config-warning
    alu-isam-config-warning is a regular expression string list of warnings that should also be ignored.
    For example, to add a new warning exception:
      admin@ncs(config)# devices device <device-name> ned-settings alu-isam alu-isam-config-warning ".*when SN is bogus or NULL.*"
           admin@ncs(config-device-isam-1)# commit
           Commit complete.
           admin@ncs(config-device-isam-1)# disconnect
           admin@ncs(config-device-isam-1)# connect
           result true

        Note that in order for the warning exception to take effect, you must disconnect and connect again.


# 8. ned-settings alu-isam alu-isam-extra-errors
------------------------------------------------

  This section describes device messages that must be handled as errors.

    - alu-isam-extra-errors <message>

      - message <string>

        Extra error regular expresio, e.g. ^INFO:.*.

    Depending on the use case, sometimes different messages from the device must be threated as errors
    even if they are not error messages.

    For example, to add a new extra error message:

         admin@ncs(config)# devices device <device-name> ned-settings alu-isam alu-isam-extra-errors "INFO: PIP #1370.*"
         admin@ncs(config-device-isam-1)# commit
         Commit complete.
         admin@ncs(config-device-isam-1)# disconnect
         admin@ncs(config-device-isam-1)# connect
         result true

      Note that in order for the new error messages to take effect, you must disconnect and connect again.


# 9. ned-settings alu-isam connection
-------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection character-set <string> (default UTF-8)

      Character set to use for telnet session.


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


# 10. ned-settings alu-isam logger
----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


# 11. ned-settings alu-isam proxy
---------------------------------

  Configure NED to access device via a proxy.


    - proxy remote-connection <enum>

      Connection type between proxy and device.

      ssh            - Start a new ssh client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      telnet         - Start a new telnet client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      serial         - Connect through a terminal server to device.

      ssh-direct     - Direct forward to device using ned local ssh client (i.e. without shell on
                       proxy).

      telnet-direct  - Direct forward to device using ned local telnet client (i.e. without shell on
                       proxy).


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


    - proxy auth-key private-key-file <string>

      Path to openssh formatted private key file for doing public key auth to device behind proxy.


    - proxy host-key-validation <true|false> (default false)

      Set this to true to force host-key validation of device behind proxy.

    Do as follows to setup to connect to an ISAM device that resides
    behind a proxy or terminal server:

    +-----+  A   +-------+   B  +------+
    | NCS | <--> | proxy | <--> | ISAM |
    +-----+      +-------+      +------+

    Setup connection (A):

    # devices device isam0 address <proxy address>
    # devices device isam0 port <proxy port>
    # devices device isam0 device-type cli protocol <proxy proto - telnet or ssh>
    # devices authgroups group isamgroup umap admin remote-name <proxy username>
    # devices authgroups group isamgroup umap admin remote-password <proxy password>
    # devices device isam0 authgroup isamgroup

    Setup connection (B):

    Define the type of connection to the device. The type 'serial' is
    used for terminal servers:

    # devices device isam0 ned-settings alu-isam proxy remote-connection <ssh|telnet|serial>

    Define login credentials for the device:

    # devices device isam0 ned-settings alu-isam proxy remote-name <user name on the ISAM device>
    # devices device isam0 ned-settings alu-isam proxy remote-password <password on the ISAM device>

    If remote-connection is ssh or telnet then configure the following as well:

    # devices device isam0 ned-settings alu-isam proxy proxy-prompt <prompt pattern on proxy>
    # devices device isam0 ned-settings alu-isam proxy remote-address <address to the ISAM device>
    # devices device isam0 ned-settings alu-isam proxy remote-port <port used on the ISAM device>
    # commit
    # disconnect
    # connect


