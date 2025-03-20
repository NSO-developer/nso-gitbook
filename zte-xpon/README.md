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
  11. How to avoid out-of-sync
  12. Show partial
  ```


# 1. General
------------

  This document describes the zte-xpon NED.

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
  | partial-sync-from         | yes       | additional info                                                  |
  |                           |           |                                                                  |
  | live-status actions       | yes       | The ned supports all device commands                             |
  |                           |           |                                                                  |
  | live-status show          | yes       | The ned supports several dedicated show commands                 |
  |                           |           |                                                                  |
  | load-native-config        | no        | additional info                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```
  Custom NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | proxy                     | yes       | The NED supports up to 2 jumps                                   |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | C300                      |                 | ZXAN   |                                                   |
  |                           |                 |        |                                                   |
  | C320                      | 2.6.02A.21      | ZXAN   |                                                   |
  |                           |                 |        |                                                   |
  | C600                      |                 | ZXAN   |                                                   |
  |                           |                 |        |                                                   |
  | C610                      |                 | ZXAN   |                                                   |
  |                           |                 |        |                                                   |
  | ZXR10_5128E-FI 5900       | V3.01.10.B23.P0 | ZXR10  |                                                   |
  |                           | 1               |        |                                                   |
  |                           |                 |        |                                                   |
  | ZXR10_5128E-FI            | V2.8.23.C.16.P1 | ZXR10  |                                                   |
  | 5900E&5100E               | 8               |        |                                                   |
  |                           |                 |        |                                                   |
  | ZXR10 5960-32DL           | V5.00.00R2      | ZXR10  |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-zte-xpon-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-zte-xpon-1.0.1.signed.bin
      > ./ncs-6.0-zte-xpon-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-zte-xpon-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-zte-xpon-1.0.1.tar.gz
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
     `zte-xpon-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-zte-xpon-1.0.1.tar.gz
     > ls -d */
     zte-xpon-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package zte-xpon-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package zte-xpon-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-zte-xpon-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package zte-xpon-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/zte-xpon-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-zte-xpon-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-zte-xpon-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install zte-xpon-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-zte-xpon-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-zte-xpon-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id zte-xpon-cli-1.0
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

  For TELNET connection, the echo must be enabled (disabled by default):
  ```
       # ned-settings zte-xpon connection terminal server-echo true
  ```

   - When connecting through a proxy using SSH or TELNET

     Do as follows to setup to connect to a xpon device that resides
     behind a proxy or terminal server:

     +-----+  A   +-------+   B  +-----+
     | NSO | <--> | proxy | <--> | xpon |
     +-----+      +-------+      +-----+

     Setup connection (A):

     # devices device <xpondev> address <proxy address>
     # devices device <xpondev> port <proxy port>
     # devices device <xpondev> device-type cli protocol <proxy proto - telnet or ssh>
     # devices authgroups group ciscogroup umap admin remote-name <proxy username>
     # devices authgroups group ciscogroup umap admin remote-password <proxy password>
     # devices device <xpondev> authgroup ciscogroup

     Setup connection (B):

     Define the type of connection to the device:

     # devices device <xpondev> ned-settings zte-xpon proxy remote-connection <ssh|telnet>

     Define login credentials for the device:

     # devices device <xpondev> ned-settings zte-xpon proxy remote-name <user name on the xpon device>
     # devices device <xpondev> ned-settings zte-xpon proxy remote-password <password on the xpon device>

     Define prompt on proxy server:

     # devices device <xpondev> ned-settings zte-xpon proxy proxy-prompt <prompt pattern on proxy>

     Define address and port of xpon device:

     # devices device <xpondev> ned-settings zte-xpon proxy remote-address <address to the xpon device>
     # devices device <xpondev> ned-settings zte-xpon proxy remote-port <port used on the xpon device>
     # commit

     Complete example config:

     devices authgroups group jump-server default-map remote-name MYUSERNAME remote-password MYPASSWORD
     devices device ne40-via-1234 address 1.2.3.4 port 22
     devices device ne40-via-1234 authgroup jump-server device-type cli ned-id zte-xpon protocol ssh
     devices device ne40-via-1234 connect-timeout 60 read-timeout 120 write-timeout 120
     devices device ne40-via-1234 state admin-state unlocked
     devices device ne40-via-1234 ned-settings zte-xpon proxy remote-connection telnet
     devices device ne40-via-1234 ned-settings zte-xpon proxy proxy-prompt ".*#"
     devices device ne40-via-1234 ned-settings zte-xpon proxy remote-address 5.6.7.8
     devices device ne40-via-1234 ned-settings zte-xpon proxy remote-port 23
     devices device ne40-via-1234 ned-settings zte-xpon proxy remote-name admin
     devices device ne40-via-1234 ned-settings zte-xpon proxy remote-password admin987

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

  `$NSO_RUNDIR/logs/ned-zte-xpon-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings zte-xpon logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings zte-xpon logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.xpon \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings zte-xpon logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings zte-xpon logger java true
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

  ```
  #devices device zteC320 config

       interface gpon-olt_1/2/15
        onu 1 type ZTE-F601 pw AAA0000010
      exit
      interface gpon-onu_1/2/15:1
         dba mode sr
         tcont 1 profile TC_type3_500M_25M
         tcont 2 profile TC_type1_512k
         gemport 1 tcont 1 queue 1
         gemport 2 tcont 2 queue 2
         sn-bind enable sn
      exit
      pon-onu-mng gpon-onu_1/2/15:1
      service cos1 gemport 1 cos 1 vlan 935
      service cos5 gemport 2 cos 5 vlan 837
      vlan port eth_0/1 mode trunk
      vlan port eth_0/1 vlan 935,837
      vlan port eth_0/1 translate vlan 935 svlan 935 svlan-pri 1
      vlan port eth_0/1 translate vlan 837 svlan 837 svlan-pri 5
      exit

  ```

  See what you are about to commit:

  ```
     # commit dry-run outformat native
  native {
      device {
          name zteC320
          data interface gpon-olt_1/2/15
               onu 1 type ZTE-F601 pw AAA0000010
               exit
               !
               interface gpon-onu_1/2/15:1
               sn-bind enable sn
               tcont 1 profile TC_type3_500M_25M
               gemport 1 tcont 1 queue 1
               tcont 2 profile TC_type1_512k
               gemport 2 tcont 2 queue 2
               dba mode sr
               exit
               !
               pon-onu-mng gpon-onu_1/2/15:1
               service cos1 gemport 1 cos 1 vlan 935
               service cos5 gemport 2 cos 5 vlan 837
               vlan port eth_0/1 mode trunk
               vlan port eth_0/1 vlan 837,935
               vlan port eth_0/1 translate vlan 837 svlan 837 svlan-pri 5
               vlan port eth_0/1 translate vlan 935 svlan 935 svlan-pri 1
               exit
               !
      }
  }

  ```

  Commit new configuration in a transaction:

  ```
     # commit
     Commit complete.
  ```

  Verify that NSO is in-sync with the device:

  ```
      # devices device ztedev check-sync
      result in-sync
  ```

  Compare configuration between device and NSO:

  ```
     # devices device ztedev compare-config
     #
  ```

  Note: if no diff is shown, supported config is the same in NSO as on the device


