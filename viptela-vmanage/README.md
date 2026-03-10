# Table of contents
-------------------

  ```
  1. General
     1.1 Extract the NED package
     1.2 Install the NED package
         1.2.1 Local install
         1.2.2 System install
     1.3 Configure the NED in NSO
  2. Optional debug and trace setup
  3. Dependencies
  4. Sample device configuration
  5. Built in live-status actions
  6. Built in live-status show
  7. Limitations
  8. How to report NED issues
  9. Additional NED features
   9.1 Administration - LicenseManagement
   9.2 Administration - Settings - Statistics Settings
   9.3 Feature templates/device templates/vars
   9.4 Policies structure and organization (localized policy, centralized policy, security policy)
   9.5 Localized policies: vedgeRoute and ACL lists sequence IDs
  ```


# 1. General
------------

  This document describes the viptela-vmanage NED.

  Additional README files bundled with this NED package
  ```
  +---------------------------+------------------------------------------------------------------------------+
  | Name                      | Info                                                                         |
  +---------------------------+------------------------------------------------------------------------------+
  | README-ned-settings.md    | Information about all run time settings supported by this NED.               |
  +---------------------------+------------------------------------------------------------------------------+
  ```

  Common NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | netsim                    | no        |                                                                  |
  |                           |           |                                                                  |
  | check-sync                | yes       |                                                                  |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       |                                                                  |
  |                           |           |                                                                  |
  | live-status actions       | yes       |                                                                  |
  |                           |           |                                                                  |
  | live-status show          | no        |                                                                  |
  |                           |           |                                                                  |
  | load-native-config        | no        |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Cisco vManage             | 20.3            | vManag |                                                   |
  |                           |                 | e      |                                                   |
  |                           |                 |        |                                                   |
  | Cisco vManage             | 20.5            | vManag |                                                   |
  |                           |                 | e      |                                                   |
  |                           |                 |        |                                                   |
  | Cisco vManage             | 20.6            | vManag |                                                   |
  |                           |                 | e      |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-viptela-vmanage-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-viptela-vmanage-1.0.1.signed.bin
      > ./ncs-6.0-viptela-vmanage-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-viptela-vmanage-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-viptela-vmanage-1.0.1.tar.gz
      ```


## 1.2 Install the NED package
------------------------------

  There are two alternative ways to install this NED package.
  Which one to use depends on how NSO itself is setup.

  In the instructions below the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED download directory: /tmp/ned-package-store
  - NSO run time directory: ~/nso-lab-rundir

  A prerequisite is to set the environment variable NSO_RUNDIR to point at the NSO run time directory:

  ```
  > export NSO_RUNDIR=~/nso-lab-rundir
  ```


### 1.2.1 Local install
-----------------------

  This section describes how to install a NED package on a locally installed NSO
  (see "NSO Local Install" in the NSO Installation guide).

  It is assumed the NED package has been been unpacked to a tar.gz file as described in 1.1.

  1. Untar the tar.gz file. This creates a new sub-directory named:
     `viptela-vmanage-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-viptela-vmanage-1.0.1.tar.gz
     > ls -d */
     viptela-vmanage-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package viptela-vmanage-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package viptela-vmanage-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-viptela-vmanage-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package viptela-vmanage-gen-1.0
      result true
   }
  ```


### 1.2.2 System install
------------------------

  This section describes how to install a NED package on a system installed NSO (see "NSO System
  Install" in the NSO Installation Guide).

  It is assumed the NED package has been been unpacked to a tar.gz file as described in 1.1.

  1. Do a NSO backup before installing the new NED package:

     ```
     > $NCS_DIR/bin/ncs-backup
     ```

  2. Start a NSO CLI session and fetch the NED package:

     ```
     > ncs_cli -C -u admin
     admin@ncs# software packages fetch package-from-file \
               /tmp/ned-package-store/ncs-6.0-viptela-vmanage-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-viptela-vmanage-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install viptela-vmanage-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-viptela-vmanage-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-viptela-vmanage-gen-1.0
       loaded
     }
     ```


## 1.3 Configure the NED in NSO
-------------------------------

  This section describes the steps for configuring a device instance
  using the newly installed NED package.

  - Start a NSO CLI session:

    ```
    > ncs_cli -C -u admin
    ```

  - Enter configuration mode:

    ```
    admin@ncs# configure
    Entering configuration mode terminal
    admin@ncs(config)#
    ```

  - Configure a new authentication group (my-group) to be used for this device:

    ```
    admin@ncs(config)# devices authgroup group my-group default-map remote-name <user name on device> \
                       remote-password <password on device>
    ```

  - Configure a new device instance (example: dev-1):

    ```
    admin@ncs(config)# devices device dev-1 address <ip address to device>
    admin@ncs(config)# devices device dev-1 port <port on device>
    admin@ncs(config)# devices device dev-1 device-type generic ned-id viptela-vmanage-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
  - Finally commit the configuration

    ```
    admin@ncs(config)# commit
    ```

  - Verify configuration, using a sync-from.

    ```
    admin@ncs(config)# devices device dev-1 sync-from
    result true
    ```

  If the sync-from was not successful, check the NED configuration again.


