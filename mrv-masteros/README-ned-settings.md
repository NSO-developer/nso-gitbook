# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/mrv-masteros/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/mrv-masteros/
  device
    /ncs:/device/devices/device:<name>/ned-settings/mrv-masteros/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings mrv-masteros

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings mrv-masteros
  2. live-status
  3. media-select-default-value
  4. connection
  5. proxy
  6. developer-settings
  7. behaviour
     7.1. config-error-retry
  8. logger
  ```


# 1. ned-settings mrv-masteros
------------------------------

  Control usage of NED-settings.


    - mrv-masteros persist-to-startup-config <true|false> (default false)

      Specify if the configuration data should be persisted to startup config.


    - mrv-masteros extended-parser <enum> (default auto)

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


# 2. ned-settings mrv-masteros live-status
------------------------------------------


    - live-status time-to-live <int32> (default 50)


# 3. ned-settings mrv-masteros media-select-default-value
---------------------------------------------------------

  List of default values for port media-select.

    - mrv-masteros media-select-default-value <port> <default_mode>

      - port <uint32>

        Port number.

      - default_mode <string>

        Port's default media-select value, e.g. sfp, sfp+ or auto.


# 4. ned-settings mrv-masteros connection
-----------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection number-of-retries <uint8> (default 0)

      Configure max number of retires the NED will try to connect to thedevice before giving up.
      Default 0.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


# 5. ned-settings mrv-masteros proxy
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


# 6. ned-settings mrv-masteros developer-settings
-------------------------------------------------

  Contains settings used by the NED developers.


    - developer-settings load-from-file <string>

      Make the NED load a file containing raw device config when doing sync-from. Only works on
      NETSIM targets.


    - developer-settings platform model <string>

      Override device model name/number.


    - developer-settings platform name <string>

      Override device name.


    - developer-settings platform version <string>

      Override device version.


    - developer-settings device-type <enum> (default netsim)

      Real or simulated device.

      netsim  - netsim.

      device  - device.


# 7. ned-settings mrv-masteros behaviour
----------------------------------------

  NED specific behaviours.


    - behaviour config-output-max-retries <NUM> (default 90)

      Max number of retries, when sending config command to device.


    - behaviour config-output-retry-intervel <NUM> (default 1)

      Specify retry interval in seconds.


    - behaviour send-rule-enable-explicit <true|false> (default false)

      Specify if the configuration data should be persisted to startup config.


## 7.1. ned-settings mrv-masteros behaviour config-error-retry
--------------------------------------------------------------

  Device error/warning regexp entry list.

    - behaviour config-error-retry <error>

      - error <WORD>

        Warning/error regular expression, e.g. GTAC Failure .*.


# 8. ned-settings mrv-masteros logger
-------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


