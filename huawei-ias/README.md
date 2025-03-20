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
  ```


# 1. General
------------

  This document describes the huawei-ias NED.

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
  | live-status show          | yes       | The ned supports a dedicated show command                        |
  |                           |           |                                                                  |
  | load-native-config        | yes       | Supports native load commands, including delete commands that    |
  |                           |           | need to be enabled in ned-settings developer                     |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```
  Custom NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | proxy                     | yes       | The NED supports connections via jump server                     |
  |                           |           |                                                                  |
  | dynamic-service-port      | yes       | The NED supports dynamic service-port id via ned-                |
  |                           |           | settings/huawei-ias/read/dynamic-service-port                    |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | MA5600                    |                 |        | Huawei Integrated Access Software MA5600          |
  |                           |                 |        |                                                   |
  | MA5801S-GP16              | MA5801SV100R020 |        | Huawei Integrated Access Software MA5800          |
  |                           | C10             |        |                                                   |
  |                           |                 |        |                                                   |
  | MA5800-X17                | MA5800V100R022C |        | Huawei Integrated Access Software MA5800          |
  |                           | 10              |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-huawei-ias-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-huawei-ias-1.0.1.signed.bin
      > ./ncs-6.0-huawei-ias-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-huawei-ias-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-huawei-ias-1.0.1.tar.gz
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
     `huawei-ias-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-huawei-ias-1.0.1.tar.gz
     > ls -d */
     huawei-ias-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package huawei-ias-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package huawei-ias-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-huawei-ias-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package huawei-ias-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/huawei-ias-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-huawei-ias-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-huawei-ias-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install huawei-ias-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-huawei-ias-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-huawei-ias-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id huawei-ias-cli-1.0
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

  **Proxy settings:**


  Do as follows to setup to connect to a ias device that resides
  behind a proxy or terminal server:

  ```   

     +-----+  A   +-------+   B  +-----+
     | NCS | <--> | proxy | <--> | ias |
     +-----+      +-------+      +-----+

  ```

    Setup connection (A):

  ```   

     # devices device <iasdev> address <proxy address>
     # devices device <iasdev> port <proxy port>
     # devices device <iasdev> device-type cli protocol <proxy proto - telnet or ssh>
     # devices authgroups group ciscogroup umap admin remote-name <proxy username>
     # devices authgroups group ciscogroup umap admin remote-password <proxy password>
     # devices device <iasdev> authgroup ciscogroup

  ```

    Setup connection (B):

    Define the type of connection to the device:

  ```
     # devices device <iasdev> ned-settings huawei-ias proxy remote-connection <ssh|telnet>
  ```

    Define login credentials for the device:

  ```
     # devices device <iasdev> ned-settings huawei-ias proxy remote-name <user name on the ias device>
     # devices device <iasdev> ned-settings huawei-ias proxy remote-password <password on the ias device>
  ```

    Define prompt on proxy server:

  ```
     # devices device <iasdev> ned-settings huawei-ias proxy proxy-prompt <prompt pattern on proxy>
  ```

    Define address and port of ias device:

  ```
     # devices device <iasdev> ned-settings huawei-ias proxy remote-address <address to the ias device>
     # devices device <iasdev> ned-settings huawei-ias proxy remote-port <port used on the ias device>
     # commit
  ```

    Complete example config:

  ```
     devices authgroups group jump-server default-map remote-name MYUSERNAME remote-password MYPASSWORD
     devices device ne40-via-1234 address 1.2.3.4 port 22
     devices device ne40-via-1234 authgroup jump-server device-type cli ned-id huawei-ias protocol ssh
     devices device ne40-via-1234 connect-timeout 60 read-timeout 120 write-timeout 120
     devices device ne40-via-1234 state admin-state unlocked
     devices device ne40-via-1234 ned-settings huawei-ias proxy remote-connection telnet
     devices device ne40-via-1234 ned-settings huawei-ias proxy proxy-prompt ".*#"
     devices device ne40-via-1234 ned-settings huawei-ias proxy remote-address 5.6.7.8
     devices device ne40-via-1234 ned-settings huawei-ias proxy remote-port 23
     devices device ne40-via-1234 ned-settings huawei-ias proxy remote-name admin
     devices device ne40-via-1234 ned-settings huawei-ias proxy remote-password admin987
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

  `$NSO_RUNDIR/logs/ned-huawei-ias-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings huawei-ias logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings huawei-ias logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.ias \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings huawei-ias logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings huawei-ias logger java true
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

      vlan 1001 smart
      vlan 1101 smart
      vlan 1201 smart
      port vlan 1001 0/2 0
      port vlan 1101 0/2 0
      port vlan 1201 0/2 0


      ont-srvprofile gpon profile-id 50 profile-name snedtest
          ont-port pots adaptive 32 eth adaptive 8
      exit


      ont-lineprofile gpon profile-id 50 profile-name lnedtest
          tcont 1 dba-profile-id 13
          tcont 2 dba-profile-id 13
          tcont 3 dba-profile-id 13
          gem add 1 eth tcont 1 encrypt on
          gem add 2 eth tcont 2 encrypt on
          gem add 3 eth tcont 3 encrypt on
          gem mapping 1 0 vlan 1001
          gem mapping 2 0 vlan 1101
          gem mapping 3 0 vlan 1201
      exit

      interface gpon 0/1
          ont add 7 0 sn-auth 414C434CF8643DC6 omci ont-lineprofile-id 50 ont-srvprofile-id 50 desc nedtest
      exit

      service-port 104 vlan 1001 gpon 0/1/7 ont 0 gemport 1 multi-service user-vlan 1001 tag-transform translate
      service-port 105 vlan 1101 gpon 0/1/7 ont 0 gemport 2 multi-service user-vlan 1101 tag-transform translate
      service-port 106 vlan 1201 gpon 0/1/7 ont 0 gemport 3 multi-service user-vlan 1201 tag-transform translate


# 5. Built in live-status actions
---------------------------------

  - **exec any**

   The NED has support for all Huawei IAS commands
   by use of the 'devices device live-status exec any' command action.
   The output is returned as the device exposes it, in a single string leaf: 'result'.

   For example:

  ```
  admin@ncs(config-device-x17)# live-status exec any display interface         
  result display interface 
  { <cr>|ifType<E><meth,loopback,null,vlanif>||<K> }:


    Command:
            display interface
  LoopBack20 current state : UP (ifindex: 10485780)
  Line protocol current state : UP (spoofing) 
  Description : HUAWEI, SmartAX Series, LoopBack20 Interface
  The Maximum Transmit Unit is 1500 bytes
  Internet Address is 172.16.104.104/24

  MEth0 current state : UP (ifindex: 6291456)
  Line protocol current state : UP 
  Description : HUAWEI, SmartAX Series, MEth0 Interface
  The Maximum Transmit Unit is 1500 bytes
  Internet Address is 10.64.16.56/24
  IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c414
  Auto-duplex (Full), Auto-speed (100M)
      5 minutes input rate 409 bytes/sec, 1 packets/sec
      5 minutes output rate 24 bytes/sec, 0 packets/sec
      786374 packets input, 271710751 bytes
      46889 packets output, 46109993 bytes

  ....

  Vlanif4050 current state : UP (ifindex: 8392658)
  Line protocol current state : UP 
  Description : HUAWEI, SmartAX Series, Vlanif4050 Interface
  The Maximum Transmit Unit is 1500 bytes
  Forward plane MTU: -
  Internet Address is 192.168.121.56/24
  IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c41a
  VLAN Encap-mode : single-tag


  MA5800-X17#


  ```

  To execute multiple commands, separate them with " ; "

  *NOTE*: Must be a white space on either side of the semicolon.

  For example:

  ```
  admin@ncs(config-device-x17)# live-status exec any "config ; interface gpon 0/2 ; display ont ipconfig 0 108"
  result config 

  MA5800-X17(config)#interface gpon 0/2 

  MA5800-X17(config-if-gpon-0/2)#display ont ipconfig 0 108 
  { <cr>||<K> }:


    Command:
            display ont ipconfig 0 108
    ONT 108 IP query result
    --------------------------------------------------------------------
    ONT IP host index        : 0
    ONT config type          : PPPoE
    ONT IP                   : -
    ONT subnet mask          : -
    ONT gateway              : -
    ONT primary DNS          : -
    ONT slave DNS            : -
    ONT manage VLAN          : 10
    ONT manage priority      : 0
    Dscp mapping table index : 0
    PPPoE account mode       : ONT-input
    --------------------------------------------------------------------
    ONT IP host index        : 1
    ONT config type          : DHCP
    ONT IP                   : -
    ONT subnet mask          : -
    ONT gateway              : -
    ONT primary DNS          : -
    ONT slave DNS            : -
    ONT manage VLAN          : 111
    ONT manage priority      : 5
    Dscp mapping table index : 0
    --------------------------------------------------------------------

  ```

  Generally the command output parsing halts when the NED detects
  an operational or config prompt, however sometimes the command
  requests additional input, 'answer(s)' to questions. For that, 
  see next:

  - **Commands via ned-settings huawei-ias console extension**

   Using these settings it is possible to define a separate way of
   interacting with the device, ignoring the default behavior of the ned.
   Here, the user can define the commands and the response patterns that the device
   will react with. The user must create its own state machine for the device interactions.


  Example ned-settings:

  ```
       devices device x17
         ned-settings huawei-ias console extension
           command CMD-ELABEL "display elabel"
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
  ```

  Example executions:

  ```
       devices device x17 live-status exec any ACT-ELABEL

       devices device x live-status exec any "SEND-FTP ftp -a 1.2.3.4 5.6.7.8 ; SEND-FTP get my.file"
  ```


   - ** show **
  This  commands it is used for a faster execution of 'display' commands. Similar to 'any', multiple
  commands are to be split by " ; " (note the spaces).

  Example:

  '''

  admin@ncs(config-device-x17)# live-status exec show "interface ; version"
  result  

    Command:
              display interface
    LoopBack20 current state : UP (ifindex: 10485780)
    Line protocol current state : UP (spoofing) 
    Description : HUAWEI, SmartAX Series, LoopBack20 Interface
    The Maximum Transmit Unit is 1500 bytes
    Internet Address is 1.12.3.104/24

    MEth0 current state : UP (ifindex: 6291456)
    Line protocol current state : UP 
    Description : HUAWEI, SmartAX Series, MEth0 Interface
    The Maximum Transmit Unit is 1500 bytes
    Internet Address is 10.64.16.56/24
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c414
    Auto-duplex (Full), Auto-speed (100M)
        5 minutes input rate 404 bytes/sec, 1 packets/sec
        5 minutes output rate 32 bytes/sec, 0 packets/sec
        809047 packets input, 279563886 bytes
        49151 packets output, 46771928 bytes

    NULL0 current state : UP (ifindex: 4194304)
    Line protocol current state : UP (spoofing) 
    Description : HUAWEI, SmartAX Series, NULL0 Interface
    The Maximum Transmit Unit is 1500 bytes
    Internet protocol processing : disabled

    Vlanif10 current state : UP (ifindex: 8388618)
    Line protocol current state : UP 
    Description : HUAWEI, SmartAX Series, Vlanif10 Interface
    The Maximum Transmit Unit is 1500 bytes
    Forward plane MTU: -
    Internet Address is 192.168.1.222/24
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c419
    VLAN Encap-mode : single-tag

    Vlanif99 current state : DOWN (ifindex: 8388707)
    Line protocol current state : DOWN 
    Description : HUAWEI, SmartAX Series, Vlanif99 Interface
    The Maximum Transmit Unit is 1500 bytes
    Forward plane MTU: -
    Internet protocol processing : disabled
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c417
    VLAN Encap-mode : single-tag

    Vlanif200 current state : UP (ifindex: 8388808)
    Line protocol current state : UP 
    Description : HUAWEI, SmartAX Series, Vlanif200 Interface
    The Maximum Transmit Unit is 1500 bytes
    Forward plane MTU: -
    Internet Address is 10.12.10.3/24
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c41a
    VLAN Encap-mode : single-tag

    Vlanif500 current state : UP (ifindex: 8389108)
    Line protocol current state : UP 
    Description : HUAWEI, SmartAX Series, Vlanif500 Interface
    The Maximum Transmit Unit is 1500 bytes
    Forward plane MTU: -
    Internet Address is 10.15.10.3/24
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c419
    VLAN Encap-mode : single-tag

    Vlanif600 current state : UP (ifindex: 8389208)
    Line protocol current state : UP 
    Description : HUAWEI, SmartAX Series, Vlanif600 Interface
    The Maximum Transmit Unit is 1500 bytes
    Forward plane MTU: -
    Internet Address is 10.16.10.3/24
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c41b
    VLAN Encap-mode : single-tag

    Vlanif2033 current state : DOWN (ifindex: 8390641)
    Line protocol current state : DOWN 
    Description : HUAWEI, SmartAX Series, Vlanif2033 Interface
    The Maximum Transmit Unit is 1500 bytes
    Forward plane MTU: -
    Internet Address is 55.104.104.56/24
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c419
    VLAN Encap-mode : single-tag

    Vlanif2666 current state : DOWN (ifindex: 8391274)
    Line protocol current state : DOWN 
    Description : prueba-hash-label
    The Maximum Transmit Unit is 8000 bytes
    Forward plane MTU is 8000 bytes
    Internet Address is 2.66.66.1/24
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c41c
    VLAN Encap-mode : single-tag

    Vlanif2755 current state : DOWN (ifindex: 8391363)
    Line protocol current state : DOWN 
    Description : HUAWEI, SmartAX Series, Vlanif2755 Interface
    The Maximum Transmit Unit is 1500 bytes
    Forward plane MTU: -
    Internet Address is 190.64.196.201/31
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c41a
    VLAN Encap-mode : single-tag

    Vlanif3544 current state : DOWN (ifindex: 8392152)
    Line protocol current state : DOWN 
    Description : HUAWEI, SmartAX Series, Vlanif3544 Interface
    The Maximum Transmit Unit is 1500 bytes
    Forward plane MTU: -
    Internet Address is 104.104.104.2/24
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c418
    VLAN Encap-mode : single-tag

    Vlanif4000 current state : UP (ifindex: 8392608)
    Line protocol current state : DOWN 
    Description : HUAWEI, SmartAX Series, Vlanif4000 Interface
    The Maximum Transmit Unit is 1500 bytes
    Forward plane MTU: -
    Internet protocol processing : disabled
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c419
    VLAN Encap-mode : single-tag

    Vlanif4050 current state : UP (ifindex: 8392658)
    Line protocol current state : UP 
    Description : HUAWEI, SmartAX Series, Vlanif4050 Interface
    The Maximum Transmit Unit is 1500 bytes
    Forward plane MTU: -
    Internet Address is 192.168.121.56/24
    IP Sending Frames' Format is PKTFMT_ETHNT_2, Hardware address is d0ef-c1e5-c41a
    VLAN Encap-mode : single-tag





    Command:
            display version

    VERSION : MA5800V100R022C10
    PATCH   : SPH206 HP0229
    PRODUCT : MA5800-X17

    Active Mainboard Running Area Information: 
    --------------------------------------------------
    Current Program Area : Area A 
    Current Data Area : Area A 

    Program Area A Version : MA5800V100R022C10 
    Program Area B Version : MA5800V100R022C10 

    Data Area A Version : MA5800V100R022C10 
    Data Area B Version : MA5800V100R022C10 
    --------------------------------------------------

    Standby Mainboard Running Area Information: 
    --------------------------------------------------
    Current Program Area : Area A 
    Current Data Area : Area B 

    Program Area A Version : MA5800V100R022C10 
    Program Area B Version : MA5800V100R022C10 

    Data Area A Version : MA5800V100R022C10 
    Data Area B Version : MA5800V100R022C10 
    --------------------------------------------------

    Uptime is 7 day(s), 22 hour(s), 44 minute(s), 15 second(s)


  '''


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  **Ont-srvprofile subelements deletion**

  Note that ont-port * elements can't be deleted after being set. The user must delete the entire ont-srvprofile to do that.
  This means that the user/service must mimic device behavior and avoid setting this in a separate transaction than the
  ont-srvprofile creation. Otherwise, after rollback, there will be an out-of-sync issue:

  E.g:

  Initial config:

              ont-srvprofile gpon profile-id 50 profile-name "snedtest"
              exit


  Adding ont-ports after the srvprofile is already present (commit dry-run native output):

               ont-srvprofile gpon profile-id 50 profile-name "snedtest"
                ont-port pots adaptive 32 eth adaptive 8
                commit
               quit

  At rollback, the ned will skip the ont-port deletion (as not possible), hence NSO just enters and exists ont-srvprifile context:

               ont-srvprofile gpon profile-id 50 profile-name "snedtest"
                commit

  Compare-config result:

                  diff 
                   devices {
                       device dev {
                           config {
                               ont-srvprofile {
                                   gpon 50 {
                                       ont-port {
                  +                        pots adaptive;
                  +                        max-pots-port 32;
                  +                        eth adaptive;
                  +                        max-eth-port 8;
                                       }
                                   }
                               }
                           }
                       }
                   }

   To avoid this, always set ont-profile, in the same transaction with the ont-srvprofile creation:

                ont-srvprofile gpon profile-id 50 profile-name "snedtest"
                ont-port pots adaptive 32 eth adaptive 8



  ** DBA-PROFILE and TRAFIC TABLE IP index vs name ***


  The device has a limitation regarding /ont-lineprofile*/tcont*/dba-profile-name and / service-port * /in|outbound/traffic-table name, as
  they are never shown in the running-config of the device. Only the id of these elements is shown, even if, at configuration, the name
  is pushed to the configuration..

  To support the "name", at sync-from, the NED implements a name lookup mechanism for these elements, by getting the name from the following mapping tables, based on the index:
  /dba-profile * and /traffic/table/ip *. Then the name leaf replaces the index leaf in the database, making it look like the device returns it.
  Note that this is done only for the existent mappings (index to name).

  **Warning**: if the user/service pushes a configuration with an index (e.g traffic-table index) that already has a mapping to a name, 
  instead of using the name, the NED will replace that 'index' leaf with the 'name' leaf, causing an out-of-sync. So, please make sure 
  that, if there is a index to name mapping, to always use the name in all configurations pushed to the device. 
  If there is no such mapping, then there is no problem.



  ** Passwords handling **

  The MA5800-X17 device configuration related to passwords are always hashed by the device and the hashed value 
  is changed at every display. Also, resending the hashed value as password is not accepted by the device.
  The ned implements a 'secrets' handling by replacing all hashed values with ***** to be able to keep the sync,
  and it keeps an internal table where it saves the cleartext value. The cleartext value configured by NSO is then
  returned from the ned internal table and set in cdb.
  Note that due to the nature of this behavior, the ned can't detect out of band changes for the passwords fields.


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
     admin@ncs(config)# devices device dev-1 ned-settings huawei-ias logging level debug
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
  > devices device dev-1 ned-settings huawei-ias logger level debug
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
