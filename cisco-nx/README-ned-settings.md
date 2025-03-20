# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-nx/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-nx/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-nx/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-nx

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-nx
  2. connection
     2.1. ssl
  3. proxy
  4. proxy2
  5. logger
  6. auto-prompts
  7. system-interface-defaults
  8. live-status
  9. api
  10. read
     10.1. replace-config
  11. write
     11.1. config-dependency
  12. transaction
     12.1. config-abort-warning
     12.2. config-ignore-error
     12.3. inject-on-enter-exit-mode
  13. persistence
  14. behaviours
  15. developer
     15.1. simulate-show
  ```


# 1. ned-settings cisco-nx
--------------------------

  The following top level ned-settings can be modified.


    - cisco-nx extended-parser <enum> (default auto)

      Make the cisco-nx NED handle CLI parsing (i.e. transform the running-config from the device to
      the model based config tree).

      auto            - Uses turbo-mode when available, will use fastest available method to load
                        data to NSO.

      turbo-mode      - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO using maapi
                        setvalues call.

      turbo-xml-mode  - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO in XML
                        format.


# 2. ned-settings cisco-nx connection
-------------------------------------

  Cisco Nexus connection configuration.


    - connection number-of-retries <0-255> (default 1)

      Configure max number of retries the NED will try to connect to the device before giving up.


    - connection time-between-retry <1-255> (default 1)

      Configure the time in seconds the NED will wait between each connect retry.


    - connection connector <WORD>

      Change the default connector used for this device, profile or
      global setup. The new connector must be located in the
      src/metadata folder in the NED package, where also the README
      file is located for more information on configuring connectors.
      Default 'ned-connector-default.json'


    - connection prompt-timeout <0|1000-1000000> (default 0)

      This ned-setting can be used to configure a timeout in the
      connection process which can be used to wake the device if the
      device requires additional newlines to be sent before proceeding.


    - connection method <enum> (default cli)

      Select method to communicate with the Cisco Nexus device.

      cli           - Use the new NEDCOM connector for SSH/TELNET connect.

      nxapi         - Use the NXAPI interface.

      nxapi-legacy  - DEPRECATED: Use the NXAPI interface (using legacy apache http client).


    - connection device-output-delay <NUM> (default 0)

      Delay in milliseconds after each config command output to the device.


    - connection device-retry-count <NUM> (default 60)

      Number of times to retry commands that fail transiently (set to zero to fail instantly,
      without retry).


    - connection device-retry-delay <NUM> (default 1000)

      Delay in milliseconds after each retry on transient failure.


    - connection show-interface-all-cmd <string>

      Command(s) to use on device to get back all config from interfaces (i.e. including trimmed
      default values). NOTE: This is used together with the setting 'show-interface-all', see this
      setting for details.


    - connection split-exec-any <true|false> (default false)

      This setting is used to force sending commands (i.e. separated with ';') on one line each, like if ';' is treated
      as <newline>, when using live-status exec' or 'config exec'. This can be useful for example if the command-line is
      too long to be sent to device.

      NOTE: When this setting is used together with an answer-array, the length of the answer-array needs to match the
      number of commands (i.e. number of commands separated with ' ; ', if a command needs no answer, just enter an string)


    - connection send-login-newline <true|false> (default false)

      This ned-setting is used to send an initial newline in the login
      phase, in order to wake the device. This can be usable, for
      example, if the banner config on the device causes the login code
      to miss a prompt.


    - connection use-echo-cmd-in-cli <true|false> (default true)

      To make interaction with CLI robust (e.g. to avoid matching config as a prompt), an echo cmd
      is used as delimiter.


## 2.1. ned-settings cisco-nx connection ssl
--------------------------------------------

  Use SSL for NXAPI connections (set either 'accept-any' or a server certificate to use SSL).


      Either of:

        - devices device ned-settings cisco-nx connection ssl accept-any <true|false>

          Accept any SSL certificate presented by the device.
          Warning! This enables Man in the Middle attacks and
          should only be used for testing and troubleshooting.

      OR:

        - devices device ned-settings cisco-nx connection ssl certificate <binary>

          SSL certificate stored in DER format but since it is entered
          as Base64 it is very similar to PEM but without banners like
          "----- BEGIN CERTIFICATE -----".

          Default uses the default trusted certificates installed in
          Java JVM.

          An easy way to get the PEM of a server:
          openssl s_client -connect HOST:PORT


# 3. ned-settings cisco-nx proxy
--------------------------------

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
      $address, $port, $name for inserting remote-xxx config.


    - proxy remote-name <string>

      User name on the device behind the proxy.


    - proxy remote-password <string>

      Password on the device behind the proxy.


    - proxy remote-secondary-password <string>

      Second password (e.g. enable) on the device behind the proxy .WARNING MUST UPDATE connector
      template to use!.


    - proxy authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy proxy-prompt <string>

      Prompt pattern on the proxy host (not needed if proxy is an cisco device).


    - proxy proxy-prompt2 <string>

      Prompt pattern on the proxy after sending telnet/ssh command.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection (appended to end of ssh cmd line).


    - proxy send-login-newline <true|false> (default false)

      Send a newline after connected to the proxy to wake up the device for a login prompt.

    Do as follows to setup to connect to a NX device that resides
    behind a proxy or terminal server:

    +-----+  A   +-------+   B  +----+
    | NCS | <--> | proxy | <--> | NX |
    +-----+      +-------+      +----+

    Setup connection (A):

    # devices device cisco0 address <proxy address>
    # devices device cisco0 port <proxy port>
    # devices device cisco0 device-type cli protocol <proxy proto - telnet or ssh>
    # devices authgroups group ciscogroup umap admin remote-name <proxy username>
    # devices authgroups group ciscogroup umap admin remote-password <proxy password>
    # devices device cisco0 authgroup ciscogroup

    Optionaly, if the proxy device is a cisco (e.g. ios) device, you might also need
    to set the remote-secondary-password if needed to enable privileged mode.

    Setup connection (B):

    Define the type of connection to the device:

    # devices device cisco0 ned-settings cisco-nx proxy remote-connection <ssh-direct|telnet-direct|ssh|telnet>

    Define login credentials for the device:

    # devices device cisco0 ned-settings cisco-nx proxy remote-name <user name on the NX device>
    # devices device cisco0 ned-settings cisco-nx proxy remote-password <password on the NX device>

    Define prompt on proxy server (not needed if using ssh-direct|telnet-direct):

    # devices device cisco0 ned-settings cisco-nx proxy proxy-prompt <prompt pattern on proxy>

    Define address and port of NX device (i.e. behind the proxy):

    # devices device cisco0 ned-settings cisco-nx proxy remote-address <address to the NX device>
    # devices device cisco0 ned-settings cisco-nx proxy remote-port <port used on the NX device>
    # commit

    If not using ssh-direct|telnet-direct, then by default, the command-line that
    will be run on the proxy to connect to device (i.e. connection B) is either of
    the below (depending on selected protocol), where the $(...) will be replaced by
    the respective ned-setting:

    ssh -p $(proxy/remote-port) $(proxy/remote-name)@$(proxy/remote-address) $(proxy/remote-ssh-args)

    telnet $(proxy/remote-address) $(proxy/remote-port)

    Optionally, you can define a custom command-line to run on proxy:

    # devices device cisco0 ned-settings cisco-nx proxy remote-command <command-line>
    # commit

    Here the <command-line> can contain $address, $port, and $name which will be
    replaced by the corresponding ned-setting (i.e. proxy/remote-address et.c.)


    When connecting to a terminal server
    ------------------------------------

    Use cisco-nx proxy remote-connection serial when you are connecting to
    a terminal server. NOTE: The protocol set as the "ned protocol" (i.e. 'telnet'
    in the below example) is what is used to connect to the terminal server.

    You may also need to specify remote-name and remote-password if the
    device has a separate set of login credentials.

    Example terminal server config:

    devices authgroups group term-sj-nx3k default-map remote-name 1st-username remote-password 1st-password remote-secondary-password cisco
    devices device term-sj-nx3k address 1.2.3.4 port 1234
    devices device term-sj-nx3k authgroup term-sj-nx3k device-type cli ned-id cisco-nx protocol telnet
    devices device term-sj-nx3k connect-timeout 30 read-timeout 600 write-timeout 600
    devices device term-sj-nx3k state admin-state unlocked
    devices device term-sj-nx3k ned-settings cisco-nx proxy remote-connection serial
    devices device term-sj-nx3k ned-settings cisco-nx proxy remote-name 2nd-username
    devices device term-sj-nx3k ned-settings cisco-nx proxy remote-password 2nd-password


# 4. ned-settings cisco-nx proxy2
---------------------------------

  Configure double-proxy setup: NSO <-> proxy <-> proxy2 <-> device.


    - proxy2 remote-connection <enum>

      Connection type between proxy2 and device.

      ssh     - SSH jump host proxy.

      telnet  - TELNET jump host proxy.


    - proxy2 remote-address <union>

      Address of device behind the proxy2.


    - proxy2 remote-port <uint16> (default 22)

      Port of device behind the proxy2.


    - proxy2 proxy-prompt <string>

      Prompt pattern on the proxy2 host.


    - proxy2 proxy-prompt2 <string>

      Prompt pattern on the proxy2 after sending telnet/ssh command.


    - proxy2 remote-command <string>

      Connection command used to initiate proxy2 on proxy.


    - proxy2 remote-name <string>

      User name on the device behind the proxy2.


    - proxy2 remote-password <string>

      Password on the device behind the proxy2.


    - proxy2 authgroup <WORD>

      Authentication credentials for the device behind the proxy2.


    - proxy2 send-login-newline <true|false> (default false)

      Send a newline after connected to the device to wake it up for a login prompt.


    - proxy2 remote-ssh-args <WORD>

      Additional arguments used to establish proxy2 connection (appended to end of ssh cmd line).


# 5. ned-settings cisco-nx logger
---------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 6. ned-settings cisco-nx auto-prompts
---------------------------------------

  When using 'live-status exec any' or 'config exec' one can pass a sequence of responses to the
  device when 'standard' questions/prompts are received in the NED (i.e. with the square-bracket
  syntax described above). An alternative way to pass answer to prompts is using ned-settings
  'auto-prompts', which is a way to register standard answers to standard questions. These are
  given as a list of question/answer pairs. The 'question' in this respect is given as a regexp.

  For example, to always answer the question about overwriting files when doing file copy one can
  add the following ned-setting:

  ned-settings cisco-nx auto-prompts 1 question "Do you want to overwrite \(y/n\)\?\[n\] " answer y

  This will catch the question from the device, and answer 'y'. Note that this can be used together
  with the square-bracket responses, for example to give a password to a file-copy command.

    - cisco-nx auto-prompts <id> <question> <answer>

      - id <WORD>

        List id, any string (NOTE: list is matched in order sorted on id).

      - question <WORD>

        Device question, regular expression.

      - answer <WORD>

        Answer to device question.


# 7. ned-settings cisco-nx system-interface-defaults
----------------------------------------------------

  Settings to handle dynamic defaults of interfaces (corresponding to the setting of 'system default
  switchport' in the device), see README.md section 9.


    - system-interface-defaults handling <enum> (default disable)

      Set how the system interface defaults should be handled (see README).

      disable   - Disable the handling of dynamic interface defaults.

      auto      - Inspect how system default is set on device to automatically determine
                  switchport/shutdown, NOTE: Currenly only works with CLI, not NXAPI.

      explicit  - Explicitly set defaults to use (must be set under 'explicit').


    - system-interface-defaults explicit system-default-switchport switchport <true|false>

      Default to switchport (i.e. default Ethernet and port-channel interfaces to layer 2 or 3
      ports).


    - system-interface-defaults explicit system-default-switchport shutdown <true|false>

      Default shutdown state of physical ports (default admin state for Ethernet port, corresponding
      to 'system default switchport shutdown'.


    - system-interface-defaults default-l3-port-shutdown <true|false> (default true)

      Set this to true if L3 ports are by default 'no shutdown' eventhough the system default is L2
      ports with default 'shutdown'.


    - system-interface-defaults default-fc-shutdown <true|false> (default true)

      Set this to reflect default 'shutdown' state for fc (and vfc) interfaces (same as 'system
      default switchport shutdown san', which however doesn't seem to show up reliably on device,
      hence can't be used to determine default).


# 8. ned-settings cisco-nx live-status
--------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


# 9. ned-settings cisco-nx api
------------------------------

  Configure API (new API features/changes).


    - api snmp-server-enable-all-traps <int32> (default 0)

      Enable the all-traps API. Set to > 0 for minimum traps, < 0 for max missing traps and 0 to
      disable (default).


# 10. ned-settings cisco-nx read
--------------------------------

  Settings used when reading from device.


## 10.1. ned-settings cisco-nx read replace-config
--------------------------------------------------

  Replace (or filter) config when reading from device.

    - read replace-config <id> <regexp> <replacement>

      - id <WORD>

        List id, any string.

      - regexp <WORD>

        The regular expression (DOTALL) to which the config is to be matched.

      - replacement <WORD>

        The string which would replace all found matches. May use groups from regex.


# 11. ned-settings cisco-nx write
---------------------------------


## 11.1. ned-settings cisco-nx write config-dependency
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


# 12. ned-settings cisco-nx transaction
---------------------------------------

  Cisco Nexus transaction configuration.


    - transaction trans-id-method <enum> (default config-data)

      Select the method for calculating transaction-id.

      config-hash     - Use a snapshot of the running config for calculation.

      config-data     - Use a snapshot of the data of only the modeled parts of running config for
                        calculation.

      device-command  - Use a device-side command to get a value to use for trans-id (see
                        trans-id-cmd).


    - transaction trans-id-cmd <string> (default delete volatile:///ncstransconf.tmp no-prompt ; show running-config | exclude Time: > volatile:///ncstransconf.tmp ; show file volatile:///ncstransconf.tmp md5sum ; delete volatile:///ncstransconf.tmp no-prompt)

      To avoid the overhead of 'show running-config' in each transaction, especially with large
      device configurations this method by default let's the device calculate an md5-hash of the
      running-config by running a one line command towards device (see default value).

      This setting can be used to specify any command(s) to run on the device to get back a unique
      id for a specific device state (i.e. the specified command line will be run on the device each
      time NSO requires a transaction-id). This setting can for example use a defined 'cli alias' to
      be used together with NXAPI.

      The output from the command is hashed by the NED (to make it into a valid transaction-id in NSO),
      so the only thing to consider is that the output from the given command should be fixed for a
      given device configuration, being an equivalent of a 'hash' calculated from the 'static'
      running-config (e.g. excluding timestamp).


    - transaction enable-portchannel-set-hook <true|false> (default true)

      There is a set-hook to replicate configuration to joined interfaces for channel-groups (i.e.
      when port-channel interface is updated, certain config is replicated in the same transaction,
      within NSO, to stay in sync with device which has this behaviour). The same can easily be
      achieved in a service, which is more efficient since set-hooks can cause huge overhead.
      Specifically, if channel-groups are not configured, this set-hook can be disabled, it is of no
      use then.


    - transaction abort-on-diff <true|false> (default false)

      Enable to detect diff immediately when config is applied (i.e. in commit/abort/revert).
      If a diff is detected an exception is thrown, having the effect in commit that the transaction
      is aborted (showing the diff). Note that this means some overhead in commit, where whole config
      needs to be retrieved from device to do compare. However, if transaction id is enabled
      (i.e. use-transaction-id = true) or commit no-overwrite is used, the whole config is fetched
      before commit, and also after in case of transaction id. So if transaction id is disabled,
      and normal commit is used instead of 'commit no-overwrite', the feature 'abort-on-diff'
      is another variant to detect OOB changes, silently dropped config, and unknown side-effects
      to config (i.e. all causing a diff compared to NSO state). In fact, it's the only method which
      guarantees that the config was actually applied as desired. Also note, that if this feature
      is enabled, the fetched config will be cached for 10 seconds after commit. This has the effect
      that if transaction-id is enabled, the cached config will be used, which is strictly correct,
      i.e. if there was no diff, the transaction id should be calculated on that config.


    - transaction trace-on-diff <enum> (default never)

      Enable to trace diff compared to previous config in commit and/or check-sync. Will impose some
      overhead on commit since whole config must be fetched immediately to compare (see
      'abort-on-diff' for more info on this).

      never       - Disable trace.

      check-sync  - Only trace diff to previous config in get-trans-id (i.e. in check-sync and when
                    NSO needs transaction id), i.e. every time a new transaction id is calculated,
                    the diff compared to the config used for the previously calculated transaction
                    id is traced (level info).

      commit      - Only trace if a diff is detected when config is applied (i.e. in
                    commit/abort/revert the config after apply is compared to expected state in
                    NSO), the trace is done on level error.

      always      - Trace diff both in commit and check-sync.


    - transaction config-cache-ttl <ttl> (default 0)

      Set to non-zero to enable caching of device running-config. Value set is number of seconds to
      wait before the cached config expires, implying that next time config is needed it will be
      re-fetched from device. This means that in this "time-window" the config can potentially
      change on device, e.g. by out-of-band edit, but this is of course always the case, the device
      config known to NSO is only a snapshot in time. When NSO applies new config, the cache is
      refreshed immmediately.


## 12.1. ned-settings cisco-nx transaction config-abort-warning
---------------------------------------------------------------

  Configure additional device warnings that shall be treated as errors and trigger an abort in the
  NED. Enter as a regex.

    - transaction config-abort-warning <warning>

      - warning <string>

        Warning regular expression (will be matched MULTILINE), e.g. '^.*interface.* does not
        exist.*$'.


## 12.2. ned-settings cisco-nx transaction config-ignore-error
--------------------------------------------------------------

  Configure additional device errors that shall be treated as warnings (i.e. to be ignored, not
  aborting transaction).

    - transaction config-ignore-error <error>

      - error <string>

        Error regular expression (will be matched MULTILINE), e.g. '^.*password not.*$'.


## 12.3. ned-settings cisco-nx transaction inject-on-enter-exit-mode
--------------------------------------------------------------------

  Use to inject extra lines at enter/exit of mode in diff to send to device (optionally giving key
  to limit to specific list-entry).

    - transaction inject-on-enter-exit-mode <path> <key> <on-enter> <on-exit>

      - path <string>

        Schema path to list/container which contains mode to operate in.

      - key <WORD>

        Key value of list entry to operate in, i.e. limit injection to only one list-entry.

      - on-enter <string>

        CLI line to inject at first mode enter in diff.

      - on-exit <string>

        CLI line to inject at last mode exit in diff.

    For example when setting the following entry in this list:

      inject-on-enter-exit-mode /ip/access-list/list-name on-enter "permit ip any any" on-exit "no permit ip any any" key FOO

    NOTE: At least one of on-enter or on-exit must be set.

    After this, when for example editing sequence number 10 in the access-list entry with key FOO, the
    resulting diff sent to device will be:

    ip access-list FOO
      permit ip any any
      no 10 permit tcp any any
      10 permit udp any any
      no permit ip any any
    !

    NOTE: Since the schema path is currently used as the key in this list, only one injection can be
          done per 'mode' in the schema.


# 13. ned-settings cisco-nx persistence
---------------------------------------

  Cisco Nexus persistence configuration, i.e. if/how the NED persists configuration to the
  startup-config.


    - persistence model <enum> (default strict)

      By default the NED does 'copy running-config startup-config' after each successful transaction
      (i.e. in the persist-phase). This behaviour can be changed with this ned-setting. This setting can
      take three values described below.

      strict    - Always persist config on device as part of NCS transaction by copying
                  running-config to startup-config.

      never     - Never persist config on device as part of NCS transaction, i.e. a restart will
                  return to startup-config.

      schedule  - This setting was introduced to improve performance when for example often doing
                  several transactions in a row, where one would only want to persist the config
                  after a delayed time, to remove the time waiting for the actual copy from the
                  transactions (i.e. the device does it in the 'background'). This works by
                  configuring the device with a scheduler job which does the actual 'copy
                  running-config startup-config'. One also configures a schedule which should run
                  this job. The schedule name is given to NSO with the ned-setting 'cisco-nx
                  peristence/schedule/name'. One can also set the delay (in minutes) between the NSO
                  transaction and the actual schedule on the device (default is 1 minute). The NED
                  then schedules the job using the given schedule after the given delay.


    - persistence schedule name <string>

      Name of scheduler schedule to use (i.e. scheduler schedule name <name>).


    - persistence schedule time <1-59> (default 1)

      Number of minutes after transaction until config is to be persisted on device (default 1).

    Example config on device when using the persistence model 'schedule':
        ...
        scheduler job name NSO_PERSIST
          copy running-config startup-config
        end-job

        scheduler schedule name NSO_PERSIST_SCHED
          job name NSO_PERSIST
        !

      Used with the following ned-settings in NSO:
        ...
        ned-settings cisco-nx persistence model schedule
        ned-settings cisco-nx persistence schedule name NSO_PERSIST_SCHED
        ned-settings cisco-nx persistence schedule time 5


# 14. ned-settings cisco-nx behaviours
--------------------------------------

  Cisco Nexus NED behaviours, the settings in this section can be set to either enable, disable, or
  enabled given the value compared to the nx-os version of the device (e.g. to accomodate
  syntactic or semantic variations introduced in some version). To give a version-constraint for the
  nx-os version, the format is <comparison-operator><major>.<minor>. Examples:

      <7.0 will enable the setting for devices with nx-os version less than 7.0

      >6.2 will enable the setting for devices with nx-os version greater than 6.2

      =9.3 will enable the setting for devices with nx-os version exactly 9.3


    - behaviours iface-vlan-ipv6-secondary <union> (default <6.2)

      The setting 'iface-vlan-ipv6-secondary' selects the type of address settings
      to use for ipv6 addresses on vlan interfaces. When this setting is enabled a
      primary address must be set first, followed by secondary addresses which are
      marked with a 'secondary' tag appended to the address line. When disabled
      this tag is absent and the addresses are just added as a list.


    - behaviours show-interface-all <union> (default disable)

      This setting can be used to enable the NED to always fetch values for switchport
      settings as well as shutdown leaf for all interface instances (i.e. in spite of
      these values normally being trimmed). This setting is useful for example to mitigate
      the somewhat intricate 'dynamic' defaults behaviour NX-OS has for handling the the
      value of switchport/shutdown (due to hard-coded behaviour and/or the global setting
      'system default switchport').

      By default, the command sent to the device to fetch the defaults are:

      For CLI:
          show running-config interface all | include "interface|shutdown|switchport" | exclude Time: | exclude vlan | exclude mode

      For NXAPI:
          show running-config interface all

      The command to run on the device to fetch the needed defaults can be set using the
      new ned-setting 'show-interface-all-cmd', for example to narrow what is being sent
      from device for specific use-case (especially for NXAPI where the default doesn't
      do any device-side filtering, due to limitations depending on how NXAPI is used.

      When this ned-setting is active, by default, flowcontrol and mtu values will
      also be fetched from the device to fix problems with dynamic defaults of these
      (to exclude flowcontrol and mtu, disable ned-setting 'show-interface-extras'.
      The command used (in CLI mode) is:

         show running-config interface all | sec Ethernet | include "interface Ethernet|flowcontrol|mtu"


    - behaviours show-interface-extras <union> (default enable)

      When this setting is enabled (together with 'show-interface-all'), mtu and flowcontrol will
      also be included in result, disable this setting to exclude these.


    - behaviours show-class-map-all <union> (default disable)

      Enable this to use 'show running-config all | sec class-map' to also get default (hidden)
      class-maps into CDB. (NOTE: only works in CLI mode, not NXAPI.


    - behaviours use-show-diff <union> (default disable)

      Enable this to use 'show running-config | diff' to dramatically reduce traffic from device due
      to 'show running-config'. This setting is not enabled by default due to problems on older
      devices. Use this setting with caution and proper testing since inconsistencies hasbeen found
      on some NX-OS versions causing out-of-sync issues.


    - behaviours port-channel-load-balance-ethernet <union> (default <5.3)

      Enable 'port-channel load-balance ethernet ...' syntax (dynamically eenabled on nx5k device
      regardless of nx-os version). The standard syntax is 'port-channel load-balance [module
      <1-32>] <dst|src|src-dst> ...


    - behaviours default-notification-mac-move <union> (default >6.0)

      This setting is used to set what default value the 'mac address-table notification mac-move' leaf has.
      This affects how this value is trimmed from the config (i.e. the default is not shown). By default
      the ned assumes that in NX-OS version > 6.0 the default is enabled (i.e. mac-move is only shown when
      it is not set as 'no mac address-table notification mac-move').


    - behaviours default-lacp-suspend-individual <union> (default >5.1)

      This setting is used to set what default value the 'suspend-individual' leaf has. This affects
      how this value is trimmed from the config (i.e. the default is not shown). By default the ned
      assumes that in NX-OS version > 5.1 the default is enabled (i.e. suspend-individual is only shown
      when it is not set as 'no lacp suspend-individual').


    - behaviours vrf-member-l3-redeploy <union> (default enable)

      This setting is used to force NSO to redeploy some layer3-config to Ethernet, Vlan , Bdi, and Tunnel
      interfaces when vrf membership is set/reset. This is useful since same value can't normally be re-set
      by NSO in same transaction because NSO does not know about the 'reset-L3-config' behaviour. The config
      that is currently redeployed is marked in the yang-model with the annotation nx:data-category 'layer3'
      (acts recursively, i.e. when set on a container all config below that container will be redeployed).

      NOTE: All other config potentially flused by device, must still be removed in NSO within same
      transaction to avoid out-of-sync (i.e. all other config set in NSO, but removed by device when
      vrf membership changes)


    - behaviours switchport-mtu-redeploy <union> (default disable)

      Enable this to use automatically redeploy mtu on interface when toggling to switchport
      (otherwise mtu is reset to default).


    - behaviours default-unsupported-transceiver <union> (default >6.1)

      This setting is used to set what default value the 'service unsupported-transceiver' leaf has.
      This affects how this value is trimmed from the config (i.e. the default is not shown). By default
      the ned assumes that in NX-OS version > 6.1 the default is enabled (i.e. it only shows on the
      device when negated: 'no service unsupported-transceiver').


    - behaviours default-qos-ns-buffer-profile-mesh <union> (default disable)

      When enabled, 'mesh' is the default (i.e. trimmed) valuefor 'hardware qos ns-buffer-profile',
      otherwise burst is considered default.


    - behaviours using-qos-ns-buffer-profile <union> (default enable)

      Enable this setting if the device has 'hardware qos ns-buffer-profile'. When enabled, the setting
      'default-qos-ns-buffer-profile-mesh' is used to set the hidden default of the device.
      NOTE: The default of this setting is enabled, however, normally this setting should be disabled,
      it is enabled by default only for backwards compatibility reasons.


    - behaviours default-copp-profile-strict <union> (default disable)

      When enabled, the default value for copp profile will be 'strict' (i.e. 'copp profile strict'
      will be implied when device sends no copp profile in 'show running-config'). Use this to avoid
      sending 'no copp profile' when rolling back a change for nx-os versions that disallow that.


    - behaviours no-logging-event-link-status-default <union> (default <7.0)

      When enabled, the default value of 'logging event link-status default' is off, (i.e. the
      trimmed value).


    - behaviours force-join-channel-group <union> (default disable)

      Enable this to always use 'force' keyword when joining interface to channel-group (e.g.
      'channel-group N force mode active').


    - behaviours network-address-validation <union> (default enable)

      Enable this to validate network addresses where modeled just as
      ipv4-address-and-prefix-length.


    - behaviours cleartext-provisioning <union> (default enable)

      Enable this to allow for cleartext key/password provisioning without going out-of-sync(i.e.
      where device obfuscates/encrypts value in running-config), this will store cleartext values in
      CDB.


    - behaviours cleartext-stored-encrypted <union> (default disable)

      When 'cleartext-provisioning' is enabled, enable this setting to enforce storedvalues, in CDB,
      to be encrypted using NSO's built in encryption types (e.g.
      'tailf:aes-cfb-128-encrypted-string').NOTE: the type of the values in the yang-model of
      cisco-nx is NOT the encrypted type, it is still plain 'string', however, the service
      template/code used to set the values must use an encrypted type.


    - behaviours vtp-support <union> (default disable)

      This setting can be used to fully support configuring VTP. Normally some of the VTP configuration is
      not visible in a normal 'show running-config' hence this needs to be handled differently. To fully
      support configuring VTP, also regardless of configured mode, this ned-setting needs to be enabled.
      When used, the extra VTP config is fetched from the device by sending 'show vtp status ; show vtp password'
      and then processing the output to populate configuration not shown in running-config. The VTP operational
      status can also be viewed with 'live-status vtp' as operational data.


    - behaviours true-mtu-values <union> (default disable)

      This setting can be used to mitigate incorrect device behaviour, where wrong MTU value for ethernet
      ports is reported.

      Seemingly, when for example using a system qos policy with a default MTU, the device doesn't show
      correct MTU for ethernet ports when using the 'show running-config interface all' command
      (when the default should be displayed).

      The command which will be run to fetch the true MTU values is:

        show interface | inc "Ethernet[0-9]|MTU"

      NOTE: This ned-setting can be used either stand-alone, to correct for this behaviour, but it can also
      be used together with either 'behaviours show-interface-all', or 'system-interface-defaults handling'


    - behaviours dayzero-included <union> (default disable)

      Enable this to include some 'day-zero' config in model (e.g. 'system admin-vdc' and 'system
      default switchport'). NOTE: this config is by default marked 'read-only', enable ned-setting
      'dayzero-permit-write' to be able to write it too.


    - behaviours dayzero-permit-write <union> (default disable)

      Enable this to allow writing 'day-zero' config (see setting 'dayzero-included'), if disabled
      and this config is changed, it will cause transaction to ABORT.


    - behaviours support-per-module-obfl <union> (default disable)

      Enable this to be able to configure per-module OBFL config (i.e. 'hw-module logging onboard
      module N ...').


    - behaviours verify-spanning-tree-vlan <union> (default disable)

      Enable this to verify 'spanning-tree vlan ...' commands when applied, this avoids out-of-sync
      since device some times don't give error for faulty ranges. NOTE: The feature 'transaction
      abort-on-diff' is a more generic implementation which can be used in the general case of
      silently dropped config and/or side-effects et.c.


    - behaviours lldp-tlv-select-support <union> (default disable)

      Enable this for full support for configuring 'lldp tlv-select ...' (which is not shown in
      normal config). This will cause the command 'show running-config all | inc "^lldp tlv-select
      .*"' to be sent in addition to the normal 'show running-config' to get the device
      configuration.


    - behaviours inject-trunk-allowed-all-vlans <union> (default disable)

      Enable this to reflect the hidden default of 'all', i.e. whole range of vlans is allowed by
      default on trunk ports. This has the effect that the leaf-list
      switchport/trunk/allowed/vlan/ids is populated with 1-4094 by default (which is the hidden
      default on device), which reflects the true value of the leaf-list on device. This implies
      that the 'none' state must be handled separately (i.e. clearing the range, means 'none' must
      be set in choice).


    - behaviours buggy-snmp-traps-quirk <union> (default disable)

      Enable this to do an extra 'show running-config all | inc "traps bfd|traps pim"' to support
      strange behaviour of thes snmp-server traps which seems to change their hidden default value
      after having been toggled.


    - behaviours support-case-insensitive-type <union> (default enable)

      When this setting is enabled (default), leaf nodes which are annotated with
      'nx:case-insensitive-type' will be handled as such, hence when diff is calculated or a
      compare-config is done in NSO, the value is compared case-insensitive (e.g. if value set in
      CDB is Loopback0 and device actually stored loopback0, it is still considered equal).


    - behaviours trim-defaults-in-snmp-traps-diff <union> (default enable)

      When this setting is enabled, leaf nodes which have a default value, and which gets the
      default value set by NSO, eventhough it already has its default value on device will be
      trimmed from diff sent to device (NOTE: as name implies, this feature currently only works
      under /snmp-server/enable/traps).


    - behaviours dayzero-copp-profile-strict <union> (default disable)

      If device has been provisioned without a copp profile (i.e. defaults to strict), which is
      later reset with /control-plane/system-policy/input, it will not be possible to back out of
      that. Enable this ned-setting to handle the situation, i.e. applying 'copp profile strict'
      when removing the control-plane/system-policy/input (i.e. as opposed to sending 'no
      service-policy input ...' to device).


    - behaviours ipv6-snooping-policy <union> (default disable)

      Enable this setting to be able to configure ipv6 snooping policies.


    - behaviours have-intersight <union> (default >10.1)

      This setting selects if device has the intersight feature (by default availble in NXOS >=
      10.2), since the feature is by default enabled but 'hidden', i.e. a trimmed default, the NED
      needs to do a 'show running-config all | inc "feature intersight" to discover when it's
      enabled to stay in sync. If this is not desired, disable this setting.


# 15. ned-settings cisco-nx developer
-------------------------------------

  Contains settings used by the NED developers.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level reported by the NED.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer load-native-config allow-delete <true|false> (default false)

      Enable this setting to be able to handle limited delete operations with 'load-native-config'. Please note that
      not all syntax available on a real device works, some delete operations can not be parsed by the NED. Use the
      'verbose' flag to 'load-native-config' to see if delete commands can be parsed. Currently this is only supported
      when 'extended-parser' is set to 'turbo-xml-mode'


    - developer load-native-config delete-with-remove <true|false> (default false)

      Enable this setting to use 'remove' instead of 'delete' when sending delete operations to NSO. This is useful when
      doing delete commands for data that might not be present in CDB. Please note that deletes for missing data will still
           be part of transaction, and will be sent to device. Use with care, and do proper testing to understand behaviour.


## 15.1. ned-settings cisco-nx developer simulate-show
------------------------------------------------------

  Used with live-status to inject simualted output for a show command.

    - developer simulate-show <cmd> <file>

      - cmd <WORD>

        Full show command, e.g. 'show version'.

      - file <WORD>

        Path to file containing output of simulated show command.