# 2. Optional debug and trace setup
-----------------------------------

  It is often desirable to see details from when and how the NED interacts with the device(Example: troubleshooting)

  This can be achieved by configuring NSO to generate a trace file for the NED. A trace file
  contains information about all interactions with the device. Messages sent and received as well
  as debug printouts, depending on the log level configured.

  NSO creates one separate trace file for each device instance with tracing enabled.
  Stored in the following location:

  `$NSO_RUNDIR/logs/ned-viptela-vmanage-gen-1.0-<device name>.trace`

  Do as follows to enable tracing in one specific device instance in NSO:


  1. Start a NSO CLI session:

     ```
     > ncs_cli -C -u admin
     ```

  2. Enter configuration mode:

     ```
     admin@ncs# configure
     Entering configuration mode terminal
     admin@ncs(config)#
     ```

  3. Enable trace raw:

     ```
     admin@ncs(config)# devices device dev-1 trace raw
     admin@ncs(config)# commit
     ```

     Alternatively, tracing can be enabled globally affecting all configured device instances:

     ```
     admin@ncs(config)# devices global-settings trace raw
     admin@ncs(config)# commit
     ```

  4. Configure the log level for printouts to the trace file:

     ```
     admin@ncs(config)# devices device dev-1 ned-settings viptela-vmanage logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings viptela-vmanage logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

  The log level 'info' is used by default and the 'debug' level is the most verbose.

  **IMPORTANT**:
  Tracing shall be used with caution. This feature does increase the number of IPC messages sent
  between the NED and NSO. In some cases this can affect the performance in NSO. Hence, tracing should
  normally be disabled in production systems.


  An alternative method for generating printouts from the NED is to enable the Java logging mechanism.
  This makes the NED print log messages to common NSO Java log file.

  `$NSO_RUNDIR/logs/ncs-java-vm.log`

  Do as follows to enable Java logging in the NED

  1. Start a NSO CLI session:

     ```
     > ncs_cli -C -u admin
     ```

  2. Enter configuration mode:

     ```
     admin@ncs# configure
     Entering configuration mode terminal
     admin@ncs(config)#
     ```

  3. Enable Java logging with level all from the NED package:

     ```
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.vmanage \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings viptela-vmanage logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings viptela-vmanage logger java true
     admin@ncs(config)# commit
     ```

  **IMPORTANT**:
  Java logging does not use any IPC messages sent to NSO. Consequently, NSO performance is not
  affected. However, all log printouts from all log enabled devices are saved in one single file.
  This means that the usability is limited. Typically single device use cases etc.


# 3. Dependencies
-----------------

  This NED has the following host environment dependencies:

  - Java 1.8 (NSO version < 6.2)
  - Java 17 (NSO version >= 6.2)
  - Gnu Sed

  Dependencies for NED recompile:

   - Apache Ant
   - Bash
   - Gnu Sort
   - Gnu awk
   - Grep
   - Python3 (with packages: re, sys, getopt, subprocess, argparse, os, glob)


# 4. Sample device configuration
--------------------------------

  devices authgroups group demo-authgroup
   default-map remote-name admin
   default-map remote-password "admin123"
  !
  devices device demo-vmanage
   address 10.10.10.10
   port 443
   authgroup demo-authgroup
   device-type generic ned-id viptela-vmanage-gen-1.7
   state admin-state unlocked
   trace raw
   connect-timeout 90
   read-timeout 90
   write-timeout 90
   ned-settings use-transaction-id false
   ned-settings viptela-vmanage connection ssl accept-any
   ned-settings viptela-vmanage connection api-base-url /dataservice
  !
  java-vm java-logging logger com.tailf.packages.ned.vmanage level level-all
  !


# 5. Built in live-status actions
---------------------------------

    action_status                              Retrieve the status of an ongoing action.
    activate_policy                            Activate a policy.
    activate_policy_by_name                    Activate a policy.
    add_controller                             Add a new controller.
    attach_cli                                 Attach device to CLI template.
    attach_cli_by_serial                       Attach device to CLI template.
    attach_master                              Attach device to Master Feature template.
    cluster
      cluster_add
      cluster_list
      cluster_remove
      cluster_update
    cor
      cor_authenticate
      cor_create_transit_vpc
      cor_delete_host_vpc_map
      cor_map_hostvpc_to_transitvpc
      delete_cor_transit_vpc
      get_cor_accounts
      get_cor_available_host_vpc
      get_cor_cloud
      get_cor_host_vpc_map
      get_cor_pem_keys
      get_cor_transit_vpc
      get_cor_vedge_image_id
      get_cor_vedge_size
      get_cor_vedgecloud_devices
    deactivate_policy                          Deactivate a policy.
    deactivate_policy_by_name                  Deactivate a policy
    decommission                               decommission a given device
    delete_vedge                               Delete a vedge.
    detach_cli                                 Detach device from CLI template.
    edit_controller                            Edit a controller.
    generate-bootstrap                         Generates bootstrap config for vEdge_cloud devices
    generate_csr                               Generate the CSR.
    get-device                                 get any device
    get-status                                 Retrieves activity status
    get_active_tasks_count                     Return the number of active background tasks.
    get_activity_summary                       Return the activities summary.
    get_attached_devices                       Get list of attached devices for a certain template.
    get_bootstrap_config                       Retrieve bootstrap configuration.
    get_certificates                           Get certificates list.
    get_controller_certificate_authorization   Get the Controller Certificate Authorization settings.
    get_controller_certificate_csrproperties   Get the Enterprise Certificate CSR properties.
    get_controllers                            Get controllers list.
    get_device_ip
    get_enterprise_root_ca                     Get the Enterprise Root CA.
    get_ips_signature                          Get the IPS Signature settings.
    get_security_policies                      Get security policies list.
    get_software_inventory                     Get software inventory for different device types.
    get_template_input_config                  Get a template's input configuration.
    get_template_params                        Get a template's input parameters
    get_tlsproxy_device_csr                    Get one or more devices CSR certificates.
    get_tlsproxy_list                          Get the SSL/TLS Proxy list.
    get_vedge_certificates                     Get vedge certificates list.
    get_vedges                                 Get vedges list.
    image_activate                             Activate a device image.
    image_get_list                             Retrieve all available images list.
    image_get_list_vedge                       Retrieve vEdge available software versions.
    image_get_ztp                              Get status of the ztp upgrade setting.
    image_install                              Install a device image.
    image_set_ztp                              Enable ZTP software version.
    image_upload                               Upload device image.
    image_upload_remote                        Upload remote device image.
    install_certificate                        Install signed certificate.
    invalidate_controller                      Invalidate a vSmart or vBond.
    invalidate_controller_by_system_ip         Invalidate a vSmart or vBond.
    is_vmanage_ready                           Check if the vManage is ready to accept HTTP requests.
    licensing_authenticate                     Authenticate the vMange to the CCSM system to allow managing of DNA licenses.
    licensing_sync                             Sync the vManage with the CCSM.
    migrate_device                             Migrate device from Viptela to Cisco (calls dataservice/system/device/migrateDevice/{uuid}).
    push_cert_to_vbond                         Push controller certificates to vBond.
    push_vedge_to_controllers                  Push vedge list to controllers
    remove_partition                           vManage remove partition.
    request_cedge_software_reset_vshell        Execute 'request platform software sdwan software reset' on target device via a vManage vshell ssh connection.
    request_db_update_user                     Change the vmanage database user/pass.
    request_software_reset                     Execute a 'request software reset' followed by 'yes' on a remote device, via the vManage.
    request_software_reset_vshell              Execute 'request software reset' on target device via a vManage vshell ssh connection.
    revoke_tlsproxy_device_certificate         Set a device SSL/TLS proxy certificate.
    scp_to
    set_banner                                 Set CLI banner.
    set_controller_certificate_authorization   Change the Controller Certificate Authorization setting.
    set_controller_certificate_csrproperties   Set the Enterprise Certificate CSR properties.
    set_default_partition                      vManage set default partition.
    set_enterprise_root_ca                     Set the Enterprise Root CA.
    set_ips_signature                          Set the IPS Signature settings.
    set_organization                           Set organization name.
    set_tlsproxy_device_certificate            Set a device SSL/TLS proxy certificate.
    set_tlsproxy_root_ca                       Set the TLS Proxy Root CA.
    set_vbond_ip                               Set vBond IP
    show_running_config                        Show device running config.
    smartaccount_check                         Verify smartaccount status.
    smartaccount_sync                          Synchronize smartaccount info.
    ssh_connect_send                           Execute a ssh command on a remove device, via the vManage.
    ssh_vshell_send                            Execute a ssh command on a remove device, via a vshell ssh connection from the vManage.
    sync_root_certs                            Sync the enterprise root-ca and the vManage root-ca into one root-chain file.
    update_organization                        Update organization name.
    upload-vedge-list                          action to upload vedge list to controllers
    upload_device_list                         Upload viptela_serial_file .
    utd_image_get_list                         Retrieve all available UTD images list.
    utd_image_upload                           Upload UTD device image.
    validate_vedge                             Validate vedge .
    vedge_certificate_authorization            Set vEdge Cloud Certificate authorization.
    vmanage_set_tenant_mode                    Change vManage tenancy mode.
    ztp-18-3                                   ZTP image update actions for vManage 18.3.x


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  NONE


# 8. How to report NED issues and feature requests
--------------------------------------------------

  **Issues like bugs and errors shall always be reported to the Cisco NSO NED team through
  the Cisco Support channel:**

  - <https://www.cisco.com/c/en/us/support/index.html>
  - <https://developer.cisco.com/docs/nso/#!support/network-service-orchestrator-support>

  The following information is required for the Cisco NSO NED team to be able
  to investigate an issue:

    - A detailed recipe with steps to reproduce the issue.
    - A raw trace file generated when the issue is reproduced.
    - Access to a device where the issue can be reproduced by the Cisco NSO NED team.
      This typically means both read and write permissions are required.
      Pseudo access via tools like Webex, Zoom etc is not acceptable.
      However, it is ok with device access through VPNs, jump servers etc though.

  Do as follows to gather the necessary information needed for your device, here named 'dev-1':

  1. Enable full debug logging in the NED

     ```
     ncs_cli -C -u admin
     admin@ncs# configure
     admin@ncs(config)# devices device dev-1 ned-settings viptela-vmanage logging level debug
     admin@ncs(config)# commit
     ```

  2. Configure the NSO to generate a raw trace file from the NED

     ```
     admin@ncs(config)# devices device dev-1 trace raw
     admin@ncs(config)# commit
     ```

  3. If the NED already had trace enabled, clear it in order to submit only relevant information

     Do as follows for NSO 6.4 or newer:

     ```
     admin@ncs(config)# devices device dev-1 clear-trace
     ```

     Do as follows for older NSO versions:

     ```
     admin@ncs(config)# devices clear-trace
     ```

  4. Run a compare-config to populate the trace with initial device config

     ```
     admin@ncs(config)# devices device dev-1 compare-config
     ```

  5. Reproduce the found issue using ncs_cli or your NSO service.
     Write down each necessary step in a reproduction report.

  6. Gather the reproduction report and a copy of the raw trace file
     containing data recorded when the issue happened.

  7. Contact the Cisco support and request to open a case. Provide the gathered files
     together with access details for a device that can be used by the
     Cisco NSO NED when investigating the issue.


  **Requests for new features and extensions of the NED are handled by the Cisco NSO NED team when
  applicable. Such requests shall also go through the Cisco support channel.**

  The following information is required for feature requests and extensions:

  1. A detailed use case description, with details like:
     - Data of interest
     - The kind of operations to be used on the data. Like: 'read', 'create', 'update', 'delete'
       and the order of the operation
     - Device APIs involved in the operations (For example: REST URLs and payloads)
     - Device documentation describing the operations involved

  2. Run sync-from # devices device dev-1 sync-from (if relevant)

  3. Attach the raw trace to the ticket (if relevant)

  4. Access to a device that can be used by the Cisco NSO NED team for testing and verification
     of the new feature. This usually means that both read and write permissions are required.
     Pseudo access via tools like Webex, Zoom etc is not acceptable. However, it is ok with access
     through VPNs, jump servers etc.


# 9. Additional NED features
--------------------------------------------------

This section describes in more detail some of the NED features/specific implementation/behavior details.
Summary:
 - 9.1 Administration - LicenseManagement
 - 9.2 Administration - Settings - Statistics Settings
 - 9.3 Feature templates/device templates/vars
 - 9.4 Policies structure and organization (localized policy, centralized policy, security policy)
 - 9.5 Localized policies: vedgeRoute and ACL lists sequence IDs

## 9.1 Administration - LicenseManagement
**added in v1.6.14**

This feature covers the 'vManage -> Administration -> License Management' configuration menu, which can be used to assign subscription licences to vManage devices/edges.

### configuration
The NED will be configured with the CSSM account information through the following ned-settings:

```cli
devices device vmanage
 ned-settings viptela-vmanage licensing
  enabled|disabled
  authentication
   username <CCO username>
   password <CCO password>
  !
  configuration
   mode                online|offline
   licenseType         mixed|postpaid|prepaid
   multipleEntitlement true|false
   accountName         "CCO Account Name"
   virtualAccountName  "Virtual Account Name"
  !
 !
