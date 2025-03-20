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
  11. ENCAP_VLAN_AS_LEAF compile option
  12. NED Secrets - Securing your Secrets
  ```


# 1. General
------------

  This document describes the huawei-vrp NED.

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
  | load-native-config        | yes       |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```
  Custom NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | proxy                     | yes       | The NED supports up to 2 jump servers                            |
  |                           |           |                                                                  |
  | ENCAP_VLAN_AS_LEAF        | yes       | Encapsulate a vlan list into a single leaf with range format     |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Sxxx                      |                 | VRP    | S series switches                                 |
  |                           |                 |        |                                                   |
  | NE40 X8                   |                 | VRP    | NE40E router                                      |
  |                           |                 |        |                                                   |
  | ATN910                    |                 | VRP    | ATN910                                            |
  |                           |                 |        |                                                   |
  | ATN950                    |                 | VRP    | ATN950                                            |
  |                           |                 |        |                                                   |
  | NE8000                    |                 | VRP    | NE8000 router                                     |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-huawei-vrp-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-huawei-vrp-1.0.1.signed.bin
      > ./ncs-6.0-huawei-vrp-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-huawei-vrp-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-huawei-vrp-1.0.1.tar.gz
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
     `huawei-vrp-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-huawei-vrp-1.0.1.tar.gz
     > ls -d */
     huawei-vrp-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package huawei-vrp-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package huawei-vrp-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-huawei-vrp-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package huawei-vrp-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/huawei-vrp-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-huawei-vrp-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-huawei-vrp-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install huawei-vrp-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-huawei-vrp-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-huawei-vrp-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id huawei-vrp-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-huawei-vrp-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings huawei-vrp logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.vrp \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings huawei-vrp logger java true
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


  For instance, create a second Loopback interface that is down:

  ```
     admin@ncs(config)# devices device <vrpdev> config
     admin@ncs(config-config)# hostname mynewhostname

  ```

  See what you are about to commit:

  ```
     admin@ncs(config-config)# commit dry-run outformat native
     device <vrpdev>
       hostname mynewhostname

  ```

  Commit new configuration in a transaction:

  ```
     admin@ncs(config-config)# commit
     Commit complete.

  ```

  Verify that NCS is in-sync with the device:

  ```
      admin@ncs(config-config)# devices device <vrpdev> check-sync
      result in-sync

  ```

  Compare configuration between device and NCS:

  ```
      admin@ncs(config-config)# devices device <vrpdev> compare-config
      admin@ncs(config-config)#

  ```

  *Note*: If no diff is shown, supported config is the same in NSO as on the device.


# 5. Built in live-status actions
---------------------------------

  - **exec any**

   The NED has support for all Huawei VRP commands
   by use of the 'devices device live-status exec any' command action.
   The output is returned as the device exposes it, in a single string leaf: 'result'.

   For example:

  ```
      admin@ncs# devices device ne40e-1 live-status exec any "display current int GigabitEthernet0/0/0"
      result
      #
      interface GigabitEthernet0/0/0
       speed auto
       duplex auto
       description Managment-Interface
       undo shutdown
       ip address 172.20.161.32 255.255.255.128
      #
      return
      <ne40e-1>
      admin@ncs#
  ```

  To execute multiple commands, separate them with " ; "

  *NOTE*: Must be a white space on either side of the comma.

  For example:

  ```
      admin@ncs# devices device ne40e-1 live-status exec any "disp cur int GigabitEthernet1/1/0 ; disp cur int GigabitEthernet1/1/1"
      result
      > disp cur int GigabitEthernet1/1/0
      #
      interface GigabitEthernet1/1/0
       shutdown
       undo dcn
      #
      return
      <ne40e-1>
      > disp cur int GigabitEthernet1/1/1
      #
      interface GigabitEthernet1/1/1
       undo flow control
       shutdown
       undo dcn
      #
      return
      <ne40e-1>
      admin@ncs#
  ```

  Generally the command output parsing halts when the NED detects
  an operational or config prompt, however sometimes the command
  requests additional input, 'answer(s)' to questions.




  - **Exec commands in config mode**


  The NED has dedicated support for all exec commands in config mode. They can
  be accessed using the 'exec' prefix. For example:

  ```
      admin@ncs(config-config)#  exec "reset ip userlog statistics"
      result
        Statistics information has been cleared
      [ne40e-1]
      admin@ncs(config-config)#
  ```

  The config exec commands are similar with 'exec any' commands, additional with the config mode command.


  - **Commands via ned-settings huawei-vrp console extension**

   Using these settings it is possible to define a separate way of
   interacting with the device, ignoring the default behavior of the ned.
   Here, the user can define the commands and the response patterns that the device
   will react with. The user must create its own state machine for the device interactions.

  Example ned-settings:

  ```
       devices device ne40e-1
         ned-settings huawei-vrp console extension
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
       devices device net40e-1 live-status exec any ACT-ELABEL

       devices device net40e-1 live-status exec any "SEND-FTP ftp -a 1.2.3.4 5.6.7.8 ; SEND-FTP get my.file"
  ```


# 6. Built in live-status show
------------------------------

  The Ned supports several dedicated show commands that were built specifically to a
  device version. The result is parsed and then returned into dedicated yang models


  **Warning**: if a device contains the same command, but with the output different from
  the one that was developed with, then the Ned's parser might not correctly match
  the result and end up with unexpected behavior.

  Here is the list of supported live-status show commands:

  - display mac-address
  - display poe power
  - display poe power interface
  - display controller wdm
  - display isis peer verbose
  - display interface
  - display transceiver
  - display transceiver diagnosis interface
  - display version
  - display patch-information
  - display args patch-information
  - display license verbose
  - display constant ifindex configuration
  - display lldp neighbor brief
  - display lldp neighbor interface
  - display bgp peer verbose
  - display bgp ipv6 peer verbose
  - display ip vpn-instance | include IPv4
  - display bgp vpnv4 vpn-instance %s peer verbose
  - display ip vpn-instance | include IPv6
  - display bgp vpnv6 vpn-instance %s peer verbose
  - display cfm remote-mep


# 7. Limitations
----------------

   - Device CLI diffs between models/versions

    In several device CLI versions and models, Huawei has introduced non-backward compatible CLI
    changes versus earlier versions/models.

    As the NED has to support all versions/models, the NED Yang model introduced dedicated Yang branches, 
    selected based on the device model at runtime (via 'when' statement). 

    As the Yang model can't have two elements with the same name in the same place, the Ned introduces
    name alternatives that are visible only at schema level (Yang/XML), but keeping the same name when 
    interacting with the device. 


    E.g:

  ```
          container single-interface {
            tailf:cli-drop-node-name;
            cli:parse-global-when;
            when "/vrp:device-model != 'NE8000' and /vrp:device-model != 'NE9000'";
            uses interface-name-basic-grouping;
          }


          list interface {
            tailf:cli-drop-node-name;
            cli:parse-global-when;
            when "/vrp:device-model = 'NE8000' or /vrp:device-model = 'NE9000'";

            ...
            }          

  ```

  ```         

          container endpoint-ne8k-or-ne9k {
            tailf:alt-name "endpoint";
            when "/vrp:device-model = 'NE8000' or /vrp:device-model = 'NE9000'";
            ....
            }

          container endpoint {
            when "/vrp:device-model != 'NE8000' and /vrp:device-model != 'NE9000'";
            ...
            }

  ```       





   - Deprecated features


     Deprecated NED features are gradually removed from future versions of the NED.
     In some cases they can still be enabled for a limited time via NED settings.

  -  Version WARNINGS


      Look for 'API CHANGE' below to see what changes have been made that may
      not be backwards compatible.

  **WARNING**:

  When using huawei-vrp with other NEDs, certain combinations of NED versions
  may cause 'random' Exceptions. The reason for this is the introduction of
  a new common NED component - nedcom.jar - which initially was located in
  shared-jar, but later moved to private-jar. However, since the JAVA loader
  looks in shared-jar directories first, a newer NED with nedcom.jar in
  private-jar will still load another NED's older nedcom.jar in shared-jar;
  causing a version conflict and quite possibly an Exception.

  Hence, if you are using a newer NED (with private-jar/nedcom.jar) you must
  make sure no other NEDs in your project has a shared-jar/nedcom.jar. If they
  do, you must upgrade them to a version which also has nedcom in private-jar.

  The following NED versions have their nedcom.jar in shared-jar:

      a10-acos      3.6.5
      alu-sr        6.0.2 to 6.1.1
      cisco-asa     5.2 to to 5.2.1
      cisco-ios     5.2.8 to 5.4.2
      cisco-iosxr   6.0 to 6.1
      cisco-nx      4.4.7 to 4.5.2
      huawei-vrp    4.2.6

      In short, avoid the above NED versions when using other NEDs.


  - Elements that are present with 'undo' as prefix

    The Huawei CLI presents some elements that have the 'undo' prefix when 
    shown in the device running configuration.
    For simple elements (e.g leafs), that act like a boolean type the ned 
    will automatically show the 'no' prefix when 'undo' is detected. 
    The user will just have to send a 'no' command for that element.

    For more complex elements (e.g list entries), that have the undo as 
    prefix, the only way the ned can mimic the device behavior is to add
    an additional leaf 'undo' at the end of the command in NSO, and then 
    the ned will move it in front of the command when reading and writing 
    from/to the device. 

    Having a 'no' in from of a list entry is not XML and Yang compatible 
    (there is no way to mark the non-existence of an entry in a list).
    Also, there are cases where an element can exist in the device 
    running-config with the 'undo' present, without it, and also can be
    deleted (3 states).


    Example of commands with such behavior:

    Device config:

    '''
      l2vpn-family evpn
        peer DUNE_RR advertise encap-type srv6 advertise-srv6-locator
        undo peer FDCA:3F00:2106::1 advertise encap-type srv6 advertise-srv6-locator
      exit

    '''

    NSO config:

    '''
      l2vpn-family evpn
        peer DUNE_RR advertise encap-type srv6 advertise-srv6-locator
        peer FDCA:3F00:2106::1 advertise encap-type srv6 advertise-srv6-locator undo
      exit
    '''


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
     admin@ncs(config)# devices device dev-1 ned-settings huawei-vrp logging level debug
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
  > devices device dev-1 ned-settings huawei-vrp logger level debug
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

# 11. ENCAP_VLAN_AS_LEAF compile option
--------------------------------------   
   The Huawei devices support ranged lists with the following format: '1 3 to 6 8 to 100 300'.
   In this Ned, it is ussually about vlans.

   This is incompatible with XML language, hence it's incompatible with Yang.

   The only way xml/yang can support it is by using leaf-lists. 

   The problem is that means in XML, it will be every entry on a line. When there are thousounds of entries, this will lead
   to huge xml files. On top, if there are nested lists, it might lead to milions of lines just
   to represent the vlans.

   A solution for this is to handle the range a simple string, thus from thousounds of lines, there will
   be just one line in xml format.

   The downside of that is that the user/service must mimic device behavior and not expect a leaf-list
   functionality. 


   E.g: to remove a vlan from the range, the user must send it's end result, and not a delete command
   for that vlan.
      It should not send 'no vlan 50' (for the above range).
      It should send '1 3 to 6 8 to 49 51 to 100 300'. 
   The Ned will insert a delete command before any modify so that the device will accept the new entry. 

   To improve performance due to slow handling of large leaf-lists in
   several vlan lists, a make variable has been introduced
   to change the node from leaf-list to leaf.

      <build host>$ make ENCAP_VLAN_AS_LEAF=True clean all


   The changed nodes are:


   - // vlan/batch *
   - // interface * / trust upstream * vlan *
   - // interface * / trust 8021p inbound vlan *
   - // interface * / trust 8021p outbound vlan *
   - // interface * / trust 8021p vlan *
   - // stp region-configuration / instance * vlan *
   - // interface * / multicast-source-deny / vlan *
   - // interface * / l2protocol-tunnel * / vlan *
   - // interface * / port isolate-state / vlan *
   - // interface * / qos phb disable vlan *
   - // interface * / qos phb dscp disable vlan *
   - // interface * / qos phb inner-8021p disable vlan *
   - // interface * / qos phb outer-8021p disable vlan *
   - // interface * / qos phb mpls-exp disable vlan *
   - // interface * / encapsultation qinq vid * / ce-vid *


   All of the above leafs expect range syntax similar to NSO leaf-lists, that the
   NED will translate to the device range syntax.

   E.g:

   User will send:

   ``` 
   port trunk allow-pass vlan 1-100,200,300-400,500

   ```
   The ned will send:

   ```
    port trunk allow-pass vlan 1 to 100 200 300 to 400 500
   ```


        Warning: Setting a different format will lead to errors!


   - All of the above, except //vlan/batch * will have the "remove-before-change"
   behavior, meaning that the existing value will be deleted and then the new
   value will be set. 

   E.g:

```
admin@ncs(config-GigabitEthernet-0/2/2)# port trunk allow-pass vlan 1-100
admin@ncs(config-GigabitEthernet-0/2/2)# commit dry-run outformat native
native {
    device {
        name test
        data ! Generated offline
             interface GigabitEthernet0/2/2
              undo port trunk allow-pass vlan 1 to 126 128 to 4089
              port trunk allow-pass vlan 1 to 100
             quit
    }
}
```


  - For the //vlan/batch leaf, there is no remove-before-change behavior, as
  deleting vlans might disrupt existing configurations. Instead, the NED will
  simulate the leaf-list functionality and generate set and delete commands,
  based on the delta between what is set by the user and what's exists on cdb.
  E.g:

Existing:

```
    vlan batch 1-100
