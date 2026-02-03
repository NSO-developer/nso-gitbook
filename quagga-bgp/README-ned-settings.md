# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/quagga-bgp/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/quagga-bgp/
  device
    /ncs:/device/devices/device:<name>/ned-settings/quagga-bgp/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings quagga-bgp

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings quagga-bgp
  2. logger
  3. connection
  4. write
     4.1. config-warning
  5. live-status
  6. developer
  ```


# 1. ned-settings quagga-bgp
----------------------------

  The following top level ned-settings can be modified.


    - extended-parser <enum> (default auto)

      Make the quagga-bgp NED handle CLI parsing (i.e. transform the running-config from the device
      to the model based config tree).

      disabled        - DEPRECATED. Same as robust-mode.

      turbo-mode      - The NED executes the whole command parsing by itself, completely bypassing
                        the NSO CLI parser. The configuration dump is transferred to NSO in XML
                        format.

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


# 2. ned-settings quagga-bgp logger
-----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set NED level of debugging. Warning: If you set the logger level
      to debug, or even to verbose, the logs files may quickly grow very
      large as well as impact the NSO/NED performance.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings quagga-bgp connection
---------------------------------------

  Connection configuration.


    - connection connector <WORD>

      Change the default connector used for this device, profile or
      global setup. The new connector must be located in the
      src/metadata folder in the NED package, where also the README
      file is located for more information on configuring connectors.
      Default 'ned-connector-default.json'


    - connection number-of-retries <uint8> (default 0)

      Configure max number of extra retries the NED will try to connect to the device before giving
      up.


    - connection time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry.


    - connection prompt-timeout <0|1000-1000000> (default 0)

      This ned-setting can be used to configure a timeout in the
      connection process which can be used to wake the device if the
      device requires additional newlines to be sent before proceeding.


# 4. ned-settings quagga-bgp write
----------------------------------

  Settings used when writing to device.


## 4.1. ned-settings quagga-bgp write config-warning
----------------------------------------------------

  After having sent a config command to the device the NED will treat
  any text reply as an error and abort the transaction. The config
  command that caused the failed transaction will be shown together
  with the error message returned by the device. Sometimes the text
  message is not an actual error. It could be a warning that should be
  ignored. The NED has a static list of known warnings, an example:

           // general
           "warning: \\S+.*",
           "%.?note:",
           "info:",

          etc etc.

  If you stumble upon a warning not already in the NED, which is quite
  likely due to the large number of warnings, you can configure the
  NED to ignore them using the 'quagga-bgp write config-warning' ned-setting.

  The list key is a regular expression with a warning that should be
  ignored.

  For example, to add a new warning exception:

    admin@ncs(config)# devices global-settings ned-settings
        quagga-bgp write config-warning "Address .* may not be up"
    admin@ncs(config)# commit
    Commit complete.
    admin@ncs(config)# devices device dev-0 disconnect
    admin@ncs(config)# devices device dev-0 connect
    result true
    info (admin) Connected to dev-0

  Note that in order for the warning exception to take effect, you
  must disconnect and connect again, to re-read ned-settings.


# 5. ned-settings quagga-bgp live-status
----------------------------------------

  Configure NED settings related to live-status.


    - live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.


# 6. ned-settings quagga-bgp developer
--------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer progress-verbosity <enum> (default disabled)

      Maximum NED verbosity level which will be reported.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