!
```

The 'authentication' section can be skipped if the authentication is done through the vManage UI before the NED is configured; the accountName and virtualAccountName are mandatory though.

### model entities
- license tags: read-only list of the available licenses
- license devices: read-only list of the available licenses
- license templates: customizable entries that allow to associate a list of devices to a particular license tag; can be created or updated but cannot be deleted

### behavior
- when the feature is enabled, at sync-from, the NED will check if the vManage is authenticated with the CSSM service:
  - if the vManage is already authenticated with the CSSM service (via the GUI, or from a previous sync-from attempt), the NED will just fetch the current data from the vManage (license tags, license templates, devices status)
  - if it isn't, it will attempt to authenticate and sync the vManage device with the CSSM service using the provided username/password
- two live-status actions can be used to re-authenticate or re-sync; the actions have no params, they use the ned-settings configuration:
  - ```# devices device vmanage live-status exec licensing_authenticate```
  - ```# devices device vmanage live-status exec licensing_sync```

### limitations
- a device uuid can only be present in a single license template at a time; in a use-case where a device has to be moved from a template to another, the move has to be done in two separate transactions (first removed from a template, then added to the next)
- the licensing information is updated at a slow rate on the CSSM; the NED will not call the licenses sync (between the vManage and the CSSM service) at each NED sync-from for performance reasons
- the vManage UI allows for multiple virtual accounts to be configured; the NED currently only supports one virtual account per configuration

