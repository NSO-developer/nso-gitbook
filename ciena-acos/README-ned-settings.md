# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/ciena-acos/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/ciena-acos/
  device
    /ncs:/device/devices/device:<name>/ned-settings/ciena-acos/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings ciena-acos

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings ciena-acos
  2. connection
  3. deprecated
  4. logger
  5. live-status
  ```


# 1. ned-settings ciena-acos
----------------------------

  ciena-acos ned-settings.


    - extended-parser <enum> (default auto)

      Make the NED enable extensions to ease the task of the NSO CLI command parser. A common
      problem with this parser is that it can easily get lost when trying to parse configuration not
      supported by the YANG model. In particular it is very sensitive for unsupported config that
      generates a mode switch.

      auto            - Uses turbo-mode when available, will use fastest availablemethod to load
                        data to NSO. If NSO doesn't support data-loading from CLI NED, robust-mode
                        is used.

      robust-mode     - The configuration dump is run through a pre-parser which is cleaning it from
                        all elements currently not supported in the YANG model (default).

      turbo-mode      - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO using a
                        Maapi SetValues() call.

      turbo-xml-mode  - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO in XML
                        format.


    - slot <uint32>

      Equipment group slot (Ciena 6500 platform specific settings).


# 2. ned-settings ciena-acos connection
---------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection connector <WORD>

      Change the default connector, e.g. 'ned-connector-default.json'.


    - connection terminal width <uint32> (default 4096)


    - connection terminal height <uint32> (default 200)


    - connection ssh client <enum> (default ganymed)

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


# 3. ned-settings ciena-acos deprecated
---------------------------------------

  Deprecated NED settings.


    - deprecated live-status legacy-mode <enum> (default disabled)

      enabled   - enabled.

      disabled  - disabled.


# 4. ned-settings ciena-acos logger
-----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 5. ned-settings ciena-acos live-status
----------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


