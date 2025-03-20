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
  11. NETSIM testing
  12. How to properly config 'ip access-list standard/extended' on a Ruckus device
  13. The load-native-config feature
  ```


# 1. General
------------

  This document describes the brocade-ironware NED.

  The brocade-ironware NED addresses the following devices:  
   - ServerIron ADX
   - IronWare MLX
   - FastIron Ruckus
   - Brocade FastIron SX800/Foundry 2402/4802

  The NED connects to the devices CLI using SSH or TELNET.
  The configuration is done by sending native CLI commands to the device
  through the communication channel.

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
  | live-status show          | yes       | -                                                                |
  |                           |           |                                                                  |
  | load-native-config        | yes       | -                                                                |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Brocade ServerIron ADX    | 12.5            | Server | -                                                 |
  |                           |                 | Iron   |                                                   |
  |                           |                 | ADX    |                                                   |
  |                           |                 |        |                                                   |
  | Brocade MLX               | 4.2             | IronWa | -                                                 |
  |                           |                 | re     |                                                   |
  |                           |                 |        |                                                   |
  | Brocade MLX               | 5.x             | IronWa | -                                                 |
  |                           |                 | re     |                                                   |
  |                           |                 |        |                                                   |
  | FastIron Ruckus           | 10.1            | FastIr | -                                                 |
  |                           |                 | on     |                                                   |
  |                           |                 |        |                                                   |
  | Brocade FastIron SX800    | 07.2.02hT3e3    | FastIr | -                                                 |
  |                           |                 | on     |                                                   |
  |                           |                 |        |                                                   |
  | Foundry 2402-4802         | 04.0.00aTc1     | FastIr | -                                                 |
  |                           |                 | on     |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-brocade-ironware-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-brocade-ironware-1.0.1.signed.bin
      > ./ncs-6.0-brocade-ironware-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-brocade-ironware-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-brocade-ironware-1.0.1.tar.gz
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
     `brocade-ironware-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-brocade-ironware-1.0.1.tar.gz
     > ls -d */
     brocade-ironware-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package brocade-ironware-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package brocade-ironware-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-brocade-ironware-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package brocade-ironware-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/brocade-ironware-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-brocade-ironware-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-brocade-ironware-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install brocade-ironware-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-brocade-ironware-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-brocade-ironware-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id brocade-ironware-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-brocade-ironware-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings brocade-ironware logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings brocade-ironware logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.ironware \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings brocade-ironware logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings brocade-ironware logger java true
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

  **Configuration for the ServerIron ADX device:**

  ```
  adx:snmp-server community test1 ro
  adx:clock timezone us Arizona
  adx:hostname host1

  admin@ncs(config-config)# commit dry-run outformat native
  native {
     device {
         name dev-1
         data hostname host1
              snmp-server community test1 ro
              clock timezone us Arizona
     }
  }
  ```
  Note:
   - for the 'snmp-server community' entry, the related value(*test1*) will be encrypted by the device.  
     So, in order to have a synchronization between the NED and the device, the NED will decrypt the value, based on a mapping table stored on the NED side.


  **Configuration for the IronWare MLX device:**

  ```
  mlx:vlan 1 name DEFAULT-VLAN
  mlx:aaa authentication login default local
  router mpls
   vll s3 1 raw-mode cos 1
    vll-peer 18.1.1.1
    vlan 101
     tagged ethernet 1/1
    exit
   exit
  exit
  policy-map CUST-100Mb
  exit
  mlx:interface ethernet 1/1
   rate-limit input vlan-id 101 policy-map CUST-100Mb
  exit


  admin@ncs(config-config)# show config
  router mpls
   vll s3 1 raw-mode cos 1
    vlan 101
     tagged ethernet 1/1
    exit
    vll-peer 18.1.1.1
   exit
  exit
  mlx:interface ethernet 1/1
  exit
  policy-map CUST-100Mb
  exit
  mlx:interface ethernet 1/1
   rate-limit input vlan-id 101 policy-map CUST-100Mb
  exit


  admin@ncs(config-config)# commit dry-run outformat native
  native {
      device {
          name dev-1
          data router mpls
               vll s3 1 raw-mode cos 1
               vlan 101
               tagged ethernet 1/1
               exit
               vll-peer 18.1.1.1
               exit
               exit
               interface ethernet 1/1
               exit
               policy-map CUST-100Mb
               exit
               interface ethernet 1/1
               rate-limit input vlan-id 101 policy-map CUST-100Mb
               exit
      }
  }
  ```


  **Configuration for the FastIron RUCKUS device:**

  Example 1: create a banner

  ```
  ruckus:vlan 123 name testVlan by port
   tagged ethe 1/1/1
   untagged ethe 1/2/1
  exit

  ruckus:clock timezone europe GMT
  ruckus:snmp-server community 2 $U2kyXj1k ro
  ruckus:snmp-server community test2 ro

  admin@ncs(config-config)# commit dry-run outformat native
  native {
      device {
          name dev-1
          data vlan 123 name testVlan by port
               tagged ethe 1/1/1
               untagged ethe 1/2/1
               exit
               clock timezone europe GMT
               snmp-server community 2 $U2kyXj1k ro
               snmp-server community test2 ro
      }
  }
  ```

  Note:
   - for the 'snmp-server community', the values are also encrypted by the device, but only for the second format('test2').  
   In this case, there is no mapping table available (compared to the ADX device), and the related encrypted values are stored into Operational DB(ODB). This is transparent for the user.

  Example setting a banner:

  ```
  admin@ncs(config-config)# banner motd "another banner\r\nfor test\r\nthird line"
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name dev-1
          data no banner motd
               banner motd 
               another banner
               for test
               third line
      }
  }

  admin@ncs(config-config)# commit
  Commit complete.

  admin@ncs(config-config)# compare-config
  admin@ncs(config-config)# 
  ```

  Important notes:  
   - the old banner is first deleted, otherwise the new text is appended to the old text of the banner
   - new lines are given by the user with "\r\n"
   - if a space is present at the beginning of a new line, the device will trim that space. Hence, please  
     don't start a new row with spaces, to avoid compare-config diffs.
   - the device will use a delimiter character, for separating the banner's text. Its default value is "{".  
     The user must not use this value when setting the text. This delimiter is also configurable under ned-settings:  
     `admin@ncs(config-device-dev-1)# ned-settings brocade-ironware banner-delimeter-fastiron`.  
     Please don't forget to use `disconnect()` and `connect()` to enable the ned-setting.  
     For instance, if the delimiter is changed to "z", at the first occurence of letter "z" the text of the banner is considered finished
   - the last line of the banner must not end with "\r\n".


  Example 2: create snmp-server hosts

  ```
  admin@ncs(config-config)# ruckus:snmp-server host 1.2.3.4 version v1 community1 port 34
  admin@ncs(config-config)# ruckus:snmp-server host 1.2.3.4 version v2c community2 port 35
  admin@ncs(config-config)# ruckus:snmp-server host 1.2.3.5 version v3 auth aa port 19

  admin@ncs(config-config)# commit dry-run outformat native
  native {
      device {
          name dev-1
          data snmp-server host 1.2.3.4 version v1 community1 port 34
               snmp-server host 1.2.3.4 version v2c community2 port 35
               snmp-server host 1.2.3.5 version v3 auth aa port 19
      }
  }
  admin@ncs(config-config)#
  ```
  On the device, entries above appear like:

  ```
  snmp-server host 1.2.3.4 version v1 .....
  snmp-server host 1.2.3.4 version v2c .....
  snmp-server host 1.2.3.5 version v3 auth aa port 19
  ```

  Note:
   - At sync-from, NED will check what are the CDB related data for "community" and "port" and will build the entire snmp-server host entries, similar as when they were created. This way, the compare-config diffs are avoided.  
   For those snmp-server host entries that are already present on the device, there is no deletion operation supported, since the device requires both community and port parameters to be provided at deletion.  
   For the version "v3", entries appear completely on the device.  
   The NED knows if an entry on the device is incomplete, by looking at the five dots `.....`.