## 9.2 Administration - Settings - Statistics Settings
**added in v1.6.14**

This feature covers the ```vManage -> Administration -> Settings -> Statistics setting``` configuration in the vManage UI.

The corresponding configuration model can be found at this path:
```
# device device <device> config settings configuration statisticsConfiguration settings *
```

A sync-from is required to populate the entries list, after which the settings can be changed:

```cli
settings
  configuration
    statisticsConfiguration
      settings aggregatedappsdpistatistics status enable
      settings approutestatsstatistics status disable
      settings bridgeinterfacestatistics status bypass
      settings artstatistics status custom devicelist [ 10.0.0.111 ]
    !
  !
!
```

- the ```devicelist``` is available only when the ```status``` value is 'custom'.
- when all the available devices are added in the ```devicelist```, the vManage GUI will change the ```status``` to 'disabled' (instead of custom + full devicelist). The NED cannot handle this behavior (even if it did - there would be compare-config diffs)
- each entry has a ```displayName``` leaf; these leaves are in the model to allow building the vManage request payloads, but they should be trated as read-only (should not be changed or deleted)

## 9.3 Feature templates/device templates/vars

### Device templates

The feature templates are not active by themselves; they are being used through a device template (```vManage -> Configuration -> Template -> Device```) which references multiple feature templates to obtain the full configuration.

