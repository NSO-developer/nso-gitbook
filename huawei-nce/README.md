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
  10. IP-services-feature
     10.1 CRUD operations on services like: L3VPN, L2EVPN, VPLS, VLL and QoS
     10.2 Fetching operational data for network-element and ltps
     10.3 tailf-actions for IP-services-feature (L3VPN and QoS)
     10.4 Choosing how the L3VPN configuration is fetched
     10.5 Partial sync-from support for L3VPN section
     10.6 Interface management feature
     10.7 Partial sync-from support for interface management
     10.8 Partial sync-from support for interface/trunk-members
     10.9 e-trunk section
     10.10 Partial sync-from support for e-trunk
     10.11 Partial sync-from support for ESI
     10.12 Partial sync-from support for route-policy and tunnel-trail
     10.13 CRUD operations on ACL service
     10.14 CRUD operations on DHCP service
     10.15 tail-f action to query locators by nes
  11. DWDM-feature
      11.1 create/delete a 'tunnel' list entry
      11.2 create/modify/delete a service ('client-svc-instances') list entry
      11.3 check-sync support
      11.4 Partial sync-from support
      11.5 tail-f action for pre-route calculation
      11.6 tail-f actions to fetch operational data
            10.6.1 action to extract tunnels
            10.6.2 action to extract services
            10.6.3 action to extract networks elements
            10.6.4 action to extract nodes for a specific network
            10.6.5 action to extract links for a specific network
      11.7 Choose how long to wait after a 'client-svc-instance' is going to be created
  12. NCE-FAN feature
      12.1 Introduction
      12.2 Add a vlan to a NE(OLT)
      12.3 Associate a vlan to an OLT port
      12.4 Disassociate a vlan from OLT port
      12.5 Create a service-port
      12.6 Modify a service-port
      12.7 Delete a service-port
      12.8 Delete a vlan from an OLT
      12.9 Partial sync-from support
      12.10 sync-from using "product-name" filtering
      12.11 tail-f action to fetch OLTs' status
  ```


# 1. General
------------

  This document describes the huawei-nce NED.

  The NED covers 3 features: `IP_services_feature`, `DWDM_feature` and `NCE-FAN-feature` and only one can be enabled at a time (under the ned-settings section).  
  By default, all 3 features are disabled and before starting to use the NED, the first setting that must be done by the user is to enable one of the 3 features, as below:

   - enable `IP-services-feature`

     ```
     admin@ncs(config)# devices device dev-1 ned-settings huawei-nce features IP-services-feature true
     admin@ncs(config-device-dev-1)# commit
     Commit complete.
     admin@ncs(config-device-dev-1)# disconnect
     admin@ncs(config-device-dev-1)# connect
     ```


   - enable `DWDM-feature`

     ```
     admin@ncs(config)# devices device dev-1 ned-settings huawei-nce features DWDM-feature true
     admin@ncs(config-dev-1)# commit
     Commit complete.
     admin@ncs(config-device-dev-1)# disconnect
     admin@ncs(config-device-dev-1)# connect
     ```


   - enable `NCE-FAN-feature`

     ```
     admin@ncs(config)# devices device dev-1 ned-settings huawei-nce features NCE-FAN-feature true
     admin@ncs(config-dev-1)# commit
     Commit complete.
     admin@ncs(config-device-dev-1)# disconnect
     admin@ncs(config-device-dev-1)# connect
     ```

  Note:
   - in case one of the features is enabled and the user wants to enable other feature, then the current feature must be set of false

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
  | partial-sync-from         | yes       | -                                                                |
  |                           |           |                                                                  |
  | live-status actions       | yes       | -                                                                |
  |                           |           |                                                                  |
  | live-status show          | no        | -                                                                |
  |                           |           |                                                                  |
  | load-native-config        | no        |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | huawei-nce                | -               | iMaste | -                                                 |
  |                           |                 | r NCE- |                                                   |
  |                           |                 | IP     |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-huawei-nce-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-huawei-nce-1.0.1.signed.bin
      > ./ncs-6.0-huawei-nce-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-huawei-nce-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-huawei-nce-1.0.1.tar.gz
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
     `huawei-nce-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-huawei-nce-1.0.1.tar.gz
     > ls -d */
     huawei-nce-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package huawei-nce-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package huawei-nce-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-huawei-nce-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package huawei-nce-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/huawei-nce-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-huawei-nce-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-huawei-nce-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install huawei-nce-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-huawei-nce-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-huawei-nce-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id huawei-nce-gen-1.0
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

  `$NSO_RUNDIR/logs/ned-huawei-nce-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings huawei-nce logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings huawei-nce logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.huaweince \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings huawei-nce logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings huawei-nce logger java true
     admin@ncs(config)# commit
     ```

  **IMPORTANT**:
  Java logging does not use any IPC messages sent to NSO. Consequently, NSO performance is not
  affected. However, all log printouts from all log enabled devices are saved in one single file.
  This means that the usability is limited. Typically single device use cases etc.

  **SSHJ DEBUG LOGGING**
  For issues related to the ssh connection it is often useful to enable full logging in the SSHJ ssh client.
  This will make SSHJ print additional log entries in `$NSO_RUNDIR/logs/ncs-java-vm.log`:

```
admin@ncs(config)# java-vm java-logging logger net.schmizz.sshj level level-all
admin@ncs(config)# commit
```


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

  Create a tunnel for DWDM-feature:

  ```
  admin@ncs(config-config)
  tunnel tunnel_Case500
   source             0.9.3.233
   destination        0.9.3.234
   protection enable true
   protection protection-type ietf-te-types:lsp-protection-unprotected
   switching-type     ietf-te-types:switching-otn
   te-topology-identifier client-id 6666
   te-topology-identifier provider-id 5555
   te-topology-identifier topology-id 11
   p2p-primary-paths p2p-primary-path primary-path
    optimizations optimization-metric ietf-te-types:path-metric-hop
    exit
   exit
   provisioning-state ietf-te-types:tunnel-admin-state-up
  exit


  admin@ncs(config-config)# commit dry-run outformat native
  native {
     device {
         name dev-1
         data POST https://<address_ip>:<port>/restconf/data/ietf-te:te/tunnels
              {"ietf-te:tunnel": [{
                "te-topology-identifier": {
                  "topology-id": "11",
                  "provider-id": 5555,
                  "client-id": 6666
                },
                "p2p-primary-paths": {"p2p-primary-path": [{
                  "name": "primary-path",
                  "optimizations": {"optimization-metric": [{"metric-type": "ietf-te-types:path-metric-hop"}]}
                }]},
                "name": "tunnel_Case500",
                "destination": "0.9.3.234",
                "protection": {
                  "enable": true,
                  "protection-type": "ietf-te-types:lsp-protection-unprotected"
                },
                "source": "0.9.3.233",
                "provisioning-state": "ietf-te-types:tunnel-admin-state-up",
                "switching-type": "ietf-te-types:switching-otn"
              }]}
     }
  }

  admin@ncs(config-config)# commit
  Commit complete.
  ```

  For more examples, please check the specific sections from the README.md file.


# 5. Built in live-status actions
---------------------------------

  The huawei-nce NED contains lots of actions for IP-services-feature and DWDM-feature.

  Examples:  
  1. fetching operational platform-data for IP-services-feature

     ```
     admin@ncs(config)# devices device dev-1 live-status exec get-platform-oper-data
     result
     Done fetching operational platform data!(network-elements and ltps)
     ```

  2. fetching specific tunnels for DWDM-feature

      ```
      admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-tunnels-oper-data tunnel1 tunnel2
      ```

  For more details regarding the tail-f actions for IP-services feature, please check 10.2, 10.3 and 10.15 sections from the README.md file.


  For more tail-f actions related to the DWDM-feature, please check 11.5 and 11.6 sections from the README.md file.


  There is an action for the NCE-FAN feature as well. Please find details at 12.11 tail-f action to fetch OLTs' status section.


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
     admin@ncs(config)# devices device dev-1 ned-settings huawei-nce logging level debug
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


# 10. IP-services-feature
------------------------

## 10.1 CRUD operations on services like: L3VPN, L2EVPN, VPLS, VLL and QoS
--------------------------------------------------------------------------

The complete list of use-cases covered by NED can be seen below:

```
+-------------------------------+--------------------------------------------------------------------------------+
|         Service Type          |            API Description/Manual Section                                      |
+-------------------------------+--------------------------------------------------------------------------------+
|           L3VPN               |            4.3.5.1 Service Creation                                            |
|           L3VPN               |            4.3.5.2 Service Deletion                                            |
|           L3VPN               |            4.3.5.3 Modify service basic info                                   |
|           L3VPN               |            4.3.5.4 Query a service by service ID                               |
|           L3VPN               |            4.3.5.5 Create a service node                                       |
|           L3VPN               |            4.3.5.6 Create a VRF Route Target                                   |
|           L3VPN               |            4.3.5.7 Delete a VRF route target.                                  |
|           L3VPN               |            4.3.5.8 Modify service node parameters                              |
|           L3VPN               |            4.3.5.9 Create routing protocol                                     |
|           L3VPN               |            4.3.5.10 Delete routing protocol                                    |
|           L3VPN               |            4.3.5.11 Create OSPF Import Route                                   |
|           L3VPN               |            4.3.5.12 Delete OSPF Import Route                                   |
|           L3VPN               |            4.3.5.13 Create bgp import route                                    |
|           L3VPN               |            4.3.5.14 Delete bgp import route                                    |
|           L3VPN               |            4.3.5.15 Create binding tunnel                                      |
|           L3VPN               |            4.3.5.16 Delete binding tunnel                                      |
|           L3VPN               |            4.3.5.17 Delete a service node                                      |
|           L3VPN               |            4.3.5.18 Create a service access point                              |
|           L3VPN               |            4.3.5.19 Modify a service access point                              |
|           L3VPN               |            4.3.5.20 Create a standard QoS package                              |
|           L3VPN               |            4.3.5.21 Modify a standard QoS package                              |
|           L3VPN               |            4.3.5.22 Delete a standard QoS package                              |
|           L3VPN               |            4.3.5.23 Create a QoS CAR                                           |
|           L3VPN               |            4.3.5.24 Modify a QoS CAR.                                          |
|           L3VPN               |            4.3.5.25 Delete a QoS CAR.                                          |
|           L3VPN               |            4.3.5.26 Modify BGP peer parameters                                 |
|           L3VPN               |            4.3.5.27 Create BGP peer                                            |
|           L3VPN               |            4.3.5.28 Delete BGP Peer                                            |
|           L3VPN               |            4.3.5.29 Create ospf interface                                      |
|           L3VPN               |            4.3.5.30 Delete ospf interface                                      |
|           L3VPN               |            4.3.5.31 Modify ospf interface                                      |
|           L3VPN               |            4.3.5.32 Create a static protocol                                   |
|           L3VPN               |            4.3.5.33 Delete the static protocol of a service access point       |
|           L3VPN               |            4.3.5.34 Modify the static protocol of a service access point       |
|           L3VPN               |            4.3.5.39 Delete a service access point.                             |
|           L3VPN               |            4.3.5.40 Query basic service information                            |
|           L2EVPN              |            4.3.9.1 Create a L2EVPN Service                                     |
|           L2EVPN              |            4.3.9.2 Modify base information of the L2EVPN Service               |
|           L2EVPN              |            4.3.9.3 Create an evpn instance                                     |
|           L2EVPN              |            4.3.9.4 Modify the evpn instance configuration                      |
|           L2EVPN              |            4.3.9.5 Delete an evpn instances                                    |
|           L2EVPN              |            4.3.9.6 Create a bridge domain                                      |
|           L2EVPN              |            4.3.9.7 Delete a bridge domain                                      |
|           L2EVPN              |            4.3.9.10 Create a network access                                    |
|           L2EVPN              |            4.3.9.11 Modify base information of the network access              |
|           L2EVPN              |            4.3.9.18 Delete a network access                                    |
|           L2EVPN              |            4.3.9.19 Delete a L2EVPN Service                                    |
|           L2EVPN              |            4.3.9.20 Query a L2EVPN Service detail                              |
|           L2EVPN              |            4.3.9.21 Query all L2EVPN Service details                           |
|           L2EVPN              |            4.3.9.8 Create an evpl instances                                    |
|           L2EVPN              |            4.3.9.9 Delete an evpl instance                                     |
|           L2EVPN              |            4.3.9.12 Add Qos package for the network access                     |
|           L2EVPN              |            4.3.9.13 Modify Qos package configuration of the network access     |
|           L2EVPN              |            4.3.9.14 Delete Qos package configuration of the network access     |
|           L2EVPN              |            4.3.9.15 Add Qos car configuration of the network access            |
|           L2EVPN              |            4.3.9.16 Modify Qos car configuration of the network access         |
|           L2EVPN              |            4.3.9.17 Delete Qos car configuration of the network access         |
|           VPLS                |            4.3.12.1 Create a VPLS Service                                      |
|           VPLS                |            4.3.12.2 Modify VPLS Service description                            |
|           VPLS                |            4.3.12.3 Add a VSI                                                  |
|           VPLS                |            4.3.12.4 Modify a VSI                                               |
|           VPLS                |            4.3.12.5 Delete a VSI                                               |
|           VPLS                |            4.3.12.6 Add a PW trail                                             |
|           VPLS                |            4.3.12.7 Delete a PW trail                                          |
|           VPLS                |            4.3.12.8 Create a service access end-point                          |
|           VPLS                |            4.3.12.9 Delete a service access point                              |
|           VPLS                |            4.3.12.10 Modify the access interface                               |
|           VPLS                |            4.3.12.11 Delete a VPLS Service                                     |
|           VPLS                |            4.3.12.12 Query VPLS service details                                |
|           VPLS                |            4.3.12.13 Query all VPLS Services                                   |
|           VLL                 |            4.3.11.1 Create a VLL Service                                       |
|           VLL                 |            4.3.11.2 Query all VLL Services                                     |
|           VLL                 |            4.3.11.3 Query VLL service details                                  |
|           VLL                 |            4.3.11.7 Delete a VLL Service                                       |
|           VLL                 |            4.3.11.4 Modify the service User-label information                  |
|           VLL                 |            4.3.11.5 Enable a VLL service                                       |
|           VLL                 |            4.3.11.6 Disable a VLL Service                                      |
|           QOS                 |            4.3.7.1 Query QoS package                                           |
|           QOS                 |            4.3.7.2 Query QoS package details                                   |
|           QOS                 |            4.3.7.3 Create QoS package                                          |
|           QOS                 |            4.3.7.4 Query QoS package by uuid                                   |
|           QOS                 |            4.3.7.5 Modify QoS package name                                     |
|           QOS                 |            4.3.7.6 Delete QoS package by uuid                                  |
|           QOS                 |            4.3.7.7 Query traffic classifier template                           |
|           QOS                 |            4.3.7.8 Create traffic classifier template                          |
|           QOS                 |            4.3.7.9 Delete traffic classifier template by name                  |
|           QOS                 |            4.3.7.10 Query traffic behavior template                            |
|           QOS                 |            4.3.7.11 Create traffic behavior template                           |
|           QOS                 |            4.3.7.12 Delete traffic behavior template by name                   |
|           QOS                 |            4.3.7.13 Query traffic policy template                              |
|           QOS                 |            4.3.7.14 Create traffic policy template                             |
|           QOS                 |            4.3.7.15 Delete traffic policy by name                              |
|           QOS                 |            4.3.7.16 Query interface QoS template                               |
|           QOS                 |            4.3.7.17 Create interface qos template                              |
|           QOS                 |            4.3.7.18 Delete interface QoS template by name                      |
|           QOS                 |            4.3.7.19 Modify traffic behavior                                    |
|           QOS                 |            4.3.7.20 Modify traffic classifier                                  |
|           QOS                 |            4.3.7.21 Modify traffic policy                                      |
|           QOS                 |            4.3.7.22 Modify interface configuration                             |
|           QOS                 |            4.3.7.23 Delete multi-field classification on device                |
|           L3VPN               |            4.3.5.10 Apply route policy for VPN Node                            |
|           L3VPN               |            4.3.5.11 Delete route policy of VPN Node                            |
|           L3VPN               |            4.3.5.13 Override routing protocol                                  |
|           L3VPN               |            4.3.5.19 Create IGMP SSM Mapping                                    |
|           L3VPN               |            4.3.5.20 Delete IGMP SSM Mapping                                    |
|           L3VPN               |            4.3.5.26 Override ethernet configuration of service access point    |
|           L3VPN               |            4.3.5.27 Override IP addresses of service access point              |
|           L3VPN               |            4.3.5.37 Apply route policy for BGP peer                            |
|           L3VPN               |            4.3.5.38 Delete route policy of BGP peer                            |
|           L3VPN               |            4.3.5.45 Create VRRP for service access point                       |
|           L3VPN               |            4.3.5.46 Override VRRP of service access point                      |
|           L3VPN               |            4.3.5.47 Delete VRRP of service access point                        |
|           L3VPN               |            4.3.5.48 Override DHCP configuration of service access point        |
|           L3VPN               |            4.3.5.49 Modify IGMP configuration of service access point          |
|           L3VPN               |            4.3.5.50 Create BFD session                                         |
|           L3VPN               |            4.3.5.51 Modify BFD session parameters                              |
|           L3VPN               |            4.3.5.52 Delete BFD session                                         |
|           L3VPN               |            4.3.5.54 Create L3vpn svcs detail exporting task                    |
|           L3VPN               |            4.3.5.55 Query L3vpn svcs exporting task status                     |
|           L3VPN               |            4.3.5.56 Download exported L3VPN svc file                           |
|           L3VPN               |            4.3.8.1 Query route policy template list                            |
|           L3VPN               |            4.3.8.2 Create route policy template                                |
|           L3VPN               |            4.3.8.3 Delete route policy template                                |
|           L3VPN               |            4.3.8.4 Query as path filter template list                          |
|           L3VPN               |            4.3.8.5 Create as path filter template                              |
|           L3VPN               |            4.3.8.6 Delete as path filter template                              |
|           L3VPN               |            4.3.8.7 Query community filter template list                        |
|           L3VPN               |            4.3.8.8 Create community filter template                            |
|           L3VPN               |            4.3.8.9 Delete community filter template                            |
|           L3VPN               |            4.3.8.10 Query IPv4 prefix template list                            |
|           L3VPN               |            4.3.8.11 Create IPv4 prefix template                                |
|           L3VPN               |            4.3.8.12 Delete IPv4 prefix template                                |
|           L3VPN               |            4.3.8.13 Query ext community filter template list                   |
|           L3VPN               |            4.3.8.14 Create ext community filter template                       |
|           L3VPN               |            4.3.8.15 Delete ext community filter template                       |
|           L3VPN               |            4.3.8.16 Modify route policy                                        |
|           L3VPN               |            4.3.8.17 Modify as path filter                                      |
|           L3VPN               |            4.3.8.18 Modify community filter                                    |
|           L3VPN               |            4.3.8.19 Modify ext community filter                                |
|           L3VPN               |            4.3.8.20 Modify IPv4 prefix                                         |
|           L3VPN               |            4.3.8.21 Delete template instances on devices                       |
|           L3VPN               |            4.3.8.22 Query the Routing Policy List                              |
|           L2EVPN              |            4.3.9.22 Create an access point (end-point)                         |
|           L2EVPN              |            4.3.9.23 Modify base information of the access point                |
|           L2EVPN              |            4.3.9.24 Delete an access point                                     |
|           L2EVPN              |            4.3.9.25 Modify the vlan configuration of network access            |
|           L2EVPN              |            4.3.9.26 Add a Layer 2 protocol type for the network access         |
|           L2EVPN              |            4.3.9.27 Delete a Layer 2 protocol type for the network access      |
|           L2EVPN              |            4.3.9.28 Add Route targets configuration to Evpn instance           |
|           L2EVPN              |            4.3.9.29 Delete Route target configuration to Evpn instance         |
|           L2EVPN              |            4.3.9.30 Add the binding Tunnel                                     |
|           L2EVPN              |            4.3.9.31 Delete the binding Tunnel                                  |
|           L2EVPN              |            4.3.9.32 Modify the configuration information for bridge domain     |
|           VLL                 |            4.3.11.5 Modify the information of ingress access                   |
|           VLL                 |            4.3.11.6 Create a standard QoS package of the ingress access        |
|           VLL                 |            4.3.11.7 Modify a standard QoS package of the ingress access        |
|           VLL                 |            4.3.11.8 Delete a standard QoS package of the ingress access        |
|           VLL                 |            4.3.11.9 Add Layer 2 protocol tunneling of the ingress access       |
|           VLL                 |            4.3.11.10 Delete Layer 2 protocol tunneling of the ingress access   |
|           VLL                 |            4.3.11.11 Modify the information of egress access                   |
|           VLL                 |            4.3.11.12 Create a standard QoS package of the egress access        |
|           VLL                 |            4.3.11.13 Modify a standard QoS package of the egress access        |
|           VLL                 |            4.3.11.14 Delete a standard QoS package of the egress access        |
|           VLL                 |            4.3.11.15 Add Layer 2 protocol tunneling of the egress access       |
|           VLL                 |            4.3.11.16 Delete Layer 2 protocol tunneling of the egress access    |
|           VLL                 |            4.3.11.17 Add a binding tunnel to a specified service               |
|           VLL                 |            4.3.11.18 Delete a binding tunnel from a specified service          |
|           VLL                 |            4.3.11.19 Modify the bfd detect parameter                           |
|           VPLS                |            4.3.12.14 Create a standard QoS package of the network access       |
|           VPLS                |            4.3.12.15 Modify a standard QoS package of the network access       |
|           VPLS                |            4.3.12.16 Delete a standard QoS package of the network access       |
|           VPLS                |            4.3.12.17 Add a Layer 2 protocol tunneling of the network access    |
|           VPLS                |            4.3.12.18 Delete a Layer 2 protocol tunneling of the network access |
|           VPLS                |            4.3.12.19 Add a binding tunnel                                      |
|           VPLS                |            4.3.12.20 Delete a binding tunnel                                   |
+-------------------------------+--------------------------------------------------------------------------------+
```