# 5. Built in live-status actions
---------------------------------

  The NED includes support for operational `show` commands and the following action can be used:  
  `devices device live-status exec show <any>`.

  Example for the MLX device:

  ```
  admin@ncs(config)# devices device dev-1 live-status exec show version
  result 
  System Mode: MLX
  Chassis: NetIron 4-slot (Serial #: SA13075075,  Part #: 35550-000B)
  NI-X-SF  Switch Fabric Module 1 (Serial #: SA1507ABCD,  Part #: 31148-111F)
  FE 1: Type fe200,  Version 1
  Switch Fabric Module 1 Up Time is 100 days 18 hours 43 minutes 49 seconds 
  NI-X-SF  Switch Fabric Module 2 (Serial #: SA15000000,  Part #: 331148-111F)
  FE 1: Type fe200,  Version 22
  Switch Fabric Module 2 Up Time is 100 days 18 hours 43 minutes 49 seconds 
  ==========================================================================
  SL M1: NI-MLX-MR Management Module Active (Serial #: SA46000000, Part #:    331148-111F):
  Boot     : Version 5.6.0T165 Copyright (c) 1996-2013 Brocade Communications Systems, Inc.

  ```


# 6. Built in live-status show
------------------------------

  Examples of running live-status commands for the MLX device:

  ```
  admin@ncs# show devices device dev-1 live-status interfaces
  TYPE               NAME  IP ADDRESS         MAC ADDRESS     
  ------------------------------------------------------------
  10GigabitEthernet  1/1   -                  0012.f290.1100  
  10GigabitEthernet  1/2   -                  0012.f290.1101  
  10GigabitEthernet  1/3   -                  0012.f290.1102  
  10GigabitEthernet  1/4   -                  0012.f290.1103  
  management         1     100.20.131.134/25  0012.f290.1100  
  ```

  The time for which values are stored in the memory is called ttl(time to live) and this is configurable under ned-settings:

  ```
  admin@ncs(config)# devices device dev-1 ned-settings brocade-ironware live-status time-to-live 50
  ```

  50 represents the value of 50 seconds.


