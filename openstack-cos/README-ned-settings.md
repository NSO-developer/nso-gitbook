# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/openstack-cos/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/openstack-cos/
  device
    /ncs:/device/devices/device:<name>/ned-settings/openstack-cos/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings openstack-cos

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings openstack-cos
  2. connection
  3. behaviour
  4. logger
  5. cli-connection
  ```


# 1. ned-settings openstack-cos
-------------------------------

  Openstack COS ned-settings.


    - openstack-cos admin-project-name <string> (default admin)

      deprecated;;use connection/project-scope-name setting.


    - openstack-cos live-status time-to-live <int32> (default 50)

      Define time-to-live for data fetched from the device via live-status.(default 50).


# 2. ned-settings openstack-cos connection
------------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection remote-protocol <enum> (default http)

      Connection type.

      http   - http.

      https  - https.


    - connection identity-port <uint16> (default 5000)

      Identity API port.


    - connection identity-api-path <string> (default v3)

      Use this value to compensate for web services configured to run
      anywhere else than root. The final request URL will be
      constructed as:
      http[s]://<ip>:<port>[/<identity-api-path>]/<resource>
      The path should not have any initial or trailing '/'

      NOTE: NED only supports identity API from v3, due to backwards
      incompatible openstack identity API changes.


    - connection networking-port <uint16> (default 9696)

      Networking API port.


    - connection networking-api-path <string> (default v2.0)

      Use this value to compensate for web services configured to run
      anywhere else than root. The final request URL will be
      constructed as:
      http[s]://<ip>:<port>[/<networking-api-path>]/<resource>
      The path should not have any initial or trailing '/'


    - connection image-port <uint16> (default 9292)

      Image API port.


    - connection image-api-path <string> (default v2.0)

      Use this value to compensate for web services configured to run
      anywhere else than root. The final request URL will be
      constructed as:
      http[s]://<ip>:<port>[/<image-api-path>]/<resource>
      The path should not have any initial or trailing '/'


    - connection compute-port <uint16> (default 8774)

      Compute API port.


    - connection compute-api-path <string> (default v2.1)

      Use this value to compensate for web services configured to run
      anywhere else than root. The final request URL will be
      constructed as:
      http[s]://<ip>:<port>[/<compute-api-path>]/<resource>
      The path should not have any initial or trailing '/'


    - connection volume-port <uint16> (default 8776)

      Volume API port.


    - connection volume-api-path <string> (default v2)

      Use this value to compensate for web services configured to run
      anywhere else than root. The final request URL will be
      constructed as:
      http[s]://<ip>:<port>[/<volume-api-path>]/<resource>
      The path should not have any initial or trailing '/'


    - connection domain-name <string> (default default)

      Specify domain name.


    - connection project-scope-name <string> (default admin)

      Specify name of project scope. NED gets auth token for project scope.


    - connection ssh host-key known-hosts-file <string>

      Path to openssh formatted 'known_hosts' file containing valid host keys.


    - connection ssh host-key public-key-file <string>

      Path to openssh formatted public (.pub) host key file.


# 3. ned-settings openstack-cos behaviour
-----------------------------------------

  NED specific behaviours.


    - behaviour kicker-id-store <enum> (default disable)

      enable   - enable.

      disable  - disable.


    - behaviour sync-from disable-object-sync-from <name>

      Specify object name to be disabled in sync-from.

      - name <enum>

        ports             - disable /projects/networks/ports.

        volumes           - disable /projects/volumes.

        volume_quota_set  - disable /projects/volume_quota_set.

        volume_types      - disable /projects/volume_types.

        snapshots         - disable /projects/snapshots.

        security_groups   - disable /projects/security_groups.


    - behaviour sync-from filter-config-in-sync-from <name>

      Specify object name and xpath to be removed in sync-from.

      - name <enum>

        ports            - ports.

        security_groups  - security_groups.

      - remove-xpath-configs <xpath>

        - xpath <string>

          e.g: /projects[name='admin']/networks/ports.


    - behaviour check-sync remove-xpath-configs <xpath>

      Used to remove config from checksum(check-sync) calculation.

      - xpath <string>

        e.g: /images/updated_at.


    - behaviour config-error-retry errors <error>

      Device error/warning regexp entry list.

      - error <WORD>

        Warning/error regular expression, e.g: .* Volume .* status must be available, but current
        status is: creating.*.


    - behaviour config-error-retry config-output-max-retries <NUM> (default 5)

      Max number of retries, when sending config command to device.


    - behaviour config-error-retry config-output-retry-intervel <NUM> (default 3)

      Specify retry interval in seconds.


    - behaviour config-warning-ignore <warning>

      Device warning regexp entry list.

      - warning <WORD>

        Warning regular expression, e.g. .*Unable to create the network. The .* on physical network
        .* is in use*.


# 4. ned-settings openstack-cos logger
--------------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default info)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default false)

      Toggle logs to be added to ncs-java-vm.log.


# 5. ned-settings openstack-cos cli-connection
----------------------------------------------

  Configure SSH or telnet connection settings.


    - cli-connection enable <true|false> (default false)

      Enable/Disable cli connection.


    - cli-connection remote-connection-type <enum> (default ssh)

      Connection type.

      ssh     - ssh.

      telnet  - telnet.


    - cli-connection remote-ip <union>

      Ip.


    - cli-connection remote-port <uint16> (default 0)

      Port.


    - cli-connection remote-name <string>

      ssh/telnet user name on the device.


    - cli-connection remote-password <string>

      ssh/telnet password on the device.


    - cli-connection remote-prompt <string> (default .*\$[ ]?$)

      ssh/telnet prompt(regexp) on the device.


