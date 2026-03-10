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
  ```


# 1. General
------------

  This document describes the huawei-imanager NED.

  This document describes the generic NED for the Huawei U2K device.  
  The NED manages the device configuration via SOAP-XML messages.  
  This NED does not follow the usual patter. It does not have any config data, all the interactions with the device are done via actions.  
  For those actions to work properly some operational data tables must be initialised and periodically updated to mirror the device state.  
  The tables provide mapping between user-readable tags that are used by the service layer and device generated id's.

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
  | netsim                    | no        | --                                                               |
  |                           |           |                                                                  |
  | check-sync                | no        | --                                                               |
  |                           |           |                                                                  |
  | partial-sync-from         | no        | --                                                               |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Check the `README.md` file for additional info                   |
  |                           |           |                                                                  |
  | live-status show          | no        | --                                                               |
  |                           |           |                                                                  |
  | load-native-config        | no        |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | iManager U2000            | --              | --     | --                                                |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-huawei-imanager-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-huawei-imanager-1.0.1.signed.bin
      > ./ncs-6.0-huawei-imanager-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-huawei-imanager-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-huawei-imanager-1.0.1.tar.gz
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
     `huawei-imanager-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-huawei-imanager-1.0.1.tar.gz
     > ls -d */
     huawei-imanager-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package huawei-imanager-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package huawei-imanager-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-huawei-imanager-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package huawei-imanager-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-huawei-imanager-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-huawei-imanager-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install huawei-imanager-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-huawei-imanager-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-huawei-imanager-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id huawei-imanager-gen-1.0
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

  `$NSO_RUNDIR/logs/ned-huawei-imanager-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings huawei-imanager logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings huawei-imanager logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.imanager \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings huawei-imanager logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings huawei-imanager logger java true
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

  The following commands must be run to refresh the operational data (in config mode):  
  `#devices device <device_name> config huawei-imanager:huawei-imanager exec refreshMeCache`  
  `#devices device <device_name> config huawei-imanager:huawei-imanager exec refreshFdFrCache`  
  `#devices device <device_name> config huawei-imanager:huawei-imanager exec refreshSncCache`  
  *Depending on the configuration, these steps can take a lot of time and will generate a high CPU load on the U2K device.*  



  The caches cand be read back by running these commands (from outside the config state): 
  ```
     admin@ncs# show devices device huawei-imanager sncCache 
     NAME    ALIAS VALUE                         USER LABEL        
     --------------------------------------------------------------
     huawei  AGG1-HUB1-StatCR-27-00004271        TUNNELTRAIL=2907  
             AGG1-HUB1-StatCR-27-00004271_PRT    TUNNELTRAIL=2908  
             AGG2-HUB2-StatCR-LONG               TUNNELTRAIL=2913  
             AGG2-HUB2-StatCR-LONG_PRT           TUNNELTRAIL=2914  
             AGG3-AGG7-StatCR-11-00004247        TUNNELTRAIL=2903  
             AGG3-AGG7-StatCR-11-00004247_PRT    TUNNELTRAIL=2904  
             AGG3-HUB1-StatCR-14-00004026        TUNNELTRAIL=2867  
             AGG3-HUB1-StatCR-68-00004188        TUNNELTRAIL=2873  
             AGG3-HUB1-StatCR-68-00004188_PRT    TUNNELTRAIL=2874  
     admin@ncs#
  ```  
  ```
     admin@ncs# show devices device huawei-imanager meCache 
             ALIAS     USER     
     NAME    VALUE     LABEL    
     ---------------------------
     huawei  AGG1      3145876  
             AGG2      3145873  
             AGG3      3145869  
             AGG4      3145881  
             AGG5      3145858  
             AGG6      3145859  
             AGG7      3145875  
             HUB1      3145855  
             HUB2      3145860  
             NE(9-21)  3145844  
     admin@ncs#
  ```  
  `#show devices device huawei-imanager fdfrCache`  

  There are 3 "compare" action, that will check the provided parameters against the device config (live and cached data):
  ```
  #admin@ncs(config)# devices device huawei config huawei-imanager:huawei-imanager exec comparePWE3 
   Possible completions:
   IS_TABLE_NAME    IS_VLAN_MODIFY          LC_A_NE_NAME             LC_BACKUP_BASEKEY       LC_BACKUP_INTERFACE_PORT  LC_BACKUP_INTERFACE_SHELF  LC_BACKUP_INTERFACE_SLOT  LC_BACKUP_NE_NAME    LC_BASEKEY       
   LC_B_NE_NAME     LC_DNI_BASEKEY          LC_INTERFACE_A_PORT      LC_INTERFACE_A_SHELF    LC_INTERFACE_A_SLOT       LC_INTERFACE_B_PORT        LC_INTERFACE_B_SHELF      LC_INTERFACE_B_SLOT  LC_MPLS_BASEKEY  
   LC_PATH_BASEKEY  LC_PATH_INTERFACE_PORT  LC_PATH_INTERFACE_SHELF  LC_PATH_INTERFACE_SLOT  LC_PATH_NE_NAME           LC_RES_VALUE
  ```  

  ```
   #admin@ncs(config)# devices device huawei config huawei-imanager:huawei-imanager exec comparePtp 
      Possible completions:
      IS_TABLE_NAME              IS_VLAN_MODIFY            LC_INTERFACE_PORT        LC_INTERFACE_SHELF           LC_INTERFACE_SLOT         LC_NE_NAME       NMS_AUTO_NEGOTIATION_IF  NMS_DEFAULTVLAN_IF  
      NMS_ENCAPSULATION_TYPE_IF  NMS_LOGICAL_PORT_ATTR_IF  NMS_MAX_FRAME_LENGTH_IF  NMS_PORT_QNQ_TYPE_DOMAIN_IF  NMS_PORT_WORKING_MODE_IF  NMS_TAG_ATTR_IF  TR_BASEKEY_IF
  ```  

  ```
   #admin@ncs(config)# devices device huawei config huawei-imanager:huawei-imanager exec compare_reconcile 
      Possible completions:
      IS_TABLE_NAME  LC_BASEKEY  LC_RES_VALUE
  ```    

  These commands are used to create new configuration:  
  ```
  #admin@ncs(config)# devices device huawei config huawei-imanager:huawei-imanager exec createPWE3 
      Possible completions:
      IS_TABLE_NAME  IS_VLAN_MODIFY  LC_A_NE_NAME  LC_BASEKEY  LC_B_NE_NAME  LC_INTERFACE_A_PORT  LC_INTERFACE_A_SHELF  LC_INTERFACE_A_SLOT  LC_INTERFACE_B_PORT  LC_INTERFACE_B_SHELF  LC_INTERFACE_B_SLOT  LC_MPLS_BASEKEY  LC_RES_VALUE
  ```  

  ```
   #devices device huawei config huawei-imanager:huawei-imanager exec createProtectedPWE3 
      Possible completions:
      IS_TABLE_NAME   IS_VLAN_MODIFY       LC_A_NE_NAME          LC_BACKUP_BASEKEY    LC_BACKUP_INTERFACE_PORT  LC_BACKUP_INTERFACE_SHELF  LC_BACKUP_INTERFACE_SLOT  LC_BACKUP_NE_NAME       LC_BASEKEY       
      LC_DNI_BASEKEY  LC_INTERFACE_A_PORT  LC_INTERFACE_A_SHELF  LC_INTERFACE_A_SLOT  LC_PATH_BASEKEY           LC_PATH_INTERFACE_PORT     LC_PATH_INTERFACE_SHELF   LC_PATH_INTERFACE_SLOT  LC_PATH_NE_NAME  
      LC_RES_VALUE
  ```  
  Both commands will also update the local caches if they are successful.  

  Configuration can be removed with:  
  ```
   #admin@ncs(config)# devices device huawei config huawei-imanager:huawei-imanager exec deletePWE3 
      Possible completions:
      IS_TABLE_NAME  IS_VLAN_MODIFY  LC_BASEKEY  LC_RES_VALUE
  ```  

  Existing entries can be altered with:  
  ```
   #admin@ncs(config)# devices device huawei config huawei-imanager:huawei-imanager exec modifyFdfr 
      Possible completions:
      IS_TABLE_NAME  IS_VLAN_MODIFY  LC_BASEKEY  NEW_LC_RES_VALUE  OLD_LC_RES_VALUE  
   #admin@ncs(config)# devices device huawei config huawei-imanager:huawei-imanager exec modifyPtp 
      Possible completions:
      IS_TABLE_NAME              IS_VLAN_MODIFY            LC_INTERFACE_PORT        LC_INTERFACE_SHELF           LC_INTERFACE_SLOT         LC_NE_NAME       NMS_AUTO_NEGOTIATION_IF  NMS_DEFAULTVLAN_IF  
      NMS_ENCAPSULATION_TYPE_IF  NMS_LOGICAL_PORT_ATTR_IF  NMS_MAX_FRAME_LENGTH_IF  NMS_PORT_QNQ_TYPE_DOMAIN_IF  NMS_PORT_WORKING_MODE_IF  NMS_TAG_ATTR_IF  TR_BASEKEY_IF 
  ```


