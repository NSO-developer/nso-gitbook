# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-ios/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-ios/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-ios/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-ios

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-ios
  2. logger
  3. connection
  4. proxy
  5. read
     5.1. replace-config
     5.2. inject-config
     5.3. inject-interface-config
     5.4. snmp-server-user-defaults
  6. write
     6.1. config-warning
     6.2. config-dependency
     6.3. inject-command
     6.4. replace-commit
     6.5. inject-answer
     6.6. config-archive
  7. auto
  8. api
  9. live-status
     9.1. auto-prompts
  10. developer
     10.1. simulate-show
  ```


# 1. ned-settings cisco-ios
---------------------------

  The following top level ned-settings can be modified.


    - extended-parser <enum> (default auto)

      Make the cisco-ios NED handle CLI parsing (i.e. transform the running-config from the device
      to the model based config tree).

      disabled        - DEPRECATED. Same as robust-mode.

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


    - internal-xml-transfer-timeout <uint32> (default 2147483647)

      Configure maximum time in milliseconds allowed for transferring XML from NED to NSO.


# 2. ned-settings cisco-ios logger
----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set NED level of debugging. Warning: If you set the logger level
      to debug, or even to verbose, the logs files may quickly grow very
      large as well as impact the NSO/NED performance.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings cisco-ios connection
--------------------------------------

  This section lists the connection ned-settings used when connecting to the device:


    - connection connector <WORD>

      Change the default connector used for this device, profile or
      global setup. The new connector must be located in the
      src/metadata folder in the NED package, where also the README
      file is located for more information on configuring connectors.
      Default 'ned-connector-default.json'


    - connection number-of-retries <0-255> (default 1)

      Configure max number of extra retries the NED will try to connect to the device before giving
      up.


    - connection time-between-retry <1-255> (default 1)

      Configure the time in seconds the NED will wait between each connect retry.


    - connection prompt-timeout <0|1000-1000000> (default 0)

      This ned-setting can be used to configure a timeout in the
      connection process which can be used to wake the device if the
      device requires additional newlines to be sent before proceeding.


    - connection send-login-newline <true|false> (default false)

      This ned-setting is used to send an initial newline in the login
      phase, in order to wake the device. This can be usable, for
      example, if the banner config on the device causes the login code
      to miss a prompt.


    - connection terminal width <uint32> (default 200)

      Terminal width reported by SSH/TELNET upon connect.


    - connection terminal height <uint32> (default 24)

      Terminal height reported by SSH/TELNET upon connect.


    - connection terminal println-mode <enum> (default default)

      This setting controls how the NED feeds lines, i.e. whether to
      send carriage return and/or newline. Typically you may only need
      to modify this setting if you are connecting to the device via a
      terminal server. Four different methods are supported:

      default  - System property line.separator default.

      ocrnl    - Translate carriage return to newline.

      onocr    - Translate newline to carriage return-newline.

      onlret   - Newline performs a carriage return.


    - connection ssh client <enum>

      Specify which SSH client NSO uses to connect to the device as well
      as what SSH implementation the NED will use for SFTP and SCP.
      Two SSH clients are supported:

      ganymed  - The legacy SSH client (used on all NSO version older than 5.6).

      sshj     - The new SSH client with support for the latest crypto features (default after NSO
                 version 5.6 or later).


    - connection ssh keep-alive-interval <0-4294967295>

      Configure SSH client keep alive interval in seconds, default 0.


    - connection ssh auth keyboard-interactive <true|false> (default false)

      Enable keyboard-interactive auth method, e.g for Duo push or (OTP) password.


    - connection ssh auth request prompt <string>

      WORD;;SSH server keyboard-interactive prompt, e.g. 'Password:'.


    - connection ssh auth request response <string>

      WORD;;Response to the prompt, e.g. 'MySecretPw'.


    - connection populate-smart-license <true|false> (default true)

      Enable or disable population of smart license information.


# 4. ned-settings cisco-ios proxy
---------------------------------

  See sections 9, 10 and 11 in README.md for information on proxy ned-settings
  used to connect via a jump host, terminal server or "exec" proxy,
  i.e. executing a command/script to connect to device.

  Note: The NED also supports a second jump host by configuring
        'ned-settings cisco-ios proxy2' ned-settings.


# 5. ned-settings cisco-ios read
--------------------------------

  Settings used when reading from device.


    - read transaction-id-method <enum> (default config-hash)

      The method to use by the NED for calculating transaction ID is a
      configurable option. The default method is quite slow since it
      uses output of show running-config and a software calculated
      MD5. The advantage though is that it does not change even if the
      device  reboots. Another advantage is that it works on all
      platforms. If you do not care about the transaction id changing if
      the device reboots you may increase performance significantly by
      changing the method the transaction id is calculated.

      Six different methods are supported:

      config-hash           - Calculate MD5 on a snapshot of the entire running config for
                              calculation.

      last-config-change    - Use the 'Last configuration change' timestamp in running config only
                              (WARNING: changed at reboot).

      config-id             - Use the 'show configuration id' command (WARNING: changed at reboot).

      config-history        - Use the 'show configuration history' command (WARNING: changed at
                              reboot).

      confd-state-trans-id  - Use the confd 'show confd-state internal cdb datastore running
                              transaction-id (NETSIM only).

      config-hash-cached    - DEPRECATED. Same as config-hash since both methods now reuse
                              transaction-id from last show.

      config-hash-modeled   - Same as config-hash except transaction id is only calculated on
                              modeled config.

      Note: 'show config id|history' is not supported on some platforms,
      e.g. 3550, cat4500, cat6500 etc. But if the option is not supported,
      you will get to know this by use of an Exception.


    - read transaction-id-provisional <true|false> (default true)

      Set to false to disable use of new NSO feature to set provisional
      transaction-id in show() to save a call to getTransId() with
      sync-from.


    - read show-running-method <command> | scp-transfe> (default show running-config)

      Normally the NED uses "show running-config" to show configuration.
      This can be changed using this ned-setting, for example:

      devices device cat4500-1 ned-settings cisco-ios read show-running-method
                                    "show running-config full"

      Note: For devices which has enabled scp server, this setting can
            be set to "scp-transfer" to use SCP to retrieve
            running-config. This is slower for small config files but
            potentially faster for large ones. To debug, run from linux:
            $ scp -v <username>@<devname>:running-config .

      WARNING: Issues created by use of "show run all|full"
               ARE NOT SUPPORTED due to IOS CLI limitations.
               Please only use this setting for temporary non-production testing.


## 5.1. ned-settings cisco-ios read replace-config
--------------------------------------------------

  The read replace-config list ned-setting can be used to replace or
  filter out config line(s) upon reading from device, i.e. both in a
  sync-from and a config-hash transaction id.

  Apart from the list id, the setting takes one mandatory leaf
  (regex) and two optional (replacement and when):

    - read replace-config <id> <regexp> <replacement> <when>

      - id <WORD>

        List id, any string.

      - regexp <WORD>

        The regular expression (DOTALL) to which the config is to be matched.

      - replacement <WORD>

        The string which would replace all found matches. May use groups from regex.

      - when <enum>

        config-only    - DEPRECATED. Setting it has no effect.

        trans-id-only  - Only replace/filter when calculating transaction id.

    An example, on one device the config line "no service-routing
    capabilities-manager" kept coming and going due to a service on the
    device. In order to not alter the transaction-id when using
    config-hash the line has to be filtered out. This can be done with
    the following ned-setting:

    devices device dev-1 ned-settings cisco-ios read replace-config filter-sr-cap regexp "\nno service-routing capabilities-manager"

      or for all IOS devices if you want:

    devices global-settings ned-settings cisco-ios read replace-config filter-sr-cap regexp "\nno service-routing capabilities-manager"

    The above ned-setting will result in the line being stripped if available.
    Note how the replacement string is left empty when filtering. This
    means replacing with "". Also note how "\n" is needed to identify
    the line starts on a new line as well as needed to strip it and
    avoid a whitespace diff.

    The NED trace (in raw mode) will show the ned-setting in use when
    doing a check-sync or sync-from:

    -- transformed: replaced "no service-routing capabilities-manager\r\n" with ""

    Finally, a word of warning, if you replace or filter out config
    from the show running-config, you most likely will have
    difficulties modifying this config.


## 5.2. ned-settings cisco-ios read inject-config
-------------------------------------------------

  - read inject-config <id> <regexp> <config> <where>
  - read inject-interface-config <id> <interface> <config>

  The inject-config and inject-interface-config ned-settings can also
  be used to inject config lines when reading from device,
  e.g. parsing show running-config. The injected config is injected
  first or last, or as specified by a DOTALL regexp expression. It
  can also be configured to be inserted after/before each match.

  The inject config settings were implemented to solve cases where
  IOS behaves inconsistently, e.g. hidden defaults which vary from
  device to device, even vary between interfaces types.

  An example:

  interface / logging event link-status is usually shown
  as "no logging event link-status" when not set and hidden when
  set. But on a cat4500 it is the reverse: it is shown when set and
  hidden when not set. To solve this one can configure as below:

  To inject 'logging event link-status' on all interfaces (works for
  most device types, hence put globally):

  devices global-settings ned-settings cisco-ios read inject-interface-config \
    1 interface ".*" config "logging event link-status"

  To inject 'no logging event link-status' on device cat4500 only
  (after the global setting, hence overriding it):

  devices device cat4500 ned-settings cisco-ios read inject-interface-config \
    1 interface ".*" config "no logging event link-status"

  The two config entries above will solve compare diff problems with
  logging event link-status.

  Another example of config injection use is switchport, which may be
  need to be injected on some devices types. See section 7.

  Here is an example of injecting global config, which will
  be injected at the top level of show running-config:

  devices global-settings ned-settings cisco-ios read inject-config glob
    config "hostname DEFAULT-HOST-NAME"

  Global inject config also take an optional 'regexp' string which can
  be used to inject config line(s). The inject can be specified with
           'where' leaf, eight values are supported:

  before-each
    inject command before each matching <config-line>
  before-first
   inject command before first matching <config-line>
  after-each
   inject command after each matching <config-line>
  after-last
   inject command after last matching <config-line>
  before-topmode
   inject command before regex <config-line> topmode
  after-topmode
   inject command after regex <config-line> topmode
  first
   inject command first if regex <config-line> matches or is unset
  last
   inject command last if regex <config-line> matches or is unset

  Here is an example how to inject default-metric after each found
  router eigrp on a cat4500:

  devices device cat4500-1 ned-settings cisco-ios read inject-config eigrp \
    regexp "router eigrp (\\d+)" config " default-metric $1 100 255 1 1500"

  Up to 9 groups (expr) are supported in the regexp, e.g. $1 - $9.

  Note that in order for the new inject setting to take effect, you
  must disconnect and disconnect. A sync-from is also needed to
  populate NCS/NSO CDB with newly configured injection config.


## 5.3. ned-settings cisco-ios read inject-interface-config
-----------------------------------------------------------

  See 'read inject-config' above for information on how to use this ned-setting.


## 5.4. ned-settings cisco-ios read snmp-server-user-defaults
-------------------------------------------------------------

  Use this ned-setting to change the default snmp-server user
  passwords to avoid static configration of unknown passwords.

    - read snmp-server-user-defaults <id> <regexp> <auth-password> <priv-password>

      - id <WORD>

        List id, any string.

      - regexp <WORD>

        The regular expression which snmp-server user name must match. Leave unset for all.

      - auth-password <WORD>

        The default auth password used for user(s) matching this entry.

      - priv-password <WORD>

        The default priv password used for user(s) matching this entry.


# 6. ned-settings cisco-ios write
---------------------------------

  Settings used when writing to device.


    - write memory-method <WORD> (default write memory)

      Change method to write config to memory.


    - write memory-setting <enum> (default on-commit)

      Configure how and when an applied config is saved to persistent memory on the device.

      on-commit   - Save configuration immediately after the config has been successfully applied on
                    the device. If an error occurs when saving the whole running config will be
                    rolled back.

      on-persist  - Save configuration during the NED persist handler. Called after the config has
                    been successfully applied and commited If an error occurs when saving an alarm
                    will be triggered. No rollback of the running config is done.

      disabled    - Disable saving the applied config to persistent memory.


    - write config-output-max-retries <NUM> (default 180)

      This ned-setting is used to configure the maximum number of
      retries when sending config command to device. For example,
      commands like deleting a rd in an ip vrf may sometimes take up to
      70 seconds. The NED will then retry the (next) command once per
      second until the command succeeds or this setting is reached.


    - write config-output-retry-interval <uint32> (default 1000)

      Interval in milliseconds when retrying config command to device.


    - write number-of-lines-to-send-in-chunk <1-1000> (default 100)

      Some config may be sent in chunks to the device instead of line by line.
      A higher number normally results in better performance but may also have
      a negative impact on the error handling.
      NOTE: If you get an 'Internal ERROR: retry-command', set this setting to
      1 and report the config line which triggered the exception.


    - write device-output-delay <NUM> (default 0)

      This ned-setting is used to configure a delay in milliseconds
      after each config command has been sent to the device. This can be
      used to limit the bandwidth or prevent congestion on the
      device.


    - write transfer-via-file <true|false> (default false)

      This ned-setting is used with NETSIM device only to optimize the
      file transfer by use of a temporary file located in the /tmp
      directory. Do not enable unless you got a writeable /tmp
      directory.


    - write apply-reboot-timer <0|2|3|4|9|19|29|39|49|59> (default 0)

      This ned-setting is used with development mainly and can be
      useful if you happen to commit config which disconnects your
      access to the device. If set, the NED will set the reboot (reload)
      timer before sending config to the device, and cancel it
      afterwards; making the device automatically reboot if you loose
      connection to the device.


    - write config-revert-timer <0-120> (default 0)

      Set this ned-setting to a non-zero value to enable use of built-in
      'config t revert timer idle <minutes>' feature in IOS, triggering
      a rollback to last archived config with loss of connection after
      <minutes>. The NED will be notified of a loss of connection using
      the read-timeout timer. For best result, set device read-timeout
      to a value close to this timer or the device may rollback unexpectedly.
      Finally, the feature is temporarily disabled when 'archive' config
      is included in the commit, to allow user to initialize the device
      before use.


    - write ignore-abort-errors <true|false> (default false)

      Set to true to ignore errors in abort phase.


## 6.1. ned-settings cisco-ios write config-warning
---------------------------------------------------

  This setting is used to filter, i.e. ignore device output (warnings/errors)

  - write config-warning <regex>

  After having sent a config command to the device the NED will treat
  any text reply as an error and abort the transaction. The config
  command that caused the failed transaction will be shown together
  with the error message returned by the device. Sometimes the text
  message is not an actual error. It could be a warning that should be
  ignored. The NED has a static list of known warnings, an example:

  // general
  "warning: \\S+.*",
  "%.?note:",
  "info:",
  "aaa: warning",
  ".*success",
  "enter text message",
  "hqm_tablemap_inform: class_remove error",

           etc etc.

  If you stumble upon a warning not already in the NED, which is quite
  likely due to the large number of warnings, you can configure the
  NED to ignore them using this ned-setting.

  The list key is a regular expression with a warning that should be
  ignored.

  For example, to add a new warning exception:

   admin@ncs(config)# devices global-settings ned-settings
       cisco-ios write config-warning "Address .* may not be up"
   admin@ncs(config)# commit
   Commit complete.
   admin@ncs(config)# devices device dev-1 disconnect
   admin@ncs(config)# devices device dev-1 connect
   result true
   info (admin) Connected to dev-1

  Note that in order for the warning exception to take effect, you
  must disconnect and connect again, to re-read ned-settings.


## 6.2. ned-settings cisco-ios write config-dependency
------------------------------------------------------

  - write config-dependency <id> <mode> <move> <action> <stay>

  This ned-setting can be used to add dynamic dependency rules to
  the NED before being permanently fixed in the NED. This can be
  useful if a dependency bug is found and you do not want to upgrade
  the NED or are in a hurry for the fix.

  Apart from the list id, each ned-setting list entry is configured with:

  mode
   Regex specifying config mode where the rule is checked, don't set
   for top-mode.

  move
   Regex specifying line(s) to move.

  action
   Where to move the line(s). Can be set to before|after|last|first.

  stay
   Regex specifying where 'move' lines will be moved with
   before|after action.


## 6.3. ned-settings cisco-ios write inject-command
---------------------------------------------------

  - write inject-command <id> <config-line> <command> <where>

  The cisco-ios write inject-command ned-setting can be used to inject
  command line(s) in a transaction. This can be needed, for example,
  when deleting crypto config which requires a clear command to be
  run before delete.

  The ned-settings is configured with:

  id
   User defined name for this ned-setting used to identify the list entry

  config-line
   The config line(s) where command should be injected (DOTALL regexp)

  command
   The command (or config) to inject after|before config-line.
   Prefix with 'do ' if you want to run exec command in config mode.
   Prefix with 'exec ' if you want to run exec command in exec mode.

  'where', eight values are supported:
    before-each
     inject command before each matching <config-line>
    before-first
     inject command before first matching <config-line>
    after-each
     inject command after each matching <config-line>
    after-last
     inject command after last matching <config-line>
    before-topmode
     inject command before regex <config-line> topmode
    after-topmode
     inject command after regex <config-line> topmode
    first
     inject command first if regex <config-line> matches or is unset
    last
     inject command last if regex <config-line> matches or is unset

  An example (of a previously hard coded inject case):

   devices global-settings ned-settings cisco-ios write inject-command C1 config-line
    "no crypto ikev2 keyring \\S+" command "do clear crypto session" before-first
   devices global-settings ned-settings cisco-ios write inject-command C2 config-line
    "no crypto ikev2 keyring \\S+" command "do clear crypto ikev2 sa fast" before-first

  The above inject command configs will cause a delete of ikev2 keyring to
  look like this:

   do clear crypto session
   do clear crypto ikev2 sa fast
   no crypto ikev2 keyring XXX

  $i (where i is value from 1 to 9) can also be used to inject
  matches values from the config line. For example:

   devices global-settings ned-settings cisco-ios write inject-command C2 config-line
    "no interface Tunnel(\\d+)" command "do clear dmvpn session interface Tunnel $1 static" before-first

  with a deletion of interface Tunnel100 results in:

   !do clear dmvpn session interface Tunnel 100 static
   no interface Tunnel100

  Hence, $1 is replaced with the first group value from the config line,
  which is (\\d+).


## 6.4. ned-settings cisco-ios write replace-commit
---------------------------------------------------

  - write replace-commit <id> <regexp> <replacement>

  The write replace-commit list ned-setting can be used to replace or
  filter out config line(s) upon writing to device.

  Apart from the list id, the setting takes one mandatory leaf and
  one optional:
   regexp
     The regular expression (DOTALL) to which the config is to be
     matched.
   replacement
     The string which would replace all found matches. May use
     groups from regexp. Leave unset for filtering.

  The setting works much like String.replaceAll, i.e. it replaces
  all matches, can use regexp catch groups etc.


## 6.5. ned-settings cisco-ios write inject-answer
--------------------------------------------------

  - write inject-answer <id> <question> <answer> <ml-question>

  Some config commands may prompt the CLI for a password, or answer to a
  question. The NED will automatically answer Y(ES) to all such
  standard questions, assuming the config should take effect.

  Some questions though, like password prompts, the NED will not know
  the answer to. In such cases, the NED must be configured with the
  correct answer(s) to a question using the write inject-answer
  ned-setting list.

  The ned-settings is configured with:

  question
    Last line of the device question, regular expression

  answer
    Answer(s) to device question. Separate multiple answers and end
    with \n.

  ml-question
    Multi-line question, DOTALL regular expression [optional]

  For example, when enabling a pki server config with "no shutdown",
  the user must submit a password (twice) the first time. The question
  from the device will look like this:

  %Some server settings cannot be changed after CA certificate generation.
  % Please enter a passphrase to protect the private key
  % or type Return to exit
  Password:

  The password must be submitted twice, hence a second question from
  the device will show once the password is entered the first time:

  Re-enter password:

  Both questions, prompting for the password,  may be answers with a
  single inject-answer entry (note the double \n below):

  devices device <iosdev> ned-settings cisco-ios write inject-answer A1
             question "\\APassword:" answer "cisco123\ncisco123\n"

  If there are identical password prompts which require different
  passwords, use the ml-question to specify which entry should be used
  for which, e.g.:

  devices device <iosdev> ned-settings cisco-ios write inject-answer A1
             question "\\APassword:" answer "cisco123\ncisco123\n"
             ml-question "changed after CA certificate generation"


## 6.6. ned-settings cisco-ios write config-archive
---------------------------------------------------

  When config-archive is configured IOS NED will save running-configuration into file(s) on device.

  The running-configuration is copied after NED performs 'write memory'.

  The errors during copy, if any, should be ignored (with log entry), hence if a copy operation
  fails the transaction proceeds to success, and any subsequent copy operations are attempted.
  The transaction succeeds even when all copy operations fail.
  Each list entry, unless disabled, will result in a copy operation.

  The copy operation is performed as 'copy /noverify running-config url'

  The url for destination is formed in the following manner:
  1. Substitution is performed on filename:
           %h is replaced with device name, which is NSO /devices/device/name
           %d is replaced with NSO system date in YYYY-MM-DD format
           %t is replaced with NSO system time in hh:mm:ss format
           %i is replaced with NSO Maapi transaction id
     Each of substituional sequences is optional.  The sequences can appear in any order.

     For example following filenames are valid:
       config_backup.txt
       config_backup_%h.txt
       config_backup_%h_%i.txt
       config_backup_%h_%dT%t_%i.txt
       %i_%d_%h.txt

  2. If type = 'remote' and remote-user or remote-user and remote-password specified,
     substitution is performed on directory by splicing in user/password, e.g.
       directory    scp://server.examle.com/
       remote-user  archiveuser
       remote-user  archivepassword
       result       scp://user:password@server.examle.com/

  3. Result of directory and filename substitution joined together to form target url

     The NED does not verify resulting url for validity.

          NED does not create directories, hence the copy operation will fail if directory does not exist.
          The copy destination can be local or remote.
          Remote destinations support addition of remote-user/remote-password described above.

          Local destinations support following additional features:

      Maximum files:

      After the copy operation completes, NED will:

        1. Perform directory listing on the device
             dir directory

        2. If the directory contains more then max-files files, NED will remove oldest files,
           so that only max-files are left in the directory
             delete /force directoryAndOldFileName

      If max-files is configured, it is critical that the directory is dedicated to keeping
      the archive, otherwise non-archive files may be removed.  This is especially dangerous
      if the directory is committed all together or points to the root of local system, which
      will lead to removal of ios image and startup configuraiton files.


# 7. ned-settings cisco-ios auto
--------------------------------

  Configure auto (dynamic behaviour) when reading or writing from|to device.


    - auto vrf-forwarding-restore <true|false> (default true)

      This setting can be used to disable the NED automatic behaviour or
      restoring the interface addresses on the device when vrf is
      changed (deleted or set) on an interface.


    - auto ip-vrf-rd-restore <true|false> (default true)

      This setting can be used to disable the NED automatic behaviour or
      restoring the route-targets on the device when rd is changed in an
      ip vrf.


    - auto ip-community-list-repopulate <true|false> (default false)

      Restore ip community-list after delete of individual entry (for cat3550) (write).


    - auto interface-switchport-status <true|false> (default false)

      This ned-setting is used to auto inject 'switchport' or 'no
      switchport' when reading Ethernet or Port-channel switchport
      status. If enabled, the NED will execute a "show int <interface>
      switchport" to determine if switchport is enabled or not on the device.

      WARNING: Enabling this option downgrades performance. For optimal
      performance, see section 12. Fixing switchport issues .. in README.md


    - auto if-switchport-sp-redeploy <true|false> (default true)

      Redeploy service-policy input|output when toggling switchport in interface (write).


    - auto if-switchport-sp-patch <true|false> (default false)

      Auto-inject explicit delete of service-policy input|output when toggling switchport in
      interface (fixes me3600 issue) (write).


    - auto if-switchport-create-hook <true|false> (default true)

      This ned-setting is used to dynamically delete 'ip address' and/or
      'no ip address' when switchport container is created on an interface.

      WARNING: This dynamic behaviour may break service code and will in
               the near future be deprecated. The work around is to manually
               delete all interface ip adress config when switchport is created.


    - auto if-address-delete-patch <true|false> (default true)

      Pre-inject interface shutdown or address delete in order to solve dependency issues (write).


    - auto bgp-nbr-password-patch <true|false> (default true)

      Pre-inject dummy 0 password in router bgp neighbors to solve password not set (write).


    - auto use-ip-mroute-cache-distributed <true|false> (default false)

      Send 'ip mroute-cache distributed' instead of 'ip mroute-cache' (write).

      Note: cat3560/3750 allow 'ip mroute-cache distributed'
      cat4506 allows 'ip mroute-cache'
      Both just shows 'ip mroute-cache' in show running-config.


    - auto compress-spanning-tree-vlan <true|false> (default false)

      Set to true if want the NED to compress delete|create of 'spanning-tree vlan' (write).


    - auto stackwise-virtual-if-indent-patch <true|false> (default true)

      Set to false if you want to disable the stackwise-virtual interface left-indent patch (read).


    - auto cdp-read-inject <WORD>

      Enable auto-inject of 'no cdp run' and 'interface <regex> / no cdp
      enable' for devices with CDP disabled by default (read).

      set regex to enable and specify which interface(s) to inject 'no cdp enable' in.


    - auto interface-range-write <true|false> (default false)

      Enable use of 'interface range' config command when modifying
      multiple existing interfaces with the same sub-mode config.
      Notice: for some obscure reason IOS does not allow service
      instance to be modified with interface range command, hence
      interfaces with such config modifications are excluded from this
      feature.


    - auto disable-config-lock-if-sp <true|false> (default false)

      Disable interface service-policy config locks (warning: IOS version specific).


# 8. ned-settings cisco-ios api
-------------------------------

  Configure API (new API features/changes).


    - api police-format <enum>

      There are a number of different formats used among IOS devices
      for police configurations.

      The NED usually is able to auto detect the correct format to use.
      However, in some cases it is necessary to configure this manually.
      For instance when connecting the NED to a new type of IOS device.

      Five different settings are possible:

      auto     - Let the NED probe the device for the correct format.

      cirmode  - police cir <bps> [[bc <burst-normal>] [be <burst-max>]][pir <bps> [be
                 <burst-bytes>]] ACTIONS.

      bpsflat  - police <bps> bps <byte> byte ACTIONS.

      numflat  - police <bps> <burst> exceed-action {drop | policed-dscp-transmit}].

      cirflat  - police cir <bps> bc <burst-normal> ACTIONS.


    - api new-ip-access-list <true|false> (default false)

      This ned-setting is used to switch to the new improved 'ip access'
      YANG API which orders access-list entries on the sequence number
      instead of the rule line. See tailf-ned-cisco-ios.yang for syntax.


    - api access-list-resequence <true|false> (default false)

      This ned-setting is used to switch to the third method of configuring
      ip access-list extended, allowing for moving or inserting new entries
      without removing the current entries like the default method must do.

      Make sure the device does not have 'ip access-list persistent' set.
      Do not use access-list sequence numbers in NSO (or on the device). The NED
      will dynamically use the sequence numbers when inserting/moving access-list
      entries by starting of with a 'ip access-list resequence' command.
      To understand the new YANG model, set the access-list(s) on the device and
      sync-from to NSO, and/or grep the YANG file for 'resequence'.

      NOTES: - remark entries are not supported due to IOS does not number them.
      - ipv6 is not supported due to lack of ipv6 resequence command.
      - standard ip access-list not supported due to device not ordering
        the lists using the sequence number, entries always added last.


    - api acl-resequence-range <1-2147483647> (default 1000)

      Used with 'acl-resequence-range' to set resequence range.


    - api unordered-ip-access-list-regex <WORD>

      Specify which access-list entries should be stored in unordered
      list. To use:

      1) - Configure a regex (excluding braccets) specifying which lists should
           should reside in the unordered extended list, e.g.:
           ned-settings cisco-ios api unordered-ip-access-list-regex "UNORDERED.+"

           Note: The NED will add the unordered keyword if list matches the regex
                 when reading from the device.

      2) - Configure the accesss-list in ip/access-list/unordered list
           Note: when NED commits the list, it will strip the unordered keyword.


    - api new-snmp-server-host <true|false> (default false)

      This ned-setting is used to switch to the new improved 'snmp-server host'
      YANG API which allows multiple community strings. See YANG for syntax.
      NOTE: New api requires 'traps' or 'informs' due to YANG limitations.


    - api aaa-accounting-mode-format <true|false> (default false)

      Enable the newer aaa accounting mode format. Set to automatically
      transform output of aaa accounting to the newer mode format syntax.


    - api aaa-accounting-dot1x-mode-format <true|false>

      Override the general aaa accounting mode format ned-setting for dot1x only.


    - api expanded-line-vty-format <true|false> (default false)

      Set this ned-setting to true to support individual editing of
      'line vty <start> <end>' entries in show running-config. This will
      fix all issues with overlapping line vty entries in show running.
      Note: when this ned-setting is set to true, then the dual-key line vty
      list is disabled and only the 'vty-single-conf' line is used.


    - api pretty-line-vty-format <true|false> (default false)

      Set this ned-setting to true to format commit for pretty print in
      line vty 'show run' on device.  More specifically, it will extract
      identical line vty passwords and commit in a single range to avoid
      the device encrypting them with different IV's.


    - api new-mls-qos <true|false> (default false)

      Switch to use the new mls qos API, supporting duplicate values in 'mls qos map cos-dscp'.


    - api ios-common <true|false> (default false)

      Enable this ned-setting to unify some of IOS API discrepancies. The NED
      will auto-correct differences when reading from device. In order to avoid
      configuration diff, you must only use ONE API in the NED.

      Currently affected API's are:

      'logging *' and 'logging host *'     - Use 'logging *' list only.

       WARNING: Changing the above ned-settings will most likely affect the YANG model.


    - api snmp-server-enable-all-traps <int32> (default 0)

      Set to non-zero value to treat all 'snmp-server enable traps' as one 'all-traps'
      leaf i.e. 'snmp-server enable all-traps' instead of individual ones in a list.
      Set to negative or positive value, representing two different variants:
      (1) set to a positive value for minimum amount of traps on device
      (2) set to a negative value for maximum missing, i.e. -1 = no missing traps
      Hence, if the above condition is met, the all-traps leaf is set in show().


    - api new-aaa-list-syntax <true|false> (default false)

      Switch to use the new aaa authorization syntax, supporting user ordering of config items.


    - api class-map-match-multi-line-format <true|false> (default false)

      Switch to use multi-line format for class-map / match dscp|precedence statements.


# 9. ned-settings cisco-ios live-status
---------------------------------------

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

      This ned-setting can be used to enable to enable stricter prompt
      matching for 'live-status exec any' commands. Setting it to include
      %p will make the NED send an initial newline to determine the device
      prompt, there after use that exact prompt in the following command(s).


    - live-status template-root <WORD>

      This is ned-setting is used to debug GILI templates under
      development. Set to an external directory where you store your
      GILI templates (normally under <ned>/src/gili. The advantage
      of an external directory is (1) you do not have to re-build the
      package each time you change a template and (2) templates in
      external directory are never cached by the NED, hence can be
      modified while testing in ncs_cli.


    - live-status always-show-exec-command <true|false> (default false)

      Normally sent command is only shown if multiple commands are sent using ';' delimiter in
      'live-status exec any' action. But if this setting is set to true, single commands are also
      shown.


## 9.1. ned-settings cisco-ios live-status auto-prompts
-------------------------------------------------------

  See section 5. Built in live-status actions in README.md for information
  on how to use this ned-setting.


# 10. ned-settings cisco-ios developer
--------------------------------------

  Contains settings used by the NED developers.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


    - developer prepare-dry-model <WORD>

      Specify temporary device model for prepare-dry output.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level reported by the NED.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - developer failphase <WORD> (default )

      For internal debugging, do not set.


    - developer extended-parser-fallback <true|false> (default true)

      Fallback to NSO parser upon Exception in turbo extended-parser.


    - developer fail is-alive <uint32> (default 0)

      Simulate isAlive() method returns false to trigger device reconnect.


    - developer disable-config-locks <true|false> (default false)

      Disable config locks. WARNING: Some commits must be split into two commits with locks
      disabled.


    - developer load-native-config allow-delete <true|false> (default false)

      Enable this setting to be able to handle limited delete operations with 'load-native-config'.
      Please note that not all syntax available on a real device works, some delete operations can
      not be parsed by the NED. Use the 'verbose' flag to 'load-native-config' to see if delete
      commands can be parsed. Currently this is only supported when 'extended-parser' is set to
      'turbo-xml-mode'.


    - developer load-native-config delete-with-remove <true|false> (default false)

      Enable this setting to use 'remove' instead of 'delete' when sending delete operations to NSO.
      This is useful when doing delete commands for data that might not be present in CDB. Please
      note that deletes for missing data will still be part of transaction, and will be sent to
      device. Use with care, and do proper testing to understand behaviour.


## 10.1. ned-settings cisco-ios developer simulate-show
-------------------------------------------------------

  Used with live-status to inject simualted output for a show command.

    - developer simulate-show <cmd> <file>

      - cmd <WORD>

        Full show command, e.g. 'show version'.

      - file <WORD>

        Path to file containing output of simulated show command.


