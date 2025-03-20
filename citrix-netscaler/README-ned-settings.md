# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/citrix-netscaler/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/citrix-netscaler/
  device
    /ncs:/device/devices/device:<name>/ned-settings/citrix-netscaler/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings citrix-netscaler

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings citrix-netscaler
  2. connection
  3. netscaler-ha
  4. logger
  5. developer
  ```


# 1. ned-settings citrix-netscaler
----------------------------------

  Citrix-netscaler ned-settings.


    - citrix-netscaler use-admin-partition <string>

      Admin partition name.


    - citrix-netscaler use-bulkbindings-api-filter <true|false> (default false)

      Use bulkbindings API filter when retreiving bindings object.


    - citrix-netscaler sync-objects-list-filter <string>

      User editable list of comma separated syncing objects.


# 2. ned-settings citrix-netscaler connection
---------------------------------------------

  Citrix netscaler per device connection configuration.


    - connection mode <enum> (default accept-any)

      How should the device verify certificates.

      use-java-key-store  - Look in the default java key store for trusted

                            certificates.

      use-certificate     - Use the certificate entered into device.

      accept-any          - Trusts all SSL certificate presented to the device.

                            Warning! This enables Man in the Middle attacks and

                            should only be used for testing and troubleshooting.

      unsecured           - Use http unsecured connection.


    - connection java-key-store-path <string>

      .


    - connection java-key-store-password <string>

      .


    - connection certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like
      "----- BEGIN CERTIFICATE -----".
      //
      //Default uses the default trusted certificates installed in
      //Java JVM.

      An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


    - connection authentication <enum> (default basic)

      Authentication type.

      basic  - basic.

      token  - token.


# 3. ned-settings citrix-netscaler netscaler-ha
-----------------------------------------------

  Configure ha settings.


    - netscaler-ha primary-ip <string>


    - netscaler-ha secondary-ip <string>


    - netscaler-ha shared-ip <string>


    - netscaler-ha shared-netmask <string>


# 4. ned-settings citrix-netscaler logger
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


# 5. ned-settings citrix-netscaler developer
--------------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


