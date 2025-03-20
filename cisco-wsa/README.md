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

  This document describes the cisco-wsa NED.

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
  | netsim                    | yes       | additional info                                                  |
  |                           |           |                                                                  |
  | check-sync                | yes       | additional info                                                  |
  |                           |           |                                                                  |
  | partial-sync-from         | no        | additional info                                                  |
  |                           |           |                                                                  |
  | live-status actions       | yes       | additional info                                                  |
  |                           |           |                                                                  |
  | live-status show          | no        | additional info                                                  |
  |                           |           |                                                                  |
  | load-native-config        | yes       |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | S100V                     | 9.2.0           | AsyncO |                                                   |
  |                           |                 | S      |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-wsa-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-wsa-1.0.1.signed.bin
      > ./ncs-6.0-cisco-wsa-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-wsa-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-wsa-1.0.1.tar.gz
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
     `cisco-wsa-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-wsa-1.0.1.tar.gz
     > ls -d */
     cisco-wsa-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-wsa-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-wsa-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-wsa-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-wsa-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-wsa-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-wsa-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-wsa-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-wsa-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-wsa-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id cisco-wsa-gen-1.0
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

  `$NSO_RUNDIR/logs/ned-cisco-wsa-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-wsa logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-wsa logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.ciscowsa \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-wsa logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-wsa logger java true
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

  The NED has support for all operational  commands
   by use of the 'devices device live-status exec any' action.
   For example:

   admin@ncs(config-device-ciscowsa-2)# live-status exec any version
   result version

   Current Version
   ===============
   Product: Cisco S000V Web Security Virtual Appliance
   Model: S000V
   Version: 11.8.0-453
   Build Date: 2019-12-16
   Install Date: 2022-03-04 16:13:27
   Serial #: 0B97C2EF5959F84E95A8-D7A84831C406
   BIOS: 1.10.2-1ubuntu1
   CPUs: 1 expected, 1 allocated
   Memory: 4096 MB expected, 4096 MB allocated
   Hard disk: 200 GB, or 250 GB expected; 200 GB allocated
   RAID: NA
   RAID Status: Unknown
   RAID Type: NA
   BMC: NA
   Cisco DVS Engine: 1.0 (Never Updated)
   Cisco DVS Malware User Agent Rules: 0.554 (Never Updated)
   Cisco DVS Object Type Rules: 0.554 (Never Updated)
   Cisco Trusted Root Certificate Bundle: 2.0 (Tue Oct 05 13:36:26 2021)
   Cisco Certificate Blacklist: 1.3 (Tue May 04 11:37:10 2021)
   How-Tos: 1.0 (Never Updated)
   L4 Traffic Monitor Anti-Malware Rules: 1.0 (Never Updated)
   Cisco Web Usage Controls - Web Categorization Engine: 1.12.4.944 (Never Updated)
   Cisco Web Usage Controls - Dynamic Content Analysis Engine: 2.1.0-016 (Never Updated)
   Cisco Web Usage Controls - Dynamic Content Analysis Engine Data: 3.1.0001 (Never Updated)
   Cisco Web Usage Controls - Application Visibility and Control Engine: 1.1.0-076 (Never Updated)
   Cisco Web Usage Controls - Application Visibility and Control Data: 1.1.0.17-002 (Never Updated)
   Web Reputation IP Filters: 1529708330 (Never Updated)
   Web Reputation Rules: 1528401763 (Never Updated)
   Web Reputation URL Queries Database: 1529706637 (Never Updated)
   Talos Intelligence engine: 1.12.4.944 (Never Updated)
   Webroot Anti-Malware Engine: 2.1.5.8 (Never Updated)
   Webroot Engine Definition: 2.1.5.8 (Never Updated)
   Webroot Malware Categories DATs: 1353 (Never Updated)
   McAfee Anti-Malware Engine: 5700 (Never Updated)
   McAfee Engine Definition: 5200 (Never Updated)
   McAfee DATs: 5688 (Never Updated)
   Sophos Engine: 3.2.07.384.0_5.90 (Thu Feb 24 13:26:05 2022)
   Sophos IDE: 2022042202 (Fri Apr 22 14:10:17 2022)
   Advanced Malware Protection - Engine: 1.0 (Never Updated)
   Advanced Malware Protection - Engine Definition: 1.0
   Advanced Malware Protection - Pre-class Engine: 1.0 (Never Updated)
   Advanced Malware Protection - Cisco Internal Certificates: 1.0.0-101 (Tue May 04 11:36:44 2021)
   wsa01-anperic.ironport.local>


      To execute multiple commands, separate them with " ; "
      NOTE: Must be a white space on either side of the comma.
      For example:

   admin@ncs(config-device-ciscowsa-1)# live-status exec any "version ; status"
   result version

   .... (see above)

   wsa01-anperic.ironport.local>status

   Enter "status detail" for more information.

   Status as of:                  Fri Apr 22 15:36:43 2022 GMT
   Up since:                      Fri Mar 04 16:13:11 2022 GMT (48d 23h 23m 32s)
   System Resource Utilization:
     CPU                                    11.2%
     RAM                                    68.9%
     Reporting/Logging Disk                 12.2%
   Transactions per Second:
     Average in last minute                     0
   Bandwidth (Mbps):
     Average in last minute                 0.000
   Response Time (ms):
     Average in last minute                     0
   Connections:
     Total connections                          0
   wsa01-anperic.ironport.local>



   wsa96.lab.tail-f.com>


      Generally the command output parsing halts when the NED detects
      an operational prompt, however sometimes the command
      requests additional input, 'answer(s)' to questions.

      ned-settings cisco-wsa console extension

        Using these settings it is possible to define a separate way of
        interacting with the device, ignoring the default behaviour of the ned.

        Example ned-settings to uses applianceconfig to add an ESA appliance:

    ned-settings cisco-wsa console extension command CMD-APPC-ACCEPT Y
    ned-settings cisco-wsa console extension command CMD-APPC-IP 192.168.88.1
    ned-settings cisco-wsa console extension command CMD-APPC-NAME ESA
    ned-settings cisco-wsa console extension command CMD-APPC-NL "\n"
    ned-settings cisco-wsa console extension command CMD-APPC-OPER ADD
    ned-settings cisco-wsa console extension command CMD-APPC-PWD "password"
    ned-settings cisco-wsa console extension command CMD-APPC-TYPE 1
    ned-settings cisco-wsa console extension command CMD-APPC-USER "user"
    ned-settings cisco-wsa console extension command CMD-APPCFG applianceconfig
    ned-settings cisco-wsa console extension pattern PAT-APPC-DONE "Appliance .* added"
    ned-settings cisco-wsa console extension pattern PAT-APPC-ERR "The value must not already be in use|The address must be a hostname or an IP|[E]error.*|Unknown option"
    ned-settings cisco-wsa console extension pattern PAT-APPC-FTA "Would you like to configure file transfer access for this appliance"
    ned-settings cisco-wsa console extension pattern PAT-APPC-IP "Enter the IP address or hostname of an appliance to transfer data with"
    ned-settings cisco-wsa console extension pattern PAT-APPC-NAME "Enter a name to identify this appliance"
    ned-settings cisco-wsa console extension pattern PAT-APPC-OPER "Choose the operation you want to perform"
    ned-settings cisco-wsa console extension pattern PAT-APPC-PWD Password:
    ned-settings cisco-wsa console extension pattern PAT-APPC-SSH "Would you like to use a custom ssh port to connect to this appliance"
    ned-settings cisco-wsa console extension pattern PAT-APPC-TYPE "Please enter the type of Cisco appliance that this device is"
    ned-settings cisco-wsa console extension pattern PAT-APPC-USER Username:
    ned-settings cisco-wsa console extension action ACT-APPC
     init  CMD-APPCFG
     flush true
     state PAT-APPC-OPER sendCommand CMD-APPC-OPER next ACT-APPC
     state PAT-APPC-TYPE sendCommand CMD-APPC-TYPE next ACT-APPC
     state PAT-APPC-IP sendCommand CMD-APPC-IP next ACT-APPC
     state PAT-APPC-FTA sendCommand CMD-APPC-NL next ACT-APPC
     state PAT-APPC-SSH sendCommand CMD-APPC-NL next ACT-APPC
     state PAT-APPC-NAME sendCommand CMD-APPC-NAME next ACT-APPC
     state PAT-APPC-USER sendCommand CMD-APPC-USER next ACT-APPC
     state PAT-APPC-PWD sendSecret CMD-APPC-PWD next ACT-APPC
     state PAT-APPC-DONE sendCommand CMD-APPC-NL next ACT-APPC
     state PAT-OPER-PMT sendCommand CMD-SAVE next SAVE-CONFIG
     state PAT-APPC-ERR reportError next ACT-APPC
    !

   Example of execution:
   admin@ncs(config-device-ciscowsa-1)# live-status exec any ACT-APPC

   Due to legacy reasons, the following commands are also present (their state
   machine is hardcoded into the ned-console.json file.)

   5.1 createcomputerobject ->
   -----------------------------
   live-status exec createcomputerobject ?
   Possible completions:
     location  passphrase  real  username

   The action states are hardcoded in the ned-console file.

   5.2 Load License
   -----------------------------
   devices device <dev-name> live-status exec loadlicense <license file>

   5.3 Reboot
   -----------------------------
   devices device <dev-name> live-status exec reboot

   5.4 Showlicense
   -----------------------------
   devices device <dev-name> live-status exec showlicense

   5.5 upgrade downloadinstall
   -----------------------------
   devices device <dev-name> live-status exec any "upgrade downloadinstall <command>"
   result

    -- this above command takes a while to download and install (kindly update read-timeout respectively)


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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-wsa logging level debug
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