```

New values set by the user (Note the leaf-list syntax):

```
      vlan batch 10,20,22-99,127-300,4089
```

The NED will send:

```
             undo vlan batch 1 to 9 11 to 19 21 100
             vlan batch 127 to 300 4089
```


**Warning**: it's the user's responsibility to set the same value to the vlan value as
the one that is expected to be present in the device at 'display' (with the range
syntax conversion applied). Otherwise out-of-sync will  occur.  The ned will not
make any input validation.

  - To change node-type to leaf from leaf-list (i.e. to handle these
   ranges explicitly as a string) re-compile the NED package from the
   src directory in the package using the below command line:

```
   <build host>$ make ENCAP_VLAN_AS_LEAF=True clean all
```

Another example with this enabled:

```

admin@ncs(config-config)# interface Eth-Trunk226.610 mode l2
admin@ncs(config-Eth-Trunk-226.610)# encapsulation qinq vid 610 ce-vid ?
Description: Virtual LAN
Possible completions:
  <STRING<1-4094>>   VLAN ID range- in NSO syntax for ranges
  default            Packets that are not matched by any other sub-interfaces
admin@ncs(config-Eth-Trunk-226.610)# encapsulation qinq vid 610 ce-vid 250,300-401,420-500,555
admin@ncs(config-Eth-Trunk-226.610)# commit dry-run outformat native 
native {
    device {
        name ne40e-1
        data interface Eth-Trunk226.610 mode l2
              undo portswitch
              encapsulation qinq vid 610 ce-vid 250 300 to 401 420 to 500 555
              undo shutdown
             quit
    }
}
admin@ncs(config-Eth-Trunk-226.610)# commit dry-run outformat xml 
result-xml {
    local-node {
        data <devices xmlns="http://tail-f.com/ns/ncs">
               <device>
                 <name>ne40e-1</name>
                 <config>
                   <interface xmlns="http://tail-f.com/ned/huawei-vrp">
                     <Eth-Trunk>
                       <name>226.610</name>
                       <encapsulation>
                         <qinq>
                           <vid>
                             <id>610</id>
                             <ce-vid>
                               <vlan>250,300-401,420-500,555</vlan>
                             </ce-vid>
                           </vid>
                         </qinq>
                       </encapsulation>
                       <interface-mode-l2>
                         <mode>l2</mode>
                       </interface-mode-l2>
                     </Eth-Trunk>
                   </interface>
                 </config>
               </device>
             </devices>
    }
}
admin@ncs(config-Eth-Trunk-226.610)# commit
Commit complete.