The device templates are also active only when they are 'attached' to a vManage device (edge or controller), which is done by creating/updating/removing 'attached' list entries (in the YANG) below each template:

```cli
 config
  system template device master test-vsmart-template
   templateDescription     "some device template"
   policyName              ""
   featureTemplateUidRange []
   deviceType              vsmart
   factoryDefault          false
   generalTemplates aaa default-vsmart-aaa
   !
   generalTemplates banner default-vsmart-banner-template
   !
   generalTemplates omp-vsmart Factory_Default_vSmart_OMP_Template
   !
   generalTemplates security-vsmart Factory_Default_vSmart_vManage_Security_Template
   !
   generalTemplates system-vsmart default-vsmart-system
    subTemplates logging Factory_Default_Logging_Template_V01
    !
    subTemplates ntp default-vsmart-ntp
    !
   !
   generalTemplates vpn-vsmart Factory_Default_vSmart_vManage_VPN_512_Template
   !
   generalTemplates vpn-vsmart default-vsmart-vpn0
    subTemplates vpn-vsmart-interface default-vsmart-vpn0-eth0-tunnel
    !
   !
   attached abcd-1234
    vars //system/host-name test-vsmart
    vars //system/site-id 100
    vars //system/system-ip 10.0.0.155
    vars /0/eth0/interface/ip/address 10.10.5.5/24
    vars ///ntp/server/ntp_server_host_opt_var/name 10.5.5.5
   !
  !
 !
!
```

