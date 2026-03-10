# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/vmware-vsphere/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/vmware-vsphere/
  device
    /ncs:/device/devices/device:<name>/ned-settings/vmware-vsphere/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings vmware-vsphere

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings vmware-vsphere
  2. developer
  3. logger
  4. connection
  ```


# 1. ned-settings vmware-vsphere
--------------------------------

  Settings for the vCenter NED.


    - vmware-vsphere file-path <string> (default ~)

      Path to the OVA/OVF files (full absolute path).


    - vmware-vsphere device-flavor <enum> (default legacy)

      Sets the device flavor.

      legacy         - Legacy device (portgroup as actionpoint).

      portgroup-cfg  - portgroup is configurable for this device flavor.

      netsim         - netsim.


    - vmware-vsphere iso-folder <string>

      ISO folder path.


    - vmware-vsphere ignore-vm-host-datastore-transid <true|false> (default false)

      Set this flag to true to ignore host / datastore info on trans-id computation.


# 2. ned-settings vmware-vsphere developer
------------------------------------------

  Development related parameters.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


# 3. ned-settings vmware-vsphere logger
---------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 4. ned-settings vmware-vsphere connection
-------------------------------------------


    - connection ssl-version <enum> (default TLSv1)

      SSL      - SSL.

      SSLv2    - SSLv2.

      SSLv3    - SSLv3.

      TLS      - TLS.

      TLSv1    - TLSv1.

      TLSv1.1  - TLSv1.1.

      TLSv1.2  - TLSv1.2.


    - connection authentication method <enum> (default bearer-token)

      basic         - basic.

      none          - none.

      bearer-token  - bearer-token.


    - connection authentication mode <enum> (default probe)

      probe         - probe.

      static-token  - static-token.


    - connection authentication value <string>


    - connection authentication token-request url <string> (default /rest-gateway/rest/api/v1/auth/token)

      URL to request token (default /restconf/auth). This does not use the base-url.


    - connection authentication token-request port <uint32>

      PORT to request token (default 443).


    - connection authentication token-request username-parameter <string>

      Username parameter name if different from 'username'.


    - connection authentication token-request password-parameter <string>

      Password parameter name if different from 'password'.


    - connection ssl accept-any <true|false> (default true)

      Accept any SSL certificate presented by the device.
      Warning! This enables Man in the Middle attacks and
      should only be used for testing and troubleshooting.