Note:
 - 4.3.x.y is the section number as described in the "iMaster NCE V100R020C00 Northbound REST API Guide - 11182020.pdf" manual)

## 10.2. Fetching operational data for network-element and ltps
---------------------------------------------------------------

The customer can choose what method should be used to fetch the platform operational data.
By default the "file" method(reading configuration from file) is used.

To change to the "api" method, the steps are:

```
admin@ncs(config-device-dev-1)# ned-settings huawei-nce fetch-platform-oper-data
Possible completions:
api 'network-elements' and 'ltp' are fetched using APIs
file 'network-elements' and 'ltp' are fetched from files<default method>

admin@ncs(config-device-dev-1)# ned-settings huawei-nce fetch-platform-oper-data api

admin@ncs(config-device-dev-1)# commit
Commit complete.

admin@ncs(config-device-dev-1)# config
admin@ncs(config-config)# disconnect
admin@ncs(config-config)# connect
result true
```

Note:
 - `disconnect/connect` operations are required for ned-settings to be taken into account

Example:

```
admin@ncs(config)# devices device dev-1 live-status exec get-platform-oper-data
result
Done fetching operational platform data!(network-elements and ltps)
```

Display 'network-elements' from the operational database:

```
admin@ncs# show devices device dev-1 platform network-elements
```

Display 'ltps' from the operational database:

```
admin@ncs# show devices device dev-1 platform ltps
```

Note:
 - when using `get-platform-oper-data` live-status action, all the LTPs and NEs will be fetched
  and written to operational DB (ODB).  
  In case of ODB data update failure (for "ltps/ltp and network-elements/network-element"),
  the old previous ODB data is re-written.
  After fetching new data from device, the old data from ODB   is stored in a temporary file whose name starts with "huawei-platform-oper" and is found in the default temporary-file directory. On UNIX systems the default directory is usually "/tmp".  
  When the temporary file is not needed anymore, is automatically deleted.  
  The ODB data update is done in 2 steps: delete old data and write the new data.
  Deleting current ODB data is done after fetching the new data from device.

If the user wants to fetch a single LTP or NE (with/without filters) or maybe a list of them and not all of them, can run
the following live-status exec actions:

1. for LTPs  
Example:

   ```
   admin@ncs(config)# devices device dev-1 live-status exec get-ltp-query-data {list of LTPs}
   ```

   where {list of LTPs} can have one of the values:  
         - LTP1      -> a single LTP is fetched and written to ODB  
         - LTP1 LTP2 -> only ltps with ids: LTP1 and LTPs are fetched from device and
                        written to ODB. LTP1 and LTP2 are separated by space.  
         - none      -> the corresponding LTP list (platform/query-ltp/ltp) is deleted from ODB

   To display the LTPs entries from ODB please use:

   ```
   admin@ncs# show devices device dev-1 platform query-ltp ltp
   ```

2. for NEs  
Example:

   ```
   admin@ncs(config)# devices device dev-1 live-status exec get-network-element-data {list of NEs}
   ```

   where {list of NEs} can have one of the values:  
         - NE1     -> a single NE is fetched and written to ODB  
         - NE1 NE2 -> only NE1 and NE2 are fetched from device and written to ODB.
                      NE1 and NE2 are separated by space.  
         - none    -> the corresponding NE list (platform/query-network-element/network-element) is deleted from ODB

   To display the NE entries from ODB please use:

   ```
   admin@ncs# show devices device dev-1 platform query-network-element network-element
   ```

3. "get-network-element-data-filters" is an action that can be used to fetch NE with filters like: "name" and "ip-address".

    Examples:  
    3.1. both filters at the same time

    ```
    admin@ncs(config)# devices device dev-1 live-status exec get-network-element-data-filters ip-address 10.254.193.122 name DN-1
    ```

    3.2. just a single filter

    ```
    admin@ncs(config)# devices device dev-1 live-status exec get-network-element-data-filters ip-address 10.254.193.122
    ```

    3.3. fetch all the network-elements

    ```
    admin@ncs(config)# devices device dev-1 live-status exec get-network-element-data-filters
    ```

    The results for all 3 examples from above are written to ODB.

4. The following action can be used to fetch all the ltps for a particular ne-id:

   ```
   admin@ncs(config)# devices device dev-1 live-status exec get-ltp-of-NE e7008e71-47fe-11ea-b783-fa163e0659e8
   result
   Done fetching the ltps for ne-id:e7008e71-47fe-11ea-b783-fa163e0659e8
   ```

   To check the ltps for that particular ne-id:

   ```
   admin@ncs# show devices device dev-1 platform ltps
   ```

5. Query All LTPs with "parent-ltp-id" filter and write them into ODB  
   Example:

   ```
   admin@ncs(config)# devices device dev-1 live-status exec get-ltps-data-filters parent-ltp-id cfbd82cf-47fe-11ea-a974-fa163e480e11
   Done fetching the ltps for parent-ltp-id:cfbd82cf-47fe-11ea-a974-fa163e480e11
   ```


## 10.3. tailf-actions for IP-services-feature (L3VPN and QoS)
--------------------------------------------------------------

The below examples have the same section number to the ones found in the "NCE NBI Developer Guide - for PLDT 2.0-20190731.pdf" manual.

Examples:  
1. use-case 4.3.7.23 Delete multi-field classification on device

   ```
   admin@ncs# devices device dev-1 live-status exec delete-multifield-classification device-id 2139855e-2e7d-13e9-5f38-3ac5e3fbb249 profile-name test_43723 profile-type trafficpolicy
   result OK
   ```

2. use-case 4.3.5.54 Create L3vpn svcs detail exporting task

   ```
   admin@ncs# devices device dev-1 live-status exec export-l3vpn-svcs version v1
   result {"output":{"export-rsp":{"task-id":"809d80f6-cd89-11e9-8a18-fa163e34bc7c"}}}
   ```

3. use-case 4.3.5.55 Query L3vpn svcs exporting task status

   ```
   admin@ncs# devices device dev-1 live-status exec query-l3vpn-svcs-export-task-status task-id 809d80f6-cd89-11e9-8a18-fa163e34bc7c
   result {"output": {
     "file-name": "L3vpn-svcs-619588659.zip",
     "task-id": "03e34588-cd8e-11e9-8a18-fa163e34bbd3",
     "task-status": "FINISHED",
     "ret-code": 0
   }}
   ```

4. use-case 4.3.5.56 Download exported L3VPN svc file

   ```
   admin@ncs# devices device dev-1 live-status exec download-file-l3vpn file-name L3vpn-svcs-619588659.zip task-id 03e34588-cd8e-11e9-8a18-fa163e34bbd3
   result Zip file L3vpn-svcs-72503245.zip extracted successfully at path: /path-to-the-ned-instance
   ```

5. use-case 4.3.5.21

   ```
   admin@ncs# devices device dev-1 live-status exec undeploy-route-policy name TEST_43823 ne-id 2139855e-2e7d-13e9-5f38-3ac5e3fbb249 type route-policy
   result OK
   ```

6. use-case 4.3.5.22

   ```
   admin@ncs# devices device dev-1 live-status exec get-route-policy-brief-list limit 10 name TEST offset 0
   result {"output":{"count":3,"route-policy-brief-list":[{"deploy-name":"routing-policy-test-1","id":"4567896DC39A46212368485995F33421","name":"routing-policy-test-1"},{"deploy-name":"TEST_43823","id":"0A2E17B2B8194CE49FF08EA1134582D9","name":"TEST_43823"},{"deploy-name":"TEST_4382","id":"092A3E56CBC74284A86E8EC236565E35","name":"TEST_4382"},{"deploy-name":"TEST_4389","id":"1234596DC39A46212368485995F12345","name":"TEST_4389"}]}}
   ```


## 10.4 Choosing how the L3VPN configuration is fetched
-------------------------------------------------------