# 5. Built in live-status actions
---------------------------------

  There are 2 kinds of operational commands that can be sent to the device:
    1. ANY command(s)
    2. Dedicated live-status commands

    ANY command(s)
    --------------

     The NED  has support for all operational ZTE xpon commands
     by use of the 'devices device live-status EXEC any' rpc.
     The output of the command(s) is returned in a single yang leaf of type string, called 'result'.

     For example:

      admin@ncs(config-device-zte-1)# live-status EXEC any "show running-config interface xgei_1/4/2"

  result show running-config interface xgei_1/4/2
  Building configuration...
  interface xgei_1/4/2
    phy-attribute lan
    shutdown
    hybrid-attribute fiber
    no negotiation auto
    speed 1000
    duplex full
    flowcontrol disable
    linktrap enable
    als disable
    switchport mode trunk
    switchport vlan 1,124 tag
    port-protect disable
    uplink-isolate disable
  !
  end
  ZXAN#
  admin@ncs(config-device-zte-1)#


     To execute multiple commands, separate them with " ; "
     NOTE: Must be a white space on either side of the comma.
     For example:

  admin@ncs(config-device-zte-1)# live-status EXEC any "show system-group ; terminal length 0"  

  result show system-group
  System Description: C320 Version V2.0.1P2 Software, Copyright (c) by ZTE Corpora
  tion Compiled
  System ObjectId: .1.3.6.1.4.1.3902.1082.1001.320.2
  Started before: 437 days, 5 hours, 59 minutes
  Contact with: contact@cisco.com
  System name:  ZXAN
  Location: SJC16/1
  This system primarily offers a set of 78 services
  ZXAN#terminal length 0
  ZXAN#


     Generally the command output parsing halts when the NED detects
     an operational or config prompt, however sometimes the command
     requests additional input, 'answer(s)' to questions.

     ned-settings zte-xpon console extension

       Using these settings it is possible to define a separate way of
       interacting with the device, ignoring the default behavior of the ned.

       Example ned-settings:

       devices device zte-1
         ned-settings zte-xpon console extension
           command CMD-ELABEL "show something"
           command CMD-ELABEL-ACCEPT "Y"
           pattern PAT-ELABEL-ACCEPT "Warning: .+ Continue\? \[Y/N\]:"
           action ACT-ELABEL
             init CMD-ELABEL
             flush true
             state PAT-ELABEL-ACCEPT sendCommand CMD-ELABEL-ACCEPT next ACT-ELABEL
             state PAT-OPER-PMT next DONE
           !
         !
       !

     Example executions:

       devices device zte-1 live-status exec any ACT-ELABEL

    Example with multiple custom extensions:
       devices device zte-1 live-status exec any "SEND-FTP ftp -a 1.2.3.4 5.6.7.8 ; SEND-FTP get my.file"


    Dedicated commands
    ------------------

    SHOW
    ----

    For show commands there is a dedicated command: "show", that is executing device show commands,
    similar with ANY commands, but faster, due to the simplified behavior of the commands: no user
    interaction is expected, hence, the code is simpler.
    Note that for show command that do require some prompt matching or user interaction, ANY command
    show be used.

    This command can also execute multiple show commands in one line, also " ; " separated, with the 
    difference that the "show" keyword must not be present in the subsequent commands (after " ; ",
    only show command argument must be present), as the NED will automatically add the keyword:


  admin@ncs(config-device-zte-1)# live-status EXEC show "gpon remote-onu interface pon gpon-onu_1/1/2:1 ; gpon remote-onu interface pon gpon-onu_1/1/2:1 ; system-group"                                                                                result                       
  Interface:                   pon_0/1
  GEM blocklen:                48 (bytes)
  SF threshold:                5
  SD threshold:                9
  Alarm:                       enable
  Alarm disable interval:      0
  Total T-CONT number:         8
  Piggyback DBA rpt mode:      not support
  Whole ONU DBA rpt mode:      N/A
  Rx optical level:            N/A
  Lower rx optical threshold:  ont internal policy
  Upper rx optical threshold:  ont internal policy
  Tx optical level:            N/A
  Lower tx optical threshold:  ont internal policy
  Upper tx optical threshold:  ont internal policy
  ONU response time:           0(ns)
  Power feed voltage:          0.00(V)
  Laser bias current:          0.000(mA)
  Temperature:                 0.000(C)


  Interface:                   pon_0/1
  GEM blocklen:                48 (bytes)
  SF threshold:                5
  SD threshold:                9
  Alarm:                       enable
  Alarm disable interval:      0
  Total T-CONT number:         8
  Piggyback DBA rpt mode:      not support
  Whole ONU DBA rpt mode:      N/A
  Rx optical level:            N/A
  Lower rx optical threshold:  ont internal policy
  Upper rx optical threshold:  ont internal policy
  Tx optical level:            N/A
  Lower tx optical threshold:  ont internal policy
  Upper tx optical threshold:  ont internal policy
  ONU response time:           0(ns)
  Power feed voltage:          0.00(V)
  Laser bias current:          0.000(mA)
  Temperature:                 0.000(C)


  System Description: C320 Version V2.0.1P2 Software, Copyright (c) by ZTE Corpora
  tion Compiled
  System ObjectId: .1.3.6.1.4.1.3902.1082.1001.320.2
  Started before: 355 days, 11 hours, 1 minutes
  Contact with: conact@cisco.com
  System name:  nedtest
  Location: SJC16/1
  This system primarily offers a set of 78 services

  admin@ncs(config-device-zte-1)#


