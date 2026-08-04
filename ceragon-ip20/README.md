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

  This document describes the ceragon-ip20 NED.


  ## 1.1 General info and considerations.

  * **Ceragon IP-20 Products platform**: This NED addresses CERAGON Networks IP-20N chassis based devices with IP-20A, IP-20C configs in mind, but also IP-20D,E. 
    - We  will reffer to them throughout this document simply as "the device" or "the Ceragon IP-20 device".

  * The Ceragon IP-20N device chassis run CeraOS 12.0 custom OS. Interaction with the device is done via CLI using SSH session encrypted with strong secure ciphers. Telnet seems to be also supported.

  * The device is very sensitive in general so use with caution the live-status commands. 

  * Running a big chunk of the configurations into the CHASSIS can overload the port causing unpredictable errors or loss of device, so try to iterate through the commands and break down the commands logic in as many small chunks as possible.

  * A lot of commands can be interactive. Some commands reboot the device or restart the cards inserted into the chassis. 

  ### - Please  note that the NED does not support fully interactive interactions with the device CLI. 
  * Multiple commands are interactive. 
  * For those, a defaulted yes/no confirmation behavior will be implemented, so that when a yes/no prompt occurs, NED is supposed to respond with **yes** at all times. 


  ## 1.2 Top configurable modules

  * platform management
    - activation-key
    - management
    - shelf-manager
    - if-manager
  * ethernet
    - generalcfg
    - qos
  * radio
    - interfaces
      - rf
      - lcl-rmt-ch
    - xpic

  ## 1.3 Asynchronous or interactive commands

  * A lot of commands, as mentioned earlier, are either interactive or asynchronous commands. Some of them create significant delays, significant but impossible to follow, as we don't get any indicator on the remaining/elapsed or potential delay time. 

  Example of interactive commands in device SSH CLI syntax that could be used via live-status exec any commands:


  ```
  platform management set-to-default
  Are you sure? (yes/no):yes
  ```



  ```
  radio [1/1]>mrmc set acm-support script-id 5710 modulation fixed profile 9
  This operation may reset the radio interface and affect traffic.
  Are you sure? (yes/no):yes
  error number 9: SW error: thread context
  ```

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
  | netsim                    | no        |                                                                  |
  |                           |           |                                                                  |
  | check-sync                | no        | check-sync using trans-id DISABLED by default                    |
  |                           |           |                                                                  |
  | partial-sync-from         | no        | This feature is supported by filtering the needed config from a  |
  |                           |           | full show (device does not support partial show)                 |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Supports live staus exec any command                             |
  |                           |           |                                                                  |
  | live-status show          | no        | The NED does not implement TTL-based data                        |
  |                           |           |                                                                  |
  | load-native-config        | no        |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | IP20-N                    | 12.0            | CeraOS | IP20 N and IP20 A Chassis                         |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-ceragon-ip20-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-ceragon-ip20-1.0.1.signed.bin
      > ./ncs-6.0-ceragon-ip20-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-ceragon-ip20-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-ceragon-ip20-1.0.1.tar.gz
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
     `ceragon-ip20-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-ceragon-ip20-1.0.1.tar.gz
     > ls -d */
     ceragon-ip20-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package ceragon-ip20-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package ceragon-ip20-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-ceragon-ip20-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package ceragon-ip20-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/ceragon-ip20-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-ceragon-ip20-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-ceragon-ip20-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install ceragon-ip20-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-ceragon-ip20-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-ceragon-ip20-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id ceragon-ip20-cli-1.0
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

  # Initial configuration requirements
  ## Please make sure the following MANDATORY ned-settings are properly configured with remote-name as needed for logging in. 

  ```
   ned-settings ceragon-ip20 connection remote-name login_username
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

  `$NSO_RUNDIR/logs/ned-ceragon-ip20-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings ceragon-ip20 logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings ceragon-ip20 logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.ceragonip20 \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings ceragon-ip20 logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings ceragon-ip20 logger java true
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


  ## 4.1 Current Yang schema structure of the model adopted:

  - /config/platform *:
  ```
  module: tailf-ned-ceragon-ip20
    +--rw platform
    |  +--rw activation-key
    |  |  +--rw key?   string
    |  +--rw management
    |  |  +--rw protection
    |  |  |  +--rw admin?   enumeration
    |  |  +--rw system-name
    |  |  |  +--rw name?   string
    |  |  +--rw system-location
    |  |  |  +--rw name?   string
    |  |  +--rw system-contact
    |  |     +--rw name?   string
    |  +--rw shelf-manager
    |  |  +--rw shelves* [slot]
    |  |     +--rw slot                 uint16
    |  |     +--rw slot-name?           string
    |  |     +--rw admin?               enumeration
    |  |     +--rw expected-cardtype?   string
    |  +--rw if-manager
    |     +--rw interfaces* [interface-type slot port]
    |        +--rw interface-type    string
    |        +--rw slot              uint16
    |        +--rw port              union
    |        +--rw admin?            enumeration
  ```

  - /config/ethernet * :

  ```  
    +--rw ethernet
    |  +--rw generalcfg
    |  |  +--rw mru
    |  |     +--rw size?   uint32
    |  +--rw qos
    |  |  +--rw port-priority-profile-tbl* [profile-id]
    |  |     +--rw profile-id    uint16
    |  |     +--rw cos0
    |  |     |  +--rw cos0-priority?   string
    |  |     |  +--rw description?     string
    |  |     +--rw cos1
    |  |     |  +--rw cos1-priority?   string
    |  |     |  +--rw description?     string
    |  |     +--rw cos2
    |  |     |  +--rw cos2-priority?   string
    |  |     |  +--rw description?     string
    |  |     +--rw cos3
    |  |     |  +--rw cos3-priority?   string
    |  |     |  +--rw description?     string
    |  |     +--rw cos4
    |  |     |  +--rw cos4-priority?   string
    |  |     |  +--rw description?     string
    |  |     +--rw cos5
    |  |     |  +--rw cos5-priority?   string
    |  |     |  +--rw description?     string
    |  |     +--rw cos6
    |  |     |  +--rw cos6-priority?   string
    |  |     |  +--rw description?     string
    |  |     +--rw cos7
    |  |        +--rw cos7-priority?   string
    |  |        +--rw description?     string
    |  +--rw interfaces* [type slot port]
    |  |  +--rw type              enumeration
    |  |  +--rw slot              uint16
    |  |  +--rw port              string
    |  |  +--rw description?      string
    |  |  +--rw media-type
    |  |  |  +--rw state?   enumeration
    |  |  +--rw autoneg
    |  |  |  +--rw state?   enumeration
    |  |  +--rw classification
    |  |  |  +--rw default-cos
    |  |  |  |  +--rw state?   uint16
    |  |  |  +--rw type_802-1p
    |  |  |  |  +--rw state?   enumeration
    |  |  |  +--rw ip-dscp
    |  |  |  |  +--rw state?   enumeration
    |  |  |  +--rw mpls
    |  |  |     +--rw state?   enumeration
    |  |  +--rw priority
    |  |     +--rw profile-id?   string
    |  +--rw service* [sid type]
    |     +--rw sid            uint16
    |     +--rw type           string
    |     +--rw admin?         string
    |     +--rw evc-id?        string
    |     +--rw description?   string
    |     +--rw sp* [spid]
    |        +--rw spid         string
    |        +--rw sp-type?     string
    |        +--rw int-type?    string
    |        +--rw interface?   string
    |        +--rw slot?        string
    |        +--rw port?        string
    |        +--rw vlan?        string
    |        +--rw sp-name?     string
  ```

  - /config/radio * 
  ```
    +--rw radio
       +--rw interfaces* [slot port]
       |  +--rw slot          uint16
       |  +--rw port          uint16
       |  +--rw rf
       |  |  +--rw tx-level?           uint32
       |  |  +--rw rx-frequency?       uint32
       |  |  +--rw tx-frequency?       uint32
       |  |  +--rw mute
       |  |  |  +--rw admin?   enumeration
       |  |  +--rw adjacent-channel?   enumeration
       |  +--rw lcl-rmt-ch
       |     +--rw link-id?   uint32
       +--rw xpic* [group]
          +--rw group         uint16
          +--rw carrier1
          |  +--rw radio?   uint16
          |  +--rw port?    uint16
          +--rw carrier2
          |  +--rw radio?   uint16
          |  +--rw port?    uint16
          +--rw admin-mode?   enumeration
  ```



  ## 4.2 Sample config

  - Below config snippet shows the CDB config format in NSO Cisco Style CLI content dump. 
  - After configuring the device, one must run sync-from, to collect all data existing on the device configured. 


  ```
   config
    platform activation-key key 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ
    platform management protection admin disable
    platform management system-location name LocationName
    platform management system-contact name ContactName
    platform shelf-manager slot 1
     admin             enable
     expected-cardtype TCC-U
    !
    platform shelf-manager slot 2
     admin             disable
     expected-cardtype Cleared
    !
    platform shelf-manager slot 3
     slot-name         "Link 2"
     admin             enable
     expected-cardtype RIC-D
    !
    platform if-manager interface-type ABConRFU slot 3 port 1 admin up
    platform if-manager interface-type LinkBonding slot 1 port 1 admin up
    platform if-manager interface-type ethernet slot 1 port 2 admin down
    platform if-manager interface-type management slot 1 port 1 admin up
    platform if-manager interface-type radio slot 3 port 1 admin up
    platform if-manager interface-type synch slot 1 port 1 admin down
    ethernet generalcfg mru size 1234
    ethernet qos port-priority-profile-tbl 9 cos0-priority 1 description "cos0 priority" cos1-priority 2 description "cos1 priority" cos2-priority 2 description "cos2 priority" cos3-priority 2 description "cos3 priority"  cos4-priority 2 description "cos4 priority"  cos5-priority 3 description "cos5 priority"  cos6-priority 3 description "cos6 priority" cos7-priority 4 description singleWord
    ethernet interfaces eth slot 1 port 1
     media-type state sfp
     autoneg state off
     classification default-cos state 2
     classification type_802-1p state trust
     classification ip-dscp state trust
     classification mpls state trust
     priority profile-id 9
    !
    ethernet interfaces eth slot 1 port 2
     media-type state sfp
     autoneg state off
     classification default-cos state 2
     classification type_802-1p state trust
     classification ip-dscp state trust
     classification mpls state trust
     priority profile-id 9
    !
    ethernet service sid 1 type p2p admin operational evc-id 123 description N.A.
    ethernet service sid 2 type p2p admin operational evc-id 1234 description N.A.
    ethernet service sid 2 type p2p sp spid 1 sp-type sap int-type eth interface dot1q slot 1 port 1 vlan 1234 sp-name N.A.
    radio slot 1 port 1
     rf tx-level 1
     rf mute admin on
     rf adjacent-channel disable
     lcl-rmt-ch link-id 123
    !
    radio xpic group 1 radio 3 port 1 radio 3 port 2 admin-mode enable
   !
  !
  ```

  ## 4.3 Short Configuration summary samples from NSO CLI/NED towards the device:

  ### !!! Important considerations to take into account:

  - The Ceragon IP-20 device CLI config structure does **not** allow traditional operations to be performed on the entire data set, such as Create, Delete, Set|Modify, Show. 
  - Some modules support only SET|Modify, as they are always pre-populated when the hardware cards are inserted
  - Some modules support Create/Delete as well. 
  - In the below examples we will cover the currently supported operation types. If we have one point on which we perform only SET, it means create/delete are not supported. 
  - Either way, if an illegal operation is tried, either the device or the NED will reject the operation and an exception will be thrown. 



  ### 4.3.1 Configuring /data/platform/activation-key

  - Configure new activation key
  ```
  devices device <deviceName>
   config
    platform activation-key key <newKeyString>
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                            platform {
                                activation-key {
               -                    key <oldKeyString>;
               +                    key <newKeyString>;
                                }
                            }
                        }
                    }
                }
      }
  }   
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data platform activation-key set key string <newKeyString>
      }
  }
  ```


  ### 4.3.2 Configuring /data/platform/management

  - Configure/set params under platform/management :
    - admin
    - system-location name
    - system-contact name

  ```
  devices device <deviceName>
   config
    platform management protection admin disable
    platform management system-location name <newLocationName>
    platform management system-contact name "<new Contact Name>"
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                            platform {
                                management {
                                    protection {
               -                        admin disable;
               +                        admin enable;
                                    }
                                    system-location {
               -                        name <prevLocationName>;
               +                        name <newLocationName>;
                                    }
                                    system-contact {
               -                        name <prevContactName>;
               +                        name "<new Contact Name>";
                                    }
                                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued

  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data platform management protection set admin enable
               platform management system-location set name <newLocationName>
               platform management system-contact set name "<new Contact Name>"
      }
  }
  admin@ncs(config-config)# commit
  ```



  ### 4.3.3 Configuring /data/platform/if-manager interface-type * slot * port * admin 

  - Set admin down
  ```
  devices device <deviceName>
   config
    platform if-manager interface-type ethernet slot 1 port 1 admin down
   !
  !
  ```


  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                            platform {
                                if-manager {
                                    interfaces ethernet 1 1 {
               -                        admin up;
               +                        admin down;
                                    }
                                }
                            }                          
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data platform if-manager set interface-type ABConRFU slot 3 port 1 admin down
      }
  }
  admin@ncs(config-config)# commit
  ```

  ### 4.3.4 Configuring /data/platform/shelf-manager{slot *} params

  - Configure|set /data/platform/shelf-manager{slot *}/admin enable|disable
  - Configure|set /data/platform/shelf-manager{slot *}/expected-cardtype <cardType>|Cleared
  ```
  devices device <deviceName>
   config
    platform shelf-manager slot 1
     admin             enable
     expected-cardtype Cleared
    !
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                            platform {
                                shelf-manager {
                                    shelves 1 {
               -                        admin enable;
               +                        admin disable;
               -                        expected-cardtype TCC-U;
               +                        expected-cardtype Cleared;
                                    }
                                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data platform shelf-manager admin set slot 1 state disable
               platform shelf-manager expected-cardtype set slot 1 type Cleared
      }
  }
  admin@ncs(config-config)# commit
  ```


  ### 4.3.5 Configuring /ethernet/generalcfg/mru/size

  - Configure|set 
  ```
  devices device <deviceName>
   config
    ethernet generalcfg mru size 2000
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                            ethernet {
                                generalcfg {
                                    mru {
               -                        size 2000;
               +                        size 1234;
                                    }
                                }
                            }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
              data ethernet generalcfg mru set size 1234
      }
  }
  admin@ncs(config-config)# commit
  ```



  ### 4.3.6 Configuring /ethernet/qos/port-priority-profile-tbl 

  - Configure|set **Existing** /ethernet/qos/port-priority-profile-tbl * cos[0-7] priority or description:
  - Configuring any update on the priority table, on the existing priority table, will generate a full priorty table update:
  - Example below, update cos0-priority to 2 and description to "best effort updated"

  ```
  devices device <deviceName>
   config
    ethernet qos port-priority-profile-tbl 9 cos0-priority 2 description "best effort updated" cos1-priority 2 description "data service 4" cos2-priority 2 description "data service 3" cos3-priority 2 description "data service 2" cos4-priority 2 description "data service 1" cos5-priority 3 description "real time 2" cos6-priority 3 description "real time 1" cos7-priority 4 description management
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                            ethernet {                        
                                qos {
                                    port-priority-profile-tbl 9 {
                                        cos0 {
               -                            cos0-priority 1;
               +                            cos0-priority 2;
               -                            description "best effort";
               +                            description "best effort updated";
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data ethernet qos port-priority-profile-tbl edit profile-id 9 cos0-priority 2 description "best effort updated" cos1-priority 2 description "data service 4" cos2-priority 2 description "data service 3" cos3-priority 2 description "data service 2" cos4-priority 2 description "data service 1" cos5-priority 3 description "real time 2" cos6-priority 3 description "real time 1" cos7-priority 4 description management
      }
  }
  admin@ncs(config-config)# commit
  ```


  ### 4.3.7 CREATE AND DELETE  /ethernet/qos/port-priority-profile-tbl full profiles
  ---


  ### 4.3.7.1 CREATE /ethernet/qos/port-priority-profile-tbl profile 1
  - Create /ethernet/qos/port-priority-profile-tbl profile 1

  ```
  devices device <deviceName>
   config
    ethernet qos port-priority-profile-tbl 1 cos0-priority 1 description "test description 1" cos1-priority 2 description "test description 2" cos2-priority 2 description "test description 3" cos3-priority 2 description "test description 4" cos4-priority 2 description "test description 5" cos5-priority 3 description "test description 6" cos6-priority 3 description "test description 7" cos7-priority 4 description single_word_no_whitespace_desc
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                             ethernet {
                                qos {
               +                    port-priority-profile-tbl 1 {
               +                        cos0 {
               +                            cos0-priority 1;
               +                            description "test description 1";
               +                        }
               +                        cos1 {
               +                            cos1-priority 2;
               +                            description "test description 2";
               +                        }
               +                        cos2 {
               +                            cos2-priority 2;
               +                            description "test description 3";
               +                        }
               +                        cos3 {
               +                            cos3-priority 2;
               +                            description "test description 4";
               +                        }
               +                        cos4 {
               +                            cos4-priority 2;
               +                            description "test description 5";
               +                        }
               +                        cos5 {
               +                            cos5-priority 3;
               +                            description "test description 6";
               +                        }
               +                        cos6 {
               +                            cos6-priority 3;
               +                            description "test description 7";
               +                        }
               +                        cos7 {
               +                            cos7-priority 4;
               +                            description single_word_no_whitespace_desc;
               +                        }
               +                    }
                                }
                            }
                        }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data ethernet qos port-priority-profile-tbl add profile-id 1 cos0-priority 1 description "test description 1" cos1-priority 2 description "test description 2" cos2-priority 2 description "test description 3" cos3-priority 2 description "test description 4" cos4-priority 2 description "test description 5" cos5-priority 3 description "test description 6" cos6-priority 3 description "test description 7" cos7-priority 4 description single_word_no_whitespace_desc
      }
  }
  admin@ncs(config-config)# commit
  ```
  ---

  ### 4.3.7.2 DELETE /ethernet/qos/port-priority-profile-tbl profile 1

  - Delete /ethernet/qos/port-priority-profile-tbl profile 1

  ```
  devices device <deviceName>
   config
    no ethernet qos port-priority-profile-tbl 1
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                             ethernet {
                                qos {
               -                    port-priority-profile-tbl 1 {
               -                        cos0 {
               -                            cos0-priority 1;
               -                            description "test description 1";
               -                        }
               -                        cos1 {
               -                            cos1-priority 2;
               -                            description "test description 2";
               -                        }
               -                        cos2 {
               -                            cos2-priority 2;
               -                            description "test description 3";
               -                        }
               -                        cos3 {
               -                            cos3-priority 2;
               -                            description "test description 4";
               -                        }
               -                        cos4 {
               -                            cos4-priority 2;
               -                            description "test description 5";
               -                        }
               -                        cos5 {
               -                            cos5-priority 3;
               -                            description "test description 6";
               -                        }
               -                        cos6 {
               -                            cos6-priority 3;
               -                            description "test description 7";
               -                        }
               -                        cos7 {
               -                            cos7-priority 4;
               -                            description single_word_no_whitespace_desc;
               -                        }
               -                    }
                                }
                            }
                        }
                    }
                }
      }
  }

  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data ethernet qos port-priority-profile-tbl delete profile-id 1
      }
  }
  admin@ncs(config-config)# commit
  ```



  ### 4.3.8 Updating /ethernet/interfaces/eth{slot * port *}

  - Configure|set /ethernet/interfaces/eth{slot * port *}a/ * parameters:
    - media-type state <auto-type|pwe3|radio|rj45|sfp>
    - autoneg state on|off
    - classification default-cos state <0-9> 
    - classification type_802-1p state trust|un-trust
    - classification ip-dscp state trust|un-trust
    - classification mpls state trust|un-trust
    - priority profile-id <0-9>


  - Configure  ethernet interfaces slot 1 port 1 params:
  ```
  devices device <deviceName>
   config
    ethernet interfaces eth slot 1 port 1
     media-type state auto-type
     autoneg state on
     classification default-cos state 1
     classification type_802-1p state un-trust
     classification ip-dscp state un-trust
     classification mpls state un-trust
     priority profile-id 1
    !
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                            ethernet {
                                interfaces eth 1 1 {
                                    media-type {
               -                        state sfp;
               +                        state auto-type;
                                    }
                                    autoneg {
               -                        state off;
               +                        state on;
                                    }
                                    classification {
                                        default-cos {
               -                            state 2;
               +                            state 1;
                                        }
                                        type_802-1p {
               -                            state trust;
               +                            state un-trust;
                                        }
                                        ip-dscp {
               -                            state trust;
               +                            state un-trust;
                                        }
                                        mpls {
               -                            state trust;
               +                            state un-trust;
                                        }
                                    }
                                    priority {
               -                        profile-id 9;
               +                        profile-id 1;
                                    }
                                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
  admin@ncs(config-interfaces-eth/1/1)# commit dry-run outformat native 
  native {
      device {
          name ip20-26
          data ethernet interfaces eth slot 1 port 1
               media-type state set auto-type
               autoneg state set on
               classification set default-cos state 1
               classification set type_802-1p state un-trust
               classification set ip-dscp state un-trust
               classification set mpls state un-trust
               priority set profile-id 1
               exit
      }
  }        
  admin@ncs(config-config)# commit
  ```


  - Please note that parameters under ethernet interfaces eth slot * port * can only be SET! 
     - Delete, Create operations are NOT supported by device. 


  ### 4.3.9 Configuring /ethernet/service {sid * type *}

  ### 4.3.9.1 Create new ethernet service. 

  - Create new service, without SP:
  ```
  devices device <deviceName>
   config
    ethernet service sid 1 type p2p admin operational evc-id 122 description N.A.
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                            ethernet {
               +                service 1 p2p {
               +                    admin operational;
               +                    evc-id 122;
               +                    description N.A.;
               +                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
           data ethernet service sid 1 type p2p admin operational evc-id 122 description N.A. 
      }
  }
  admin@ncs(config-config)# commit
  ```

  ### 4.3.9.2 Create new ethernet service with SP. 

  - First line of config, with params admin, evc-id, description addresses the parameters of the ethernet service with sid 1.
  - Second line of config, starting with **sp spid 1** is addressing the Service Point associated to ethernet service with sid 1:
  ```
  devices device <deviceName>
   config
    ethernet service sid 1 type p2p admin operational evc-id 122 description N.A.
    ethernet service sid 1 type p2p sp spid 1 sp-type sap int-type eth interface dot1q slot 1 port 1 vlan 1020 sp-name N.A.
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                            ethernet {
               +                service 1 p2p {
               +                    admin operational;
               +                    evc-id 122;
               +                    description N.A.;
               +                    sp 1 {
               +                        sp-type sap;
               +                        int-type eth;
               +                        interface dot1q;
               +                        slot 1;
               +                        port 1;
               +                        vlan 1020;
               +                        sp-name N.A.;
               +                    }
               +                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data ethernet service add type p2p sid 1 admin operational evc-id 122 description N.A.

               ethernet service sid 1
               sp spid 1 sp-type sap int-type eth interface dot1q slot 1 port 1 vlan 1020 sp-name N.A.
               exit
      }
  }
  admin@ncs(config-config)# commit
  ```

  - In this case, we will first create the service and only after we will add the SP point by entering into ethernet service sid mode.




  ### 4.3.9.3 Delete only ethernet service SP under an existing ethernet service. 

  ```
  devices device <deviceName>
   config
    no ethernet service sid 1 type p2p sp spid 1 
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                            ethernet {
                                service 1 p2p {
               -                    sp 1 {
               -                        sp-type sap;
               -                        int-type eth;
               -                        interface dot1q;
               -                        slot 1;
               -                        port 1;
               -                        vlan 1020;
               -                        sp-name N.A.;
               -                    }
                                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data ethernet service sid 1
               sp delete spid 1
               exit
      }
  }
  admin@ncs(config-config)# commit
  ```










  ### 4.3.9.4 Delete only ethernet service which does not have any SPs associated: 

  ```
  devices device <deviceName>
   config
    no ethernet service sid 1 type p2p
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                            ethernet {
               -                service 1 p2p {
               -                    admin operational;
               -                    evc-id 122;
               -                    description N.A.;
               -                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data ethernet service delete type p2p sid 1
      }
  }
  admin@ncs(config-config)# commit
  ```









  ### 4.3.9.5 Delete an ethernet service HAS at least 1 SP associated: 

  - Starting from below config:
  ```
  admin@ncs(config-device-ip20-26)# show full config ethernet service sid 1 type p2p
  devices device ip20-26
   config
    ethernet service sid 1 type p2p admin operational evc-id 122 description N.A.
    ethernet service sid 1 type p2p sp spid 1 sp-type sap int-type eth interface dot1q slot 1 port 1 vlan 1020 sp-name N.A.
   !
  !
  ```

  - We delete the top level ethernet/service :

  ```
  devices device <deviceName>
   config
    no ethernet service sid 1 type p2p
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                          ethernet {
               -                service 1 p2p {
               -                    admin operational;
               -                    evc-id 122;
               -                    description N.A.;
               -                    sp 1 {
               -                        sp-type sap;
               -                        int-type eth;
               -                        interface dot1q;
               -                        slot 1;
               -                        port 1;
               -                        vlan 1020;
               -                        sp-name N.A.;
               -                    }
               -                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data ethernet service sid 1
               sp delete spid 1
               exit
               ethernet service delete type p2p sid 1
      }
  }
  admin@ncs(config-config)# commit
  ```

  - As you may notice, we have to enter service mode first, delete the SP, then exit and delete the service itself.








  ### 4.3.10 Configuring /radio/{slot * port *}

  - Configure radio slot * port * params. 
  - Consider initial config: 
  ```
  devices device <deviceName>
   config
    radio slot 1 port 1
     rf tx-level 1
     rf mute admin on
     rf adjacent-channel disable
     lcl-rmt-ch link-id 123
    !
   !
  !
  ```

  ```
  devices device <deviceName>
   config
    radio slot 1 port 1
     rf tx-level 2
     rf mute admin off
     rf adjacent-channel enable
     lcl-rmt-ch link-id 456
    !
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
  radio {
                                interfaces 1 1 {
                                    rf {
               -                        tx-level 1;
               +                        tx-level 2;
                                        mute {
               -                            admin on;
               +                            admin off;
                                        }
               -                        adjacent-channel disable;
               +                        adjacent-channel enable;
                                    }
                                    lcl-rmt-ch {
               -                        link-id 123;
               +                        link-id 456;
                                    }
                                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data radio slot 1 port 1
               rf set tx-level 2
               rf mute set admin off
               rf adjacent-channel enable
               lcl-rmt-ch link-id set 456
               exit        
      }
  }
  admin@ncs(config-config)# commit
  ```





  ### 4.3.11 Configuring /radio/xpic/group *


  ### 4.3.11.1 Create /radio/xpic/group * without admin-mode

  - Create radio xpic group without mentioning any admin-mode
  - It will create a admin-mode disabled radio xpic group. 
  - Ideally it should be enabled separately, after a delay. 
  ```
  devices device <deviceName>
   config
    radio xpic group 2 radio 4 port 1 radio 5 port 2
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                             radio {
               +                xpic 2 {
               +                    carrier1 {
               +                        radio 4;
               +                        port 1;
               +                    }
               +                    carrier2 {
               +                        radio 5;
               +                        port 2;
               +                    }
               +                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data radio xpic create group 2 radio 4 port 1 radio 5 port 2        
      }
  }
  admin@ncs(config-config)# commit
  ```



  ### 4.3.11.2 Create /radio/xpic/group * WITH explicit admin-mode enable|disable

  - Create radio xpic group specifying any admin-mode state will be broken down in two step commands
  - It will create a radio xpic group with admin-mode which is disabled by default.
  - Ideally they should be enabled/disabled in the service logic with a delay in between.
  ```
  devices device <deviceName>
   config
     data radio xpic create group 2 radio 4 port 1 radio 5 port 2 admin-mode enable
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                             radio {
               +                xpic 2 {
               +                    carrier1 {
               +                        radio 4;
               +                        port 1;
               +                    }
               +                    carrier2 {
               +                        radio 5;
               +                        port 2;
               +                    }
               +                    admin-mode enable;
               +                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the commands that will be issued in sequence
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data radio xpic create group 2 radio 4 port 1 radio 5 port 2
               radio xpic set group 2 admin enable
      }
  }
  admin@ncs(config-config)# commit
  ```



  ### 4.3.11.3 Delete /radio/xpic/group * with admin-mode ENABLED

  - Deleting radio xpic group without admin-mode enabled assumes first disabling the admin mode and only then deleting the radio xpic group.

  - Considering initial config:
  ```
  devices device <deviceName>
   config
    radio xpic group 2 radio 4 port 1 radio 5 port 2 admin-mode enable
   !
  !
  ```

  - We delete the radio xpic group 2:
  ```
  devices device <deviceName>
   config
    no radio xpic group 2 
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceName> {
                        config {
                             radio {
               -                xpic 2 {
               -                    carrier1 {
               -                        radio 4;
               -                        port 1;
               -                    }
               -                    carrier2 {
               -                        radio 5;
               -                        port 2;
               -                    }
               -                    admin-mode enable;
               -                }
                            }
                        }
                    }
                }
      }
  }
  ```

  - Commit native to display **device CLI native syntax** of the commands that will be issued:

  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceName>
          data radio xpic set group 2 admin disable
               radio xpic delete group 2
      }
  }
  admin@ncs(config-config)# commit
  ```

  - Again, we see a two step approach above, we first must disable admin and only then we can delete the radio xpic group 2.


# 5. Built in live-status actions
---------------------------------

  NONE


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
    - SSH/TELNET access to a device where the issue can be reproduced by the Cisco NSO NED team.
      This typically means both read and write permissions are required.
      Pseudo access via tools like Webex, Zoom etc is not acceptable.
      However, it is ok with device access through VPNs, jump servers etc though.

  Do as follows to gather the necessary information needed for your device, here named 'dev-1':

  1. Enable full debug logging in the NED

     ```
     ncs_cli -C -u admin
     admin@ncs# configure
     admin@ncs(config)# devices device dev-1 ned-settings ceragon-ip20 logging level debug
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
  > devices device dev-1 ned-settings ceragon-ip20 logger level debug
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
