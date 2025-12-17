# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/huawei-vrp/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/huawei-vrp/
  device
    /ncs:/device/devices/device:<name>/ned-settings/huawei-vrp/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings huawei-vrp

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings huawei-vrp
  2. connection
  3. console
     3.1. warning
     3.2. command
     3.3. pattern
     3.4. action
          3.4.1. state
  4. logger
  5. proxy
  6. proxy-2
  7. transaction
  8. read
     8.1. inject-config
     8.2. replace-config
  9. write
     9.1. inject-command
     9.2. config-dependency
  10. auto
  11. live-status
  ```


# 1. ned-settings huawei-vrp
----------------------------

  huwaei-vrp device specific NED settings.


    - extended-parser <enum> (default auto)

      Make the huawei-vrp NED handle CLI parsing (i.e. transform the running-config from the device
      to the model based config tree).

      auto            - Uses turbo-mode when available, will use fastest availablemethod to load
                        data to NSO. If NSO doesn't support data-loading from CLI NED, robust-mode
                        is used.

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


# 2. ned-settings huawei-vrp connection
---------------------------------------

  Connection configuration.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of extra retries the NED will try to connect to the device before giving
      up. Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection ssh client <enum>

      default  - default.

      sshj     - sshj.

      ganymed  - ganymed.


    - connection ssh keyboard-interactive <true|false> (default false)

      Enable this when the ssh connection is done via Duo push or similar keyboard
      interactive methods


    - connection ssh keep-alive-interval <0-4294967295> (default 0)

      Configure SSH client keep alive interval in seconds, default 0.


    - connection disable-pagination-with-config <string>

      Will change screen-length in device config to 0 during connection.


    - connection device-capabilities disable-probe <true|false> (default false)

      During connection the NED will probe the device by sending commands and
      evaluating results. If the capabilities are known this setting can be used
      to disable the probe. The siblings to the disable-probe leaf can be set
      to inform the ned about the device capabilities.


    - connection device-capabilities commit <true|false> (default false)


    - connection device-capabilities switch-port <true|false> (default false)


    - connection device-capabilities igmp-snooping <true|false> (default false)


    - connection device-capabilities hwtacacs-server <true|false> (default false)


    - connection device-capabilities ntp-service <true|false> (default false)


    - connection commands meta-data <WORD>

      Change the default connector. Default 'ned-connector.json'.


    - connection commands initial-action <union>

      Interactor action used to initialize a connection.


    - connection commands awaken <string>

      Command sent to awaken console during connection.


    - connection commands send-delay <uint32> (default 0)

      Delay in ms before sending a command during connection.


    - connection commands expect-timeout <uint32> (default 60000)

      Default limit in ms for waiting for command response.


    - connection logger silent <true|false> (default false)

      Toggle detailed logs to only written to store.


# 3. ned-settings huawei-vrp console
------------------------------------

  Settings used while interacting with a device.


    - console ignore-errors <true|false> (default false)

      If set to true the ned will ignore any error messages while applying the
      configuration. Please note that this can lead to NSO being out of sync
      with the device, since some commands might not be accepted.


    - console ignore-warnings <true|false> (default false)

      If set to true the ned will ignore any warning messages while applying the
      configuration. Please note that this can lead to NSO being out of sync
      with the device, since some commands might not be accepted.


    - console ignore-retries <true|false> (default false)

      Flag indicating if retries should be ignored.


    - console max-retries <uint8> (default 100)

      Changes the maximum number of attempts to get a device to accept a
      configuration command.


    - console retry-delay <uint16> (default 1000)

      Changes the delay in milliseconds that the ned will wait before
      resending a failed command.


    - console send-delay <uint32> (default 0)

      Enable delay before sending commands.


    - console expect-timeout <uint32> (default 60000)

      Changes the default timeout in milliseconds that the ned will wait for
      a configuration command to be accepted.


    - console chunk-size <uint8> (default 1)

      This config allows the NED to send several commands at once. Please note
      that error and retry handling will not work as expected, if the the size
      is set to greater than 1, since the NED evaluates the success of each
      chunk sent.


    - console line-feed <string>

      Overwrites default line-feed character.


    - console obfuscate-secret <true|false>

      Secrets will be obfuscated in trace & log files.


## 3.1. ned-settings huawei-vrp console extension warning
---------------------------------------------------------

  Add regular expressions for warnings/errors which the ned should ignore when
  applying the configuration on a device.

    - console extension warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.*.


## 3.2. ned-settings huawei-vrp console extension command
---------------------------------------------------------

  Extend available commands to send.

    - console extension command <name> <data>

      - name <string>

        Key id of the command.

      - data <string>

        Command.


## 3.3. ned-settings huawei-vrp console extension pattern
---------------------------------------------------------

  Extend available patterns to expect.

    - console extension pattern <name> <data>

      - name <string>

        Key id of the pattern.

      - data <string>

        A regular expression.


## 3.4. ned-settings huawei-vrp console extension action
--------------------------------------------------------

  Extend available actions to perform.

    - console extension action <name> <init> <flush>

      - name <string>

        A name for the action.

      - init <string>

        Command sent to intialize action.

      - flush <true|false>

        Flush device buffer once action is completed.


### 3.4.1. ned-settings huawei-vrp console extension action state
-----------------------------------------------------------------

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


# 4. ned-settings huawei-vrp logger
-----------------------------------

  Settings for controlling logs generated.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


# 5. ned-settings huawei-vrp proxy
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


    - proxy remote-secondary-password <string>

      Password on the device behind the proxy.


    - proxy authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy proxy-prompt <string>

      Prompt pattern on the proxy host.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection (appended to end of ssh cmd line).

    Do as follows to setup to connect to a VRP device that resides
    behind a proxy or terminal server:


       +-----+  A   +-------+   B  +-----+
       | NCS | <--> | proxy | <--> | VRP |
       +-----+      +-------+      +-----+


      Setup connection (A):


       # devices device <vrpdev> address <proxy address>
       # devices device <vrpdev> port <proxy port>
       # devices device <vrpdev> device-type cli protocol <proxy proto - telnet or ssh>
       # devices authgroups group ciscogroup umap admin remote-name <proxy username>
       # devices authgroups group ciscogroup umap admin remote-password <proxy password>
       # devices device <vrpdev> authgroup ciscogroup


      Setup connection (B):

      Define the type of connection to the device:


       # devices device <vrpdev> ned-settings huawei-vrp proxy remote-connection <ssh|telnet>


      Define login credentials for the device:


       # devices device <vrpdev> ned-settings huawei-vrp proxy remote-name <user name on the VRP device>
       # devices device <vrpdev> ned-settings huawei-vrp proxy remote-password <password on the VRP device>


      Define prompt on proxy server:


       # devices device <vrpdev> ned-settings huawei-vrp proxy proxy-prompt <prompt pattern on proxy>


      Define address and port of VRP device:


       # devices device <vrpdev> ned-settings huawei-vrp proxy remote-address <address to the VRP device>
       # devices device <vrpdev> ned-settings huawei-vrp proxy remote-port <port used on the VRP device>
       # commit


      Complete example config:


       devices authgroups group jump-server default-map remote-name MYUSERNAME remote-password MYPASSWORD
       devices device ne40-via-1234 address 1.2.3.4 port 22
       devices device ne40-via-1234 authgroup jump-server device-type cli ned-id huawei-vrp protocol ssh
       devices device ne40-via-1234 connect-timeout 60 read-timeout 120 write-timeout 120
       devices device ne40-via-1234 state admin-state unlocked
       devices device ne40-via-1234 ned-settings huawei-vrp proxy remote-connection telnet
       devices device ne40-via-1234 ned-settings huawei-vrp proxy proxy-prompt ".*#"
       devices device ne40-via-1234 ned-settings huawei-vrp proxy remote-address 5.6.7.8
       devices device ne40-via-1234 ned-settings huawei-vrp proxy remote-port 23
       devices device ne40-via-1234 ned-settings huawei-vrp proxy remote-name admin
       devices device ne40-via-1234 ned-settings huawei-vrp proxy remote-password admin987


# 6. ned-settings huawei-vrp proxy-2
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


    - proxy-2 remote-secondary-password <string>

      Password on the device behind the proxy.


    - proxy-2 authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy-2 proxy-prompt <string>

      Prompt pattern on the proxy host.


    - proxy-2 remote-ssh-args <string>

      Additional arguments used to establish proxy connection (appended to end of ssh cmd line).


# 7. ned-settings huawei-vrp transaction
----------------------------------------

  Transaction specific settings.


    - transaction trans-id-method <enum> (default modeled-config)

      Select the method for calculating transaction-id.

      modeled-config       - Use a snapshot of the data of only the modeled parts of running config
                             for calculation.

      full-config          - Use a snapshot of the full running config for calculation.

      changed-config-time  - Use the timestamp shown in 'display changed-configuration time'
                             or'display current-configuration' on newer versions of VRP.(WARNING:
                             changed at reboot).

      commit-list          - For NE8000 devices, the result also contains the timestamp of the
                             current response that leads
              to out-of-sync. The ned skips
                             that and uses only the list output for the trans-id calculation.


    - transaction abort-on-diff <true|false> (default false)

      Enable to detect diff immediately when config is applied (i.e. in commit/abort/revert).
      If a diff is detected an exception is thrown, having the effect in commit that the transaction
      is aborted (showing the diff). Note that this means some overhead in commit, where whole config
      needs to be retrieved from device to do compare. It's a more exact way to detect OOB changes,
      silently dropped config, and unknown side-effects to config (i.e. all causing a diff compared 
      to NSO state). In fact, it's the only method which guarantees that the config was actually 
      applied as desired. Since this incurs overhead it is strongly adviced that this feature is
      only used during development.


# 8. ned-settings huawei-vrp read
---------------------------------

  Settings used when reading from device.


    - read snmp-agent-defaults <true|false> (default false)

      This reads the default values for snmp-agent and adds them to the display
      current-configuration output.


    - read info-center-defaults enable <true|false> (default false)

      Enable and set the info-center source default channel * values injection
      as this list is set by default, but hidden (only some device versions can use include-defaults to see it)
      When this is enabled, the ned will inject the default values present in the info-center-defaults/value string.

      For this list, the device has a special behavior:
      The deletion command with "undo" is not actually removing it from running config, but marks it with "undo" as prefix.
      Deleting it, the usual way, will leaf to out-of-sync.
      The NED behavior in this case, as the prefix "undo" is automatically considered a "no" command: the "undo" is
      set as a leaf at the end of the line.

      Setting in NSO "info-center source default channel <x> undo" will lead to device 
      "undo info-center source default channel <x>" command.

      admin@ncs(config-config)# info-center source default channel 4 undo 
      admin@ncs(config-config)# commit dry-run outformat native 
      native {
      device {
      name ne40e-1
      data undo info-center source default channel 4
      }
      }
      admin@ncs(config-config)# commit
      Commit complete.
      admin@ncs(config-config)# 

      Setting in NSO "no info-center source default channel <x> undo" will lead to 
      "info-center source default channel <x> + all the following elements with their defaults"

      admin@ncs(config-config)# rollback config                              
      admin@ncs(config)# commit dry-run outformat native 
      native {
      device {
      name ne40e-1
      data null
      info-center source default channel 4 log state on level warning trap state off level debugging debug state off level debugging
      }
      }

      *Warning*: deleting the /info-center/source/default/channel list entry with a "no" command, will lead to out-of-sync,
      as the ned will inject the default values at sync operation (similar with showing the device default entries), but NSO
      will remove the entries from cdb.


    - read file-transfer enable <true|false> (default false)

      Enable the NED to retrieve the current device config via ftp.


    - read file-transfer protocol <enum> (default sftp)

      This setting is used to select which mode of transport to use when extracting
      the current configuration from a device

      ftp   - ftp.

      sftp  - sftp.


    - read file-transfer save <true|false> (default true)

      This setting toggles whether or not to save the current device configuration
      before extracting it via file transfer


    - read file-transfer port <uint16> (default 21)

      Set a different port for ftp.


    - read enable-inject-diffserv-domain-defaults <true|false> (default false)

      This settings can be used to instruct the ned to inject default values for diffserv domain
      ip-dscp-inbound & 8021p-inbound config. Default false.


    - read enable-inject-interface-port-queue-defaults <true|false> (default false)

      This settings can be used to instruct the ned to inject default values for interface
      port-queue config. Default false.


    - read enable-inject-acl-rule-defaults <true|false> (default false)

      This settings can be used to instruct the ned to inject default values
      for acl rule configuration i.e. ip source wildcard 0 is read as 0.0.0.0 etc.


## 8.1. ned-settings huawei-vrp read inject-config
--------------------------------------------------

  This ned-setting list can be used to inject config when syncing
  from device, hence parsing display current-configuration. The
  injected config is inserted at the top or after each DOTALL regexp
  match.
  Note that in order for the new inject setting to take effect, you
  must not only disconnect and disconnect (as usual when re-reading
  ned-settings) but also perform a sync-from in order to populate
  NCS/NSO CDB with newly configured injection config.

    - read inject-config <id> <regexp> <config> <where>

      - id <WORD>

        List id, any string.

      - regexp <WORD>

        Note: If regexp is not set, the NED will only check whether to
        to add the config last or first (default).

      - config <WORD>

        Config line(s) that should be injected. May use groups ($1-$9) with regexp.

      - where <enum>

        before-each   - insert command before each matching config-line.

        before-first  - insert command before first matching config-line.

        after-each    - insert command after each matching config-line.

        after-last    - insert command after last matching config-line.


## 8.2. ned-settings huawei-vrp read replace-config
---------------------------------------------------

  The replace-config list ned-setting can be used to replace or filter
  out config line(s) upon reading from device, i.e. both in a sync-from
  and a config-hash transaction id.

    - read replace-config <id> <regex> <replacement>

      - id <WORD>

        List id, any string.

      - regex <WORD>

        The regular expression (DOTALL) to which the config is to be matched.

      - replacement <WORD>

        The string which would replace all found matches. May use groups from regex.

    Finally, a word of warning, if you replace or filter out config
    from the show running-config, you most likely will have
    difficulties modifying this config.


# 9. ned-settings huawei-vrp write
----------------------------------

  Settings used when writing to device.


    - write configuration-mode enabled <true|false> (default false)

      Enables sending the '[undo ]configuration exclusive' command.


    - write configuration-mode exclusive <true|false> (default false)

      Set to true to send 'configuration exclusive' command after system-view enter and 'undo configuration exclusive' after commit. 
      Set to false to send 'undo configuration exclusive'


    - write remove-and-redeploy-bgp-peer <true|false> (default false)

      Enable this to remove the bgp peer and re-add it, when the ipv4-family unicast peer group is changed.

      Doing this, clears the bgp configuration and redeploys it, including the ipv4-family unicast configuration,
      and avoids that the device sets default values for "route-policy export" and  "default-route-advertise", causing 
      out-of-sync.
      The outstanding configs from the above is a default behaviour of Huawei VRP, such that when peer group is changed, 
      it will try to compare the attributes of current peer group and the last one and try to add back those from the 
      last peer group which is not present in the current one. 
      E.g:
      ```
      config
      bgp 7545
      ipv4-family unicast
      peer 123.123.123.123 enable
      peer 123.123.123.123 group INTERNET-FULL
      peer 123.123.123.123 route-policy INT_BLOCK_ALL export
      peer 123.123.123.123 route-policy INT_BGP_IMPORT_BF295158 import
      peer 123.123.123.123 default-route-advertise route-policy INT_SEND_DEFAULT
      !
      !
      ```
      In this case, route-policy INT_BLOCK_ALL export and default-route-advertise route-policy INT_SEND_DEFAULT are 
      only available in INTERNET-DEFAULTONLY so they are added back directly under the peer. 
      “peer 123.123.123.123 route-policy INT_BGP_IMPORT_BF295158 import” is not affected because initially it’s 
      configured to the peer directly.

      In order to have a clear cut and not trying to let the device add back the diff of attributes back to the peer, 
      the only workaround is to remove the peer from the ipv4 address family and add it back starting from the bgp level, 
      following by enabling it in ipv4 address family and the original attributes around it.

      Default: false. This means that there is a remove-before-change behavior.


    - write commit-before-ethTrunk-set <true|false> (default false)

      Set this to true to inject a "commit" command before setting a physical interface to a eth-trunk.
      This is useful when, in the same transaction, the Eth-Trunk interface is created and a
      physical interface is assigned to it. The commit is needed because the device throws an error if the
      Eth-Trunk is not saved at the momment of assigning it.
      Note that the error message that the device throws is not very clear and might suggest some other
      part of configuration that is missing

      Note that when this is enabled, in some scenarios the intermediary commit might lead to connectivity 
      loss in a large transaction where for example the configuration regarding connecticity to the device is 
      changed and is expected to be changed in the same device commit to keep connection the whole time. 
      An unexpected commit in the middle of this might break the connectivity to the device.

      Warning! Use with caution. 
      Using this intermediary commit, means that NSO is not in charge of the
      commit, but only the NED. This path is dangerous as any problems at that
      commit will have to be handle only by the Ned (that handles only known scenarios). 
      As NSO/service is not aware of the intermediary commit, that is also
      added at abort, unforeseen things might happen, without NSO being able to properly recover. 
      Workaround available: disable intermediary commit(default false), and use 2 
      dedicated transactions for eth-trunk setting.


    - write ranged-leaf-as-list <true|false> (default false)

      Enable vlan ranged list a...b as opposed to a leaf <a to b> - mostly applied to vlans.
      Enable this to make NSO list ranges aware in cases where the ranged is specified as a leaf or two, of format <a to b>.
      When this is enabled, the NSO format will stop to be <a to b> (only the device format will be that way), and every 
      entry within the range must be set one by one.
      When this is set to false (default), NSO is not aware of the range, hence any modify operations within the range will
      be considered as a new entry and not as an operation over existing entry and not triggering remove-before-change
      behavior - if present.
      Note that enabling this will lead to multiple additional lines in the configuration input.
      E.g for a vlan range 1 to 4096, the input is requiring all 4096 lines.
      When disabled, the input requires the range format - one line - as "1 to 4096".
      For this to take effect, a sync-from is required after setting it.
      Default = false  

      Example with /interface */traffic-policy:

      Default behavior: ranged-leaf-as-list = false:

      admin@ncs(config-GigabitEthernet-0/2/9)# traffic-policy tp-1 inbound vlan ?
      Possible completions:
        <TEXT>   VLAN IDs, quoted with "" if multiple entries

      Show:  
          traffic-policy tp-1 inbound vlan "3580 to 3584"


      Changing behavior to list, the vlan data type is set to integer:

      #ned-settings huawei-vrp write ranged-leaf-as-list true
      #commit
      #sync-from
      admin@ncs(config-GigabitEthernet-0/2/9)# traffic-policy tp-1 inbound vlan ?
      Possible completions:
        <INTEGER>   VLAN IDs

      Show:

          traffic-policy tp-1 inbound vlan 3580
          traffic-policy tp-1 inbound vlan 3581
          traffic-policy tp-1 inbound vlan 3582
          traffic-policy tp-1 inbound vlan 3583
          traffic-policy tp-1 inbound vlan 3584 

      NOTE: this is the oposite behavior of ENCAP_VLAN_AS_LEAF behavior


    - write lock-local-user <true|false> (default false)

      Will trigger exception if NSO output contains aaa/local-user{ned-user}.


    - write memory-setting <enum> (default persist)

      Select the config persistence method for Huawei device (default is 'persist').

      persist  - Save device config to persistent storage as part of NCS transaction (default).

      none     - Never save config on device as part of NCS transaction.


    - write commit-trial-seconds <INTEGER<0|60-65535>> (default 0)

      Set to >= 60 to use commit trial <seconds> along with a
      confirming commit when transaction is done, utilizing the
      implict rollback on revert by calling abort trial.


    - write commit-trial-seconds-wait <INTEGER<0-65535>> (default 0)

      Time for system running on a trial basis waits until commit after trial. 0 to disable
      (default).


    - write disable-alt-no-syntax <true|false> (default false)

      This setting can be used to disable the alternative syntax used to delete some nodes on some
      VRP versions. The nodes affected are marked in yang-model with meta-data 'vrp-alt-no-syntax'.
      When enabled (default on vrp OS version > 5.16)) some tokens/values will be stripped when
      deleted. Use this setting to disable stripping. Default false.


    - write disable-redeploy-on-change <true|false> (default false)

      This setting can be used to disable the vrp cli extension vrp:redeploy-on-change, which
      updates the NSO output by redeployingconfiguration being reset on device by another config
      change. Default false.


    - write disable-if-qos-queue-reset-percentage <true|false> (default false)

      This settings can be used to disable the vrp cli extensionvrp:qos-queue-reset-percentage,
      which updates the NSO output toset percentage to 0 before setting the value present in CDB.
      Default false.


    - write disable-suppress-vlan-delete <true|false> (default false)

      This settings can be used to disable the vrp cli extension vrp:suppress-vlan-delete. The
      extension updates the NSO output to suppress the removal of vlan list entries, since an empty
      entry is not displayed on device and the command affects vlan batch leaf-list. Default false.


    - write disable-redeploy-route-policy-if-match-on-ip-ip-prefix-change <true|false> (default false)

      This settings can be used to disable the vrp cli
      extensionredeploy-route-policy-if-match-on-ip-ip-prefix-change. Default false.


    - write suppress-interface-portswitch-command <true|false> (default false)

      This settings can be used to instruct the ned to suppress thesending of interface portswitch
      commands. Default false.


    - write enable-updated-interface-qos-profile <true|false> (default false)

      This settings can be used to instruct the ned to support the updated interface qos-profile
      legacy model from v6.28. Default false.


    - write force-redeploy-vsi-on-id-change <true|false> (default true)

      This settings can be used to instruct the ned to redeploy vsi config even if vsi id has not
      changed. Default true.


    - write range-syntax-command-len <uint16> (default 90)

      This settings is used to split a NSO command line into
      multiple device commands, when the number of parameters is too high and
      the device reports an error about it (ussually in ranged lists). Disabled with 0. 
      Default 90


    - write rollback enable <true|false> (default false)

      Enable use of rollback command.


## 9.1. ned-settings huawei-vrp write inject-command
----------------------------------------------------

  This ned-setting list can be used to inject commands (e.g. config
  lines) when writing to the device (i.e. upon commit). This can be
  used, for example, to undo undesired dynamic config automatically
  set by the device.
  An example of some inject-command entries used to undo peer enable
  in bgp ipv4-family unicast mode:

  devices device ne40e-1 ned-settings huawei-vrp write inject-command bgp1
  config "\n peer ([0-9\.]+) as-number \d+"
  command " ipv4-family unicast\n  no peer $1 enable\n exit" after-each

  devices device ne40e-1 ned-settings huawei-vrp write inject-command bgp2
  config "\n group (\S+) (internal|external)"
  command " ipv4-family unicast\n  no peer $1 enable\n exit" after-each

  devices device ne40e-1 ned-settings huawei-vrp write inject-command bgp3
  config "\n peer ([0-9\.]+) group \S+"
  command " ipv4-family unicast\n  no peer $1 enable\n exit" after-each

  Note the $1 used to inject the first catch group. Up to 9 groups
  may be used.

    - write inject-command <id> <config> <command> <where>

      - id <WORD>

        List id, any string.

      - config <WORD>

        The config line(s) where command should be injected (DOTALL regex).

      - command <WORD>

        The command to inject after|before config-line.

      - where <enum>

        before-each   - insert command before each matching config-line.

        before-first  - insert command before first matching config-line.

        after-each    - insert command after each matching config-line.

        after-last    - insert command after last matching config-line.


## 9.2. ned-settings huawei-vrp write config-dependency
-------------------------------------------------------

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


# 10. ned-settings huawei-vrp auto
----------------------------------

  Configure auto (dynamic behaviour).


    - auto bgp-af-peer-group-trim <true|false> (default false)

      If this setting is set to true the NED will delete device-generated BGP peer group config in
      ipv4-family unicast container unless included in the NSO transaction. Default false.


# 11. ned-settings huawei-vrp live-status
-----------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


