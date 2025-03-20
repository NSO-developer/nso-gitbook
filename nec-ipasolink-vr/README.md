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
  10. Configure the NED to use ssh multi factor authentication
  11. The load-native-config feature
  12. Handling default values
  ```


# 1. General
------------

  This document describes the nec-ipasolink-vr NED.

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
  | netsim                    | yes       | Simulate device from NED yang model                              |
  |                           |           |                                                                  |
  | check-sync                | yes       | Use a snapshot of the full running config or only modeled parts  |
  |                           |           | for calculation                                                  |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | NED fetches full config from device and nedcom turbo parser      |
  |                           |           | filters config for partial paths                                 |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Check the README.md file, 'Built in live-status actions' section |
  |                           |           |                                                                  |
  | live-status show          | no        | Use 'live-status actions' instead                                |
  |                           |           |                                                                  |
  | load-native-config        | yes       | Device native 'show running-config eth-function' CLIs can be     |
  |                           |           | parsed and loaded using this feature.                            |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | VR4                       | 05.10.18        |        |                                                   |
  |                           |                 |        |                                                   |
  | VR10                      | 05.10.18        |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-nec-ipasolink-vr-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-nec-ipasolink-vr-1.0.1.signed.bin
      > ./ncs-6.0-nec-ipasolink-vr-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-nec-ipasolink-vr-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-nec-ipasolink-vr-1.0.1.tar.gz
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
     `nec-ipasolink-vr-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-nec-ipasolink-vr-1.0.1.tar.gz
     > ls -d */
     nec-ipasolink-vr-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package nec-ipasolink-vr-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package nec-ipasolink-vr-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-nec-ipasolink-vr-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package nec-ipasolink-vr-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/nec-ipasolink-vr-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-nec-ipasolink-vr-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-nec-ipasolink-vr-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install nec-ipasolink-vr-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-nec-ipasolink-vr-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-nec-ipasolink-vr-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id nec-ipasolink-vr-cli-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
    ```
    admin@ncs(config)# devices device dev-1 protocol <ssh or telnet>
    ```

  - If configured protocol is ssh, do fetch the host keys now:

     ```
     admin@ncs(config)# devices device dev-1 ssh fetch-host-keys
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

  `$NSO_RUNDIR/logs/ned-nec-ipasolink-vr-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings nec-ipasolink-vr logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings nec-ipasolink-vr logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.necipasolinkvr \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings nec-ipasolink-vr logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings nec-ipasolink-vr logger java true
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

  Example:

  ```
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device dev-1 config
  admin@ncs(config-config)# vlan entry 3200 name "one vlan"
  admin@ncs(config-config)# vlan entry 3300 name "second vlan"
  admin@ncs(config-config)# interface eth 0/6
  admin@ncs(config-if)#  vlan trunk 3200
  admin@ncs(config-if)#  vlan trunk 3300
  admin@ncs(config-if)# exit
  admin@ncs(config-config)# interface eth 0/7
  admin@ncs(config-if)#  name      interface7
  admin@ncs(config-if)#  broadcast storm-control enable
  admin@ncs(config-if)#  qos shaper queue entry group remaining profile 15
  admin@ncs(config-if)#  vlan trunk 3200
  admin@ncs(config-if)#  vlan trunk 3300
  admin@ncs(config-if)#  port      enable
  admin@ncs(config-if)# exit
  admin@ncs(config-config)# interface lag-radio 1
  admin@ncs(config-if)#  vlan trunk 3200
  admin@ncs(config-if)# exit
  admin@ncs(config-config)# qos class profile configuration port 15
  admin@ncs(config-class_map)#  name  5G_MBH_DSCP_4-COS_NSO
  admin@ncs(config-class_map)#  class dscp
  admin@ncs(config-class_map)#  priority-mapping 1-7 to 1
  admin@ncs(config-class_map)#  priority-mapping 16-23 to 3
  admin@ncs(config-class_map)#  priority-mapping 32-39 to 5
  admin@ncs(config-class_map)#  priority-mapping 48-63 to 0
  admin@ncs(config-class_map)# exit
  admin@ncs(config-config)# qos class map port eth 0/7 table-mapping 14
  admin@ncs(config-config)# qos class default-priority port eth 0/7 priority 4
  admin@ncs(config-config)# qos shaper queue-profile configuration 15
  admin@ncs(config-queue_map)#  name 5G_MBH_Egress_NSO
  admin@ncs(config-queue_map)#  priority 0 length 5632
  admin@ncs(config-queue_map)#  priority 0 shaper scheduler dwrr 1
  admin@ncs(config-queue_map)#  priority 1 length 5632
  admin@ncs(config-queue_map)#  priority 1 shaper scheduler dwrr 4
  admin@ncs(config-queue_map)#  priority 2 length 16
  admin@ncs(config-queue_map)#  priority 2 shaper scheduler dwrr 1
  admin@ncs(config-queue_map)#  priority 3 length 5632
  admin@ncs(config-queue_map)#  priority 3 shaper scheduler dwrr 24
  admin@ncs(config-queue_map)#  priority 4 length 16
  admin@ncs(config-queue_map)#  priority 4 shaper scheduler dwrr 1
  admin@ncs(config-queue_map)#  priority 5 length 1536
  admin@ncs(config-queue_map)#  priority 5 shaper scheduler dwrr 70
  admin@ncs(config-queue_map)#  priority 6 length 768
  admin@ncs(config-queue_map)#  priority 6 shaper scheduler dwrr 1
  admin@ncs(config-queue_map)#  priority 7 length 16
  admin@ncs(config-queue_map)#  priority 7 shaper scheduler dwrr 1
  admin@ncs(config-queue_map)# exit
  admin@ncs(config-config)# qos overwrite port eth 0/7 enable
  admin@ncs(config-config)#
  ```

  See what you are about to commit:

   ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name dev-1
          data vlan entry 3200 "one vlan"
               vlan entry 3300 "second vlan"
               interface eth 0/6
                vlan trunk 3200
                vlan trunk 3300
               exit
               interface eth 0/7
                name interface7
                broadcast storm-control enable
                vlan trunk 3200
                vlan trunk 3300
                port enable
               exit
               interface lag-radio 1
                vlan trunk 3200
               exit
               qos class profile configuration port 15
                name 5G_MBH_DSCP_4-COS_NSO
                class dscp
                priority-mapping 1 to 1
                priority-mapping 2 to 1
                priority-mapping 3 to 1
                priority-mapping 4 to 1
                priority-mapping 5 to 1
                priority-mapping 6 to 1
                priority-mapping 7 to 1
                priority-mapping 16 to 3
                priority-mapping 17 to 3
                priority-mapping 18 to 3
                priority-mapping 19 to 3
                priority-mapping 20 to 3
                priority-mapping 21 to 3
                priority-mapping 22 to 3
                priority-mapping 23 to 3
                priority-mapping 32 to 5
                priority-mapping 33 to 5
                priority-mapping 34 to 5
                priority-mapping 35 to 5
                priority-mapping 36 to 5
                priority-mapping 37 to 5
                priority-mapping 38 to 5
                priority-mapping 39 to 5
                priority-mapping 48 to 0
                priority-mapping 49 to 0
                priority-mapping 50 to 0
                priority-mapping 51 to 0
                priority-mapping 52 to 0
                priority-mapping 53 to 0
                priority-mapping 54 to 0
                priority-mapping 55 to 0
                priority-mapping 56 to 0
                priority-mapping 57 to 0
                priority-mapping 58 to 0
                priority-mapping 59 to 0
                priority-mapping 60 to 0
                priority-mapping 61 to 0
                priority-mapping 62 to 0
                priority-mapping 63 to 0
               exit
               qos class map port eth 0/7 table-mapping 14
               qos class default-priority port eth 0/7 priority 4
               qos shaper queue-profile configuration 15
                name 5G_MBH_Egress_NSO
                priority 0 length 5632
                priority 0 scheduler dwrr 1
                priority 1 length 5632
                priority 1 scheduler dwrr 4
                priority 2 length 16
                priority 2 scheduler dwrr 1
                priority 3 length 5632
                priority 3 scheduler dwrr 24
                priority 4 length 16
                priority 4 scheduler dwrr 1
                priority 5 length 1536
                priority 5 scheduler dwrr 70
                priority 6 length 768
                priority 6 scheduler dwrr 1
                priority 7 length 16
                priority 7 scheduler dwrr 1
               exit
               qos overwrite port eth 0/7 enable
      }
  }
   ```

  Commit new configuration in a transaction:

   ```
   admin@ncs(config-config)# commit
   Commit complete.
   ```

  Verify that NED is in-sync with the device:

   ```
   admin@ncs(config-config)# devices device dev-1 check-sync
   result in-sync
   ```

  Compare configuration between device and NED's CDB:

   ```
   admin@ncs(config-config)# devices device dev-1 compare-config
   ```

  Note:  
   - if no diff is shown, supported config is the same in NED's CDB(configuration database) as on the device.


  On the device, the default values are not displayed. The NED mimics this behavior. However, if the user wants to check the default  
  values, then the following command can be used: `admin@ncs(config-config)# show full | details`.

  To undo the previous modifications, the user can run the following command:  

   ```
  admin@ncs(config-config)# top rollback configuration
  admin@ncs(config-config)# show config
  interface eth 0/6
   no vlan trunk 3200
  exit
  interface eth 0/7
   no vlan trunk 3200
  exit
  interface lag-radio 1
   no vlan trunk 3200
  exit
  no vlan entry 3200
  interface eth 0/6
   no vlan trunk 3300
  exit
  interface eth 0/7
   no vlan trunk 3300
  exit
  no vlan entry 3300
  interface eth 0/7
   no name
   no broadcast storm-control
   no port
  exit
  no qos class profile configuration port 15
  no qos class map port eth 0/7
  no qos class default-priority port eth 0/7
  no qos shaper queue-profile configuration 15
  no qos overwrite port eth 0/7

  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name dev-1
          data interface eth 0/6
                no vlan 3200
               exit
               interface eth 0/7
                no vlan 3200
               exit
               interface lag-radio 1
                no vlan 3200
               exit
               no vlan entry 3200
               interface eth 0/6
                no vlan 3300
               exit
               interface eth 0/7
                no vlan 3300
               exit
               no vlan entry 3300
               interface eth 0/7
                no name
                no broadcast storm-control
                no port
               exit
               no qos class profile configuration port 15
               no qos class map port eth 0/7
               no qos class default-priority port eth 0/7
               no qos shaper queue-profile configuration 15
               no qos overwrite port eth 0/7
      }
  }

   admin@ncs(config-config)# commit
   Commit complete.
   ```