In this example, we have the template 'test-vsmart-template' attached to a device with uuid 'abcd-1234', together with a set of variable name/value pairs. The same template can be attached to multiple devices (create more 'attached <dev-uuid>' entries) using a different set of variable values.

### Attach/detach behavior

Creating a new 'attached' entry under a template triggers an attach request between the template and that device using the provided variables. The service must provide all the necessary variables, which are dependent on the device template and feature template contents.

Changing any of the vars, the device template contents, or any of the referenced feature templates would trigger an automatic 'reattach' for all the attached devices (which are unsing the modified templates/vars).

Deleting an 'attached' entry would detach the template from the device (leaving it in CLI mode). To replace a device's template, the service needs to delete the old 'attached' entry and create a new one, for the same device uuid, in the same transaction; the NED will detect the pairs CREATE/DELETE pairs and it will reattach the device directly (without going through the CLI mode).

### The attach variables

When attaching a device template to a device the vManage requires values for all the variables from all of the feature templates referenced by the device template. The variables are path/value pairs, where the path is the vManage's x-path to the variable component; it is **not** using the custom variable names nor the NED x-path.

The NED cannot assist with managing the list of vars or their values - the service has to handle this and provide all the necessary entries and values, based on the feature template contents.

The NED does manage the list of vars and their values between the old CDB values, the new (commit) values, and the current (runtime) vManage values - by doing a merge of the list of vars, and of their values.

Note1: We can use a separate API to find the mapping between the custom names and their x-paths, but only after the device template is created.

Note2: In the list of vars there are some special entries which have the 'csv-' prefix. These are managed by the NED (filtered at sync from, added during updates), and should not be added in the CDB.

Vars list example:
```cli
   attached abcd-1234
    vars //system/host-name test-vsmart
    vars //system/site-id 100
    vars //system/system-ip 10.0.0.155
    vars /0/eth0/interface/ip/address 10.10.5.5/24
    vars ///ntp/server/ntp_server_host_opt_var/name 10.5.5.5
   !
```
For the attached device 'abcd-1234' we have 5 vars; for the first var, '//system/host-name' is the x-path to the host-name component, with the value 'test-vsmart'. This is part of the 'system-vsmart' feature template, and the component looks like this:

```json
"host-name": {
  "vipObjectType": "object",
  "vipType": "variable",
  "vipValue": "",
  "vipVariableName": "custom-host-name-variable"
}
```

Notice how the variable name is 'custom-host-name-variable', but it doesn't appear anywhere in the variable; that's because the var path '//system/host-name' is actually the 'x-path' in the vManage feature template tree which is pointing to the host-name component.

The first 3 vars belong to the 'system-vsmart' type of feature template, the 4th belongs to one of the 'vpn-vsmart-interface' feature templates, while the last belongs to the 'ntp' type template. Notice that for this last var we do see the custom variable name 'ntp_server_host_opt_var' in the x-path because this one it's pointing inside a tree entry.