L3VPN configuration can be fetched using APIs or reading the entire L3VPN configuration from a file.
The user can choose between the 2 methods by setting the "huawei-nce/fetch-l3vpn-method" leaf from the
`ned-settings` section.

The values for this leaf are:
 - `api`-> APIs are used to fetch the L3VPN configuration. This is a slower method, since multiple GET requests are
   required for every single L3VPN service
 - `file`-> only 3 APIs are necessary to read the L3VPN configuration from the device. This method is much faster.

If the "huawei-nce/fetch-l3vpn-method" leaf is not configured, then the file method ("file") is used. This is the default method.

If for some reason, the user wants to switch to the "api" method, then the following settings should be done:

```
admin@ncs(config)# devices device dev-1 ned-settings huawei-nce fetch-l3vpn-method ?
Description: method used to fetch the L3VPN services (via APIs or downloading a file with configuration)
Possible completions:
[file]
api    L3VPN configuration is fetched using APIs for every L3VPN service
file   L3VPN configuration is read from a file<default method>
admin@ncs(config)# devices device dev-1 ned-settings huawei-nce fetch-l3vpn-method api
admin@ncs(config-device-dev-1)# commit
Commit complete.
admin@ncs(config-device-dev-1)# config
admin@ncs(config-config)# disconnect
admin@ncs(config-config)#connect
```

Note:
 - when `file` method is used to fetch L3VPN configuration, the user can adjust the time necessary to fetch the file.  
Sometimes, fetching the configuration of the L3VPN file requires more time if the device has a larger configuration.

The user can control via ned-settings the timeout for downloading a L3VPN file as below:

```
admin@ncs(config-device-dev-1)# ned-settings huawei-nce timers time-l3vpn-download-file 70 (value in seconds)
```

Please note that the `disconnect` and `connect` commands are mandatory, so the ned-setting can be taken into account.


## 10.5 Partial sync-from support for L3VPN section
---------------------------------------------------

Starting from the Release 1.0.13, support for the partial sync-from for the L3VPN section has been added. When `abort()/revert()` methods are triggered, partial sync-from is called before them and can reduce the total time of the rollback process.

`huawei-nce` NED has support for getTransID() as well.  
getTransID() is triggered in multiple places:
 - at sync-from() -> after `show()` method which is called at sync-from(), `getTransID()` is called
 - at `compare-config` -> both `show()` and `getTransID()` are called
 - at `commit()` -> here `getTransID()` is called twice, once before `prepare()` and once after `prepare()`

Normally, `getTransID()` is computed by fetching the entire configuration and applying a hash number on it.  
This could be very time consuming, in case of generic NEDs when large data configuration is fetched from the device.

The user can disable the `getTransID` computation and can keep the partial sync feature using the following ned-setting:

```
  admin@ncs(config)# devices device dev-1 ned-settings use-transaction-id false
  admin@ncs(config-device-dev-1)# commit
  Commit complete.
```

## 10.6 Interface management feature
-----------------------------------

NED has support for the following elements:  
10.6.1. Create an interface (4.3.15.1 section from the "iMaster NCE V100R020C00 Northbound REST API Guide - 11182020.pdf manual")
   Example:  

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    interfaces interface 34d8ed90-dbc6-48d7-afb0-2f2e97e716e3
     interface-name Eth-Trunk18
     description    Test-PE1
     mtu            1500
     bandwidth      1000000000
     admin-status   down
    exit
   exit
   ```

   How the payload that will be sent to the device will look like:

   ```
   admin@ncs(config-config)# commit dry-run outformat native
   native {
       device {
           name dev-1
           data POST https://<IP-address>:<port-number>/restconf/v1/data/huawei-nce-ip-ifm:devices/device/4cc09f52-4810-11ea-b783-fa163e0659e8/interfaces
                {
                    "huawei-nce-ip-ifm:interface":[{
                        "interface-id":"34d8ed90-dbc6-48d7-afb0-2f2e97e716e3",
                        "interface-name":"Eth-Trunk18",
                        "description":"Test-PE1",
                        "mtu":1500,
                        "bandwidth":"1000000000",
                        "admin-status":"down"
                    }]
                }
       }
   }
   ```

10.6.2. Delete an Interface
   Example:

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    no interfaces interface 34d8ed90-dbc6-48d7-afb0-2f2e97e716e3
   exit
   ```

10.6.3. Modify the NE-side Properties of an Interface
   Example:

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    interfaces interface 34d8ed90-dbc6-48d7-afb0-2f2e97e716e3
     interface-name Eth-Trunk10
     description    Test-PE1-update1
    exit
   exit
   ```

10.6.4. Add a Trunk Member Interface to an Interface
   Example:

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    interfaces interface 34d8ed90-dbc6-48d7-afb0-2f2e97e716e3
     trunk-members trunk-member 6975b6a9-4810-11ea-a974-fa163e480e86
      member-interface-name GigabitEthernet2/0/4
      lacp-priority         32768
     exit
    exit
   exit
   ```

10.6.5. Delete a Trunk Member Interface from an Interface
   Example:

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    interfaces interface 34d8ed90-dbc6-48d7-afb0-2f2e97e716e3
     no trunk-members trunk-member 6975b6a9-4810-11ea-a974-fa163e480e86
    exit
   exit
   ```

10.6.6. Add an ESI to an Interface
   Example:

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    interfaces interface 34d8ed90-dbc6-48d7-afb0-2f2e97e716e3
     evpn esi          0000.1111.1516.1111.2222
     evpn es-recovery-timer 30
     evpn track-bfd-name bfd_TEST
     static-bfd session-name bfd_TEST
     static-bfd peer-ip   1.1.1.1
     static-bfd source-ip 2.2.2.2
     static-bfd track-interface Eth-Trunk18
     static-bfd local-discriminator 15162
     static-bfd remote-discriminator 15162
     static-bfd min-tx-interval 200
     static-bfd min-rx-interval 200
     static-bfd detect-multiplier 10
    exit
   exit
   ```

10.6.7. Delete an ESI from an Interface
   Example:

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    interfaces interface 34d8ed90-dbc6-48d7-afb0-2f2e97e716e3
     no evpn esi          0000.1111.1516.1111.2222
     no evpn es-recovery-timer 30
     no evpn track-bfd-name bfd_TEST
     no static-bfd session-name bfd_TEST
     no static-bfd peer-ip   1.1.1.1
     no static-bfd source-ip 2.2.2.2
     no static-bfd track-interface Eth-Trunk18
     no static-bfd local-discriminator 15162
     no static-bfd remote-discriminator 15162
     no static-bfd min-tx-interval 200
     no static-bfd min-rx-interval 200
     no static-bfd detect-multiplier 10
    exit
   exit
   ```

   Payload to the real device is obtained running the `commit dry-run outformat native` command:

   ```
   admin@ncs(config-config)# commit dry-run outformat native
   native {
       device {
           name dev-1
           data DELETE https://<IP-address>:<port-number>/restconf/v1/data/huawei-nce-interface-evpn:nes/ne/4cc09f52-4810-11ea-b783-fa163e0659e8/interfaces/interface/34d8ed90-dbc6-48d7-afb0-2f2e97e716e3
       }
   }
   ```

10.6.8. Modify the Administrative Status of an Interface

   The "admin-status" field is now ignored in Yang model. It can be used to create an interface and is modified via live-status action.

   Example:

   ```
   admin@ncs(config)# devices device dev-1 live-status exec modify-admin-status-interface admin-status up interface-id 42d46548-311f-4b48-85ba-a04edadaa4ea
   result
   Done updating admin-status for interface: 42d46548-311f-4b48-85ba-a04edadaa4ea
   ```


## 10.7 Partial sync-from support for interface management
----------------------------------------------------------

NED has support for partial sync-from for "Query NE-Side Information About an Interface" (4.3.15.2 section from "iMaster NCE V100R020C00 Northbound REST API Guide - 11182020.pdf" manual).

Examples:  
1. get a specific interface for a specific NE:

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/device[device-id=4cc09f52-4810-11ea-b783-fa163e0659e8]/interfaces/interface[interface-id=021898c9-1a8d-11ec-8881-fa163e1d4d2a]/ ]
   ```

2. get all interfaces for a specific NE called 4cc09f52-4810-11ea-b783-fa163e0659e8

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/device[device-id=4cc09f52-4810-11ea-b783-fa163e0659e8] ]
   ```

3. get all interfaces for all NEs

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/device ]
   ```


## 10.8 Partial sync-from support for interface/trunk-members
-------------------------------------------------------------

NED has support for partial sync-from support for "Query the Trunk Member Interfaces of an Interface" (4.3.15.5 section from "iMaster NCE V100R020C00 Northbound REST API Guide - 11182020.pdf" manual).

Examples:  
1. get all trunk-members list for a specific interface, called 69758efc-4810-11ea-a974-fa163e480e86, from a specific NE (i.e. 4cc09f52-4810-11ea-b783-fa163e0659e8)

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/device[device-id=4cc09f52-4810-11ea-b783-fa163e0659e8]/interfaces/interface[interface-id=69758efc-4810-11ea-a974-fa163e480e86]/trunk-members ]
   ```

2. get a specific trunk-member entry for a specific interface

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/device[device-id=4cc09f52-4810-11ea-b783-fa163e0659e8]/interfaces/interface[interface-id=69758efc-4810-11ea-a974-fa163e480e86]/trunk-members/trunk-member[member-interface-id=6975b688-4810-11ea-a974-fa163e480e86]/ ]
   ```


## 10.9 e-trunk section
-----------------------

