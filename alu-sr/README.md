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
  11. NED Secrets - Securing your Secrets
  ```


# 1. General
------------

  This document describes the alu-sr NED.

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
  | netsim                    | yes       | Default emulated device: 7750 SROS 14.0.0                        |
  |                           |           |                                                                  |
  | check-sync                | yes       | Several check-sync strategies acceped (config-hash, last-updated |
  |                           |           | timestamp etc)                                                   |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | Native device CLI commands supported (eg 'info' inside a node).  |
  |                           |           | Check partial-show-method ned-settings                           |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Commands suported as live-status exec: admin|any|debug|ping|show |
  |                           |           |                                                                  |
  | live-status show          | yes       | Supports several live-status 'show' TTL-based commands           |
  |                           |           |                                                                  |
  | load-native-config        | yes       |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```
  Custom NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | apply-device-config-      | yes       | Supported methods: CLI, scp-transfer, sftp-transfer              |
  | method                    |           |                                                                  |
  |                           |           |                                                                  |
  | apply-device-config-      | yes       | Supported methods: CLI, scp-transfer, sftp-transfer              |
  | method                    |           |                                                                  |
  |                           |           |                                                                  |
  | get-device-config-method  | yes       | Supported methods: CLI, scp-transfer, sftp-transfer              |
  |                           |           |                                                                  |
  | candidate-commit          | yes       | Needs to be enabled on the device also                           |
  |                           |           |                                                                  |
  | number-of-lines-to-send-  | yes       | Configurable number of lines to be sent in one chunk             |
  | in-chunk                  |           |                                                                  |
  |                           |           |                                                                  |
  | persistent-store          | yes       | Configure how the NED shall save configuration to persistent     |
  |                           |           | memory                                                           |
  |                           |           |                                                                  |
  | trans-id-method           | yes       | Configure how the NED shall calculate the transaction id (full   |
  |                           |           | config hash, last modified date etc)                             |
  |                           |           |                                                                  |
  | ned-secrets               | yes       | NED supports device-enctypted password caching. Please check     |
  |                           |           | README.md                                                        |
  |                           |           |                                                                  |
  | proxy                     | yes       | Supports up to two proxy jumps                                   |
  |                           |           |                                                                  |
  | custom-transaction-error- | yes       | Supports definition of custom device errors to be thrown by the  |
  | definition                |           | NED                                                              |
  |                           |           |                                                                  |
  | ignore-bof-in-trans-id    | yes       | Configure if BOF section should be ignored or not at trans-id    |
  |                           |           | computation (eg ignore BOF at check-sync)                        |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | ALCATEL SR 7750           | C-12.0.R8       | SROS   | 7750 SROS-C-12.0.R8                               |
  |                           |                 |        |                                                   |
  | ALCATEL SR 7750           | C-14.0.R4       | SROS   | 7750 SROS-C-14.0.R4                               |
  |                           |                 |        |                                                   |
  | ALCATEL SR 7750           | C-15.1.R2       | SROS   | 7750 SROS-C-15.1.R2                               |
  |                           |                 |        |                                                   |
  | ALCATEL SR 7750           | C-16.0.R3       | SROS   | 7750 SROS-C-16.0.R3                               |
  |                           |                 |        |                                                   |
  | ALCATEL SR 7750           | B-21.5.R2       | SROS   | 7750 SROS-B-21.5.R2                               |
  |                           |                 |        |                                                   |
  | ALCATEL SR 7950           | C-19.7.R2       | SROS   | 7950 SROS-C-19.7.R2                               |
  |                           |                 |        |                                                   |
  | ALCATEL SR 7250           | C-19.10.R6      | SROS   | 7250 SROS-C-19.10.R6                              |
  |                           |                 |        |                                                   |
  | ALCATEL SR 7705           | B-5.0.R3        | SROS   | 7705 SROS-B-5.0.R3                                |
  |                           |                 |        |                                                   |
  | ALCATEL SR 7210           | B-4.0.R6        | SROS   | 7210 SROS-B-4.0.R6                                |
  |                           |                 |        |                                                   |
  | ALCATEL SR 7210           | B-3.0.R3        | SROS   | 7210 SROS-B-3.0.R3                                |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-alu-sr-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-alu-sr-1.0.1.signed.bin
      > ./ncs-6.0-alu-sr-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-alu-sr-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-alu-sr-1.0.1.tar.gz
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
     `alu-sr-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-alu-sr-1.0.1.tar.gz
     > ls -d */
     alu-sr-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package alu-sr-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package alu-sr-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-alu-sr-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package alu-sr-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/alu-sr-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-alu-sr-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-alu-sr-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install alu-sr-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-alu-sr-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-alu-sr-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id alu-sr-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-alu-sr-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings alu-sr logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings alu-sr logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.alusr \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings alu-sr logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings alu-sr logger java true
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

  The following is an example of configuring some security settings and adding them to a service vprn.
  First step: add CLI commands in the NED CLI:

  ```
  admin@ncs(config)# devices device alu7750-5 config
  admin@ncs(config-config)#    system
  admin@ncs(config-system)#      security
  admin@ncs(config-security)#       pki
  admin@ncs(config-pki)#        ca-profile "PkiNokiaCa"
  admin@ncs(config-ca-profile-PkiNokiaCa)#         auto-crl-update
  admin@ncs(config-auto-crl-update)#          shutdown
  admin@ncs(config-auto-crl-update)#         exit
  admin@ncs(config-ca-profile-PkiNokiaCa)#        exit
  admin@ncs(config-pki)#       exit
  admin@ncs(config-security)#      exit
  admin@ncs(config-system)#     exit
  admin@ncs(config-config)#     ipsec
  admin@ncs(config-ipsec)#      ike-policy 2
  admin@ncs(config-ike-policy-2)#       auth-method    cert-auth
  admin@ncs(config-ike-policy-2)#       dpd interval 10 max-retries 2 reply-only
  admin@ncs(config-ike-policy-2)#       ike-version    2
  admin@ncs(config-ike-policy-2)#       ipsec-lifetime 172800
  admin@ncs(config-ike-policy-2)#       ike-transform 1
  admin@ncs(config-ike-policy-2)#      exit
  admin@ncs(config-ipsec)#      ike-policy 3
  admin@ncs(config-ike-policy-3)#       auth-method    cert-auth
  admin@ncs(config-ike-policy-3)#       dpd interval 10 max-retries 2 reply-only
  admin@ncs(config-ike-policy-3)#       ike-version    2
  admin@ncs(config-ike-policy-3)#       ipsec-lifetime 172800
  admin@ncs(config-ike-policy-3)#       ike-transform 1
  admin@ncs(config-ike-policy-3)#      exit
  admin@ncs(config-ipsec)#      ike-transform 1
  admin@ncs(config-ike-transform-1)#       isakmp-lifetime 172800
  admin@ncs(config-ike-transform-1)#      exit
  admin@ncs(config-ipsec)#      ipsec-transform 2
  admin@ncs(config-ipsec-transform-2)#      exit
  admin@ncs(config-ipsec)#      cert-profile cert-profile-1
  admin@ncs(cert-profile)#       entry 1
  admin@ncs(config-entry-1)#        cert SEGW-PKI.crt
  admin@ncs(config-entry-1)#        key  SEGW-PKI.key
  admin@ncs(config-entry-1)#       exit
  admin@ncs(cert-profile)#       no shutdown
  admin@ncs(cert-profile)#      exit
  admin@ncs(config-ipsec)#      cert-profile cert-profile-2
  admin@ncs(cert-profile)#       entry 1
  admin@ncs(config-entry-1)#        cert SEGW-PKI.crt
  admin@ncs(config-entry-1)#        key  SEGW-PKI.key
  admin@ncs(config-entry-1)#       exit
  admin@ncs(cert-profile)#       no shutdown
  admin@ncs(cert-profile)#      exit
  admin@ncs(config-ipsec)#      trust-anchor-profile Trust-A-Profile-1
  admin@ncs(trust-anchor-profile)#       trust-anchor "PkiNokiaCa"
  admin@ncs(trust-anchor-profile)#      exit
  admin@ncs(config-ipsec)#      trust-anchor-profile Trust-A-Profile-2
  admin@ncs(trust-anchor-profile)#       trust-anchor "PkiNokiaCa"
  admin@ncs(trust-anchor-profile)#      exit
  admin@ncs(config-ipsec)#      tunnel-template 1
  admin@ncs(config-tunnel-template-1)#       sp-reverse-route
  admin@ncs(config-tunnel-template-1)#       replay-window    128
  admin@ncs(config-tunnel-template-1)#       transform        2
  admin@ncs(config-tunnel-template-1)#      exit
  admin@ncs(config-ipsec)#      tunnel-template 2
  admin@ncs(config-tunnel-template-2)#       sp-reverse-route
  admin@ncs(config-tunnel-template-2)#       replay-window    128
  admin@ncs(config-tunnel-template-2)#       transform        2
  admin@ncs(config-tunnel-template-2)#      exit
  admin@ncs(config-ipsec)#     exit
  admin@ncs(config-config)#     isa
  admin@ncs(config-isa)#      tunnel-group 1 isa-scale-mode tunnel-limit-32k
  admin@ncs(config-tunnel-group-1)#       description  SecGW
  admin@ncs(config-tunnel-group-1)#       multi-active
  admin@ncs(config-tunnel-group-1)#       reassembly   2000
  admin@ncs(config-tunnel-group-1)#     exit
  admin@ncs(config-isa)#     service
  admin@ncs(config-service)#      vprn 1234 customer 1 name 1234
  admin@ncs(vprn)#       interface test
  admin@ncs(interface)#        dynamic-tunnel-redundant-next-hop 1.1.1.1
  admin@ncs(interface)#        sap tunnel-1.public:2
  admin@ncs(sap)#         ipsec-gw Ipsecgw-1
  admin@ncs(config-ipsec-gw)#          shutdown
  admin@ncs(config-ipsec-gw)#          cert
  admin@ncs(config-cert)#           cert-profile         cert-profile-1
  admin@ncs(config-cert)#           status-verify
  admin@ncs(config-status-verify)#            default-result good
  admin@ncs(config-status-verify)#           exit
  admin@ncs(config-cert)#           trust-anchor-profile Trust-A-Profile-2
  admin@ncs(config-cert)#          exit
  admin@ncs(config-ipsec-gw)#          default-secure-service 2000 interface private-interface-Ipsecgw-1 
  admin@ncs(config-ipsec-gw)#          default-tunnel-template 2
  admin@ncs(config-ipsec-gw)#          ike-policy              3
  admin@ncs(config-ipsec-gw)#          local-gateway-address   1.1.1.2
  admin@ncs(config-ipsec-gw)#          local-id type fqdn value 1234
  admin@ncs(config-ipsec-gw)#         exit
  admin@ncs(sap)#        exit
  admin@ncs(interface)#       exit
  admin@ncs(vprn)#      exit
  admin@ncs(config-service)#      vprn 2000 customer 1
  admin@ncs(vprn)#       interface loopback_DATA_MOBILE
  admin@ncs(interface)#      exit
  admin@ncs(vprn)#      vprn 3000 customer 1
  admin@ncs(vprn)#       interface loopback_DATA_MOBILE
  admin@ncs(interface)#      exit
  admin@ncs(vprn)#     exit
  admin@ncs(config-service)# exit
  admin@ncs(config-config)# 
  ```

  Checking the device native CLI output and then commit changes:

  ```
  admin@ncs(config-service)# commit dry-run outformat native 
  native {
      device {
          name alu7750-5
          data exit all
               configure
               ipsec
                ike-policy 2 create
                 ike-version 2
                 auth-method cert-auth
                 dpd interval 10 max-retries 2 reply-only
                exit
                ike-transform 1 create
                 isakmp-lifetime 172800
                exit
                ike-policy 2 create
                 ike-transform 1
                 ipsec-lifetime 172800
                exit
                ike-policy 3 create
                 ike-version 2
                 auth-method cert-auth
                 dpd interval 10 max-retries 2 reply-only
                 ike-transform 1
                 ipsec-lifetime 172800
                exit
                ipsec-transform 2 create
                exit
                cert-profile cert-profile-1 create
                 entry 1 create
                  cert SEGW-PKI.crt
                  key SEGW-PKI.key
                 exit
                 no shutdown
                exit
                cert-profile cert-profile-2 create
                 entry 1 create
                  cert SEGW-PKI.crt
                  key SEGW-PKI.key
                 exit
                 no shutdown
                exit
                trust-anchor-profile Trust-A-Profile-1 create
                exit
               exit
               system
                security
                 pki
                  ca-profile PkiNokiaCa create
                   auto-crl-update create
                    shutdown
                   exit
                  exit
                 exit
                exit
               exit
               ipsec
                trust-anchor-profile Trust-A-Profile-1 create
                 trust-anchor PkiNokiaCa
                exit
                trust-anchor-profile Trust-A-Profile-2 create
                 trust-anchor PkiNokiaCa
                exit
                tunnel-template 1 create
                 sp-reverse-route
                 replay-window 128
                 transform 2
                exit
                tunnel-template 2 create
                 sp-reverse-route
                 replay-window 128
                 transform 2
                exit
               exit
               isa
                tunnel-group 1 isa-scale-mode tunnel-limit-32k create
                 description "SecGW"
                 multi-active
                 reassembly 2000
                exit
               exit
               service
                vprn 1234 customer 1 name 1234 create
                 interface test create
                  sap tunnel-1.public:2 create
                   ipsec-gw Ipsecgw-1
                    cert
                     cert-profile cert-profile-1
                     status-verify
                      default-result good
                     exit
                     trust-anchor-profile Trust-A-Profile-2
                    exit
                   exit
                  exit
                 exit
                exit
                vprn 2000 customer 1 name 2000 create
                 interface loopback_DATA_MOBILE create
                 exit
                exit
                vprn 1234 customer 1 name 1234 create
                 interface test create
                  sap tunnel-1.public:2 create
                   ipsec-gw Ipsecgw-1
                    default-secure-service 2000 interface private-interface-Ipsecgw-1
                    default-tunnel-template 2
                    ike-policy 3
                    local-gateway-address 1.1.1.2
                    local-id type fqdn value 1234
                    shutdown
                   exit
                  exit
                  dynamic-tunnel-redundant-next-hop 1.1.1.1
                 exit
                exit
                vprn 3000 customer 1 name 3000 create
                 interface loopback_DATA_MOBILE create
                 exit
                exit
               exit
               exit all
      }
  }
  admin@ncs(config-config)# commit
  Commit complete.
  ```

  Checking if there are diffs between the device configuration and the NED CDB:

  ```
  admin@ncs(config-config)# compare-config
  admin@ncs(config-config)# check-sync
  result in-sync
  admin@ncs(config-config)#
  ```

  In the above commands, compare-config result should be empty and the check-sync result should be in-sync. If there are different results, it is possible that some commands failed on the device (the device output may contain errors that are not caught by the NED) or the device added some dynamic data. Trace analysis is needed in this case to understand what went wrong.
  If the NED missed a device error that it was supposed to be thrown by the NED, please check chapter 7 from this document and README-ned-settings.md chapter 13.1 on how to address this issue.

  The commited changes can also be rolled back to the original device state, before the commit:

  ```
  admin@ncs(config-config)# top rollback config
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name alu7750-5
          data exit all
               configure
               ipsec
                no ike-policy 2
               exit
               service
                vprn 1234 customer 1 name 1234 create
                 interface test create
                  no dynamic-tunnel-redundant-next-hop
                  sap tunnel-1.public:2 create
                   ipsec-gw Ipsecgw-1
                    cert
                     no cert-profile
                     status-verify
                      no default-result
                     exit
                     no trust-anchor-profile
                    exit
                    no default-secure-service
                    no default-tunnel-template
                    no ike-policy
                    no local-gateway-address
                    no local-id
                    shutdown
                   exit
                   no ipsec-gw
                  exit
                  sap tunnel-1.public:2 shutdown
                  no sap tunnel-1.public:2
                 exit
                exit
               exit
               ipsec
                no ike-policy 3
                no ike-transform 1
                no tunnel-template 1
                no tunnel-template 2
                no ipsec-transform 2
                cert-profile cert-profile-1 shutdown
                no cert-profile cert-profile-1
                cert-profile cert-profile-2 shutdown
                no cert-profile cert-profile-2
                no trust-anchor-profile Trust-A-Profile-1
                no trust-anchor-profile Trust-A-Profile-2
               exit
               isa
                tunnel-group 1 isa-scale-mode tunnel-limit-32k create
                 no description
                 no multi-active
                 no reassembly
                exit
                no tunnel-group 1
               exit
               service
                vprn 1234 customer 1 name 1234 create
                 interface test shutdown
                 no interface test
                exit
                vprn 1234 shutdown
                no vprn 1234
                vprn 2000 customer 1 name 2000 create
                 interface loopback_DATA_MOBILE shutdown
                 no interface loopback_DATA_MOBILE
                exit
                vprn 2000 shutdown
                no vprn 2000
                vprn 3000 customer 1 name 3000 create
                 interface loopback_DATA_MOBILE shutdown
                 no interface loopback_DATA_MOBILE
                exit
                vprn 3000 shutdown
                no vprn 3000
               exit
               system
                security
                 pki
                  ca-profile PkiNokiaCa shutdown
                  no ca-profile PkiNokiaCa
                 exit
                exit
               exit
               exit all
      }
  }
  admin@ncs(config-config)# commit
  Commit complete.
  admin@ncs(config-config)# compare-config
  admin@ncs(config-config)# 
  ```


# 5. Built in live-status actions
---------------------------------

  The NED supports the following live-status exec commands:
   - any: Execute any command on device
   - ping: Send echo message
   - debug: Execute debug commands
   - show: Execute show commands
   - admin: Execute admin commands
   - any encryption re-encrypt obfuscated: this is used to force the secrets operational CDB update (please check chapter 9)


# 6. Built in live-status show
------------------------------

  ALU-SR NED supports a bunch of live-status 'show' TTL-based commands. Here is a list of supported elements:

  ```
  admin@ncs# show devices device alu7750-5 live-status 
  Possible completions:
    card             Display Card information
    chassis          Display chassis information
    eth-cfm          
    lag              
    modules-state    
    ports            Display all available ports (on all slots)
    resource-usage   
    router           Display router instance information
    service          Display services related information
    sfm              Display Switch Fabric Module (sfm) information
    slot             Display MDA information
    system           Display system params

  ```

  Example of a live-status call:

  ```
  admin@ncs# show devices device alu7750-5 live-status slot 
  live-status slot 1
   mda 1
    ports-maximum    20
    ports-equipped   20
    last-boot        2023-04-27T08:18:26-00:00
    oper-state       up
    admin-state      up
    software-version "(Not Specified)"
    provisioned-type m20-v
  admin@ncs# 

  ```


# 7. Limitations
----------------

  Device errors: since ALU-SR is not a CISCO device, the NED does not have a complete list of device errors to be thrown.

  This may lead to device errors that are missed by the NED, usually generating a compare-config issue.
  However, it is possible to define a custom list of device errors to be thrown by the NED.
  Please check the README-ned-settings.md for ned-settings alu-sr transaction config-abort-warning

  YANG model: the NED behavior is not 1 to 1 with the device behavior because of the yang limitations.
  For this reason, there are several work-around in the NED to achieve a behavior similar to the device.
  For example, a leaf 'encap-type' that allows values like 'dot1q' but also allows a value like 'no encap-type' (no encap-type shown on the device), this leaf may be modeled as 'encap-type no' to also support the device 'no encap-type'.

  Redeployment: a significant number of device operations requires redeployment of configuration. 
  For instance, updates to a specific node may need to shutdown an external node first, do the update and then restore the external node state.
  While redeployments are common and vastly supported in ALU-SR NED, the redeployment is always done with the current NED data.
  For instance, the NED cannot redeploy data if the targeted data for redeployment is also changed in the current transaction.

  Custom trans-id methods: using ned-settings (please check README-ned-settings.md), it is possible to change the way alu-sr NED computes trans-id.
  Popular choices for trans-id computation are config-hash or config-data, which basically pulls the entire device configuration in order to compute trans-id hash. 
  These two methods are most reliable, since they catch any changes on the device, however, most of the time, device configurations are significantly large, which introduces significant get and processing time.
  To drastically reduce the trans-id computation time, alu-sr provides custom trans-id methods, but they have certain limitations:
    - rollback-timestamp: trans-id computation based on the device rollback timestamp (device rollback feature must be on). This method is unreliable because the rollback timestamp does not change when the device config is changed, only when the device is rolled back.
    - last-modified-timestamp: cumputes trans-id based on the device last modified timestamp. This method is reliable to detect out-of-band changes, as long as the device configuration is not saved out-of-band (eg execute 'admin save' on the device). When saving the device configuration out-of-band (eg 'admin save'), this timestamp is invalidated by the device.
    - last-saved-timestamp: this method uses the last saved device timestamp. This method is reliable as long as the device changes are saved every time, either from the NED or from the device. Note: out-of-band changes of the device that are not saved will not be detected by this method
    - last-modified-and-last-saved-timestamp: this method uses both last modified and last saved timestamps. This method is reliabe to detect both out-of-band modifications or configuration save on the device. Limitation for this method is that the NED will be in out-of-sync state when the device configuration is not modified but it is saved (eg when 'admin save' is used out-of-band, the NED will be in out-of-sync state, even though the device configuration was not actually modified)


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
     admin@ncs(config)# devices device dev-1 ned-settings alu-sr logging level debug
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
  > devices device dev-1 ned-settings alu-sr logger level debug
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

# 11. NED Secrets - Securing your Secrets
-----------------------------------------

    It is best practice to avoid storing your secrets (e.g. passwords and
    shared keys) in plain-text, either on NSO or on the device. In NSO we
    support multiple encrypted datatypes that are encrypted using a local
    key, similarly many devices such as ALU-SR supports automatically
    encrypting all passwords stored on the device. 

    Naturally, for security reasons, NSO in general has no way of
    encrypting/decrypting passwords with the secret key on the
    device. This means that if nothing is done about this we will
    become out of sync once we write secrets to the device.

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

    --- Handling auto-encryption

    Let us say that we have password-encryption on and we want to write a new
    user to our device:

    system
     security
      user admin
       access console
       console
        member administrative
       exit
       password <admin-password>

    this will be automatically encrypted by the device

    *A:VSR-7750>config# system security user "admin"
    *A:VSR-7750>config>system>security>user# info
    ----------------------------------------------
                password "$2y$10$fBSDYG2MHpdpCTDQhq7BE.ojwFR5z10g61PUqWaXb52GXg0Ge8d8W"
                access console
                console
                    member "administrative"
                exit
    ----------------------------------------------

    But the secrets management will store this new encrypted value in our `secrets` table:

      admin@ncs# show devices device dev-1 ned-settings secrets
      ID                                        ENCRYPTED                                                     REGEX
      ---------------------------------------------------------------------------------------------------------------
      /system/security/user_admin_/password/id  $2y$10$fBSDYG2MHpdpCTDQhq7BE.ojwFR5z10g61PUqWaXb52GXg0Ge8d8W  -

      which means that compare-config or sync-from will not show any
      changes and will not result in any updates to CDB". In fact, we can
      still see the unencrypted value in the device tree:

      admin@ncs(config-config)# show full sys sec user
      devices device dev-1
       config
        system
         security
          user admin
          access console
          console
           member administrative
          !
          password <admin-password>

    --- Increasing security with NSO-side encryption

    We have two alternatives, either we can manually encrypt our values using
    one of the NSO-encrypted types (e.g `aes-256-cfb-128-encrypted-string`) and
    set them to the tree, or we can recompile the NED to always encrypt secrets.

    --- Setting encrypted value

    Let us say we know that the NSO-encrypted string
      `$2y$10$7ova9fF/bRe9B9GUtjVpA.w5mfeXJXRHyV0KsSfg4XWE9j3Fcq3Qi`, we
    can then set it in the device tree as normal

      admin@ncs(config-config)# system security user admin password $2y$10$7ova9fF/bRe9B9GUtjVpA.w5mfeXJXRHyV0KsSfg4XWE9j3Fcq3Qi
      admin@ncs(config-config)# commit

    when commiting this value it will be decrypted and the plaintext will be written to the device.
    Unlike the previous example the plaintext is not visible in the device tree:

      admin@ncs(config-config)# show full sys sec user
      devices device dev-1
       config
        system
         security
          user admin
          access console
          console
           member administrative
          !
          password $2y$10$7ova9fF/bRe9B9GUtjVpA.w5mfeXJXRHyV0KsSfg4XWE9j3Fcq3Qi

    On the device side this plaintext value is of course encrypted
    with the device key, and just as before we store it in our
    `secrets` table:

      admin@ncs# show devices device dev-1 ned-settings secrets
      ID                                        ENCRYPTED                                                     REGEX
      ---------------------------------------------------------------------------------------------------------------
      /system/security/user_admin_/password/id  $2y$10$fBSDYG2MHpdpCTDQhq7BE.ojwFR5z10g61PUqWaXb52GXg0Ge8d8W  -

    We can see that this corresponds to the value set on the device.

    --- Auto-encrypting passwords in NSO

    To avoid having to pre-encrypt your passwords you can rebuild your NED in your OS
    command shell specifying an encrypted type for secrets using a command like:

    yourhost:~/ned-folder$ NEDCOM_SECRET_TYPE="tailf:aes-cfb-128-encrypted-string" make -C src/ clean all

    Or by adding the line `NED_EXTRA_BUILDFLAGS ?= NEDCOM_SECRET_TYPE=tailf:aes-cfb-128-encrypted-string`
    in top of the `Makefile` located in <alu-sr-folder>/src directory.

    Doing this means that even if the input to a password is a plaintext string, NSO will always
    encrypt it, and you will never see plain text secrets in the device tree.

    If we reload our example with the new NED all of the secrets are now encrypted:

      admin@ncs(config-config)# show full sys sec user
      devices device dev-1
       config
        system
         security
          user admin
          access console
          console
           member administrative
          !
          password $2y$10$7ova9fF/bRe9B9GUtjVpA.w5mfeXJXRHyV0KsSfg4XWE9j3Fcq3Qi
