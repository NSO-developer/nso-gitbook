# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/ciena-mcp/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/ciena-mcp/
  device
    /ncs:/device/devices/device:<name>/ned-settings/ciena-mcp/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings ciena-mcp

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings ciena-mcp
  2. connection
  3. logger
  4. developer
  ```


# 1. ned-settings ciena-mcp
---------------------------


    - mcp-scripts-folder <string> (default /var/opt/ncs/packages/mc-scripts)

      Define path to locations where MCP custom scripts are be stored.


    - mcp-service-model-api <enum> (default VERSION_4_BSM_L2SERVICE)

      Define latest max API vers supported by the NED; Warning! Customer dependent selection!.

      VERSION_1_ESM_PROVISION  - VERSION_1_ESM_PROVISION.

      VERSION_4_BSM_L2SERVICE  - VERSION_4_BSM_L2SERVICE.

      VERSION_6_TSM            - VERSION_6_TSM.


    - global-page-limit <uint64> (default 1000)

      Define global pagination limit for services; currently 1000.


    - live-prepare-check <true|false> (default false)

      TSM Specific: Enable live prepare device checks before modify.


    - sync-duplicate-clean <true|false> (default true)

      TSM Specific: Cache eline services and clean duplicated items at sync-from.


    - managed-lag <true|false> (default false)

      TSM Specific: enable to manage LAG section.


    - ciena-authentication-method <enum> (default legacy)

      Select legacy for simple user/pass auth; Uses bearer token only;
      Select CSFRCookie to use CSFR Token + Bearer token in header;

      legacy      - legacy.

      CSFRCookie  - CSFRCookie.


# 2. ned-settings ciena-mcp connection
--------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection remote-protocol <enum> (default https)

      Connection type.

      http   - http.

      https  - https.


    - connection ssl accept-any <true|false> (default true)

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


# 3. ned-settings ciena-mcp logger
----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 4. ned-settings ciena-mcp developer
-------------------------------------

  Contains settings used for debugging (intended for NED developers).


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


