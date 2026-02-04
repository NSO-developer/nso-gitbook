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

  This document describes the opengear-cm NED.


  Opengear Console Manager CLI NED for Cisco NSO
  ------------------------------------------------

  This Network Element Driver (NED) enables Cisco NSO to manage Opengear Console Manager appliances (OM1208, OM2200, etc.) using the `ogcli` command-line interface. 
  It provides configuration, monitoring, and management support for Opengear serial console servers via a YANG-based data model.

  **Key Features:**
  - Supports all major Opengear Console Manager models (v25.07.0+)
  - Entity-based configuration mapping (services, users, network, serial ports, etc.)
  - Secure handling of secrets (passwords, keys, SNMP communities)
  - YANG model with Tail-f extensions for secrets and device metadata
  - Robust error handling and transaction support

  **ogcli Operations Supported:**
  - Generic operataion examples that could be supported:
    - get, create, update, delete (entity-based, on demand)
    - Modules supported on release 1.1.0 onwards:
      - all below endpoints will be synced;

      - additonally, initial support will partially cover:

        - services/snmpd : 
          * update operations for container parameters

        - services/snmp_alert_manager: 
          * create and delete operations for list entries

        - lighthouse_enrollment: 
          * create and delete operations for list entries

        - system/admin_info : 
          * update operations for container parameters

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
  | check-sync                | no        |                                                                  |
  |                           |           |                                                                  |
  | partial-sync-from         | no        |                                                                  |
  |                           |           |                                                                  |
  | live-status actions       | no        |                                                                  |
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
  | OpenGear Control Manager  | 25.07.0         | Linux  | OGCLI Operations Manager                          |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-opengear-cm-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-opengear-cm-1.0.1.signed.bin
      > ./ncs-6.0-opengear-cm-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-opengear-cm-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-opengear-cm-1.0.1.tar.gz
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
     `opengear-cm-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-opengear-cm-1.0.1.tar.gz
     > ls -d */
     opengear-cm-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package opengear-cm-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package opengear-cm-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-opengear-cm-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package opengear-cm-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/opengear-cm-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-opengear-cm-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-opengear-cm-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install opengear-cm-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-opengear-cm-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-opengear-cm-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id opengear-cm-cli-1.0
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



  ### For enabling full java vm and trace logging:

  devices device <devicename>
   trace           raw
   ned-settings opengear-cm developer trace-enable true
   ned-settings opengear-cm developer trace-connection true
   ned-settings opengear-cm developer progress-verbosity debug
   ned-settings opengear-cm logger level debug
   ned-settings opengear-cm logger java true
  !

  commit

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

  `$NSO_RUNDIR/logs/ned-opengear-cm-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings opengear-cm logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings opengear-cm logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.opengearcm \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings opengear-cm logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings opengear-cm logger java true
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

  # Opengear Console Manager NED – Sample Configuration Reference
  ---

  This document provides some annotated configuration examples for the Opengear Console Manager NED (opengear-cm), organized by top-level configuration nodes. 
  Each section includes real-world configuration and operational variations as seen in NSO CLI and device syncs. 
  Use these as a starting reference for modeling, troubleshooting, and understanding the NED's behavior.

  ---

  ## Device Definition and Connection
    Relying on the SSH connection for OGCLI CLI specific communication with the devices targeted, it requires SSH access and specific configurations. 


  ### Example configuration with full logging enabled:

    - Below snippet exemplifies a starting point configuration for 1.1.0 NED version with full logging enabled under ned-settings and java-vm logging:

  ```
  devices device <deviceName>
   address         <lab-fqdn.domain>
   port            12345
   authgroup       opengear-authgrp
   device-type cli ned-id opengear-cm-cli-1.1
   device-type cli protocol ssh
   connect-timeout 3000
   read-timeout    3000
   write-timeout   3000
   trace           raw
   ned-settings opengear-cm developer trace-enable true
   ned-settings opengear-cm developer trace-connection true
   ned-settings opengear-cm developer progress-verbosity debug
   ned-settings opengear-cm logger level debug
   ned-settings opengear-cm logger java true
   state admin-state unlocked
  ```

  - **Purpose:** Defines the Opengear device, connection parameters, and NED-specific settings.
  - **Variations:**
    - Port changes (e.g., `port 12345`)
    - Device state transitions > unlocked to be usable
    - SSH host key fetch and fingerprint display
      - Run `admin@ncs(config)# devices device opengear-device1 ssh fetch-host-keys`


  ---

  ## Check Device SSH Host Keys correctly fetched:


  ```
  admin@ncs(config)# devices device <deviceName> ssh fetch-host-keys 
  result unchanged
  fingerprint {
      algorithm ssh-ed25519
      value ea:6d:e6:....:01:b2
  }
  fingerprint {
      algorithm ecdsa-256
      value 19:63:...:50:fa
  }
  fingerprint {
      algorithm ssh-rsa
      value 6c:0e:...:8f:2e
  }
  ```

  - **Purpose:** Stores device SSH public keys for secure management.
  - **Notes:** Key data may be multi-line or single-line.

  ## Save any configs and run connect and sync-from; then check configuration fetched into NSO CDB:

  ### Commit any definitions and ned-settings to NSO CDB:

  `
  admin@ncs(config-device-deviceName)# commit
  Commit complete.
  `

  ### Test connectivity and sync-from:

  `
  admin@ncs(config-device-deviceName)# connect
  result true
  info (admin) Connected to deviceName - <device-ip-address>:<device-port>
  admin@ncs(config-device-deviceName)# sync-from
  result true
  `


  ---

  ## 4.1 Opengear CM NED configuration tree

   - Version 1.1.0 YANG TREE:
   - Many elements are dynamically generated/hidden by the device based on the configuration flavors chosen. 
   - The tree below adresses required configuration so far:

  ```
  module: tailf-ned-opengear-cm
    +--rw services
    |  +--rw snmpd
    |  |  +--rw enabled?                  type_bool_str
    |  |  +--rw port?                     uint16
    |  |  +--rw enable_legacy_versions?   boolean
    |  |  +--rw protocol?                 enumeration
    |  |  +--rw enable_secure_snmp?       boolean
    |  |  +--rw security_name?            string
    |  |  +--rw security_level?           enumeration
    |  |  +--rw auth_password?            string
    |  |  +--rw auth_protocol?            enumeration
    |  |  +--rw auth_use_plaintext?       boolean
    |  |  +--rw priv_password?            string
    |  |  +--rw priv_protocol?            enumeration
    |  |  +--rw priv_use_plaintext?       boolean
    |  |  +--rw rocommunity?              string
    |  +--rw snmp_alert_manager* [address port protocol]
    |     +--rw address             inet:ip-address
    |     +--rw name?               string
    |     +--rw port                uint16
    |     +--rw protocol            enumeration
    |     +--rw version?            enumeration
    |     +--rw msg_type?           enumeration
    |     +--rw security_level?     enumeration
    |     +--rw username?           string
    |     +--rw auth_protocol?      enumeration
    |     +--rw auth_password?      string
    |     +--rw privacy_protocol?   enumeration
    |     +--rw privacy_password?   string
    +--rw lighthouse_enrollment* [address]
    |  +--rw address    string
    |  +--rw bundle?    string
    |  +--rw port?      uint16
    |  +--rw token?     string
    +--rw system
       +--rw admin_info
          +--rw contact?    string
          +--rw hostname?   string
          +--rw location?   string
  ```


  ## 4.2 Services – SNMP Daemon (`services snmpd`)

  - OpenGear CM SNMP Daemon entity:

    - Simple Network Management Protocol (SNMP) is an Internet Standard protocol for collecting and organizing information about managed devices on IP networks and for modifying that information to change device behaviour. This entity allows configuration of the SNMP service.

  ### 4.2.1 Top level NSO config options for services/snmpd:

  - NSO CLI syntax examples: 

      ```
      admin@ncs# config
      Entering configuration mode terminal
      admin@ncs(config)# devices device deviceName1      
      admin@ncs(config-device-deviceName1)# config
      admin@ncs(config-config)# ?
      Possible completions:
        lighthouse_enrollment   Lighthouse Enrollment Configuration
        services                OpenGear internal Services Configuration
        system                  OpenGear System Configuration
        ---            
      ```

      ```
      admin@ncs(config-config)# services ?
      Possible completions:
        snmp_alert_manager   SNMP TRAPS : Alert Manager Configuration
        snmpd                SNMP Daemon Configuration
      ```

      ```
      admin@ncs(config-config)# services snmpd ?
      Possible completions:
        auth_password            SNMP Authentication Password
        auth_protocol            The encryption algorithm to use for authentication with SNMPv3
        auth_use_plaintext       Use Plaintext for Authentication Password
        enable_legacy_versions   Enable Legacy SNMP Versions (v1/v2c)
        enable_secure_snmp       Enable Secure SNMP (v3)
        enabled                  Enable SNMP Daemon
        port                     SNMP Daemon Port; default 161
        priv_password            SNMP Privacy Password
        priv_protocol            The encryption algorithm to use for privacy with SNMPv3
        priv_use_plaintext       Use Plaintext for Privacy Password
        protocol                 SNMP Protocol (UDP/TCP); default UDP
        rocommunity              SNMP Read-Only Community String
        security_level           SNMP Security Level - user-based security model; default noauth
        security_name            SNMP Security Name
        <cr>   
        ```

  - Data is stored in NSO CDB in below syntax format (Cisco Style):
      ```
      services snmpd
      enabled                true|false
      port                   <int>
      enable_legacy_versions true|false
      protocol               UDP|TCP
      enable_secure_snmp     true|false
      security_name          <string>
      security_level         noauth|auth|priv
      auth_use_plaintext     true|false
      priv_use_plaintext     true|false
      rocommunity            <string>
      priv_password          <string>
      priv_protocol          AES|AES-192|AES-256|DES
      ...
      END
      ```

  - **Purpose:** Configures SNMP daemon, including security, protocol, and legacy support.
  - **Variations:**
    - Enable/disable SNMP
    - Change protocol (UDP/TCP)
    - Security level and password/protocol changes
    - Legacy version toggling


  ### 4.2.2 Example parameter updates on services/snmpd:

  - Considering initial config starting point example after a given sync-from, we would have:

    - NSO CLI C-style syntax content:

      ```
      admin@ncs(config-config)# services snmpd 
      admin@ncs(config-snmpd)# show full
      devices device deviceName1
      config
        services snmpd
        enabled                false
        port                   161
        enable_legacy_versions true
        protocol               UDP
        enable_secure_snmp     true
        security_name          sec-name-updated
        security_level         noauth
        auth_use_plaintext     false
        priv_use_plaintext     false
        rocommunity            StringCommunity-123
        END
      !
      !
      ```

    - NSO XML tree if needed:
      ```
      admin@ncs(config-snmpd)# show full | display xml
      <config xmlns="http://tail-f.com/ns/config/1.0">
        <devices xmlns="http://tail-f.com/ns/ncs">
          <device>
            <name>deviceName1</name>
            <config>
              <services xmlns="http://tail-f.com/ned/opengear-cm">
                <snmpd>
                  <enabled>false</enabled>
                  <port>161</port>
                  <enable_legacy_versions>false</enable_legacy_versions>
                  <protocol>UDP</protocol>
                  <enable_secure_snmp>true</enable_secure_snmp>
                  <security_name>test-remode-ned-updated</security_name>
                  <security_level>noauth</security_level>
                  <auth_use_plaintext>false</auth_use_plaintext>
                  <priv_use_plaintext>false</priv_use_plaintext>
                  <rocommunity>StringCommunity-123</rocommunity>
                </snmpd>
              </services>
            </config>
          </device>
        </devices>
      </config>
      ```

  #### Update any parameter and commit dry run example:

      ```
      admin@ncs(config-snmpd)# enable_legacy_versions false 
      admin@ncs(config-snmpd)# commit dry-run 
      cli {
          local-node {
              data  devices {
                        device deviceName1 {
                            config {
                                services {
                                    snmpd {
                  -                    enable_legacy_versions true;
                  +                    enable_legacy_versions false;
                                    }
                                }
                            }
                        }
                    }
          }
      }
      ```

  #### Commit dry-run outformat native to prepare native device command equivalent:
      ```
      admin@ncs(config-snmpd)# commit dry-run outformat native 
      native {
          device {
              name deviceName1
              data ogcli update services/snmpd << 'END'
                  enable_legacy_versions=false
                  END
          }
      }
      ```

  - Commit and check device configuration further. 


  ## 4.3 Services – SNMP Alert Manager (`services snmp_alert_manager`)

  - Retrieve, create or delete specific SNMP Alert Managers.

    -*Parameter editing after creation is not supported yet.*

  ### 4.3.1 Top level NSO config options for service/snmp_alert_manager

  - NSO CLI syntax examples: 

      ```
      admin@ncs# config
      Entering configuration mode terminal
      admin@ncs(config)# devices device deviceName1      
      admin@ncs(config-device-deviceName1)# config
      admin@ncs(config-config)# ?
      Possible completions:
        lighthouse_enrollment   Lighthouse Enrollment Configuration
        services                OpenGear internal Services Configuration
        system                  OpenGear System Configuration
        ---            
      ```

      ```
      admin@ncs(config-config)# services ?
      Possible completions:
        snmp_alert_manager   SNMP TRAPS : Alert Manager Configuration
        snmpd                SNMP Daemon Configuration

      admin@ncs(config-config)# services snmp_alert_manager?
      Possible completions:
        snmp_alert_manager   SNMP TRAPS : Alert Manager Configuration
      ```

  #### Please note services/snmp_alert_manager is a list with 3 keys

  **- Formatting of the keys matches the multiline identifier composed on the OpenGear side after create**
      - CLI structure: `<address>:<port>/<protocol>`

      - Initial configuration expects an ip address, then port and protocol separated by the special character exemplified above and below:
      ```
      admin@ncs(config-config)# services snmp_alert_manager ?   
      This line has a valid range expression.
      Possible completions:
        SNMP Alert Manager IP Address  range

      admin@ncs(config-config)# services snmp_alert_manager 192.168.10.11:?
      Possible completions:
        SNMP Alert Manager Port

      admin@ncs(config-config)# services snmp_alert_manager 192.168.10.11:162?
      This line has a valid range expression.
      Possible completions:
        192.168.10.11:162

      admin@ncs(config-config)# services snmp_alert_manager 192.168.10.11:162/?
      Possible completions:
        TCP   Use TCP Protocol
        UDP   Use UDP Protocol
      ```

      - Once list entry key is propely given, all parameters visible as per current design will be visible for selection:
      ```
      admin@ncs(config-config)# services snmp_alert_manager 192.168.10.11:162/TCP ?
      Possible completions:
        auth_password      SNMP Alert Manager Authentication Password
        auth_protocol      The encryption algorithm to use for authentication with SNMPv3
        msg_type           SNMP Alert Manager Message Type; default trap
        name               SNMP Alert Manager Name
        privacy_password   SNMP Alert Manager Privacy Password
        privacy_protocol   The encryption algorithm to use for privacy with SNMPv3
        security_level     SNMP Alert Manager Security Level - user-based security model; default noAuthNoPriv
        username           SNMP Alert Manager Username
        version            SNMP Alert Manager Version - default v2c
        <cr>      
      ```

  - Data is stored in NSO CDB in below syntax format (Cisco Style):

      ```
      services snmp_alert_manager <address>:<port>/<protocol>
      name             <string>
      version          v3
      security_level   authPriv
      username         <string>
      auth_protocol    SHA
      auth_password    <string>
      privacy_protocol AES
      privacy_password <string>
      END
      ```

  - Example configuration syntax: 
      ```
      admin@ncs(config-snmp_alert_manager-192.168.10.11:162/UDP)# show full
      devices device deviceName1
      config
        services snmp_alert_manager 192.168.10.11:162/UDP
        name             Trap_name_1
        version          v3
        msg_type         TRAP
        security_level   authPriv
        username         $user_name_str
        auth_protocol    SHA
        auth_password    <String>
        privacy_protocol AES
        privacy_password <String>
        END
      !
      !
      ```

  - Example xml formatted config structure:
      ```
      admin@ncs(config-snmp_alert_manager-192.168.10.11:162/UDP)# show full | display xml
      <config xmlns="http://tail-f.com/ns/config/1.0">
        <devices xmlns="http://tail-f.com/ns/ncs">
          <device>
            <name>deviceName1</name>
            <config>
              <services xmlns="http://tail-f.com/ned/opengear-cm">
                <snmp_alert_manager>
                  <address>192.168.10.11</address>
                  <port>162</port>
                  <protocol>UDP</protocol>
                  <name>Trap_name_1</name>
                  <version>v3</version>
                  <msg_type>TRAP</msg_type>
                  <security_level>authPriv</security_level>
                  <username>$user_name_str</username>
                  <auth_protocol>SHA</auth_protocol>
                  <auth_password>$String_value$</auth_password>
                  <privacy_protocol>AES</privacy_protocol>
                  <privacy_password>$String_value$</privacy_password>
                </snmp_alert_manager>
              </services>
            </config>
          </device>
        </devices>
      </config>
      ```

  - **Purpose:** Defines SNMP trap/alert destinations with full SNMPv3 security.
  - **Variations:**
    - Multiple alert managers with different addresses, ports, and protocols
    - Username and password updates
    - Deletion and recreation of alert managers

  ---

  ### 4.3.2 Create new TRAP alert under services/snmp_alert_manager:

  - Create a new TRAP entry config like in the example below:

      ```
      admin@ncs(config-snmp_alert_manager-192.168.10.11:162/UDP)# show full
      devices device deviceName1
      config
        services snmp_alert_manager 192.168.10.11:162/UDP
        name             Trap_name_1
        version          v3
        msg_type         TRAP
        security_level   authPriv
        username         $user_name_str
        auth_protocol    SHA
        auth_password    <String>
        privacy_protocol AES
        privacy_password <String>
        END
      !
      !
      ```

  - Commit dry run output:
      ```
      admin@ncs(config-config)# commit dry-run 
      cli {
          local-node {
              data  devices {
                        device deviceName1 {
                            config {
                                services {
                  +                snmp_alert_manager 192.168.10.11:162/UDP {
                  +                    name Trap_name_1;
                  +                    version v3;
                  +                    msg_type TRAP;
                  +                    security_level authPriv;
                  +                    username $user_name_str;
                  +                    auth_protocol SHA;
                  +                    auth_password $String_value$;
                  +                    privacy_protocol AES;
                  +                    privacy_password $String_value$;
                  +                }
                                }
                            }
                        }
                    }
          }
      }
      ```

  - Commit dry run outformat native to generate native device syntax of the equivalent operation:

      ```
      admin@ncs(config-config)# commit dry-run outformat native 
      native {
          device {
              name deviceName1
              data ogcli create services/snmp_alert_manager << 'END'
                  address="192.168.10.11"
                  port=162
                  protocol="UDP"
                  name="Trap_name_1"
                  version="v3"
                  msg_type="TRAP"
                  security_level="authPriv"
                  username="$user_name_str"
                  auth_protocol="SHA"
                  auth_password="$pass_string$"
                  privacy_protocol="AES"
                  privacy_password="$pass_string$"
                  END
          }
      }
      ```

  - Then commit the pending operation:
      ```
      admin@ncs(config-config)# commit
      Commit complete.
      ```

  ### 4.3.3 Deleting existing TRAP alerts under services/snmp_snmp_alert_manager endpoint:

  - Considering existing configuration below:

      ```
      admin@ncs(config-snmp_alert_manager-192.168.10.11:162/UDP)# show full
      devices device deviceName1
      config
        services snmp_alert_manager 192.168.10.11:162/UDP
        name             Trap_name_1
        version          v3
        msg_type         TRAP
        security_level   authPriv
        username         $user_name_str
        auth_protocol    SHA
        auth_password    $pass_string$
        privacy_protocol AES
        privacy_password $pass_string$
        END
      !
      !
      ```

  - Delete list entry:
      ````
      admin@ncs(config-config)# no services snmp_alert_manager 192.168.10.11:162/UDP
      ```

  - Commit dry run:
      ```
      admin@ncs(config-config)# commit dry-run 
      cli {
          local-node {
              data  devices {
                        device deviceName1 {
                            config {
                                services {
                  -                snmp_alert_manager 192.168.10.11:162/UDP {
                  -                    name Trap_name_1;
                  -                    version v3;
                  -                    msg_type TRAP;
                  -                    security_level authPriv;
                  -                    username $user_name_str;
                  -                    auth_protocol SHA;
                  -                    auth_password $pass_string$;
                  -                    privacy_protocol AES;
                  -                    privacy_password $pass_string$;
                  -                }
                                }
                            }
                        }
                    }
          }
      }
      admin@ncs(config-config)# 
      ```

  - Commit dry run outformat native:
      ```
      admin@ncs(config-config)# commit dry-run outformat native 
      native {
          device {
              name deviceName1
              data ogcli delete services/snmp_alert_manager "192.168.10.11:162/UDP"
          }
      }
      ```

  - Commit to proceed with the deletion on the device as well;
      ```
      admin@ncs(config-config)# commit
      Commit complete.
      ```


  ##  4.4 Lighthouse Enrollment

  - Retrieve, create or remove configuration for a specific Lighthouse enrollment.

    -*Parameter editing after creation is not supported yet.*


  ### NOTE: This endpoint has dynamic behavior!
  ### Upon creation we have a mandatory parameter `token` that is not visible at get/show afterwards. It is a one way set parameter that is mandatory though at creation but not visible anymore at show/get. 

  - As a consequence, we have ignore-compare-config annotations on it which means that after creation, the CDB will ignore any deviation from the last known value or state. 

  ### 4.4.1 Top level NSO config options for lighthouse_enrollment:

  - NSO CLI syntax examples and structure: 

  ```
  lighthouse_enrollment address <IPv6|IPv4>
   bundle   <string>
   port     <int>
   token    <oneWayString>
   END
  ```

  - **Purpose:** Configures enrollment with Opengear Lighthouse (cloud management).
  - **Variations:**
    - IPv6 and IPv4 addresses
    - Add/remove enrollment

  ---

      ```
      admin@ncs(config-config)# lighthouse_enrollment ?
      Possible completions:
        address   Lighthouse Enrollment Address (IP or FQDN)
        range     
      ```

      ```
      admin@ncs(config-config)# lighthouse_enrollment address 192.168.100.100

      admin@ncs(config-lighthouse_enrollment-192.168.100.100)# ?
      Possible completions:
        bundle     Lighthouse Enrollment Bundle Name
        port       Lighthouse Enrollment Port; defaiult 8443
        token      Lighthouse Enrollment token
      ```

      - Sample config pre-commit:
      ```
      admin@ncs(config-lighthouse_enrollment-192.168.100.100)# show full              
      devices device deviceName1
      config
        lighthouse_enrollment address 192.168.100.100
        bundle bundle-name-1
        port   123
        token  set-and-forget-token
        END
      !
      !
      ```

      - Sample config after sync-from:
        - TOKEN is not present anymore:
      ```
      admin@ncs(config-lighthouse_enrollment-192.168.100.100)# show full              
      devices device deviceName1
      config
        lighthouse_enrollment address 192.168.100.100
        bundle bundle-name-1
        port   123
        END
      !
      !
      ```

      - Sample config xml structure including token (for lighthouse_enrollment create operation):
      ```
      admin@ncs(config-lighthouse_enrollment-192.168.100.100)# show full | display xml                                 
      <config xmlns="http://tail-f.com/ns/config/1.0">
        <devices xmlns="http://tail-f.com/ns/ncs">
          <device>
            <name>deviceName1</name>
            <config>
              <lighthouse_enrollment xmlns="http://tail-f.com/ned/opengear-cm">
                <address>192.168.100.100</address>
                <bundle>bundle-name-1</bundle>
                <port>123</port>
                <token>set-and-forget-token</token>
              </lighthouse_enrollment>
            </config>
          </device>
        </devices>
      </config>
      ```


  ### 4.4.2 Create new lighthouse_enrollment:

  - Set all needed parameters and keys for lighthouse_enrollment list entry:

      ```
      admin@ncs(config-config)# lighthouse_enrollment address 192.168.100.100
      admin@ncs(config-lighthouse_enrollment-192.168.100.100)# bundle bundle-name-1 port 123 token set-and-forget-token
      admin@ncs(config-lighthouse_enrollment-192.168.100.100)# show full
      devices device deviceName1
      config
        lighthouse_enrollment address 192.168.100.100
        bundle bundle-name-1
        port   123
        token  set-and-forget-token
        END
      !
      !
      ```

  - Commit dry run to show NSO CDB changes pending:
      ```
      admin@ncs(config-lighthouse_enrollment-192.168.100.100)# commit dry-run 
      cli {
          local-node {
              data  devices {
                        device deviceName1 {
                            config {
                  +            lighthouse_enrollment 192.168.100.100 {
                  +                bundle bundle-name-1;
                  +                port 123;
                  +                token set-and-forget-token;
                  +            }
                            }
                        }
                    }
          }
      }
      ```

  - Commit dry run native to show native device command equivalent:
      ```
      admin@ncs(config-lighthouse_enrollment-192.168.100.100)# commit dry-run outformat native 
      native {
          device {
              name deviceName1
              data ogcli create lighthouse_enrollment << 'END'
                  address="192.168.100.100"
                  bundle="bundle-name-1"
                  port=123
                  token="set-and-forget-token"
                  END
          }
      }
      ```


  ### 4.4.2 Delete existing lighthouse_enrollment:

  - Considering below starting point configuration:
      ```
      admin@ncs(config-lighthouse_enrollment-192.168.100.100)# show full
      devices device deviceName1
      config
        lighthouse_enrollment address 192.168.100.100
        bundle bundle-name-1
        port   123
        END
      !
      !
      ```

  - Run delete and commit dry run command:
      ```
      admin@ncs(config-config)# no lighthouse_enrollment address 192.168.100.100 
      admin@ncs(config-config)# commit dry-run  
      cli {
          local-node {
              data  devices {
                        device deviceName1 {
                            config {
                  -            lighthouse_enrollment 192.168.100.100 {
                  -                bundle bundle-name-1;
                  -                port 123;
                  -                token set-and-forget-token;
                  -            }
                            }
                        }
                    }
          }
      }
      ```


  - Run commit dry run outformat native command to generate equivalent native device commands:
      ```
      admin@ncs(config-config)# commit dry-run outformat native 
      native {
          device {
              name deviceName1
              data ogcli delete lighthouse_enrollment "192.168.100.100"
          }
      }
      ```

  - Commit to delete the enrollment



  ## 4.5 System Admin Info

  Configure system admin information 

  Only update is possible, no delete/create. Parameters are always present. 


  ### 4.5.1 Top level NSO config options for system/admin_info:

      ```
      system admin_info
      contact  <email>
      hostname <string>
      location <string>
      END
      ```

  - **Purpose:** Sets system-level admin information.
  - **Variations:**
    - Hostname changes and rollback
    - Location and contact updates

  ---


  - NSO CLI syntax examples: 
      ```
      admin@ncs(config-config)# system ?
      Possible completions:
        admin_info   System Admin Information

      admin@ncs(config-config)# system admin_info ?
      Possible completions:
        contact    Admin Contact
        hostname   System Hostname
        location   System Location
        <cr>  
      ```


  ### 4.5.2 Updating system/admin_info

  - Update targeted parameter:
      ```
      admin@ncs(config-admin_info)# hostname "update-hostname-1"
      ```

  - Commit dry run:
      ```
      admin@ncs(config-admin_info)# commit dry-run 
      cli {
          local-node {
              data  devices {
                        device deviceName1 {
                            config {
                                system {
                                    admin_info {
                  -                    hostname update-hostname3;
                  +                    hostname update-hostname-1;
                                    }
                                }
                            }
                        }
                    }
          }
      }
      ```

  - Commit dry run outformat native to see device native equivalent:
      ```
      admin@ncs(config-admin_info)# commit dry-run outformat native 
      native {
          device {
              name deviceName1
              data ogcli update system/admin_info << 'END'
                  hostname="update-hostname-1"
                  END
          }
      }
      ```

  - Commit changes to the device:
      ```
      admin@ncs(config-admin_info)# commit 
      Commit complete.
      ```
  ---


# 5. Built in live-status actions
---------------------------------


  ### No live-status actions implemented yet.


# 6. Built in live-status show
------------------------------



  ### No live-status show commands implemented yet.


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
     admin@ncs(config)# devices device dev-1 ned-settings opengear-cm logging level debug
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
  > devices device dev-1 ned-settings opengear-cm logger level debug
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
