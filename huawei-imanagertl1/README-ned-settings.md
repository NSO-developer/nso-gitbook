# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/huawei-imanagertl1/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/huawei-imanagertl1/
  device
    /ncs:/device/devices/device:<name>/ned-settings/huawei-imanagertl1/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings huawei-imanagertl1

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings huawei-imanagertl1
  2. developer
  3. proxy
  4. connection
  5. dev_filter
  6. ETHANDVLANEXTRA
  7. logger
  ```


# 1. ned-settings huawei-imanagertl1
------------------------------------


    - huawei-imanagertl1 extended-parser <enum> (default auto)

      Make the NED handle CLI parsing (i.e. transform the running-config from the device to the
      model based config tree).

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


    - huawei-imanagertl1 commandToCommandDelay <uint32> (default 0)

      set a delay between consecutive commands, in ms.


# 2. ned-settings huawei-imanagertl1 developer
----------------------------------------------

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


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


# 3. ned-settings huawei-imanagertl1 proxy
------------------------------------------

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


# 4. ned-settings huawei-imanagertl1 connection
-----------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connection character-set <string> (default UTF-8)

      configure the device charset, used for telnet connection, leave to default if not used.


# 5. ned-settings huawei-imanagertl1 dev_filter
-----------------------------------------------

    - huawei-imanagertl1 dev_filter <name>

      - name <string>

        Device filter list.


# 6. ned-settings huawei-imanagertl1 ETHANDVLANEXTRA
----------------------------------------------------

  extra VLAN entries, formatted as FN-SN-PN (numbers separated by '-').

    - huawei-imanagertl1 ETHANDVLANEXTRA <entry>

      - entry <string>

        extra VLAN entries, formatted as FN-SN-PN (numbers separated by '-').


# 7. ned-settings huawei-imanagertl1 logger
-------------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