NED supports  READ, CREATE and DELETE operations of e-trunk section.
Example:
1. Create an e-trunk with no bfd

   ```
   etrunk e-trunk-test-66
    etrunk-id      66
    hello-interval 10
    multiplier     3
    package-key key-type simple
    package-key key 1
    members 4cc09f52-4810-11ea-b783-fa163e0659e8
     description   TEST
     revert-delay  2
     priority      1
     local-address 10.254.194.107
     binding-bfd bfd-type false
     member-interfaces interfaces 6f0da815-3f57-4c30-9142-3e18801cfafe
      member-work-mode auto
     exit
    exit
    members 55a47820-4810-11ea-bb04-fa163e4974d4
     description   TEST
     revert-delay  2
     priority      1
     local-address 10.254.194.108
     binding-bfd bfd-type false
     member-interfaces interfaces 6f035ac9-decf-4473-bf31-c65b0dbb44a0
      member-work-mode auto
     exit
    exit
   exit

   admin@ncs(config-config)# commit dry-run outformat native
   native {
       device {
           name dev-1
           data POST https://<IP-address:Port>/restconf/v1/data/huawei-nce-etrunk:etrunks/etrunk
                {
                 "huawei-nce-etrunk:etrunk":[{
                     "id":"e-trunk-test-66",
                     "etrunk-id":66,
                     "hello-interval":10,
                     "multiplier":3,
                     "package-key":{
                         "key-type":"simple",
                         "key":"1"
                     },
                     "members":[{
                         "device-id":"4cc09f52-4810-11ea-b783-fa163e0659e8",
                         "description":"TEST",
                         "revert-delay":2,
                         "priority":1,
                         "local-address":"10.254.194.107",
                         "binding-bfd":{
                             "bfd-type":false
                         },
                         "member-interfaces":{
                             "interfaces":[{
                                 "id":"6f0da815-3f57-4c30-9142-3e18801cfafe",
                                 "member-work-mode":"auto"
                             }]
                         }
                     },{
                         "device-id":"55a47820-4810-11ea-bb04-fa163e4974d4",
                         "description":"TEST",
                         "revert-delay":2,
                         "priority":1,
                         "local-address":"10.254.194.108",
                         "binding-bfd":{
                             "bfd-type":false
                         },
                         "member-interfaces":{
                             "interfaces":[{
                                 "id":"6f035ac9-decf-4473-bf31-c65b0dbb44a0",
                                 "member-work-mode":"auto"
                             }]
                         }
                     }]
                 }]
             }
       }
   }
   ```

2. Delete an e-trunk

   Example:

   "no etrunk e-trunk-test-66"
   ```
   admin@ncs(config-config)# commit dry-run outformat native
   native {
      device {
          name dev-1
          data DELETE https://<IP-address:Port>/restconf/v1/data/huawei-nce-etrunk:etrunks/etrunk/e-trunk-test-66
      }
   }
   ```


## 10.10 Partial sync-from support for etrunk
---------------------------------------------

NED has support for partial sync-from support for "Query E-Trunk Interface Information" (4.3.16.2 section
from iMaster NCE V100R020C00 Northbound REST API Guide - 11182020.pdf manual).

Examples:  
1. get all e-trunk entries
   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/etrunk/ ]
   ```

2. get a specific e-trunk list entry: etrunk-test1
   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/etrunk[id=etrunk-test1]/ ]
   ```


## 10.11 Partial sync-from support for ESI
------------------------------------------

NED has support for partial sync-from support for "Query the ESI Configurations of an Interface" (4.3.15.10 section from "iMaster NCE V100R020C00 Northbound REST API Guide - 11182020.pdf" manual).

Examples:  
1. get all ESI for all interfaces under a specific NE (4cc09f52-4810-11ea-b783-fa163e0659e8)

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/device[device-id=4cc09f52-4810-11ea-b783-fa163e0659e8]/ ]
   ```

2. get an ESI for a specific interface(320a0e0b-d5e4-4827-9aeb-ae3b8497b07f) from a particular NE(4cc09f52-4810-11ea-b783-fa163e0659e8)

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/device[device-id=4cc09f52-4810-11ea-b783-fa163e0659e8]/interfaces/interface[interface-id=320a0e0b-d5e4-4827-9aeb-ae3b8497b07f]/interface-evpn/ ]

   sync-result {
     device dev-1
     result true
   }
   ```


## 10.12 Partial sync-from support for route-policy and tunnel-trail
-------------------------------------------------------------------

Examples route-policy:  
1. get all entries for route-policy list

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/route-policy/ ]
   ```

2. get a single route-policy: NED_TEST
   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/route-policy[name=NED_TEST]/ ]
   ```


Examples tunnel-trail:  
1. fetch all entries for tunnel-trail list

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/tunnel-trail/ ]
   ```

2. fetch a single tunnel-trail list entry

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/tunnel-trail[id=0a127066-5f15-38ca-b0b6-b9ba50af6522]/ ]
   ```


## 10.13 CRUD operations on ACL service
--------------------------------------
Examples:  
10.13.1. Create an ACL service
   ```
   device e99d70cf-480f-11ea-a70a-fa163e7f2a27
    group 2005
     type basic
    exit
   exit
   ```

10.13.2. Create a basic ACL service

   ```
   device e99d70cf-480f-11ea-a70a-fa163e7f2a27
    group 2005
     rule-basics rule-basic rule_5
      id            5
      action        permit
      source-ipaddr 239.0.0.0
      source-wild   0.255.255.255
     exit
    exit
    exit
   ```

10.13.3. Update a basic ACL service

   ```
   device e99d70cf-480f-11ea-a70a-fa163e7f2a27
    group 2005
     rule-basics rule-basic rule_5
      source-ipaddr 240.0.0.0
      source-wild   0.0.0.255
     exit
    exit
   exit
   ```

10.13.4. Create an ACL service

   ```
   device e99d70cf-480f-11ea-a70a-fa163e7f2a27
    group 3000
     type advance
    exit
   exit
   ```

10.13.5. Create an advance ACL service

   ```
   device e99d70cf-480f-11ea-a70a-fa163e7f2a27
    group 3000
     rule-advances rule-advance adv_2
      id            7
      action        permit
      source-ipaddr 10.0.1.200
      source-wild   0.0.0.0
      protocol      1
      dest-ipaddr   10.0.1.210
      dest-wild     0.0.0.0
    exit
   exit
   ```

10.13.6. Update an ACL service

   ```
   device e99d70cf-480f-11ea-a70a-fa163e7f2a27
    group 3000
     rule-advances rule-advance adv_2
      dest-ipaddr   10.0.1.220
    exit
   exit
   ```

10.13.7. Delete an advance rule of an ACL service

   ```
   device e99d70cf-480f-11ea-a70a-fa163e7f2a27
    group 3000
     no rule-advances rule-advance adv_2
   exit
   ```

10.13.8. Delete an ACL service

   ```
   device e99d70cf-480f-11ea-a70a-fa163e7f2a27
    no group 3000
   exit
   ```

## 10.14 CRUD operations on DHCP service
---------------------------------------

Examples:  
10.14.1. Create a DHCP service

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    global-ip-pool test_ippool
     gateway ip-address 100.100.100.100
     gateway mask 255.255.255.0
    exit
   exit
   ```

10.14.2. Update a DHCP service

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    global-ip-pool test_ippool
     vpn-instance testingapi
     gateway ip-address 100.100.100.0
     gateway mask 255.255.0.0
    exit
   exit
   ```

10.14.3. Create an IP pool section

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    global-ip-pool test_ippool_001
     sections section 23
      start-ip 100.100.100.111
      end-ip   100.100.100.115
     exit
    exit
   exit
   ```

10.14.4. Delete an IP pool section

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    global-ip-pool test_ippool_001
     no sections section 23
    exit
   exit
   ```

10.14.5. Delete a DHCP service

   ```
   device 4cc09f52-4810-11ea-b783-fa163e0659e8
    no global-ip-pool test_ippool
   exit
   ```

## 10.15 tail-f action to query locators by nes
----------------------------------------------

Example:

 ```
 admin@ncs(config)# devices device dev-1 live-status exec query-locators-by-nes ne-id 55a47820-4810-11ea-bb04-fa163e497c23
 result
 Done query locators by nes: 55a47820-4810-11ea-bb04-fa163e497c23
 {
  "huawei-nce-segment-routing-ipv6:output":{
      "ne-locators":{
          "ne-locator":[{
              "locators":{
                  "locators":[{
                      "locator-name":"SRV6",
                      "ipv6-prefix":"2505::",
                      "mask":64,
                      "static-flag":true,
                      "static-length":8,
                      "args-flag":true,
                      "args-length":16,
                      "flex-algo":null
                  }]
              },
              "ne-id":"55a47820-4810-11ea-bb04-fa163e497c23"
          }]
      }
   }
 }
 ```


# 11. DWDM-feature
------------------

## 11.1 create/delete a 'tunnel' list entry
-------------------------------------------

Example create a tunnel:

 ```
 admin@ncs(config-config)
 tunnel tunnel_Case500
  source             0.9.3.233
  destination        0.9.3.234
  protection enable true
  protection protection-type ietf-te-types:lsp-protection-unprotected
  switching-type     ietf-te-types:switching-otn
  te-topology-identifier client-id 6666
  te-topology-identifier provider-id 5555
  te-topology-identifier topology-id 11
  p2p-primary-paths p2p-primary-path primary-path
   optimizations optimization-metric ietf-te-types:path-metric-hop
   exit
  exit
  provisioning-state ietf-te-types:tunnel-admin-state-up
 exit


 admin@ncs(config-config)# commit dry-run outformat native
 native {
    device {
        name dev-1
        data POST https://<address_ip>:<port>/restconf/data/ietf-te:te/tunnels
             {"ietf-te:tunnel": [{
               "te-topology-identifier": {
                 "topology-id": "11",
                 "provider-id": 5555,
                 "client-id": 6666
               },
               "p2p-primary-paths": {"p2p-primary-path": [{
                 "name": "primary-path",
                 "optimizations": {"optimization-metric": [{"metric-type": "ietf-te-types:path-metric-hop"}]}
               }]},
               "name": "tunnel_Case500",
               "destination": "0.9.3.234",
               "protection": {
                 "enable": true,
                 "protection-type": "ietf-te-types:lsp-protection-unprotected"
               },
               "source": "0.9.3.233",
               "provisioning-state": "ietf-te-types:tunnel-admin-state-up",
               "switching-type": "ietf-te-types:switching-otn"
             }]}
    }
}

 admin@ncs(config-config)# commit
 Commit complete.
 ```

