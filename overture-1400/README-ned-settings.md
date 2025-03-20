# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/overture-1400/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/overture-1400/
  device
    /ncs:/device/devices/device:<name>/ned-settings/overture-1400/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings overture-1400

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings overture-1400
  2. connection
  3. deprecated
  4. logger
  5. operational-actions
     5.1. commands
  6. live-status
     6.1. auto-prompts
  ```


# 1. ned-settings overture-1400
-------------------------------

  Configure settings specific to the connection between NED and device.


    - overture-1400 extended-parser <enum> (default auto)

      Make the overture-1400 NED handle CLI parsing (i.e. transform the running-config from the
      device to the model based config tree).

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


# 2. ned-settings overture-1400 connection
------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection remote-name <string>

      User name on the device.


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


    - connection character-set <string> (default UTF-8)

      Character set to use for telnet session.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection connector <WORD>

      Change the default connector, e.g. 'ned-connector-default.json'.


    - connection terminal width <uint32> (default 255)


    - connection terminal height <uint32> (default 255)


# 3. ned-settings overture-1400 deprecated
------------------------------------------

  Deprecated ned-settings.


    - deprecated connection legacy-mode <enum> (default disabled)

      enabled   - enabled.

      disabled  - disabled.


# 4. ned-settings overture-1400 logger
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


# 5. ned-settings overture-1400 operational-actions
---------------------------------------------------

  Settings used when writing to device.


## 5.1. ned-settings overture-1400 operational-actions commands
---------------------------------------------------------------

  List specifying tail-f actions executed from operational mode, not configuration mode.

    - operational-actions commands <name>

      - name <WORD>

        String or regular expression, e.g.: monitor interface or monitor.*.


# 6. ned-settings overture-1400 live-status
-------------------------------------------


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


## 6.1. ned-settings overture-1400 live-status auto-prompts
-----------------------------------------------------------

  answers to device prompting questions.

    - live-status auto-prompts <id> <question> <answer>

      - id <WORD>

        List id, any string.

      - question <WORD>

        Device question, regular expression.

      - answer <WORD>

        Answer to device question.


