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
  8. How to report NED issues and feature requests
  9. How to rebuild a NED
  10. VNF Instance
     10.1. Perform actions for VNF Instance
     10.2. Use rpc-request-config to configure VNF Instance requests' behaviour
  11. Perform actions for NS Instance
  12. Details on setting "action" payload
  13. Perform VNF Op action
  14. Perform NS Op action
  15. Disable/Enable entities from model to be synced with API
      15.1 More details on "sync" settings usage
  16. Perform VNF Fault Management actions
  17. Subscription
      17.1. Use rpc-request-config to configure Subscription requests' behaviour
      17.2. Manage Subscription settings
  18. VNF Performance Management
      18.1 VNF PM Subscription
           18.1.1 Perform actions for VNF PM Subscription
      18.2. VNF PM Job
            18.2.1. Perform actions for VNF PM Job
      18.3. VNF PM Threshold
            18.3.1. Perform actions for VNF PM Threshold
  19. VNF Indicator
      19.1 VNF Indicator
           19.1.1. Perform actions for VNF Indicator
      19.2 VNF Indicator Subscription
           19.2.1. Perform actions for VNF Indicator Subscription
  ```


# 1. General
------------

  This document describes the etsi-sol003 NED.

  The etsi-sol003 NED is built to interact with ETSI GS NFV-SOL 003 RESTful api/devices.

  If you suspect a bug in the NED, please see chapter 8.

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
  | netsim                    | yes       | -                                                                |
  |                           |           |                                                                  |
  | check-sync                | yes       | -                                                                |
  |                           |           |                                                                  |
  | partial-sync-from         | no        | -                                                                |
  |                           |           |                                                                  |
  | live-status actions       | no        | -                                                                |
  |                           |           |                                                                  |
  | live-status show          | no        | -                                                                |
  |                           |           |                                                                  |
  | load-native-config        | no        | -                                                                |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | -                         | -               | -      | -                                                 |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-etsi-sol003-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-etsi-sol003-1.0.1.signed.bin
      > ./ncs-6.0-etsi-sol003-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-etsi-sol003-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-etsi-sol003-1.0.1.tar.gz
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
     `etsi-sol003-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-etsi-sol003-1.0.1.tar.gz
     > ls -d */
     etsi-sol003-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package etsi-sol003-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package etsi-sol003-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-etsi-sol003-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package etsi-sol003-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/etsi-sol003-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-etsi-sol003-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-etsi-sol003-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install etsi-sol003-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-etsi-sol003-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-etsi-sol003-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id etsi-sol003-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
  ---

  - Set the device address:
    ```
    devices device <device-name> address <any-host>
    ```

  - Set the required API addresses configurables (if resource's API path is not set, the default address will be used):
    ```
    devices device <device-name> ned-settings etsi-sol003 connection api address identity <identity-host>
    devices device <device-name> ned-settings etsi-sol003 connection api address vnf-instance <vnf-instance-host>
    devices device <device-name> ned-settings etsi-sol003 connection api address ns-instance <ns-instance-host>
    devices device <device-name> ned-settings etsi-sol003 connection api address runtime-catalog <runtime-catalog-host>
    devices device <device-name> ned-settings etsi-sol003 connection api address vim-inventory  <vim-inventory-host>
    devices device <device-name> ned-settings etsi-sol003 connection api address api-gateway <api-gateway-host>
    devices device <device-name> ned-settings etsi-sol003 connection api address api-gateway-openshift <api-gateway-openshift-host>

    devices device <device-name> ned-settings etsi-sol003 connection api base-url identity <identity-base-url>
    devices device <device-name> ned-settings etsi-sol003 connection api base-url vnf-instance <vnf-instance-base-url>
    devices device <device-name> ned-settings etsi-sol003 connection api base-url vnf-instance-ext-operation <vnf-instance-ext-operation-base-url>
    devices device <device-name> ned-settings etsi-sol003 connection api base-url vnf-fault-management <vnf-fault-management-base-url>
    devices device <device-name> ned-settings etsi-sol003 connection api base-url ns-instance <ns-instance-base-url>
    devices device <device-name> ned-settings etsi-sol003 connection api base-url vnf-package <vnf-package-base-url>
    devices device <device-name> ned-settings etsi-sol003 connection api base-url runtime-catalog <runtime-catalog-base-url>
    devices device <device-name> ned-settings etsi-sol003 connection api base-url vim-inventory <vim-inventory-base-url>
    devices device <device-name> ned-settings etsi-sol003 connection api base-url api-gateway <api-gateway-base-url>
    devices device <device-name> ned-settings etsi-sol003 connection api base-url api-gateway-openshift <api-gateway-openshift-base-url>

    devices device <device-name> ned-settings etsi-sol003 connection api proto runtime-catalog <runtime-catalog-proto>
    ```

  - Set the required configurables:
    ```
    devices device <device-name> ned-settings etsi-sol003 connection api number-of-retries 0
    devices device <device-name> ned-settings etsi-sol003 connection api time-between-retry 1
    devices device <device-name> ned-settings etsi-sol003 connection ssl accept-any
    ```

  - Config API authentication (see options in the mode bellow):
    ```
    devices device <device-name> ned-settings etsi-sol003 connection api auth
    ```

  - Config API OAUTH2 (token) authentication (see options in the mode bellow):
    ```
    devices device <device-name> ned-settings etsi-sol003 connection api token
    ```

    If token caching is set to true, the token is taken from CDB (or retrieved and saved to CDB if none there),
    otherwise (cache=false or API request get 401 response status code) the token is retrieved from device on every request.

    For "refresh_token" use:
    ```
    devices device <device-name> ned-settings etsi-sol003 connection api token auth-type oauth2
    ```

  - Set read-timeout (7 minutes, just to be sure all data is retrieved from API):
    ```
    devices device <device-name> read-timeout 420
    ```

  - Optional configurations

    Set the optional API endpoints configurables:
    ```
    devices device <device-name> ned-settings etsi-sol003 connection api endpoint get vim-tenants <vim-tenants-endpoint>
    devices device <device-name> ned-settings etsi-sol003 connection api endpoint get vnf-instance-vnfc <vnf-instance-vnfc-endpoint>
    devices device <device-name> ned-settings etsi-sol003 connection api endpoint get gateway-vnf-instance <gateway-vnf-instance-endpoint>
    devices device <device-name> ned-settings etsi-sol003 connection api endpoint get vnf-instance-resource <vnf-instance-resource-endpoint>
    devices device <device-name> ned-settings etsi-sol003 connection api endpoint get tenant-vnf-instance-vnfc <tenant-vnf-instance-vnfc-endpoint>
    devices device <device-name> ned-settings etsi-sol003 connection api endpoint get tenant-gateway-vnf-instance <tenant-gateway-vnf-instance-endpoint>
    ```

    Set RPC actions device-specific path middle-prefix
    (`base-url + middle-prefix + endpoint: "/vnflcm/v1" + "/ext" + "/vnf_instances/{vnfInstanceId}/:action"`):

    `<action=[change_vnfpkg|operations|monitoring/migrate]>`
    ```
    devices device <device-name> ned-settings etsi-sol003 connection api base-url rpc-action default-vnf-extension base-url <middle-prefix>
    ```

    Configure the additional timeout in seconds for EDIT operations
    (0 - no additional EDIT timeout; default 720s (12 minutes)):
    ```
    devices device <device-name> ned-settings etsi-sol003 edit-timeout <edit-timeout:720>
    ```

    Configure `{tenantId}` when making API calls (endpoints prefixed with "tenant-" will be used):
    ```
    devices device <device-name> ned-settings etsi-sol003 connection api param tenant-id <tenant-id>
    ```

  - Check that real device is up/alive on connect:
    ```
    devices device <device-name> ned-settings etsi-sol003 connection live-check status <true|false:true>
    devices device <device-name> ned-settings etsi-sol003 connection live-check api-resource <api-resource:vnf-subscriptions>
    ```

  - Set device model:

    `<model=[default-sol3|netcracker|esc|cbam]:default-sol3>`
    ```
    devices device <device-name> ned-settings etsi-sol003 device model <model>
    ```

  ---

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

  `$NSO_RUNDIR/logs/ned-etsi-sol003-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings etsi-sol003 logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings etsi-sol003 logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.etsisol003 \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings etsi-sol003 logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings etsi-sol003 logger java true
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

  NONE


# 5. Built in live-status actions
---------------------------------

  NONE


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
     admin@ncs(config)# devices device dev-1 ned-settings etsi-sol003 logging level debug
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


# 9. How to rebuild a NED
--------------------------

  To rebuild the NED do as follows:

  ```
  > cd $NED_ROOT_DIR/src
  > make clean all
  ```

  When the NED has been successfully rebuilt, it is necessary to reload the package into NSO.

  ```
  admin@ncs# packages reload
  ```


# 10. VNF Instance
-----------------

## 10.1. Perform actions for VNF Instance
----------------------------------------

  Enter device mode:
  ```
  devices device <device-name>
  ```

  Perform actions (`<action=[instantiate|terminate|operate|heal|vertical-scale|scale|scale-to-level|change-flavour|change-ext-conn|change-pkg|operation|update-software-version|retrieve-physical-host|retrieve-vnfc-resource|retrieve-scale-status|retrieve-instance-data]>`):
  ```
  vnf-instances vnf-instance <vnf-instance-name> rpc-request-payload <action> ... set here all needed payload for <action>
  commit
  vnf-instances vnf-instance <vnf-instance-name> rpc-request-action <action> <vnf-instance-name>
  ```

  To reset action's payload to default:
  ```
  no vnf-instances vnf-instance <vnf-instance-name> rpc-request-payload <action>
  commit
  ```

  Alternative method to perform `<action=[retrieve-physical-host|retrieve-vnfc-resource|retrieve-scale-status|retrieve-instance-data]>` (only by `<vnf-instance-id>`):
  ```
  rpc rpc-vnf-instance-<action> vnf-instance-<action> <vnf-instance-id>
  ```

  Alternative method to perform `<action=[operation|migrate]>`:
  ```
  rpc rpc-vnf-instance-<action> vnf-instance-<action> name <vnf-instance-name> param [{key <key> value <value> type <type>}]
  rpc rpc-vnf-instance-<action> vnf-instance-<action> id <vnf-instance-id> param [{key <key> value <value> type <type>}]
  ```

  Enable/Disable Instance instantiation after creation:
  ```
  devices device <device-name> ned-settings etsi-sol003 flow vnf-instance instantiate auto <true|false:true>
  ```

  Enable/Disable Instance termination before deletion:
  ```
  devices device <device-name> ned-settings etsi-sol003 flow vnf-instance terminate auto <true|false:true>
  ```

## 10.2. Use rpc-request-config to configure VNF Instance requests' behaviour
----------------------------------------------------------------------------

Enter instance mode:
  ```
  vnf-instances vnf-instance <vnf-instance-name>
  ```

  ---

  UPDATE[PATCH] request:

  `<config=[metadata|extensions|vim-connection-info|configurable-properties]>`

  - `<add|remove>` `<config>`:
    ```
    rpc-request-config handling <config> update <true|false:true>
    ```

  - `<add|remove>` only specific configs; overwrites the settings set per config (useful when only some data are required to be sent):
    ```
    rpc-request-config handling-only update [ <config> <config> ... ]
    ```

  - clean only for specific configs; the settings set per config will be the ones to be considered:
    ```
    no rpc-request-config handling-only update
    ```
  ---

  INSTANTIATE action:

  `<config=[vim-connection-info]>`

  - `<add|remove>` `<config>`:
    ```
    rpc-request-config handling <config> instantiate <true|false:true>
    commit
    ```

  ---

  Configure rpc-action payload:
  ```
  rpc-request-config rpc-action <rpc-action>
  ```


# 11. Perform actions for NS Instance
-------------------------------------

  Enter device mode:
  ```
  devices device <device-name>
  ```

  Perform actions (`<action=[instantiate|terminate|heal]>`):
  ```
  ns-instances ns-instance <ns-instance-name> rpc-request-payload <action> ... set here all needed payload for <action>
  commit
  ns-instances ns-instance <ns-instance-name> rpc-request-action <action> <ns-instance-name>
  ```

  To reset action's payload to default:
  ```
  no ns-instances ns-instance <ns-instance-name> rpc-request-payload <action>
  commit
  ```

  Enable/Disable Instance instantiation after creation:
  ```
  devices device <device-name> ned-settings etsi-sol003 flow ns-instance instantiate auto <true|false:true>
  ```

  Enable/Disable Instance termination before deletion:
  ```
  devices device <device-name> ned-settings etsi-sol003 flow ns-instance terminate auto <true|false:true>
  ```


# 12. Details on setting "action" payload
-----------------------------------------

  If a node of `rpc-request-payload <action>` has "param" node as a child then it's a key-value list, which is transformed into a JSON object {key: value, ...} right before sending action to the API. Just set the param "key", "value" and "type". The type of param (can be: integer, boolean, string; default: string) is considered when generating request JSON.
  The same behaviour is present for containers that has `<format=[json|key-value]>` leaf and "key-value" is selected (these containers are used to set "unknown" structured configs; eg: vnf-instance extensions).


# 13. Perform VNF Op action
---------------------------

`<action=[retry|fail|rollback|cancel|retrieve*]>`

  Enter device mode:
  ```
  devices device <device-name>
  ```

  - Method 1. Perform `<action>` RPC:
    ```
    rpc rpc-vnf-op-<action> vnf-op-<action> <vnf-op-id>
    ```

  - Method 2 (exclude * actions). Retrieve all operations:
    ```
    sync-from
    ```

    Perform operation `<action>` action:
    ```
    vnf-ops vnf-op <vnf-op-id> rpc-request-action <action> <vnf-op-id>
    ```


# 14. Perform NS Op action
--------------------------

`<action=[retry]>`

  Enter device mode:
  ```
  devices device <device-name>
  ```

  - Method 1. Perform `<action>` RPC:
    ```
    rpc rpc-ns-op-<action> ns-op-<action> <ns-op-id>
    ```

  - Method 2. Retrieve all operations:
    ```
    sync-from
    ```

    Perform operation `<action>`` action:
    ```
    ns-ops ns-op <ns-op-id> rpc-request-action <action> <ns-op-id>
    ```


# 15. Disable/Enable entities from model to be synced with API
--------------------------------------------------------------

  `<model=[vnf-instance|ns-instance|vnf-package|ns-package|vnf-op|ns-op|vnf-subscription|ns-subscription|vnf-fm-alarm|vnf-fm-subscription|vim]>`

  By default all models are disabled for "sync".

  Enter device mode:
  ```
  devices device <device-name>
  ```

  - disable:
    ```
    ned-settings etsi-sol003 connection api sync model <model> is-syncable false
    ```
    or
    ```
    no ned-settings etsi-sol003 connection api sync model <model> is-syncable
    ```
    or
    ```
    no ned-settings etsi-sol003 connection api sync model <model>
    ```

  - enable:
    ```
    ned-settings etsi-sol003 connection api sync model <model> is-syncable true
    ```

  - enable for all models:
    ```
    no ned-settings etsi-sol003 connection api sync
    ```

  - enable only for specific models; overwrites the settings set per model (useful when only some data are required to be synced);
    if a model "is-syncable" is set to "false" (default value), it will be excluded from this check list:
    ```
    ned-settings etsi-sol003 connection api sync only [ <model> <model> ... ]
    ```

  - clean only for specific models; the settings set per model will be the ones to be considered on sync:
    ```
    no ned-settings etsi-sol003 connection api sync only
    ```

  - filter `<api-action=[GET|GREATE|UPDATE|DELETE]:[ GET ]>` to apply "model sync" settings for
    (for any other `<api-action>` the "model sync" settings will be ignored):
    ```
    ned-settings etsi-sol003 connection api sync filter api-actions [ <api-action> ... ]
    ```

  - filter `<ned-action=[CONFIG|RPC-ACTION]:[ CONFIG ]>` to apply "model sync" settings for
    (for any other `<ned-action> the "model sync" settings will be ignored):
    ```
    ned-settings etsi-sol003 connection api sync filter ned-actions [ <ned-action> ... ]
    ```

  *** IMPORTANT ***

  For new devices use:
  ```
  ned-settings etsi-sol003 connection api sync model vnf-instance is-syncable true
  ```
  and (not mandatory):
  ```
  ned-settings etsi-sol003 connection api sync only [ vnf-instance ]
  ```

  and add new syncable models as you get access to theirs API resource.

  ***

  - disable sync of DISABLED entities:
    ```
    ned-settings etsi-sol003 connection api sync model <model> sync-disabled false
    ```

  - disable API DELETE action:
    ```
    ned-settings etsi-sol003 connection api sync model <model> actions no-delete true
    ```

  ***

  - exclude VIMs with specific IDs from "sync-from":
    ```
    ned-settings etsi-sol003 connection api sync model vim excluded [ <ID> <ID> ... ]
    ```

  - add VIMs with specific IDs to be synced without other API addons (just raw data from main API resource):
    ```
    ned-settings etsi-sol003 connection api sync model vim no-addons [ <ID> <ID> ... ]
    ```

  - ignore VIMs' faulty API addons during sync (sync only valid ones):
    ```
    ned-settings etsi-sol003 connection api sync model vim sync-gracefully <true|false:false>
    ```
  ```
  commit
  ```

## 15.1 More details on "sync" settings usage
---------------------------------------------

Use "filter/api-actions" to set API actions to apply "model sync" settings for:
[ GET ] (default value) and all "sync" settings will be applied for GET action.

Use `no ned-settings etsi-sol003 connection api sync filter api-actions` to fallback to it's default value, [ GET ].
You will still be able to perform other actions too,  [ CREATE UPDATE DELETE ],
on all syncable YANG models (models set in "only", or with "is-syncable=true" if "only" is empty) that have connections with API.

Use `no ned-settings etsi-sol003 connection api sync filter ned-actions` and the setting will fallback to it's default value,
[ CONFIG ], and only NED CONFIG actions, such as "sync-from", config "commit", will be filtered by "sync" settings,
leaving RPC-ACTIONs free.

For example, if you want to filter all GET actions, including CONFIG and RPC-ACTIONs, for specific models, use:
```
ned-settings etsi-sol003 connection api sync filter api-actions [ GET ]
ned-settings etsi-sol003 connection api sync filter ned-actions [ CONFIG RPC-ACTION ]
```

A model with "is-syncable=false" (default value) added to "only" will be ignored.
The "only" setting overwrites "model" setting
(if you have any model in "only" setting, the "is-syncable=true" from model list settings are ignored,
but you can exclude some particular models from "only" list by "is-syncable=false";
"only" can be used when you have a lot of syncable models in YANG and you want to sync only some of them,
instead of disabling the rest ones).

To sync no models on "sync-from" use:
```
no ned-settings etsi-sol003 connection api sync model
no ned-settings etsi-sol003 connection api sync only
```

The logic schema for model "sync" goes like this:
```
if not filter/api-actions contains action or not filter/ned-actions contains ned-action:
    return true
else if model-is-syncable and sync-only is not empty:
    return sync-only contains model
else:
    return model-is-syncable
```

Examples (will be updated for different use-cases):

1) You have this "sync" settings:
```
sync {
    model vnf-instance {
        is-syncable true;
    }
}
```

"sync" settings are applied only for API GET actions (default value for "filter/api-actions"),
including only NED CONFIG actions, such as "sync-from", config "commit"
(default value for "filter/ned-actions" is [ CONFIG ]).
RPC-ACTIONs are not filtered by "sync" settings (see Example 3).
"sync-from" will retrieve only [ vnf-instance ] (default value for "is-syncable" is "false").

For [ CREATE UPDATE DELETE ] actions "sync" settings have no effect.

2) You have this "sync" settings:
```
sync {
    model vnf-instance {
        is-syncable false;
    }
    model vnf-subscription {
        is-syncable false;
    }
    model vnf-op {
        is-syncable true;
    }
    model vnf-fm-alarm {
        is-syncable true;
    }
    model vnf-fm-subscription {
        is-syncable true;
    }
    only [ vnf-instance vnf-subscription vnf-op vnf-fm-alarm vnf-fm-subscription ]
    filter {
        api-actions [ GET DELETE ]
    }
}
```

"sync" settings are applied only for API [ GET DELETE ] actions, including only NED CONFIG actions.
"sync-from" will retrieve only [ vnf-op vnf-fm-alarm vnf-fm-subscription ]
(also, the NED will accept to send DELETE requests only for these models).

For [ CREATE UPDATE ] actions "sync" settings have no effect.

3) You have this "sync" settings:
```
sync {
    model vnf-instance {
        is-syncable true;
    }
    model vnf-subscription {
        is-syncable true;
    }
    only [ vnf-instance ]
    filter {
        api-actions [ GET ]
        ned-actions [ CONFIG RPC-ACTION ]
    }
}
```

"sync" settings are applied for any API [ GET ] action, including RPC-ACTIONs too.
"sync-from" and GET RPC-ACTIONs will apply only for [ vnf-instance ].

---

It may feel a bit tangled, but you have a lot of sync options this way.


# 16. Perform VNF Fault Management actions
------------------------------------------

  Enter device mode:
  ```
  devices device <device-name>
  ```

  Perform VNF FM Alarm action (`<action=[retrieve]>`)

  - Method 1. Perform `<action>` RPC:
    ```
    rpc rpc-vnf-fm-alarm-<action> vnf-fm-alarm-<action> <vnf-fm-alarm-id>
    ```

  - Method 2. Retrieve all alarms:
    ```
    sync-from
    ```

    Perform `<action>` action:
    ```
    vnf-fm-alarms vnf-fm-alarm <vnf-fm-alarm-id> rpc-request-action <action> <vnf-fm-alarm-id>
    ```

  Perform VNF FM Subscription action (`<action=[retrieve]>`)

  - Method 1. Perform `<action>` RPC:
    ```
    rpc rpc-vnf-fm-subscription-<action> vnf-fm-subscription-<action> <vnf-fm-subscription-id>
    ```

  - Method 2. Retrieve all subscriptions:
    ```
    sync-from
    ```

    Perform `<action>` action:
    ```
    vnf-fm-subscriptions vnf-fm-subscription <vnf-fm-subscription-name> rpc-request-action <action> <vnf-fm-subscription-name>
    ```


# 17. Subscription
------------------

## 17.1. Use rpc-request-config to configure Subscription requests' behaviour
-----------------------------------------------------------------------------

`<config=[authType]>`

Enter `<subscription=[vnf-subscription|ns-subscription|vnf-fm-subscription]>` mode:
```
<subscription>s <subscription> <subscription-name>
```

- `<enable|disable>` `<config>` legacy-mode:
  ```
  rpc-request-config handling <config> legacy-mode <true|false:false> ... when true, send authType as string, otherwise send it as JSON array.
  ```

## 17.2. Manage Subscription settings
-------------------------------------

- Enable/Disable Subscription Authentication fallback to default device username/password:
  ```
  devices device <device-name> ned-settings etsi-sol003 flow subscription auth fallback <true|false:false>
  commit
  ```

- Enable/Disable Subscription request tracing, that may contain sensitive data (username/password), for debugging purposes:
  ```
  devices device <device-name> ned-settings etsi-sol003 flow subscription trace <true|false:false>
  commit
  ```


# 18. VNF Performance Management
--------------------------------

## 18.1 VNF PM Subscription
---------------------------

`[vnf-pm-subscriptions]`

### 18.1.1 Perform actions for VNF PM Subscription
--------------------------------------------------

Perform actions (`<action=[retrieve]>`):
```
vnf-pm-subscriptions vnf-pm-subscription <vnf-pm-subscription-name> rpc-request-action <action> <vnf-pm-subscription-name>
```

Alternative method to perform `<action=[retrieve]>` (only by `<vnf-pm-subscription-id>`):
```
rpc rpc-vnf-pm-subscription-<action> vnf-pm-subscription-<action> <vnf-pm-subscription-id>
```


## 18.2. VNF PM Job
-------------------

`[vnf-pm-jobs]`

### 18.2.1. Perform actions for VNF PM Job
------------------------------------------

Perform actions:
  `<action=[retrieve]>`:
  ```
  vnf-pm-jobs vnf-pm-job <vnf-pm-job-name> rpc-request-action <action> <vnf-pm-job-name>
  ```

  `<action=[report-retrieve]>`:
  ```
  vnf-pm-jobs vnf-pm-job <vnf-pm-job-name> rpc-request-action <action> job-name <vnf-pm-job-name> report-id <vnf-pm-job-report-id>
  ```

Alternative method to perform actions:
  `<action=[retrieve]>`:
  ```
  rpc rpc-vnf-pm-job-<action> vnf-pm-job-<action> <vnf-pm-job-id>
  ```

  `<action=[report-retrieve]>`:
  ```
  rpc rpc-vnf-pm-job-<action> vnf-pm-job-<action> job-id <vnf-pm-job-id> report-id <vnf-pm-job-report-id>
  ```


## 18.3. VNF PM Threshold
-------------------------

`[vnf-pm-thresholds]`

### 18.3.1. Perform actions for VNF PM Threshold
------------------------------------------------

Perform actions:
  `<action=[retrieve]>`:
  ```
  vnf-pm-thresholds vnf-pm-threshold <vnf-pm-threshold-name> rpc-request-action <action> <vnf-pm-threshold-name>
  ```

Alternative method to perform actions:
  `<action=[retrieve]>`:
  ```
  rpc rpc-vnf-pm-threshold-<action> vnf-pm-threshold-<action> <vnf-pm-threshold-id>
  ```


# 19. VNF Indicator
-------------------

## 19.1 VNF Indicator
---------------------

`[vnf-indicators]`

### 19.1.1. Perform actions for VNF Indicator
---------------------------------------------

Perform actions:
  `<action=[retrieve]>`:
  ```
  vnf-indicators vnf-indicator <vnf-indicator-name> rpc-request-action <action> instance-id <vnf-instance-id> indicator-name <vnf-indicator-name>
  ```

Alternative method to perform actions:
  `<action=[retrieve]>`:
  ```
  rpc rpc-vnf-indicator-<action> vnf-indicator-<action> instance-id <vnf-instance-id> indicator-id <vnf-indicator-id>
  ```

## 19.2 VNF Indicator Subscription
----------------------------------

`[vnf-ind-subscriptions]`

### 19.2.1. Perform actions for VNF Indicator Subscription
----------------------------------------------------------

Perform actions:
  `<action=[retrieve]>`:
  ```
  vnf-ind-subscriptions vnf-ind-subscription <vnf-ind-subscription-name> rpc-request-action <action> <vnf-ind-subscription-name>
  ```

Alternative method to perform actions:
  `<action=[retrieve]>`:
  ```
  rpc rpc-vnf-ind-subscription-<action> vnf-ind-subscription-<action> <vnf-ind-subscription-id>
  ```
