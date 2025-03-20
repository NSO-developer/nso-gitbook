# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/cisco-fxos/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/cisco-fxos/
  device
    /ncs:/device/devices/device:<name>/ned-settings/cisco-fxos/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings cisco-fxos

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings cisco-fxos
  2. deprecated
  3. live-status
  4. connection
  5. rpc-actions
     5.1. expect-patterns
  6. logger
  7. write
     7.1. config-warning
  ```


# 1. ned-settings cisco-fxos
----------------------------


    - cisco-fxos extended-parser <enum> (default turbo-mode)

      Make the cisco-fxos NED enable extensions to ease the task of the NSO CLI command parser. A
      common problem with this parser is that it can easily get lost when trying to parse
      configuration not supported by the YANG model. In particular it is very sensitive for
      unsupported config that generates a mode switch.

      disabled        - DEPRECATED. Same as robust-mode.

      robust-mode     - The configuration dump is run through a pre-parser which is cleaning it from
                        all elements currently not supported in the YANG model (default).

      turbo-mode      - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO using a
                        Maapi SetValues() call.

      turbo-xml-mode  - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO in XML
                        format.

      auto            - Uses turbo-mode when available, will use fastest availablemethod to load
                        data to NSO. If NSO doesn't support data-loading from CLI NED, robust-mode
                        is used.


# 2. ned-settings cisco-fxos deprecated
---------------------------------------

  Deprecated NED settings.


    - deprecated live-status legacy-mode <enum> (default disabled)

      Enable the live-status handler that was used in NED version < 7.0.

      enabled   - enabled.

      disabled  - disabled.


# 3. ned-settings cisco-fxos live-status
----------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


# 4. ned-settings cisco-fxos connection
---------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection connector <WORD>

      Change the default connector. Default 'ned-connector-default.json'.


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


# 5. ned-settings cisco-fxos rpc-actions
----------------------------------------

  RPC actions related configurations.


## 5.1. ned-settings cisco-fxos rpc-actions expect-patterns
-----------------------------------------------------------

  List of expected patterns and prompts when executing commands. It can be used to define custom
  expected patterns, for example to wait for a number of characters in order to implement an
  automatic time-out reset mechanism. NOTE: the patterns represent regular expressions.

    - rpc-actions expect-patterns <pattern>

      - pattern <string>


# 6. ned-settings cisco-fxos logger
-----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default debug)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 7. ned-settings cisco-fxos write
----------------------------------

  Settings used when writing to device.


## 7.1. ned-settings cisco-fxos write config-warning
----------------------------------------------------

  List specifying device warnings to ignore.

    - write config-warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. Warning: Connectivity to one or more services may be
        denied.*.