Example delete a tunnel (only when tunnel is not linked to a service):

 ```
 admin@ncs(config-config)# no tunnel tunnel_Case500
 admin@ncs(config-config)# show config
 no tunnel tunnel_Case500
 admin@ncs(config-config)# commit dry-run outformat native
 native {
     device {
         name dev-1
         data DELETE https://<address_ip>:<port>/restconf/data/ietf-te:te/tunnels/tunnel=tunnel_Case500
     }
 }
 ```

NOTE:
 - if a tunnel is linked to a service, then the tunnel and the service must be deleted in the same transaction by the user. In this case, only the "delete" operation for 'client-svc-instance' will be sent to the device by the NED - NCE device will automatically delete the related tunnel as well.


## 11.2 create/modify/delete a service
--------------------------------------

Example create a service:

 ```
 client-svc-instances client_Case500
  client-svc-title   client_Case500
  admin-status       ietf-te-types:tunnel-admin-state-up
  access-provider-id 5555
  access-client-id   6666
  access-topology-id 11
  src-access-ports access-node-id 0.9.3.233
  src-access-ports access-ltp-id 419364865
  src-access-ports client-signal ietf-otn-types:client-signal-ODU4
  dst-access-ports access-node-id 0.9.3.234
  dst-access-ports access-ltp-id 150929410
  dst-access-ports client-signal ietf-otn-types:client-signal-ODU4
  svc-tunnels tunnel_Case500
  exit
 exit
 admin@ncs(config-config)# commit
 Commit complete.
 ```

Example delete a service

Note:
 - when deleting a service, the NCE device will automatically delete its associated tunnel. Hence the user must delete the tunnel in the same transaction.

 ```
 admin@ncs(config-config)# no svc-tunnels tunnel_Case500
 admin@ncs(config-config)# commit dry-run outformat native
 native {
    device {
        name dev-1
        data DELETE https://<address_ip>:<port>/restconf/data/ietf-trans-client-service:client-svc/client-svc-instances=client_Case500
    }
 }

 admin@ncs(config-config)# commit
 Commit complete.
 ```

Example modify a service

 ```
 admin@ncs(config-config)# client-svc-instances client_Case500
 admin@ncs(config-client-svc-instances-client_Case500)# client-svc-title "new client_Case500"
 admin@ncs(config-client-svc-instances-client_Case500)# exit

 admin@ncs(config-config)# show config
 client-svc-instances client_Case500
 client-svc-title "new client_Case500"
 !
 ```

Note:
 - When 'client-svc-title' of a 'client-svc-instance' is modified, then the 'title' of the related 'tunnel' must be modified with the same value, in the same transaction. This is necessary because, the 'title' under 'tunnel', is dynamically changed after 'client-svc-title' is updated or 'client-svc-instance' is created and it would cause "compare-config" diffs.
 - NED will ignore this change, since the 'tunnel' list doesn't accept "Modify" operation.

Example:  
   ```
   tunnel tunnel_Case500
    title "new client_Case500"
   exit

   admin@ncs(config-config)# commit dry-run outformat native
   native {
     device {
         name dev-1
         data PATCH https://<address_ip>:<port>/restconf/data/ietf-trans-client-service:client-svc/client-svc-instances=client_Case500
           {"ietf-trans-client-service:client-svc-instances": [{
             "client-svc-title": "new client_Case500",
             "client-svc-name": "client_Case500"
           }]}
     }
   }

   admin@ncs(config-config)# commit
   Commit complete.
   ```


## 11.3 check-sync support
--------------------------

```
admin@ncs(config-config)# check-sync
result in-sync
```


## 11.4 Partial sync-from support
---------------------------------

Example tunnel:  

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/tunnel[name=’tunnel_Case500’]/ ]
   ```

Example service:  
   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/client-svc-instances[client-svc-name=’client_Case500’]/ ]
   ```


## 11.5 tail-f action for pre-route calculation
-----------------------------------------------

```
admin@ncs# devices device dev-1 live-status exec route-pre-calculation request { request-id test path-count 1 access-provider-id 4444 access-client-id 2222 access-topology-id 11 src-access-ports { access-node-id 0.9.3.123 access-ltp-id 414121232 client-signal ietf-otn-types:client-signal-ODU4 } dst-access-ports { access-node-id 0.9.3.123 access-ltp-id 150929410 client-signal ietf-otn-types:client-signal-ODU4 } tunnel-policy { te-bandwidth { odu-type ietf-otn-types:prot-ODU4 } protection { enable false protection-type ietf-te-types:lsp-protection-bidir-1-to-1 protection-reversion-disable false wait-to-revert 0 hold-off-time 0 segment-protect false } restoration { enable false restoration-reversion-disable false wait-to-revert 0 hold-off-time 0 } } p2p-primary-paths { p2p-primary-path { name test explicit-route-objects { route-object-include-exclude { index 0 explicit-route-usage ietf-te-types:lsp-protection-bidir-1-to-1 unnumbered-hop { node-id 0.9.3.123 link-tp-id 414121232 hop-type STRICT } } route-object-include-exclude { index 1 explicit-route-usage ietf-te-types:route-include-ero unnumbered-hop { node-id 0.9.3.123 link-tp-id 123112312 hop-type STRICT } } } optimizations { optimization-metric { metric-type ietf-te-types:path-metric-delay-average weight 0 } } } } }

result {"ietf-trans-client-service:output": {"result": [{
  "access-topology-id": "11",
  "access-provider-id": 4444,
  "request-id": "test",
  "access-client-id": 2222,
  "computed-path": [{
    "path-id": 1,
    "p2p-primary-path": {"path-properties": {
      "path-metric": [
        {
          "metric-type": "ietf-te-types:path-metric-hop",
          "accumulative-value": "4"
        },
        {
          "metric-type": "ietf-te-types:path-metric-delay-average",
          "accumulative-value": "108"
        }
      ],
      "path-route-objects": {"path-route-object": [
        {
          "unnumbered-hop": {
            "link-tp-id": 414121232,
            "node-id": "0.9.3.123",
            "direction": "INCOMING"
          },
          "index": 0
        },
        {
          "unnumbered-hop": {
            "link-tp-id": 436142082,
            "node-id": "0.9.3.123",
            "direction": "OUTGOING"
          },
          "index": 1
        },
        {
          "unnumbered-hop": {
            "link-tp-id": 123112312,
            "node-id": "0.9.3.123",
            "direction": "INCOMING"
          },
          "index": 2
        },
        {
          "unnumbered-hop": {
            "link-tp-id": 150929410,
            "node-id": "0.9.3.123",
            "direction": "OUTGOING"
          },
          "index": 3
        }
      ]}
    }}
  }]
}]}}
```


## 11.6 tail-f actions to fetch operational data
------------------------------------------------

### 11.6.1 action to extract tunnels
------------------------------------

Depending on needs, "all", "none" or particular tunnels can be fetched

Fetch all available tunnels:

```
admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-tunnels-oper-data all
```

Clear operational database(ODB) for tunnels:

```
admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-tunnels-oper-data none
```

Fetch only specific tunnels:

```
admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-tunnels-oper-data tunnel1 tunnel2
```


Please note that when you write new values for the tunnel, the previous ones are automatically deleted. So, for example, if you currently have the "all" value for tunnels, and then you want to fetch a "first-tunnel" tunnel, there is no need to delete the current values:

Instead of:

```
no devices device dev-1 live-status exec get-DWDM-tunnels-oper-data all
devices device dev-1 live-status exec get-DWDM-tunnels-oper-data first-tunnel
```

is enough to set only the needed tunnel:

```
devices device dev-1 live-status exec get-DWDM-tunnels-oper-data first-tunnel
```

If you want to fetch one more tunnel(there is no need to delete the second-tunnel):

```
devices device dev-1 live-status exec get-DWDM-tunnels-oper-data second-tunnel
```
Here, the single fetched tunnel is "second-tunnel" and the previous "first-tunnel" will be kept in the ODB. This operation is seen as an append operation.

To display operational data for tunnels:

```
admin@ncs# show devices device tunnels tunnel
```


### 11.6.2 action to extract the services ("client-svc-instances")
------------------------------------------------------------------

Similar to tunnels, equivalent actions can be used to fetch "all", "none" or specific services.

```
admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-services-oper-data all/none/list of services to fetch
```

To display services operational data:

```
admin@ncs# show devices device client-svc client-svc-instances
```

### 11.6.3 action to extract networks elements
---------------------------------------------

11.6.3.1 To extract all networks, the user has 2 modes to do it:

Mode 1.

   ```
   admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-networks-oper-data-api all
   ```

Mode 2.  
The same effect as above can be obtained using 3 different actions:  
  Step 1. "get-DWDM-networks-create-task" action to fetch task-id for oper NW data  
  Step 2. "get-DWDM-network-query-task" action to check the task status for action 1  
  Step 3. "get-DWDM-networks-oper-data-file" action to download the files and write platform/networks
     to ODB

Example for mode 2:  
   Step 1.

   ```
   admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-networks-create-task
    result
    Create task done! task-id = 37dbdb3e-593b-4a0c-9e37-226862f94720
   ```
   Note: task-id is saved to Operational DB

   Step 2.

   ```
   admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-networks-query-task
    result
    Operation successful!
    File Names are:
    network-v2-20210416195318.zip
    node-v2-20210416195318.zip
    termination-point-v2-20210416195318.zip
    tunnel-termination-point-v2-20210416195318.zip
    link-v2-20210416195318.zip
    lag-v2-20210416195318.zip
    mclag-v2-20210416195318.zip
   ```

   Note: at this step the file names are automatically saved into Operational DB.

   Step 3.

   ```
   admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-networks-oper-data-file
    result
    Done fetching networks operational data!(ietf-network:networks)
   ```

   Note: At this step the task-id and file names are read from Operational DB and deleted in the end

11.6.3.2 To ignore fetching network elements and delete the existing ones from operational CDB

```
admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-networks-oper-data none
```

### 11.6.4 action to extract nodes for a specific network
--------------------------------------------------------

A. to extract a single node from a particular network:

```
admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-networks-NODES-oper-data network-id providerId nodes id1
```

B. to extract all nodes for a particular network:

```
admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-networks-NODES-oper-data network-id providerId nodes all
```

C. to extract multiple nodes for a particular network

```
admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-networks-NODES-oper-data network-id providerId nodes id1 id2
```

### 11.6.5 action to extract links for a specific network
--------------------------------------------------------

A. to extract a single link from a particular network:

```
admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-networks-LINKS-oper-data network-id providerId links teNodeId
```

B. to extract all links from a particular network

```
admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-networks-LINKS-oper-data network-id providerId links all
```

C. to extract multiple links for a particular network

```
admin@ncs(config)# devices device dev-1 live-status exec get-DWDM-networks-LINKS-oper-data network-id providerId links teNodeId1 teNodeId2
```

## 11.7 Choose how long to wait after a 'client-svc-instance' to be created
---------------------------------------------------------------------------

Depending on the device's connection, sometimes creating a "client-svc-instance" can take more or less time.
The parameter "time-provisioning-service-DWDM" param is now modifiable via ned-settings and user can choose how many seconds to wait when creating a "client-svc-instance".

Example:

```
admin@ncs(config-device-dev-1)# ned-settings huawei-nce timers time-provisioning-service-DWDM ?
Description: Time to wait (in seconds) until a client-svc-instance is complete, meaning that 'provisioning-state' becomes 'lsp-state-up'.
Possible completions:
<time in seconds> default is 30 sec
```

P.S.: Don't forget to `disconnect` and `connect` again to take into account the ned-setting "time-provisioning-service-DWDM".

Another important thing is that user has the possibility to choose if NED should wait for "client-svc-instance" to be up (old method), meaning to reach the "lsp-state-up" state or not (new method).
Hence, the user can choose between the old and the new method via ned-settings, using "client-svc-instance-completed-method" parameter: "old-method" and "new-method".

For the "new-method", user can check extra information available into operational DB. If the "client-svc-instance" was completed (has "lsp-state-up" state) during the time set by "time-provisioning-service-DWDM", it will have a "completed" status as below:

```
admin@ncs# show devices device dev-1 client-svc-instances-status
NAME STATUS
-------------------------------------------------
service-to-test completed
```
... otherwise a timeout will occur and the ervice won't be completed anymore:

```
admin@ncs# show devices device <dev> client-svc-instances-status
NAME STATUS
-------------------------------------------------
service-to-test timed-out
```

When `sync-from` or `compare-config` are triggered, the service's status will be updated as below:
 - if the service was existing in ODB (operational DB), but not present on the device anymore, will be deleted from ODB
 - if the service was created outside NED, it will have status "outside"
 - if service had "timed-out" status when it was created from NED, and in the meantime become "lsp-state-up", it will have "completed" status


# 12. NCE-FAN feature
---------------------

## 12.1 Introduction
--------------------

A single ned-feature must be enabled at a given time. By default, all ned-features are set on false.  
To enable the NCE-FAN feature, the user must enable the related ned-setting:

```
admin@ncs(config-device-dev-1)# ned-settings huawei-nce features NCE-FAN-feature true

admin@ncs(config-device-dev-1)# commit
Commit complete.

admin@ncs(config-device-dev-1)# config
admin@ncs(config-config)# disconnect
admin@ncs(config-config)# connect
result true
```

`getTransID()` is used to know if the NED's CDB and the device are in sync, before applying new configuration.  
In most cases, `getTransID()` is computed by fetching the entire configuration and applying a hash number on it.  
This could be very time consuming, in case of generic NEDs where large data configuration is fetched from the device.  
For instance, at `commit()`, `getTransID()` is called twice, once before `prepare()` and once after `prepare()`, meaning  
double the time of a `sync-from` command. Since this operation can take hours, the user can disable the `getTransID` computation  
and can keep the partial sync-from feature, using the following ned-setting:

```
admin@ncs(config)# devices device dev-1 ned-settings use-transaction-id false
admin@ncs(config-device-dev-1)# commit
Commit complete.
```

If authentication is done using a certificate, the user can set the following ned-settings:

```
admin@ncs(config-device-dev-1)# ned-settings huawei-nce connection ssl certificate "DER format..."
admin@ncs(config-device-dev-1)# ned-settings huawei-nce connection ssl accept-any true
admin@ncs(config-device-dev-1)# commit
Commit complete.
```

As mentioned above, the `sync-from` may take several hours if the device contains a large amount of data.  
For this case, the NED provides a facility to first fetch only the name of the NE(OLTs), and then the user cand decide,  
using the partial sync-from feature, which OLT configuration to fetch further (please check section 12.9, calls starting from number 2).  
In order to be able to call partial sync-from on "vlans-ne" or "service-ports" (which are children list of OLT), the name of the NE must be  
known(i.e. present into CDB).


This can be achieved using the following ned-setting:

```
admin@ncs(config-device-dev-1)# ned-settings huawei-nce get-ne-data light
admin@ncs(config-device-dev-1)# commit
Commit complete.
admin@ncs(config-device-dev-1)# config
admin@ncs(config-config)# disconnect
admin@ncs(config-config)# sync-from
result true


admin@ncs(config-config)# show full
config
  network-elements OLT1
  !
  network-elements OLT2
  !
  network-elements OLT3
  !
!
```

Once, the basic sync-from is performed, the user must change the 'get-ne-data' ned-setting to the value: "full".
Also, if the sync-from filtering option(please check the 12.10 section) is used, then the 'get-ne-data' parameter must be set to the "full" value as well.

```
admin@ncs(config-device-dev-1)# ned-settings huawei-nce get-ne-data full
admin@ncs(config-device-dev-1)# commit
Commit complete.
admin@ncs(config-device-dev-1)# config
admin@ncs(config-config)# disconnect
admin@ncs(config-device-dev-1)# connect
```

Note:
 - since there are cases when hundreds or thousands of OLTs are present on a huawei-nce controller, the user can disable  
the sync-from operation and use partial sync-from per OLT.

To disable sync-from:

```
admin@ncs(config-device-dev-1)# ned-settings huawei-nce sync-from-disabled-olt-feature true
admin@ncs(config-device-dev-1)# commit
Commit complete.
admin@ncs(config-device-dev-1)# disconnect
admin@ncs(config-device-dev-1)# connect
result true
```

If the OLT name is not present into CDB(as part of a "light" sync-from), the only partial sync-from operation allowed  
in this case is the one that fetches the entire configuration of an OLT:

```
admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/network-elements[name=OLT9002]/ ] 
```

Note:
 - When the sync-from operation is performed, (with or without filtering enabled, i.e. "enable-olt-filtering" enabled, or "get-ne-data" in "full" or "light" format),  
 the related OLTs cards information(product-name and slot) are saved to operational DB. To check those, the user can run the following command:

```
 admin@ncs# show devices device dev-1 platform olt-cards
```

The user can control which API can be used to fetch the authentication token. Both versions are working fine at this moment.

```
admin@ncs(config-device-dev-1)# ned-settings huawei-nce authentication-method ?
Description: choose what API to be used to fetch the token from the device
Possible completions:
  [old] is the default
  new   new API: /rest/plat/smapp/v1/sessions
  old   old API: /rest/plat/smapp/v1/oauth/token
```

Note:
 - `disconnect/connect` operations are required for the ned-settings to be taken into account


## 12.2 Add a vlan to a NE(OLT)
-------------------------------

Example:  
The user must provide the following parameters:

```
admin@ncs(config-vlans-ne-999)# show config
network-elements OLT9002
 vlans-ne 999
  vlanalias    VLANID_999
  vlantype     MUX
  uplinkportfn 0
  uplinkportsn 9
  uplinkportpn 1
  protocolprof srvprof-88
 !
!
```

To check how the command that will be send to the device will look like, the user can use the following:

```
admin@ncs(config-vlans-ne-999)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<IP-address>:<port-number>/rest/v1/resource-activation-configuration/access-legacy/add-vlan
             {
                 "index":{
                     "dev":"OLT9002"
                 },
                 "para":{
                     "vlanid":"999",
                     "vlanalias":"VLANID_999",
                     "vlantype":"MUX",
                     "uplinkportfn":"0",
                     "uplinkportsn":"9",
                     "uplinkportpn":"1",
                     "protocolprof":"srvprof-88"
                 }
             }
    }
}
```

To commit the changes:

```
admin@ncs(config-vlans-ne-999)# commit
Commit complete.
```

Note:
 - currently, there is a bug on the huawei-nce device, and the vlan is not visibile after is added to an OLT.


## 12.3 Associate a vlan to an OLT port
---------------------------------------

Example: associate VLAN 999 on OLT9002 port 0/9/1

```
admin@ncs(config-network-elements-OLT9002)# vlans-ne 999
admin@ncs(config-vlans-ne-999)# vlan-ports 9 0 1

admin@ncs(config-vlans-ne-999)# show config
network-elements OLT9002
 vlans-ne 999
  vlan-ports 9 0 1
 !
!

admin@ncs(config-vlans-ne-999)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<IP-address>:<port-number>/rest/v1/resource-activation-configuration/access-legacy/associate-ethportandvlan
             {
                 "index":{
                     "sn":"9",
                     "fn":"0",
                     "pn":"1",
                     "dev":"OLT9002"
                 },
                 "para":{
                     "vlanid":"999"
                 }
             }
    }
}


admin@ncs(config-vlans-ne-999)# commit
Commit complete.
```

## 12.4 Disassociate a vlan from OLT port
-----------------------------------------

Example: disassociate VLAN 999 on OLT9002 port 0/9/1

```
admin@ncs(config-network-elements-OLT9002)# vlans-ne 999
admin@ncs(config-vlans-ne-999)# no vlan-ports 9 0 1


admin@ncs(config-network-elements-OLT9002)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<IP-address>:<port-number>/rest/v1/resource-activation-configuration/access-legacy/disassociate-ethportandvlan
             {
                 "index":{
                     "dev":"OLT9002",
                     "fn":"0",
                     "sn":"9",
                     "pn":"1"
                 },
                 "para":{
                     "vlanid":"999"
                 }
             }
```