```


Removing vlan 320:


```

admin@ncs(config-Eth-Trunk-226.610)# encapsulation qinq vid 610 ce-vid 250,300-319,321-401,420-500,555
admin@ncs(config-Eth-Trunk-226.610)# commit dry-run outformat native 
native {
    device {
        name ne40e-1
        data interface Eth-Trunk226.610 mode l2
              undo encapsulation qinq vid 610 ce-vid 250 300 to 401 420 to 500 555
              encapsulation qinq vid 610 ce-vid 250 300 to 319 321 to 401 420 to 500 555
             quit
    }
}
admin@ncs(config-Eth-Trunk-226.610)# commit dry-run outformat xml 
result-xml {
    local-node {
        data <devices xmlns="http://tail-f.com/ns/ncs">
               <device>
                 <name>ne40e-1</name>
                 <config>
                   <interface xmlns="http://tail-f.com/ned/huawei-vrp">
                     <Eth-Trunk>
                       <name>226.610</name>
                       <encapsulation>
                         <qinq>
                           <vid>
                             <id>610</id>
                             <ce-vid>
                               <vlan>250,300-319,321-401,420-500,555</vlan>
                             </ce-vid>
                           </vid>
                         </qinq>
                       </encapsulation>
                     </Eth-Trunk>
                   </interface>
                 </config>
               </device>
             </devices>
    }
}