# 6. Built in live-status show
------------------------------

  The Ned supports several dedicated live-status commands that usually run "show ****" commands and return
    the result, not in a single leaf as in ANY case, but in dedicated yang elements that are living in the 
    cache during the TTL time that is set via the /ned-settings/live-status time-to-live <seconds>.
    The Ned uses a TextFSM parser to get all the elements into displayed by the command into their yang elements.

    These are similar with NSO operational data and can be run either from the Exec mode of NSO:

    admin@ncs# show devices device zte14 live-status interface gei-0/1/1/5
    ...

    or from under config mode using "do" as prefix:

    admin@ncs# config                                                     
    Entering configuration mode terminal
    admin@ncs(config)# do show devices device zte14 live-status interface gei-0/1/1/5
    ...

    7.2.1 "show interface"
    --------------------------
    This command is currently implemented using the "show interface <interface name>" output from the devices:
    5900 Version: V3.01.10.B23.P01,
    5900E&5100E Version: V2.8.23.C.16.P18.

    The textfsm parser is specifically tailored to the above devices "show interface gei****" command output

    Note that other devices or interfaces might also work, if the command structure is the same and the output
    matches the above devices.


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
    - SSH/TELNET access to a device where the issue can be reproduced by the Cisco NSO NED team.
      This typically means both read and write permissions are required.
      Pseudo access via tools like Webex, Zoom etc is not acceptable.
      However, it is ok with device access through VPNs, jump servers etc though.

  Do as follows to gather the necessary information needed for your device, here named 'dev-1':

  1. Enable full debug logging in the NED

     ```
     ncs_cli -C -u admin
     admin@ncs# configure
     admin@ncs(config)# devices device dev-1 ned-settings zte-xpon logging level debug
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
  > devices device dev-1 ned-settings zte-xpon logger level debug
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

# 11. How to avoid out-of-sync
-----------------------------

The ZTE device is very dynamic and does various automatic changes to the running configuration.

E.g:
Deleting a onu interface from gpon-olt :

```
            interface gpon-olt_1/2/15
              no onu 1
            exit