### Optional vars
Tree components have an 'optional' tick-box in the vManage UI which makes the entry optional in the resulting configuration.

Let's look at a 'tree' component with 3 entries: first one is a constant value, second is a regular variable while the last is an optional variable (notice the 'vipOptional true' inside the last entry).

```cli
    server
      vipObjectType tree
      vipType       constant

      vipValue abcd-1234
       name
        vipObjectType   object
        vipType         constant
        vipValue        abcd-1234
        vipVariableName server_host
       exit
      exit

      vipValue server_host_var
       name
        vipObjectType   object
        vipType         variable
        vipVariableName server_host_var
       exit
      exit

      vipValue server_host_opt_var
       name
        vipObjectType   object
        vipType         variable
        vipVariableName server_host_opt_var
       exit
       vipOptional true
      exit
    exit
```

When attaching a device template which uses this feature template, we would have two var entries just for this tree component, one for each 'variable' component:
```
vars ///some/server/server_host_var/name 10.5.5.5
vars ///some/server/server_host_opt_var/name TEMPLATE_IGNORE
```

With the vars configured like this, the configuration we should expect for this server tree component will have two entries:
```
server name abcd-1234 // this is the constant entry
server name 10.5.5.5  // this is the 'server_host_var' variable
                      // no server_host_opt_var entry
```

The 'server_host_opt_var' is not present in the output due to the combination of 'vipOptional true' and the 'TEMPLATE_IGNORE' value. Notice that we still had to add the entry in the list of vars, but with the TEMPLATE_IGNORE special value.

We can activate the variable by assigning it a concrete value:
```
vars ///some/server/server_host_var/name 10.5.5.5
vars ///some/server/server_host_opt_var/name 5.5.5.5
```

This results in the output:
```
server name abcd-1234 // this is the constant entry
server name 10.5.5.5 // this is the 'server_host_var' variable
server name  5.5.5.5 // this is the 'server_host_opt_var' variable
```

Currently optional variables are only available for the 'tree' components.

### Tips for using the feature templates
- when building NSO templates for feature templates, first create/configure the feature template on the vManage UI then do a sync-from, and use the resulting data for the template; do not create feature templates from NSO directly. On some templates the vManage does slight processing or creates list entries - which isn't caught in the YANG model; creating the template from the NSO directly will miss these changes.
- the list of vars is directly dependent on the used feature templates; a suggestion is to keep the list of vars associated to each feature template, and concatenate all the entries when building a device template
- similarly with the first point, the list of vars can be obtained from the NED after a sync-from (after the device template has been attached)
- as long as a device template is not changed (nor any variable components are added/removed to any of its feature templates), then its vars list will remain the same for any attached device

## 9.4 Policies structure and organization (localized policy, centralized policy, security policy)

Policies are composed of different sub-elements, which are coming in two categories:
- definitions (/system/template/policy/definition/<definition type>), ex: Firewall, DNSSecurity, VedgeRoute, ACLv4, etc
- lists (/system/template/policy/list/<list type>), ex: DataPrefix, Zone, VPN, Mirror, etc

A policy will usually reference several definition elements (and sometimes 'lists' elements), and some definitions are referencing lists elements. Both definitions and lists can be reused in several policies, but care must be taken when deleting them (they can't be deleted if they're still in use by some other element).