# 5. Built in live-status actions
---------------------------------

  - **exec any**

   The NED has support for all NEC VR4 and VR10 devices' operational mode commands.
   Use 'live-status exec any' command action to execute operation mode command.

   Example:

   ```
  admin@ncs# devices device dev-1 live-status exec any show vlan entry 
  result 
  VLAN List
  =========
  VLAN Mode : 802.1q
  ==================
  VLAN ID  VLAN Service Name               
  -----------------------------------------
        1                                  
        3  PTP-FB-xxxxxxxx                 
        4  PTP-modem-1                     
        5  FB-xxxxxxx2                     
       10                                  
       40  Test sfp                        
      101  test                            
     3100  vlan description              
     3752  Management RL                   

   VR4RS-RTS01LABGBG@1# 
  admin@ncs# 

   ```


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  Due to the NSO behavior or YANG modelling restrictions, there are cases when the NED doesn't completely emulate the device's commands or  
  behavior(like out-of-band changes).

  Please find below such examples.

  Example 1:  
  On the device, the 'vlan entry 3500 "vlan test"' command looks different compared to the ncs_cli command: 'vlan entry 3500 name "vlan test"'.

  ```
  admin@ncs(config-config)# vlan entry 3500 name "vlan test"
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name dev-1
          data vlan entry 3500 "vlan test"
      }
  }

  ```

  When the command itself is sent to the device, the NED transforms the command in the right format, accepted by the device.  
  The reason why the command looks different in ncs_cli is to accomplish the device behavior.  
  The device accepts deleting the entire vlan list entry with 'no vlan entry 3500' command or deleting only the 'name' parameter(and keep the list  
  entry id) using the: `no vlan entry 3500 name` command.

  Both deletion commands are supported by the NED:

  Deleting the entire list entry:
  ```
  admin@ncs(config-config)# no vlan entry 3500 
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name dev-1
          data no vlan entry 3500
      }
  }
  ```

  or deleting the 'name':
  ```
  admin@ncs(config-config)# no vlan entry 3500 name 
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name dev-1
          data no vlan entry 3500 name
               vlan entry 3500
      }
  }

  ```
  When deleting the 'name', NSO considers this operation as a deletion of the entire list entry('entry' is a list) and a re-creation of the same entry, but  
  without the 'name' element. This is why the 2 operations are visible above.


  Example 2:  
  On the device, the 'priority 0 scheduler dwrr 1' command, under the 'qos shaper queue-profile configuration 15' section,  
  looks a little different compared to the equivalent command from the ncs_cli: 'priority 0 shaper scheduler dwrr 1'.

  ```
  qos shaper queue-profile configuration 15
   name 5G_MBH_Egress_NSO
   priority 0 length 5632
   priority 0 shaper scheduler dwrr 1
  exit
  admin@ncs(config-queue_map)# commit dry-run outformat native 
  native {
      device {
          name dev-1
          data qos shaper queue-profile configuration 15
                name 5G_MBH_Egress_NSO
                priority 0 length 5632
                priority 0 scheduler dwrr 1
               exit
      }
  }
  ```

  The NED automatically converts the 'priority 0 shaper scheduler dwrr 1' command to the correct format accepted by the VR devices.  
  The reason for this slightly change is because the device displays the 'scheduler' parameter(at 'show running-config eth-function') the same way as it is configured in the ncs_cli.


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
    - SSH/TELNET access to a device where the issue can be reproduced by the Cisco NSO NED team.
      This typically means both read and write permissions are required.
      Pseudo access via tools like Webex, Zoom etc is not acceptable.
      However, it is ok with device access through VPNs, jump servers etc though.

  Do as follows to gather the necessary information needed for your device, here named 'dev-1':

  1. Enable full debug logging in the NED

     ```
     ncs_cli -C -u admin
     admin@ncs# configure
     admin@ncs(config)# devices device dev-1 ned-settings nec-ipasolink-vr logging level debug
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

     In addition to this, it helps if you can show how it should work
     by manually logging into the device using SSH/TELNET and type
     the relevant commands showing a successful operation.

  6. Gather the reproduction report and a copy of the raw trace file
     containing data recorded when the issue happened.

  7. Contact the Cisco support and request to open a case. Provide the gathered files
     together with access details for a device that can be used by the
     Cisco NSO NED when investigating the issue.


  **Requests for new features and extensions of the NED are handled by the Cisco NSO NED team when
  applicable. Such requests shall also go through the Cisco support channel.**

  The following information is required for feature requests and extensions:

  1. Set the config on the real device including all existing dependent config
     and run sync-from to show it in the trace.

  2. Run sync-from # devices device dev-1 sync-from

  3. Attach the raw trace to the ticket

  4. List the config you want implemented in the same syntax as shown on the device

  5. SSH/TELNET access to a device that can be used by the Cisco NSO NED team for testing and verification
     of the new feature. This usually means that both read and write permissions are required.
     Pseudo access via tools like Webex, Zoom etc is not acceptable. However, it is ok with access
     through VPNs, jump servers etc as long as we can connect to the NED via SSH/TELNET.


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


# 10. Configure the NED to use ssh multi factor authentication
---------------------------------------------------------------

  This NED supports multi factor authentication (MFA) using the ssh authentication
  method 'keyboard-interactive'.

  Some additional steps are required to enable the MFA support:

  1. Verify that your NSO version supports MFA. This is configurable as additional
     settings in the authentication group used by the device instance.

     Enter a NSO CLI and enter the following and do tab completion:

     ```
     > ncs_cli -C -u admin
     admin@ncs# show running-config devices authgroups group default default-map <tab>
     Possible completions:
     action-name                 The action to call when a notification is received.
     callback-node               Invoke a standalone action to retrieve login credentials for managed devices on the 'callback-node' instance.
     mfa                         Settings for handling multi-factor authentication towards the device
     public-key                  Use public-key authentication
     remote-name                 Specify device user name
     remote-password             Specify the remote password
     remote-secondary-password   Second password for configuration
     same-pass                   Use the local NCS password as the remote password
     same-secondary-password     Use the local NCS password as the remote secondary password
     same-user                   Use the local NCS user name as the remote user name
     ```

     If 'mfa' is displayed in the output like above, NSO has MFA support enabled.
     In case MFA is not supported it is necessary to upgrade NSO before proceeding.

  2. Implement the authenticator executable. The MFA feature relies on an external executable to take care of the client part
     of the multi factor authentication. The NED will automatically call this executable for each challenge presented by the
     ssh server and expects to get a proper response in return.

     The executable can be a simple shell script or a program implemented in any programming language.

     The required behaviour is like this:
      - read one line from stdin
        The line passed from the NED will be a semi colon separated string containing the following info:
        ```
        [<device name>;<user>;<password>;<opaque>;<ssh server name>;<ssh server instruction>;<ssh server prompt>;]
        ```
        The elements for device name, user, password and opaque corresponds to what has been configured in NSO.
        The ssh server name, instruction and prompt are given by the ssh server during the authentication step.

        Each individual element in the semi colon separated list is Base64 encoded.

      - Extract the challenge based on the contents above.

      - Print a response matching the challenge to stdout and exit with code 0

      - In case a matching response can not be given do exit with code 2

     Below is a simple example of an MFA authenticator implemented in Python3:

     ```
     #!/usr/bin/env python3
     import sys
     import base64

     # This is an example on how to implement an external multi factor authentication handler
     # that will be called by the NED upon a ssh 'keyboard-interactive' authentication
     # The handler is reading a line from stdin with the following expected format:
     #   [<device name>;<user>;<password>;<opaque>;<ssh server name>;<ssh server instruction>;<ssh server prompt>;]
     # All elements are base64 encoded.

     def decode(arg):
         return str(base64.b64decode(arg))[2:-1]

     if __name__ == '__main__':
         query_challenges = {
             "admin@localhost's password: ":'admin',
             'Enter SMS passcode:':'secretSMScode',
             'Press secret key: ':'2'
         }
         # read line from stdin and trim brackets
         line = sys.stdin.readline().strip()[1:-1]
         args = line.split(';')
         prompt = decode(args[6])
         if prompt in query_challenges.keys():
             print(query_challenges[prompt])
             exit(0)
         else:
             exit(2)
     ```

  3. Configure the authentication group used by the device instance to enable MFA. There
     are two configurables available:
     - executable    The path to the external multi factor authentication executable (mandatory).
     - opaque        Opaque data that will passed as a cookie element to the executable (optional).

     ```
     > ncs_cli -C -u admin
     admin@ncs# config
     Entering configuration mode terminal
     admin@ncs(config)# devices authgroups group <name> default-map mfa executable <path to the executable>
     admin@ncs(config)# devices authgroups group <name> default-map mfa opaque <some opaque data>
     admin@ncs(config)# commit
     ```

  4. Try connecting to the device.


## 10.1 Trouble shooting
------------------------
  In case of connection problems the following steps can help for debugging:

  Enable the NED trace in debug level:

  ```
  > devices device dev-1 trace raw
  > devices device dev-1 ned-settings nec-ipasolink-vr logger level debug
  > commit
  ```

  Try connect again

  Inspect the generated trace file.

  Verify that the ssh client is using the external authenticator executable:

  ```
  using ssh external mfa executable: <configured path to executable>
  ```

  Verify that the executable is called with the challenges presented by the ssh server:

  ```
  calling external mfa executable with ssh server given name: '<name>', instruction: '<instruction>', prompt '<challenge>'
  ```

  Check for any errors reported by the NED when calling the executable

  ```
  ERROR: external mfa executable failed <....>
  ```

# 11. The load-native-config feature
------------------------------------

The nec-ipasoling-vr NED supports the load-native-config feature. The user can check if a specific configuration is supported or not by the NED.  
The load-native-config feature is used without a real connection towards the target device.

The user can choose to load the configuration by providing a configuration string or to load the configuration from a file.  
An important thing to take into account is that the configuration must be provided in the native format of the device.  
The current devices(VR4 and VR10) contain an '\r\n' at the end of each line and each configuration is found between the  
'configuration' and 'exit' strings.  
Therefore, these must be provided by the user when the 'load-native-config' command is called.

Examples:
 - providing a string with device's native configuration

```
admin@ncs(config-device-dev-1)# load-native-config data "configuration\r\ninterface lag-radio 1\r\nvlan trunk 3300\r\n!\r\nexit\r\n!\r\nexit"
admin@ncs(config-device-dev-1)# show config
devices device dev-1
 config
  interface lag-radio 1
   vlan trunk 3300
  exit
 !