# 7. Limitations
----------------

  ## 7.1 ipv6 access-list

  When configuring a permit or deny statement, a 'sequence' number will be assigned automatically by the device.
  The default value is 10, and then 20, 30 and so on. In order to avoid compare-config diffs between the NED and the
  target device, the user must provide explicitly the 'sequence' number when a permit or deny statement is set.

  Example:  
  Make sure to provide 'sequence' number like below:

  ```
  ipv6 access-list acl3
   sequence 3 permit ipv6 any host 2610:20:6f96:96::3
   sequence 8 permit ipv6 any host 2610:20:6f96:96::4
  exit
  ```

  instead of:

  ```
  ipv6 access-list acl3
   permit ipv6 any host 2610:20:6f96:96::3
   permit ipv6 any host 2610:20:6f96:96::4
  exit
  ```
  ## 7.2 web-management https

  On the Ruckus device, when 'https' is set, the value is not visible (this is a default value). If the user will set again
  the same value, the device returns a warning: "HTTPS already enabled".  
  In the ncs_cli, similar to the device, the 'https' is not visible. To be sure the 'https' value is set, the user can run the following command:  
  `show full | include https | details`.  
  If the output is: "ruckus:web-management https", it means the 'https' is already set. Trying to set it again will explicitly write the value  
  into CDB and will send the command to the device.  
  The user can disable the 'https' by running the following command:  
  `no ruckus:web-management https`.


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
     admin@ncs(config)# devices device dev-1 ned-settings brocade-ironware logging level debug
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
  > devices device dev-1 ned-settings brocade-ironware logger level debug
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

# 11. NETSIM testing
-------------------

NETSIM is configured to emulate the ADX device by default. To enable the MLX behaviour set the following env. variable  
before building netsim:  
 `export NETSIM_BROCADE_DEV_TYPE=MLX`

To enable the RUCKUS behavior, set the env. variable like this:  
 `export NETSIM_BROCADE_DEV_TYPE=RUCKUS`

To enable the FastIron SX behavior, set the env. variable like this:  
 `export NETSIM_BROCADE_DEV_TYPE=FSX`

# 12. How to properly config 'ip access-list standard/extended' on a Ruckus device
----------------------------------------------------------------------------------