Here is the current policy/definition/list coverage in the NED:
```
  +--rw system
  |  +--rw template
  |     +--rw security
  |     |  +--rw lists
  |     |  |  +--rw dataprefix* [name]
  |     |  |  +--rw dataprefixfqdn* [name]
  |     |  |  +--rw localdomain* [name]
  |     |  |  +--rw ipssignature* [name]
  |     |  |  +--rw urlblacklist* [name]
  |     |  |  +--rw urlwhitelist* [name]
  |     |  |  +--rw zone* [name]
  |     |  |  +--rw localapp* [name]
  |     |  |  +--rw sslutdprofile* [name]
  |     |  +--rw ssldecryption* [name]
  |     |  +--rw intrusionprevention* [name]
  |     |  +--rw urlfiltering* [name]
  |     |  +--rw firewall* [name]
  |     |  +--rw tgapikey* [name]
  |     |  +--rw advancedmalwareprotection* [name]
  |     |  +--rw umbrelladata* [name]
  |     |  +--rw dnssecurity* [name]
  |     |  +--rw policy* [policyName]   <-- security policies list
  |     +--rw policy
  |     |  +--rw lists
  |     |  |  +--rw aspath* [name]
  |     |  |  +--rw community* [name]
  |     |  |  +--rw expandedcommunity* [name]
  |     |  |  +--rw extcommunity* [name]
  |     |  |  +--rw mirror* [name]
  |     |  |  +--rw policer* [name]
  |     |  |  +--rw ipprefix* [name]
  |     |  |  +--rw vpn* [name]
  |     |  +--rw class-map* [name]
  |     |  +--rw qos-map* [name]
  |     |  +--rw rewrite-rule* [name]
  |     |  +--rw vpnqosmap* [name]
  |     |  +--rw vedgeroute* [name]
  |     |  +--rw acl* [name]
  |     |  +--rw aclv6* [name]
  |     |  +--rw device-access* [name]
  |     |  +--rw device-access-v6* [name]
  |     |  +--rw vedge* [policyName]  <-- localized policies list, CLI + feature
  |     |  +--rw vsmart* [policyName] <-- centralized policies list, CLI only
```

Notes:
- the localized policies list can have both 'CLI' and 'feature' formats (in the same list)
- centralized policies are currently only supported as 'CLI'
- localized policies/definitions might reference DataPrefix/DataPrefixFQDN list entries which are modeled in 'system/template/security/lists/' (they were modeled initially as part of the security policies sub-lists)

## 9.5 Localized policies: vedgeRoute and ACL lists sequence IDs

The vedgeroute and the ACLs (ACL v4, ACL v6, Device Access V4, Device Access V6) share a similar structure in the vManage UI, here one entry has a list of routes, and each route has a sub-list of rules (or sequences). Both the rules and the sequences re ordered by the user.

Examining the vManage APIs, we notice that we actually have a single list (of sequences) and the route is just an attribute to each equence, ex:

```
sequence  1, route A, match[], actions[], ...
sequence 11, route A, match[], actions[], ...
sequence 21, route A, match[], actions[], ...
sequence 31, route B, match[], actions[], ...
sequence 41, route B, match[], actions[], ...
```

Notice how 'route A' has 3 sequences, and 'route B' has 2 sequences; also notice that the sequence numbering goes across the outes. This indicates that the API is focused on the sequences, and the route names are just a way to group the sequences in  meaningful way in the UI.

In the NED, these APIs are difficult to model because there is no obvious YANG key value to be used for the sequence entries:
- using the route name is not enough, we still need a key for the sequence entries
- using the sequence id + route name as key (in a single list) makes it difficult to insert or move around entries
- using match and actions contents (which would be the 'logical' unique identifiers for each sequence entry) is impossible or overwhelmingly complex

The compromise solution was to model it using two nested lists, one for the routes (named 'groups' to avoid confusion) based on the route names, and one for the sequences which use an abstract ordinal key (the sequenceId):

```yang
list groups {
	tailf:info "Sequence groups; used to group sequences under a shared name.";
	ordered-by user;
	key name;
	leaf name {
		type string;
	}

	list sequences {
		key sequenceId;
		leaf sequenceId {
			tailf:info "Index used internally in the NED to create and order the matching rules entries.";
			type uint32; // 1, 11, 21, etc
		}
		...
		// match and action contents
		...
	}
}
```

The 'groups' correspond to the route entries, and are ordered by user. Below each group we have a list of sequences, which se a 'sequenceId' as key - but unlike the native API, the sequence ids are re-numbered from '1' in each group:

```
group 'route A'
	sequence  1, match[], actions[], ...
	sequence 11, match[], actions[], ...
	sequence 21, match[], actions[], ...
group 'route B'
	sequence  1, match[], actions[], ...
	sequence 11, match[], actions[], ...
```

Whenever there are changes to the sequences list (adding, removing or moving sequences) in a group, all the sequences from that group must be renumbered, such that after the commit we don't see config-compare diffs. The reason for having each group numbered from '1' is to isolate the re-numbering to a single group rather than all the sequences across all groups.

Changes within a sequence (ex changing the 'matches' rules, or the 'action') do not require any updates to the sequence Ids.
