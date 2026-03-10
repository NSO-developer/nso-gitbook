# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/adva-825/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/adva-825/
  device
    /ncs:/device/devices/device:<name>/ned-settings/adva-825/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings adva-825

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings adva-825
  2. connection
  3. live-status
  4. write
     4.1. inject-command
  5. behaviour
     5.1. errors
  6. developer
  7. proxy
  8. logger
  ```


# 1. ned-settings adva-825
--------------------------


    - adva-825 extended-parser <enum> (default auto)

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


# 2. ned-settings adva-825 connection
-------------------------------------

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


# 3. ned-settings adva-825 live-status
--------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


# 4. ned-settings adva-825 write
--------------------------------

  Settings used when writing to device.


## 4.1. ned-settings adva-825 write inject-command
--------------------------------------------------

  Inject command (before or after) specified config-line upon commit.

    - write inject-command <id> <config-line> <command> <where>

      - id <WORD>

        List id, any string.

      - config-line <WORD>

        The config line where command should be injected (DOTALL regex).

      - command <WORD>

        The command to inject after|before config-line.

      - where <enum>

        before-each   - insert command before each matching config-line.

        before-first  - insert command before first matching config-line.

        after-each    - insert command after each matching config-line.

        after-last    - insert command after last matching config-line.


# 5. ned-settings adva-825 behaviour
------------------------------------

  NED specific behaviours.


    - behaviour cmd-error-retry cmd-output-max-retries <NUM> (default 90)

      Max number of retries, when sending command to device.


    - behaviour cmd-error-retry cmd-output-retry-intervel <NUM> (default 1)

      Specify retry interval in seconds.


## 5.1. ned-settings adva-825 behaviour cmd-error-retry errors
--------------------------------------------------------------

  Device error/warning regexp entry list.

    - behaviour cmd-error-retry errors <error>

      - error <WORD>

        Warning/error regular expression, e.g. System is currently busy.*.


# 6. ned-settings adva-825 developer
------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will be reported.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


# 7. ned-settings adva-825 proxy
--------------------------------

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


    - proxy authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy proxy-prompt <string>

      Prompt pattern on the proxy host.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


# 8. ned-settings adva-825 logger
---------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