!
```

 - providing the configuration from a file

```
admin@ncs(config)# devices device dev-1 load-native-config file file-config.txt
```

In the 'file-config.txt' file, the configuration can be copied directly from the target device, i.e. get the output after running  
the 'show running-config eth-function' command.


# 12. Handling default values
-----------------------------

There are parameters with default values, which are not visible on the VR devices when set.  
Given the following example(only parameters of interest are displayed below):

```
interface eth 9/2
 flow-control enable
 als enable 60
exit
```

Because the elements above are individual elements (and not components of list entries), to set them on the default, the user  
can set each of them with the associated default value or negate the command.

Set with default values:
```
interface eth 9/2
 flow-control disable
 als disable
exit
```

Deleting the parameters:
```
interface eth 9/2
 no flow-control
 no als
exit
```
In the end, the output will be the same.

On the other hand, if there are elements with default values and part of an list entry, the device will remove the entire list entry, when all the parameters are set on default.  
The expected output here(from NSO point of view), was to keep the list entry (with its id only) and remove all the other elements/leaves with default values.  

Example:  
Lets's suppose the following configuration is present on the device:

```
qos shaper queue-profile configuration 15
 priority 0 wtd 90
 priority 0 shaper min 10 scheduler dwrr 16
exit
```

If the user wants to set the 'priority 0' with the default elements as below:
```
qos shaper queue-profile configuration 15
 priority 0 wtd 100
 priority 0 shaper min 0 scheduler sp
