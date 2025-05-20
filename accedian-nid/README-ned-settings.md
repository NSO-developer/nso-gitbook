# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/accedian-nid/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/accedian-nid/
  device
    /ncs:/device/devices/device:<name>/ned-settings/accedian-nid/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings accedian-nid

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings accedian-nid
  2. connection
  3. deprecated
  4. logger
  5. transaction
  6. sfp-ports
  7. developer
  ```


# 1. ned-settings accedian-nid
------------------------------

  Configure settings specific to the connection between NED and device.


    - extended-parser <enum> (default auto)

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


# 2. ned-settings accedian-nid connection
-----------------------------------------

  Configure settings specific to the connection between NED and device.


    - number-of-retries <uint8> (default 0)

      Configure max number of retries the NED will try to connect to the device before giving up.
      Default 0.


    - time-between-retry <uint8> (default 1)

      Configure the time in seconds the NED will wait between each connect retry. Default 1s.


    - connector <WORD>

      Change the default connector, e.g. 'ned-connector-default.json'.


# 3. ned-settings accedian-nid deprecated
-----------------------------------------

  Deprecated ned-settings.


    - connection legacy-mode <enum> (default disabled)

      enabled   - enabled.

      disabled  - disabled.


# 4. ned-settings accedian-nid logger
-------------------------------------

  Settings for controlling logs generated.


    - level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 5. ned-settings accedian-nid transaction
------------------------------------------

  Transaction specific settings.


    - trans-id-method <enum> (default modeled-config)

      Select the method for calculating transaction-id.

      modeled-config  - Use a snapshot of the data of only the modeled parts of running config for
                        calculation.

      full-config     - Use a snapshot of the full running config for calculation.

      device-custom   - Use a device custom method to get a value to use for trans-id.


# 6. ned-settings accedian-nid sfp-ports
----------------------------------------

  This list contains port names that will keep 'force-tx-on'. If the list is empty 'force-tx-on'
  will be left as it is.

    - sfp-ports <port>

      - port <string>

        Port name,case sensitive.


# 7. ned-settings accedian-nid developer
----------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


