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

  This document describes the cisco-ncs2k_tl1 NED.

  This NED does not contain any config model. NED only supports live-status actions and show.
  The NED uses the TL1 CLI connection to communicate with the device.

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
  | netsim                    | yes       | Live-status actions supported for netsim. Check README.md        |
  |                           |           | section 'Built in live-status actions'                           |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Check README.md section 'Built in live-status actions'           |
  |                           |           |                                                                  |
  | live-status show          | yes       | Check README.md section 'Built in live-status show'              |
  |                           |           |                                                                  |
  | check-sync                | no        | Not supported due to no config-model                             |
  |                           |           |                                                                  |
  | partial-sync-from         | no        | Not supported due to no config-model                             |
  |                           |           |                                                                  |
  | load-native-config        | no        | Not supported due to no config-model                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | NCS2KFS-M6                | 12.0.0          | TL1    |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-ncs2k_tl1-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package dowloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-ncs2k_tl1-1.0.1.signed.bin
      > ./ncs-6.0-cisco-ncs2k_tl1-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-ncs2k_tl1-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-ncs2k_tl1-1.0.1.tar.gz
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

  1. Untar the tar.gz file. This creates a new subdirectory named:
     `cisco-ncs2k_tl1-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-ncs2k_tl1-1.0.1.tar.gz
     > ls -d */
     cisco-ncs2k_tl1-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-ncs2k_tl1-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-ncs2k_tl1-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-ncs2k_tl1-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-ncs2k_tl1-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-ncs2k_tl1-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-ncs2k_tl1-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-ncs2k_tl1-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-ncs2k_tl1-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-ncs2k_tl1-gen-1.0
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
    admin@ncs(config)# devices authgroup my-group default-map remote-name <user name on device> \
                       remote-password <password on device>
    ```

  - Configure a new device instance (example: dev-1):

    ```
    admin@ncs(config)# devices device dev-1 address <ip address to device>
    admin@ncs(config)# devices device dev-1 port <port on device>
    admin@ncs(config)# devices device dev-1 device-type generic ned-id cisco-ncs2k_tl1-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
    ```
    # devices device dev-1 ned-settings cisco-ncs2k_tl1 tl1 connection telnet
    ```

    Optionally configure a TL1 CTAG to be used by the NED:
    ```
    # devices device dev-1 ned-settings cisco-ncs2k_tl1 tl1 connection ctag 1234
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

  `$NSO_RUNDIR/logs/ned-cisco-ncs2k_tl1-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-ncs2k_tl1 logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-ncs2k_tl1 logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.ncs2kTL1 \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-ncs2k_tl1 logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-ncs2k_tl1 logger java true
     admin@ncs(config)# commit
     ```

  **IMPORTANT**:
  Java logging does not use any IPC messages sent to NSO. Consequently, NSO performance is not
  affected. However, all log printouts from all log enabled devices are saved in one single file.
  This means that the usability is limited. Typically single device use cases etc.


# 3. Dependencies
-----------------

  This NED has the following host environment dependencies:

  - Java 1.8
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

  ```
  devices authgroups group dev-1
   default-map remote-name admin
   default-map remote-password AdminSecret!
  !
  devices device dev-1
   address 1.1.1.1
   port 23
   authgroup dev-1
   device-type generic ned-id cisco-ncs2k_tl1-gen-1.0
   ned-settings cisco-ncs2k_tl1 tl1 connection telnet
   ned-settings cisco-ncs2k_tl1 tl1 connection ctag 1234
   ned-settings cisco-ncs2k_tl1 logger level info
   state admin-state unlocked
  !
  ```