## 12.5 Create a service-port
-----------------------------

Example:

```
admin@ncs(config-config)# network-elements OLT9002
admin@ncs(config-network-elements-OLT9002)# service-ports 999 0 13 20 "999/0_13_20/multi-service VLAN/999"
admin@ncs(config-service-ports-999/0/13/20/999/0_13_20/multi-service VLAN/999)# uplinkport 0/9/1
admin@ncs(config-service-ports-999/0/13/20/999/0_13_20/multi-service VLAN/999)# tagtransform TRANSLATEANDADD
admin@ncs(config-service-ports-999/0/13/20/999/0_13_20/multi-service VLAN/999)# uv 999
admin@ncs(config-service-ports-999/0/13/20/999/0_13_20/multi-service VLAN/999)# rx "SHAP_Wholesale_P2P_DS"
admin@ncs(config-service-ports-999/0/13/20/999/0_13_20/multi-service VLAN/999)# tx "SHAP_Wholesale_P2P_1G_UP"
admin@ncs(config-service-ports-999/0/13/20/999/0_13_20/multi-service VLAN/999)# unkownmultipolicy transparent

admin@ncs(config-network-elements-OLT9002)# show config
network-elements OLT9002
 service-ports 999 0 13 20 "999/0_13_20/multi-service VLAN/999"
  uplinkport        0/9/1
  tagtransform      TRANSLATEANDADD
  uv                999
  rx                SHAP_Wholesale_P2P_DS
  tx                SHAP_Wholesale_P2P_1G_UP
  unkownmultipolicy transparent
 !
!
```

How the payload that will be sent to the device will look like:

```
admin@ncs(config-network-elements-OLT9002)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<IP-address>:<port-number>/rest/v1/resource-activation-configuration/access-legacy/create-serviceport
             {
                 "index":{
                     "fn":"0",
                     "sn":"13",
                     "pn":"20",
                     "dev":"OLT9002"
                 },
                 "para":{
                     "uplinkport":"0/9/1",
                     "tagtransform":3,
                     "uv":"999",
                     "svpid":"999/0_13_20/multi-service VLAN/999",
                     "rx":"SHAP_Wholesale_P2P_DS",
                     "tx":"SHAP_Wholesale_P2P_1G_UP",
                     "unkownmultipolicy":"transparent",
                     "vlanid":"999"
                 }
             }
    }
}

admin@ncs(config-network-elements-OLT9002)# timecmd commit no-overwrite
Commit complete.
```

## 12.6 Modify a service-port
-----------------------------

Example:

```
admin@ncs(config-network-elements-OLT9002)# show config
network-elements OLT9002
 service-ports 999 0 13 20 "999/0_13_20/multi-service VLAN/999"
  uplinkport        0/9/1
  tagtransform      TRANSPARENT
  unkownmultipolicy discard
 !
!
```

How the payload that will be sent to the device will look like:

```
admin@ncs(config-network-elements-OLT9002)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<IP-address>:<port-number>/rest/v1/resource-activation-configuration/access-legacy/modify-serviceport
             {
                 "index":{
                     "fn":"0",
                     "sn":"13",
                     "pn":"20",
                     "dev":"OLT9002"
                 },
                 "para":{
                     "tagtransform":1,
                     "unkownmultipolicy":"discard",
                     "vlanid":"999",
                     "name":"999/0_13_20/multi-service VLAN/999"
                 }
             }
    }
}

admin@ncs(config-network-elements-OLT9002)# timecmd commit no-overwrite
Commit complete.
```


## 12.7 Delete a service-port
-----------------------------

Example:

```
admin@ncs(config-network-elements-OLT9002)# top rollback config
admin@ncs(config-network-elements-OLT9002)# show config
network-elements OLT9002
 no service-ports 999 0 13 20 "999/0_13_20/multi-service VLAN/999"
!

admin@ncs(config-network-elements-OLT9002)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<IP-address>:<port-number>/rest/v1/resource-activation-configuration/access-legacy/delete-serviceport
             {
                 "index":{
                     "fn":"0",
                     "sn":"13",
                     "pn":"20",
                     "dev":"OLT9002"
                 },
                 "para":{
                     "svpid":"999/0_13_20/multi-service VLAN/999",
                     "uv":"999",
                     "vlanid":"999"
                 }
             }
    }
}

admin@ncs(config-network-elements-OLT9002)# commit
Commit complete.
```

## 12.8 Delete a vlan from an OLT
---------------------------------

Example: delete vlan 999 from OLT9002

```
admin@ncs(config-network-elements-OLT9002)# no vlans-ne 999
admin@ncs(config-network-elements-OLT9002)# show config
network-elements OLT9002
 no vlans-ne 999
!

admin@ncs(config-network-elements-OLT9002)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<IP-address>:<port-number>/rest/v1/resource-activation-configuration/access-legacy/delete-vlan
             {
                 "index":{
                     "dev":"OLT9002"
                 },
                 "para":{
                     "vlanid":"999"
                 }
             }
    }
}
```

## 12.9 Partial sync-from support
---------------------------------

Note:  
If the filtering operation is enabled, meaning that the "enable-olt-filtering" ned-setting is set on true and the "filter-by-product-name"  
ned-setting contains a valid "regex", then the partial sync-from operation will be applied only to those entries that meet the above regex pattern.  
For more details about the filtering operation please check the '12.10 sync-from using "product-name" filtering' section.


Examples:

1. fetching the entire configuration of an OLT

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/network-elements[name=OLT9002]/ ]
   sync-result {
       device dev-1
       result true
   }
   ```

When partial-sync from is performed for a specific olt, the related cards are saved(or updated) to the ODB. The user can check the cards using the following command:

```
admin@ncs# show devices device dev-1 platform olt-cards
```

2. fetching all the vlans from a specific OLT

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/network-elements[name=OLT9002]/vlans-ne ]
   sync-result {
       device dev-1
       result true
   }
   ```

3. feching a specific vlan from a specific OLT

   ```
   admin@ncs(config-vlans-ne-4002)# commit no-networking
   Commit complete.
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/network-elements[name=OLT9002]/vlans-ne[vlanid=4002]/ ]
   sync-result {
       device dev-1
       result true
   }
   ```

4. feching all vlan-ports for a specific vlan from a specific OLT

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/network-elements[name=OLT9002]/vlans-ne[vlanid=4002]/vlan-ports ]
   sync-result {
       device dev-1
       result true
   }
   ```


5. feching a vlan-port for a vlan from a specific OLT

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/network-elements[name=OLT9002]/vlans-ne[vlanid=4002]/vlan-ports[fn=0][sn=10][pn=1]/ ]
   sync-result {
       device dev-1
       result true
   }
   ```

6. fetching the service-ports configuration from an OLT

   ```
   admin@ncs(config-config)# top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/network-elements[name=OLT9002]/service-ports ]
   sync-result {
       device dev-1
       result true
   }
   ```

7. fetching a service-port from an OLT

   ```
   admin@ncs(config-config)#top devices partial-sync-from path [ /devices/device[name=dev-1]/config/top/network-elements[name=OLT9002]/service-ports[vlanid=4016][fn=0][sn=13][pn=11][svpid="4016/0_13_11/Multi-Service\ VLAN/4016"] ]
   sync-result {
       device dev-1
       result true
   }
   ```

## 12.10 sync-from using "product-name" filtering
------------------------------------------------

The sync-from operation can take a lot of time when there is a large number of NEs(OLTs) devices present  
on the huawei-nce device. The user can filter which data to be fetched from the device using a regex  
for "product-name" field. This field is part of the response of the "v2/data/huawei-nce-resource-inventory:cards" API.

In order to enable the filtering operation the user must enable the following ned-settings:

```
1. admin@ncs(config-device-dev-1)# ned-settings huawei-nce enable-olt-filtering true  
2. admin@ncs(config-device-dev-1)# ned-settings huawei-nce filter-by-product-name "regex"
```

Example:

```
admin@ncs(config-device-dev-1)# ned-settings huawei-nce filter-by-product-name "H901MPLA.*"
admin@ncs(config-device-dev-1)# commit
Commit complete.
admin@ncs(config-device-dev-1)# disconnect
```

The NED filters all the entries from "v2/data/huawei-nce-resource-inventory:cards", with the "product-name"  
that contains the regex above ("H901MPLA.\*") and fetches the related frame-number(fn) and slot-number(sn).  
Since the .* consumes everything after it, the regex will match the entire line. For instance, if the regex has  
the following format: "H\d{3}OGHK", the match will occur if the product-name contains that string, no matter if is before or after it.  
Then, at sync-from, the NED fetches configuration("vlans-ne" and "service-ports") from all OLTs that have a product-name matching the regex.


## 12.11 tail-f action to fetch OLTs' status
---------------------------------------------

For situations where there is a large number of OLTs onboarded on the NCE controller, hundreds or even thousands and only a part of them have been fetched to CDB,  
the user has the option to check which new OLTs have been added in the controller or which OLTs have been removed from the controller, but still exist in the current CDB.

The user can use the following action:

```
admin@ncs(config)# devices device dev-1 live-status exec get-olts-status
result OK. Please check the data from platform/olt-status-action.
admin@ncs(config)#
```

To check the output, the user can verify the data below:

```
admin@ncs# show devices device dev-1 platform olt-status-action
platform olt-status-action new-olts OLT9003
platform olt-status-action new-olts OLT9005
platform olt-status-action removed-olts OLT9010
platform olt-status-action removed-olts OLT9011
```

"new-olts" list refers to the OLTS that are not present in the current CDB, but exist in the NCE controller. To fetch a new OLT, the user can call the partial sync-from command  
as described in the 12.9 section, example 1. fetching the entire configuration of an OLT.

"removed-olts" list refers to the OLTs that exist in the current CDB, but have been removed from the NCE controller. In order to remove an OLT that doesn't exist any more in  
the NCE controller, the user can issue this command:

```
admin@ncs(config-config)# no network-elements OLT9010
admin@ncs(config-config)# commit no-networking
Commit complete.
```
