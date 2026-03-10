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



  - This document describes the F5 Big-IP Network Element Driver (NED) for Cisco Network Services Orchestrator (NSO).
  - The NED is a software component that enables NSO to manage F5 Big-IP devices, providing a set of actions and operations that can be performed on these devices.
  - The F5 Big-IP NED is designed as a generic SSH NED, which means it uses the TMSH CLI commands of the F5 Big-IP device under SSH management.
  - It will use REST API calls for operations that require it, allowing for more complex interactions with the device, but it does not rely on HTTPS for general configuration management and device interaction.

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
  ### Extra Setup Warning

  > WARNING: Ensure `localhost` is resolvable and loopback addresses are defined.
  > - Follow RFC 6761 section 6.3: https://datatracker.ietf.org/doc/html/rfc6761#section-6.3
  > - `/etc/hosts` (or equivalent) should contain `127.0.0.1` and/or `::1` mapping to `localhost`, `*.localhost`, or `localhost.*`

  ---

  ### IMPORTANT
  ---

  ### 1.3.1 **F5-BIGIP NED** is a **generic SSH** NED by design
  ---

  - This means the NED is using the TMSH CLI commands of F5 BIGIP device under SSH management
  - Therefore, please ensure the SSH port is available and configured  for the main config section as exemplified below
  - HTTPS port may also be used in certain live status commands, but it is NOT used for general config management and device interaction. 


  **Example:**
  ---

  - Assuming **SSH** is open on port 22 and **HTTPS** on 443:
  ```cli
  devices device dev-1
   address         <IP-ADDRESS>
   port            22
   ssh host-key ssh-dss
    key-data "..."
   !
   ssh host-key ssh-rsa
    key-data "..."
   !
   authgroup       dev-1-authgroups
   device-type generic ned-id f5-bigip-gen-3.24
   connect-timeout 60
   read-timeout    360
   write-timeout   360
   trace           raw
   ned-settings f5-bigip trim-config-model include-default-config false
   ned-settings f5-bigip rest-credentials port 443
   ned-settings f5-bigip rest-credentials user <REST_user>
   ned-settings f5-bigip rest-credentials password "<REST_PASSWORD>"
   ned-settings f5-bigip developer-settings no-hostname-verification true
   state admin-state unlocked
  !
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

  ## Sample Configuration Workflow

  ## 4.1. Enter device config mode & create object
  ```
  admin@ncs(config)# devices device dev-1 config
  admin@ncs(config-config)# ltm virtual test mask 1.1.1.1
  ```

  ## 4.2. Preview (dry-run) native commands
  ```
  admin@ncs(config-if)# commit dry-run outformat native
  device
      name bigip-5
      data create /ltm virtual "test" {  mask "1.1.1.1" }
  ```

  ## 4.3. Commit the transaction
  ```
  admin@ncs(config-if)# commit
  Commit complete.
  ```

  ## 4.4. Check sync status
  ```
  admin@ncs(config-if)# devices device dev-1 check-sync
  result in-sync
  ```

  ## 4.5. Compare configuration
  ```
  admin@ncs(config-if)# devices device dev-1 compare-config
  admin@ncs(config-if)#
  ```

  Note: If no diff is shown, supported config is the same in NSO as on the device.


# 5. Built in live-status actions
---------------------------------


  The NED provides comprehensive support for native F5 exec commands through the device live-status interface. 
  These actions allow you to execute various F5 Big-IP operations directly from NSO, outside the NSO config tree. 
  Please use them cautiously as they can impact and potentially change device behavior or existing configuration in some cases.
  If configuration changes as a result of a live-status command, a `sync-from` command may be required to reconcile the device state with NSO.

  ## Available Actions Overview

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions
  Possible completions:
    any                    Execute any tmsh commands
    any-outside-tmsh       Execute any exec commands outside tmsh
    asm                    Execute asm action
    certificate            Execute certificate install action
    file                   Execute file upload/delete actions
    outside-tmsh-prompts   Execute several commands and wait for prompt(s)
    run                    Execute run commands
    show                   Execute show commands
    exec-rest-call         Execute REST API calls
    outside-tmsh-cmds      Execute duplicated commands to device
  ```

  ---

  ## 5.1 Generic Command Execution
  ---

  ### 5.1.1 `any` Action - TMSH Commands
  ---

  - Execute any tmsh commands on the device.

  **Single Command Examples:**
  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions any args "list ltm virtual <name>"
  admin@ncs> request devices device <device-name> live-status bigip-actions any args "show running-config ltm virtual <name>"
  admin@ncs> request devices device <device-name> live-status bigip-actions any args "show cli version"
  admin@ncs> request devices device <device-name> live-status bigip-actions any args "save sys config file /tmp/save_sys_config"
  admin@ncs> request devices device <device-name> live-status bigip-actions any args "save sys ucs /tmp/save_sys_ucs"
  ```

  **Multiple Commands:**
  Separate commands with ` ; ` (space-semicolon-space).

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions any args "show /sys version ; show running-config /ltm virtual"
  ```

  **Example Output:**
  ```
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
  ```

  ###  5.1.2 `any-outside-tmsh` Action - Exec Commands
  ---

  - Execute any exec commands outside tmsh mode.

  **Examples:**
  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions any-outside-tmsh "bigstart restart <name> ; sleep 5 ; bigstart status <name>"

  admin@ncs> request devices device <device-name> live-status bigip-actions any-outside-tmsh "tmsh modify sys sshd include \"\nCiphers 3des-cbc,aes128-cbc,aes192-cbc,aes256-cbc\nMACs hmac-sha1\n\""
  ```

  ###  5.1.3 `show` Action - Show Commands
  ---

  - Execute show commands with structured output.

  **Single Command:**
  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions show args "cli version"
  ```

  **Output:**
  ```
  result
  cli version {
      active 12.0.0
      latest 12.0.0
      supported { 11.5.0 11.5.1 11.5.2 11.5.3 11.6.0 12.0.0 }
  }
  ```

  **Multiple Commands:**
  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions show args "/sys version ; running-config /ltm virtual"
  ```

  ---

  ## 5.2 File Operations
  ---

  ### 5.2.1 Upload File
  ---

  - Transfer files from NSO to the F5 device.

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions file upload \
    local-file-path <local-file> \
    remote-path /var/config/rest/downloads/tmp
  ```

  ### 5.2.2 Download File
  ---

  - Transfer files from the F5 device to NSO.

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions file download \
    remote-file-path /<path-to-file>/<file-name> \
    local-path /home/user
  ```

  ### 5.2.3 Delete File
  ---

  - Remove files from the F5 device.

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions file delete \
    remote-file-path /var/config/rest/downloads/tmp/policy.xml
  ```

  ---

  ## 5.3 Certificate Management

  ### 5.3.1 Install Certificate
  ---

  - Install SSL certificates on the device.

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions certificate install-sys \
    crypto cert \
    certificate-ca-name test.crt \
    certificate-from from-local-file \
    certificate-ca-path /config/ssl/ssl.crt/default.crt
  ```

  ---

  ## 5.4 ASM Policy Management

  ### 5.4.1 Upload Policy
  ---

  - Upload ASM security policy files.

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions asm policy upload-policy \
    local-policy-file-path <local-policy-file>
  ```

  ### 5.4.2 Get Policies
  ---

  - List all available ASM policies.

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions asm policy get-policies
  ```

  **Output:**
  ```
  policy {
      name appliCodessl
      id U1Z-9m6gv53xAOM592TY0Q
  }
  policy {
      name test
      id MrLpFzRHNarvj_zuAOD0fw
  }
  result successful
  ```

  ### 5.4.3 Apply Policy
  ---

  - Apply an ASM policy to the system.

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions asm policy apply-policy \
    policy-id U1Z-9m6gv53xAOM592TY0Q
  ```

  ### 5.4.4 Import Policy
  ---

  - Import ASM policy from file.

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions asm policy import-policy \
    filename sec_policy_file.xml \
    name newTestPolicy
  ```

  ### 5.4.5 Export Policy
  ---

  - Export ASM policy to file.

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions asm policy export-policy \
    filename exported_file.xml \
    minimal true \
    policy-id U1Z-9m6gv53xAOM592TY0Q
  ```

  ### 5.4.6 Download Policy
  ---

  - Download exported ASM policy file.

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions asm policy download-policy \
    filename exported_file.xml \
    local-directory <local-dir>
  ```

  ---

  ## 5.5 Advanced Interactive Commands
  ---

  ### 5.5.1 `outside-tmsh-prompts` - Interactive Commands
  ---

  - Execute commands that require interactive input/prompts.

  **Example: Change Root Password**
  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions outside-tmsh-prompts \
    call { send "tmsh modify auth password root" prompt ".*new password:" } \
    call { send "PASS2" prompt ".*confirm password:" } \
    call { send "PASS2" prompt ".*#.*"}
  ```

  ### 5.5.2 `exec-rest-call` - REST API Calls
  ---

  - Execute REST API calls directly against the F5 device.

  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions execute-rest-call \
    url /mgmt/tm/cm/traffic-group/traffic-group-1/stats?ver=14.1.0
  ```

  **Prerequisites:**
  - REST credentials must be configured (see section 7.2)
  - Hostname verification may need to be disabled (see section 7.16)

  ### 5.5.3 `outside-tmsh-cmds` - Duplicated Commands
  ---

  - Send multiple commands with unique keys for complex operations.

  **Example: Configure BGP in IMISH Mode**
  ```cli
  admin@ncs> request devices device <device-name> live-status bigip-actions outside-tmsh-cmds \
    cmds { key "A" cmd "imish -r 0" prompt ">" } \
    cmds { key "B" cmd "enable" prompt "#" } \
    cmds { key "C" cmd "configure terminal" prompt "#" } \
    cmds { key "D" cmd "router bgp 1" prompt "#" } \
    cmds { key "E" cmd "neighbor N peer-group" prompt "#" } \
    cmds { key "F" cmd "neighbor N activate" prompt "#" } \
    cmds { key "G" cmd "address-family ipv4" prompt "#" } \
    cmds { key "H" cmd "neighbor N activate" prompt "#" } \
    cmds { key "I" cmd "exit-address-family" prompt "#" } \
    cmds { key "J" cmd "exit" prompt "#" } \
    cmds { key "K" cmd "exit" prompt "#" } \
    cmds { key "L" cmd "exit" prompt "#" }
  ```

  > **Note:** The key values are for uniqueness only and are not sent to the device.

  ---

  ## 5.6 Success Indicators
  ---

  > Most actions return a `result successful` message upon completion. 
  > Monitor NSO logs for detailed execution information and error messages.


# 6. Built in live-status show
------------------------------

  ## 6.1 Live Status: show sys version

  - Command issued from NSO:

  ```
  admin@ncs(config)# devices device <device-name> live-status bigip-actions show sys version
  result ssh-live-status-not-yet-executed
  ```

  - Device interaction (command executed on device):

  ```
  > show sys version
  Sys::Version
  Main Package
    Product     BIG-IP
    Version     12.1.4
    Build       0.0.8
    Edition     Final
    Date        Wed Dec 12 15:15:49 PST 2018
  ```

  Output is representative; version/build will differ per device.


# 7. Limitations
----------------

  ## 7.1 ltm / rule *
  ---

  - Rules in a subdirectory i.e. `RuleDir/aRule` are not shown in NSO. 
  - This is because the F5 BIG-IP device doesn't list those rules when executing `list ltm rule` in tmsh.

  ## 7.2 net / self / * / allow-service all
  ---

  - Issuing `modify net self * { allow-service all }` on the device will automatically replace all previous values of `allow-service` with `all`. 
    This automatic replacement is not supported in the NED. 
    Instead, first delete all the existing `allow-service` values and then add `all`.

  **Example (set to all):**

  ```
  admin@ncs% delete devices device <device-name> config bigip:net self * allow-service
  admin@ncs% set devices device <device-name> config bigip:net self * allow-service all
  admin@ncs% commit dry-run outformat native
  native {
    device {
        name <device-name>
        data modify /net self "*" { allow-service "all" }
    }
  }
  ```

  - If you want to add other values to allow-service when the value is `all` then first delete the `all` value and then add the other values.

  **Example (replace with specific services):**

  ```
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
  ```

  ## 7.3 net / vlan *
  ---

  - When creating a new `/net/vlan` object the device could automatically add the VLAN's name in `/net/stp/vlans` and `/net/route-domain/vlans`. 
    To avoid a compare-config diff the VLAN's name must be added to `/net/stp/vlans` and `/net/route-domain/vlans` from the NED as well.

  - When deleting a `/net/vlan` object the device could automatically delete the VLAN's name from `/net/stp/vlans` and `/net/route-domain/vlans`. 
    To avoid a compare-config diff the VLAN's name must be deleted from those lists by the NED as well.

  **Example 1 (add):**

  ```
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
  ```

  **Example 2 (delete):**

  ```
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
  ```

  ## 7.4 Custom NED-setting file-download-buffer-size
  --- 

  - When downloading a file through the live-status call:

  ```
  admin@ncs% request devices device <device-name> live-status bigip-actions file download local-path <local-path> remote-file-path <remote-path>
  ```

  **Details:**
  - Default buffer size is `1` if the NED-setting `file-download-buffer-size` has not been set (slowest but most reliable for md5sum).

  - **Set buffer size:**
  ```
  admin@ncs% set devices device <device-name> ned-settings f5-bigip file-download-buffer-size SIZE
  admin@ncs% commit
  admin@ncs% request devices device <device-name> disconnect
  admin@ncs% request devices device <device-name> sync-from
  ```

  - Larger values increase speed but also probability of md5 mismatch. NED retries up to 5 times.
  - Testing suggests values >32 significantly raise risk of re-downloads.

  ## 7.5 compare-config diffs on sys snmp users *-password*
  ---

  - The values below can only be set on the device, not listed:
    - `sys snmp users * auth-password`
    - `sys snmp users * privacy-password`

  So if you configure these values from the NED there will be a compare-config diff.

  - The values below can both be set and listed on the device:
    - `sys snmp users * auth-password-encrypted`
    - `sys snmp users * privacy-password-encrypted`

    However, every time you list these values they will change. 
    This will lead to a compare-config diff.

    These compare-config diffs are handled in NSO 4.4 and above. 
    For versions below 4.4 a sync-from is recommended to solve the compare-config diffs.


  ## 7.6 Encrypted-password rollback
  ---

  - The configuration `/sys/snmp/users` have two values which return different values every time they are listed.
    - `/sys/snmp/users/auth-password-encrypted`
    - `/sys/snmp/users/privacy-password-encrypted`

  - When doing a rollback from the deletion of a `/sys/snmp/user` that
    - `/sys/snmp/user/` will be created created by the NED.

    - The NED will send the creation command such as:

      ```cli
      modify /sys snmp users add { "TEST" { username "test"
        privacy-protocol "aes" privacy-password-encrypted "J-0^D/M94UG6:kc8Do;;N6<[fP3EZ`_1Ba[Ca;e16CjssSh"
        auth-protocol "md5" auth-password-encrypted "3FQ,.OvYaRlZ:_Zb[j>7AAN/C<@7=W\?cHhSgN5E7UJYKLKV"
        }
      }
      ```

    - Sometime the device will accept the roll-back command and the deletion roll-back is successful.

    - Other times the device interprets random space and backspace characters. In that case the rollback
      fails. 

      - When that happens the error message below will be printed:
        `Rollback failed. See README "Encrypted-password rollback" for details: edit error`

      - This is a known issue and happens sporadically on the device side.

  ## 7.7 Auto-config handling
  ---

  - Auto-config occurs when the device automatically creates/modifies/deletes configuration. 
    This usually leads to a compare-config issue. 
    One way to solve it is to create/modify/delete the corresponding config in same transaction/commit.

    **Example 1 - compare-config issue due to auto-config:**

    ```cli
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
    ```

    **Example 2 - creating the corresponding auto-config on the NED solves the compare-config issue**

    ```cli
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
    ```

  ### 7.8.1 Device discovery in `/cm/trust-domain`
  ---

  - Devices can be added to `/cm/trust-domain` in two ways. 
    - One way is to add a device in `/cm/device`, then add that device in `/cm/trust-domain`.
      This is the only way supported by the NED.

    - Another way is to specify a `/cm/trust-domain` device by IP:

      `modify /cm trust-domain <trust-domain-name> ca-devices add { <ip> } name <name> ...`

      - The Big-ip device then performs device discovery with that IP, 
        and this new device is added under `/cm/device`, 
        and other configuration nodes are modified out-of-band as well.

      - In other words, using device discovery in `/cm/trust-domain` causes auto-config. 
        If the device discovery syntax were to be implemented, user would still have 
        to configure the resulting auto-config, i.e. in the way that's already supported, 
        hence such an implementation would be superfluous.

      - If user still wants to use device discovery, live-status can be used.

  ### 7.8.2 False 'in-sync' result when check-sync after device discovery
  ---

  - The NED uses a hash of configsync.localconfigtime to determine if CDB is in sync with a device. 
    However, the `configsync.localconfigtime` value doesn't change after device discovery 
    (as described in section 8.1), which leads to check-sync reporting "in-sync" after
    device discovery, even though compare-config would report a diff.

  ## 7.9 sys crypto crl / sys file ssl-crl
  ---

  ### 7.9.1. Provided that the crl is stored in the device, issue an install command from the NED to install the crl `test-crl.pem`

  **Example:**

    `request devices device <device-name> live-status bigip-actions any args "install sys crypto crl all from-local-file test-crl.pem"`

  ### 7.9.2 Issue a sync-from to fetch the configuration for:
    ```cli
    sys crypto crl
    sys file ssl-crl
    ```

  **Example:**

    `request devices device <device-name> sync-from`

  ### 7.9.3 Delete both `sys crypto crl test-1` & `sys file ssl-crl test-1` from the NED

  **Example command:**

    ```cli
    delete devices device <device-name> config bigip:sys crypto crl test-1
    delete devices device <device-name> config bigip:sys file ssl-crl test-1
    ```

  - The NED will only send
    `delete /sys file ssl-crl "test-1" {  }`

    since both `sys crypto crl test-1` & `sys file ssl-crl test-1` will be deleted by the device once it receives `delete /sys file ssl-crl "test-1" {  }`

  ## 7.10 Creating /ltm rule
  ---

  - Use semicolon `;` for separating lines.
  - Escape special characters and escape sequences (e.g. `", $, \n, \r becomes \", \\$, \\n, \\r).`
  - Multiline mode works for some NSO versions (e.g. 4.7.4, 5.2.0.3). If using a version where it does not work correctly, default back to escaping and sending it on one line as shown in example 2 below.

  ### 7.10.1. Example: unescaped ltm rule and output:

  **Example command:**

    `set devices device <device-name> config bigip:ltm rule UNESCAPED ignore-verification true rule "when HTTP_REQUEST { HTTP::redirect https://[getfield [HTTP::host] : 1111][HTTP::uri] }"`

  - will yield this on the device:

    ```cli
    list ltm rule UNESCAPED
    ltm rule UNESCAPED {
        ignore-verification true
        when HTTP_REQUEST { HTTP::redirect https://[getfield [HTTP::host] : 1111][HTTP::uri] }
    }
    ```

  ### 7.10.2. Example: escaped ltm rule and output:

  **Example command:**

    `set devices device <device-name> config bigip:ltm rule ESCAPED ignore-verification true rule "when HTTP_REQUEST {\\n\\t\\tHTTP::redirect https://[getfield [HTTP::host] : 1111][HTTP::uri]\\n\\t}"`

    will yield this on the device:

    ```cli
    list ltm rule ESCAPED
      ltm rule ESCAPED {
          ignore-verification true
          when HTTP_REQUEST {
          HTTP::redirect https://[getfield [HTTP::host] : 1111][HTTP::uri]
        }
      }
    ```

  ## 7.11 Port representation - alphabetical or numerical
  ---

  - The device can represent ports numerically or alphabetically (e.g. `443` or `https`).

    - If there is a representation mismatch between the NED and the device a compare-config diff will appear.
    - To solve it, the representation must be same in both the NED and the device.

    - The below config can configure the port representation:
      - *1.* `sys db bigpipe.displayservicenames value true | false`
      - *2.* `cli global-settings service name | number`

      Updating pt *1.* will automatically update *2.* and vice versa.

  **Example:** Configure the device to show numerical port values

    `sys db bigpipe.displayservicenames value false`

  ## 7.12 Writing and reading to all partitions with one device instance
  ---

  ### 7.12.1. To enable the reading of all partitions:

  - See README-ned-settings.md Fetching config from all partitions:
    ```cli
      admin@ncs% set devices device <name> ned-settings f5-bigip developer-settings sync-from-all-partitions true
      admin@ncs% commit
      admin@ncs% request devices device <name> disconnect
      admin@ncs% request devices device <name> sync-from
      result true
    ```

  - It may also be necessary to exclude specific paths from getting the partition name as a prefix.

  ### 7.12.2. Writing to other partitions beside the standard partition /Common:

  - To create/modify/delete config which resides in a partition other than the standard partition `/Common`, the partition name needs to be added before the config name. 
    To be consistent, when working with several partitions with one device instance always specify the partition name before the config name.

  **Example:**

    - Creating a vlan COMMON_VLAN in the standard partition `/Common`:
      `set devices device bigip-1 config bigip:net vlan /Common/COMMON_VLAN tag 123`

    - Creating a vlan PART_A_VLAN in the non-standard partition `/PART_A`:
      `set devices device bigip-1 config bigip:net vlan /PART_A/PART_A_VLAN tag 123`

  ### 7.12.3. The below config has been tested to be created/modified/deleted on a partition beside the `/Common` partition on the NED:

  **Nodes:**

    ```
    /ltm/node
    /ltm/policy
    /ltm/profile
    /ltm/virtual-address
    /net/self
    /net/vlan
    ```

    - According to the device vendor creating config on a partition beside the `/Common` partition by specifying the partition path works the same as first moving to that partition and then create/modify/delete the config.

    - It is up to the user of the NED to send working configuration to the device through the NED.

  ## 7.13 ned-id change
  ---

  - From NED version `3.6`, we have changed ned-id from `bigip:f5-bigip` to `bigip-id:f5-bigip`, due to NEDCOM internal dependencies for this change. 
    NED will upgrade existing device ned-id's to new ned-ids during package upgrade.
    - However to add new device, user need to use new ned-id bigip-id:f5-bigip.

    **XML example:**

        ```xml
        <ned-id xmlns:bigip-id="http://tail-f.com/ned/f5-bigip-id">bigip-id:f5-bigip</ned-id>
        ```

  ## 7.14 Configuring ltm/profile/http/encrypt-cookies
  ---

  - From NED version 3.8, the modelling for this leaf is changed.
  - To configure this leaf, the keyword "cookie" is required between encrypt-cookies and the cookie name.

  - To configure the leaf in version 3.8 and onwards, use the below syntax:
    `ncs# devices device <bigip-device> config ltm profile http <http-name> encrypt-cookies cookie <cookie-name>`

  ## 7.15 Removal of set-hooks
  ---

  - The following set-hooks has been removed:

  ### 7.15.1. /ltm/virtual/destination -> tailf:callpoint ltm-virtual-mask-hook { tailf:set-hook node; }
  - The difference now is that if `/ltm/virtual/destination` is set then
      `/ltm/virtual/mask` needs to be set as well, if needed.

  ### 7.15.2 /ltm/virtual/ip-protocol -> tailf:callpoint ltm-virtual-hook { tailf:transaction-hook node; }

  - The difference now is that if
    ```
      /ltm/virtual/ip-protocol
      /ltm/virtual/mask
    ```
    is set then
    ```
      /ltm/virtual/source
      /ltm/virtual/destination
    ```
    needs to be set as well, if needed.

  ## 7.16 net/* and security/firewall/* mirroring auto config
  ---

  - Some lists in these nodes have a mirroring style of auto config.
  - In devices which have this present, the workaround to not get out of sync with the device is to use the ned-setting "exclude-load-config",
    see **README-ned-settings.md** under **exclude-load-config** for details

  **Example:**

    - Configuring `net/port-list` from the NED, and not receiving compare-config diff:
      `ned-settings f5-bigip developer-settings exclude-load-config "security firewall port-list" config-name ".*"`

  ## 7.17 Deleting net/fdb and subnodes
  ---
  *Dynamic behavior*

  - The NED will not issue a delete command for `net/fdb`, since it is not possible on the device.

    - Since the subnode `net/fdb/records` can store a reference to `net/vlan/interface`, it has to be possible to delete this reference
      to enable the deletion of that `net/vlan`. 
      - This is why the NED will do a check each time a `delete net fdb vlan X` is issued. 
        If X has an instance of records, the command belpw will be sent to the device:
        - `modify /net fdb vlan X { records none }`


  ## 7.18 Enabling and using the IMI shell (imish)
  ---
    **CLI Reference:** 
    - BGP Command Reference: F5 technical documentation
    - IMI Command Reference: F5 technical documentation  
    - Troubleshooting Guide: F5 technical documentation

    **Requirements:**
    - Route domain must have routing-protocol containing "BGP" 
    - Must create corresponding imish instance for each route-domain
    - TERM environment variable may need to be set to vt100 for proper operation

    **NED Specifics:**

  - Configuring the device using imish can be enabled with the ned-setting

    `ned-settings f5-bigip imish use-imish`

  - After this has been set to 'true', user should do a sync-from. At this point, user can start using configuration under imish.

  - *Note* that by enabling the config under `/imish` the following config sections will be disabled on the NED:

    ```
      /net/routing/bgp
      /net/routing/route-map
      /net/routing/prefix-list
    ```

  - The NED uses `run /util imish -r <id>` to enter imish. 
    The id corresponds to a `/net/route-domain` with dynamic routing enabled, i.e. with `/net/route-domain/routing-protocol` containing the value "BGP", and
    the config entered when that id was specified "belongs" to that id.
    Therefore, imish is modeled as a Yang list.

  - When enabling dynamic routing in a `/net/route-domain`, user must also create an imish instance corresponding to the id of that route-domain.

    - For example, suppose we have already configured a `/net/route-domain` with id 1. 
      Then when we want to enable dynamic routing, we must also create imish 1:

    ```cli
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
    ```

    - The imish instance is created in the CDB but is not sent to device, since it's not actual config.

    - Conversely, when disabling dynamic routing for a `/net/route-domain`, the corresponding imish instance must also be deleted.

    ```cli
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
    ```

    - If this is not done, there will be a config diff.

  - When enabling dynamic routing and configuring imish in the same transaction (commit), device may complain that **Protocol daemon is not running**, and imish config is not accepted. 

    To avoid this, a delay may be necessary. 

    This delay can be controlled with the ned-setting: 
      `ned-settings f5-bigip imish delay-before-imish`

    - *NOTE*: To not be confused with `delay-before-send`; different scopes!

    - By default this value is `10000 milliseconds` (`10 seconds`).

  ## 7.19 Configuring cm/device/unicast-address
  ---

  - Following the device's listing order for configuring `/cm/device/unicast-address` keys from the ned is required.

    The listing order for `/cm/device/unicast-address` keys are:
    - *1.* `effective-ip`
    - *2.* `effective-port`
    - *3.* `ip`
    - *4.* `port`

    **Example:**
    ```
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
    ```

    - Not configuring according to device listing order will yield out-of-syncs.

    - The device will automatically configure some of the values depending on which ones are included and excluded. 
      This is the table as it is currently known:
      ```table
                    < will auto-conf -->
        ip           |-----------------> effective-ip, effective-port
        port         |-----------------> effective-port
        effective-ip |-----------------> effective-port
      ```

      **Example:**

      ```cli
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
      ```

      - If sent from the NED the above example will result in out-of-sync.


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