Important notes:
- both 'ip access-list standard' and 'ip access-list extended' list are configurable in a similar manner.  
   Below you can find more details and examples referring to the 'extended' case
- rule 'sequence number' must always be provided by the user to avoid compare-config diffs
- on ruckus device, rules sequence numbers are ordered in ascending order
- in ncs_cli, the last created rule is added at the end of the list, no matter what the sequence number has,  
   if not chosen otherwise by the user
- to add a new rule with a smaller sequence number, the user must use the `insert` command and place the rule  
   in the right position with `after` or `before` existing sequence numbers
- if a new rule is not created after/before the correct existing rule sequnce number, the user can use the `move` command  
   or `sync-from` command to avoid out-of-sync issues
- to change an existing rule, the rule must be deleted first and then created withe new values.  
   Otherwise the device returns an error: "Error:ACL filter add failed! (Duplicate filter found. ErrorCode:2|2|1021)".


**Below, you can see an example on how to create an ip access-list extended:**

```
admin@ncs(config-config)#  ruckus:ip access-list extended acle50
admin@ncs(config-std-ipacl-acle50)#    remark Denies all OSPF traffic, with logging
admin@ncs(config-std-ipacl-acle50)#    sequence 7 deny ospf any any log
admin@ncs(config-std-ipacl-acle50)#    remark new text for sequence 8
admin@ncs(config-std-ipacl-acle50)#    sequence 8 deny ip host 10.157.22.103 host 10.157.21.1 log
admin@ncs(config-std-ipacl-acle50)# exit

admin@ncs(config-config)# show config
ruckus:ip access-list extended acle50
 remark Denies all OSPF traffic, with logging
 sequence 7 deny ospf any any log
 remark new text for sequence 8
 sequence 8 deny ip host 10.157.22.103 host 10.157.21.1 log
!

admin@ncs(config-config)# commit dry-run outformat native 
native {
    device {
        name dev-1
        data ip access-list extended acle50
             remark Denies all OSPF traffic, with logging
             sequence 7 deny ospf any any log
             remark new text for sequence 8
             sequence 8 deny ip host 10.157.22.103 host 10.157.21.1 log
             !
    }
}

```

One important thing to mention here is that the 'sequence number' must be provisioned by the user all the time.  
Even if the device accepts rules without mentioning the sequence number, a sequence number will be added automatically  
by the device itself. Hence, to avoid further compare-config diffs, the sequence number must be provided by the user from the beginning.

If the user continues to add more rules to the 'acle50' access-list, then he must pay attention to the sequece number.  
The device will display the rules in ascending order according to the sequence number.  
On the other hand, in ncs_cli the last created rule is added at the end of the list, no matter what is the sequence number, if not chosen otherwise by the user.  
For example, if the sequence number of the new rule is greater than all the sequence numbers of the existing rules, then the rule is simple created, as below:

```
admin@ncs(config-config)# ruckus:ip access-list extended acle50
admin@ncs(config-std-ipacl-acle50)# remark this is another rule test
admin@ncs(config-std-ipacl-acle50)# sequence 22 deny ip host 10.157.21.105 host 10.157.22.10 log

admin@ncs(config-std-ipacl-acle50)# show config
ruckus:ip access-list extended acle50
 remark this is another rule test
 sequence 22 deny ip host 10.157.21.105 host 10.157.22.10 log
!

admin@ncs(config-std-ipacl-acle50)# commit dry-run outformat native 
native {
    device {
        name dev-1
        data ip access-list extended acle50
             remark this is another rule test
             sequence 22 deny ip host 10.157.21.105 host 10.157.22.10 log
             !
    }
}

admin@ncs(config-std-ipacl-acle50)# commit
Commit complete.
```

As you can see below, the rule is added last:

```
admin@ncs(config-std-ipacl-acle50)# show full
devices device dev-1
 config
  ruckus:ip access-list extended acle50
   remark Denies all OSPF traffic, with logging
   sequence 7 deny ospf any any log
   remark this is another rule test
   sequence 22 deny ip host 10.157.21.105 host 10.157.22.10 log
  !
 !
!
```

**Create a new rule with sequence number smaller than the existing sequence numbers rules**