```


# 12. NED Secrets - Securing your Secrets
-----------------------------------------

    It is best practice to avoid storing your secrets (e.g. passwords and
    shared keys) in plain-text, either on NSO or on the device. In NSO we
    support multiple encrypted datatypes that are encrypted using a local
    key.

    Naturally, for security reasons, NSO in general has no way of
    encrypting/decrypting passwords with the secret key on the
    device. This means that if nothing is done about this we will
    become out of sync once we write secrets to the device. Looking at
    the huawei-vrp NED there are over 50 paths that contain such secrets.

    In order to avoid becoming out of sync the NED reads back these elements
    immediately after set and stores the encrypted value(s) in a special
    `secrets` table in oper data. Later on, when config is read from the
    device, the NED replaces all cached encrypted values with their plaintext
    values; effectively avoiding all config diffs in this area. If the values
    are changed on the device, the new encrypted value will not match the
    cached pair and no replacement will take place. This is desired, since out
    of band changes should be detected.

    This handles the device-side encryption, but passwords are still unencrypted
    in NSO. To deal with this we support using NSO-encrypted strings instead of
    plaintext passwords in the NSO data model.



    The secrets management will store this encrypted values in our `secrets` table:

      admin@ncs# show devices device dev-1 ned-settings secrets
      ID                                      ENCRYPTED                         REGEX
      ---------------------------------------------------------------------------------
      vrp:username(newuser)/password/secret   xAb[PDCO[fQDJhDfMIciONMedifAAB

      which means that compare-config or sync-from will not show any
      changes and will not result in any updates to CDB". In fact, we can
      still see the unencrypted value in the device tree:


    --- Increasing security with NSO-side encryption

    We have two alternatives, either we can manually encrypt our values using
    one of the NSO-encrypted types (e.g `aes-256-cfb-128-encrypted-string`) and
    set them to the tree, or we can recompile the NED to always encrypt secrets.

    --- Setting encrypted value

    Let us say we know that the NSO-encrypted string
      `$9$T963R76+wgaQuZCtcGC/Nreo75FigP+znmOln8XDFK0=` (`admin`), we
    can then set it in the device tree as normal

      admin@ncs(config)# devices device dev-1 config username newuser2 password  $9$T963R76+wgaQuZCtcGC/Nreo75FigP+znmOln8XDFK0=
      admin@ncs(config-config)# commit

    when commiting this value it will be decrypted and the plaintext will be written to the device.
    Unlike the previous example the plaintext is not visible in the device tree


    On the device side this plaintext value is of course encrypted
    with the device key, and just as before we store it in our
    `secrets` table


    --- Auto-encrypting passwords in NSO

    To avoid having to pre-encrypt your passwords you can rebuild your NED in your OS
    command shell specifying an encrypted type for secrets using a command like:

    yourhost:~/huawei-vrp-cli-x.y$ NEDCOM_SECRET_TYPE="tailf:aes-cfb-128-encrypted-string" make -C src/ clean all

    Or by adding the line `NEDCOM_SECRET_TYPE=tailf:aes-cfb-128-encrypted-string`
    in top of the `Makefile` located in <huawei-vrp-cli-x.y>/src directory. 

    Doing this means that even if the input to a passwordis a plaintext string, NSO will always
    encrypt it, and you will never see plain text secrets in the device tree.

    If we reload our example with the new NED all of the secrets are now encrypted.
