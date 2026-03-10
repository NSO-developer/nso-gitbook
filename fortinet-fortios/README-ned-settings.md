# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/fortinet-fortios/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/fortinet-fortios/
  device
    /ncs:/device/devices/device:<name>/ned-settings/fortinet-fortios/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings fortinet-fortios

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings fortinet-fortios
  2. connection
  3. proxy
  4. logger
  ```


# 1. ned-settings fortinet-fortios
----------------------------------

  Configure settings specific to the connection between NED and device.


    - ignore-unlicensed-devices <true|false> (default false)

      Ignore unlicensed devices at connection time.


    - disable-pagination-unlicensed-device <true|false> (default false)

      Disable pagination even if the device is unlicensed.


    - extended-parser <enum> (default auto)

      Make the fortinet-fortios NED handle CLI parsing (i.e. transform the running-config from the
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


    - transaction-id-method <enum> (default device-checksum)

      Method used for calculating the transaction id.

      device-checksum  - Use reported device checksum (Default).

      config-hash      - Calculate MD5 on a snapshot of the entire running config for calculation.

      conf-file-ver    - Calculate MD5 on reported conf file ver checksum.


    - conf-file-ver-delay <NUM> (default 2000)

      Delay in milliseconds before fetching the config file ver.


    - device-checksum-delay <NUM> (default 2000)

      Delay in milliseconds before fetching the device configuration checksum.


    - device-checksum-delay-during-commit <NUM> (default 0)

      Delay in milliseconds before fetching the device configuration checksum during commit.


    - filter-encrypted-passwords <true|false> (default true)

      Filter encrypted passwords.


    - prompt <string> (default #)

      Change device prompt, default is '#'.


# 2. ned-settings fortinet-fortios connection
---------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection connector <WORD>

      Change the default connector, e.g. 'ned-connector-default.json'.


    - connection number-of-retries <uint8> (default 1)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection terminal width <uint32> (default 4096)


    - connection terminal height <uint32> (default 100)


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


# 3. ned-settings fortinet-fortios proxy
----------------------------------------

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


# 4. ned-settings fortinet-fortios logger
-----------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