```

The device will also delete the gpon-onu_1/2/15:1 interface and the pon-onu-mng/gpon-onu_1/2/15:1 interface

To be in sync with the device, the user must mimic its behavior. In this case, it has to send the following 
commands that will take care of the deletion inside NSO database. These commands will not be sent to the device by the ned:

```
        no interface gpon-onu_1/2/15:1
        no pon-onu-mng gpon-onu_1/2/15:1
```

## 11.1 "/ pon-onu-mng/gpon-onu_*/veip*/state" deletion
------------------------------------------------------

**Warning:** the following scenario will lead to out of sync due to a device limitation:

This special case involves "/ pon-onu-mng/gpon-onu_*/veip*/state":
Once set to "lock|unlock", in an already existing interface, the device doesn't provide 
any means to delete it and revert to the phase where the "state" was not set:

```
    interface gpon-onu_1/2/15:1
    ex
    pon-onu-mng gpon-onu_1/2/15:1
    commit  ---> Interface created
    veip 1 state lock
    commit  ---> State set in a second transaction

    rollback configuration
    commit
```

Diff:

```    
      pon-onu-mng gpon-onu_1/2/15:1
   + veip 1 state lock

```

To avoid this out-of-sync, the "veip/ state" must be set in the same transaction as the parrent interface creation:

```
    interface gpon-onu_1/2/15:1
    ex
    pon-onu-mng gpon-onu_1/2/15:1
    veip 1 state lock
    commit

```

This way, at rollback, the veip */state will be deleted once with the interface deletion.


## 11.2 Element deletion done by setting an element to a different value
-----------------------------------------------------------------------

Taking as example "/pppoe-intermediate-agent":

To delete a entry in 'pppoe-intermediate-agent vlan *', the device does't accept a "no" command 
on pppoe-intermediate-agent but it expects a 'disable' word to be sent after the vlan value:

```
    pppoe-intermediate-agent vlan 1000 disable
```

To be able to delete an entry, the NED will accept a 'no' command on this
element, but it will sent to the device the accepted version:

```
  "no pppoe-intermediate-agent vlan 1000" -> "pppoe-intermediate-agent vlan 1000 disable"
