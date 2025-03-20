# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/velocloud-vco/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/velocloud-vco/
  device
    /ncs:/device/devices/device:<name>/ned-settings/velocloud-vco/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings velocloud-vco

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings velocloud-vco
  2. connection
  3. developer
  4. logger
  5. configuration
  6. authentication
  ```


# 1. ned-settings velocloud-vco
-------------------------------


# 2. ned-settings velocloud-vco connection
------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection api-base-url <string> (default /portal/rest)

      API base URL for device REST API.


    - connection ssl accept-any <true|false> (default false)

      Accept any SSL certificate presented by the device.
      Warning! This enables Man in the Middle attacks and
      should only be used for testing and troubleshooting.


    - connection ssl certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like
      "----- BEGIN CERTIFICATE -----".

      Default uses the default trusted certificates installed in
      Java JVM.

      An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


# 3. ned-settings velocloud-vco developer
-----------------------------------------

  Contains settings used by the NED developers.


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


# 4. ned-settings velocloud-vco logger
--------------------------------------

  Java logging settings.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 5. ned-settings velocloud-vco configuration
---------------------------------------------

  Ned configuration options for fetching and managing enterprises (FULL, MULTI, SOLO).


    - configuration mode <enum> (default multi)

      multi  - (default) Fetch top level list and enterprises list, without full enterprise
               configuration.

      solo   - Manage a single enterprise; enterprise-id value has to be provided.

      full   - (slow) Fetch full configuration (top level lists, enterprises list with full
               enterprise configuration).


    - configuration enterprise-id <uint32>

      Managed enterprise id.


# 6. ned-settings velocloud-vco authentication
----------------------------------------------

  NED authentication options.


    - authentication type <enum> (default cookie)

      basic   - Basic HTTP authorization method.

      cookie  - (default) Normal cookie based authentication.

      token   - Token based authentication.


    - authentication token <string>


