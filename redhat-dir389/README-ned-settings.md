# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/redhat-dir389/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/redhat-dir389/
  device
    /ncs:/device/devices/device:<name>/ned-settings/redhat-dir389/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings redhat-dir389

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings redhat-dir389
  2. developer
  3. connection
  4. transaction
  5. console
     5.1. warning
     5.2. command
     5.3. pattern
     5.4. action
          5.4.1. state
  6. logger
  7. ldap-settings
     7.1. managed-dn-list
  ```


# 1. ned-settings redhat-dir389
-------------------------------


    - redhat-dir389 extended-parser <enum> (default auto)

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


# 2. ned-settings redhat-dir389 developer
-----------------------------------------

  Contains settings used by the NED developers.


    - developer load-from-file <string>

      Make the NED load a file containing raw device config when doing sync-from. Does only work on
      NETSIM targets.


    - developer model-id <uint32>

      Simulate a model number.


    - developer os-major <uint8>

      Simulate OS major number.


    - developer os-minor <uint8> (default 0)

      Simulate OS major number.


    - developer device-type <enum> (default netsim)

      Real or simulated device.

      netsim  - netsim.

      device  - device.


    - developer trace-enable <true|false> (default false)

      Enable developer tracing. WARNING: may choke NSO with large commits|systems.


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


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


# 3. ned-settings redhat-dir389 connection
------------------------------------------

  Configure settings specific to the connection between NED and device.


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


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection character-set <string> (default UTF-8)

      Character set to use for telnet session.


    - connection commands meta-data <WORD>

      Change the default connector. Default 'ned-connector.json'.


    - connection commands initial-action <union>

      Interactor action used to initialize a connection.


    - connection commands awaken-console <string>

      Command sent to awaken console during connection.


    - connection commands send-delay <uint32> (default 0)

      Delay in ms before sending a command during connection.


    - connection commands expect-timeout <uint32> (default 60000)

      Default limit in ms for waiting for command response.


    - connection terminal width <uint32> (default 4096)


    - connection terminal height <uint32> (default 24)


# 4. ned-settings redhat-dir389 transaction
-------------------------------------------

  Transaction specific settings.


    - transaction trans-id-method <enum> (default modeled-config)

      Select the method for calculating transaction-id.

      modeled-config  - Use a snapshot of the data of only the modeled parts of running config for
                        calculation.

      full-config     - Use a snapshot of the full running config for calculation.

      device-custom   - Use a device custom method to get a value to use for trans-id.


    - transaction abort-on-diff <true|false> (default false)

      Enable to detect diff immediately when config is applied (i.e. in commit/abort/revert).
      If a diff is detected an exception is thrown, having the effect in commit that the transaction
      is aborted (showing the diff). Note that this means some overhead in commit, where whole config
      needs to be retrieved from device to do compare. It's a more exact way to detect OOB changes,
      silently dropped config, and unknown side-effects to config (i.e. all causing a diff compared 
      to NSO state). In fact, it's the only method which guarantees that the config was actually 
      applied as desired. Since this incurs overhead it is strongly adviced that this feature is
      only used during development.


# 5. ned-settings redhat-dir389 console
---------------------------------------

  Settings used while interacting with a device.


    - console ignore-errors <true|false> (default false)

      Flag indicating if errors should be ignored.


    - console ignore-warnings <true|false>

      Flag indicating if warnings should be ignored.


    - console ignore-retries <true|false>

      Flag indicating if retries should be ignored.


    - console max-retries <uint16> (default 100)

      Maximum number of retries of a command.


    - console retry-delay <uint16> (default 1000)

      Number of ms before retrying a command.


    - console send-delay <uint32> (default 0)

      Enable delay before sending commands.


    - console expect-timeout <uint32> (default 60000)

      Set default timeout for sending commands.


    - console chunk-size <uint8> (default 1)

      Enable executing commands in chunks.


    - console line-feed <string>

      Overwrites default line-feed character.


## 5.1. ned-settings redhat-dir389 console extension warning
------------------------------------------------------------

  Device warning regex entry list. Use to ignore warnings/errors etc.

    - console extension warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.*.


## 5.2. ned-settings redhat-dir389 console extension command
------------------------------------------------------------

  Extend available commands to send.

    - console extension command <name> <data>

      - name <string>

        Key id of the command.

      - data <string>

        Command.


## 5.3. ned-settings redhat-dir389 console extension pattern
------------------------------------------------------------

  Extend available patterns to expect.

    - console extension pattern <name> <data>

      - name <string>

        Key id of the pattern.

      - data <string>

        A regular expression.


## 5.4. ned-settings redhat-dir389 console extension action
-----------------------------------------------------------

  Extend available actions to perform.

    - console extension action <name> <init> <flush>

      - name <string>

        A name for the action.

      - init <string>

        Command sent to intialize action.

      - flush <true|false>

        Flush device buffer once action is completed.


### 5.4.1. ned-settings redhat-dir389 console extension action state
--------------------------------------------------------------------

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


# 6. ned-settings redhat-dir389 logger
--------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default debug)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 7. ned-settings redhat-dir389 ldap-settings
---------------------------------------------


    - ldap-settings ldap-secret <string>

      (-w) passwd : bind password (for simple authentication).


    - ldap-settings host <string>

      (-h) host : LDAP server; use with tls.


    - ldap-settings port <string>

      (-p) port : port on LDAP server; use with tls.


    - ldap-settings bind-dn <string> (default cn=Directory Manager)

      (-D) binddn : bind DN; use with tls.


    - ldap-settings tls <true|false> (default false)

      (-Z) : set Start TLS request; When false, simple auth (-xLLL) is used!.


## 7.1. ned-settings redhat-dir389 ldap-settings managed-dn-list
----------------------------------------------------------------

  Ldap basedn entries NED will manage at sync-from.

    - ldap-settings managed-dn-list <dn>

      - dn <dn>

        (-b) basedn : base dn for search.


# 8 CONFIGURE/DEFINE LDAP-SETTINGS:
---
    Summary of the ned-settings configuration; Refer to README.md section **1.3.5** for more details. 
    9.1) Define ldap-secret:
    ---
    * path:   <device-name>/ned-settings/redhat-dir389/ldap-settings/ldap-secret

    ** ldap-secret is the directory 389 admin password defined for managing cn=Directory Manager ldap commands
    ** It basically represents the -w argument value from ldap commands used

    ---
    admin@ncs(config)# devices device <device-name> ned-settings redhat-dir389 ldap-settings ldap-secret <LDAPADMIN-SECRET>


  * **Sample of full correct initial ned-settings expected configuration:**
```
  admin@ncs(config-device-<device-name>)# show full
   devices device <device-name>
    address         <ip-address>
    port            <SSH-PORT>
    ssh host-key ssh-rsa
     key-data "<ssh-fetch-host-keys>"
    !
    authgroup       <authgroup-name>
    device-type cli ned-id redhat-dir389-cli-1.0
    device-type cli protocol ssh
    trace           raw
    ned-settings redhat-dir389 logging all
    ned-settings redhat-dir389 log-verbose true
    ned-settings redhat-dir389 ldap-settings ldap-secret <ldap-admin-secret>
    ned-settings redhat-dir389 ldap-settings managed-dn-list ou=<OU1>,o=<O1>
    !
    ned-settings redhat-dir389 ldap-settings managed-dn-list ou=<OU1>,o=<O1>,o=<O2>
    !
    ned-settings redhat-dir389 ldap-settings managed-dn-list uid=<UID>,cn=<cnName>,ou=<OuName>,o=<oName>,<dc=dcValue>
    !
    state admin-state unlocked
   !
```
