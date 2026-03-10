# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/furukawa-fx1/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/furukawa-fx1/
  device
    /ncs:/device/devices/device:<name>/ned-settings/furukawa-fx1/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings furukawa-fx1

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings furukawa-fx1
  2. live-status
  3. connection
  4. device
  5. proxy
  6. logger
  7. developer
  ```


# 1. ned-settings furukawa-fx1
------------------------------


    - extended-parser <enum> (default auto)

      Make the NED enable extensions to ease the task of the NSO CLI command parser. A common problem with this parser
      is that it can easily get lost when trying to parse configuration not supported by the YANG model. In particular it is very sensitive for unsupported config that
      generates a mode switch.

      auto            - Uses turbo-mode when available, will use fastest availablemethod to load
                        data to NSO. If NSO doesn't support data-loading
          from CLI NED,
                        robust-mode is used.

      disabled        - disabled.

      robust-mode     - The configuration dump is run through a pre-parser which is cleaning it from
                        all elements currently not supported in the YANG model (default).

      turbo-mode      - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO using a
                        Maapi SetValues() call.

      turbo-xml-mode  - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO in XML
                        format.


# 2. ned-settings furukawa-fx1 live-status
------------------------------------------


    - live-status time-to-live <int32> (default 50)


# 3. ned-settings furukawa-fx1 connection
-----------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection ssh client <enum>

      Configure the SSH client to use. Relevant only when using the
      NED with NSO 5.6 or later.

      ganymed  - The legacy SSH client. Used on all older versions of NSO.

      sshj     - The new SSH client with support for the latest crypto features.
              This
                 is the default when using the NED on NSO 5.6 or later.


    - connection ssh host-key known-hosts-file <string>

      Path to openssh formatted 'known_hosts' file containing valid
      host keys.


    - connection ssh host-key public-key-file <string>

      Path to openssh formatted public (.pub) host key file.


    - connection ssh auth-key private-key-file <string>

      Path to openssh formatted private key file.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection connector <WORD>

      Change the default connector, e.g. 'ned-connector-default.json'.


    - connection send-login-newline <true|false> (default false)

      Send an initial newline in the login phase to wake device.


    - connection terminal width <uint32> (default 100000)


    - connection terminal height <uint32> (default 24)


# 4. ned-settings furukawa-fx1 device
-------------------------------------


    - device refresh-on-commit <true|false> (default true)

      On 'commit', the NED will send a 'refresh' command to device.


    - device show-sync-full-config <true|false> (default true)

      On getting config, the NED will retrieve full configuration from
      device [true] (faster) or just the modeled data [false].


    - device suppress-commands <true|false> (default false)

      Don't allow commands, such as deletion, for important nodes.


    - device trans-id-method <enum> (default last-edit-timestamp)

      Configure how the NED shall calculate the transaction id. Typically used after each commit and
      for check-sync operations.

      config-hash          - Use a snapshot of the running config for calculation.

      last-edit-timestamp  - Use the 'LAST EDIT' time stamp generated by the device for calculation.

      last-save-timestamp  - Use the 'LAST SAVE' time stamp generated by the device for calculation.


# 5. ned-settings furukawa-fx1 proxy
------------------------------------

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


    - proxy proxy-prompt <string>

      Prompt pattern on the proxy host.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


    - proxy remote-command <string>

      Connection command used to initiate proxy on device. Optional
      for ssh/telnet. Accepts $address, $port, $name for inserting remote-xxx config


    - proxy remote-secondary-password <string>

      Second password (e.g. enable) on the device behind the proxy.


    - proxy proxy-prompt2 <string>

      Prompt pattern on the proxy after sending telnet/ssh command.


    - proxy menu regexp <string>

      Menu regexp.


    - proxy menu answer <string>

      Menu answer, i.e. selection/choice.


# 6. ned-settings furukawa-fx1 logger
-------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 7. ned-settings furukawa-fx1 developer
----------------------------------------

  Contains settings used by the NED developers.


    - developer load-from-file <string>

      Make the NED load a file containing raw device config when doing
      sync-from.Does only work on NETSIM targets


    - developer model <uint32>

      Simulate a model number.


    - developer version <uint8>

      Simulate a version number.


    - developer device-type <enum> (default netsim)

      Real or simulated device.

      netsim  - netsim.

      device  - device.


