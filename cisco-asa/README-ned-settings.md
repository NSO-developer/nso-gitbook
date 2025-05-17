# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-asa/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-asa/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-asa/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-asa

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-asa
  2. logger
  3. connection
  4. proxy
  5. read
  6. write
     6.1. config-dependency
     6.2. config-archive
  7. scp-transfer
  8. context
     8.1. list
  9. admin-device
  10. api
  11. auto
  12. live-status
     12.1. auto-prompts
  13. developer
     13.1. simulate-command
  ```


# 1. ned-settings cisco-asa
---------------------------

  The following top level ned-settings can be modified.


    - extended-parser <enum> (default auto)

      Configure config parsing method.

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


# 2. ned-settings cisco-asa logger
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


# 3. ned-settings cisco-asa connection
--------------------------------------

  Connection configuration.


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


    - connection terminal height <uint32> (default 24)


    - connection terminal server-echo <true|false> (default false)

      Enable (TELNET) server echo, i.e. use DO ECHO instead of DONT ECHO.


    - connection terminal println-mode <enum> (default default)

      Print line mode, i.e. whether to send carriage return and/or newline.

      default  - System property line.separator default.

      ocrnl    - Translate carriage return to newline.

      onocr    - Translate newline to carriage return-newline.

      onlret   - Newline performs a carriage return.


    - connection ssh client <enum> (default default)

      Specify which SSH client NSO uses to connect to the device as well
      as what SSH implementation the NED will use for SSH and SCP.
      Two SSH clients are supported:

      default  - default.

      sshj     - The new SSH client with support for the latest crypto features (default after NSO
                 version 5.6 or later).

      ganymed  - The legacy SSH client (used on all NSO version older than 5.6).


    - connection ssh keep-alive-interval <0-4294967295>

      Configure SSH client keep alive interval in seconds, default 0.


    - connection ssh host-key known-hosts-file <WORD> (default )

      Path to known-hosts file.


    - connection ssh primary-host-key key-data <binary>

      The binary data for the primary SSH host key.


    - connection ssh secondary-host-key key-data <binary>

      The binary data for the secondary SSH host key.


# 4. ned-settings cisco-asa proxy
---------------------------------

  See sections 10 and 11 in README.md for information on proxy ned-settings
  used to connect via a jump host, terminal server or "exec" proxy,
  i.e. executing a command/script to connect to device.


# 5. ned-settings cisco-asa read
--------------------------------

  Settings used when reading from device.


    - read transaction-id-method <enum> (default config-hash)

      Method for calculating transaction id.

      config-hash         - Calculate MD5 on a snapshot of the entire running config for
                            calculation.

      show-checksum       - Use built in 'show checksum' Cryptochecksum.

      config-hash-cached  - DEPRECATED. Same as config-hash since both methods now reuse
                            transaction-id from last show.


    - read transaction-id-provisional <true|false> (default true)

      Set to false to disable use of new NSO feature to set provisional
      transaction-id in show() to save a call to getTransId() with
      sync-from.


    - read use-startup-config <true|false> (default false)

      This setting is used to change the method for retrieving
      config. The normal procedure is to check whether the config is
      saved, and if it is, list the saved file using 'more'. And if it
      is not saved, the current configuration is shown using show
      running-config. Setting this method to true however, will change
      the behaviour of the NED to always show the saved file, regardless
      of whether the current configuration is newer. This can be useful
      to avoid a race condition if multiple NCS clients are used.


    - read scp-transfer method <enum> (default disabled)

      disabled  - disabled.

      enabled   - enabled.


    - read running-config-retries <NUM> (default 600)

      Maximum number of retries (1 per second) when accessing running-config and the filed is
      locked.


# 6. ned-settings cisco-asa write
---------------------------------

  Settings used when writing to device.


    - write memory-setting <enum> (default on-commit)

      Configure how and when an applied config is saved to persistent memory on the device.

      on-commit      - Save configuration immediately after the config has been successfully applied
                       on the device. If an error occurs when saving the whole running config will
                       be rolled back.

      disabled       - Disable saving the applied config to persistent memory.

      on-commit-all  - Same as on-commit except that when using multiple contexts all contexts are
                       saved, as opposed to the default which is to save only modified contexts
                       individually.


    - write memory-standby <true|false> (default false)

      Send an initial 'write standby' when config is saved to persistent memory.


    - write config-session-mode <enum> (default disabled)

      This setting is used to enable use of "configuration session" when
      modiyfing access-list, object and object-group. The entries will
      be modified in an isolated session in order to make the changes
      atomic. See ASA documentation for more details. Three modes exist:

      disabled          - Use of config session is disabled.

      enabled           - Use of config session is enabled (note: ignored with SCP upload).

      enabled-fallback  - Use of config session is enabled. Fallback to config terminal if fails due
                          to config session specific error.


    - write number-of-lines-to-send-in-chunk <1-1000> (default 32)

      Some config may be sent in chunks to the device instead of line by line.
      A higher number normally results in better performance but may also have
      a negative impact on the error handling.

      If you get an 'Internal ERROR: retry-command', set this setting to 1 and
      report the config line which triggered the exception.
      Also be aware that setting the number too high may result in the NED
      being blocked due to the device not able to receive all lines and the
      output discarded by the device.


    - write compress-acl-delete <true|false> (default false)

      Use this setting to control delete of entire access-lists. If set
      to true, the entire access-list is deleted using a single command
      (clear config access-list <name>). If left at its default - false
      -each access-list entry is deleted individually when deleting the
      entire access-list.

      WARNING:
       When using this ned-setting and switching between standard and extended
       access-list entries with the same name the device may end up in a bad state
       not allowing creation of an access-list entry of different type, i.e.
        asav-1(config)# clear config access-list ACL2
        asav-1(config)# access-list ACL2 standard permit any4
        ERROR: Cannot mix different types of access lists
       The only work around we found (so far) is to reboot the device and either
       disable the use of this ned-setting, or do not reuse the same name for
       access-lists with different type.


    - write recreate-acl-threshold <0-429496729> (default 0)

      This setting is used to set a threshold where the NED will delete
      the entire access-list and add back remaining rules after a list
      modification. Note this will not work if an object is referring to
      the access-list, blocking the delete.
      Default is 0, i.e. disabled behaviour.


    - write scp-transfer threshold <0-2147483647> (default 2147483647)

      The minimum threshold in bytes when to transfer the config changes using SCP.


    - write slow-newline-delay <uint16> (default 0)

      Configure delay in milliseconds before sending newline with slow
      commands. Used if ASA device has problem accepting CLI commands
      without a delay between having sent the command and newline.


    - write serialize-maapi-acl-read <true|false> (default false)

      Serialize access-list Maapi read from CDB in order to avoid NSO performance problem.


    - write ignore-invalid-input-delete-errors <true|false> (default false)

      Ignore 'Invalid input' delete errors, which may happen when interface is dynamically deleted
      by admin device.


## 6.1. ned-settings cisco-asa write config-dependency
------------------------------------------------------

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


## 6.2. ned-settings cisco-asa write config-archive
---------------------------------------------------

  When config-archive is configured ASA NED will save running-configuration into file(s) on device.

  The running-configuration is copied after NED performs 'wr mem'.

  The errors during copy, if any, should be ignored (with log entry), hence if a copy operation
  fails the transaction proceeds to success, and any subsequent copy operations are attempted.
  The transaction succeeds even when all copy operations fail.

  Each list entry, unless disabled, will result in a copy operation.

  The copy operation is performed as
  copy /noconfirm running-config url

  The url for destination is formed in the following manner:
  1. Substitution is performed on filename:
  %h is replaced with device name, which is NSO /devices/device/name
  %d is replaced with NSO system date in YYYY-MM-DD format
  %t is replaced with NSO system time in hh.mm.ss format
  %i is replaced with NSO Maapi transaction id
  Each of substitutional sequences is optional.  The sequences can appear in any order.
  For example following filenames are valid:
  config_backup.txt
  config_backup_%h.txt
  config_backup_%h_%i.txt
  config_backup_%h_%dT%t_%i.txt
  %i_%d_%h.txt

  2. If type = 'remote' and remote-user or remote-user and remote-password specified,
  substitution is performed on directory by splicing in user/password, e.g.
  directory       scp://server.examle.com/
  remote-user     myuser
  remote-password mypassword
  result          scp://myuser:mypassword@server.examle.com/

  3. Result of directory and filename substitution joined together to form target url

  The NED does not verify resulting url for validity.

  NED does not create directories, hence the copy operation will fail if directory does not exist.

  The copy destination can be local or remote.

  Remote destinations support addition of remote-user/remote-password described above.

  Local destinations support following additional features:

  Maximum files

  After the copy operation completes, NED will:

  1. Perform directory listing on the device
  dir directory

  2. If the directory contains more then max-files files, NED will remove oldest files,
  so that only max-files are left in the directory
  delete /noconfirm directoryAndOldFileName

  If max-files is configured, it is critical that the directory is dedicated to keeping
  the archive, otherwise non-archive files may be removed.  This is especially dangerous
  if the directory is committed all together or points to the root of local system, which
  will lead to removal of asa image and startup configuraiton files.

  Repeat on standby

  When this option is configured, the archive will be maintained on standby unit, in addition to
  primary unit:

  - For each local copy command, the NED will perform the copy on standby unit:

  Example command for primary unit copy:
  copy /noconfirm running-config flash:/archive/config.17325.txt

  Example command for backup unit copy:
  failover exec mate copy /noconfirm running-config flash:/archive/config.17325.txt

  - For each local delete command, the NED will perform the delete on standby unit:

  Example command for primary unit copy:
  delete /noconfirm flash:/archive/config.17325.txt

  Example command for backup unit copy:
  failover exec mate delete /noconfirm flash:/archive/config.17325.txt

  Device command references:
  copy     https://www.cisco.com/c/en/us/td/docs/security/asa/asa-command-reference/A-H/cmdref1/c4.html#pgfId-2171368
  delete   https://www.cisco.com/c/en/us/td/docs/security/asa/asa-command-reference/A-H/cmdref1/d1.html#pgfId-2253948
  dir      https://www.cisco.com/c/en/us/td/docs/security/asa/asa-command-reference/A-H/cmdref1/d2.html#pgfId-1996367

    - write config-archive <id> <disabled> <type> <directory> <filename> <remote-user> <remote-password> <repeat-on-standby> <max-files>

      - id <string>

        The ID of config-archive entry.

      - disabled <true|false> (default false)

        Disable archiving for specific list entry.

      - type <enum> (default local)

        Type of target local/remote. Local archiving has additional features.

        local   - Local storage, e.g. disk0: flash:.

        remote  - Remote storage (e.g. using ftp: scp: tftp:).

      - directory <string>

        URI for target directory, e.g. flash:/archive/ or scp://1.2.3.4:disk0:/archive/.

      - filename <string>

        Filename, use %h,%d,%t,%i for substitution.

      - remote-user <string>

        User name.

      - remote-password <string>

        Password.

      - repeat-on-standby <true|false> (default false)

        Perform same config archive operation on standby unit.

      - max-files <0-1000> (default 10)

        Maximum number of files to keep on local storage.


# 7. ned-settings cisco-asa scp-transfer
----------------------------------------

  SCP Client configuration.


    - scp-transfer directory <WORD> (default disk0:/)

      Path to temporary config file used to copy from/to running-config.


    - scp-transfer file <WORD> (default %c-scp%i-%x.cfg)

      Temporary config file name used to copy from/to running-config.


    - scp-transfer cli-keepalive-interval <0-4294967> (default 0)

      CLI keepalive interval in seconds used during SCP upload to avoid timeout on CLI session.


    - scp-transfer cli-fallback <enum> (default disabled)

      Fallback to use CLI if SCP upload/download fails for this transaction (default disabled).

      enabled   - enabled, fallback to CLI if SCP fails due to SCP failure only.

      disabled  - disabled, do not fallback to CLI if SCP fails.


    - scp-transfer number-of-retries <0-255> (default 0)

      Maximum number of extra retries the NED will try to connect before giving up.


    - scp-transfer time-between-retry <1-255> (default 1)

      Time in seconds the NED will wait between each connect retry.


    - scp-transfer max-sessions <1-255> (default 1)

      Maximum number of sessions open at the same time.


    - scp-transfer device-name <WORD>

      Device name for the SCP server if different from this device. Used by user contexts.


    - scp-transfer device2-address <WORD>

      Second (standby) device address for active/active failover mode with group 2 (secondary)
      contexts.


    - scp-transfer device-lookup <true|false> (default false)

      Set to true if NED should connect to admin device prior to SCP to determine correct IP
      (instead of intelligent guess with fallback).


    - scp-transfer failover group <1-2>

      failover group number.


    - scp-transfer failover priority <enum>

      primary    - Primary unit has higher priority.

      secondary  - Secondary unit has higher priority.


# 8. ned-settings cisco-asa context
-----------------------------------

  Context settings.


    - context name <WORD>

      Specify context name for single context login on multiple mode device.


    - context interface-wait-seconds <0-3600> (default 0)

      Number of seconds to wait (by polling) for a user-context interface command to succeed before
      returning error.


## 8.1. ned-settings cisco-asa context list
-------------------------------------------

  The 'context list' ned-setting can be used to configure supported
  contexts for admin restricted admin logins. The context name(s) can
  be specified using a regexp expression.

    - context list <name> <hide-configuration>

      - name <WORD>

        Context name.

      - hide-configuration <true|false> (default false)

        Set if want to hide context configuration).


# 9. ned-settings cisco-asa admin-device
----------------------------------------

  The 'admin-device' ned-settings can be used to specify a secondary
  SSH connection to the admin login on a single context device
  (i.e. using the cisco-asa context name setting). The reason for
  the admin connection is to be allowed to read secrets using the
  more command. WARNING: Running-config must be saved or more command
  will not be used, hence make sure to not have cisco-asa write
  memory-setting set to disabled.

  Furthermore, the cisco-asa read use-startup-config may be needed to
  handle obfuscated secrets correctly, since they are only shown in
  cleartext by the admin context.

  Finally, an alternative way to avoid having to use admin-device
  connection (if you are using ASA 9.6.(2) or newer) is to configure a
  'storage-url'. By setting this config, a context can use the more
  system:running-config command and show secrets in clear text this way.


    - admin-device name <leafref>

      Set with single context use to specify an admin device hostname
      used to retrieve device secrets using the more command.


    - admin-device method <enum> (default ssh)

      Method to use to retrieve user-context config from the admin-device.

      maapi      - Use MAAPI to pull the config from the admin-device.

      ssh        - Use a direct SSH connection to the admin-device to pull the config, close after
                   use.

      ssh-reuse  - Use a direct SSH connection to the admin-device to pull the config. Reused, i.e.
                   kept open.


    - admin-device number-of-retries <uint8> (default 0)

      Configure max number of extra retries the NED will try to connect to the admin device before
      giving up.


    - admin-device time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each admin connect retry.


    - admin-device max-sessions <uint8> (default 1)

      Configure the maximum number of sessions open at the same time. Default 1.
      NOTE: It is the admin-device ned-setting which is used, not the context(s).


    - admin-device cache-standby-secrets <true|false> (default false)

      Cache standby device system context secrets when committing config.


# 10. ned-settings cisco-asa api
--------------------------------

  Configure API (new API features/changes).


    - api include-version-in-config <true|false> (default false)

      Insert ASA version in leaf 'version' in config when reading config.


    - api strict-access-list-config <true|false> (default true)

      This ned-setting is used to throw an Exception if an access-list contains
      numerical values representing IP proto or UDP/TCP ports (e.g. 443 to https)
      which will be transformed by the device after commit. These kind of dynamic
      transformations are not tracked by NSO and may result in unwanted consequences
      - e.g. missing, duplicate or mis-sequenced entries.


# 11. ned-settings cisco-asa auto
---------------------------------

  Configure auto (dynamic behaviour).


    - auto context-config-url-file-delete <true|false> (default true)

      This ned-setting is used to inject a delete of pre-existing
      context config-url file when context * / config-url is (re)set.
      By default it is set to true to avoid problem with pre-existing
      config if creating and initializing a context in same transaction.
      Hence if this ned-setting is set to false, a sync-from must be
      performed after setting the config-url file.


    - auto inject-forward-reference-enable <true|false> (default true)

      Enable this ned-setting to temporarily inject 'forward-reference
      enable' before any access-group, access-list, ipv6 access-list,
      object or object-group modification to solve dependency issues.


# 12. ned-settings cisco-asa live-status
----------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.


    - live-status template-root <WORD>

      This is ned-setting is used to debug GILI templates under
      development. Set to an external directory where you store your
      GILI templates (normally under <ned>/src/gili. The advantage
      of an external directory is (1) you do not have to re-build the
      package each time you change a template and (2) templates in
      external directory are never cached by the NED, hence can be
      modified while testing in ncs_cli.


## 12.1. ned-settings cisco-asa live-status auto-prompts
--------------------------------------------------------

  See section 5. Built in live-status actions in README.md for information on how to use this
  ned-setting.


# 13. ned-settings cisco-asa developer
--------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


    - developer trace-connection <true|false> (default false)

      Enable connection tracing. WARNING: may choke NSO with IPC messages.


    - developer trace-timestamp <true|false> (default false)

      Add timestamp from NED instance in trace messages for debug purpose.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer delay show <uint32> (default 0)

      Milliseconds to delay show() method in the NED. Used with compare-config and sync-from.


    - developer delay apply <uint32> (default 0)

      Milliseconds to delay applyConfig() method in the NED.


    - developer fail is-alive <uint32> (default 0)

      Simulate isAlive() method returns false to trigger device reconnect.


## 13.1. ned-settings cisco-asa developer simulate-command
----------------------------------------------------------

  Used for debugging to simulate a device response to a command.

    - developer simulate-command <cmd> <file>

      - cmd <WORD>

        Full command, e.g. 'show version'.

      - file <WORD>

        Command output file.