```

List of elements where a NSO NO command leads to a modify command that actually deletes the element(s):

     NSO command -> device command
     -----------------------------

   - no pppoe-intermediate-agent vlan * -> pppoe-intermediate-agent vlan * disable

   - no dhcpv4-l2-relay-agent vlan * -> dhcpv4-l2-relay-agent vlan * disable

   - no dhcpv6-l2-relay-agent vlan * -> dhcpv6-l2-relay-agent vlan * disable

   - no dhcpv4-l2-relay-agent -> dhcpv4-l2-relay-agent disable

   - no dhcpv6-l2-relay-agent -> dhcpv6-l2-relay-agent disable

   - no pppoe-plus enable vport * -> pppoe-plus disable vport *

   - no dhcp-option82 enable vport * -> dhcp-option82 disable vport *

   - no pppoe-intermediate-agent enable vport * -> pppoe-intermediate-agent disable vport *

   - no dhcpv4-l2-relay-agent enable vport * -> dhcpv4-l2-relay-agent disable vport *

   - no voip protocol -> voip protocol none

   - no dhcp-ip ethuni * -> dhcp-ip ethuni * no-ctrl

   - no lct disable -> lct enable

   - no interface eth* speed ->  interface eth* speed auto
   - no interface eth* mtu  -> interface eth* mtu 1632
   - no interface eth* state  -> interface eth* state unlock

   - no interface wifi * state -> interface wifi * state unlock

   - no resource-id-assign-mode mode2 -> resource-id-assign-mode mode1

   - no port-identification sub-option remote-id enable vport * -> port-identification sub-option remote-id disable vport *


*Note:* To avoid out-of-sync errors, some values that are leading to element deletion are not available to be configured from the user interface
(not modeled in yang). 
E.g: resource-id-assign-mode mode1 not available.
Only by element deletion (no command) these values can be actually set.



## 11.3 C600: lacp interface xgei-* smartgroup *
-----------------------------------------------

  When a smartgroup is deleted under /lacp/interface xgei-*/, the device also deletes the interface xgei. 
  However, the device doesn't accept deletion of the interface xgei by the user ("no" command not available). 
  This causes an out-of-sync issue. 
  To avoid it, the ned allows the deletion of the interface xgei and transforms it to the correct sequence to the device. 
  The user must mimic the device behavior, so this sequence must be used:

```
admin@ncs(config-config)# lacp
admin@ncs(config-lacp)# no interface xgei-1/18/3
admin@ncs(config-lacp)# commit dry-run outformat native
native {
    device {
        name z600
        data lacp
             interface xgei-1/18/3
             no smartgroup
    }
}

```

## 11.4 C600: vlan */ cos/copy-to-[inner|outer] deletion
-----------------------------------------------------------------------

Device behavior:
    The vlan list entry is automatically deleted by the device when cos copy-to-inner is deleted.
Solution:
    To avoid out-of-sync, the user/service must delete the the list entry and no cos copy-to-inner.

  E.g: 

 - show run:

``` 
  vlan 104
  cos copy-to-inner ingress net-side
```

 - Out-of-sync case:

``` 
  vlan 104
    no cos copy-to-inner
```

 - In sync-case:

```
  no vlan 104
```

The behavior on the device side is the same for both cases: the list entry will be automatically deleted .

*Note:* this is true when cos copy-to-inner is the only element in the vlan list.

## 11.5 Encrypted elements
-------------------------

Some elements, for some device and software versions are getting encrypted by the device and appear as "<element-name>-en" in running config.
One example is /interface gpon-onu*/name & name-en.

As the NED is a super-set of multiple device versions and software versions, both "name" and "name-en" are available in the yang model.
If the current device is using encryption, only "name-en" should be configured.
The ned will know about the encryption and will not generate out-of-sync error messages.
The non-encrypted version (e.g: name) should be used only by the devices that do NOT encrypt its value.

Similar to name-en, description-en is also present in C600 devices.


## 11.6 Changing the ONU registration method
-------------------------------------------

To change the registration method for a onu entry the 'interface gpon-onu_a/b/c:x registration-method <type> <value>' is used, by the device. 
This command actually changes interface gpon-olt_a/b/c onu x sn|pw values. 
Adding it to the yang model causes an out-of-sync as it doesn't hold value, but it changes another part of the yang model.
Trying to modify an existing onu entry under interface gpon-olt_a/b/c it will cause the following error: 

```
%Code 62391-GPONSRV : The entry is existed.
  This is a re-create operation"
