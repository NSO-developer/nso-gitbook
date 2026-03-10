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
     5.1 get-any
     5.2 get-domain-switch-structure
     5.3 deploy-domain-profile
     5.4 get-vnic-nw-group-policy-structure
     5.5 deploy-server-profile
     5.6 Deploy workflow
  6. Built in live-status show
  7. Limitations
  8. How to report NED issues and feature requests
  9. How to rebuild a NED
  10. Mandatory ned-settings to connect to a Cisco Intersight device
  11. Configuration supported by the NED
      11.1 Overview
      11.2 Update Eth Network Policy
         11.2.1. Add a vlan
         11.2.2. Update a vlan
         11.2.3. Delete a vlan
      11.3 Update Eth Network Group
         11.3.1. Update group with new vlans
  ```


# 1. General
------------

  This document describes the cisco-intersight NED.

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
  | netsim                    | yes       |                                                                  |
  |                           |           |                                                                  |
  | check-sync                | yes       |                                                                  |
  |                           |           |                                                                  |
  | partial-sync-from         | no        |                                                                  |
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
  +-------+---------+----+------+
  | Model | Version | OS | Info |
  +-------+---------+----+------+
  +-------+---------+----+------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-intersight-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-intersight-1.0.1.signed.bin
      > ./ncs-6.0-cisco-intersight-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-intersight-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-intersight-1.0.1.tar.gz
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
     `cisco-intersight-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-intersight-1.0.1.tar.gz
     > ls -d */
     cisco-intersight-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-intersight-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-intersight-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-intersight-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-intersight-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/cisco-intersight-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-intersight-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-intersight-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-intersight-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-intersight-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-intersight-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id cisco-intersight-gen-1.0
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

  `$NSO_RUNDIR/logs/ned-cisco-intersight-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-intersight logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-intersight logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.ciscointersight \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-intersight logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-intersight logger java true
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

  Adding a Vlan under Eth Network Policy:

  ```
  admin@ncs(config-config)# fabric eth-network-policy VLAN_Policy
  admin@ncs(config-eth-network-policy-VLAN_Policy)# vlan 2234
  admin@ncs(config-vlan-2234)# name vlan-2234
  admin@ncs(config-vlan-2234)# is-native false
  admin@ncs(config-vlan-2234)# sharing-type None
  admin@ncs(config-vlan-2234)# multicast-policy default
  admin@ncs(config-vlan-2234)# primary-vlan-id 0
  admin@ncs(config-vlan-2234)# auto-allow-on-uplinks true
  admin@ncs(config-vlan-2234)# exit
  admin@ncs(config-config)# 

  admin@ncs(config-vlan-2234)# show config
  fabric eth-network-policy VLAN_Policy
   vlan 2234
    name                  vlan-2234
    is-native             false
    sharing-type          None
    multicast-policy      default
    primary-vlan-id       0
    auto-allow-on-uplinks true
   !
  !
  ```

  Inspecting the payload that will be sent to the device:

  ```
  admin@ncs(config-vlan-2234)# commit dry-run outformat native
  native {
      device {
          name dev-1
          data POST https://<hostname>:<port>/api/v1/bulk/Requests
               {
                   "Verb":"POST",
                   "Uri":"/v1/fabric/Vlans",
                   "ActionOnError":"Stop",
                   "Requests":[{
                       "ObjectType":"bulk.RestSubRequest",
                       "Body":{
                           "EthNetworkPolicy":"692d76096f62693005fbde9a",
                           "VlanId":2234,
                           "Name":"vlan-2234",
                           "IsNative":false,
                           "MulticastPolicy":"692dacd26f6269300500e5c1",
                           "AutoAllowOnUplinks":true,
                           "PrimaryVlanId":0,
                           "SharingType":"None"
                       }
                   }]
               }
      }
  }
  ```

  Commit the configuration:

  ```
  admin@ncs(config-vlan-2234)# commit
  Commit complete.
  ```


# 5. Built in live-status actions
---------------------------------

  The NED supports several live-status commands for managing Cisco Intersight resources. These commands allow real-time querying  
  and deployment operations without modifying the NSO configuration database.

  ### Available Commands:
  - `get-any` - Query GET API and returns pretty-printed JSON response
  - `get-domain-switch-structure` - Query domain/switch hierarchy
  - `deploy-domain-profile` - Deploy VLAN policies to switches
  - `get-vnic-nw-group-policy-structure` - Query vNIC/server/ENG/sever-profile relationships
  - `deploy-server-profile` - Deploy server profiles


  ## 5.1 get-any
  ---------------

  **Purpose**: Retrieve raw data from any Intersight API endpoint with optional query parameters.

  **Parameters**:
   - url (required): The API endpoint path (must start with /)  
   - query (optional): Data query string for filtering, selecting fields, expanding relationships, etc.

  **Returns**: Pretty-printed JSON response from the API.

  Examples:

  1. simple request with url, no query  
  The response can be large, so it's better to be saved in a file:

  ```
  admin@ncs(config)# devices device dev-1 live-status exec get-any url /v1/compute/PhysicalSummaries | save output.txt
  ```

  2. same request with url, and multiple queries

  ```
  admin@ncs(config)# devices device dev-1 live-status exec get-any url /v1/compute/PhysicalSummaries query "$top=1&$select=Name"
  result {
      "ObjectType":"compute.PhysicalSummary.List",
      "Results":[{
          "ClassId":"compute.PhysicalSummary",
          "Moid":"6515554a61711135010e96d9",
          "Name":"int-tme-ucs-10-1-2",
          "ObjectType":"compute.PhysicalSummary"
      }]

  ```

  3. same query, but with expand, select and filter queries

  ```
  admin@ncs(config)# devices device dev-1 live-status exec get-any url /v1/compute/PhysicalSummaries query "$filter=Moid eq '6515914a61767535010e96d9'&$select=Name,InventoryParent&$expand=InventoryParent($select=Name)"
  result {
      "ObjectType":"compute.PhysicalSummary.List",
      "Results":[{
          "ClassId":"compute.PhysicalSummary",
          "InventoryParent":{
              "ClassId":"equipment.Chassis",
              "Moid":"65158f4161767535010d895e",
              "Name":"int-tme-ucs-10-1",
              "ObjectType":"equipment.Chassis"
          },
          "Moid":"6515914a61767535010e96d9",
          "Name":"int-tme-ucs-10-1-2",
          "ObjectType":"compute.PhysicalSummary"
      }]
  }
  ```


  ## 5.2 get-domain-switch-structure
  -----------------------------------

  **Purpose**: Display the hierarchical structure of Domain Profiles and their associated Switch Profiles with VLAN policies.  
  This is useful when the user wants to check if there are Pending-changes on Switches, following the updates from the related VLAN policies.


  Example:

  ```
  admin@ncs(config)# devices device dev-1 live-status exec get-domain-switch-structure
  result {
      "Domain-Switch-Structure":[{
          "domain-Name":"domain-1",
          "moid":"65b8f4b0656e6f3201311111",
          "deployStatus":"Complete",
          "deployedSwitches":"AB",
          "switchVlanPolicyList":[{
              "switch-Name":"domain-1-A",
              "switch-Moid":"65b8f4b1656e6f3201312222",
              "vlan-Policy-Moid":"65b8f6166f62693001fb3333",
              "vlan-Policy-Name":"VLAN-POL-1-A",
              "config-State":"Associated"
          },{
              "switch-Name":"domain-1-B",
              "switch-Moid":"65b8f4b2656e6f3201314444",
              "vlan-Policy-Moid":"65b8f6866f62693001fc5555",
              "vlan-Policy-Name":"VLAN-POL-1-B",
              "config-State":"Associated"
          }]
      }]
  }
  ```

  For instance, the above configuration shows that both Switches are in "Associated" state.  
  The `config-state` field indicates whether a switch requires deployment:
  - Associated: The switch configuration matches the VLAN policy.
  - Pending-changes: The VLAN policy has been modified but not yet deployed to this switch. Deployment required.

  The configuration state changes to "Pending-changes" when:
   - the user modifies a VLAN policy (add/delete/update VLANs, i.e. "fabric eth-network-policy VLAN-POL-1-A(or VLAN-POL-1-B")
   - the modified VLAN policy is associated with a switch
   - the changes have not yet been deployed to that switch

  Example:

  Adding a vlan id 500 to VLAN-POL-1-A:

  ```
  admin@ncs(config-config)# show config
  fabric eth-network-policy VLAN-POL-1-A
   vlan 500
    name                  vlan-500
    is-native             false
    sharing-type          None
    multicast-policy      default
    primary-vlan-id       0
    auto-allow-on-uplinks true
   exit

  admin@ncs(config-config)# commit
  Commit complete.
  ```

  Since there are different VLAN policies(VLAN-POL-1-A and VLAN-POL-1-B) attached to Switches, and only VLAN-POL-1-A is modified,  
  running again the 'get-domain-switch-structure' shows that only that "config-State" of the related Switch changed to "Pending-changes":

  ```
  admin@ncs(config)# devices device dev-1 live-status exec get-domain-switch-structure
  result {
      "Domain-Switch-Structure":[{
          "domain-Name":"domain-1",
          "moid":"65b8f4b0656e6f3201311111",
          "deployStatus":"Complete",
          "deployedSwitches":"AB",
          "switchVlanPolicyList":[{
              "switch-Name":"domain-1-A",
              "switch-Moid":"65b8f4b1656e6f3201312222",
              "vlan-Policy-Moid":"65b8f6166f62693001fb3333",
              "vlan-Policy-Name":"VLAN-POL-1-A",
              "config-State":"Pending-changes"
          },{
              "switch-Name":"domain-1-B",
              "switch-Moid":"65b8f4b2656e6f3201314444",
              "vlan-Policy-Moid":"65b8f6866f62693001fc5555",
              "vlan-Policy-Name":"VLAN-POL-1-B",
              "config-State":"Associated"
          }]
      }]
  }
  ```

   Note:
   - even if a Switch has "config-State":"Associated", the deploy is still alowed on that Switch, if required by the user.  
   - if the user modifies a VLAN policy that is associated to both Switches, the "config-State" of both Switches changes to "Pending-changes".


  ## 5.3 deploy-domain-profile
  -----------------------------

  **Purpose**: Deploy VLAN policies to Domain Profiles and their associated switches.

  **Parameters**:
   - vlan-policy-name (required): one or multiple VLAN policy names(separated by space) required to deploy  
   - domain-name (required): list Domain profile name (each domain-name has its own vlan-policy-name)

  **Process**:
   - Validates that all requested VLAN policies and Domain Profiles exist on the device
   - Matches VLAN policies with switches in the domains
   - Triggers deployment for all matching switches
   - Waits for all workflows to complete
   - Verifies workflow completion status once they are ready

  **Returns**:
   - Deployment summary with status for each switch, including:
   - Success/Fail overall status
   - Deployment details per switch
   - Workflow completion status
   - Error messages (if any)

  Examples:

  1. wrong VLAN policy input

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-domain-profile domain-name { name dom1 vlan-policy-name [ vlan1 ] }
  result Error executing command deploy-domain-profile:
  Vlan policy(ies) not found on the device: vlan1
  ```

  2. wrong Domain Profile name input

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-domain-profile domain-name { name dom1 vlan-policy-name [ VLAN-POL-1-A ] }
  result Error executing command deploy-domain-profile:
  Domain profile(s) not found on the device: dom1
  admin@ncs(config)#
  ```

  3. user requires a deploy on the Switch 'domain-1-B', that has "config-State":"Associated". This is permitted by the device.

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-domain-profile domain-name { name domain-1 vlan-policy-name [ VLAN-POL-1-B ] }
  result Success
  Deployments finished. Summary:
          Skipping deployment to Switch 'domain-1-A' from Domain 'domain-1', since the Switch has a different VLAN policy moid(65b8f4b1656e6f3201312222) than requested.
          Successfully deployed to Switch 'domain-1-B' from Domain 'domain-1'
  ```

  4. user requires a deploy on the Switch 'domain-1-A' that has "config-State":"Pending-changes".  
  If the deployment is successfull, then "config-State" changes to "Associated". The user can also call for the "get-domain-switch-structure" action.

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-domain-profile domain-name { name domain-1 vlan-policy-name [ VLAN-POL-1-A ] }
  result Success
  Deployments finished. Summary:
          Skipping deployment to Switch 'domain-1-B' from Domain 'domain-1', since the Switch has a different VLAN policy moid(65b8f6866f62693001fc5555) than requested.
          Successfully deployed to Switch 'domain-1-A' from Domain 'domain-1'
  ```

  5. deploy to both Switches from a Domain

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-domain-profile domain-name { name domain-1 vlan-policy-name [ VLAN-POL-1-A VLAN-POL-1-B ] }
  result Success
  Deployments finished. Summary:
          Successfully deployed to Switch 'domain-1-A' from Domain 'domain-1'
          Successfully deployed to Switch 'domain-1-B' from Domain 'domain-1'
  ```

  6. deploy to 2 different domains with 4 different VLAN policies

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-domain-profile domain-name { name domain-1 vlan-policy-name [ VLAN-POL-1-A VLAN-POL-1-B ] } {name domain-2 vlan-policy-name [ VLAN-POL-1-C VLAN-POL-1-D ]}
  ```



  ## 5.4 get-vnic-nw-group-policy-structure
  -----------------------------------------

  **Purpose**: Display the complete hierarchical structure of vNICs, Ethernet Network Group Policies and Server Profiles.

  **Parameters**:
   - format (optional): Use "own" for a custom formatted structure, or omit for raw API response (device native format)

  **Returns**: JSON structure showing:

   - vNIC name and Moid
   - Associated LAN Connectivity Policy
   - Ethernet Network Group Policies assigned to the vNIC
   - Server Profiles using this vNIC, including:
      - Server Profile name and Moid
      - Server Template information
      - Assigned physical server details
      - Pending changes status

  Example:

  1. using the "native" format of the device

  ```
  admin@ncs(config)# devices device dev-1 live-status exec get-vnic-nw-group-policy-structure (no parameter or with "format native")
  result {
      "ObjectType":"vnic.EthIf.List",
      "Results":[{
          "ClassId":"vnic.EthIf",
          "DomainGroupMoid":"636d24f77564612d5566a70f",
          "FabricEthNetworkGroupPolicy":[{
              "ClassId":"fabric.EthNetworkGroupPolicy",
              "Moid":"65b1111a6f626930015c49ee",
              "Name":"Management",
              "ObjectType":"fabric.EthNetworkGroupPolicy"
          }],
          "LanConnectivityPolicy":{
              "ClassId":"vnic.LanConnectivityPolicy",
              "Moid":"65ba32b67eb678910101a3f8",
              "Name":"OCP-VIRT",
              "ObjectType":"vnic.LanConnectivityPolicy",
              "Profiles":[{
                  "ClassId":"server.ProfileTemplate",
                  "ConfigContext":{
                      "ClassId":"policy.ConfigContext",
                      "ConfigState":"",
                      "ConfigStateSummary":"None",
                      "ConfigType":"",
                      "ControlAction":"",
                      "ErrorState":"",
                      "InconsistencyReason":[],
                      "ObjectType":"policy.ConfigContext",
                      "OperState":""
                  },
                  "Moid":"65ba336f77696e32015f8800",
                  "Name":"OCP",
                  "ObjectType":"server.ProfileTemplate"
              },{
                  "AssignedServer":{
                      "ClassId":"compute.Blade",
                      "Moid":"6515914a61767535010e97ba",
                      "Name":"server-1-2-3",        => name of the server that uses Server Profile
                      "ObjectType":"compute.Blade"
                  },
                  "AssociatedServer":{
                      "ClassId":"mo.MoRef",
                      "Moid":"6515914a61767535010e97ba",
                      "ObjectType":"compute.Blade",
                      "link":"https://region.intersight.com/api/v1/compute/Blades/6515914a61723415010e97ba"
                  },
                  "ClassId":"server.Profile",
                  "ConfigContext":{
                      "ClassId":"policy.ConfigContext",
                      "ConfigState":"Pending-changes",
                      "ConfigStateSummary":"Inconsistent",
                      "ConfigType":"",
                      "ControlAction":"No-op",
                      "ErrorState":"",
                      "InconsistencyReason":["Pending-changes"],
                      "ObjectType":"policy.ConfigContext",
                      "OperState":"Ok"
                  },
                  "Moid":"66793b22776123420157c87f",  => Server Profile Moid
                  "Name":"OCP-TEST-3",                => Server Profile name
                  "ObjectType":"server.Profile"
              }
          ]}
          "Moid":"65ba331678998ea10101d2e0",
          "Name":"MGMT",                              => name of the vNIC
          "ObjectType":"vnic.EthIf",
          "Placement":{
              "ClassId":"vnic.PlacementSettings",
              "ObjectType":"vnic.PlacementSettings",
              "AutoPciLink":false,
              "AutoSlotId":false,
              "Id":"",
              "PciLink":0,
              "PciLinkAssignmentMode":"Custom",
              "SwitchId":"A",
              "Uplink":0
          }
      }
  ```

  2. using the "own" format of the device, the configuration from previous example, becomes:

  ```
  admin@ncs(config)# devices device dev-1 live-status exec get-vnic-nw-group-policy-structure format own
  result {
      "vnic-structure":[{
          "vnicMoid":"65ba331678998ea10101d2e0",
          "vnicName":"MGMT",
          "lanConnectivityPolicyName":"OCP-VIRT",
          "lanConnectivityPolicyMoid":"65ba32b67eb98ea10101a3f8",
          "networkGroupPolicies":[{
              "name":"Management",
              "moid":"65b1111a6f626930015c49ee"
          }],
          "serverProfiles":[{
              "profileName":"OCP-TEST-3",
              "profileMoid":"66793b22776123420157c87f",
              "templateName":"OCP",
              "templateMoid":"65ba336f7769e222015f8800",
              "assignedServerName":"server-1-2-3",
              "assignedServerMoid":"6515914a61767535010e97ba",
              "pendingChanges":true
          }]
      }
  ```


  ## 5.5 deploy-server-profile
  ----------------------------

  **Purpose**: Deploy Server Profiles based on vNIC, Ethernet Network Group Policy associations and belonging to the domain.

  **Parameters**:
   - vnic-moid (required): One or more vNIC entries, each containing:
     - moid (required): vNIC Moid identifier
     - nw-group-policy-name (required, one or multiple): Ethernet Network Group Policy names to match
     - server-profile (optional, multiple): Specific Server Profile names to deploy. If omitted, all profiles using this vNIC/ENG combination from the request domain(s) will be deployed
     - domain-name (required): one or space-separated list of domain names to verify the belonging of the server profiles

  **Process**:
   - Validates input (at least one vNIC with one ENG policy)
   - Builds device structure hierarchy (vNIC → ENG → Server Profiles)
   - Filters to match only requested vNICs, ENGs and Server Profiles from the requested domains
   - Validates all requested resources exist
   - Triggers deployment for all matching Server Profiles
   - Waits for all workflows to complete
   - Verifies workflow completion status

  **Returns**: Deployment summary with status for each Server Profile, including:
   - Success/Fail overall status (if Fail, the user can check the deployment status using the 'get-vnic-nw-group-policy-structure' action)
   - Deployment details per Server Profile
   - Workflow completion status
   - Error messages (if any)

  **Important Notes**:
   - vNIC Moid must be used (not name) because multiple vNICs can have identical names across different LAN Connectivity Policies
   - Server Profile deployment can be called even if Domain Profiles have pending changes (when the Vlan IDs has been removed from ENG and from  
   related VLAN policies)
   - Each vNIC must have at least one ENG policy specified

  Examples:

  1. missing domain name from the device

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-server-profile vnic-moid { moid 65ba331b7eb98ea10101d2e0 nw-group-policy-name [ Management ] server-profile [ OCP-TEST-33 ] domain-name [ domain-100 ] }
  result Error executing command deploy-server-profile:
  The following domain(s) were not found on the device: domain-100
  ```

  2. if "server-profile" is present, the deployment is only done for the mentioned server profiles, if those exist

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-server-profile vnic-moid { moid 65ba331b7eb98ea10101d2e0 nw-group-policy-name [ Management ] server-profile [ OCP-TEST-33 ] domain-name [ domain-1 ] }
  result Error executing command deploy-server-profile:
  The requested server profile(s): 'OCP-TEST-33' were not found on the device for the provided vNIC moid: '65ba331b7eb98ea10101d2e0'.
  ```

  3. the requested Ethernet Network Group is missing from the requested vNIC

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-server-profile vnic-moid { moid 65ba331b7eb98ea10101d2e0 nw-group-policy-name [ Managemen ] server-profile [ OCP-TEST-3 ] domain-name [ domain-1 ] }
  result Error executing command deploy-server-profile:
  The requested network group policy(ies): 'Managemen' were not found on the device for the provided vNIC moid: '65ba331b7eb98ea10101d2e0'.
  ```

  4. the vNIC moid is not present on the device

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-server-profile vnic-moid { moid 65ba331b7eb98ea10101ee0 nw-group-policy-name [ Management ] server-profile [ OCP-TEST-3 ] domain-name [ domain-1 ] }
  result Error executing command deploy-server-profile:
  No matching vNIC(s) found on the device for the provided vnic-moid(s): '[65ba331b7eb98ea10101ee0]'
  ```

  5. successfull deploy to the the all server-profiles

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-server-profile vnic-moid { moid 65ba331b7eb98ea10101d2e0 nw-group-policy-name [ Management ] domain-name [ domain-1 ] }
  result Success
  Deployments finished. Summary:
          Successfully deployed to Server 'OCP-TEST-3'
          Successfully deployed to Server 'OCP-TEST-4'
          Successfully deployed to Server 'OCP-TEST-5'
  ```


  ## 5.6 Deploy workflow
  ----------------------

  After adding/modifying a VLAN ID to a VLAN policy, the user can deploy the VLAN policy to the Domain profile.  
  If a VLAN ID has been added to the "allowed-vlans" list from an Ethernet Network Group(ENG), that VLAN ID must be part of the VLAN policies associated  
  to the Domain Profile Switches.  
  If the vNIC(that has the updated ENG) has Failover enabled, then the allowed VLAN ID must be added in both VLAN Policies(if the 2 switches from that domain use different VLAN polices).

  In this case, the deploy order is:
   - Deploy the Domain Profile
   - Deploy the Server Profile

  If a VLAND ID is deleted from "allowed-vlans" list, from an Ethernet Network Group(ENG), that VLAN ID must be deleted from the VLAN polices as well.

  In this case, the deploy order is:
   - Deploy All the Server Profiles that have "config-State"="Pending-changes" (found with 'get-vnic-nw-group-policy-structure' action)
   - Deploy the Domain Profile

  **Example 1**: Deploy Domain Profile and Server Profile

  Step 1:

  ```
  admin@ncs(config-config)# show config
  fabric eth-network-policy VLAN-POL-1-A
   vlan 502
    name                  vlan-502
    is-native             false
    sharing-type          None
    multicast-policy      default
    primary-vlan-id       0
    auto-allow-on-uplinks true
   !
  !
  fabric eth-network-policy VLAN-POL-1-B
   vlan 502
    name                  vlan-502
    is-native             false
    sharing-type          None
    multicast-policy      default
    primary-vlan-id       0
    auto-allow-on-uplinks true
   !
  !
  fabric eth-network-group-policies Management
   vlan-settings allowed-vlans 502
  !
  admin@ncs(config-config)# commit
  Commit complete.
  ```

  Step 2:

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-domain-profile domain-name { name domain-1 vlan-policy-name [ VLAN-POL-1-A VLAN-POL-1-B ] }
  result Success
  Deployments finished. Summary:
          Successfully deployed to Switch 'domain-1-A' from Domain 'domain-1'
          Successfully deployed to Switch 'domain-1-B' from Domain 'domain-1'
  ```

  Step 3:

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-server-profile vnic-moid { moid 65ba331b7eb98ea10101d2e0 nw-group-policy-name [ Management ] server-profile [ OCP-TEST-3 ] domain-name [ domain-1 ] }
  result Success
  Deployments finished. Summary:
          Successfully deployed to Server 'OCP-TEST-3'
  ```



  **Example 2**: Deploy Server Profile and Domain Profile

  Step 1:

  ```
  admin@ncs(config-config)# top rollback configuration
  admin@ncs(config-config)# show config
  abric eth-network-policy VLAN-POL-1-A
   no vlan 502
  !
  fabric eth-network-policy VLAN-POL-1-B
   no vlan 502
  !
  fabric eth-network-group-policies Management
   no vlan-settings allowed-vlans 502
  !
  admin@ncs(config-config)# commit
  Commit complete.
  ```

  Step 2:

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-server-profile vnic-moid { moid 65ba331b7eb98ea10101d2e0 nw-group-policy-name [ Management ] server-profile [ OCP-TEST-3 ] domain-name [ domain-1 ] }
  result Success
  Deployments finished. Summary:
          Successfully deployed to Server 'OCP-TEST-3'
  ```

  Step 3:

  ```
  admin@ncs(config)# devices device dev-1 live-status exec deploy-domain-profile domain-name { name domain-1 vlan-policy-name [ VLAN-POL-1-A VLAN-POL-1-B ] }
  result Success
  Deployments finished. Summary:
          Successfully deployed to Switch 'domain-1-A' from Domain 'domain-1'
          Successfully deployed to Switch 'domain-1-B' from Domain 'domain-1'
  ```


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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-intersight logging level debug
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


# 10. Mandatory ned-settings to connect to a Cisco Intersight device
--------------------------------------------------------------------

The user must configure the following three mandatory NED settings when :

## Required Settings

 ### 1. access-key-id (API key ID)
- **Purpose**: Public identifier for your Intersight API credentials, which is always visible after initial key generation in the device's UI
- **Description**: This ID is included in the HTTP Authorization header of every API request
- **Format**: String value (e.g., `5a3404ac3768393836093cab/5b02fa7e6a70d3567048237c/5b02fa716a70d3567048237a`)
- **Security**: Safe to display/log - acts as a username

 ### 2. access-secret-key
- **Purpose**: Private cryptographic key used to digitally sign API requests
- **Description**: Contains the RSA or ECDSA private key in PEM format. This key is used to generate signatures  
    that authenticate requests without exposing the key itself
- **Format**: Base64-encoded PEM key (with or without headers). The user must insert here the value from the SecretKey.txt file, created when the user  
    generated a key in the Cisco Intersight UI. The value must be on a single row, without spaces.
- **Security**: This is never transmitted over the network, and for security reasons it is displayed encripted in ned-settings

 ### 3. user-role
- **Purpose**: Specifies the user role for device operations, like: guest, admin
- **Description**: Defines the privilege level for the NED session
- **Required**: Yes - connection towards device will fail if not provided


## Example of configuring ned-settings

```
admin@ncs(config-device-dev-1)# ned-settings cisco-intersight access-key-id 671235dd7568765105bf3dc7/692ec2d47564613005c0bb9c/693071da7564645675c0e2b2
admin@ncs(config-device-dev-1)# ned-settings cisco-intersight access-secret-key "-----BEGIN EC PRIVATE KEY-----MIGHAgEAMBMGByqG...value-on-single-row.../..../...-----END EC PRIVATE KEY-----"
admin@ncs(config-device-dev-1)# ned-settings cisco-intersight user-role guest
admin@ncs(config-device-dev-1)# commit
Commit complete.
admin@ncs(config-device-dev-1)# disconnect
admin@ncs(config-device-dev-1)# connect
```

## Example of how the ned-settings commands above are displayed

```
admin@ncs(config-device-dev-1)# show full ned-settings
ned-settings cisco-intersight connection ssl accept-any true
ned-settings cisco-intersight access-key-id 671235dd7568765105bf3dc7/692ec2d47564613005c0bb9c/693071da7564645675c0e2b2
ned-settings cisco-intersight access-secret-key "$8$Is2VOtOxbFlkAkSDZlypCd0K9JgggYS8kBQlbgJnA1DY8IhSaNFo5F6Hkz3X374WeWZfPpu4\nqw1Nkxr4WV61iftCMC++mCT0tEKfXi4tKoONwsMLUpAdQKM4RWmx0FmZOX67lvfOf8s1W+lX\nj7mt9pCGUPD++6kAkX7+V7qoCVnh5q3zywB+VhcLp5zmMjJz9pORF08spSLES3BdxEgVbz4e\npLm+WKxGFSAEQ3CXfO4whL+36x67rAKLndQBVgizMq0KXvpqTqm4zD8gfAdPQK+RHeQWnYEN\nWfwKryBnZLlYchrb6Spk7xv/yto9Oblazxl7J/MymS6ofP+1R1aGM709Kuws8PJpjn0Y8sKX\nNqc="
ned-settings cisco-intersight user-role guest
```

## How to Generate API Keys

1. Log in to Cisco Intersight device
2. Navigate to **Settings** → **API Keys**
3. Click **Generate API Key**
4. Provide a description
5. Download the **Secret Key** file (keep it secure!)
6. Copy the **API Key ID** from the Intersight UI
7. Configure both values in your NED settings


# 11. Configuration supported by the NED
----------------------------------------

## 11.1 Overview
----------------

This Network Element Driver (NED) enables Cisco NSO to manage Cisco Intersight infrastructure through its REST API.  
The NED implements a generic REST-based approach for configuration management and monitoring.


## Key Features

### Authentication
- **HTTP Signature Authentication**: Implements Cisco Intersight's signature-based authentication scheme
- **API Key Pair**: Uses a public API Key ID and private Secret Key (RSA/ECDSA)
- **Secure Credential Handling**: Private keys are encrypted in NED settings and never transmitted
- **Role-Based Access**: Supports admin/guest user roles  

**Required NED Settings:**
- `access-key-id` - Public identifier for Intersight API credentials
- `access-secret-key` - Encrypted private cryptographic key for signing requests
- `user-role` - User privilege level (`admin` or `guest`)  
For more details, please check section "10. Mandatory ned-settings to connect to a Cisco Intersight device".

### Configuration Synchronization
- **Automatic Pagination**: The NED handles large datasets(more than 1000 entries per API response) by automatically fetching results in batches
- **Configurable Fetch Limits**: Controls the number of entries retrieved per API call
- **Operational Data Tracking**: Maintains MOID (Managed Object ID) mappings in ODB operational datastore
- **User-Specific Data Filtering**: Option to sync only configuration for the authenticated user

**Related NED Settings:**
- `fetch-max-nb-entries` - Maximum number of entries to fetch per pagination request (default: 1000)
- `keep-data-specific-user` - Boolean flag to filter configuration by authenticated user only (default is false)

### Bulk Operations
- **Bulk Request Support**: Groups multiple operations (CREATE/UPDATE/DELETE) into single API calls for optimization(reduces API calls)
- **Operation Batching**: Automatically batches up to 100 operations per bulk request
- **Priority-Based Ordering**: Reorders operations based on dependencies (e.g., VLANs: DELETE → CREATE → PATCH)
- **Consolidation**: Merges consecutive bulk-compatible operations to maximize efficiency

**Note:** Bulk operation behavior is automatic and requires no additional configuration.

Generic example of configuring a NED from ncs_cli: 

```
admin@ncs(config-device-dev-1)# show full
devices device dev-1
 address   <Hostname>
 port      <Port>
 authgroup inter-group
 device-type generic ned-id cisco-intersight-gen-1.0
 trace     raw
 ned-settings use-transaction-id false
 ned-settings cisco-intersight connection ssl accept-any true
 ned-settings cisco-intersight access-key-id 671235dd7568765105bf3dc7/692ec2d47564613005c0bb9c/693071da7564645675c0e2b2
 ned-settings cisco-intersight access-secret-key "-----BEGIN EC PRIVATE KEY-----MIGHAgEAMBMGByqG...value-on-single-row.../..../...-----END EC PRIVATE KEY-----"
 ned-settings cisco-intersight user-role guest
 ned-settings cisco-intersight keep-data-specific-user false
 ned-settings cisco-intersight use-hostname-for-connection true
 ned-settings cisco-intersight debugFlag false
 state admin-state unlocked
 ```

Note: Hostname must be the regional address the user sees when he finally logins to the Intersight dashboard  
(e.g. eu-central-1.intersight.com or us-east-1.intersight.com).

As described in section 2. Optional debug and trace setup, the user can set the following ned-settings for debugging:

```
admin@ncs(config)# devices device dev-1 ned-settings cisco-intersight logger level debug
admin@ncs(config)# devices device dev-1 trace raw
admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.ciscointersight level level-all
admin@ncs(config)# devices device dev-1 ned-settings cisco-intersight logger java true
admin@ncs(config)# commit
```

getTransID() is used to know if the NED's CDB and the device are in sync, before applying new configuration. In most cases, getTransID()  
is computed by fetching the entire configuration and applying a hash number on it. This could be very time consuming, in case of generic  
NEDs where large data configuration is fetched from the device. For instance, at commit(), getTransID() is called twice, once before prepare()  
and once after prepare(), meaning double the time of a sync-from command. The user can disable the getTransID computation using the following ned-setting:

```
admin@ncs(config)# devices device dev-1 ned-settings use-transaction-id false
admin@ncs(config-device-dev-1)# commit
Commit complete.
```

Note: if 'use-transaction-id' is set to false, the 'check-sync' command returns: result unsupported.

## 11.2 Update Eth Network Policy
---------------------------------

### 11.2.1 Add a vlan
---------------------
Example:

```
admin@ncs(config-config)# fabric eth-network-policy VLAN_Policy
admin@ncs(config-eth-network-policy-VLAN_Policy)# vlan 2501
admin@ncs(config-vlan-2501)# name vlan-2501
admin@ncs(config-vlan-2501)# is-native false
admin@ncs(config-vlan-2501)# sharing-type None
admin@ncs(config-vlan-2501)# multicast-policy default
admin@ncs(config-vlan-2501)# primary-vlan-id 0
admin@ncs(config-vlan-2501)# auto-allow-on-uplinks true
admin@ncs(config-vlan-2501)# exit
admin@ncs(config-eth-network-policy-VLAN_Policy)# exit

admin@ncs(config-config)# show config
fabric eth-network-policy VLAN_Policy
 vlan 2501
  name                  vlan-2501
  is-native             false
  sharing-type          None
  multicast-policy      default
  primary-vlan-id       0
  auto-allow-on-uplinks true
 !
!
admin@ncs(config-config)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<Hostname>:<Port>/api/v1/bulk/Requests
             {
                 "Verb":"POST",
                 "Uri":"/v1/fabric/Vlans",
                 "ActionOnError":"Stop",
                 "Requests":[{
                     "ObjectType":"bulk.RestSubRequest",
                     "Body":{
                         "EthNetworkPolicy":"692d76096f62693005fbde9a",
                         "VlanId":2501,
                         "Name":"vlan-2501",
                         "IsNative":false,
                         "MulticastPolicy":"692dacd26f6269300500e5c1",
                         "AutoAllowOnUplinks":true,
                         "PrimaryVlanId":0,
                         "SharingType":"None"
                     }
                 }]
             }
    }
}

admin@ncs(config-config)# commit
Commit complete.
```


### 11.2.2 Update a vlan
------------------------

Example:

```
admin@ncs(config-config)# fabric eth-network-policy VLAN_Policy
admin@ncs(config-eth-network-policy-VLAN_Policy)# vlan 2501
admin@ncs(config-vlan-2107)# name changed-name
admin@ncs(config-vlan-2107)# exit
admin@ncs(config-eth-network-policy-VLAN_Policy)# exit

admin@ncs(config-config)# show config
fabric eth-network-policy VLAN_Policy
 vlan 2501
  name changed-name
 !
!

admin@ncs(config-config)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<Hostname>:<Port>/api/v1/bulk/Requests
             {
                 "Verb":"PATCH",
                 "Uri":"/v1/fabric/Vlans",
                 "ActionOnError":"Stop",
                 "Requests":[{
                     "ObjectType":"bulk.RestSubRequest",
                     "TargetMoid":"69676ecf6f626930058b0ca8",
                     "Body":{
                         "VlanId":2501,
                         "Name":"changed-name",
                         "IsNative":false,
                         "MulticastPolicy":"692dacd26f6269300500e5c1",
                         "AutoAllowOnUplinks":true,
                         "PrimaryVlanId":0,
                         "SharingType":"None"
                     }
                 }]
             }
    }
}

admin@ncs(config-config)# commit
Commit complete.
```

### 11.2.3 Delete a vlan
------------------------

Example:

```
admin@ncs(config-config)# fabric eth-network-policy VLAN_Policy
admin@ncs(config-eth-network-policy-VLAN_Policy)# no vlan 2501
admin@ncs(config-eth-network-policy-VLAN_Policy)# exit
admin@ncs(config-config)# show config
fabric eth-network-policy VLAN_Policy
 no vlan 2501
!

admin@ncs(config-config)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<Hostname>:<Port>/api/v1/bulk/Requests
             {
                 "Verb":"DELETE",
                 "Uri":"/v1/fabric/Vlans",
                 "ActionOnError":"Stop",
                 "Requests":[{
                     "ObjectType":"bulk.RestSubRequest",
                     "VlanId":2501,
                     "TargetMoid":"69676ecf6f626930058b0ca8"
                 }]
             }
    }
}
```

## 11.3 Update Eth Network Group
--------------------------------

### 11.3.1 Update group with new vlans
--------------------------------------

Example:

Let's suppose the following configuration exists:

```
 fabric eth-network-group-policies Eth_Net_Group_policy
   vlan-settings allowed-vlans 10,400,713,995-997,999-1001,1003,1005-1009
   vlan-settings qinq-enabled false
  !
