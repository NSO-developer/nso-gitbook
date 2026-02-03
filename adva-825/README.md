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

  This document describes the adva-825 NED.

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
  | netsim                    | yes       | ADVA825 NETSIM                                                   |
  |                           |           |                                                                  |
  | check-sync                | yes       | Based on trans-id                                                |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | Based on filtering the full configuration                        |
  |                           |           |                                                                  |
  | live-status actions       | yes       | live-status show                                                 |
  |                           |           |                                                                  |
  | live-status show          | no        | NED does not support TTL'based data                              |
  |                           |           |                                                                  |
  | load-native-config        | yes       |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | FSP150CC-GE114            | 6.1.1-183       | 6.1.1- | Hardware device in SJ lab                         |
  |                           |                 | 183    |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-adva-825-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-adva-825-1.0.1.signed.bin
      > ./ncs-6.0-adva-825-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-adva-825-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-adva-825-1.0.1.tar.gz
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
     `adva-825-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-adva-825-1.0.1.tar.gz
     > ls -d */
     adva-825-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package adva-825-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package adva-825-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-adva-825-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package adva-825-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/adva-825-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-adva-825-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-adva-825-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install adva-825-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-adva-825-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-adva-825-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id adva-825-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-adva-825-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings adva-825 logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings adva-825 logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.adva825 \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings adva-825 logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings adva-825 logger java true
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

   The following CLI commands presents an example of the NED CLI usage:
   ```
   adva-825:configure system
    prompt "LABBRMCO4P001"
  exit


  adva-825:network-element ne-1
    configure env-alm env_alarm_input-1-1-1
      alm-type miscellaneous
      alm-notif-code cr
      alm-descr ""
      alm-input-mode disabled
      alm-hold-off enabled
    exit
  exit

  adva-825:network-element ne-1
    add eompls-pw 1 raw dynamic 10.36.110.6 network-1-1-1-1 enabled 21-5 110 36-5-255 disabled disabled
    configure eompls-pw eompls_pw-1-1
     admin-state management
    exit
  exit


  adva-825:network-element ne-1
    configure env-alm env_alarm_input-1-1-2
      alm-type miscellaneous
      alm-notif-code cr
      alm-descr ""
      alm-input-mode disabled
      alm-hold-off enabled
    exit
  exit


  adva-825:network-element ne-1
    configure env-alm env_alarm_input-1-1-3
      alm-type miscellaneous
      alm-notif-code cr
      alm-descr ""
      alm-input-mode disabled
      alm-hold-off enabled
    exit
  exit


  adva-825:network-element ne-1
    configure env-alm env_alarm_input-1-1-4
      alm-type miscellaneous
      alm-notif-code cr
      alm-descr ""
      alm-input-mode disabled
      alm-hold-off enabled
    exit
  exit


  adva-825:configure system
    alarm-attributes system prim-ntp-svr-fail nsa mn
    alarm-attributes system bkup-ntp-svr-fail nsa mn
    alarm-attributes system swdl-filetransfer-ip nsa nr
    alarm-attributes system swdl-install-ip nsa nr
    alarm-attributes system swdl-activation-ip nsa nr
    alarm-attributes system swdl-validation-ip nsa nr
    alarm-attributes system db-filetransfer-ip nsa nr
    alarm-attributes system snmp-dg-host-unreachable nsa mn
    alarm-attributes system snmp-dg-res-busy nsa mn
    alarm-attributes system ip-address-conflict sa cr
    alarm-attributes system db-downgrade nsa nr
    alarm-attributes system filetransfer-ip nsa nr
    alarm-attributes system operation-ip nsa nr
    alarm-attributes system ltp-fail sa mj
    alarm-attributes system ltp-in-progress nsa na
    alarm-attributes system ipv6-address-conflict sa cr
    alarm-attributes system dataexport-ftp-fail nsa mn
    alarm-attributes system traffic-arp-table-full nsa mn
    alarm-attributes psu ctneqpt nsa mn
    alarm-attributes psu eqpt-flt nsa mn
    alarm-attributes psu mismatch nsa mn
    alarm-attributes psu eqpt-rmvd nsa mn
    alarm-attributes psu pwr-no-input-or-unit-fault nsa mn
    alarm-attributes access-port farend-duplex-unknown nsa mn
    alarm-attributes access-port farend-duplex-unknown sa mj
    alarm-attributes access-port efm-oam-dying-gasp nsa mn
    alarm-attributes access-port efm-oam-dying-gasp sa cr
    alarm-attributes access-port efm-fail nsa mn
    alarm-attributes access-port efm-fail sa mn
    alarm-attributes access-port efm-rce nsa mn
    alarm-attributes access-port efm-rce sa mn
    alarm-attributes access-port efm-rld nsa mn
    alarm-attributes access-port efm-rld sa mn
    alarm-attributes access-port efm-rls nsa mn
    alarm-attributes access-port efm-rls sa mn
    alarm-attributes access-port lnkdn-deact nsa mn
    alarm-attributes access-port lnkdn-deact sa cr
    alarm-attributes access-port lnkdn-unisolated nsa mn
    alarm-attributes access-port lnkdn-unisolated sa cr
    alarm-attributes access-port lnkdn-cbl-flt nsa mn
    alarm-attributes access-port lnkdn-cbl-flt sa cr
    alarm-attributes access-port lnkdn-cbl-rmvd nsa mn
    alarm-attributes access-port lnkdn-cbl-rmvd sa cr
    alarm-attributes access-port lnkdn-autoneg-failed nsa mn
    alarm-attributes access-port lnkdn-autoneg-failed sa cr
    alarm-attributes access-port lnkdn nsa mn
    alarm-attributes access-port lnkdn sa cr
    alarm-attributes access-port rfi nsa mn
    alarm-attributes access-port rfi sa mn
    alarm-attributes access-port rx-jabber nsa mn
    alarm-attributes access-port rx-jabber sa mj
    alarm-attributes access-port sfp-mismatch nsa mn
    alarm-attributes access-port sfp-mismatch sa cr
    alarm-attributes access-port sfp-rmvd nsa mn
    alarm-attributes access-port sfp-rmvd sa cr
    alarm-attributes access-port sfp-tx-flt nsa mn
    alarm-attributes access-port sfp-tx-flt sa cr
    alarm-attributes access-port rmt-efm-lpbk-fail nsa na
    alarm-attributes access-port rmt-efm-lpbk-fail sa mn
    alarm-attributes access-port syncref nsa mn
    alarm-attributes access-port esmc-fail nsa mn
    alarm-attributes access-port ql-mismatch nsa mn
    alarm-attributes access-port freq-offset nsa mn
    alarm-attributes access-port sync-ql-invalid nsa mn
    alarm-attributes access-port bw-exceeds-neg-speed nsa mn
    alarm-attributes access-port bw-exceeds-neg-speed sa mj
    alarm-attributes access-port sfp-non-qualified nsa nr
    alarm-attributes access-port lnkdn-master-slave-cfg nsa mn
    alarm-attributes access-port lnkdn-master-slave-cfg sa cr
    alarm-attributes access-port syncref-locked-out nsa mn
    alarm-attributes access-port syncref-forced-switch nsa mn
    alarm-attributes access-port syncref-manual-switch nsa mn
    alarm-attributes access-port syncref-wtr nsa mn
    alarm-attributes access-port link-control-protocol-fail nsa mn
    alarm-attributes access-port link-control-protocol-fail sa cr
    alarm-attributes access-port link-control-protocol-loopexit nsa mn
    alarm-attributes access-port link-control-protocol-loopexit sa cr
    alarm-attributes access-port test-alarm nsa mj
    alarm-attributes access-port elmi-seq-no-mismatch nsa mn
    alarm-attributes access-port elmi-not-oper nsa mn
    alarm-attributes access-port amp-no-peer sa mj
    alarm-attributes access-port amp-prov-fail nsa mn
    alarm-attributes access-port amp-config-fail sa cr
    alarm-attributes access-port lpbk-active nsa na
    alarm-attributes access-port lpbk-requested nsa na
    alarm-attributes network-port forced nsa na
    alarm-attributes network-port lockout nsa na
    alarm-attributes network-port farend-duplex-unknown nsa mn
    alarm-attributes network-port farend-duplex-unknown sa mj
    alarm-attributes network-port efm-oam-dying-gasp nsa mn
    alarm-attributes network-port efm-oam-dying-gasp sa cr
    alarm-attributes network-port efm-fail nsa mn
    alarm-attributes network-port efm-fail sa mn
    alarm-attributes network-port efm-rce nsa mn
    alarm-attributes network-port efm-rce sa mn
    alarm-attributes network-port efm-rld nsa mn
    alarm-attributes network-port efm-rld sa mn
    alarm-attributes network-port efm-rls nsa mn
    alarm-attributes network-port efm-rls sa mn
    alarm-attributes network-port lnkdn-deact nsa mn
    alarm-attributes network-port lnkdn-deact sa cr
    alarm-attributes network-port lnkdn-unisolated nsa mn
    alarm-attributes network-port lnkdn-unisolated sa cr
    alarm-attributes network-port lnkdn-cbl-flt nsa mn
    alarm-attributes network-port lnkdn-cbl-flt sa cr
    alarm-attributes network-port lnkdn-cbl-rmvd nsa mn
    alarm-attributes network-port lnkdn-cbl-rmvd sa cr
    alarm-attributes network-port lnkdn-autoneg-failed nsa mn
    alarm-attributes network-port lnkdn-autoneg-failed sa cr
    alarm-attributes network-port lnkdn nsa mn
    alarm-attributes network-port lnkdn sa cr
    alarm-attributes network-port rfi nsa mn
    alarm-attributes network-port rfi sa mn
    alarm-attributes network-port rx-jabber nsa mn
    alarm-attributes network-port rx-jabber sa mj
    alarm-attributes network-port sfp-mismatch nsa mn
    alarm-attributes network-port sfp-mismatch sa cr
    alarm-attributes network-port sfp-rmvd nsa mn
    alarm-attributes network-port sfp-rmvd sa cr
    alarm-attributes network-port sfp-tx-flt nsa mn
    alarm-attributes network-port sfp-tx-flt sa cr
    alarm-attributes network-port rmt-efm-lpbk-fail nsa na
    alarm-attributes network-port rmt-efm-lpbk-fail sa mn
    alarm-attributes network-port syncref nsa mn
    alarm-attributes network-port esmc-fail nsa mn
    alarm-attributes network-port ql-mismatch nsa mn
    alarm-attributes network-port freq-offset nsa mn
    alarm-attributes network-port sync-ql-invalid nsa mn
    alarm-attributes network-port bw-exceeds-neg-speed nsa mn
    alarm-attributes network-port bw-exceeds-neg-speed sa mj
    alarm-attributes network-port sfp-non-qualified nsa nr
    alarm-attributes network-port lnkdn-master-slave-cfg nsa mn
    alarm-attributes network-port lnkdn-master-slave-cfg sa cr
    alarm-attributes network-port syncref-locked-out nsa mn
    alarm-attributes network-port syncref-forced-switch nsa mn
    alarm-attributes network-port syncref-manual-switch nsa mn
    alarm-attributes network-port syncref-wtr nsa mn
    alarm-attributes network-port link-control-protocol-fail nsa mn
    alarm-attributes network-port link-control-protocol-fail sa cr
    alarm-attributes network-port link-control-protocol-loopexit nsa mn
    alarm-attributes network-port link-control-protocol-loopexit sa cr
    alarm-attributes network-port test-alarm nsa mj
    alarm-attributes network-port elmi-seq-no-mismatch nsa mn
    alarm-attributes network-port elmi-not-oper nsa mn
    alarm-attributes network-port amp-no-peer sa mj
    alarm-attributes network-port amp-prov-fail nsa mn
    alarm-attributes network-port amp-config-fail sa cr
    alarm-attributes network-port lpbk-active nsa na
    alarm-attributes network-port lpbk-requested nsa na
    alarm-attributes cfm-mep xcon-ccm sa mn
    alarm-attributes cfm-mep err-ccm sa mn
    alarm-attributes cfm-mep rem-ccm sa mn
    alarm-attributes cfm-mep mac-status sa mn
    alarm-attributes cfm-mep rdi sa mn
    alarm-attributes cfm-mep ais sa nr
    alarm-attributes cfm-qos-shaper shaper-btd nsa na
    alarm-attributes dcn-port lnkdn sa na
    alarm-attributes lag lnkdn-deact sa cr
    alarm-attributes lag lnkdn sa cr
    alarm-attributes lag link-control-protocol-fail sa cr
    alarm-attributes lag link-control-protocol-loopexit sa cr
    alarm-attributes lag amp-no-peer sa mj
    alarm-attributes lag amp-prov-fail nsa mn
    alarm-attributes lag amp-config-fail sa cr
    alarm-attributes lag lpbk-active nsa na
    alarm-attributes lag lpbk-requested nsa na
    alarm-attributes mobile-modem lnkdn nsa na
    alarm-attributes mobile-modem usbdevicemea nsa na
    alarm-attributes mobile-modem usbdevicenonqualified nsa na
    alarm-attributes mobile-modem usbdeviceremoved nsa na
    alarm-attributes mobile-modem no-sim-card nsa na
    alarm-attributes erp-group erp-fop-mismatch sa mj
    alarm-attributes erp-group erp-fop-timeout nsa mn
    alarm-attributes erp-group erp-blockport0-rpl nsa nr
    alarm-attributes erp-group erp-blockport0-sf nsa na
    alarm-attributes erp-group erp-blockport0-ms nsa na
    alarm-attributes erp-group erp-blockport0-fs nsa na
    alarm-attributes erp-group erp-blockport0-wtr nsa na
    alarm-attributes erp-group erp-blockport1-rpl nsa nr
    alarm-attributes erp-group erp-blockport1-sf nsa na
    alarm-attributes erp-group erp-blockport1-ms nsa na
    alarm-attributes erp-group erp-blockport1-fs nsa na
    alarm-attributes erp-group erp-blockport1-wtr nsa na
    alarm-attributes sat-responder-session remote-initiated-sat nsa mn
    alarm-attributes traffic-ip-intf ip-address-conflict nsa mj
    alarm-attributes traffic-ip-intf traffic-ip-intf-outage sa mj
    alarm-attributes vrf ip-address-conflict nsa mj
    alarm-attributes vrf no-route-resources sa mj
    alarm-attributes shelf-nte114pro_he overtemp nsa mn
    alarm-attributes shelf-nte114pro_he undertemp nsa mn
    alarm-attributes nte114pro_he ctneqpt nsa mn
    alarm-attributes nte114pro_he eqpt-flt sa cr
    alarm-attributes nte114pro_he mismatch sa cr
    alarm-attributes nte114pro_he eqpt-rmvd sa cr
    alarm-attributes nte114pro_he test-alarm nsa mj
    alarm-attributes dhcp-relay-agent ip-address-conflict sa mj
    alarm-attributes bfd-session bfd-session-down sa mn
    alarm-attributes eompls-pw destination-unresolved sa mj
    alarm-attributes wifi-dongle usbdevicemea nsa na
    alarm-attributes wifi-dongle usbdevicenonqualified nsa na
    alarm-attributes wifi-dongle usbdeviceremoved nsa na
    syslog-server 1
      configure ip-version ipv4
      configure ipv4-address 3.3.3.3 514
      exit
    syslog-server 2
      configure ip-version ipv4
      configure ipv4-address 4.4.4.4 514
      exit
    syslog-server 3
      configure ip-version ipv4
      configure ipv6-address 0000:0000:0000:0000:0000:0000:0000:0000 514
      exit
    audit-log
      syslog-control enabled
      log2file-control enabled
      exit
    security-log
      syslog-control enabled
      exit
    alarm-log
      syslog-control enabled
      log2file-control enabled
      exit
    acl-entry acl-1
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-2
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-3
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-4
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit

    acl-entry acl-5
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-6
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-7
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-8
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-9
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-10
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-11
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-12
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-13
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-14
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-15
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-16
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-17
      control disabled

      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-18
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-19
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-20
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-21
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-22
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-23
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-24
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
      exit
    acl-entry acl-25
      control disabled
      configure permit ipv4 0.0.0.0 255.255.255.255
    exit
  exit


  adva-825:configure user-security
    access-order local
    auth-protocol radius
    auth-type pap
    nas-ip-address 5.5.5.5
    nas-ipv6-address 0000:0000:0000:0000:0000:0000:0000:0000
    security-strength low
    accounting disabled
    config-ssl-strength low
    tacacs-privilege-control disabled
    tacacs-user-privilege retrieve
    security-trap-type disabled
    config-rap 1
      ip-version ipv4
      ip-address 5.5.5.5
      ipv6-address 0000:0000:0000:0000:0000:0000:0000:0000
      port 1816
      accounting-port 1813
      order first
      timeout 10
      retries 3
      control enabled
      exit
    config-rap 2
      ip-version ipv4
      ip-address 6.6.6.6
      ipv6-address 0000:0000:0000:0000:0000:0000:0000:0000
      port 1816
      accounting-port 1813
      order second
      timeout 10
      retries 3
      control enabled
      exit
    config-rap 3
      ip-version ipv4
      control disabled
      ip-address 0.0.0.0
      ipv6-address 0000:0000:0000:0000:0000:0000:0000:0000
      port 1812
      accounting-port 1813
      order third
      timeout 3
      retries 5
    exit
  exit


  adva-825:configure system
    profile
      configure sac-profile sat_sac_profile-1
        name "SAT_SAC_Profile_1"
        flr 5.000000
        ftd 300
        fdv 300
      exit
    exit
  exit


  adva-825:configure system
    profile
      configure sac-profile sat_sac_profile-2
        name "SAT_SAC_Profile_2"
        flr 5.000000
        ftd 300
        fdv 300
      exit
    exit
  exit


  adva-825:configure system
    profile
      configure sac-profile sat_sac_profile-3
        name "SAT_SAC_Profile_3"
        flr 5.000000
        ftd 300
        fdv 300
      exit
    exit
  exit


  adva-825:configure system
    profile
      configure sac-profile sat_sac_profile-4
        name "SAT_SAC_Profile_4"
        flr 5.000000
        ftd 300
        fdv 300
      exit
    exit
  exit


  adva-825:configure snmp
    add community "turpitude" readonly
  exit


  adva-825:configure snmp
    add community "twtinet94" readonly
  exit


  adva-825:configure snmp
    add target-params "traphost" snmpv2c snmpv2c "turpitude" no-auth
  exit


  adva-825:configure snmp
    add target-address "primary" "7.7.7.7:162" ipv4 1500 3 "trap" "traphost" enabled
  exit


  adva-825:configure snmp
    add target-address "secondary" "8.8.8.8:162" ipv4 1500 3 "trap" "traphost" enabled
  exit


  adva-825:network-element ne-1
    prompt "NE-1"
    name "LABBRMCO4P001"
    contact "Level 3"
    location ""
    pm-interval 15min
    admin-state in-service
  exit


  adva-825:network-element ne-1
    configure psu psu-1-1-1
      admin-state in-service
      alias ""
    exit
  exit



  adva-825:network-element ne-1
    configure psu psu-1-1-2
      admin-state in-service
      alias ""
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      admin-state in-service
      alias "LABBRMCO4P001"
      snmp-dying-gasp enabled
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure dcn
        admin-state in-service
        alias ""
        mdix auto
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        configure flow flow-1-1-1-3-1
          eompls-pw none outer-vlantag none
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        configure flow flow-1-1-1-4-1
          eompls-pw none outer-vlantag none
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        configure flow flow-1-1-1-5-1
          eompls-pw none outer-vlantag none
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          eompls-pw none outer-vlantag prio_map_profile-1
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        admin-state unassigned
        service-type evpl
        auto-diagnostic disabled
        media fiber auto-1000-full
        port-shaped-speed 0
        port-shaping disabled
        lpbk
          inner-vlan1-control disabled
          outer-vlan1-control disabled
          inner-vlan2-control disabled
          outer-vlan2-control disabled
          inner-vlan3-control disabled
          outer-vlan3-control disabled
          exit
        efm-oam
          oam-control disabled
          oam-local-mode oam-active
          exit
        llf
          llf-control disabled
          llf-trigger-event none

          llf-tx-action-type no-action
          llf-delay 0
          local-link-id 3
          remote-link-ids none
          exit
        lpbk
          block enabled
          dst-mac-control disabled
          src-mac-control disabled
          outer-vlan1 4094-0
          inner-vlan1 4094-0
          outer-vlan2 4094-1
          inner-vlan2 4094-1
          outer-vlan3 4094-2
          inner-vlan3 4094-2
          lpbk-timer 10
          jdsu-lpbk-control disabled
          swap-sada none
          exit
        alias "marcus test ap"
        mtu 9600
        afp all-afp
        qinq-ethertype 0x0
        pcp-mode none
        rx-dei-action use
        rx-dei-tag-type ctag-or-stag
        tx-dei-action mark-color
        tx-dei-tag-type stag
        port-vlan-id 3-0
        n2a-vlan-trunking enabled
        a2n-push-port-vid disabled
        n2a-pop-port-vid disabled
        priority-mapping-profile prio_map_profile-1
        a2n-swap-priority-vid disabled
        n2a-swap-priority-vid disabled
        swap-priority-vid 1
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        cpd-filter l2pt-tunnel-mac 01:00:0c:cd:cd:d0
        cpd-filter isl discard
        cpd-filter pagp pass-thru
        cpd-filter udld pass-thru
        cpd-filter cdp pass-thru
        cpd-filter vtp pass-thru
        cpd-filter dtp pass-thru
        cpd-filter pvstp+ pass-thru
        cpd-filter uplinkfast pass-thru
        cpd-filter vlan-bridge pass-thru
        cpd-filter l2pt pass-thru
        cpd-filter bpdu pass-thru
        cpd-filter pause pass-thru
        cpd-filter lacp pass-thru
        cpd-filter lacp-marker pass-thru
        cpd-filter efm-oam discard
        cpd-filter ssm discard
        cpd-filter port-authen pass-thru
        cpd-filter lan-bridges pass-thru
        cpd-filter gmrp pass-thru
        cpd-filter gvrp pass-thru
        cpd-filter garp pass-thru
        cpd-filter elmi pass-thru
        cpd-filter 01-80-c2-00-00-00 discard
        cpd-filter 01-80-c2-00-00-01 discard
        cpd-filter 01-80-c2-00-00-02 discard
        cpd-filter 01-80-c2-00-00-03 discard
        cpd-filter 01-80-c2-00-00-04 discard
        cpd-filter 01-80-c2-00-00-05 discard
        cpd-filter 01-80-c2-00-00-06 discard
        cpd-filter 01-80-c2-00-00-07 discard
        cpd-filter 01-80-c2-00-00-08 discard
        cpd-filter 01-80-c2-00-00-09 discard
        cpd-filter 01-80-c2-00-00-0a discard
        cpd-filter 01-80-c2-00-00-0b discard
        cpd-filter 01-80-c2-00-00-0c discard
        cpd-filter 01-80-c2-00-00-0d discard
        cpd-filter 01-80-c2-00-00-0e discard
        cpd-filter 01-80-c2-00-00-0f discard
        cpd-filter nearest-lldp discard
        cpd-filter non-tpmr-lldp discard
        cpd-filter customer-lldp discard
        clb 1
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        clb 2
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        clb 3
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        clb 4
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        clb 5
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        pm
          set-threshold abrrx 0 15min
          set-threshold abrtx 0 15min
          set-threshold aufd 0 15min
          set-threshold apfd 0 15min
          set-threshold esbf 0 15min
          set-threshold esbp 0 15min
          set-threshold esbs 0 15min
          set-threshold esc 0 15min
          set-threshold escae 37055 15min
          set-threshold esde 37055 15min
          set-threshold esf 37055 15min
          set-threshold esfs 0 15min
          set-threshold esj 0 15min
          set-threshold esmf 0 15min
          set-threshold esmp 0 15min
          set-threshold eso 0 15min
          set-threshold esof 0 15min
          set-threshold esop 37055 15min
          set-threshold esp 0 15min
          set-threshold esp64 0 15min
          set-threshold esp65 0 15min
          set-threshold esp128 0 15min
          set-threshold esp256 0 15min
          set-threshold esp512 0 15min
          set-threshold esp1024 0 15min
          set-threshold esp1519 0 15min
          set-threshold esuf 0 15min
          set-threshold esup 37055 15min
          set-threshold l2cpfd 0 15min
          set-threshold l2cpfp 0 15min
          set-threshold l2ptfe 0 15min
          set-threshold l2ptfd 0 15min
          set-threshold lbc 0 15min
          set-threshold opr -80 15min
          set-threshold opr-variance 4 15min
          set-threshold opt -80 15min
          set-threshold opt-variance 4 15min
          set-threshold temp 0 15min
          set-threshold uas 10 15min
          set-threshold ibrmaxrx 0 15min
          set-threshold ibrmaxtx 0 15min
          set-threshold ibrminrx 0 15min
          set-threshold ibrmintx 0 15min
          set-threshold ibrrx 0 15min
          set-threshold ibrtx 0 15min
          set-threshold acl-not-match 0 15min
          set-threshold acl-foward-to-cpu 0 15min
          set-threshold dhcp-drop-no-interface 0 15min
          set-threshold abrrx 0 1day
          set-threshold abrtx 0 1day
          set-threshold aufd 0 1day
          set-threshold apfd 0 1day
          set-threshold esbf 0 1day
          set-threshold esbp 0 1day
          set-threshold esbs 0 1day
          set-threshold esc 0 1day
          set-threshold escae 3557280 1day
          set-threshold esde 3557280 1day
          set-threshold esf 3557280 1day
          set-threshold esfs 0 1day
          set-threshold esj 0 1day
          set-threshold esmf 0 1day
          set-threshold esmp 0 1day
          set-threshold eso 0 1day
          set-threshold esof 0 1day
          set-threshold esop 3557280 1day
          set-threshold esp 0 1day
          set-threshold esp64 0 1day
          set-threshold esp65 0 1day
          set-threshold esp128 0 1day
          set-threshold esp256 0 1day
          set-threshold esp512 0 1day
          set-threshold esp1024 0 1day
          set-threshold esp1519 0 1day
          set-threshold esuf 0 1day
          set-threshold esup 3557280 1day
          set-threshold l2cpfd 0 1day
          set-threshold l2cpfp 0 1day
          set-threshold l2ptfe 0 1day
          set-threshold l2ptfd 0 1day
          set-threshold lbc 0 1day
          set-threshold opr -80 1day
          set-threshold opr-variance 4 1day
          set-threshold opt -80 1day
          set-threshold opt-variance 4 1day
          set-threshold temp 0 1day
          set-threshold uas 10 1day
          set-threshold ibrmaxrx 0 1day
          set-threshold ibrmaxtx 0 1day
          set-threshold ibrminrx 0 1day
          set-threshold ibrmintx 0 1day
          set-threshold ibrrx 0 1day
          set-threshold ibrtx 0 1day
          set-threshold acl-not-match 0 1day
          set-threshold acl-foward-to-cpu 0 1day
          set-threshold dhcp-drop-no-interface 0 1day
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        admin-state unassigned
        service-type epl
        port-shaped-speed 0
        port-shaping disabled
        mdix auto
        lpbk
          inner-vlan1-control disabled
          outer-vlan1-control disabled
          inner-vlan2-control disabled
          outer-vlan2-control disabled
          inner-vlan3-control disabled
          outer-vlan3-control disabled
          exit
        efm-oam
          oam-control disabled
          oam-local-mode oam-active
          exit
        llf
          llf-control disabled
          llf-trigger-event none
          llf-tx-action-type no-action
          llf-delay 0
          local-link-id 4
          remote-link-ids none
          exit
        lpbk
          block enabled
          dst-mac-control disabled
          src-mac-control disabled
          outer-vlan1 4094-0
          inner-vlan1 4094-0
          outer-vlan2 4094-1
          inner-vlan2 4094-1
          outer-vlan3 4094-2
          inner-vlan3 4094-2
          lpbk-timer 10
          jdsu-lpbk-control disabled
          swap-sada none
          exit
        alias ""
        auto-diagnostic enabled
        mtu 9600
        afp all-afp
        rx-pause disabled
        tx-pause disabled
        qinq-ethertype 0x0
        pcp-mode none
        rx-dei-action use
        rx-dei-tag-type ctag-or-stag
        tx-dei-action mark-color
        tx-dei-tag-type stag
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        cpd-filter l2pt-tunnel-mac 01:00:0c:cd:cd:d0
        cpd-filter isl pass-thru
        cpd-filter pagp pass-thru
        cpd-filter udld pass-thru
        cpd-filter cdp pass-thru
        cpd-filter vtp pass-thru
        cpd-filter dtp pass-thru
        cpd-filter pvstp+ pass-thru
        cpd-filter uplinkfast pass-thru
        cpd-filter vlan-bridge pass-thru
        cpd-filter l2pt pass-thru
        cpd-filter bpdu pass-thru
        cpd-filter pause pass-thru
        cpd-filter lacp pass-thru
        cpd-filter lacp-marker pass-thru
        cpd-filter efm-oam discard
        cpd-filter ssm discard
        cpd-filter port-authen pass-thru
        cpd-filter lan-bridges pass-thru
        cpd-filter gmrp pass-thru
        cpd-filter gvrp pass-thru
        cpd-filter garp pass-thru
        cpd-filter elmi pass-thru
        cpd-filter 01-80-c2-00-00-00 pass-thru
        cpd-filter 01-80-c2-00-00-01 discard
        cpd-filter 01-80-c2-00-00-02 discard
        cpd-filter 01-80-c2-00-00-03 discard
        cpd-filter 01-80-c2-00-00-04 discard
        cpd-filter 01-80-c2-00-00-05 discard
        cpd-filter 01-80-c2-00-00-06 discard
        cpd-filter 01-80-c2-00-00-07 discard
        cpd-filter 01-80-c2-00-00-08 discard
        cpd-filter 01-80-c2-00-00-09 discard
        cpd-filter 01-80-c2-00-00-0a discard
        cpd-filter 01-80-c2-00-00-0b pass-thru
        cpd-filter 01-80-c2-00-00-0c pass-thru
        cpd-filter 01-80-c2-00-00-0d pass-thru
        cpd-filter 01-80-c2-00-00-0e discard
        cpd-filter 01-80-c2-00-00-0f pass-thru
        cpd-filter nearest-lldp discard
        cpd-filter non-tpmr-lldp discard
        cpd-filter customer-lldp discard
        clb 1
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        clb 2
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        clb 3
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        clb 4
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        clb 5
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        pm
          set-threshold abrrx 0 15min
          set-threshold abrtx 0 15min
          set-threshold aufd 0 15min
          set-threshold apfd 0 15min
          set-threshold esbf 0 15min
          set-threshold esbp 0 15min
          set-threshold esbs 0 15min
          set-threshold esc 0 15min
          set-threshold escae 37055 15min
          set-threshold esde 37055 15min
          set-threshold esf 37055 15min
          set-threshold esfs 0 15min
          set-threshold esj 0 15min
          set-threshold esmf 0 15min
          set-threshold esmp 0 15min
          set-threshold eso 0 15min
          set-threshold esof 0 15min
          set-threshold esop 37055 15min
          set-threshold esp 0 15min
          set-threshold esp64 0 15min
          set-threshold esp65 0 15min
          set-threshold esp128 0 15min
          set-threshold esp256 0 15min
          set-threshold esp512 0 15min
          set-threshold esp1024 0 15min
          set-threshold esp1519 0 15min
          set-threshold esuf 0 15min
          set-threshold esup 37055 15min
          set-threshold l2cpfd 0 15min
          set-threshold l2cpfp 0 15min
          set-threshold l2ptfe 0 15min
          set-threshold l2ptfd 0 15min
          set-threshold uas 10 15min
          set-threshold ibrmaxrx 0 15min
          set-threshold ibrmaxtx 0 15min
          set-threshold ibrminrx 0 15min
          set-threshold ibrmintx 0 15min
          set-threshold ibrrx 0 15min
          set-threshold ibrtx 0 15min
          set-threshold acl-not-match 0 15min
          set-threshold acl-foward-to-cpu 0 15min
          set-threshold dhcp-drop-no-interface 0 15min
          set-threshold abrrx 0 1day
          set-threshold abrtx 0 1day
          set-threshold aufd 0 1day
          set-threshold apfd 0 1day
          set-threshold esbf 0 1day
          set-threshold esbp 0 1day
          set-threshold esbs 0 1day
          set-threshold esc 0 1day
          set-threshold escae 3557280 1day
          set-threshold esde 3557280 1day
          set-threshold esf 3557280 1day
          set-threshold esfs 0 1day
          set-threshold esj 0 1day
          set-threshold esmf 0 1day
          set-threshold esmp 0 1day
          set-threshold eso 0 1day
          set-threshold esof 0 1day
          set-threshold esop 3557280 1day
          set-threshold esp 0 1day
          set-threshold esp64 0 1day
          set-threshold esp65 0 1day
          set-threshold esp128 0 1day
          set-threshold esp256 0 1day
          set-threshold esp512 0 1day
          set-threshold esp1024 0 1day
          set-threshold esp1519 0 1day
          set-threshold esuf 0 1day
          set-threshold esup 3557280 1day
          set-threshold l2cpfd 0 1day
          set-threshold l2cpfp 0 1day
          set-threshold l2ptfe 0 1day
          set-threshold l2ptfd 0 1day
          set-threshold uas 10 1day
          set-threshold ibrmaxrx 0 1day
          set-threshold ibrmaxtx 0 1day
          set-threshold ibrminrx 0 1day
          set-threshold ibrmintx 0 1day
          set-threshold ibrrx 0 1day
          set-threshold ibrtx 0 1day
          set-threshold acl-not-match 0 1day
          set-threshold acl-foward-to-cpu 0 1day
          set-threshold dhcp-drop-no-interface 0 1day
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        admin-state unassigned
        service-type epl
        port-shaped-speed 0
        port-shaping disabled
        mdix auto
        lpbk
          inner-vlan1-control disabled
          outer-vlan1-control disabled
          inner-vlan2-control disabled
          outer-vlan2-control disabled
          inner-vlan3-control disabled
          outer-vlan3-control disabled
          exit
        efm-oam
          oam-control disabled
          oam-local-mode oam-active
          exit
        llf
          llf-control disabled
          llf-trigger-event none
          llf-tx-action-type no-action
          llf-delay 0
          local-link-id 5
          remote-link-ids none
          exit
        lpbk
          block enabled
          dst-mac-control disabled
          src-mac-control disabled
          outer-vlan1 4094-0
          inner-vlan1 4094-0
          outer-vlan2 4094-1
          inner-vlan2 4094-1

          outer-vlan3 4094-2
          inner-vlan3 4094-2
          lpbk-timer 10
          jdsu-lpbk-control disabled
          swap-sada none
          exit
        alias ""
        auto-diagnostic enabled
        mtu 9600
        afp all-afp
        rx-pause disabled
        tx-pause disabled
        qinq-ethertype 0x0
        pcp-mode none
        rx-dei-action use
        rx-dei-tag-type ctag-or-stag
        tx-dei-action mark-color
        tx-dei-tag-type stag
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        cpd-filter l2pt-tunnel-mac 01:00:0c:cd:cd:d0
        cpd-filter isl pass-thru
        cpd-filter pagp pass-thru
        cpd-filter udld pass-thru
        cpd-filter cdp pass-thru
        cpd-filter vtp pass-thru
        cpd-filter dtp pass-thru
        cpd-filter pvstp+ pass-thru
        cpd-filter uplinkfast pass-thru
        cpd-filter vlan-bridge pass-thru
        cpd-filter l2pt pass-thru
        cpd-filter bpdu pass-thru
        cpd-filter pause pass-thru
        cpd-filter lacp pass-thru
        cpd-filter lacp-marker pass-thru
        cpd-filter efm-oam discard
        cpd-filter ssm discard
        cpd-filter port-authen pass-thru
        cpd-filter lan-bridges pass-thru
        cpd-filter gmrp pass-thru
        cpd-filter gvrp pass-thru
        cpd-filter garp pass-thru
        cpd-filter elmi pass-thru
        cpd-filter 01-80-c2-00-00-00 pass-thru
        cpd-filter 01-80-c2-00-00-01 discard
        cpd-filter 01-80-c2-00-00-02 discard
        cpd-filter 01-80-c2-00-00-03 discard
        cpd-filter 01-80-c2-00-00-04 discard
        cpd-filter 01-80-c2-00-00-05 discard
        cpd-filter 01-80-c2-00-00-06 discard
        cpd-filter 01-80-c2-00-00-07 discard
        cpd-filter 01-80-c2-00-00-08 discard
        cpd-filter 01-80-c2-00-00-09 discard
        cpd-filter 01-80-c2-00-00-0a discard
        cpd-filter 01-80-c2-00-00-0b pass-thru
        cpd-filter 01-80-c2-00-00-0c pass-thru
        cpd-filter 01-80-c2-00-00-0d pass-thru
        cpd-filter 01-80-c2-00-00-0e discard
        cpd-filter 01-80-c2-00-00-0f pass-thru
        cpd-filter nearest-lldp discard
        cpd-filter non-tpmr-lldp discard
        cpd-filter customer-lldp discard
        clb 1
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        clb 2
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        clb 3
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        clb 4
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        clb 5
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        pm
          set-threshold abrrx 0 15min
          set-threshold abrtx 0 15min
          set-threshold aufd 0 15min
          set-threshold apfd 0 15min
          set-threshold esbf 0 15min
          set-threshold esbp 0 15min
          set-threshold esbs 0 15min
          set-threshold esc 0 15min
          set-threshold escae 37055 15min
          set-threshold esde 37055 15min
          set-threshold esf 37055 15min
          set-threshold esfs 0 15min
          set-threshold esj 0 15min
          set-threshold esmf 0 15min
          set-threshold esmp 0 15min
          set-threshold eso 0 15min
          set-threshold esof 0 15min
          set-threshold esop 37055 15min
          set-threshold esp 0 15min
          set-threshold esp64 0 15min
          set-threshold esp65 0 15min
          set-threshold esp128 0 15min
          set-threshold esp256 0 15min
          set-threshold esp512 0 15min
          set-threshold esp1024 0 15min
          set-threshold esp1519 0 15min
          set-threshold esuf 0 15min
          set-threshold esup 37055 15min
          set-threshold l2cpfd 0 15min
          set-threshold l2cpfp 0 15min
          set-threshold l2ptfe 0 15min
          set-threshold l2ptfd 0 15min
          set-threshold uas 10 15min
          set-threshold ibrmaxrx 0 15min
          set-threshold ibrmaxtx 0 15min
          set-threshold ibrminrx 0 15min
          set-threshold ibrmintx 0 15min
          set-threshold ibrrx 0 15min
          set-threshold ibrtx 0 15min
          set-threshold acl-not-match 0 15min
          set-threshold acl-foward-to-cpu 0 15min
          set-threshold dhcp-drop-no-interface 0 15min
          set-threshold abrrx 0 1day
          set-threshold abrtx 0 1day
          set-threshold aufd 0 1day
          set-threshold apfd 0 1day
          set-threshold esbf 0 1day
          set-threshold esbp 0 1day
          set-threshold esbs 0 1day
          set-threshold esc 0 1day
          set-threshold escae 3557280 1day
          set-threshold esde 3557280 1day
          set-threshold esf 3557280 1day
          set-threshold esfs 0 1day
          set-threshold esj 0 1day
          set-threshold esmf 0 1day
          set-threshold esmp 0 1day
          set-threshold eso 0 1day
          set-threshold esof 0 1day
          set-threshold esop 3557280 1day
          set-threshold esp 0 1day
          set-threshold esp64 0 1day
          set-threshold esp65 0 1day
          set-threshold esp128 0 1day
          set-threshold esp256 0 1day
          set-threshold esp512 0 1day
          set-threshold esp1024 0 1day
          set-threshold esp1519 0 1day
          set-threshold esuf 0 1day
          set-threshold esup 3557280 1day
          set-threshold l2cpfd 0 1day
          set-threshold l2cpfp 0 1day
          set-threshold l2ptfe 0 1day
          set-threshold l2ptfd 0 1day
          set-threshold uas 10 1day
          set-threshold ibrmaxrx 0 1day
          set-threshold ibrmaxtx 0 1day
          set-threshold ibrminrx 0 1day
          set-threshold ibrmintx 0 1day
          set-threshold ibrrx 0 1day
          set-threshold ibrtx 0 1day
          set-threshold acl-not-match 0 1day
          set-threshold acl-foward-to-cpu 0 1day
          set-threshold dhcp-drop-no-interface 0 1day
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        admin-state management
        service-type evpl
        port-shaped-speed 0
        port-shaping disabled
        mdix auto
        lpbk
          inner-vlan1-control disabled
          outer-vlan1-control disabled
          inner-vlan2-control disabled
          outer-vlan2-control disabled
          inner-vlan3-control disabled
          outer-vlan3-control disabled
          exit
        efm-oam
          oam-control disabled
          oam-local-mode oam-active
          exit
        llf
          llf-control disabled
          llf-trigger-event none
          llf-tx-action-type no-action
          llf-delay 0
          local-link-id 6
          remote-link-ids none
          exit
        lpbk
          block enabled
          dst-mac-control disabled
          src-mac-control disabled
          outer-vlan1 4094-0
          inner-vlan1 4094-0
          outer-vlan2 4094-1
          inner-vlan2 4094-1
          outer-vlan3 4094-2
          inner-vlan3 4094-2
          lpbk-timer 10
          jdsu-lpbk-control disabled
          swap-sada none
          exit
        alias "Y.1731 Test Port"
        auto-diagnostic enabled
        mtu 9600
        afp tagged-afp
        qinq-ethertype 0x0
        pcp-mode none
        rx-dei-action use
        rx-dei-tag-type ctag-or-stag
        tx-dei-action mark-color
        tx-dei-tag-type stag
        port-vlan-id 6-0
        n2a-vlan-trunking enabled
        a2n-push-port-vid enabled
        n2a-pop-port-vid disabled
        priority-mapping-profile prio_map_profile-1
        a2n-swap-priority-vid disabled
        n2a-swap-priority-vid disabled
        swap-priority-vid 1
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        cpd-filter l2pt-tunnel-mac 01:00:0c:cd:cd:d0
        cpd-filter isl pass-thru
        cpd-filter pagp pass-thru
        cpd-filter udld pass-thru
        cpd-filter cdp pass-thru
        cpd-filter vtp pass-thru
        cpd-filter dtp pass-thru
        cpd-filter pvstp+ pass-thru
        cpd-filter uplinkfast pass-thru
        cpd-filter vlan-bridge pass-thru
        cpd-filter l2pt pass-thru
        cpd-filter bpdu pass-thru
        cpd-filter pause pass-thru
        cpd-filter lacp pass-thru
        cpd-filter lacp-marker pass-thru
        cpd-filter efm-oam discard
        cpd-filter ssm discard
        cpd-filter port-authen pass-thru
        cpd-filter lan-bridges pass-thru
        cpd-filter gmrp pass-thru
        cpd-filter gvrp pass-thru
        cpd-filter garp pass-thru
        cpd-filter elmi pass-thru
        cpd-filter 01-80-c2-00-00-00 discard
        cpd-filter 01-80-c2-00-00-01 discard
        cpd-filter 01-80-c2-00-00-02 discard
        cpd-filter 01-80-c2-00-00-03 discard
        cpd-filter 01-80-c2-00-00-04 discard
        cpd-filter 01-80-c2-00-00-05 discard
        cpd-filter 01-80-c2-00-00-06 discard
        cpd-filter 01-80-c2-00-00-07 discard
        cpd-filter 01-80-c2-00-00-08 discard
        cpd-filter 01-80-c2-00-00-09 discard
        cpd-filter 01-80-c2-00-00-0a discard
        cpd-filter 01-80-c2-00-00-0b discard
        cpd-filter 01-80-c2-00-00-0c discard
        cpd-filter 01-80-c2-00-00-0d discard
        cpd-filter 01-80-c2-00-00-0e discard
        cpd-filter 01-80-c2-00-00-0f discard
        cpd-filter nearest-lldp discard
        cpd-filter non-tpmr-lldp discard
        cpd-filter customer-lldp discard
        clb 1
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        clb 2
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        clb 3
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        clb 4
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        clb 5
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        pm
          set-threshold abrrx 0 15min
          set-threshold abrtx 0 15min
          set-threshold aufd 0 15min
          set-threshold apfd 0 15min
          set-threshold esbf 0 15min
          set-threshold esbp 0 15min
          set-threshold esbs 0 15min
          set-threshold esc 0 15min
          set-threshold escae 37055 15min
          set-threshold esde 37055 15min
          set-threshold esf 37055 15min
          set-threshold esfs 0 15min
          set-threshold esj 0 15min
          set-threshold esmf 0 15min
          set-threshold esmp 0 15min
          set-threshold eso 0 15min
          set-threshold esof 0 15min
          set-threshold esop 37055 15min
          set-threshold esp 0 15min
          set-threshold esp64 0 15min
          set-threshold esp65 0 15min
          set-threshold esp128 0 15min
          set-threshold esp256 0 15min
          set-threshold esp512 0 15min
          set-threshold esp1024 0 15min
          set-threshold esp1519 0 15min
          set-threshold esuf 0 15min
          set-threshold esup 37055 15min
          set-threshold l2cpfd 0 15min
          set-threshold l2cpfp 0 15min
          set-threshold l2ptfe 0 15min
          set-threshold l2ptfd 0 15min
          set-threshold uas 10 15min
          set-threshold ibrmaxrx 0 15min
          set-threshold ibrmaxtx 0 15min
          set-threshold ibrminrx 0 15min
          set-threshold ibrmintx 0 15min
          set-threshold ibrrx 0 15min
          set-threshold ibrtx 0 15min
          set-threshold acl-not-match 0 15min
          set-threshold acl-foward-to-cpu 0 15min
          set-threshold dhcp-drop-no-interface 0 15min
          set-threshold abrrx 0 1day
          set-threshold abrtx 0 1day
          set-threshold aufd 0 1day
          set-threshold apfd 0 1day
          set-threshold esbf 0 1day
          set-threshold esbp 0 1day
          set-threshold esbs 0 1day
          set-threshold esc 0 1day
          set-threshold escae 3557280 1day
          set-threshold esde 3557280 1day
          set-threshold esf 3557280 1day
          set-threshold esfs 0 1day
          set-threshold esj 0 1day
          set-threshold esmf 0 1day
          set-threshold esmp 0 1day
          set-threshold eso 0 1day
          set-threshold esof 0 1day
          set-threshold esop 3557280 1day
          set-threshold esp 0 1day
          set-threshold esp64 0 1day
          set-threshold esp65 0 1day
          set-threshold esp128 0 1day
          set-threshold esp256 0 1day
          set-threshold esp512 0 1day
          set-threshold esp1024 0 1day
          set-threshold esp1519 0 1day
          set-threshold esuf 0 1day
          set-threshold esup 3557280 1day
          set-threshold l2cpfd 0 1day
          set-threshold l2cpfp 0 1day
          set-threshold l2ptfe 0 1day
          set-threshold l2ptfd 0 1day
          set-threshold uas 10 1day
          set-threshold ibrmaxrx 0 1day
          set-threshold ibrmaxtx 0 1day
          set-threshold ibrminrx 0 1day
          set-threshold ibrmintx 0 1day
          set-threshold ibrrx 0 1day
          set-threshold ibrtx 0 1day
          set-threshold acl-not-match 0 1day
          set-threshold acl-foward-to-cpu 0 1day
          set-threshold dhcp-drop-no-interface 0 1day
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-1
        admin-state in-service
        auto-diagnostic disabled
        media fiber auto-1000-full
        port-shaped-speed 0
        port-shaping disabled
        lpbk
          inner-vlan1-control disabled
          outer-vlan1-control disabled
          inner-vlan2-control disabled
          outer-vlan2-control disabled
          inner-vlan3-control disabled
          outer-vlan3-control disabled
          exit
        efm-oam
          oam-control disabled
          oam-local-mode oam-active
          exit
        alias "15/KEFN/100100/LVLC"
        mtu 9638
        qinq-ethertype 0x0
        priority-mapping-profile prio_map_profile-1
        pcp-mode none
        rx-dei-action use
        rx-dei-tag-type ctag-or-stag
        tx-dei-action mark-color
        tx-dei-tag-type stag
        eompls-src-ip-address 0.0.0.0
        lpbk
          block enabled
          dst-mac-control disabled
          src-mac-control disabled
          outer-vlan1 4094-0
          inner-vlan1 4094-0
          outer-vlan2 4094-1
          inner-vlan2 4094-1
          outer-vlan3 4094-2
          inner-vlan3 4094-2
          lpbk-timer 10
          jdsu-lpbk-control disabled
          swap-sada none
          exit
        llf
          llf-control disabled
          llf-trigger-event none
          llf-tx-action-type no-action
          llf-delay 0
          local-link-id 1
          remote-link-ids none
          delay-asymmetry 0
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-1
        cpd-filter isl pass-thru
        cpd-filter pagp pass-thru
        cpd-filter udld pass-thru
        cpd-filter cdp pass-thru
        cpd-filter vtp pass-thru
        cpd-filter dtp pass-thru
        cpd-filter pvstp+ pass-thru
        cpd-filter uplinkfast pass-thru
        cpd-filter vlan-bridge pass-thru
        cpd-filter l2pt pass-thru
        cpd-filter bpdu pass-thru
        cpd-filter pause pass-thru
        cpd-filter lacp pass-thru
        cpd-filter lacp-marker pass-thru
        cpd-filter efm-oam discard
        cpd-filter ssm discard
        cpd-filter port-authen pass-thru
        cpd-filter lan-bridges pass-thru
        cpd-filter gmrp pass-thru
        cpd-filter gvrp pass-thru
        cpd-filter garp pass-thru
        cpd-filter elmi pass-thru
        cpd-filter 01-80-c2-00-00-00 discard
        cpd-filter 01-80-c2-00-00-01 discard
        cpd-filter 01-80-c2-00-00-02 discard
        cpd-filter 01-80-c2-00-00-03 discard
        cpd-filter 01-80-c2-00-00-04 discard
        cpd-filter 01-80-c2-00-00-05 discard
        cpd-filter 01-80-c2-00-00-06 discard
        cpd-filter 01-80-c2-00-00-07 discard
        cpd-filter 01-80-c2-00-00-08 discard
        cpd-filter 01-80-c2-00-00-09 discard
        cpd-filter 01-80-c2-00-00-0a discard
        cpd-filter 01-80-c2-00-00-0b discard
        cpd-filter 01-80-c2-00-00-0c discard
        cpd-filter 01-80-c2-00-00-0d discard
        cpd-filter 01-80-c2-00-00-0e discard
        cpd-filter 01-80-c2-00-00-0f discard
        cpd-filter nearest-lldp discard
        cpd-filter non-tpmr-lldp discard
        cpd-filter customer-lldp discard
        clb 1
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-1
        clb 2
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-1
        clb 3
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-1
        clb 4
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-1
        clb 5
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-1
        pm
          set-threshold abrrx 0 15min
          set-threshold abrtx 0 15min
          set-threshold esbf 0 15min
          set-threshold esbp 0 15min
          set-threshold esbs 0 15min
          set-threshold esc 0 15min
          set-threshold escae 37055 15min
          set-threshold esde 37055 15min
          set-threshold esf 37055 15min
          set-threshold esfs 0 15min
          set-threshold esj 0 15min
          set-threshold esmf 0 15min
          set-threshold esmp 0 15min
          set-threshold eso 0 15min
          set-threshold esof 0 15min
          set-threshold esop 37055 15min
          set-threshold esp 0 15min
          set-threshold esp64 0 15min
          set-threshold esp65 0 15min
          set-threshold esp128 0 15min
          set-threshold esp256 0 15min
          set-threshold esp512 0 15min
          set-threshold esp1024 0 15min
          set-threshold esp1519 0 15min
          set-threshold esuf 0 15min
          set-threshold esup 37055 15min
          set-threshold l2cpfd 0 15min
          set-threshold l2cpfp 0 15min
          set-threshold lbc 0 15min
          set-threshold opr -80 15min
          set-threshold opr-variance 4 15min
          set-threshold opt -80 15min
          set-threshold opt-variance 4 15min
          set-threshold psc 0 15min
          set-threshold temp 0 15min
          set-threshold uas 10 15min
          set-threshold pbbunibdadiscard 0 15min
          set-threshold pbbgrpbdadiscard 0 15min
          set-threshold ibrmaxrx 0 15min
          set-threshold ibrmaxtx 0 15min
          set-threshold ibrminrx 0 15min
          set-threshold ibrmintx 0 15min
          set-threshold ibrrx 0 15min
          set-threshold ibrtx 0 15min
          set-threshold acl-not-match 0 15min
          set-threshold acl-foward-to-cpu 0 15min
          set-threshold dhcp-drop-no-interface 0 15min
          set-threshold abrrx 0 1day
          set-threshold abrtx 0 1day
          set-threshold esbf 0 1day
          set-threshold esbp 0 1day
          set-threshold esbs 0 1day
          set-threshold esc 0 1day
          set-threshold escae 3557280 1day
          set-threshold esde 3557280 1day
          set-threshold esf 3557280 1day
          set-threshold esfs 0 1day
          set-threshold esj 0 1day
          set-threshold esmf 0 1day
          set-threshold esmp 0 1day
          set-threshold eso 0 1day
          set-threshold esof 0 1day
          set-threshold esop 3557280 1day
          set-threshold esp 0 1day
          set-threshold esp64 0 1day
          set-threshold esp65 0 1day
          set-threshold esp128 0 1day
          set-threshold esp256 0 1day
          set-threshold esp512 0 1day
          set-threshold esp1024 0 1day
          set-threshold esp1519 0 1day
          set-threshold esuf 0 1day
          set-threshold esup 3557280 1day
          set-threshold l2cpfd 0 1day
          set-threshold l2cpfp 0 1day
          set-threshold lbc 0 1day
          set-threshold opr -80 1day
          set-threshold opr-variance 4 1day
          set-threshold opt -80 1day
          set-threshold opt-variance 4 1day
          set-threshold psc 0 1day
          set-threshold temp 0 1day
          set-threshold uas 10 1day
          set-threshold pbbunibdadiscard 0 1day
          set-threshold pbbgrpbdadiscard 0 1day
          set-threshold ibrmaxrx 0 1day
          set-threshold ibrmaxtx 0 1day
          set-threshold ibrminrx 0 1day
          set-threshold ibrmintx 0 1day
          set-threshold ibrrx 0 1day
          set-threshold ibrtx 0 1day
          set-threshold acl-not-match 0 1day
          set-threshold acl-foward-to-cpu 0 1day
          set-threshold dhcp-drop-no-interface 0 1day
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-2
        admin-state unassigned
        media copper auto
        port-shaped-speed 0
        port-shaping disabled
        mdix auto
        lpbk
          inner-vlan1-control disabled
          outer-vlan1-control disabled
          inner-vlan2-control disabled
          outer-vlan2-control disabled
          inner-vlan3-control disabled
          outer-vlan3-control disabled
          exit
        efm-oam
          oam-control disabled
          oam-local-mode oam-active
          exit
        alias ""
        auto-diagnostic enabled
        mtu 9638
        qinq-ethertype 0x0
        priority-mapping-profile prio_map_profile-1
        pcp-mode none
        rx-dei-action use
        rx-dei-tag-type ctag-or-stag
        tx-dei-action mark-color
        tx-dei-tag-type stag
        eompls-src-ip-address 0.0.0.0
        lpbk
          block enabled
          dst-mac-control disabled
          src-mac-control disabled
          outer-vlan1 4094-0
          inner-vlan1 4094-0
          outer-vlan2 4094-1
          inner-vlan2 4094-1
          outer-vlan3 4094-2
          inner-vlan3 4094-2
          lpbk-timer 10
          jdsu-lpbk-control disabled
          swap-sada none
          exit
        llf
          llf-control disabled
          llf-trigger-event none
          llf-tx-action-type no-action
          llf-delay 0
          local-link-id 2
          remote-link-ids none
          delay-asymmetry 0
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-2
        cpd-filter isl pass-thru
        cpd-filter pagp pass-thru
        cpd-filter udld pass-thru
        cpd-filter cdp pass-thru
        cpd-filter vtp pass-thru
        cpd-filter dtp pass-thru
        cpd-filter pvstp+ pass-thru
        cpd-filter uplinkfast pass-thru
        cpd-filter vlan-bridge pass-thru
        cpd-filter l2pt pass-thru
        cpd-filter bpdu pass-thru
        cpd-filter pause pass-thru
        cpd-filter lacp pass-thru
        cpd-filter lacp-marker pass-thru
        cpd-filter efm-oam discard
        cpd-filter ssm discard
        cpd-filter port-authen pass-thru
        cpd-filter lan-bridges pass-thru
        cpd-filter gmrp pass-thru
        cpd-filter gvrp pass-thru
        cpd-filter garp pass-thru
        cpd-filter elmi pass-thru
        cpd-filter 01-80-c2-00-00-00 discard
        cpd-filter 01-80-c2-00-00-01 discard
        cpd-filter 01-80-c2-00-00-02 discard
        cpd-filter 01-80-c2-00-00-03 discard
        cpd-filter 01-80-c2-00-00-04 discard
        cpd-filter 01-80-c2-00-00-05 discard
        cpd-filter 01-80-c2-00-00-06 discard
        cpd-filter 01-80-c2-00-00-07 discard
        cpd-filter 01-80-c2-00-00-08 discard
        cpd-filter 01-80-c2-00-00-09 discard
        cpd-filter 01-80-c2-00-00-0a discard
        cpd-filter 01-80-c2-00-00-0b discard
        cpd-filter 01-80-c2-00-00-0c discard
        cpd-filter 01-80-c2-00-00-0d discard
        cpd-filter 01-80-c2-00-00-0e discard
        cpd-filter 01-80-c2-00-00-0f discard
        cpd-filter nearest-lldp discard
        cpd-filter non-tpmr-lldp discard
        cpd-filter customer-lldp discard
        clb 1
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-2
        clb 2
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-2
        clb 3
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-2
        clb 4
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-2
        clb 5
          length 0.10
          description ""
          control disabled
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-2
        pm
          set-threshold abrrx 0 15min
          set-threshold abrtx 0 15min
          set-threshold esbf 0 15min
          set-threshold esbp 0 15min
          set-threshold esbs 0 15min
          set-threshold esc 0 15min
          set-threshold escae 37055 15min
          set-threshold esde 37055 15min
          set-threshold esf 37055 15min
          set-threshold esfs 0 15min
          set-threshold esj 0 15min
          set-threshold esmf 0 15min
          set-threshold esmp 0 15min
          set-threshold eso 0 15min
          set-threshold esof 0 15min
          set-threshold esop 37055 15min
          set-threshold esp 0 15min
          set-threshold esp64 0 15min
          set-threshold esp65 0 15min
          set-threshold esp128 0 15min
          set-threshold esp256 0 15min
          set-threshold esp512 0 15min
          set-threshold esp1024 0 15min
          set-threshold esp1519 0 15min
          set-threshold esuf 0 15min
          set-threshold esup 37055 15min
          set-threshold l2cpfd 0 15min
          set-threshold l2cpfp 0 15min
          set-threshold psc 0 15min
          set-threshold uas 10 15min
          set-threshold pbbunibdadiscard 0 15min
          set-threshold pbbgrpbdadiscard 0 15min
          set-threshold ibrmaxrx 0 15min
          set-threshold ibrmaxtx 0 15min
          set-threshold ibrminrx 0 15min
          set-threshold ibrmintx 0 15min
          set-threshold ibrrx 0 15min
          set-threshold ibrtx 0 15min
          set-threshold acl-not-match 0 15min
          set-threshold acl-foward-to-cpu 0 15min
          set-threshold dhcp-drop-no-interface 0 15min
          set-threshold abrrx 0 1day
          set-threshold abrtx 0 1day
          set-threshold esbf 0 1day
          set-threshold esbp 0 1day
          set-threshold esbs 0 1day
          set-threshold esc 0 1day
          set-threshold escae 3557280 1day
          set-threshold esde 3557280 1day
          set-threshold esf 3557280 1day
          set-threshold esfs 0 1day
          set-threshold esj 0 1day
          set-threshold esmf 0 1day
          set-threshold esmp 0 1day
          set-threshold eso 0 1day
          set-threshold esof 0 1day
          set-threshold esop 3557280 1day
          set-threshold esp 0 1day
          set-threshold esp64 0 1day
          set-threshold esp65 0 1day
          set-threshold esp128 0 1day
          set-threshold esp256 0 1day
          set-threshold esp512 0 1day
          set-threshold esp1024 0 1day
          set-threshold esp1519 0 1day
          set-threshold esuf 0 1day
          set-threshold esup 3557280 1day
          set-threshold l2cpfd 0 1day
          set-threshold l2cpfp 0 1day
          set-threshold psc 0 1day
          set-threshold uas 10 1day
          set-threshold pbbunibdadiscard 0 1day
          set-threshold pbbgrpbdadiscard 0 1day
          set-threshold ibrmaxrx 0 1day
          set-threshold ibrmaxtx 0 1day
          set-threshold ibrminrx 0 1day
          set-threshold ibrmintx 0 1day
          set-threshold ibrrx 0 1day
          set-threshold ibrtx 0 1day
          set-threshold acl-not-match 0 1day
          set-threshold acl-foward-to-cpu 0 1day
          set-threshold dhcp-drop-no-interface 0 1day
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        elmi
          elmi-control disabled
          n393 4
          t392 15
          async-status enabled
          min-async-status-interval 1
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        elmi
          elmi-control disabled
          n393 4
          t392 15
          async-status enabled
          min-async-status-interval 1
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        elmi
          elmi-control disabled
          n393 4
          t392 15
          async-status enabled
          min-async-status-interval 1
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        elmi
          elmi-control disabled
          n393 4
          t392 15
          async-status enabled
          min-async-status-interval 1
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-1
        elmi
          elmi-control disabled
          n393 4
          t392 15
          async-status enabled
          min-async-status-interval 1
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-2
        elmi
          elmi-control disabled
          n393 4
          t392 15
          async-status enabled
          min-async-status-interval 1
        exit
      exit
    exit
  exit


  adva-825:configure system
    ecpa-streams 1
      stream-name "stream-1"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit


  adva-825:configure system
    ecpa-streams 2
      stream-name "stream-2"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit


  adva-825:configure system
    ecpa-streams 3
      stream-name "stream-3"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit


  adva-825:configure system
    ecpa-streams 4
      stream-name "stream-4"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit


  adva-825:configure system
    ecpa-streams 5
      stream-name "stream-5"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit

  adva-825:configure system
    ecpa-streams 6
      stream-name "stream-6"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit


  adva-825:configure system
    ecpa-streams 7
      stream-name "stream-7"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit


  adva-825:configure system
    ecpa-streams 8
      stream-name "stream-8"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit


  adva-825:configure system
    ecpa-streams 9
      stream-name "stream-9"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit


  adva-825:configure system
    ecpa-streams 10
      stream-name "stream-10"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit


  adva-825:configure system
    ecpa-streams 11
      stream-name "stream-11"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit

  adva-825:configure system
    ecpa-streams 12
      stream-name "stream-12"
      framesize 64
      rate 10048000
      payload-type fixed
      dest-mac 00:80:ea:00:00:01
      outer-vlan-control disabled
      outer-vlan-tag 4094-1
      outer-vlan-ethertype 0x8100
      inner-vlan1-control disabled
      inner-vlan1-tag 4094-1
      inner-vlan1-ethertype 0x8100
      inner-vlan2-control disabled
      inner-vlan2-tag 4094-1
      inner-vlan2-ethertype 0x8100
      ip-version ipv4
      source-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      target-addr ipv4 0.0.0.0
      target-addr ipv6 0000:0000:0000:0000:0000:0000:0000:0000
      ip-precedence-mode none 0
      use-port-src-mac enabled
    exit
  exit

  adva-825:network-element ne-1
    configure tm-params bwp-mode line-rate

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      ecpa-ctrl
        src-port access-1-1-1-3
        inject-direction a2n
        monitor-direction n2a
        test-type duration
        test-duration 00:00:00:10
        test-num-frames 1
        test-stream-a 0
        test-stream-b 0
        test-stream-c 0
      exit
    exit
  exit


  adva-825:configure communication
    add mgmttunnel 1  "ADVA" network-1-1-1-1 ethernet vlan-based ipv4-only enabled 505 disabled 64000 768000
    configure mgmttnl mgmt_tnl-1
      dhcp-control disabled 10.241.47.23 255.255.255.240
      exit
    configure mgmttnl mgmt_tnl-1
      buffer-size 32
      cos 7
      exit
    configure mgmttnl mgmt_tnl-1
      rip2Pkts-control disabled
      dhcp-client-id-control disabled
      dhcp-class-id-control enabled
      dhcp-host-name-control enabled
      dhcp-log-server-control disabled
      dhcp-ntp-server-control disabled
      dhcp-client-id-type mac-addr
      dhcp-host-name-type system-name
    exit
  exit

  adva-825:configure communication
    configure eth0 ip-mode ipv4-only
    configure eth0 dhcp-control disabled 1.1.1.115 255.255.255.0
    configure eth0 dhcp-role dhcp-client
    configure eth0 dhcp-client-id-type mac-addr
    configure eth0 dhcp-class-id-control enabled
    configure eth0 dhcp-host-name-control enabled
    configure eth0 dhcp-host-name-type system-name
    configure eth0 dhcp-log-server-control disabled
    configure eth0 dhcp-ntp-server-control disabled
    configure eth0 rip2Pkts-control disabled
  exit

  adva-825:configure communication
    configure src-addr sys-ip-addr "ADVA" "ADVA"
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        add flow flow-1-1-1-3-1 "marcus test flow 3-1" regular-evc enabled disabled disabled disabled 0 disabled push 100-5 disabled none "0:4095" 256000 194304000 eompls-pw none none access-interface access-1-1-1-3 network-interface network-1-1-1-1 flow-based
        configure flow flow-1-1-1-3-1
          maximum-flow-bandwidth 6400
          guaranteed-flow-bandwidth 0
          es-frame-loss-threshold 1
          ses-frame-loss-threshold-ratio 30
          policing enabled
          policing-control a2n-n2a
          n2a-outertag-prio-ctrl disabled
          access-learning-ctrl none
          network-learning-ctrl none
          access-max-forwarding-entries 4096
          network-max-forwarding-entries 4096
          protect-access-learning none
          protect-network-learning none
          aging-timer 300
          table-full-action forward
          n2n-forwarding disabled
          a2n-multicast-rate-limit-ctrl disabled
          a2n-broadcast-rate-limit-ctrl disabled
          a2n-combined-rate-limit-ctrl disabled
          cpd-filter isl pass-thru
          cpd-filter pagp pass-thru
          cpd-filter udld pass-thru
          cpd-filter cdp pass-thru
          cpd-filter vtp pass-thru
          cpd-filter dtp pass-thru
          cpd-filter pvstp+ pass-thru
          cpd-filter uplinkfast pass-thru
          cpd-filter vlan-bridge pass-thru
          cpd-filter l2pt pass-thru
          cpd-filter bpdu pass-thru
          cpd-filter pause pass-thru
          cpd-filter lacp pass-thru
          cpd-filter lacp-marker pass-thru
          cpd-filter efm-oam pass-thru
          cpd-filter ssm discard
          cpd-filter port-authen pass-thru
          cpd-filter lan-bridges pass-thru
          cpd-filter gmrp pass-thru
          cpd-filter gvrp pass-thru
          cpd-filter garp pass-thru
          cpd-filter elmi pass-thru
          cpd-filter 01-80-c2-00-00-00 discard
          cpd-filter 01-80-c2-00-00-01 discard
          cpd-filter 01-80-c2-00-00-02 discard
          cpd-filter 01-80-c2-00-00-03 discard
          cpd-filter 01-80-c2-00-00-04 discard
          cpd-filter 01-80-c2-00-00-05 discard
          cpd-filter 01-80-c2-00-00-06 discard
          cpd-filter 01-80-c2-00-00-07 discard
          cpd-filter 01-80-c2-00-00-08 discard
          cpd-filter 01-80-c2-00-00-09 discard
          cpd-filter 01-80-c2-00-00-0a discard
          cpd-filter 01-80-c2-00-00-0b discard
          cpd-filter 01-80-c2-00-00-0c discard
          cpd-filter 01-80-c2-00-00-0d discard
          cpd-filter 01-80-c2-00-00-0e discard
          cpd-filter 01-80-c2-00-00-0f discard
          cpd-filter nearest-lldp discard
          cpd-filter non-tpmr-lldp discard
          cpd-filter customer-lldp discard
          pm
            set-threshold abra2n 0 15min
            set-threshold abrrla2n 0 15min
            set-threshold abrn2a 0 15min
            set-threshold abrrln2a 0 15min
            set-threshold l2cpfd 0 15min
            set-threshold bytesina2n 0 15min
            set-threshold bytesinn2a 0 15min
            set-threshold bytesouta2n 0 15min
            set-threshold bytesoutn2a 0 15min
            set-threshold fmga2n 0 15min
            set-threshold fmgn2a 0 15min
            set-threshold fmrda2n 0 15min
            set-threshold fmrdn2a 0 15min
            set-threshold fmya2n 0 15min
            set-threshold fmyn2a 0 15min
            set-threshold ftda2n 0 15min
            set-threshold ses 0 15min
            set-threshold uas 10 15min
            set-threshold fdhairpin 0 15min
            set-threshold fdstaticblock 0 15min
            set-threshold learntblentrydiscards 0 15min
            set-threshold numlearntblflushes 0 15min
            set-threshold ibra2nmax 0 15min
            set-threshold ibrrla2nmax 0 15min
            set-threshold ibra2nmin 0 15min
            set-threshold ibrrla2nmin 0 15min
            set-threshold ibra2n 0 15min
            set-threshold ibrrla2n 0 15min
            set-threshold ibrn2amax 0 15min
            set-threshold ibrrln2amax 0 15min
            set-threshold ibrn2amin 0 15min
            set-threshold ibrrln2amin 0 15min
            set-threshold ibrn2a 0 15min
            set-threshold ibrrln2a 0 15min
            set-threshold fmcd 0 15min
            set-threshold fbcd 0 15min
            set-threshold acl-a2n-drop 0 15min
            set-threshold acl-n2a-drop 0 15min
            set-threshold abra2n 0 1day
            set-threshold abrrla2n 0 1day
            set-threshold abrn2a 0 1day
            set-threshold abrrln2a 0 1day
            set-threshold l2cpfd 0 1day
            set-threshold bytesina2n 0 1day
            set-threshold bytesinn2a 0 1day
            set-threshold bytesouta2n 0 1day
            set-threshold bytesoutn2a 0 1day
            set-threshold fmga2n 0 1day
            set-threshold fmgn2a 0 1day
            set-threshold fmrda2n 0 1day
            set-threshold fmrdn2a 0 1day
            set-threshold fmya2n 0 1day
            set-threshold fmyn2a 0 1day
            set-threshold ftda2n 0 1day
            set-threshold ses 0 1day
            set-threshold uas 10 1day
            set-threshold fdhairpin 0 1day
            set-threshold fdstaticblock 0 1day
            set-threshold learntblentrydiscards 0 1day
            set-threshold numlearntblflushes 0 1day
            set-threshold ibra2nmax 0 1day
            set-threshold ibrrla2nmax 0 1day
            set-threshold ibra2nmin 0 1day
            set-threshold ibrrla2nmin 0 1day
            set-threshold ibra2n 0 1day
            set-threshold ibrrla2n 0 1day
            set-threshold ibrn2amax 0 1day
            set-threshold ibrrln2amax 0 1day
            set-threshold ibrn2amin 0 1day
            set-threshold ibrrln2amin 0 1day
            set-threshold ibrn2a 0 1day
            set-threshold ibrrln2a 0 1day
            set-threshold fmcd 0 1day
            set-threshold fbcd 0 1day
            set-threshold acl-a2n-drop 0 1day
            set-threshold acl-n2a-drop 0 1day
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        configure flow flow-1-1-1-3-1
          configure a2n-shaper a2n_shaper-1-1-1-3-1-0
            buffersize 128
            exit
          configure a2n-shaper a2n_shaper-1-1-1-3-1-0
            soam-cir 0
            soam-eir 0
            max-drop-probability-green 100
            max-threshold-green 100
            min-threshold-green 100
            max-drop-probability-yellow 100
            max-threshold-yellow 75
            min-threshold-yellow 75
            exit
          configure a2n-shaper a2n_shaper-1-1-1-3-1-0
            pm
              set-threshold bt 0 15min
              set-threshold btd 0 15min
              set-threshold fd 0 15min
              set-threshold ftd 0 15min
              set-threshold abrrl 0 15min
              set-threshold bredd 0 15min
              set-threshold fredd 0 15min
              set-threshold bt 0 1day
              set-threshold btd 0 1day
              set-threshold fd 0 1day
              set-threshold ftd 0 1day
              set-threshold abrrl 0 1day
              set-threshold bredd 0 1day
              set-threshold fredd 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        configure flow flow-1-1-1-3-1
          configure a2n-policer a2n_policer-1-1-1-3-1-0
            cir 256000
            cbs 1
            eir 194304000
            ebs 3
            color-marking enabled
            color-mode color-aware
            coupling-flag enabled
            exit
          configure a2n-policer a2n_policer-1-1-1-3-1-0
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        configure flow flow-1-1-1-3-1
          configure n2a-policer n2a_policer-1-1-1-3-1-0
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        configure n2a-shaper port_n2a_shaper-1-1-1-3-0
          buffersize 1
          soam-cir 0
          soam-eir 0
          max-drop-probability-green 100
          max-threshold-green 100
          min-threshold-green 100
          max-drop-probability-yellow 100
          max-threshold-yellow 75
          min-threshold-yellow 75
          pm
            set-threshold bt 0 15min
            set-threshold btd 0 15min
            set-threshold fd 0 15min
            set-threshold ftd 0 15min
            set-threshold abrrl 0 15min
            set-threshold bredd 0 15min
            set-threshold fredd 0 15min
            set-threshold bt 0 1day
            set-threshold btd 0 1day
            set-threshold fd 0 1day
            set-threshold ftd 0 1day
            set-threshold abrrl 0 1day
            set-threshold bredd 0 1day
            set-threshold fredd 0 1day
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        configure flow flow-1-1-1-4-1
          circuit-name ""
          es-frame-loss-threshold 1
          ses-frame-loss-threshold-ratio 30
          access-interface access-1-1-1-4 network-interface network-1-1-1-1 push 4-0 none
          a2n-shaping-type flow-based
          policing enabled
          policing-control a2n-n2a
          net-to-acc-rate-limiting disabled
          default-cos 0
          priority-mapping-profile none
          access-learning-ctrl none
          network-learning-ctrl none
          access-max-forwarding-entries 4096
          network-max-forwarding-entries 4096
          protect-access-learning none
          protect-network-learning none
          aging-timer 300
          table-full-action forward
          n2n-forwarding disabled
          a2n-multicast-rate-limit-ctrl disabled
          a2n-broadcast-rate-limit-ctrl disabled
          a2n-combined-rate-limit-ctrl disabled
          eompls-pw none
          cpd-filter isl pass-thru
          cpd-filter pagp pass-thru
          cpd-filter udld pass-thru
          cpd-filter cdp pass-thru
          cpd-filter vtp pass-thru
          cpd-filter dtp pass-thru
          cpd-filter pvstp+ pass-thru
          cpd-filter uplinkfast pass-thru
          cpd-filter vlan-bridge pass-thru
          cpd-filter l2pt pass-thru
          cpd-filter bpdu pass-thru
          cpd-filter pause pass-thru
          cpd-filter lacp pass-thru
          cpd-filter lacp-marker pass-thru
          cpd-filter efm-oam pass-thru
          cpd-filter ssm discard
          cpd-filter port-authen pass-thru
          cpd-filter lan-bridges pass-thru
          cpd-filter gmrp pass-thru
          cpd-filter gvrp pass-thru
          cpd-filter garp pass-thru
          cpd-filter elmi pass-thru
          cpd-filter 01-80-c2-00-00-00 discard
          cpd-filter 01-80-c2-00-00-01 discard
          cpd-filter 01-80-c2-00-00-02 discard
          cpd-filter 01-80-c2-00-00-03 discard
          cpd-filter 01-80-c2-00-00-04 discard
          cpd-filter 01-80-c2-00-00-05 discard
          cpd-filter 01-80-c2-00-00-06 discard
          cpd-filter 01-80-c2-00-00-07 discard
          cpd-filter 01-80-c2-00-00-08 discard
          cpd-filter 01-80-c2-00-00-09 discard
          cpd-filter 01-80-c2-00-00-0a discard
          cpd-filter 01-80-c2-00-00-0b discard
          cpd-filter 01-80-c2-00-00-0c discard
          cpd-filter 01-80-c2-00-00-0d discard
          cpd-filter 01-80-c2-00-00-0e discard
          cpd-filter 01-80-c2-00-00-0f discard
          cpd-filter nearest-lldp discard
          cpd-filter non-tpmr-lldp discard
          cpd-filter customer-lldp discard
          pm
            set-threshold abra2n 0 15min
            set-threshold abrrla2n 0 15min
            set-threshold abrn2a 0 15min
            set-threshold abrrln2a 0 15min
            set-threshold l2cpfd 0 15min
            set-threshold bytesina2n 0 15min
            set-threshold bytesinn2a 0 15min
            set-threshold bytesouta2n 0 15min
            set-threshold bytesoutn2a 0 15min
            set-threshold fmga2n 0 15min
            set-threshold fmgn2a 0 15min
            set-threshold fmrda2n 0 15min
            set-threshold fmrdn2a 0 15min
            set-threshold fmya2n 0 15min
            set-threshold fmyn2a 0 15min
            set-threshold ftda2n 0 15min
            set-threshold ses 0 15min
            set-threshold uas 10 15min
            set-threshold fdhairpin 0 15min
            set-threshold fdstaticblock 0 15min
            set-threshold learntblentrydiscards 0 15min
            set-threshold numlearntblflushes 0 15min
            set-threshold ibra2nmax 0 15min
            set-threshold ibrrla2nmax 0 15min
            set-threshold ibra2nmin 0 15min
            set-threshold ibrrla2nmin 0 15min
            set-threshold ibra2n 0 15min
            set-threshold ibrrla2n 0 15min
            set-threshold ibrn2amax 0 15min
            set-threshold ibrrln2amax 0 15min
            set-threshold ibrn2amin 0 15min
            set-threshold ibrrln2amin 0 15min
            set-threshold ibrn2a 0 15min
            set-threshold ibrrln2a 0 15min
            set-threshold fmcd 0 15min
            set-threshold fbcd 0 15min
            set-threshold acl-a2n-drop 0 15min
            set-threshold acl-n2a-drop 0 15min
            set-threshold abra2n 0 1day
            set-threshold abrrla2n 0 1day
            set-threshold abrn2a 0 1day
            set-threshold abrrln2a 0 1day
            set-threshold l2cpfd 0 1day
            set-threshold bytesina2n 0 1day
            set-threshold bytesinn2a 0 1day
            set-threshold bytesouta2n 0 1day
            set-threshold bytesoutn2a 0 1day
            set-threshold fmga2n 0 1day
            set-threshold fmgn2a 0 1day
            set-threshold fmrda2n 0 1day
            set-threshold fmrdn2a 0 1day
            set-threshold fmya2n 0 1day
            set-threshold fmyn2a 0 1day
            set-threshold ftda2n 0 1day
            set-threshold ses 0 1day
            set-threshold uas 10 1day
            set-threshold fdhairpin 0 1day
            set-threshold fdstaticblock 0 1day
            set-threshold learntblentrydiscards 0 1day
            set-threshold numlearntblflushes 0 1day
            set-threshold ibra2nmax 0 1day
            set-threshold ibrrla2nmax 0 1day
            set-threshold ibra2nmin 0 1day
            set-threshold ibrrla2nmin 0 1day
            set-threshold ibra2n 0 1day
            set-threshold ibrrla2n 0 1day
            set-threshold ibrn2amax 0 1day
            set-threshold ibrrln2amax 0 1day
            set-threshold ibrn2amin 0 1day
            set-threshold ibrrln2amin 0 1day
            set-threshold ibrn2a 0 1day
            set-threshold ibrrln2a 0 1day
            set-threshold fmcd 0 1day
            set-threshold fbcd 0 1day
            set-threshold acl-a2n-drop 0 1day
            set-threshold acl-n2a-drop 0 1day
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        configure flow flow-1-1-1-4-1
          configure a2n-shaper a2n_shaper-1-1-1-4-1-0
            buffersize 128
            exit
          configure a2n-shaper a2n_shaper-1-1-1-4-1-0
            soam-cir 0
            soam-eir 0
            max-drop-probability-green 100
            max-threshold-green 100
            min-threshold-green 100
            max-drop-probability-yellow 100
            max-threshold-yellow 75
            min-threshold-yellow 75
            exit
          configure a2n-shaper a2n_shaper-1-1-1-4-1-0
            pm
              set-threshold bt 0 15min
              set-threshold btd 0 15min
              set-threshold fd 0 15min
              set-threshold ftd 0 15min
              set-threshold abrrl 0 15min
              set-threshold bredd 0 15min
              set-threshold fredd 0 15min
              set-threshold bt 0 1day
              set-threshold btd 0 1day
              set-threshold fd 0 1day
              set-threshold ftd 0 1day
              set-threshold abrrl 0 1day
              set-threshold bredd 0 1day
              set-threshold fredd 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        configure flow flow-1-1-1-4-1
          configure a2n-policer a2n_policer-1-1-1-4-1-0
            eir 0
            ebs 0
            cir 0
            cbs 0
            color-marking enabled
            color-mode color-aware
            coupling-flag enabled
            exit
          configure a2n-policer a2n_policer-1-1-1-4-1-0
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        configure flow flow-1-1-1-4-1
          configure n2a-policer n2a_policer-1-1-1-4-1-0
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        configure n2a-shaper port_n2a_shaper-1-1-1-4-0
          buffersize 0
          soam-cir 0
          soam-eir 0
          max-drop-probability-green 100
          max-threshold-green 100
          min-threshold-green 100
          max-drop-probability-yellow 100
          max-threshold-yellow 75
          min-threshold-yellow 75
          pm
            set-threshold bt 0 15min
            set-threshold btd 0 15min
            set-threshold fd 0 15min
            set-threshold ftd 0 15min
            set-threshold abrrl 0 15min
            set-threshold bredd 0 15min
            set-threshold fredd 0 15min
            set-threshold bt 0 1day
            set-threshold btd 0 1day
            set-threshold fd 0 1day
            set-threshold ftd 0 1day
            set-threshold abrrl 0 1day
            set-threshold bredd 0 1day
            set-threshold fredd 0 1day
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        configure flow flow-1-1-1-5-1
          circuit-name ""
          es-frame-loss-threshold 1
          ses-frame-loss-threshold-ratio 30
          access-interface access-1-1-1-5 network-interface network-1-1-1-1 push 5-0 none
          a2n-shaping-type flow-based
          policing enabled
          policing-control a2n-n2a
          net-to-acc-rate-limiting disabled
          default-cos 0
          priority-mapping-profile none
          access-learning-ctrl none
          network-learning-ctrl none
          access-max-forwarding-entries 4096
          network-max-forwarding-entries 4096
          protect-access-learning none
          protect-network-learning none
          aging-timer 300
          table-full-action forward
          n2n-forwarding disabled
          a2n-multicast-rate-limit-ctrl disabled
          a2n-broadcast-rate-limit-ctrl disabled
          a2n-combined-rate-limit-ctrl disabled
          eompls-pw none
          cpd-filter isl pass-thru
          cpd-filter pagp pass-thru
          cpd-filter udld pass-thru
          cpd-filter cdp pass-thru
          cpd-filter vtp pass-thru
          cpd-filter dtp pass-thru
          cpd-filter pvstp+ pass-thru
          cpd-filter uplinkfast pass-thru
          cpd-filter vlan-bridge pass-thru
          cpd-filter l2pt pass-thru
          cpd-filter bpdu pass-thru
          cpd-filter pause pass-thru
          cpd-filter lacp pass-thru
          cpd-filter lacp-marker pass-thru
          cpd-filter efm-oam pass-thru
          cpd-filter ssm discard
          cpd-filter port-authen pass-thru
          cpd-filter lan-bridges pass-thru
          cpd-filter gmrp pass-thru
          cpd-filter gvrp pass-thru
          cpd-filter garp pass-thru
          cpd-filter elmi pass-thru
          cpd-filter 01-80-c2-00-00-00 discard
          cpd-filter 01-80-c2-00-00-01 discard
          cpd-filter 01-80-c2-00-00-02 discard
          cpd-filter 01-80-c2-00-00-03 discard
          cpd-filter 01-80-c2-00-00-04 discard
          cpd-filter 01-80-c2-00-00-05 discard
          cpd-filter 01-80-c2-00-00-06 discard
          cpd-filter 01-80-c2-00-00-07 discard
          cpd-filter 01-80-c2-00-00-08 discard
          cpd-filter 01-80-c2-00-00-09 discard
          cpd-filter 01-80-c2-00-00-0a discard
          cpd-filter 01-80-c2-00-00-0b discard
          cpd-filter 01-80-c2-00-00-0c discard
          cpd-filter 01-80-c2-00-00-0d discard
          cpd-filter 01-80-c2-00-00-0e discard
          cpd-filter 01-80-c2-00-00-0f discard
          cpd-filter nearest-lldp discard
          cpd-filter non-tpmr-lldp discard
          cpd-filter customer-lldp discard
          pm
            set-threshold abra2n 0 15min
            set-threshold abrrla2n 0 15min
            set-threshold abrn2a 0 15min
            set-threshold abrrln2a 0 15min
            set-threshold l2cpfd 0 15min
            set-threshold bytesina2n 0 15min
            set-threshold bytesinn2a 0 15min
            set-threshold bytesouta2n 0 15min
            set-threshold bytesoutn2a 0 15min
            set-threshold fmga2n 0 15min
            set-threshold fmgn2a 0 15min
            set-threshold fmrda2n 0 15min
            set-threshold fmrdn2a 0 15min
            set-threshold fmya2n 0 15min
            set-threshold fmyn2a 0 15min
            set-threshold ftda2n 0 15min
            set-threshold ses 0 15min
            set-threshold uas 10 15min
            set-threshold fdhairpin 0 15min
            set-threshold fdstaticblock 0 15min
            set-threshold learntblentrydiscards 0 15min
            set-threshold numlearntblflushes 0 15min
            set-threshold ibra2nmax 0 15min
            set-threshold ibrrla2nmax 0 15min
            set-threshold ibra2nmin 0 15min
            set-threshold ibrrla2nmin 0 15min
            set-threshold ibra2n 0 15min
            set-threshold ibrrla2n 0 15min
            set-threshold ibrn2amax 0 15min
            set-threshold ibrrln2amax 0 15min
            set-threshold ibrn2amin 0 15min
            set-threshold ibrrln2amin 0 15min
            set-threshold ibrn2a 0 15min
            set-threshold ibrrln2a 0 15min
            set-threshold fmcd 0 15min
            set-threshold fbcd 0 15min
            set-threshold acl-a2n-drop 0 15min
            set-threshold acl-n2a-drop 0 15min
            set-threshold abra2n 0 1day
            set-threshold abrrla2n 0 1day
            set-threshold abrn2a 0 1day
            set-threshold abrrln2a 0 1day
            set-threshold l2cpfd 0 1day
            set-threshold bytesina2n 0 1day
            set-threshold bytesinn2a 0 1day
            set-threshold bytesouta2n 0 1day
            set-threshold bytesoutn2a 0 1day
            set-threshold fmga2n 0 1day
            set-threshold fmgn2a 0 1day
            set-threshold fmrda2n 0 1day
            set-threshold fmrdn2a 0 1day
            set-threshold fmya2n 0 1day
            set-threshold fmyn2a 0 1day
            set-threshold ftda2n 0 1day
            set-threshold ses 0 1day
            set-threshold uas 10 1day
            set-threshold fdhairpin 0 1day
            set-threshold fdstaticblock 0 1day
            set-threshold learntblentrydiscards 0 1day
            set-threshold numlearntblflushes 0 1day
            set-threshold ibra2nmax 0 1day
            set-threshold ibrrla2nmax 0 1day
            set-threshold ibra2nmin 0 1day
            set-threshold ibrrla2nmin 0 1day
            set-threshold ibra2n 0 1day
            set-threshold ibrrla2n 0 1day
            set-threshold ibrn2amax 0 1day
            set-threshold ibrrln2amax 0 1day
            set-threshold ibrn2amin 0 1day
            set-threshold ibrrln2amin 0 1day
            set-threshold ibrn2a 0 1day
            set-threshold ibrrln2a 0 1day
            set-threshold fmcd 0 1day
            set-threshold fbcd 0 1day
            set-threshold acl-a2n-drop 0 1day
            set-threshold acl-n2a-drop 0 1day
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        configure flow flow-1-1-1-5-1
          configure a2n-shaper a2n_shaper-1-1-1-5-1-0
            buffersize 128
            exit
          configure a2n-shaper a2n_shaper-1-1-1-5-1-0
            soam-cir 0
            soam-eir 0
            max-drop-probability-green 100
            max-threshold-green 100
            min-threshold-green 100
            max-drop-probability-yellow 100
            max-threshold-yellow 75
            min-threshold-yellow 75
            exit
          configure a2n-shaper a2n_shaper-1-1-1-5-1-0
            pm
              set-threshold bt 0 15min
              set-threshold btd 0 15min
              set-threshold fd 0 15min
              set-threshold ftd 0 15min
              set-threshold abrrl 0 15min
              set-threshold bredd 0 15min
              set-threshold fredd 0 15min
              set-threshold bt 0 1day
              set-threshold btd 0 1day
              set-threshold fd 0 1day
              set-threshold ftd 0 1day
              set-threshold abrrl 0 1day
              set-threshold bredd 0 1day
              set-threshold fredd 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        configure flow flow-1-1-1-5-1
          configure a2n-policer a2n_policer-1-1-1-5-1-0
            eir 0
            ebs 0
            cir 0
            cbs 0
            color-marking enabled
            color-mode color-aware
            coupling-flag enabled
            exit
          configure a2n-policer a2n_policer-1-1-1-5-1-0
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        configure flow flow-1-1-1-5-1
          configure n2a-policer n2a_policer-1-1-1-5-1-0
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        configure n2a-shaper port_n2a_shaper-1-1-1-5-0
          buffersize 0
          soam-cir 0
          soam-eir 0
          max-drop-probability-green 100
          max-threshold-green 100
          min-threshold-green 100
          max-drop-probability-yellow 100
          max-threshold-yellow 75
          min-threshold-yellow 75
          pm
            set-threshold bt 0 15min
            set-threshold btd 0 15min
            set-threshold fd 0 15min
            set-threshold ftd 0 15min
            set-threshold abrrl 0 15min
            set-threshold bredd 0 15min
            set-threshold fredd 0 15min
            set-threshold bt 0 1day
            set-threshold btd 0 1day
            set-threshold fd 0 1day
            set-threshold ftd 0 1day
            set-threshold abrrl 0 1day
            set-threshold bredd 0 1day
            set-threshold fredd 0 1day
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        add flow flow-1-1-1-6-1 "Y.1731 Test Port" regular-evc disabled disabled disabled enabled 0 outer-vlantag enabled none none "506-*" 0 64000 eompls-pw none prio_map_profile-1 access-interface access-1-1-1-6 network-interface network-1-1-1-1 flow-based
        configure flow flow-1-1-1-6-1
          admin-state management
          hierarchical-cos disabled
          es-frame-loss-threshold 1
          ses-frame-loss-threshold-ratio 30
          policing enabled
          policing-control a2n-n2a
          n2a-outertag-prio-ctrl disabled
          access-learning-ctrl none
          network-learning-ctrl none
          access-max-forwarding-entries 4096
          network-max-forwarding-entries 4096
          protect-access-learning none
          protect-network-learning none
          aging-timer 300
          table-full-action forward
          n2n-forwarding disabled
          a2n-multicast-rate-limit-ctrl disabled
          a2n-broadcast-rate-limit-ctrl disabled
          a2n-combined-rate-limit-ctrl disabled
          cpd-filter isl pass-thru
          cpd-filter pagp pass-thru
          cpd-filter udld pass-thru
          cpd-filter cdp pass-thru
          cpd-filter vtp pass-thru
          cpd-filter dtp pass-thru
          cpd-filter pvstp+ pass-thru
          cpd-filter uplinkfast pass-thru
          cpd-filter vlan-bridge pass-thru
          cpd-filter l2pt pass-thru
          cpd-filter bpdu pass-thru
          cpd-filter pause pass-thru
          cpd-filter lacp pass-thru
          cpd-filter lacp-marker pass-thru
          cpd-filter efm-oam pass-thru
          cpd-filter ssm discard
          cpd-filter port-authen pass-thru
          cpd-filter lan-bridges pass-thru
          cpd-filter gmrp pass-thru
          cpd-filter gvrp pass-thru
          cpd-filter garp pass-thru
          cpd-filter elmi pass-thru
          cpd-filter 01-80-c2-00-00-00 discard
          cpd-filter 01-80-c2-00-00-01 discard
          cpd-filter 01-80-c2-00-00-02 discard
          cpd-filter 01-80-c2-00-00-03 discard
          cpd-filter 01-80-c2-00-00-04 discard
          cpd-filter 01-80-c2-00-00-05 discard
          cpd-filter 01-80-c2-00-00-06 discard
          cpd-filter 01-80-c2-00-00-07 discard
          cpd-filter 01-80-c2-00-00-08 discard
          cpd-filter 01-80-c2-00-00-09 discard
          cpd-filter 01-80-c2-00-00-0a discard
          cpd-filter 01-80-c2-00-00-0b discard
          cpd-filter 01-80-c2-00-00-0c discard
          cpd-filter 01-80-c2-00-00-0d discard
          cpd-filter 01-80-c2-00-00-0e discard
          cpd-filter 01-80-c2-00-00-0f discard
          cpd-filter nearest-lldp discard
          cpd-filter non-tpmr-lldp discard
          cpd-filter customer-lldp discard
          pm
            set-threshold abra2n 0 15min
            set-threshold abrrla2n 0 15min
            set-threshold abrn2a 0 15min
            set-threshold abrrln2a 0 15min
            set-threshold l2cpfd 0 15min
            set-threshold bytesina2n 0 15min
            set-threshold bytesinn2a 0 15min
            set-threshold bytesouta2n 0 15min
            set-threshold bytesoutn2a 0 15min
            set-threshold fmga2n 0 15min
            set-threshold fmgn2a 0 15min
            set-threshold fmrda2n 0 15min
            set-threshold fmrdn2a 0 15min
            set-threshold fmya2n 0 15min
            set-threshold fmyn2a 0 15min
            set-threshold ftda2n 0 15min
            set-threshold ses 0 15min
            set-threshold uas 10 15min
            set-threshold fdhairpin 0 15min
            set-threshold fdstaticblock 0 15min
            set-threshold learntblentrydiscards 0 15min
            set-threshold numlearntblflushes 0 15min
            set-threshold ibra2nmax 0 15min
            set-threshold ibrrla2nmax 0 15min
            set-threshold ibra2nmin 0 15min
            set-threshold ibrrla2nmin 0 15min
            set-threshold ibra2n 0 15min
            set-threshold ibrrla2n 0 15min
            set-threshold ibrn2amax 0 15min
            set-threshold ibrrln2amax 0 15min
            set-threshold ibrn2amin 0 15min
            set-threshold ibrrln2amin 0 15min
            set-threshold ibrn2a 0 15min
            set-threshold ibrrln2a 0 15min
            set-threshold fmcd 0 15min
            set-threshold fbcd 0 15min
            set-threshold acl-a2n-drop 0 15min
            set-threshold acl-n2a-drop 0 15min
            set-threshold abra2n 0 1day
            set-threshold abrrla2n 0 1day
            set-threshold abrn2a 0 1day
            set-threshold abrrln2a 0 1day
            set-threshold l2cpfd 0 1day
            set-threshold bytesina2n 0 1day
            set-threshold bytesinn2a 0 1day
            set-threshold bytesouta2n 0 1day
            set-threshold bytesoutn2a 0 1day
            set-threshold fmga2n 0 1day
            set-threshold fmgn2a 0 1day
            set-threshold fmrda2n 0 1day
            set-threshold fmrdn2a 0 1day
            set-threshold fmya2n 0 1day
            set-threshold fmyn2a 0 1day
            set-threshold ftda2n 0 1day
            set-threshold ses 0 1day
            set-threshold uas 10 1day
            set-threshold fdhairpin 0 1day
            set-threshold fdstaticblock 0 1day
            set-threshold learntblentrydiscards 0 1day
            set-threshold numlearntblflushes 0 1day
            set-threshold ibra2nmax 0 1day
            set-threshold ibrrla2nmax 0 1day
            set-threshold ibra2nmin 0 1day
            set-threshold ibrrla2nmin 0 1day
            set-threshold ibra2n 0 1day
            set-threshold ibrrla2n 0 1day
            set-threshold ibrn2amax 0 1day
            set-threshold ibrrln2amax 0 1day
            set-threshold ibrn2amin 0 1day
            set-threshold ibrrln2amin 0 1day
            set-threshold ibrn2a 0 1day
            set-threshold ibrrln2a 0 1day
            set-threshold fmcd 0 1day
            set-threshold fbcd 0 1day
            set-threshold acl-a2n-drop 0 1day
            set-threshold acl-n2a-drop 0 1day
          exit
        exit
      exit
    exit
  exit



  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          configure a2n-shaper a2n_shaper-1-1-1-6-1-0
            buffersize 128
            exit
          configure a2n-shaper a2n_shaper-1-1-1-6-1-0
            soam-cir 0
            soam-eir 0
            max-drop-probability-green 100
            max-threshold-green 100
            min-threshold-green 100
            max-drop-probability-yellow 100
            max-threshold-yellow 75
            min-threshold-yellow 75
            exit
          configure a2n-shaper a2n_shaper-1-1-1-6-1-0
            pm
              set-threshold bt 0 15min
              set-threshold btd 0 15min
              set-threshold fd 0 15min
              set-threshold ftd 0 15min
              set-threshold abrrl 0 15min
              set-threshold bredd 0 15min
              set-threshold fredd 0 15min
              set-threshold bt 0 1day
              set-threshold btd 0 1day
              set-threshold fd 0 1day
              set-threshold ftd 0 1day
              set-threshold abrrl 0 1day
              set-threshold bredd 0 1day
              set-threshold fredd 0 1day
            exit
          exit
        exit
      exit
    exit
  exit



  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-shaper a2n_shaper-1-1-1-6-1-1 128
          configure a2n-shaper a2n_shaper-1-1-1-6-1-1
            soam-cir 0
            soam-eir 0
            max-drop-probability-green 100
            max-threshold-green 100
            min-threshold-green 100
            max-drop-probability-yellow 100
            max-threshold-yellow 75
            min-threshold-yellow 75
            exit
          configure a2n-shaper a2n_shaper-1-1-1-6-1-1
            pm
              set-threshold bt 0 15min
              set-threshold btd 0 15min
              set-threshold fd 0 15min
              set-threshold ftd 0 15min
              set-threshold abrrl 0 15min
              set-threshold bredd 0 15min
              set-threshold fredd 0 15min
              set-threshold bt 0 1day
              set-threshold btd 0 1day
              set-threshold fd 0 1day
              set-threshold ftd 0 1day
              set-threshold abrrl 0 1day
              set-threshold bredd 0 1day
              set-threshold fredd 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-shaper a2n_shaper-1-1-1-6-1-2 128
          configure a2n-shaper a2n_shaper-1-1-1-6-1-2
            soam-cir 0
            soam-eir 0
            max-drop-probability-green 100
            max-threshold-green 100
            min-threshold-green 100
            max-drop-probability-yellow 100
            max-threshold-yellow 75
            min-threshold-yellow 75
            exit
          configure a2n-shaper a2n_shaper-1-1-1-6-1-2
            pm
              set-threshold bt 0 15min
              set-threshold btd 0 15min
              set-threshold fd 0 15min
              set-threshold ftd 0 15min
              set-threshold abrrl 0 15min
              set-threshold bredd 0 15min
              set-threshold fredd 0 15min
              set-threshold bt 0 1day
              set-threshold btd 0 1day
              set-threshold fd 0 1day
              set-threshold ftd 0 1day
              set-threshold abrrl 0 1day
              set-threshold bredd 0 1day
              set-threshold fredd 0 1day
            exit
          exit
        exit
      exit
    exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-shaper a2n_shaper-1-1-1-6-1-3 128
          configure a2n-shaper a2n_shaper-1-1-1-6-1-3
            soam-cir 0
            soam-eir 0
            max-drop-probability-green 100
            max-threshold-green 100
            min-threshold-green 100
            max-drop-probability-yellow 100
            max-threshold-yellow 75
            min-threshold-yellow 75
            exit
          configure a2n-shaper a2n_shaper-1-1-1-6-1-3
            pm
              set-threshold bt 0 15min
              set-threshold btd 0 15min
              set-threshold fd 0 15min
              set-threshold ftd 0 15min
              set-threshold abrrl 0 15min
              set-threshold bredd 0 15min
              set-threshold fredd 0 15min
              set-threshold bt 0 1day
              set-threshold btd 0 1day
              set-threshold fd 0 1day
              set-threshold ftd 0 1day
              set-threshold abrrl 0 1day
              set-threshold bredd 0 1day
              set-threshold fredd 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-shaper a2n_shaper-1-1-1-6-1-4 128
          configure a2n-shaper a2n_shaper-1-1-1-6-1-4
            soam-cir 0
            soam-eir 0
            max-drop-probability-green 100
            max-threshold-green 100
            min-threshold-green 100
            max-drop-probability-yellow 100
            max-threshold-yellow 75
            min-threshold-yellow 75
            exit
          configure a2n-shaper a2n_shaper-1-1-1-6-1-4
            pm
              set-threshold bt 0 15min
              set-threshold btd 0 15min
              set-threshold fd 0 15min
              set-threshold ftd 0 15min
              set-threshold abrrl 0 15min
              set-threshold bredd 0 15min
              set-threshold fredd 0 15min
              set-threshold bt 0 1day
              set-threshold btd 0 1day
              set-threshold fd 0 1day
              set-threshold ftd 0 1day
              set-threshold abrrl 0 1day
              set-threshold bredd 0 1day
              set-threshold fredd 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-shaper a2n_shaper-1-1-1-6-1-5 128
          configure a2n-shaper a2n_shaper-1-1-1-6-1-5
            soam-cir 0
            soam-eir 0
            max-drop-probability-green 100
            max-threshold-green 100
            min-threshold-green 100
            max-drop-probability-yellow 100
            max-threshold-yellow 75
            min-threshold-yellow 75
            exit
          configure a2n-shaper a2n_shaper-1-1-1-6-1-5
            pm
              set-threshold bt 0 15min
              set-threshold btd 0 15min
              set-threshold fd 0 15min
              set-threshold ftd 0 15min
              set-threshold abrrl 0 15min
              set-threshold bredd 0 15min
              set-threshold fredd 0 15min
              set-threshold bt 0 1day
              set-threshold btd 0 1day
              set-threshold fd 0 1day
              set-threshold ftd 0 1day
              set-threshold abrrl 0 1day
              set-threshold bredd 0 1day
              set-threshold fredd 0 1day
            exit
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-shaper a2n_shaper-1-1-1-6-1-6 128
          configure a2n-shaper a2n_shaper-1-1-1-6-1-6
            soam-cir 0
            soam-eir 0
            max-drop-probability-green 100
            max-threshold-green 100
            min-threshold-green 100
            max-drop-probability-yellow 100
            max-threshold-yellow 75
            min-threshold-yellow 75
            exit
          configure a2n-shaper a2n_shaper-1-1-1-6-1-6
            pm
              set-threshold bt 0 15min
              set-threshold btd 0 15min
              set-threshold fd 0 15min
              set-threshold ftd 0 15min
              set-threshold abrrl 0 15min
              set-threshold bredd 0 15min
              set-threshold fredd 0 15min
              set-threshold bt 0 1day
              set-threshold btd 0 1day
              set-threshold fd 0 1day
              set-threshold ftd 0 1day
              set-threshold abrrl 0 1day
              set-threshold bredd 0 1day
              set-threshold fredd 0 1day
            exit
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-shaper a2n_shaper-1-1-1-6-1-7 128
          configure a2n-shaper a2n_shaper-1-1-1-6-1-7
            soam-cir 0
            soam-eir 0
            max-drop-probability-green 100
            max-threshold-green 100
            min-threshold-green 100
            max-drop-probability-yellow 100
            max-threshold-yellow 75
            min-threshold-yellow 75
            exit
          configure a2n-shaper a2n_shaper-1-1-1-6-1-7
            pm
              set-threshold bt 0 15min
              set-threshold btd 0 15min
              set-threshold fd 0 15min
              set-threshold ftd 0 15min
              set-threshold abrrl 0 15min
              set-threshold bredd 0 15min
              set-threshold fredd 0 15min
              set-threshold bt 0 1day
              set-threshold btd 0 1day
              set-threshold fd 0 1day
              set-threshold ftd 0 1day
              set-threshold abrrl 0 1day
              set-threshold bredd 0 1day
              set-threshold fredd 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          configure a2n-policer a2n_policer-1-1-1-6-1-0
            eir 64000
            ebs 32
            cir 0
            cbs 0
            color-marking enabled
            color-mode color-blind
            coupling-flag enabled
            exit
          configure a2n-policer a2n_policer-1-1-1-6-1-0
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-policer a2n_policer-1-1-1-6-1-1 enabled color-blind enabled 0 64000 0 32 a2n_shaper-1-1-1-6-1-1
          configure a2n-policer a2n_policer-1-1-1-6-1-1
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-policer a2n_policer-1-1-1-6-1-2 enabled color-blind enabled 0 64000 0 32 a2n_shaper-1-1-1-6-1-2
          configure a2n-policer a2n_policer-1-1-1-6-1-2
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-policer a2n_policer-1-1-1-6-1-3 enabled color-blind enabled 0 64000 0 32 a2n_shaper-1-1-1-6-1-3
          configure a2n-policer a2n_policer-1-1-1-6-1-3
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-policer a2n_policer-1-1-1-6-1-4 enabled color-blind enabled 0 64000 0 32 a2n_shaper-1-1-1-6-1-4
          configure a2n-policer a2n_policer-1-1-1-6-1-4
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit



  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-policer a2n_policer-1-1-1-6-1-5 enabled color-blind enabled 0 64000 0 32 a2n_shaper-1-1-1-6-1-5
          configure a2n-policer a2n_policer-1-1-1-6-1-5
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-policer a2n_policer-1-1-1-6-1-6 enabled color-blind enabled 0 64000 0 32 a2n_shaper-1-1-1-6-1-6
          configure a2n-policer a2n_policer-1-1-1-6-1-6
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add a2n-policer a2n_policer-1-1-1-6-1-7 enabled color-blind enabled 0 64000 0 32 a2n_shaper-1-1-1-6-1-7
          configure a2n-policer a2n_policer-1-1-1-6-1-7
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure n2a-shaper port_n2a_shaper-1-1-1-6-0
          buffersize 10
          soam-cir 0
          soam-eir 0
          max-drop-probability-green 100
          max-threshold-green 100
          min-threshold-green 100
          max-drop-probability-yellow 100
          max-threshold-yellow 75
          min-threshold-yellow 75
          pm
            set-threshold bt 0 15min
            set-threshold btd 0 15min
            set-threshold fd 0 15min
            set-threshold ftd 0 15min
            set-threshold abrrl 0 15min
            set-threshold bredd 0 15min
            set-threshold fredd 0 15min
            set-threshold bt 0 1day
            set-threshold btd 0 1day
            set-threshold fd 0 1day
            set-threshold ftd 0 1day
            set-threshold abrrl 0 1day
            set-threshold bredd 0 1day
            set-threshold fredd 0 1day
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          configure n2a-policer n2a_policer-1-1-1-6-1-0
            eir 64000
            ebs 32
            cir 0
            cbs 0
            color-marking enabled
            color-mode color-blind
            coupling-flag enabled
            exit
          configure n2a-policer n2a_policer-1-1-1-6-1-0
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add n2a-policer n2a_policer-1-1-1-6-1-1 enabled color-blind enabled 0 64000 0 32
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure n2a-shaper port_n2a_shaper-1-1-1-6-1
          buffersize 10
          soam-cir 0
          soam-eir 0
          max-drop-probability-green 100
          max-threshold-green 100
          min-threshold-green 100
          max-drop-probability-yellow 100
          max-threshold-yellow 75
          min-threshold-yellow 75
          pm
            set-threshold bt 0 15min
            set-threshold btd 0 15min
            set-threshold fd 0 15min
            set-threshold ftd 0 15min
            set-threshold abrrl 0 15min
            set-threshold bredd 0 15min
            set-threshold fredd 0 15min
            set-threshold bt 0 1day
            set-threshold btd 0 1day
            set-threshold fd 0 1day
            set-threshold ftd 0 1day
            set-threshold abrrl 0 1day
            set-threshold bredd 0 1day
            set-threshold fredd 0 1day
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          configure n2a-policer n2a_policer-1-1-1-6-1-1
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add n2a-policer n2a_policer-1-1-1-6-1-2 enabled color-blind enabled 0 64000 0 32
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure n2a-shaper port_n2a_shaper-1-1-1-6-2
          buffersize 10
          soam-cir 0
          soam-eir 0
          max-drop-probability-green 100
          max-threshold-green 100
          min-threshold-green 100
          max-drop-probability-yellow 100
          max-threshold-yellow 75
          min-threshold-yellow 75
          pm
            set-threshold bt 0 15min
            set-threshold btd 0 15min
            set-threshold fd 0 15min
            set-threshold ftd 0 15min
            set-threshold abrrl 0 15min
            set-threshold bredd 0 15min
            set-threshold fredd 0 15min
            set-threshold bt 0 1day
            set-threshold btd 0 1day
            set-threshold fd 0 1day
            set-threshold ftd 0 1day
            set-threshold abrrl 0 1day
            set-threshold bredd 0 1day
            set-threshold fredd 0 1day
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          configure n2a-policer n2a_policer-1-1-1-6-1-2
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add n2a-policer n2a_policer-1-1-1-6-1-3 enabled color-blind enabled 0 64000 0 32
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure n2a-shaper port_n2a_shaper-1-1-1-6-3
          buffersize 10
          soam-cir 0
          soam-eir 0
          max-drop-probability-green 100
          max-threshold-green 100
          min-threshold-green 100
          max-drop-probability-yellow 100
          max-threshold-yellow 75
          min-threshold-yellow 75
          pm
            set-threshold bt 0 15min
            set-threshold btd 0 15min
            set-threshold fd 0 15min
            set-threshold ftd 0 15min
            set-threshold abrrl 0 15min
            set-threshold bredd 0 15min
            set-threshold fredd 0 15min
            set-threshold bt 0 1day
            set-threshold btd 0 1day
            set-threshold fd 0 1day
            set-threshold ftd 0 1day
            set-threshold abrrl 0 1day
            set-threshold bredd 0 1day
            set-threshold fredd 0 1day
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          configure n2a-policer n2a_policer-1-1-1-6-1-3
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add n2a-policer n2a_policer-1-1-1-6-1-4 enabled color-blind enabled 0 64000 0 32
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure n2a-shaper port_n2a_shaper-1-1-1-6-4
          buffersize 10
          soam-cir 0
          soam-eir 0
          max-drop-probability-green 100
          max-threshold-green 100
          min-threshold-green 100
          max-drop-probability-yellow 100
          max-threshold-yellow 75
          min-threshold-yellow 75
          pm
            set-threshold bt 0 15min
            set-threshold btd 0 15min
            set-threshold fd 0 15min
            set-threshold ftd 0 15min
            set-threshold abrrl 0 15min
            set-threshold bredd 0 15min
            set-threshold fredd 0 15min
            set-threshold bt 0 1day
            set-threshold btd 0 1day
            set-threshold fd 0 1day
            set-threshold ftd 0 1day
            set-threshold abrrl 0 1day
            set-threshold bredd 0 1day
            set-threshold fredd 0 1day
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          configure n2a-policer n2a_policer-1-1-1-6-1-4
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add n2a-policer n2a_policer-1-1-1-6-1-5 enabled color-blind enabled 0 64000 0 32
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure n2a-shaper port_n2a_shaper-1-1-1-6-5
          buffersize 10
          soam-cir 0
          soam-eir 0
          max-drop-probability-green 100
          max-threshold-green 100
          min-threshold-green 100
          max-drop-probability-yellow 100
          max-threshold-yellow 75
          min-threshold-yellow 75
          pm
            set-threshold bt 0 15min
            set-threshold btd 0 15min
            set-threshold fd 0 15min
            set-threshold ftd 0 15min
            set-threshold abrrl 0 15min
            set-threshold bredd 0 15min
            set-threshold fredd 0 15min
            set-threshold bt 0 1day
            set-threshold btd 0 1day
            set-threshold fd 0 1day
            set-threshold ftd 0 1day
            set-threshold abrrl 0 1day
            set-threshold bredd 0 1day
            set-threshold fredd 0 1day
          exit
        exit
      exit
    exit
  exit



  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          configure n2a-policer n2a_policer-1-1-1-6-1-5
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add n2a-policer n2a_policer-1-1-1-6-1-6 enabled color-blind enabled 0 64000 0 32
        exit
      exit
    exit
  exit



  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure n2a-shaper port_n2a_shaper-1-1-1-6-6
          buffersize 10
          soam-cir 0
          soam-eir 0
          max-drop-probability-green 100
          max-threshold-green 100
          min-threshold-green 100
          max-drop-probability-yellow 100
          max-threshold-yellow 75
          min-threshold-yellow 75
          pm
            set-threshold bt 0 15min
            set-threshold btd 0 15min
            set-threshold fd 0 15min
            set-threshold ftd 0 15min
            set-threshold abrrl 0 15min
            set-threshold bredd 0 15min
            set-threshold fredd 0 15min
            set-threshold bt 0 1day
            set-threshold btd 0 1day
            set-threshold fd 0 1day
            set-threshold ftd 0 1day
            set-threshold abrrl 0 1day
            set-threshold bredd 0 1day
            set-threshold fredd 0 1day
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          configure n2a-policer n2a_policer-1-1-1-6-1-6
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          add n2a-policer n2a_policer-1-1-1-6-1-7 enabled color-blind enabled 0 64000 0 32
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure n2a-shaper port_n2a_shaper-1-1-1-6-7
          buffersize 10
          soam-cir 0
          soam-eir 0
          max-drop-probability-green 100
          max-threshold-green 100
          min-threshold-green 100
          max-drop-probability-yellow 100
          max-threshold-yellow 75
          min-threshold-yellow 75
          pm
            set-threshold bt 0 15min
            set-threshold btd 0 15min
            set-threshold fd 0 15min
            set-threshold ftd 0 15min
            set-threshold abrrl 0 15min
            set-threshold bredd 0 15min
            set-threshold fredd 0 15min
            set-threshold bt 0 1day
            set-threshold btd 0 1day
            set-threshold fd 0 1day
            set-threshold ftd 0 1day
            set-threshold abrrl 0 1day
            set-threshold bredd 0 1day
            set-threshold fredd 0 1day
          exit
        exit
      exit
    exit
  exit



  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        configure flow flow-1-1-1-6-1
          configure n2a-policer n2a_policer-1-1-1-6-1-7
            pm
              set-threshold fmg 0 15min
              set-threshold fmy 0 15min
              set-threshold fmrd 0 15min
              set-threshold abr 0 15min
              set-threshold bytesin 0 15min
              set-threshold bytesout 0 15min
              set-threshold fmg 0 1day
              set-threshold fmy 0 1day
              set-threshold fmrd 0 1day
              set-threshold abr 0 1day
              set-threshold bytesin 0 1day
              set-threshold bytesout 0 1day
            exit
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-1
        lpbk
          rls-lpbk
        exit
      exit
    exit
  exit



  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-2
        lpbk
          rls-lpbk
        exit
      exit
    exit
  exit


  adva-825:configure cfm
    signal-fail-defect-list rdi,rem-ccm
  exit


  adva-825:configure cfm
    configure sysdef-md
      md-level 0
      mhf none
    exit
  exit


  adva-825:configure cfm
    add md 1 no-name 5 none
  exit


  adva-825:configure cfm
    configure md md-1
      add manet 1 icc-based "CBLM_METRO" 1sec 1
    exit
  exit


  adva-825:configure cfm
    configure md md-1
      configure manet manet-1-1
        add macomp 1 access-1-1-1-6 506 defer
        add mep 1 up access-1-1-1-6 in-service mac-remote-xcon-error disabled 0
        configure mep mep-1-1-1
          ais-client-mdlevel 6
          ais-gen disabled
          ais-interval 1sec
          ais-prio 0
          ais-trigger none
          ethernet-type 0x8100
          llf-trigger none
          lm-dualended-countallprios disabled
          lm-rx-countallprios disabled
          lm-tx-countallprios disabled
          lm-in-profile enabled
          primary-vid 0
          sat-responder disabled
          ltm-egress-id "00000080ea72eaf0"
        exit
      exit
    exit
  exit


  adva-825:configure cfm
    configure cfm-n2a-vid-shaper access-1-1-1-6 cfm_n2a_vid_shaper-1-1-1-6-1
      buffersize 1
      cir 320000
      admin-state management
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure usb
        add mobile-modem
        exit
      configure usb
        configure mobile-modem
          admin-state unassigned
          alias ""
          apn ""
          dial-number ""
          redial-timer 10
        exit
      exit
    exit
  exit


  adva-825:admin sw-license
    configure feature "OpenFlow" disabled
  exit


  adva-825:admin sw-license
    configure feature "IP-Services-and-ACL-Filtering" disabled
  exit

  adva-825:admin sw-license
    configure feature "Extended-Scale-IP-services" disabled
  exit


  adva-825:admin sw-license
    configure feature "EoMPLS" disabled
  exit

  adva-825:configure system
    lldp
      trans-interval 30
      holdtime-multiplier 4
      reinit-delay 2
      notification-interval 30
      tx-credit-max 5
      message-fast-tx 1
      tx-fast-init 4
      max-neighbor-action discard-new
    exit
  exit

  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-3
        lldp
          add acc-port-config 1
          exit
        lldp
          configure acc-port-config 1
            admin-status disabled
            snmp-notification disabled
            basic-tlv-supported port-description,sys-name,sys-description,sys-cap
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-4
        lldp
          add acc-port-config 1
          exit
        lldp
          configure acc-port-config 1
            admin-status disabled
            snmp-notification disabled
            basic-tlv-supported port-description,sys-name,sys-description,sys-cap
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-5
        lldp
          add acc-port-config 1
          exit
        lldp
          configure acc-port-config 1
            admin-status disabled
            snmp-notification disabled
            basic-tlv-supported port-description,sys-name,sys-description,sys-cap
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure access-port access-1-1-1-6
        lldp
          add acc-port-config 1
          exit
        lldp
          configure acc-port-config 1
            admin-status disabled
            snmp-notification disabled
            basic-tlv-supported port-description,sys-name,sys-description,sys-cap
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-1
        lldp
          add net-port-config 1
          exit
        lldp
          configure net-port-config 1
            admin-status disabled
            snmp-notification disabled
            basic-tlv-supported port-description,sys-name,sys-description,sys-cap
          exit
        exit
      exit
    exit
  exit


  adva-825:network-element ne-1
    configure nte nte114pro_he-1-1-1
      configure network-port network-1-1-1-2
        lldp
          add net-port-config 1
          exit
        lldp
          configure net-port-config 1
            admin-status disabled
            snmp-notification disabled
            basic-tlv-supported port-description,sys-name,sys-description,sys-cap
          exit
        exit
      exit
    exit
  exit

  adva-825:configure sat
    network-element ne-1
      configure sat-ctrl sat_control-1-1
        name ""
        test-mode one-way
        test-procedure cir,eir,policing,performance
        test-duration 20
        step-duration 20
        step-num 1
        perf-test-duration 15
        flpdu-tag-override disabled
      exit
    exit
  exit


  adva-825:configure communication
    add ip-route nexthop 0.0.0.0 0.0.0.0 1.1.1.1 "eth0" 1 disabled
  exit

  adva-825:configure system
    profile
      add prio-map-profile 2 "IPVPN Managed and Unmanaged Premium 5 Class" ip-dscp
      exit
    profile
      configure prio-map-profile prio_map_profile-2
        cos-map-mode ethernet
        edit-prio-map prio_map_profile_pri_entry-2-1 0 none
        edit-prio-map prio_map_profile_pri_entry-2-2 0 none
        edit-prio-map prio_map_profile_pri_entry-2-3 0 none
        edit-prio-map prio_map_profile_pri_entry-2-4 0 none
        edit-prio-map prio_map_profile_pri_entry-2-5 0 none
        edit-prio-map prio_map_profile_pri_entry-2-6 0 none
        edit-prio-map prio_map_profile_pri_entry-2-7 0 none
        edit-prio-map prio_map_profile_pri_entry-2-8 0 none
        edit-prio-map prio_map_profile_pri_entry-2-9 1 none
        edit-prio-map prio_map_profile_pri_entry-2-10 1 none
        edit-prio-map prio_map_profile_pri_entry-2-11 1 none
        edit-prio-map prio_map_profile_pri_entry-2-12 1 none
        edit-prio-map prio_map_profile_pri_entry-2-13 1 none
        edit-prio-map prio_map_profile_pri_entry-2-14 1 none
        edit-prio-map prio_map_profile_pri_entry-2-15 1 none
        edit-prio-map prio_map_profile_pri_entry-2-16 1 none
        edit-prio-map prio_map_profile_pri_entry-2-17 2 none
        edit-prio-map prio_map_profile_pri_entry-2-18 2 none
        edit-prio-map prio_map_profile_pri_entry-2-19 2 none
        edit-prio-map prio_map_profile_pri_entry-2-20 2 none
        edit-prio-map prio_map_profile_pri_entry-2-21 2 none
        edit-prio-map prio_map_profile_pri_entry-2-22 2 none
        edit-prio-map prio_map_profile_pri_entry-2-23 2 none
        edit-prio-map prio_map_profile_pri_entry-2-24 2 none
        edit-prio-map prio_map_profile_pri_entry-2-25 3 none
        edit-prio-map prio_map_profile_pri_entry-2-26 3 none
        edit-prio-map prio_map_profile_pri_entry-2-27 3 none
        edit-prio-map prio_map_profile_pri_entry-2-28 3 none
        edit-prio-map prio_map_profile_pri_entry-2-29 3 none
        edit-prio-map prio_map_profile_pri_entry-2-30 3 none
        edit-prio-map prio_map_profile_pri_entry-2-31 3 none
        edit-prio-map prio_map_profile_pri_entry-2-32 3 none
        edit-prio-map prio_map_profile_pri_entry-2-33 4 none
        edit-prio-map prio_map_profile_pri_entry-2-34 4 none
        edit-prio-map prio_map_profile_pri_entry-2-35 4 none
        edit-prio-map prio_map_profile_pri_entry-2-36 4 none
        edit-prio-map prio_map_profile_pri_entry-2-37 4 none
        edit-prio-map prio_map_profile_pri_entry-2-38 4 none
        edit-prio-map prio_map_profile_pri_entry-2-39 4 none
        edit-prio-map prio_map_profile_pri_entry-2-40 4 none
        edit-prio-map prio_map_profile_pri_entry-2-41 5 none
        edit-prio-map prio_map_profile_pri_entry-2-42 5 none
        edit-prio-map prio_map_profile_pri_entry-2-43 5 none
        edit-prio-map prio_map_profile_pri_entry-2-44 5 none
        edit-prio-map prio_map_profile_pri_entry-2-45 5 none
        edit-prio-map prio_map_profile_pri_entry-2-46 5 none
        edit-prio-map prio_map_profile_pri_entry-2-47 5 none
        edit-prio-map prio_map_profile_pri_entry-2-48 5 none
        edit-prio-map prio_map_profile_pri_entry-2-49 6 none
        edit-prio-map prio_map_profile_pri_entry-2-50 6 none
        edit-prio-map prio_map_profile_pri_entry-2-51 6 none
        edit-prio-map prio_map_profile_pri_entry-2-52 6 none
        edit-prio-map prio_map_profile_pri_entry-2-53 6 none
        edit-prio-map prio_map_profile_pri_entry-2-54 6 none
        edit-prio-map prio_map_profile_pri_entry-2-55 6 none
        edit-prio-map prio_map_profile_pri_entry-2-56 6 none
        edit-prio-map prio_map_profile_pri_entry-2-57 7 none
        edit-prio-map prio_map_profile_pri_entry-2-58 7 none
        edit-prio-map prio_map_profile_pri_entry-2-59 7 none
        edit-prio-map prio_map_profile_pri_entry-2-60 7 none
        edit-prio-map prio_map_profile_pri_entry-2-61 7 none
        edit-prio-map prio_map_profile_pri_entry-2-62 7 none
        edit-prio-map prio_map_profile_pri_entry-2-63 7 none
        edit-prio-map prio_map_profile_pri_entry-2-64 7 none
        edit-cos-map 0 0 0
        edit-cos-map 1 1 1
        edit-cos-map 2 2 2
        edit-cos-map 3 3 3
        edit-cos-map 4 4 4
        edit-cos-map 5 5 5
        edit-cos-map 6 6 6
        edit-cos-map 7 7 7
       exit
     exit
  exit
   ```


# 5. Built in live-status actions
---------------------------------

  The NED supports the following live-status actions:
  ```
  admin@ncs(config-device-adva-1)# live-status exec show
  ```


# 6. Built in live-status show
------------------------------

  The NED does not implement any TTL'based live-status data


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
     admin@ncs(config)# devices device dev-1 ned-settings adva-825 logging level debug
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
  > devices device dev-1 ned-settings adva-825 logger level debug
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
