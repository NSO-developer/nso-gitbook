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
  ```


# 1. General
------------

  This document describes the f5-bigip NED.

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
  | partial-sync-from         | yes       |                                                                  |
  |                           |           |                                                                  |
  | live-status actions       | yes       |                                                                  |
  |                           |           |                                                                  |
  | live-status show          | yes       |                                                                  |
  |                           |           |                                                                  |
  | load-native-config        | no        |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | BIG-IP                    | 17.1.1.1        | tmsh   |                                                   |
  |                           |                 |        |                                                   |
  | BIG-IP                    | 17.1.0.1        | tmsh   |                                                   |
  |                           |                 |        |                                                   |
  | BIG-IP                    | 16.1.4.*        | tmsh   |                                                   |
  |                           |                 |        |                                                   |
  | BIG-IP                    | 14.1.*          | tmsh   |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-f5-bigip-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-f5-bigip-1.0.1.signed.bin
      > ./ncs-6.0-f5-bigip-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-f5-bigip-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-f5-bigip-1.0.1.tar.gz
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
     `f5-bigip-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-f5-bigip-1.0.1.tar.gz
     > ls -d */
     f5-bigip-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package f5-bigip-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package f5-bigip-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-f5-bigip-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package f5-bigip-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/f5-bigip-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-f5-bigip-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-f5-bigip-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install f5-bigip-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-f5-bigip-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-f5-bigip-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id f5-bigip-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```

   - WARNING! Please make sure localhost is resolvable and loopback address is defined!
     - Follow rfc6761#section-6.3 for any specific details: https://datatracker.ietf.org/doc/html/rfc6761#section-6.3
     - I.e.: /etc/hosts or equivalent should contain 127.0.0.1 or/and ::1 loopback mapping on localhost or *.localhost or localhost.*

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

  `$NSO_RUNDIR/logs/ned-f5-bigip-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings f5-bigip logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings f5-bigip logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.bigip \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings f5-bigip logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings f5-bigip logger java true
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

  For instance, create a new user:

  ```
  admin@ncs(config)# devices device dev-1 config
  admin@ncs(config-config)# ltm virtual test mask 1.1.1.1 
  ```

  See what you are about to commit:

  ```
  admin@ncs(config-if)# commit dry-run outformat native
  device
      name bigip-5
      data create /ltm virtual "test" {  mask "1.1.1.1" } 
  ```

  Commit new configuration in a transaction:

  ```
  admin@ncs(config-if)# commit
  Commit complete.
  ```

  Verify that NCS is in-sync with the device:

   ```
   admin@ncs(config-if)# devices device dev-1 check-sync
   result in-sync
   ```

  Compare configuration between device and NCS:

   ```
   admin@ncs(config-if)# devices device dev-1 compare-config
   admin@ncs(config-if)#
   ```

  Note: if no diff is shown, supported config is the same in
        NCS as on the device.


