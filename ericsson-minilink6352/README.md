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

  This document describes the ericsson-minilink6352 NED.

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
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | MINI-LINK 6352/2 80/21H   |                 |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-ericsson-minilink6352-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-ericsson-minilink6352-1.0.1.signed.bin
      > ./ncs-6.0-ericsson-minilink6352-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-ericsson-minilink6352-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-ericsson-minilink6352-1.0.1.tar.gz
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
     `ericsson-minilink6352-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-ericsson-minilink6352-1.0.1.tar.gz
     > ls -d */
     ericsson-minilink6352-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package ericsson-minilink6352-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package ericsson-minilink6352-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-ericsson-minilink6352-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package ericsson-minilink6352-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/ericsson-minilink6352-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-ericsson-minilink6352-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-ericsson-minilink6352-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install ericsson-minilink6352-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-ericsson-minilink6352-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-ericsson-minilink6352-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id ericsson-minilink6352-cli-1.0
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
  - Mandatory additional configurations:

    ```
    admin@ncs(config)# devices device dev-1 ned-settings ericsson-minilink6352 connection remote-name <user_name>
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

  `$NSO_RUNDIR/logs/ned-ericsson-minilink6352-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings ericsson-minilink6352 logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings ericsson-minilink6352 logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.minilink6352 \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings ericsson-minilink6352 logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings ericsson-minilink6352 logger java true
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

  ## 4.1 Current Yang schema structure of the model adopted:

  - /config/common/services *:
  ```
    +--rw common
    |  +--rw services
    |  |  +--rw dhcp
    |  |  |  +--rw dhcp-enable?            enabled-disabled-type
    |  |  |  +--rw address-range-start?    inet:ip-address
    |  |  |  +--rw address-range-length?   uint16
    |  |  |  +--rw lease-time?             uint32
    |  |  +--rw service
    |  |     +--rw http
    |  |     |  +--rw service-enable?   enabled-disabled-type
    |  |     |  +--rw port?             uint32
    |  |     +--rw https
    |  |     |  +--rw service-enable?   enabled-disabled-type
    |  |     |  +--rw port?             uint32
    |  |     +--rw snmp
    |  |     |  +--rw service-enable?   enabled-disabled-type
    |  |     |  +--rw port?             uint32
    |  |     +--rw xrpc
    |  |        +--rw service-enable?   enabled-disabled-type
    |  |        +--rw port?             uint32
  ```

  - /config/common/system *:
  ```
    +--rw common
    |  +--rw system
    |  |  +--rw contact?    string
    |  |  +--rw name?       string
    |  |  +--rw location?   string
  ```


  - /config/common/time *:
  ```
    +--rw common
    |  +--rw time
    |  |  +--rw clock?                string
    |  |  +--rw time-zone?            timezone-type
    |  |  +--rw server?               string
    |  |  +--rw server-ipv6?          inet:ipv6-address
    |  |  +--rw ntp?                  enabled-disabled-type
    |  |  +--rw ntp-authentication?   enabled-disabled-type
  ```


  - /config/common/snmp *:
  ```
    +--rw common
    |  +--rw snmp
    |     +--rw in-use?   enabled-disabled-type
  ```


  - /config/dcn-mgmtvlan *:
  ```
  +--rw dcn-mgmtvlan
    |  +--rw mgmt-vlan-id?   uint16
    |  +--rw dscp?           string
    |  +--rw pcp?            string
    |  +--rw description?    string
  ```


  - /config/cos *:
  ```
  +--rw cos
    |  +--rw dot1p
    |     +--rw priority-map-profile* [name]
    |        +--rw name            string
    |        +--rw priority-map* [priority]
    |           +--rw priority    enumeration
    |           +--rw class?      enumeration
  ```


  - /config/ip/interface *:
  ```
   +--rw ip
    |  +--rw interface* [index]
    |  |  +--rw index           uint16
    |  |  +--rw address?        inet:ip-address
    |  |  +--rw address-ipv6?   inet:ip-address
    |  |  +--rw mask?           inet:ip-address
    |  |  +--rw mtu?            uint16
    |  |  +--rw type?           enumeration

  ```


  - /config/ip/route *:
  ```
   +--rw ip
    |  +--rw route* [ip mask gateway]
    |     +--rw ip            inet:ip-address
    |     +--rw mask          inet:ip-address
    |     +--rw gateway       inet:ip-address
    |     +--rw metric?       uint64
    |     +--rw preference?   uint64
  ```



  - /config/slot */ct  *:
  ```
  +--rw slot* [slot-number]
    |  +--rw slot-number    uint16
    |  +--rw ct* [ct-number]
    |  |  +--rw ct-number                     uint16
    |  |  +--rw description?                  string
    |  |  +--rw frame-id?                     string
    |  |  +--rw tx-frequency?                 string
    |  |  +--rw selected-max-output-power?    string
    |  |  +--rw selected-min-output-power?    string
    |  |  +--rw target-input-power-far-end?   string
    |  |  +--rw selected-max-acm?             string
    |  |  +--rw selected-min-acm?             string
    |  |  +--rw tx-admin-status?              on-off-type
  ```


  - /config/slot */rlt  *:
  ```
  +--rw slot* [slot-number]
    |  +--rw slot-number    uint16
   |  +--rw rlt* [rlt-number]
    |  |  +--rw rlt-number             uint16
    |  |  +--rw id?                    string
    |  |  +--rw expected-far-end-id?   string
    |  |  +--rw far-end-id-check?      enabled-disabled-type
    |  |  +--rw mode?                  string
    |  |  +--rw ct-member?             string
  ```


  - /config/slot */lan  *:
  ```
  +--rw slot* [slot-number]
    |  +--rw slot-number    uint16
    |  +--rw lan* [slot port]
    |  |  +--rw port            uint16
    |  |  +--rw slot            uint16
    |  |  +--rw description?    string
    |  |  +--rw admin-status?   admin-status-type
    |  |  +--rw lan-setting
    |  |  |  +--rw auto-negotiation?   string
    |  |  |  +--rw oper-mode?          string
    |  |  |  +--rw mtu?                string
    |  |  +--rw switchport
    |  |  |  +--rw mode?              string
    |  |  |  +--rw port-ether-type?   string
    |  |  |  +--rw default-vlan?      string
    |  |  +--rw cos
    |  |     +--rw queue-profile
    |  |     |  +--rw queue-profile?   string
    |  |     +--rw hqos-profile
    |  |     |  +--rw hqos-profile?   string
    |  |     +--rw priority-map-profile
    |  |        +--rw priority-map-profile?   string
  ```


  - /config/slot */wan  *:
  ```
  +--rw slot* [slot-number]
    |  +--rw slot-number    uint16
    |  +--rw wan* [slot port]
    |     +--rw port            uint16
    |     +--rw slot            uint16
    |     +--rw description?    string
    |     +--rw priority?       enumeration
    |     +--rw admin-status?   admin-status-type
    |     +--rw cos
    |        +--rw priority-map-profile
    |           +--rw priority-map-profile?   string
  ```


  ## 4.2 Sample config

  - Below config snippet shows the CDB config format in NSO Cisco Style CLI content dump. 
  - After configuring the device, one must run sync-from, to collect all data existing on the device configured. 
  - Double check **/ned-settings/ericsson-minilink6352/connection/remote-name** is updated accordingly before running sync-from
    - It can be easily tested by running devices device <deviceName> connect; If connect fails, update remote-name, commit changes and retry. 



  ## 4.3 Configuring /common


  ### 4.3.1 Configuring /common/services/dhcp

  - Configure new params:

  ```
  $ ncs_cli -u admin -C
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device <deviceNAme> config
  admin@ncs(config-config)# common services dhcp dhcp-enable enabled
  admin@ncs(config-config)# common services dhcp address-range-start 192.168.0.2
  admin@ncs(config-config)# common services dhcp address-range-length 100
  admin@ncs(config-config)# common services dhcp lease-time 43200
  ```

  - Check configured candidate cdb content:

  ```
  admin@ncs(config-config)# show full-configuration common services dhcp
  devices device <deviceNAme>
   config
    common services dhcp dhcp-enable enabled
    common services dhcp address-range-start 192.168.1.1
    common services dhcp address-range-length 100
    common services dhcp lease-time 43200
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run
  cli {
      local-node {
          data  devices {
                    device <deviceNAme> {
                        config {
                            common {
                                services {
                                    dhcp {
               -                        dhcp-enable disabled;
               +                        dhcp-enable enabled;
               -                        address-range-start 192.168.0.0;
               +                        address-range-start 192.168.0.2;
               -                        address-range-length 24;
               +                        address-range-length 100;
               -                        lease-time 0;
               +                        lease-time 43200;
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
          name <deviceNAme>
          data common services dhcp dhcp-enable enabled
               common services dhcp address-range-start 192.168.0.2
               common services dhcp address-range-length 100
               common services dhcp lease-time 43200
      }
  }
  ```

  ### 4.3.2 Configuring /common/services/service/http|https|snmp|xrpc

  - Configure new params:

  ```
  $ ncs_cli -u admin -C
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device <deviceNAme> config
  admin@ncs(config-config)# common services service http service-enable enabled port 80
  admin@ncs(config-config)# common services service https service-enable enabled port 443
  admin@ncs(config-config)# common services service snmp service-enable enabled port 161
  admin@ncs(config-config)# common services service xrpc service-enable enabled port 8080
  ```

  - Check configured candidate cdb content:

  ```

  admin@ncs(config-config)# show full-configuration common services service
  devices device <deviceNAme>
   config
    common services service http service-enable enabled port 8080
    common services service https service-enable enabled port 8443
    common services service snmp service-enable enabled port 160
    common services service xrpc service-enable enabled port 8888
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  admin@ncs(config-config)# commit dry-run
  cli {
      local-node {
          data  devices {
                    device <deviceNAme> {
                        config {
                            common {
                                services {
                                    service {
                                        http {
               -                            service-enable disabled;
               +                            service-enable enabled;
               -                            port 80;
               +                            port 8080;
                                        }
                                        https {
               -                            service-enable disabled;
               +                            service-enable enabled;
               -                            port 443;
               +                            port 8443;
                                        }
                                        snmp {
               -                            service-enable disabled;
               +                            service-enable enabled;
               -                            port 161;
               +                            port 160;
                                        }
                                        xrpc {
               -                            service-enable disabled;
               +                            service-enable enabled;
               -                            port 8080;
               +                            port 8888;
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
          data common services service http service-enable enabled port 8080
               common services service https service-enable enabled port 8443
               common services service snmp service-enable enabled port 160
               common services service xrpc service-enable enabled port 8888
      }
  }
  ```

  ### 4.3.3 Configuring /common/system

  - Configure params:

  ```
  $ ncs_cli -u admin -C
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device <deviceNAme> config
  admin@ncs(config-config)# common system contact <WORD1 WORD2 WORD3>
  admin@ncs(config-config)# common system name <NAME>
  admin@ncs(config-config)# common system location <WORD1 WORD2 WORD3>
  ```

  - Check configured candidate cdb content:

  ```

  admin@ncs(config-config)# show full-configuration common system
  devices device <deviceNAme>
   config
    common system contact Contact Name
    common system name System Name
    common system location System Location
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceNAme> {
                        config {
                            common {
                                system {
               -                    contact " old name";
               +                    contact "Contact Name";
               -                    name old_system_name;
               +                    name "System Name";
               -                    location "location name";
               +                    location "System Location";
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
          name <deviceNAme>
          data common system contact Contact Name
               common system name System Name
               common system location System Location
      }
  }
  ```


  ### 4.3.4 Configuring /common/snmp/in-use

  - Configure params:

  ```
  admin@ncs(config-config)# show full-configuration common snmp 
  devices device <deviceNAme>
   config
    data common snmp in-use enabled
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run
  cli {
      local-node {
          data  devices {
                    device <deviceNAme> {
                        config {
                            common {
                                snmp {
               -                    in-use disabled;
               +                    in-use enabled;
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
          name <deviceNAme>
          data common snmp in-use enabled
      }
  }
  ```

  ### 4.3.5 Configuring /common/time

  - Configure params:

  ```
  $ ncs_cli -u admin -C
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device <deviceNAme> config
  admin@ncs(config-config)# common time clock  13:10:45 May 23 2024
  admin@ncs(config-config)# common time time-zone AMERICA
  admin@ncs(config-config)# common time server 1.123.12.12
  admin@ncs(config-config)# common time server-ipv6 ::
  admin@ncs(config-config)# common time ntp    enabled
  admin@ncs(config-config)# common time ntp-authentication disabled

  ```

  - Check configured candidate cdb content:

  ```

  admin@ncs(config-config)# show full-configuration common time
  devices device <deviceNAme>
   config
    common time clock  13:10:45 May 24 2024
    common time time-zone AMERICA
    common time server 1.234.56.78
    common time server-ipv6 ::
    common time ntp    enabled
    common time ntp-authentication disabled
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state

  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceNAme> {
                        config {
                            common {
                                time {
               -                    clock "13:10:45 May 23 2024";
               +                    clock "13:10:45 May 24 2024";
               -                    time-zone AMERICA;
               +                    time-zone AMERICA_DENVER;
               -                    server 1.234.56.78;
               +                    server 1.2.3.4;
               -                    ntp enabled;
               +                    ntp disabled;
               -                    ntp-authentication disabled;
               +                    ntp-authentication enabled;
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
          name <deviceNAme>
          data common time clock 13:10:45 May 24 2024
               common time time-zone AMERICA
               common time server 1.234.56.78
               common time ntp enabled
               common time ntp-authentication disabled
      }
  }
  ```


  ## 4.4 Configuring /dcn-mgmtvlan

  ### 4.4.1 Configuring /dcn-mgmtvlan

  - Configure params:

  ```
  $ ncs_cli -u admin -C
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device <deviceNAme> config
  admin@ncs(config-config)# dcn-mgmtvlan mgmt-vlan-id 1234
  admin@ncs(config-config)# dcn-mgmtvlan dscp 12
  admin@ncs(config-config)# dcn-mgmtvlan pcp 5
  admin@ncs(config-config)# dcn-mgmtvlan description LAN_NAME
  ```


  ```
  admin@ncs(config-config)# show full-configuration dcn-mgmtvlan
  devices device <deviceNAme>
   config
    dcn-mgmtvlan mgmt-vlan-id 1234
    dcn-mgmtvlan dscp 12
    dcn-mgmtvlan pcp 5
    dcn-mgmtvlan description LAN_NAME
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceNAme> {
                        config {
                            dcn-mgmtvlan {
               -                mgmt-vlan-id 999;
               +                mgmt-vlan-id 1234;
               -                dscp 16;
               +                dscp 12;
               -                pcp 7;
               +                pcp 5;
               -                description OLD_NAME;
               +                description LAN_NAME;
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
          name <deviceNAme>
          data dcn-mgmtvlan mgmt-vlan-id 1234
               dcn-mgmtvlan dscp 12
               dcn-mgmtvlan pcp 5
               dcn-mgmtvlan description LAN_NAME
      }
  }
  ```

  ## 4.5 Configuring /cos

  ### 4.5.1 Configuring /cos/dot1p/priority-map-profile

  - Configure params:

  ```
  $ ncs_cli -u admin -C
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device <deviceNAme> config
  admin@ncs(config-config)# cos dot1p priority-map-profile 1 priority-map 0 class 1
  admin@ncs(config-config)# cos dot1p priority-map-profile 1 priority-map 1 class 0
  ... 
  ```


  ```
  admin@ncs(config-config)# show full cos dot1p priority-map-profile 1
  devices device <deviceNAme>
   config
    cos dot1p priority-map-profile 1 priority-map 0 class 1
    cos dot1p priority-map-profile 1 priority-map 1 class 0
    cos dot1p priority-map-profile 1 priority-map 2 class 2
    cos dot1p priority-map-profile 1 priority-map 3 class 3
    cos dot1p priority-map-profile 1 priority-map 4 class 4
    cos dot1p priority-map-profile 1 priority-map 5 class 5
    cos dot1p priority-map-profile 1 priority-map 6 class 6
    cos dot1p priority-map-profile 1 priority-map 7 class 7
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceNAme> {
                        config {
                            cos {
                                dot1p {
                                    priority-map-profile 1 {
                                        priority-map 0 {
               -                            class 1;
               +                            class 0;
                                        }
                                        priority-map 1 {
               -                            class 0;
               +                            class 1;
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
          name <deviceNAme>
          data cos dot1p priority-map-profile 1 priority-map 0 class 0
               cos dot1p priority-map-profile 1 priority-map 1 class 1
      }
  }
  ```


  ## 4.6 Configuring /ip 

  ### 4.6.1 Configuring /ip/interface

  - Configure params:

  ```
  $ ncs_cli -u admin -C
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device <deviceNAme> config
  admin@ncs(config-config)# 
  ```


  ```
  admin@ncs(config-config)# show full ip interface 1
  devices device <deviceNAme>
   config
    ip interface 1
     address      192.168.0.1
     address-ipv6 ::
     mask         255.255.255.255
     mtu          1500
     type         numbered
    exit
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device <deviceNAme> {
                        config {
                            ip {
                                interface 1 {
               -                    address 192.168.1.1;
               +                    address 192.168.0.1;
               -                    mask 255.255.255.0;
               +                    mask 255.255.255.255;
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
          name <deviceNAme>
          data ip interface 1
                address 192.168.0.1
                mask 255.255.255.255
               exit
      }
  }
  ```


  ### 4.6.2 Configuring /ip/route

  - Ip route list has three keys: 
  ```
  admin@ncs(config-config)# ip route ?
  This line doesn't have a valid range expression
  Possible completions:
    A.B.C.D    Destination IP address
  admin@ncs(config-config)# ip route 1.2.3.4 ?
  Possible completions:
    A.B.C.D    Destination network prefix mask
  admin@ncs(config-config)# ip route 1.2.3.4 255.255.255.0 ?
  Possible completions:
    A.B.C.D   Gateway address
  admin@ncs(config-config)# ip route 1.2.3.4 255.255.255.0 1.2.3.0
  admin@ncs(config-route-1.2.3.4/255.255.255.0/1.2.3.0)# ?
  Possible completions:
    metric       <0 - 4294967295>;; Route metric Interface cost; The lower the metric, the more desirable the route
    preference   <0 - 255>;; The lower the preference, the more desirable the route
    ---
  ```

  - Configure params:

  ```
  $ ncs_cli -u admin -C
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device <deviceNAme> config
  admin@ncs(config-config)# ip route 1.2.3.4 255.255.255.0 1.2.3.0
  admin@ncs(config-route-1.2.3.4/255.255.255.0/1.2.3.0)# metric 1234
  admin@ncs(config-route-1.2.3.4/255.255.255.0/1.2.3.0)# preference 123
  ```

  - One can check the xpath to understand keys whose names are not exposed:
  ```
  admin@ncs(config-route-1.2.3.4/255.255.255.0/1.2.3.0)# show full-configuration | display xpath
  /devices/device[name='<deviceNAme>']/config/ericsson-minilink6352:ip/route[ip='1.2.3.4'][mask='255.255.255.0'][gateway='1.2.3.0']/metric 1234
  /devices/device[name='<deviceNAme>']/config/ericsson-minilink6352:ip/route[ip='1.2.3.4'][mask='255.255.255.0'][gateway='1.2.3.0']/preference 123
  ```

  - Or just show candidate cdb content:

  ```
  admin@ncs(config-route-1.2.3.4/255.255.255.0/1.2.3.0)# show full
  devices device <deviceNAme>
   config
    ip route 1.2.3.4 255.255.255.0 1.2.3.0
     metric     1234
     preference 123
    exit
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state
  ```
  admin@ncs(config-route-1.2.3.4/255.255.255.0/1.2.3.0)# commit dry-run
  cli {
      local-node {
          data  devices {
                    device <deviceNAme> {
                        config {
                            ip {
               +                route 1.2.3.4 255.255.255.0 1.2.3.0 {
               +                    metric 1234;
               +                    preference 123;
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
  admin@ncs(config-route-1.2.3.4/255.255.255.0/1.2.3.0)# commit dry-run outformat native
  native {
      device {
          name <deviceNAme>
          data ip route 1.2.3.4 255.255.255.0 1.2.3.0
                metric 1234
                preference 123
               exit
      }
  }
  ```


  ## 4.7. Configuring /slot 

  ```
  admin@ncs(config-config)# slot 1 ?
  Possible completions:
    ct     Carrier Termination configuration
    lan    Configure LAN port properties
    rlt    Radio Link Terminal configuration
    wan    Configure WAN port and radio
    <cr>
  ```


  ### 4.7.1 Configuring /slot/ct 

  - Configure params:

  ```

  admin@ncs(config-config)# show full-configuration slot 1 ct 1
  devices device <deviceNAme>
   config
    slot 1
     ct 1
      frame-id                   302
      tx-frequency               83000000
      selected-max-output-power  -2
      selected-min-output-power  -10
      target-input-power-far-end -30
      selected-max-acm           128_QAM
      selected-min-acm           HALF_BPSK_STRONG
      tx-admin-status            OFF
     exit
    exit
   !
  !
  ```


  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceNAme>
          data slot 1
                ct 1
                 frame-id 302
                 tx-frequency 83000000
                 selected-max-output-power -2
                 selected-min-output-power -10
                 target-input-power-far-end -30
                 selected-max-acm 128_QAM
                 selected-min-acm HALF_BPSK_STRONG
                 tx-admin-status OFF
                exit
               exit
      }
  }
  ```


  ### 4.7.2 Configuring /slot/rlt

  - Configure params:

  ```
  admin@ncs(config-config)# show full slot 1 rlt 1
  devices device <deviceNAme>
   config
    slot 1
     rlt 1
      id                  _NEAR_END_STRING_
      expected-far-end-id _FAR_END_STRING_
      far-end-id-check    enabled
      mode                1+0
      ct-member           1 1
     exit
    exit
   !
  !
  ```


  - Commit native to display **device CLI native syntax** of the command that will be issued
  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceNAme>
          data slot 1
                rlt 1
                 id _NEAR_END_STRING_
                 expected-far-end-id _FAR_END_STRING_
                 far-end-id-check enabled
                 mode 1+0
                 ct-member 1 1
                exit
               exit
      }
  }
  ```

  ### 4.7.3 Configuring /slot/wan

  - Lan list has two keys, slot and port: [slot='x'][port='y']
  admin@ncs(config-wan-1/5)# show full | display xpath
  /devices/device[name='<deviceNAme>']/config/ericsson-minilink6352:slot[slot-number='1']/wan[slot='1'][port='5']/admin-status is
  /devices/device[name='<deviceNAme>']/config/ericsson-minilink6352:slot[slot-number='1']/wan[slot='1'][port='5']/cos/priority-map-profile/priority-map-profile test

  - Configure params:

  ```
  admin@ncs(config-config)# show full slot 1 wan 1 1
  devices device <deviceNAme>
   config
    slot 1
     wan 1 5
      admin-status is
      cos priority-map-profile priority-map-profile test
     exit
    exit
   !
  !

  ```

  - Commit native to display **device CLI native syntax** of the command that will be issued

  ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name <deviceNAme>
          data slot 1
                wan 1 5
                 admin-status is
                 cos priority-map-profile priority-map-profile test
                exit
               exit
      }
  }
  ```

  ## 4.7.3 Configuring /switch   

  ### 4.7.3 Configuring /switch/vlan

  - Configure params:
  ```
  admin@ncs(config-config)# switch vlan 1234 name TEST_VLAN mac-learn enabled capability none
  ```


  ```
  admin@ncs(config-config)# show full switch vlan 1234
  devices device <deviceNAme>
   config
    switch
     vlan 1234
      name       TEST_VLAN
      mac-learn  enabled
      capability none
     exit
    exit
   !
  !
  ```

  - Commit DRY to display the **diffs from the CDB** candidate state

  ```
  admin@ncs(config-vlan-1234)# commit dry-run
  cli {
      local-node {
          data  devices {
                    device <deviceNAme> {
                        config {
                            switch {
               +                vlan 1234 {
               +                    name TEST_VLAN;
               +                    mac-learn enabled;
               +                    capability none;
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
  admin@ncs(config-vlan-1234)# commit dry-run outformat native
  native {
      device {
          name <deviceNAme>
          data switch
                vlan 1234
                 name TEST_VLAN
                 mac-learn enabled
                 capability none
                exit
               exit
      }
  }
  ```


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
     admin@ncs(config)# devices device dev-1 ned-settings ericsson-minilink6352 logging level debug
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
  > devices device dev-1 ned-settings ericsson-minilink6352 logger level debug
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