# 5. Built in live-status actions
---------------------------------

  1. `createPWE3`: the call will run the `createAndActivateFlowDomainFragmentRequest` or `modifyFlowDomainFragmentRequest` actions on the device.  
    If `LC_BASEKEY` is specified and found in the internal `fdfrCache` table the `modifyFlowDomainFragmentRequest` API is called, otherwhise a new FDFR entry is created with `createAndActivateFlowDomainFragmentRequest`.  
    The following parameters are mandatory: `LC_BASEKEY, LC_MPLS_BASEKEY, LC_A_NE_NAME,LC_INTERFACE_A_SHELF,LC_INTERFACE_A_SLOT, LC_INTERFACE_A_PORT, LC_B_NE_NAME,LC_INTERFACE_B_SHELF,LC_INTERFACE_B_SLOT,LC_INTERFACE_B_PORT, LC_RES_VALUE`. An exeption will be triggerd if they're not specified.  
    `LC_MPLS_BASEKEY` is matched against the `sncCache` table and must be present.  
    `LC_A_NE_NAME` and `LC_B_NE_NAME` are matched against the `meCache` table.  
    In case of success, the call will return the `operation step` + `OK`. If not, `operation step` + `ERROR:` is returned, followed by the java exception or device error string.  

  2. `createProtectedPWE3`: the call will run `createAndActivateFlowDomainFragmentRequest` or `modifyFlowDomainFragmentRequest` actions on the device.  
    If `LC_BASEKEY` points to an existing entry in `fdfrCache`, `modifyFlowDomainFragmentRequest` is called, otherwhise a new FRFR entry is created with `createAndActivateFlowDomainFragmentRequest`. The `` action is used to add new VLAN entries.  
    It differs from `createPWE3` by creating a protected route, specified with the additional `LC_BACKUP_NE_NAME, LC_BACKUP_INTERFACE_SHELF, LC_BACKUP_INTERFACE_SLOT, LC_BACKUP_INTERFACE_PORT` parameters.
    The following parameters are mandatory: `LC_BASEKEY,LC_PATH_BASEKEY,LC_BACKUP_BASEKEY,LC_DNI_BASEKEY,LC_A_NE_NAME,LC_INTERFACE_A_SHELF,LC_INTERFACE_A_SLOT,LC_INTERFACE_A_PORT,LC_PATH_NE_NAME,LC_PATH_INTERFACE_SHELF,LC_PATH_INTERFACE_SLOT,LC_PATH_INTERFACE_PORT,LC_BACKUP_NE_NAME,LC_BACKUP_INTERFACE_SHELF,LC_BACKUP_INTERFACE_SLOT,LC_BACKUP_INTERFACE_PORT,LC_RES_VALUE`. An exeption will be triggerd if they're not specified.  
    `LC_BASEKEY` is matched agains the `` table.
    `LC_PATH_BASEKEY, LC_BACKUP_BASEKEY, LC_DNI_BASEKEY` are matched against `sncCache` and must point to existing entries.  
    `LC_A_NE_NAME, LC_PATH_NE_NAME, LC_BACKUP_NE_NAME` are matched against `meCache` and must point to existing entries.  
    In case of success, the call will return the `operation step` + `OK`. If not, `operation step` + `ERROR:` is returned, followed by the java exception or device error string.  

  3. `deletePWE3`: this action will either delete one VLAN entry from the FDFR record, or the entire record, depending on it's parameters and the `fdfrCache` table state:  
    If the parameter `LC_RES_VALUE` points to the last VLAN entry, then a delete operation is triggered by calling the `deactivateAndDeleteFlowDomainFragmentRequest` API.  
    It's used to managed entries created by both `createPWE3` and `createProtectedPWE3` actions.  
    It will call `modifyFlowDomainFragmentRequest` to remove the specific VLAN record if there are additional VLANs in that instance.  
    The `LC_BASEKEY, LC_RES_VALUE` parameters are mandatory. `LC_BASEKEY` points to the `fdfrCache` entry, and `LC_RES_VALUE` points to a specific VLAN record.  
    In case of success, the call will return the `operation step` + `OK`. If not, `operation step` + `ERROR:` is returned, followed by the java exception or device error string.  

  4. `modifyFdfr`: this action is used to update replace a VLAN entry with a new one, without having to run a delete and a create API calls.  
    `LC_BASEKEY` point to the `fdfrCache` entry, `OLD_LC_RES_VALUE` points the current VLAN id, and `NEW_LC_RES_VALUE` points to the future one.  
    If all parameters are specified and `LC_BASEKEY` is present in `fdfrCache` the `modifyFlowDomainFragmentRequest` API is called.  
    In case of success, the call will return the `operation step` + `OK`. If not, `operation step` + `ERROR:` is returned, followed by the java exception or device error string.  

  5. `comparePWE3`: the command will simulate a simple `compare config` command. It works for both normal and protected PWE3s.
    If only `LC_BASEKEY` and `LC_RES_VALUE` parameters a specified, it will emulate the compare for a delete operation.  
    If `LC_PATH_BASEKEY` is specified, the code will try to generate a compare for a protected PWE3 entry.  
    If `IS_VLAN_MODIFY` is specified, it will use the parameters' value to emulate the output of a 'modifyFDFR' operation (VLAN replacement).  
    If `LC_BASEKEY` can't be located in the `fdfrCache` the output will emulate the creation of a new PWE3 entry.  
    In all othre cases, the code will call the `getFlowDomainFragmentRequest` and one ore more `getSubnetworkConnectionRequest` API's and replace all UUIDS from the three local caches.  
    In case of success, the call will return the `operation step` + `OK`. If not, `operation step` + `ERROR:` is returned, followed by the java exception or device error string.  

  6. `modifyPtp`: the command will call the `setTerminationPointDataRequest` API to change the termination point settings.  
    The `LC_NE_NAME,LC_INTERFACE_SHELF,LC_INTERFACE_SLOT,LC_INTERFACE_PORT,NMS_LOGICAL_PORT_ATTR_IF` parameters are mandatory.  
    `LC_NE_NAME` must be present in the `meCache` table.  
    If `NMS_ENCAPSULATION_TYPE_IF` is present and does not match *Q in Q* or *Q IN Q (Type 8100)* then `NMS_PORT_QNQ_TYPE_DOMAIN_IF` is set to *null* and ignored.  
    One of the `NMS_AUTO_NEGOTIATION_IF` or `NMS_PORT_WORKING_MODE_IF` parameters must be specified, they can't be both *null*. If `NMS_AUTO_NEGOTIATION_IF` is *null*, *Auto-Negotiation* or *Disabled* it will be ignored, and `NMS_PORT_WORKING_MODE_IF` takes over.
    At the end, the `setCommonAttributesRequest` API is called with the `TR_BASEKEY_IF` parameter. 
    In case of success, the call will return the `operation step` + `OK`. If not, `operation step` + `ERROR:` is returned, followed by the java exception or device error string.  

  7. `comparePtp`: it will emulate the output of 'compare config' for the termination point settings.  
    It will run a `getTerminationPointRequest` API call to retrieve the termination point data, based on the `LC_NE_NAME, LC_INTERFACE_SHELF, LC_INTERFACE_SLOT, LC_INTERFACE_PORT` parameters. If there's not termination point configured for that specific parameter set, the code will emulate setting a new one. If there is, it will emulate a diff operation.  
    In case of success, the call will return the `operation step` + `OK`. If not, `operation step` + `ERROR:` is returned, followed by the java exception or device error string.  

  8. `renameBasekey`: will rename the `fdfrCache` entry that's indicated by `OLD_LC_BASEKEY` to `NEW_LC_BASEKEY`. The operation is done by copying the data and deleting the old entry at the end.  
    It will also call the `setCommonAttributesRequest` API to update the `NativeEMSName` and `Description` fields to the new `LC_BASEKEY` value.  
    In case of success, the call will return the `operation step` + `OK`. If not, `operation step` + `ERROR:` is returned, followed by the java exception or device error string.  

  9. `reconcile` and `compareReconcile`: will check if the VLAN `LC_RES_VALUE` is present in the `fdfrCache` record pointed by `LC_BASEKEY`. Both parameters are mandatory.  
    It will return *RECONCILE OK* if `LC_RES_VALUE` is found, or an error message.  

  10. `refreshSncCache`: will update the internal `sncCache` table by calling the `getAllSubnetworkConnectionsRequest` API.  

  11. `refreshMeCache`: will update the internal `meCache` table by calling the `getAllManagedElementsRequest` API.  

  12. `refreshFdFrCache`: will update the internal `fdfrCache` table by calling the `getAllFlowDomainFragmentsRequest` API. This operation is very CPU and bandwith intensive on both the target device and the NSO system. The data is retrieved and processes in chunks controlled by the *fdfr_chunk_size* ned setting.  
    Ideally, this should be called only when there's an out-of-band device configuration change, and when the device is not loaded by other tasks.


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
     admin@ncs(config)# devices device dev-1 ned-settings huawei-imanager logging level debug
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

