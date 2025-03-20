# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/ericsson-efn324/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/ericsson-efn324/
  device
    /ncs:/device/devices/device:<name>/ned-settings/ericsson-efn324/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings ericsson-efn324

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings ericsson-efn324
  2. logger
  3. connection
  4. logging
  5. proxy
  6. live-status
  7. deprecated
  8. write
     8.1. config-dependency
  ```


# 1. ned-settings ericsson-efn324
---------------------------------


    - ericsson-efn324 extended-parser <enum> (default auto)

      Make the ericsson-efn324 NED handle CLI parsing (i.e. transform the running-config from the
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


# 2. ned-settings ericsson-efn324 logger
----------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default debug)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings ericsson-efn324 connection
--------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


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


# 4. ned-settings ericsson-efn324 logging
-----------------------------------------

  Settings for controlling logs generated.

    - ericsson-efn324 logging <module> <verbose> <silent> <debug> <java> <capacity>

      - module <enum>

        main        - Apply to logs main ned operations.

        connection  - Apply to logs during device connection.

        console     - Apply to logs during console interaction.

        parser      - Apply to logs during config parsing.

        all         - Apply to logs during all operations.

      - verbose <true|false>

        Toggle additional verbose logs.

      - silent <true|false>

        Toggle detailed logs to only be dumped on failure.

      - debug <true|false>

        Toggle debug logs for ned development.

      - java <true|false>

        Toggle logs to be added to ncs-java-vm.log.

      - capacity <uint32>

        Set capacity of logs stored silently.

      - format origin <true|false>

        Toggle module & level added to logs.

      - format time-stamp <true|false>

        Toggle time stamps added to logs.


# 5. ned-settings ericsson-efn324 proxy
---------------------------------------

  Configure NED to access device via a proxy.


    - proxy remote-connection <enum>

      Connection type between proxy and device.

      ssh     - ssh.

      telnet  - telnet.


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

    Note:
     - Proxy connection is only supported when "ned-settings/ericsson-efn324/deprecated/connection/legacy-mode" is disabled.

    Do as follows to setup to connect to an efn324 device that resides behind a proxy or terminal server:

    +-----+  A   +-------+   B  +--------+
    | NSO | <--> | proxy | <--> | efn324 |
    +-----+      +-------+      +--------+

     Setup connection (A):

     # devices device dev-1 address <proxy address>
     # devices device dev-1 port <proxy port>
     # devices device dev-1 device-type cli protocol <proxy proto - telnet or ssh>
     # devices authgroups group <group-name> default-map remote-name <proxy username>
     # devices authgroups group <group-name> default-map remote-password <proxy password>
     # devices device dev-1 authgroup <group-name>

     Setup connection (B):


     Define the type of connection to the device. The type "serial" is used for terminal servers:

     # devices device dev-1 ned-settings ericsson-efn324 proxy remote-connection <ssh|telnet|serial>

     Define login credentials for the device:

     # devices device dev-1 ned-settings ericsson-efn324 proxy remote-name <user name on the efn324 device>
     # devices device dev-1 ned-settings ericsson-efn324 proxy remote-password <password on the efn324 device>

     If protocol is ssh or telnet then configure the following as well:

     # devices device dev-1 ned-settings ericsson-efn324 proxy proxy-prompt <prompt pattern on proxy>
     # devices device dev-1 ned-settings ericsson-efn324 proxy remote-address <address to the efn324 device>
     # devices device dev-1 ned-settings ericsson-efn324 proxy remote-port <port used on the efn324 device>
     # commit


# 6. ned-settings ericsson-efn324 live-status
---------------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


# 7. ned-settings ericsson-efn324 deprecated
--------------------------------------------

  Deprecated NED settings.


    - deprecated connection legacy-mode <enum> (default disabled)

      enabled   - enabled.

      disabled  - disabled.


# 8. ned-settings ericsson-efn324 write
---------------------------------------

  Settings used when writing to device.


## 8.1. ned-settings ericsson-efn324 write config-dependency
------------------------------------------------------------

  This ned-setting can be used to add dynamic dependency rules to
  the NED before being permanently fixed in the NED. This can be
  useful if a dependency bug is found and you do not want to wait for
  an official NED release or are in a hurry for the fix.

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