# 5. Built in live-status actions
---------------------------------

     The NED has support for a subset of native F5 exec commands residing
     under device live-status/bigip-actions. Presently, the following commands are supported:

     admin@ncs> request devices device <device-name> live-status bigip-actions
     Possible completions:
       any                  Execute any tmsh commands
       any-outside-tmsh     Execute any exec commands outside tmsh
       asm                  Execute asm action
       certificate          Execute certificate install action
       file                 Execute file upload/delete actions
       outside-tmsh-prompts Execute several commands and wait for prompt(s)
       run                  Execute run commands
       show                 Execute show commands

    any action:
    -----------

    This generic action can be used to execute any tmsh commands on the device. check some examples below.

    admin@ncs> request devices device <device-name> live-status bigip-actions any args list ltm virtual <name>
    admin@ncs> request devices device <device-name> live-status bigip-actions any args show running-config ltm virtual <name>
    admin@ncs> request devices device <device-name> live-status bigip-actions any args show cli version
    admin@ncs> request devices device <device-name> live-status bigip-actions any args save sys config file /tmp/save_sys_config
    admin@ncs> request devices device <device-name> live-status bigip-actions any args save sys ucs /tmp/save_sys_ucs

    To execute multiple commands, separate them with " ; "
    NOTE: Must be a white space on either side of the comma.
    For example:

    admin@ncs> request devices device <device-name> live-status bigip-actions any args "show /sys version ; show running-config /ltm virtual"
    result
    >  show /sys version
    Sys::Version
    Main Package
      Product     BIG-IP
      Version     12.0.0
      Build       0.0.606
      Edition     Final
      Date        Fri Aug 21 13:29:22 PDT 2015

    root@(bigip12a)(cfg-sync Disconnected (Sync Only))(ModuleNotLicensed:Active)(/Common)
    > show running-config /ltm virtual
    ltm virtual kebab {
        description were
        destination 11.1.1.1:http
        ip-forward
        mask 255.255.255.255
        profiles {
            fastL4 { }
        }
        source 0.0.0.0/0
        translate-address disabled
        translate-port disabled
        vs-index 1021
    }

    any-outside-tmsh action:
    ------------------------

    This generic action can be used to execute any exec commands outside tmsh mode on device. check some examples below.

    admin@ncs# devices device <device-name> live-status bigip-actions any-outside-tmsh "bigstart restart <name> ; sleep 5 ; bigstart status <name>"
    result
    <result-exec-command>
    admin@ncs#

    admin@ncs# devices device <device-name> live-status bigip-actions any-outside-tmsh "tmsh modify sys sshd include \"\nCiphers 3des-cbc,aes128-cbc,aes192-cbc,aes256-cbc\nMACs hmac-sha1\n\""
    <result-exec-command>
    admin@ncs#

    show action:
    ------------

    admin@ncs> request devices device <device-name> live-status bigip-actions show args cli version
    result
    cli version {
        active 12.0.0
        latest 12.0.0
        supported { 11.5.0 11.5.1 11.5.2 11.5.3 11.6.0 12.0.0 }
    }

    To execute multiple commands, separate them with " ; "
    NOTE: Must be a white space on either side of the comma.
    For example:

    admin@ncs> request devices device <device-name> live-status bigip-actions show args "/sys version ; running-config /ltm virtual"

    Upload file:
    ------------

    admin@ncs> request devices device <device-name> live-status bigip-actions file upload local-file-path <local-file> remote-path <example=/var/config/rest/downloads/tmp>
    result successful
    admin@ncs>

    Download file:
    --------------

    admin@ncs> request devices device <device-name> live-status bigip-actions file download remote-file-path /<path-to-file>/<file-name> local-path <example=/home/user>
    result successful
    admin@ncs>

    delete file:
    ------------

    admin@ncs> request devices device <device-name> live-status bigip-actions file delete remote-file-path <example=/var/config/rest/downloads/tmp/policy.xml>
    result successful
    admin@ncs>

    install certificate crypto:
    --------------------------

    admin@ncs> request devices device <device-name> live-status bigip-actions certificate install-sys crypto cert certificate-ca-name <example=test.crt> certificate-from from-local-file certificate-ca-path <example=/config/ssl/ssl.crt/default.crt>
    result successful
    admin@ncs>

    Asm policy actions:
    ------------------

    Upload policy:
    ---------------
    admin@ncs> request devices device <device-name> live-status bigip-actions asm policy upload-policy local-policy-file-path <local-policy-file>
    result successful
    admin@ncs>

    get policies:
    --------------
    admin@ncs> request devices device <device-name> live-status bigip-actions asm policy get-policies
    policy {
        name appliCodessl
        id U1Z-9m6gv53xAOM592TY0Q
    }
    policy {
        name test
        id MrLpFzRHNarvj_zuAOD0fw
    }
    result successful
    admin@ncs>

    apply policy:
    -------------
    admin@ncs> request devices device <device-name> live-status bigip-actions asm policy apply-policy policy-id <example=U1Z-9m6gv53xAOM592TY0Q>
    id zmJ4gJikPjHCXq0mdRX9VA
    result successful
    admin@ncs>

    import policy:
    ---------------

    admin@ncs> request devices device <device-name> live-status bigip-actions asm policy import-policy filename <example=sec_policy_file.xml> name <example=newTestPolicy>
    id -6qVgFD9Z7O-tbeh2UphJA
    result successful
    admin@ncs>

    export policy:
    --------------
    admin@ncs> request devices device <device-name> live-status bigip-actions asm policy export-policy filename <example=exported_file.xml> minimal true policy-id <example=U1Z-9m6gv53xAOM592TY0Q>
    id ut5M9TMJeYRd63IZ9IS8Pg
    result successful
    admin@ncs>


    download policy:
    ----------------
    admin@ncs> request devices device <device-name> live-status bigip-actions asm policy download-policy filename <example=exported_file.xml> local-directory <local-dir>
    result successful
    admin@ncs>

    outside-tmsh-prompts:
    ---------------------
    An example is to change the root user password where you issue the
    command and then type in the new password twice. In the NED issue:

    admin@ncs> request devices device <device-name> live-status bigip-actions outside-tmsh-prompts \
                call { send "tmsh modify auth password root" prompt ".*new password:" } \
                call { send "PASS2" prompt ".*confirm password:" } call { send "PASS2" prompt ".*#.*"}

    exec-rest-call:
    ------------------
    admin@ncs> request devices device <device-name> live-status bigip-actions execute-rest-call url <path and query parameters>

    Example:
      admin@ncs> request devices device <device-name> live-status bigip-actions execute-rest-call url /mgmt/tm/cm/traffic-group/traffic-group-1/stats?ver=14.1.0
      <json-response>


    The REST credentials needs to be set for this live-status to work, please refer to "7.2 Set REST credentials"

    The ned-setting described at "7.16 Turn off hostname verification" might be needed if errors around subject alternative names are encountered.

    outside-tmsh-cmds:
    ------------------
    To send duplicated commands to the device the below live-status can be used.
    Note that the value of key does not matter as it is not sent to the device. However, it must be unique.

    Example:
      This example shows how to create an address-family ipv4 within router bgp in imish mode.

      admin@ncs> request devices device <device-name> live-status bigip-actions outside-tmsh-cmds cmds { key "A" cmd "imish -r 0" prompt ">" } cmds { key "B" cmd "enable" prompt "#" } cmds { key "C" cmd "configure terminal" prompt "#" } cmds { key "D" cmd "router bgp 1" prompt "#" } cmds { key "E" cmd "neighbor N peer-group" prompt "#" } cmds { key "F" cmd "neighbor N activate" prompt "#" } cmds { key "G" cmd "address-family ipv4" prompt "#" } cmds { key "H" cmd "neighbor N activate" prompt "#" } cmds { key "I" cmd "exit-address-family" prompt "#" } cmds { key "J" cmd "exit" prompt "#" } cmds { key "K" cmd "exit" prompt "#" } cmds { key "L" cmd "exit" prompt "#" }


