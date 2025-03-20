# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/pica8-picos/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/pica8-picos/
  device
    /ncs:/device/devices/device:<name>/ned-settings/pica8-picos/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings pica8-picos

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings pica8-picos
  2. proxy
  3. proxy-2
  4. connection
  5. transaction
  6. console
  7. logger
  ```


# 1. ned-settings pica8-picos
-----------------------------


    - pica8-picos extended-parser <enum> (default auto)

      Make the cisco-nx NED handle CLI parsing (i.e. transform the running-config from the device to
      the model based config tree).

      auto            - Uses turbo-mode when available, will use fastest availablemethod to load
                        data to NSO. If NSO doesn't support data-loading from CLI NED, robust-mode
                        is used.

      turbo-mode      - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO using maapi
                        setvalues call.

      turbo-xml-mode  - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO in XML
                        format.


# 2. ned-settings pica8-picos proxy
-----------------------------------

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

      Prompt pattern on the proxy host before connecting to device.


    - proxy remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


# 3. ned-settings pica8-picos proxy-2
-------------------------------------

  Configure NED to access device via a second proxy.


    - proxy-2 remote-connection <enum>

      Connection type between proxy and device.

      ssh     - ssh.

      telnet  - telnet.

      serial  - serial.


    - proxy-2 remote-address <union>

      Address of host behind the proxy.


    - proxy-2 remote-port <uint16>

      Port of host behind the proxy.


    - proxy-2 remote-name <string>

      User name on the device behind the proxy.


    - proxy-2 remote-password <string>

      Password on the device behind the proxy.


    - proxy-2 proxy-prompt <string>

      Prompt pattern on the proxy host before connecting to device.


    - proxy-2 remote-ssh-args <string>

      Additional arguments used to establish proxy connection.


# 4. ned-settings pica8-picos connection
----------------------------------------

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


# 5. ned-settings pica8-picos transaction
-----------------------------------------

  Transaction specific settings.


    - transaction trans-id-method <enum> (default modeled-config)

      Select the method for calculating transaction-id.

      modeled-config  - Use a snapshot of the data of only the modeled parts of running config for
                        calculation.

      full-config     - Use a snapshot of the full running config for calculation.

      read-config     - Use a snapshot of the full running config for calculation.


    - transaction abort-on-diff <true|false> (default false)

      Enable to detect diff immediately when config is applied (i.e. in commit/abort/revert).
      If a diff is detected an exception is thrown, having the effect in commit that the transaction
      is aborted (showing the diff). Note that this means some overhead in commit, where whole config
      needs to be retrieved from device to do compare. It's a more exact way to detect OOB changes,
      silently dropped config, and unknown side-effects to config (i.e. all causing a diff compared 
      to NSO state). In fact, it's the only method which guarantees that the config was actually 
      applied as desired. Since this incurs overhead it is strongly adviced that this feature is
      only used during development.


# 6. ned-settings pica8-picos console
-------------------------------------

  Settings used while interacting with a device.


    - console ignore-errors <true|false>

      Flag indicating if errors should be ignored.


    - console expect-timeout <uint32>

      Set default timeout for sending commands.


# 7. ned-settings pica8-picos logger
------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


