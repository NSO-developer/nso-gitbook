# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/ericsson-minilink6600/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/ericsson-minilink6600/
  device
    /ncs:/device/devices/device:<name>/ned-settings/ericsson-minilink6600/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings ericsson-minilink6600

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings ericsson-minilink6600
  2. connection
  3. write
     3.1. config-warning
  4. transaction
  5. logger
  6. proxy
  7. proxy-2
  ```


# 1. ned-settings ericsson-minilink6600
---------------------------------------


    - ericsson-minilink6600 extended-parser <enum> (default auto)

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


# 2. ned-settings ericsson-minilink6600 connection
--------------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection remote-name <string>

      User name on the device.


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


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection character-set <string> (default UTF-8)

      Character set to use for telnet session.


# 3. ned-settings ericsson-minilink6600 write
---------------------------------------------

  Settings used when writing to device.


    - write config-output-max-retries <NUM> (default 5)

      Maximum number of retries when sending config command to device.


    - write config-output-retry-interval <uint32> (default 1000)

      Interval in milliseconds when retrying config command to device (default 1000).


## 3.1. ned-settings ericsson-minilink6600 write config-warning
---------------------------------------------------------------

  Device warning regex entry list.

    - write config-warning <warning>

      - warning <WORD>

        Warning regular expression, e.g. vlan.* does not exist.*.


# 4. ned-settings ericsson-minilink6600 transaction
---------------------------------------------------

  Transaction specific settings.


    - transaction trans-id-method <enum> (default modeled-config)

      Select the method for calculating transaction-id.

      modeled-config  - Use a snapshot of the data of only the modeled parts of running config for
                        calculation.

      full-config     - Use a snapshot of the full running config for calculation.

      device-custom   - Use a device custom method to get a value to use for trans-id.


# 5. ned-settings ericsson-minilink6600 logger
----------------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 6. ned-settings ericsson-minilink6600 proxy
---------------------------------------------

  Configure NED to access device via a proxy.


    - proxy remote-connection <enum>

      Connection type between ned, proxy and device.

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

      Prompt pattern on the proxy host before connecting to device.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


    - proxy auth-key private-key-file <string>

      Path to openssh formatted private key file for doing public key auth to device behind proxy.


    - proxy host-key-validation <true|false> (default false)

      Set this to true to force host-key validation of device behind proxy.


# 7. ned-settings ericsson-minilink6600 proxy-2
-----------------------------------------------

  Configure NED to access device via a second proxy.


    - proxy-2 remote-connection <enum>

      Connection type between ned, proxy and device.

      ssh            - Start a new ssh client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      telnet         - Start a new telnet client on proxy and connect to device (i.e. will launch
                       interactive shell on proxy).

      serial         - Connect through a terminal server to device.

      ssh-direct     - Direct forward to device using ned local ssh client (i.e. without shell on
                       proxy).

      telnet-direct  - Direct forward to device using ned local telnet client (i.e. without shell on
                       proxy).


    - proxy-2 remote-address <union>

      Address of host behind the proxy.


    - proxy-2 remote-port <uint16>

      Port of host behind the proxy.


    - proxy-2 remote-name <string>

      User name on the device behind the proxy.


    - proxy-2 remote-password <string>

      Password on the device behind the proxy.


    - proxy-2 remote-secondary-password <string>

      Second password (e.g. enable) on the device behind the proxy .WARNING MUST UPDATE connector
      template to use!.


    - proxy-2 authgroup <WORD>

      Authentication credentials for the device behind the proxy.


    - proxy-2 proxy-prompt <string>

      Prompt pattern on the proxy host before connecting to device.


    - proxy-2 remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


    - proxy-2 auth-key private-key-file <string>

      Path to openssh formatted private key file for doing public key auth to device behind proxy.


    - proxy-2 host-key-validation <true|false> (default false)

      Set this to true to force host-key validation of device behind proxy.