```

In order to keep the sync, but also to be able to change the registration method, the NED allows modifying it, the nso regular way (the same 
as creating it), and when the error is reported by the device, it actually sends the correct command to the device:
```
  interface gpon-onu_a/b/c:x registration-method <type> <value>
```
E.g:
```  
  show running-config :
        interface gpon-olt_1/1/2
           onu 1 type ZTE-F601 pw cisco1
```

changing the type and value:

```
        interface gpon-olt_1/1/2
           onu 1 type ZTE-F601 sn TEST12345678
```

what the Ned will actually send (not visible in dry-run native):

```
      interface gpon-onu_1/1/2:1
         registration-method sn TEST12345678
```

This way, what is sent is the same thing with that is applied, even if through a different set of commands, keeping all in sync.

*Note:* As this behavior can be triggered only by the error message reported by the device, that is sent only at commit time,  the commit dry-run
outformat native will NOT show what is actually  sent to the device (registration-method command).

## 1.7 interface eth eth_* and interface wifi wifi_* deletion
-------------------------------------------------------------

In case of /pon-onu-mng/gpon-onu*/interface eth * and wifi *, if all list elements are set to their default values in NSO, the interface entry will be deleted by the device.
As the elements are not actually deleted in NSO, but set to their default value, NSO doesn't see the list as empty, and will not delete it from cbd.

There will be an out-of -sync.

To avoid this, instead of setting all elements to their default value in NSO, the user must delete the interface entry, that will cause, at device level, the
deletion to be translated to set all elements to their defaults. This way, both NSO and the device will have the list entry deleted.


Setting elements to their default value it's possible, without loosing the sync.
Only setting ALL existing elements (1 or more) to their defaults then the above issue will happen.

## 1.8 interface gpon-onu*/switchport
-------------------------------------

The switchport elements seem to be auto-created and auto-deleted by the device.
The user scenario must include these elements, else an out-of-sync will occur.
E.g:

```
interface gpon-onu_1/1/2:1
   tcont 1 profile TC_type3_500M_25M
   gemport 1 tcont 1 queue 1
   switchport mode hybrid vport 1
exit
commit
interface gpon-onu_1/1/2:1
no switchport mode hybrid vport 1
no gemport 1
no tcont 1
exit
```

# 12. Show partial
------------------

Custom device show partial commands are supported only for the following elements:

```
interface gpon-olt  using "show running-config interface gpon-olt*"

interface gpon-onu using "show running-config interface gpon-onu*"

pon-onu-mng gpon-onu using "show onu running config gpon-onu*"

interface vport using "show running-config-interface vport*"

interface smartgroup using "show running-config-interface vport*"

```

Note that the path for the above commands ends with the key identified (e.g interface id).
If the partial path is not as expected (e.g: contains additional elements or is missing the key values), an error will be thrown.

E.g:
NSO:
```
admin@ncs(config)# devices partial-sync-from path [
 /devices/device[name='zte-1']/config/xpon:interface/gpon-onu[id='1'][slot='1'][port='3'][onu-number='1']
  /devices/device[name='zte-1']/config/xpon:pon-onu-mng/gpon-onu[id='1'][slot='1'][port='3'][onu-number='1']
  /devices/device[name='zte-1']/config/xpon:interface/gpon-olt[id='1'][slot='1'][port='3'] ]
```

Device:
```
show running-config interface gpon-olt_1/1/3
show running-config interface gpon-onu_1/1/3:1
show onu running config gpon-onu_1/1/3:1
```

LOGS:
- SHOW_PARTIAL FILTERED(zte-1)=
```
interface gpon-olt_1/1/3
  shutdown
  linktrap disable
  onu 1 type ZTE-F601 pw cisco1
  onu 2 type ZTE-F601 sn TEST12345678
!

interface gpon-onu_1/1/3:1
!

pon-onu-mng gpon-onu_1/1/3:1
!

```

Except the above, all other elements are using "show running-config" command.
For other commands/elements not supported, a specific ticket must be raised.

For all partial shows, the NED will filter the config and will load into NSO cdb only the requested output (even if the device command is 
show running-config, that displays all config due to lack of a device command to show only specific elements, the NED will load only the requested output).
