# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/aethra-atos/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/aethra-atos/
  device
    /ncs:/device/devices/device:<name>/ned-settings/aethra-atos/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings aethra-atos

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings aethra-atos
  2. developer
  3. proxy
  4. connection
  5. transaction
  6. logger
  ```


# 1. ned-settings aethra-atos
-----------------------------


    - extended-parser <enum> (default auto)

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


# 2. ned-settings aethra-atos developer
---------------------------------------

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


    - developer progress-verbosity <enum> (default verbose)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer load-native-config allow-delete <true|false> (default false)

      Enable this setting to be able to handle limited delete operations with 'load-native-config'. Please note that
      not all syntax available on a real device works, some delete operations can not be parsed by the NED. Use the
      'verbose' flag to 'load-native-config' to see if delete commands can be parsed. Currently this is only supported
      when 'extended-parser' is set to 'turbo-xml-mode'


    - developer load-native-config delete-with-remove <true|false> (default false)

      Enable this setting to use 'remove' instead of 'delete' when sending delete operations to NSO. This is useful when
      doing delete commands for data that might not be present in CDB. Please note that deletes for missing data will still
      be part of transaction, and will be sent to device. Use with care, and do proper testing to understand behaviour.


# 3. ned-settings aethra-atos proxy
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


# 4. ned-settings aethra-atos connection
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


    - connection ssh keep-alive-interval <seconds> (default 0)

      Configure SSH client keep alive interval in seconds, default 0 (i.e. no keep-alive). The
      keep-alive is implemented in the client by sending an ssh 'ignore' message on the given
      interval.


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


    - connection logger silent <true|false> (default false)

      Toggle detailed logs to only written to store.


    - connection filtered_sync_from <true|false> (default false)


# 5. ned-settings aethra-atos transaction
-----------------------------------------

  Transaction specific settings.


    - transaction trans-id-method <enum> (default modeled-config)

      Select the method for calculating transaction-id.

      modeled-config  - Use a snapshot of the data of only the modeled parts of running config for
                        calculation.

      full-config     - Use a snapshot of the full running config for calculation.

      device-custom   - Use a device custom method to get a value to use for trans-id.


# 6. ned-settings aethra-atos logger
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


