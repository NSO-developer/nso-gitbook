# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/ribbon-psx/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/ribbon-psx/
  device
    /ncs:/device/devices/device:<name>/ned-settings/ribbon-psx/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings ribbon-psx

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings ribbon-psx
  2. logger
  3. read
  ```


# 1. ned-settings ribbon-psx
----------------------------

  Configure Ribbon PSX ned-settings.


    - ribbon-psx connection remote-protocol <enum> (default https)

      Connection type.

      http   - http.

      https  - https.


    - ribbon-psx soap-payload psx-api-version <string>

      Configure PSX API version(ex: r12_02_00).


    - ribbon-psx soap-payload psx-name <string>

      Configure PSX name.


    - ribbon-psx live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


# 2. ned-settings ribbon-psx logger
-----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


# 3. ned-settings ribbon-psx read
---------------------------------

  Settings used when reading from device.


    - read parallel-api-calls <enum> (default enable)

      Enable/Disable parallel api calls invocation using Threads.(Default is enable).

      disable  - disable.

      enable   - enable.



    - read warning <regex>

      This setting is used to ignore warnings/errors when reading from device.

      NED will treat any SOAP Fault as an error and abort the transaction.
      Sometimes SOAP Fault message is not an actual error. It could be a
      warning or expected result from a device for specific operation.
      The NED has a static list of known warnings, for example ERR_REC_NOT_FOUND
      is expected when querying data which is not exists on the device, in that
      case it should be ignored.

      If you encounter any new warnings/errors that should not be treated as error,
      you can configure the NED to ignore them using this ned-setting.

      The list key is a regular expression with a warning that should be
      ignored.

      For example, to add a new warning to ignore list:
        # devices device <name> ned-settings ribbon-psx read warning ".*\\(ERR_REC_NOT_FOUND\\) Database row not found.*"
        # commit