exit
```

The NSO expects to have the following configuration visible in NED's CDB:
```
qos shaper queue-profile configuration 15
 priority 0
exit
```

But on the device, the 'priority 0' list entry is completely missing, which will trigger a compare-config diff.  
As a workaround, to keep the sychronization between the NED's CDB and device, the user will have to issue a `no` command like this: 'no priority 0'.


A similar situation occurs in the 'qos shaper queue-profile configuration 15' case as well.  
Assuming this is the initial configuration:

```
qos shaper queue-profile configuration 15
 name 5G_MBH_DSCP_4-COS_NSO
 priority 0 length 5632
 priority 2 shaper min 100 scheduler dwrr 1
 priority 2 wtd 90
exit
```

If the user sets all the parameters above with default values:

```
qos shaper queue-profile configuration 15
 name ""
 priority 0 length 64
 priority 2 wtd 100
 priority 2 shaper min 0 scheduler sp
exit
```

Then, the entire list entry, 'qos shaper queue-profile configuration 15' will disappear from the device.  
On the other hand, on the NED side, the result will look like this:

```
qos shaper queue-profile configuration 15
 priority 0
 priority 2
exit
```

To avoid the compare-config issue above, the user must use the following command: `no qos shaper queue-profile configuration 15`, instead of setting all the parameters with default values.

Another similar situation is the one described below:  
Given the following configuration:

```
qos class default-priority port eth 13/1 priority 2
```
If the user wants to set 'priority' to '0', he has to run the following command:

```
no qos class default-priority port eth 13/1
```
instead of:
```
qos class default-priority port eth 13/1 priority 0
```
which makes the entire entry to be deleted from the device.