Let's suppose the user wants to create a new rule with sequence number 10, which must come after existing 'sequence 7 deny ospf any any log', to respect the ascending order.

To be able to do that, the user must use the `insert` command and move the rule with `before` or `after` keywords.  
First, let's create the remark associated to the new rule and then the rule itself:

```
admin@ncs(config-std-ipacl-acle50)# top insert devices device dev-1 config ruckus:ip access-list extended acle50 remark Permits ICMP traffic from 10.157.22.x to 10.157.21.x before remark this is another rule test
```

This is how the access-list looks at the moment:

```
admin@ncs(config-std-ipacl-acle50)# show full
devices device dev-1
 config
  ruckus:ip access-list extended acle50
   remark Denies all OSPF traffic, with logging
   sequence 7 deny ospf any any log
   remark Permits ICMP traffic from 10.157.22.x to 10.157.21.x
   remark this is another rule test
   sequence 22 deny ip host 10.157.21.105 host 10.157.22.10 log
  !
 !
!
```

Now, let's create the rule with sequence number 10:

```
admin@ncs(config-std-ipacl-acle50)# top insert devices device dev-1 config ruckus:ip access-list extended acle50 sequence 10 permit icmp 10.157.22.0 0.0.0.255 10.157.21.0 0.0.0.255 before remark this is another rule test 

admin@ncs(config-std-ipacl-acle50)# show config
ruckus:ip access-list extended acle50
 ! after sequence 7 deny ospf any any log
 remark Permits ICMP traffic from 10.157.22.x to 10.157.21.x
 sequence 10 permit icmp 10.157.22.0 0.0.0.255 10.157.21.0 0.0.0.255
!

admin@ncs(config-std-ipacl-acle50)# commit
Commit complete.
```

Using `insert` will help us move the new created rule on the right position. Now, our new list looks like below:

```
admin@ncs(config-std-ipacl-acle50)# show full
devices device dev-1
 config
  ruckus:ip access-list extended acle50
   remark Denies all OSPF traffic, with logging
   sequence 7 deny ospf any any log
   remark Permits ICMP traffic from 10.157.22.x to 10.157.21.x
   sequence 10 permit icmp 10.157.22.0 0.0.0.255 10.157.21.0 0.0.0.255
   remark this is another rule test
   sequence 22 deny ip host 10.157.21.105 host 10.157.22.10 log
  !
 !
!
```

**What to do if a rule is not correctly created using `insert`**

If the user creates a new rule with a sequence number smaller than the sequence numbers of the existing rules, the new rule is added last.  
In our list above, let's create a new rule entry:

```
admin@ncs(config-std-ipacl-acle50)# sequence 20 permit ip any any

admin@ncs(config-std-ipacl-acle50)# commit dry-run outformat native 
native {
    device {
        name dev-1
        data ip access-list extended acle50
             sequence 20 permit ip any any
             !
    }
}

admin@ncs(config-std-ipacl-acle50)# commit
Commit complete.

admin@ncs(config-std-ipacl-acle50)# show full
devices device dev-1
 config
  ruckus:ip access-list extended acle50
   remark Denies all OSPF traffic, with logging
   sequence 7 deny ospf any any log
   remark Permits ICMP traffic from 10.157.22.x to 10.157.21.x
   sequence 10 permit icmp 10.157.22.0 0.0.0.255 10.157.21.0 0.0.0.255
   remark this is another rule test
   sequence 22 deny ip host 10.157.21.105 host 10.157.22.10 log
   sequence 20 permit ip any any
  !
 !
!
```

As you can see, this is added last. Because the device orders rules in ascending order, we get compare-config diffs.

To avoid this, the user has 2 options:  
 1. use `sync-from` command to be in sync again and have the right order, i.e. sequence 20 after sequence 10
 2. use the `move` command to bring the sequence 20 rule in the right position (after sequence 10)

Example for use-case 2:

```
admin@ncs(config-std-ipacl-acle50)# top move devices device dev-1 config ruckus:ip access-list extended acle50 sequence 20 permit ip any any after sequence 10 permit icmp 10.157.22.0 0.0.0.255 10.157.21.0 0.0.0.255 

admin@ncs(config-std-ipacl-acle50)# show config
ruckus:ip access-list extended acle50
 ! after sequence 10 permit icmp 10.157.22.0 0.0.0.255 10.157.21.0 0.0.0.255
 sequence 20 permit ip any any
!

admin@ncs(config-std-ipacl-acle50)# commit dry-run outformat native 
native {
    device {
        name dev-1
        data ip access-list extended acle50
             !
    }
}


admin@ncs(config-std-ipacl-acle50)# commit
Commit complete.
```

There is no new command to be sent to the device. Still, a connect to the device and a computation of the transaction ID are performed here.

Now, looking at the ncs_cli, the list will have the rules in ascending order, similar to the device order:

```
admin@ncs(config-std-ipacl-acle50)# show full
devices device dev-1
 config
  ruckus:ip access-list extended acle50
   remark Denies all OSPF traffic, with logging
   sequence 7 deny ospf any any log
   remark Permits ICMP traffic from 10.157.22.x to 10.157.21.x
   sequence 10 permit icmp 10.157.22.0 0.0.0.255 10.157.21.0 0.0.0.255
   sequence 20 permit ip any any
   remark this is another rule test
   sequence 22 deny ip host 10.157.21.105 host 10.157.22.10 log
  !
 !
!
```

**How to update an existing rule sequence number**

If a sequence number is needed to be changed, then the existing sequence number must be deleted first, otherwise the device returns 
the following error: "Error:ACL filter add failed! (Duplicate filter found. ErrorCode:2|2|1021)".  
Let's suppose we want to change the rule with sequence 10.

Please check the example below:

```
admin@ncs(config-std-ipacl-acle50)# no remark Permits ICMP traffic from 10.157.22.x to 10.157.21.x
admin@ncs(config-std-ipacl-acle50)# no sequence 10 permit icmp 10.157.22.0 0.0.0.255 10.157.21.0 0.0.0.255
```

This is our current list, before commit, where sequence 10 has been deleted:

```
admin@ncs(config-std-ipacl-acle50)# show full
devices device dev-1
 config
  ruckus:ip access-list extended acle50
   remark Denies all OSPF traffic, with logging
   sequence 7 deny ospf any any log
   sequence 20 permit ip any any
   remark this is another rule test
   sequence 22 deny ip host 10.157.21.105 host 10.157.22.10 log
  !
 !
!

admin@ncs(config-std-ipacl-acle50)# top insert devices device dev-1 config ruckus:ip access-list extended acle50 remark Permits ICMP traffic from 10.156.20.x to 10.155.22.x after sequence 7 deny ospf any any log 

admin@ncs(config-std-ipacl-acle50)# top insert devices device dev-1 config ruckus:ip access-list extended acle50 sequence 10 permit icmp 10.156.20.0 0.0.0.255 10.155.22.0 0.0.0.255 after remark Permits ICMP traffic from 10.156.20.x to 10.155.22.x
```

Current list after changed the rule with sequence 10:

```
admin@ncs(config-std-ipacl-acle50)# show full
devices device dev-1
 config
  ruckus:ip access-list extended acle50
   remark Denies all OSPF traffic, with logging
   sequence 7 deny ospf any any log
   remark Permits ICMP traffic from 10.156.20.x to 10.155.22.x
   sequence 10 permit icmp 10.156.20.0 0.0.0.255 10.155.22.0 0.0.0.255
   sequence 20 permit ip any any
   remark this is another rule test
   sequence 22 deny ip host 10.157.21.105 host 10.157.22.10 log
  !
 !
!
```

Below, you can see the changes and how they will sent to the device with `commit dry-run outformat native' command:

```
admin@ncs(config-std-ipacl-acle50)# show config
ruckus:ip access-list extended acle50
 no remark Permits ICMP traffic from 10.157.22.x to 10.157.21.x
 no sequence 10 permit icmp 10.157.22.0 0.0.0.255 10.157.21.0 0.0.0.255
 ! after sequence 7 deny ospf any any log
 remark Permits ICMP traffic from 10.156.20.x to 10.155.22.x
 sequence 10 permit icmp 10.156.20.0 0.0.0.255 10.155.22.0 0.0.0.255