# 5. Built in live-status actions
---------------------------------

  ## 5.1 Live-status calls
  ------------------------

  Currently NED supports following live-status exec action.

  ```
  # devices device dev-1 live-status exec ?
  Possible completions:
    activate           Activate a new software release
    any                Specify what command to execute at the device
    get-alarms         Get system alarms
    get-info           Get system information
    remote-copy-file   Execute remote image copy to NCS2k
    revert             Revert to a prior software release
  ```

  Specify what command to run on the device.

  ```
  # devices device <device-name> live-status exec any command COMMAND
  ```

  Example:
  ```
  # devices device <device-name> live-status exec any command rtrv-crs-odu::all:pb:::;
  result

    NCS2K_4 2021-05-12 21:10:58
  M  pb COMPLD
  ;
  ```

  ## 5.2 Netsim Live-status calls
  -------------------------------

  Netsim cannot simulate the device. However, device output can be mapped to netsim commands.
  For a given device command, a fixed response can be added to netsim.

  This example demonstrates running the command rtrv-log:::123::alarm\; against netsim.
  Note:
    ; needs to be escaped as \;
    123 will be used as ctag where ctag is needed.

  ```
  admin@ncs(config)# devices device netsim-0 live-status exec any command "rtrv-log:::123::alarm\;"
    result
         NCS2K_4 2021-06-11 03:01:34
      M  123 COMPLD
         "SYSTEM,0:CURRENT=CR,,NODE-FACTORY-MODE,NSA,TIME=03:42:12,DATE=2020-02-25:Node in Factory Mode"
         "MSISC-1-A-1,1:CURRENT=MN,,CARLOSS,NSA,TIME=03:42:17,DATE=2020-02-25:Carrier Loss On The LAN"
         "MSISC-1-A-2,2:CURRENT=MN,,CARLOSS,NSA,TIME=03:42:17,DATE=2020-02-25:Carrier Loss On The LAN"
         "MSISC-1-A-3,3:CURRENT=MN,,CARLOSS,NSA,TIME=03:42:17,DATE=2020-02-25:Carrier Loss On The LAN"
         "ECU-1-1,4:CURRENT=CR,,EQPT-MISS,SA,TIME=03:42:22,DATE=2020-02-25:Replaceable Equipment/Unit is Missing"
         "MSISC-1-A-3,5:CURRENT=CL,,CARLOSS,NSA,TIME=03:42:22,DATE=2020-02-25:Carrier Loss On The LAN"
         "MSISC-1-A-2,6:CURRENT=CL,,CARLOSS,NSA,TIME=03:42:22,DATE=2020-02-25:Carrier Loss On The LAN"
         "MSISC-1-A-1,7:CURRENT=CL,,CARLOSS,NSA,TIME=03:42:22,DATE=2020-02-25:Carrier Loss On The LAN"
         "PWR-1-B,8:CURRENT=MN,,ELWBATVG,NSA,TIME=03:42:37,DATE=2020-02-25:Extreme Low Volt"
         "PWR-1-B,9:CURRENT=MN,,EQPT-MISS,NSA,TIME=03:42:47,DATE=2020-02-25:Replaceable Equipment/Unit is Missing"
         "PWR-1-B,10:CURRENT=CL,,ELWBATVG,NSA,TIME=03:42:57,DATE=2020-02-25:Extreme Low Volt"
         "SLOT-1-6,11:CURRENT=CR,,IMPROPRMVL,SA,TIME=02:49:47,DATE=2020-05-16:Improper Removal"
         "SYSTEM,12:CURRENT=MJ,,SYSBOOT,SA,TIME=00:47:03,DATE=2021-05-09:System Reboot"
         "SYSTEM,13:CURRENT=CR,,NODE-FACTORY-MODE,NSA,TIME=00:51:02,DATE=2021-05-09:Node in Factory Mode"
         "MSISC-1-A-1,14:CURRENT=MN,,CARLOSS,NSA,TIME=00:51:07,DATE=2021-05-09:Carrier Loss On The LAN"
         "MSISC-1-A-2,15:CURRENT=MN,,CARLOSS,NSA,TIME=00:51:07,DATE=2021-05-09:Carrier Loss On The LAN"
         "MSISC-1-A-3,16:CURRENT=MN,,CARLOSS,NSA,TIME=00:51:07,DATE=2021-05-09:Carrier Loss On The LAN"
         "ECU-1-1,17:CURRENT=CR,,EQPT-MISS,SA,TIME=00:51:12,DATE=2021-05-09:Replaceable Equipment/Unit is Missing"
         "MSISC-1-A-3,18:CURRENT=CL,,CARLOSS,NSA,TIME=00:51:12,DATE=2021-05-09:Carrier Loss On The LAN"
         "MSISC-1-A-2,19:CURRENT=CL,,CARLOSS,NSA,TIME=00:51:12,DATE=2021-05-09:Carrier Loss On The LAN"
         "MSISC-1-A-1,20:CURRENT=CL,,CARLOSS,NSA,TIME=00:51:12,DATE=2021-05-09:Carrier Loss On The LAN"
         "PWR-1-B,21:CURRENT=MN,,ELWBATVG,NSA,TIME=00:51:27,DATE=2021-05-09:Extreme Low Volt"
         "PWR-1-B,22:CURRENT=MN,,EQPT-MISS,NSA,TIME=00:51:37,DATE=2021-05-09:Replaceable Equipment/Unit is Missing"
         "PWR-1-B,23:CURRENT=CL,,ELWBATVG,NSA,TIME=00:51:46,DATE=2021-05-09:Extreme Low Volt"
  admin@ncs(config)#
  ```

  Supported commands:

    "rtrv-ne-gen:::123\;"
    "rtrv-log:::123::alarm\;"

  Currently netsim supports above commands, Please follow the steps below if user needs support for more live-status commands.

    1) export environment variable NCS2K_NETSIM_FILES, where NCS2K_NETSIM_FILES value is any local directory where netsim files can be placed.
       Example: export NCS2K_NETSIM_FILES=/home/<user>/ncs2k_netsim_files

    2) Create file name same as a command inside ncs2k netsim files directory and add output of the command in the created file.

       Example: /home/<user>/ncs2k_netsim_files/DLT-UNICFG::PSLINE-81-7-10-RX:3;

       NOTE: Make sure file content end with following text.
       ;
       >

       Example content in DLT-UNICFG::PSLINE-81-7-10-RX:3;

       actual content of a command
       ;
       >

    3) Execute a command via NSO.
       ```
       # devices device ncs2k-netsim live-status exec any command "DLT-UNICFG::PSLINE-81-7-10-RX:3\;"
       ```


# 6. Built in live-status show
------------------------------

  Currently NED supports following live-status show.

  ```
  # show devices device dev-1 live-status ?
  Possible completions:
    alarms
    info
  ```


# 7. Limitations
----------------

  The current version does not support any configuration data.

  The following is currently supported:
   - Fetching operational data for some nodes on the device.
   - Execute some actions on the device.


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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-ncs2k_tl1 logging level debug
     admin@ncs(config)# commit
     ```

  2. Configure the NSO to generate a raw trace file from the NED

     ```
     admin@ncs(config)# devices device dev-1 trace raw
     admin@ncs(config)# commit
     ```

  3. If the NED already had trace enabled, clear it in order to submit only relevant information

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