# 6. Built in live-status show
------------------------------

  admin@ncs(config)# devices device <device-name> live-status bigip-actions show sys version
  result ssh-live-status-not-yet-executed
  > show sys version
  Sys::Version
  Main Package
    Product     BIG-IP
    Version     12.1.4
    Build       0.0.8
    Edition     Final
    Date        Wed Dec 12 15:15:49 PST 2018


# 7. Limitations
----------------

    7.1.// ltm / rule *
    ---------------
      Rules in a subdirectory i.e. "RuleDir/aRule" are not shown in NSO.
      This is because F5 Bigip device doesn't list those rules when doing "list ltm rule" in tmsh.

    7.2.// net / self / * / allow-service all
    ---------------
      Issuing a "modify net self * { allow-service all }" on the device will automatically replace all the previous values of allow-service with "all". This automatic replacement is not supported in the NED. Instead, first delete all the allow-service values and then add "all".

      Example:
      admin@ncs% delete devices device <device-name> config bigip:net self * allow-service
      admin@ncs% set devices device <device-name> config bigip:net self * allow-service all
      admin@ncs% commit dry-run outformat native
      native {
        device {
            name <device-name>
            data modify /net self "*" { allow-service "all" }
        }
      }

      If you want to add other values to allow-service when the value is "all" then first delete the "all" value and then add the other values.

      Example:
        admin@ncs% delete devices device <device-name> config bigip:net self * allow-service
        admin@ncs% set devices device <device-name> config bigip:net self * allow-service tcp:ssh
        admin@ncs% set devices device <device-name> config bigip:net self * allow-service tcp:snmp
        admin@ncs% commit dry-run outformat native
        native {
          device {
              name <device-name>
              data modify /net self "*" { allow-service replace-all-with {"tcp:snmp" "tcp:ssh" } }
          }
        }

    7.3.// net / vlan *
    ---------------
      When creating a new /net/vlan object the device could automatically add the vlan's name in /net/stp/vlans and /net/route-domanin/vlans.
      To avoid a compare-config diff the vlan's name must be added to /net/stp/vlans and /net/route-domain/vlans from the NED as well.

      When deleting a /net/vlan object the device could automatically delete the vlan's name from /net/stp/vlans and /net/route-domain/vlans.
      To avoid a compare-config diff the vlan's name must be deleted from /net/stp/vlans and /net/route-domain/vlans by the NED as well.

      Example 1
        Demonstrating compare-config diff by adding a /net/vlan object with interfaces configured:
        admin@ncs% set devices device <device-name> config bigip:net vlan VLAN tag 55 interfaces interface 1.3 tagged
        admin@ncs% commit
        admin@ncs% request devices device f5bigip compare-config
        diff
         devices {
             device <device-name> {
                 config {
                     bigip:net {
                         stp cist {
        -                    vlans [ TEST];
        +                    vlans [ TEST VLAN ];
                         }
                         route-domain 0 {
        -                    vlans [ TEST ];
        +                    vlans [ TEST VLAN ];
                         }
                     }
                 }
             }
         }
        admin@ncs% set devices device <device-name> config bigip:net stp cist vlans VLAN
        admin@ncs% set devices device <device-name> config bigip:net route-domain 0 vlans VLAN
        admin@ncs% commit
        admin@ncs% request devices device <device-name> compare-config
        admin@ncs%

      Example 2
        Demonstrating compare-config diff by deleting a /net/vlan object with interfaces configured:
        admin@ncs% delete devices device <device-name> config bigip:net vlan VLAN
          admin@ncs% commit
          admin@ncs% request devices device <device-name> compare-config
          diff
           devices {
               device <device-name> {
                   config {
                       bigip:net {
                           stp cist {
          -                    vlans [ TEST VLAN ];
          +                    vlans [ TEST ];
                           }
                           route-domain 0 {
          -                    vlans [ TEST VLAN ];
          +                    vlans [ TEST ];
                           }
                       }
                   }
               }
           }
          admin@ncs% delete devices device <device-name> config bigip:net stp cist vlans VLAN
          admin@ncs% delete devices device <device-name> config bigip:net route-domain 0 vlans VLAN
          admin@ncs% commit
          admin@ncs% request devices device <device-name> compare-config
          admin@ncs%

    7.4. Custom NED-setting file-download-buffer-size
      When downloading a file through the live-status call
        admin@ncs% request devices device <device-name> live-status bigip-actions file download local-path <local-path> remote-file-path <remote-path>

      The default buffer size is 1 if the NED-setting file-download-buffer-size has not been set. This is the slowest download option but also the option where the md5sum will always match.

      It is possible to set the buffer-size to SIZE by issuing:
        admin@ncs% set devices device <device-name> ned-settings f5-bigip file-download-buffer-size SIZE
        admin@ncs% commit
        admin@ncs% request devices device <device-name> disconnect
        admin@ncs% request devices device <device-name> sync-from

      There is no upper limit to what SIZE can be set to. But the larger the buffer-size, the higher the probability that the md5sum will not match. The NED solves this by retrying the download until the md5sum matches or a maximum of 5 times.

      Testing suggests that a buffer size higher than 32 would greatly increase the risk of redownloads due to md5sum not matching.

    7.5. compare-config diffs on sys snmp users *-password*
      The values:
        sys snmp users * auth-password
        sys snmp users * privacy-password

        can only be set on the device, not listed. So if you configure these values from the NED there will be a compare-config diff.

      The values:
        sys snmp users * auth-password-encrypted
        sys snmp users * privacy-password-encrypted

        can both be set and listed on the device. However, every time you list these values they will change. This will lead to a
        compare-config diff.

        These compare-config diffs are handled in NSO 4.4 and above. For versions below 4.4 a sync-from is recommended to solve the compare-config diffs.

    7.6. Encrypted-password rollback
      The configuration /sys/snmp/users have two values
        /sys/snmp/users/auth-password-encrypted
        /sys/snmp/users/privacy-password-encrypted
      which returns different values every time they are listed.

      When doing a rollback from the deletion of a /sys/snmp/user that
      /sys/snmp/user/ will be created created by the NED.

      The NED will send the creation command such as:

      modify /sys snmp users add { "TEST" { username "test"
        privacy-protocol "aes" privacy-password-encrypted "J-0^D/M94UG6:kc8Do;;N6<[fP3EZ`_1Ba[Ca;e16CjssSh"
        auth-protocol "md5" auth-password-encrypted "3FQ,.OvYaRlZ:_Zb[j>7AAN/C<@7=W\?cHhSgN5E7UJYKLKV"
        }
      }

      Sometime the device will accept the roll-back command and the deletion roll-back is successful.
      Other times the device interprets random space and backspace characters. In that case the rollback
      fails. When that happens the error message:
        Rollback failed. See README "Encrypted-password rollback" for details: edit error
      will be printed.

      This is a known issue and happens sporadically on the device side.

    7.7. Auto-config handling
      Auto-config occurs when the device automatically creates/modifies/deletes configuration. This usually leads to a compare-config issue. One way to solve it is to create/modify/delete the corresponding config in same transaction/commit.

      Example 1 - compare-config issue due to auto-config:
        admin@ncs% set devices device <device-name> config bigip:test generic config
        admin@ncs% commit dry-run outformat native
        native {
            device {
                name <device-name>
                data create test generic config
            }
        }
        admin@ncs% commit
        Commit complete.
        admin@ncs% request devices device <device-name> compare-config
        diff
         devices {
             device <device-name> {
                 config {
                     bigip:test {
        +                auto config {
        +                    value
        +                }
                     }
                 }
             }
         }

        admin@ncs%

      Example 2 - creating the corresponding auto-config on the NED solves the compare-config issue
        admin@ncs% set devices device <device-name> config bigip:test auto config value
        admin@ncs% set devices device <device-name> config bigip:test generic config
        admin@ncs% commit dry-run outformat native
        native {
            device {
                name <device-name>
                data create test auto config value
                     create test generic config
            }
        }
        admin@ncs% commit
        Commit complete.
        admin@ncs% request devices device <device-name> compare-config

    7.8.1 Device discovery in /cm/trust-domain

    Devices can be added to /cm/trust-domain in two ways. One way is to
    add a device in /cm/device, then add that device in /cm/trust-domain.
    This is the only way supported by the NED.

    Another way is to specify a /cm/trust-domain device by IP:

      modify /cm trust-domain <trust-domain-name> ca-devices add { <ip> } name <name> ...

    The Big-ip device then performs device discovery with that IP, and
    this new device is added under /cm/device, and other configuration
    nodes are modified out-of-band as well.

    In other words, using device discovery in /cm/trust-domain causes
    auto-config. If the device discovery syntax were to be implemented,
    user would still have to configure the resulting auto-config, i.e. in
    the way that's already supported, whence such an implementation would
    be superfluous.

    If user still wants to use device discovery, live-status can be used.

    7.8.2 False 'in-sync' result when check-sync after device discovery

    The NED uses a hash of configsync.localconfigtime to determine if CDB
    is in sync with a device. However, the configsync.localconfigtime
    value doesn't change after device discovery (as described in
    section 8.1), which leads to check-sync reporting "in-sync" after
    device discovery, even though compare-config would report a diff.

  7.9. sys crypto crl/ sys file ssl-crl
    1. Provided that the crl is stored in the device, issue an install command from
      the NED to install the crl test-crl.pem

      request devices device <device-name> live-status bigip-actions any args "install sys crypto crl all from-local-file test-crl.pem"

    2. Issue a sync-from to fetch the configuration for:
      sys crypto crl
      sys file ssl-crl

      request devices device <device-name> sync-from

    3. Delete both sys crypto crl test-1 & sys file ssl-crl test-1 from the NED
      delete devices device <device-name> config bigip:sys crypto crl test-1
      delete devices device <device-name> config bigip:sys file ssl-crl test-1

      The NED will only send
      delete /sys file ssl-crl "test-1" {  }

      since both sys crypto crl test-1 & sys file ssl-crl test-1 will be deleted by the device once it receives

      delete /sys file ssl-crl "test-1" {  }

  7.10. Creating /ltm rule
  	Use semicolon ; for separating lines.
  	Escape special characters and escape sequences e.g ", $, \n, \r becomes \\", \\$, \\n, \\r
    Multiline mode works for some NSO versions (e.g. 4.7.4, 5.2.0.3). If using a version
    where it does not work correctly, simply default back to escaping and sending it on one line
    as shown in example 2 below.

  	1. Example: unescaped ltm rule and output:
  		set devices device <device-name> config bigip:ltm rule UNESCAPED ignore-verification true rule "when HTTP_REQUEST { HTTP::redirect https://[getfield [HTTP::host] : 1111][HTTP::uri] }"

  		will yield this on the device:

  		list ltm rule UNESCAPED
  		ltm rule UNESCAPED {
  		    ignore-verification true
  		    when HTTP_REQUEST { HTTP::redirect https://[getfield [HTTP::host] : 1111][HTTP::uri] }
  		}

  	2. Example: escaped ltm rule and output:
  		set devices device <device-name> config bigip:ltm rule ESCAPED ignore-verification true rule "when HTTP_REQUEST {\\n\\t\\tHTTP::redirect https://[getfield [HTTP::host] : 1111][HTTP::uri]\\n\\t}"

  		will yield this on the device:

  		list ltm rule ESCAPED
  		ltm rule ESCAPED {
  		    ignore-verification true
  		    when HTTP_REQUEST {
  				HTTP::redirect https://[getfield [HTTP::host] : 1111][HTTP::uri]
  			}
  		}

  7.11. Port representation - alphabetical or numerical
  	The device can represent ports numerically or alphabetically e.g 443 or https.

  	If there is a representation mismatch between the NED and the device a compare-config diff will appear.
  	To solve it, the representation must be same in both the NED and the device.

  	The below config can configure the port representation:
  		1. sys db bigpipe.displayservicenames value true | false
  		2. cli global-settings service name | number

  	Updating 1 will automatically update 2 and vice verse.


  	Example: Configure the device to show numerical port values
   		sys db bigpipe.displayservicenames value false

  7.12. Writing and reading to all partitions with one device instance

    1. To enable the reading of all partitions:
      See README-ned-settings.md Fetching config from all partitions
        admin@ncs% set devices device <name> ned-settings f5-bigip developer-settings sync-from-all-partitions true
        admin@ncs% commit
        admin@ncs% request devices device <name> disconnect
        admin@ncs% request devices device <name> sync-from
        result true

      It may also be necessary to exclude specific paths from getting the
      partition name as a prefix.

    2. Writing to other partitions beside the standard partition /Common:
      To create/modify/delete config which resides in a partition other than the standard partition /Common, the partition name needs to be added before the config name. To be consistent, when working with several partitions with one device instance always specify the partition name before the config name.

      Example:
        Creating a vlan COMMON_VLAN in the standard partition /Common:
          set devices device bigip-1 config bigip:net vlan /Common/COMMON_VLAN tag 123

        Creating a vlan PART_A_VLAN in the non-standard partition /PART_A:
          set devices device bigip-1 config bigip:net vlan /PART_A/PART_A_VLAN tag 123

    3. The below config has been tested to be created/modified/deleted on a partition beside the /Common
      partition on the NED:

       /ltm/node
       /ltm/policy
       /ltm/profile
       /ltm/virtual-address
       /net/self
       /net/vlan

       According to the device vendor creating config on a partition beside the /Common partition by specifying the partition path works the same as first moving to that partition and then create/modify/delete the config.

       It is up to the user of the NED to send working configuration to the device through the NED.

  7.13. ned-id change:

      From NED version 3.6, we have changed ned-id from bigip:f5-bigip to bigip-id:f5-bigip, due to nedcom requires this change. NED will upgrade existing device ned-id's to new ned-ids during package upgrade.
      However to add new device, user need to use new ned-id bigip-id:f5-bigip.
      XML example:
      <ned-id xmlns:bigip-id="http://tail-f.com/ned/f5-bigip-id">bigip-id:f5-bigip</ned-id>

  7.14. Configuring ltm/profile/http/encrypt-cookies

      From NED version 3.8, the modelling for this leaf is changed.
      To configure this leaf, the keyword "cookie" is required
      between encrypt-cookies and the cookie name.

      To configure the leaf in version 3.8 and onwards, use the below syntax:

      ncs# devices device <bigip-device> config ltm profile http <http-name> encrypt-cookies cookie <cookie-name>

  7.15. Removal of set-hooks
      The following set-hooks has been removed:

      15.1. /ltm/virtual/destination -> tailf:callpoint ltm-virtual-mask-hook { tailf:set-hook node; }
        The difference now is that if
          /ltm/virtual/destination
        is set then
          /ltm/virtual/mask
        needs to be set as well, if needed.

      15.2 /ltm/virtual/ip-protocol -> tailf:callpoint ltm-virtual-hook { tailf:transaction-hook node; }
        The difference now is that if
          /ltm/virtual/ip-protocol
          /ltm/virtual/mask
        is set then
          /ltm/virtual/source
          /ltm/virtual/destination
        needs to be set as well, if needed.

  7.16. net/* and security/firewall/* mirroring auto config.
      Some lists in these nodes have a mirroring style of auto config.
      In devices which have this present, the workaround to not get out
      of sync with the device is to use the ned-setting "exclude-load-config",
      see README-ned-settings.md exclude-load-config for details

      Example:
        Configuring net/port-list from the NED, and not receiving compare-config diff:
          ned-settings f5-bigip developer-settings exclude-load-config "security firewall port-list" config-name ".*"

  7.17. Deleting net/fdb and subnodes
      The NED will not issue a delete command for net/fdb, since it is not
      possible on the device.

      Since the subnode net/fdb/records can store a reference to
      net/vlan/interface, it has to be possible to delete this reference
      to enable the deletion of that net/vlan. This is why the NED will
      do a check each time a "delete net fdb vlan X" is issued. If X has
      an instance of records, the command
        modify /net fdb vlan X { records none }
      will be sent to the device.

  7.18. Enabling and using the IMI shell (imish)

  Configuring the device using imish can be enabled with the ned-setting

    ned-settings f5-bigip imish use-imish

  After this has been set to 'true', user should do a sync-from. At this
  point, user can start using configuration under imish.

  Note that by enabling the config under /imish these config will be
  disabled on the NED:

    /net/routing/bgp
    /net/routing/route-map
    /net/routing/prefix-list

  The NED uses "run /util imish -r <id>" to enter imish. The id
  corresponds to a /net/route-domain with dynamic routing enabled, i.e.
  with /net/route-domain/routing-protocol containing the value "BGP", and
  the config entered when that id was specified "belongs" to that id.
  Therefore, imish is modeled as a Yang list.

  When enabling dynamic routing in a /net/route-domain, user must also
  create an imish instance corresponding to the id of that route-domain.
  For example, suppose we have already configured a /net/route-domain with
  id 1. Then when we want to enable dynamic routing, we must also create
  imish 1:

    admin@ncs(config-config)# net route-domain 1 routing-protocol BGP
    admin@ncs(config-route-domain-1)# exit
    admin@ncs(config-config)# imish 1
    admin@ncs(config-imish-1)# commit dry-run outformat native
    native {
        device {
            name <device>
            data modify /net route-domain "1" { routing-protocol replace-all-with {"BGP" } }
        }
    }

  The imish instance is created in the CDB but is not sent to device,
  since it's not actual config.

  Conversely, when disabling dynamic routing for a /net/route-domain, the
  corresponding imish instance must also be deleted.

    admin@ncs(config-config)# net route-domain 1 routing-protocol [ ]
    admin@ncs(config-route-domain-1)# exit
    admin@ncs(config-config)# no imish 1
    admin@ncs(config-config)# commit dry-run outformat native
    native {
        device {
            name bigip-3
            data modify /net route-domain "1" { routing-protocol none  }
        }
    }

  If this is not done, there will be a config diff.

  When enabling dynamic routing and configuring imish in the same
  transaction (commit), device may complain that "Protocol daemon is not
  running", and imish config is not accepted. To avoid this, a delay may
  be necessary. This delay can be controlled with the ned-setting

    ned-settings f5-bigip imish delay-before-imish

  (not to be confused with "delay-before-send")

  By default this value is 10000 milliseconds (10 seconds).

  7.19. Configuring cm/device/unicast-address
      Following the device's listing order for configuring /cm/device/unicast-address keys from the ned is required.
      The listing order for /cm/device/unicast-address keys are:
        1. effective-ip
        2. effective-port
        3. ip
        4. port

      Example:
        root@(www)(cfg-sync Standalone)(Active)(/Common)(tmos)#
        create cm device TEST unicast-address { { ip 1.2.3.4 port 1234 effective-port 1234 effective-ip 1.2.3.4 } }

        root@(www)(cfg-sync Standalone)(Active)(/Common)(tmos)#
        list cm device TEST
        cm device TEST {
          unicast-address {
            {
              effective-ip 1.2.3.4
              effective-port 1234
              ip 1.2.3.4
              port 1234
            }
          }
        }

      Not configuring according to device listing order will yield out-of-syncs.

      The device will automatically configure some of the values depending
      on which ones are included and excluded. This is the table as it is
      currently known:
                    < will auto-conf -->
        ip           |-----------------> effective-ip, effective-port
        port         |-----------------> effective-port
        effective-ip |-----------------> effective-port
      Example:
        root@(www)(cfg-sync Standalone)(Active)(/Common)(tmos)#
        create cm device TEST unicast-address { { ip 1.2.3.4  } }

        root@(www)(cfg-sync Standalone)(Active)(/Common)(tmos)#
        list cm device TEST
        cm device TEST {
          unicast-address {
            {
              effective-ip 1.2.3.4
              effective-port 1026
              ip 1.2.3.4
              port 1234
            }
          }
        }

      If sent from the NED the above example will result in out-of-sync.


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
     admin@ncs(config)# devices device dev-1 ned-settings f5-bigip logging level debug
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