```

 And the user wants to add the following vlans: 1010,760,1130

```
admin@ncs(config-config)# fabric eth-network-group-policies Eth_Net_Group_policy
admin@ncs(config-eth-network-group-policies-Eth_Net_Group_policy)# vlan-settings allowed-vlans 1010,760,1130
admin@ncs(config-eth-network-group-policies-Eth_Net_Group_policy)# exit

admin@ncs(config-config)# show config
fabric eth-network-group-policies Eth_Net_Group_policy
 vlan-settings allowed-vlans 760,1010,1130
!

admin@ncs(config-config)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<Hostname>:<Port>/api/v1/fabric/EthNetworkGroupPolicies/694046e46f62693005da421a
             {
                 "Organization":{
                     "ObjectType":"organization.Organization",
                     "Moid":"69258d7269726530052eb120"
                 },
                 "VlanSettings":{
                     "AllowedVlans":"10,400,713,760,995-997,999-1001,1003,1005-1010,1130",
                     "QinqEnabled":false
                 }
             }
    }
}
admin@ncs(config-config)#
```
Please note that the Moid from organization, in the payload above, is automatically added by the NED, based on the `user-role` that is configured in  
ned-settings and is a mandatory setting.

When there are 2 or more REST operations involved(POST, UPDATE, DELETE), the NED will automatically group the requests in bulk requests  
specific for each operation, meaning 1 bulk request for POST(with related Json paylaods), 1 for DELETE and 1 for PATCH.  
If the API doesn't support Bulk Request, individual requests with a single payload will be sent to the device.

Example with multiple operations of the same type:

```
admin@ncs(config-config)# fabric eth-network-policy VLAN_Policy
admin@ncs(config-eth-network-policy-VLAN_Policy)#  vlan 1001
admin@ncs(config-vlan-1001)# name aaa
admin@ncs(config-vlan-1001)# exit
admin@ncs(config-vlan-1001)# vlan 1562
admin@ncs(config-vlan-1562)# name aa_2032
admin@ncs(config-vlan-1562)# is-native false
admin@ncs(config-vlan-1562)# sharing-type None
admin@ncs(config-vlan-1562)# multicast-policy default
admin@ncs(config-vlan-1562)# primary-vlan-id 0
admin@ncs(config-vlan-1562)# auto-allow-on-uplinks true
admin@ncs(config-vlan-1562)# exit
admin@ncs(config-vlan-1562)# no vlan 1706
admin@ncs(config-vlan-1562)# no vlan 1765
admin@ncs(config-vlan-1562)# vlan 2030
admin@ncs(config-vlan-2030)# name oth
admin@ncs(config-vlan-2030)# exit
admin@ncs(config-vlan-2030)# vlan 3100
admin@ncs(config-vlan-3100)# name aa_2032
admin@ncs(config-vlan-3100)# is-native false
admin@ncs(config-vlan-3100)# sharing-type None
admin@ncs(config-vlan-3100)# multicast-policy default
admin@ncs(config-vlan-3100)# primary-vlan-id 0
admin@ncs(config-vlan-3100)# auto-allow-on-uplinks true
admin@ncs(config-vlan-3100)# exit
admin@ncs(config-vlan-3100)# vlan 3120
admin@ncs(config-vlan-3120)# name aa_2032
admin@ncs(config-vlan-3120)# is-native false
admin@ncs(config-vlan-3120)# sharing-type None
admin@ncs(config-vlan-3120)# multicast-policy default
admin@ncs(config-vlan-3120)# primary-vlan-id 0
admin@ncs(config-vlan-3120)# auto-allow-on-uplinks true
admin@ncs(config-vlan-3120)# exit
admin@ncs(config-vlan-3120)# exit
admin@ncs(config-vlan-3120)# fabric eth-network-group-policies Eth_Net_Group_policy
admin@ncs(config-eth-network-group-policies-Eth_Net_Group_policy)# vlan-settings allowed-vlans 1010,760,1130
admin@ncs(config-eth-network-group-policies-Eth_Net_Group_policy)# exit