!

admin@ncs(config-std-ipacl-acle50)# commit dry-run outformat native 
native {
    device {
        name dev-1
        data ip access-list extended acle50
             no remark Permits ICMP traffic from 10.157.22.x to 10.157.21.x
             no sequence 10
             remark Permits ICMP traffic from 10.156.20.x to 10.155.22.x
             sequence 10 permit icmp 10.156.20.0 0.0.0.255 10.155.22.0 0.0.0.255
             !
    }
}
admin@ncs(config-std-ipacl-acle50)# commit
Commit complete.
```

After changing the rule with sequence 10, we can see the changed rule ocuppies the right position:

```
admin@ncs(config-std-ipacl-acle50)# show full
devices device dev-1
 config
  ruckus:ip access-list extended acle50
   remark Denies all OSPF traffic, with logging
   sequence 7 deny ospf any any log
   remark Permits ICMP traffic from 10.156.20.x to 10.155.22.x
   sequence 10 permit icmp 10.156.20.0 0.0.0.255 10.155.22.0 0.0.0.255
   sequence 20 permit ip any any
   remark this is another rule test
   sequence 22 deny ip host 10.157.21.105 host 10.157.22.10 log
  !
 !
!
```


# 13. The load-native-config feature
------------------------------------

The brocade-ironware NED supports the load-native-config feature. The user can check if a specific configuration is supported or not by the NED.

Since the NED covers different YANG modules, the NED usually chooses the right YANG module when a `connect` operation is performed.  
Since the load-native-config feature should be used without a real connection towards a device, a ned-setting has been added  
to by-pass the `connect` and creates a dummy connection.

In order to use that, the user must set the following ned-setting:
```
admin@ncs(config)# devices device dev-1 ned-settings brocade-ironware dummy-connection version ?
Description: Set version as below to choose the device type and the related Yang model. When set on empty, a real connection is performed.
Possible completions:
  <string>
  Brocade ServerIron ADX   consider a dummy connection for the ServerIron ADX device
  Brocade version 4.2      dummy connection for the MLX device version 4.2 or 5.x
  Chassis FastIron         dummy connection for the Foundry/FastIron SX800 device
  Ruckus                   consider a dummy connection for a FastIron Ruckus device
admin@ncs(config)# devices device dev-1 ned-settings brocade-ironware dummy-connection version 

admin@ncs(config)# devices device dev-1 ned-settings brocade-ironware dummy-connection version Chassis\ FastIron
admin@ncs(config-device-dev-1)# commit
Commit complete.

admin@ncs(config-device-dev-1)# disconnect
admin@ncs(config-device-dev-1)# connect
result false
info Failed to connect to device dev-1: transport closed
admin@ncs(config-device-dev-1)# *** ALARM connection-failure: Failed to connect to device dev-1: transport closed
admin@ncs(config-device-dev-1)# 

```
Once the version of the device is set and the dummy connection is established, then the load-native-config command can be called.

Please note that when the NED must connect to the real device, the ned-setting above must be set on empty string(""), which is the default value.

The user can choose to load the configuration by providing a configuration string or to load the configuration from a file.  
An important thing to take into account is that the configuration must be provided in the native format of the device.  
The current devices contain an '\r\n' at the end of each line and each configuration contains, at the beginning, the string  
'Current configuration:'.  
Therefore, these must be provided by the user when the 'load-native-config' command is called.

Examples:
 - providing a string with device's native configuration

```
admin@ncs(config-device-dev-1)# load-native-config data "Current configuration:\r\n!\r\nvlan 1 name DEFAULT-VLAN\r\nno untagged ethe 1/1 to 1/2\r\n!\r\nhostname host\r\n"
admin@ncs(config-device-dev-1)# show config
devices device dev1
 config
  mlx:vlan 1 name DEFAULT-VLAN
  !
  mlx:hostname host
 !
!
```

 - providing the configuration from a file

```
admin@ncs(config)# devices device dev-1 load-native-config file file-config.txt
```

In the 'file-config.txt' file, the configuration can be copied directly from the target device, i.e. get the output after running  
the 'show running-config' command.
