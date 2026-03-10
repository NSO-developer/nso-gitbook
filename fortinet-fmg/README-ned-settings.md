# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/fortinet-fmg/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/fortinet-fmg/
  device
    /ncs:/device/devices/device:<name>/ned-settings/fortinet-fmg/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings fortinet-fmg

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings fortinet-fmg
  2. connection
  3. logger
  4. read
  5. install-config-to-fortigate
  ```


# 1. ned-settings fortinet-fmg
------------------------------

  Fortinet FMG ned-settings.


    - fortinet-check-sync <enum> (default enable)

      Check fortigate and fortimanager are in sync before pushing config.

      enable   - enable fortigate and fortimanager check-sync before pushing config.

      disable  - disable fortigate and fortimanager check-sync.


    - specific-adom-sync-from <string>

      Specify adom names to fetch from device.

      Example-1:
      # devices device dev-1 ned-settings fortinet-fmg specific-adom-sync-from [ root ]

      Example-2:
      # devices device dev-1 ned-settings fortinet-fmg specific-adom-sync-from [ root other ]

      NOTE: only configured adoms will be fetched during sync-from/check-sync.


    - proceed-sync-from-on-invalid-value <true|false> (default false)

      The value ranges or types on all versions of fortimanager may not have
      been accounted for by the NED. By default, invalid values cause the
      NED to fail. In some cases, however, it may be advantageous to have
      the NED ignore an invalid value, and proceed with sync-from for other
      objects. In that case, this ned-setting may be set to 'true' to enable
      such behavior.


    - workspace-mode <enum> (default disabled)

      FMG workspace mode.

      disabled  - Workspace disabled.

      normal    - Workspace lock mode.

      workflow  - Workspace workflow mode.

      If workspace mode set to normal, NED will do following.

        1. lock adom workspace
        2. apply config changes
        3. commit adom workspace changes
        4. install changes
        5. unlock adom workspace.

      If workspace mode set to workflow, NED will do following.

        1. check all workflow sessions, if following matched NED will return with an error.
           - state 1, flag 0 - created but not saved,
           - state 1, flag 1 - saved but not submitted
           - state 2, flag 0 - submitted but not approved
        2. lock adom workspace
        3. start workflow session
        4. apply config changes
        5. save workflow session
        6. submit workflow session
        7. approve workflow session
        8. install changes
        9. unlock adom workspace


# 2. ned-settings fortinet-fmg connection
-----------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection remote-protocol <enum> (default https)

      Connection type.

      http   - http.

      https  - https.


    - connection secondary-remote-address <union>

      Secondary Ip address.


    - connection secondary-remote-name <string>

      Secondary Ip remote name.


    - connection secondary-remote-password <string>

      Secondary Ip remote password.


    - connection ha-status-check <enum> (default enable)

      Check sys ha status during device connection.

      disable  - Disable ha status check during device connection.

      enable   - Enable ha status check during device connection.


    - connection platform-prefer-cdb <true|false> (default true)

      Prefer CDB cache for platform information retrieval.


# 3. ned-settings fortinet-fmg logger
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


# 4. ned-settings fortinet-fmg read
-----------------------------------

  Settings used when reading from device.


    - read parallel-api-calls <enum> (default disable)

      Enable/Disable parallel API calls during sync-from/partial-sync using JAVA Threads.

      disable  - disable.

      enable   - enable.


    - read parallelism-level <uint16> (default 1)

      Parallelism level for I/O-bound API calls (default: CPU * 2, minimum: CPU * 1).

      The parallelism level controls the target number of parallel HTTP API calls
      to FortiManager when parallel-api-calls is enabled. This uses a ForkJoinPool
      with work-stealing for efficient I/O-bound operations.

      Default Behavior (value = 1 or not set):
        - Auto-calculates as: CPU_COUNT * 2 (conservative)
        - Example: 10-core system = 20 parallelism level

      User-Configured Values (value >= CPU_COUNT * 1):
        - Uses your exact specified value
        - Allows overriding beyond default if needed
        - Example: set 10, 20, or any value >= 10

      Minimum Enforcement (value < CPU_COUNT):
        - Automatically enforced to CPU_COUNT (CPU * 1) for performance safety
        - Example: On 10-core system, minimum = 10

      Note:
        This is a parallelism level, not a hard thread limit. The ForkJoinPool
        may create additional threads when tasks block on I/O operations, which
        is expected and beneficial for I/O-bound HTTP API calls.

      Configuration Examples:
        ```
        # Auto (default) - 20 on 10-core system (conservative)

        # 30 parallelism
        # devices device dev-1 ned-settings fortinet-fmg read parallelism-level 30

        # Example below minimum (will be enforced to 10 on 10-core)
        # devices device dev-1 ned-settings fortinet-fmg read parallelism-level 5
        ```

      Performance Note (Best-Effort):
        The parallelism-level setting is best-effort and provides limited scalability
        beyond a certain threshold. Increasing or decreasing the value may not always
        result in proportional performance changes due to NSOs maapi.loadConfigCmds()
        being a synchronized, single-threaded operation that processes configuration
        sequentially. This creates a bottleneck where multiple parallel threads must
        queue and wait, limiting the benefits of very high parallelism levels.


    - read transaction-id-provisional <true|false> (default true)

      Enable/Disable use of new NSO feature to set provisional transaction-id in show() to save a
      call to getTransId() with sync-from.


# 5. ned-settings fortinet-fmg install-config-to-fortigate
----------------------------------------------------------

  These ned-settings are used to control NED behavior when pushing configurations to fortigate
  device (installation phase).


    - install-config-to-fortigate install-mode <enum> (default enable)

      enable or disable install-config to fortigate device.

      enable   - enable.

      disable  - disable.


    - install-config-to-fortigate install-dependency-objects-update <true|false> (default false)

      Install dependency objects update to fortigate device.

      When this setting is set to true, NED automatically identifies firewall dependency objects
      that have been updated in the transaction and triggers necessary policy package
      installations to affected FortiGate devices.

      NED scans through all prepare nodes and identifies updated firewall objects that may
      be referenced in policy packages. The NED supports multiple dependency object types with
      three types of reference patterns:

      DIRECT references only:
        - firewall-addrgrp, firewall-addrgrp6 (firewall-policy/srcaddr, firewall-policy/dstaddr, firewall-policy/srcaddr6, firewall-policy/dstaddr6)
        - firewall-service-group (firewall-policy/service)
        - firewall-vip (firewall-policy/dstaddr)
        - firewall-ippool (firewall-policy/poolname)
        - application-list (firewall-policy/application-list)
        - antivirus-profile (firewall-policy/av-profile)
        - ips-sensor (firewall-policy/ips-sensor)
        - firewall-ssl-ssh-profile (firewall-policy/ssl-ssh-profile)
        - webfilter-profile (firewall-policy/webfilter-profile)
        - firewall-profile-protocol-options (firewall-policy/profile-protocol-options)
        - user-adgrp (firewall-policy/fsso-groups)

      HYBRID references (both direct AND indirect):
        - firewall-address: firewall-policy/srcaddr, firewall-policy/dstaddr OR firewall-addrgrp/member -> firewall-policy/srcaddr, firewall-policy/dstaddr
        - firewall-address6: firewall-policy/srcaddr6, firewall-policy/dstaddr6 OR firewall-addrgrp6/member -> firewall-policy/srcaddr6, firewall-policy/dstaddr6
        - firewall-service-custom: firewall-policy/service OR firewall-service-group/member -> firewall-policy/service

      INDIRECT references only:
        - webfilter-urlfilter: webfilter-profile/web/urlfilter-table -> firewall-policy/webfilter-profile
        - webfilter-content: webfilter-profile/web/bword-table -> firewall-policy/webfilter-profile
        - webfilter-content-header: webfilter-profile/web/content-header-list -> firewall-policy/webfilter-profile
        - ips-custom: ips-sensor/entries/rule (using rule-id) -> firewall-policy/ips-sensor

      For indirect references, NED performs two-step resolution:
        1. Find intermediate objects that reference the updated object
        2. Find policies that reference those intermediate objects

      When these objects are modified, any policy packages that reference them (directly or through
      intermediate objects) will be automatically identified and reinstalled to FortiGate devices,
      ensuring that configuration changes take effect properly across the network.

      NOTE: This feature requires NED to query policy packages, firewall policies, and intermediate
      objects in the NSO CDB to determine object references. This may increase commit time depending
      on the number and size of policy packages, firewall policies, and intermediate objects in your
      deployment.

      Performance Consideration:
      If you notice the NED taking more time to query the CDB to find dependency references, this
      cannot be avoided within the NED. The NED must query the CDB to find dependency references,
      and the time spent on queries is proportional to the amount of configuration data in the CDB
      (i.e., more CDB configuration results in more time spent on querying). It is not possible to
      reduce this query time within the NED.

      Alternative Approach:
      As an alternative, users can consider using the live-status exec action to install packages
      for better timing performance. The NED supports "live-status exec any", allowing users to
      execute /securityconsole/install/package via a service when dependency objects are modified.
      Therefore, we recommend disabling "install-config-to-fortigate/install-dependency-objects-update"
      and instead using the "live-status exec any" option via a service for scenarios where query
      time is a concern.

      Example:
      ```
      admin@ncs# devices device dev-1 live-status fortimanager-stats:exec any json-input \
        \"{"method":"exec","params":[{"url":"/securityconsole/install/package",\
        "data":{"adom":"name_of_adom","pkg":"name_of_pkg"}}],"session":"session-id","id":1}\"
      ```


    - install-config-to-fortigate install-status-check-max-retries <NUM> (default 5)

      Max number of retries, when checking status.


    - install-config-to-fortigate install-status-check-interval <NUM> (default 30)

      Specify retry interval in seconds.