admin@ncs(config-config)# show config
fabric eth-network-policy VLAN_Policy
 vlan 1001
  name aaa
 !
 no vlan 1706
 no vlan 1765
 vlan 1562
  name                  1562
  is-native             false
  sharing-type          None
  multicast-policy      default
  primary-vlan-id       0
  auto-allow-on-uplinks true
 !
 vlan 2030
  name oth
 !
 vlan 3100
  name                  3100
  is-native             false
  sharing-type          None
  multicast-policy      default
  primary-vlan-id       0
  auto-allow-on-uplinks true
 !
 vlan 3120
  name                  3120
  is-native             false
  sharing-type          None
  multicast-policy      default
  primary-vlan-id       0
  auto-allow-on-uplinks true
 !
!
fabric eth-network-group-policies Eth_Net_Group_policy
 vlan-settings allowed-vlans 760,1010,1130
!

admin@ncs(config-config)# commit dry-run outformat native
native {
    device {
        name dev-1
        data POST https://<Hostname>:<Port>/api/v1/bulk/Requests
             {
                 "Verb":"DELETE",
                 "Uri":"/v1/fabric/Vlans",
                 "ActionOnError":"Stop",
                 "Requests":[{
                     "ObjectType":"bulk.RestSubRequest",
                     "VlanId":1706,
                     "TargetMoid":"6968c2bf6f62693005afecbd"
                 },{
                     "ObjectType":"bulk.RestSubRequest",
                     "VlanId":1765,
                     "TargetMoid":"6968c2bf6f62693005afecc2"
                 }]
             }
             POST https://<Hostname>:<Port>/api/v1/bulk/Requests
             {
                 "Verb":"POST",
                 "Uri":"/v1/fabric/Vlans",
                 "ActionOnError":"Stop",
                 "Requests":[{
                     "ObjectType":"bulk.RestSubRequest",
                     "Body":{
                         "EthNetworkPolicy":"692d76096f62693005fbde9a",
                         "VlanId":1562,
                         "Name":"1562",
                         "IsNative":false,
                         "MulticastPolicy":"692dacd26f6269300500e5c1",
                         "AutoAllowOnUplinks":true,
                         "PrimaryVlanId":0,
                         "SharingType":"None"
                     }
                 },{
                     "ObjectType":"bulk.RestSubRequest",
                     "Body":{
                         "EthNetworkPolicy":"692d76096f62693005fbde9a",
                         "VlanId":3100,
                         "Name":"3100",
                         "IsNative":false,
                         "MulticastPolicy":"692dacd26f6269300500e5c1",
                         "AutoAllowOnUplinks":true,
                         "PrimaryVlanId":0,
                         "SharingType":"None"
                     }
                 },{
                     "ObjectType":"bulk.RestSubRequest",
                     "Body":{
                         "EthNetworkPolicy":"692d76096f62693005fbde9a",
                         "VlanId":3120,
                         "Name":"3120",
                         "IsNative":false,
                         "MulticastPolicy":"692dacd26f6269300500e5c1",
                         "AutoAllowOnUplinks":true,
                         "PrimaryVlanId":0,
                         "SharingType":"None"
                     }
                 }]
             }
             POST https://<Hostname>:<Port>/api/v1/bulk/Requests
             {
                 "Verb":"PATCH",
                 "Uri":"/v1/fabric/Vlans",
                 "ActionOnError":"Stop",
                 "Requests":[{
                     "ObjectType":"bulk.RestSubRequest",
                     "TargetMoid":"694186a76f62693005fa4950",
                     "Body":{
                         "VlanId":1001,
                         "Name":"aaa",
                         "IsNative":false,
                         "MulticastPolicy":"692dacd26f6269300500e5c1",
                         "AutoAllowOnUplinks":true,
                         "PrimaryVlanId":0,
                         "SharingType":"None"
                     }
                 },{
                     "ObjectType":"bulk.RestSubRequest",
                     "TargetMoid":"696613ca6f6269300567f809",
                     "Body":{
                         "VlanId":2030,
                         "Name":"oth",
                         "IsNative":false,
                         "MulticastPolicy":"692dacd26f6269300500e5c1",
                         "AutoAllowOnUplinks":true,
                         "PrimaryVlanId":0,
                         "SharingType":"None"
                     }
                 }]
             }
             POST https://<Hostname>:<Port>/api/v1/fabric/EthNetworkGroupPolicies/694046e46f62693005da421a
             {
                 "Organization":{
                     "ObjectType":"organization.Organization",
                     "Moid":"69258d7269726530052eb120"
                 },
                 "VlanSettings":{
                     "AllowedVlans":"10,400,713,760,995-997,999-1001,1003,1005-1010,1130",
                     "QinqEnabled":false
                 }
             }
    }
}
```
