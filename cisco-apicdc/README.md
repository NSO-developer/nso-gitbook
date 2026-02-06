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
  10. Ned read timeout policy
  11. APIC cluster health handling
  ```


# 1. General
------------

  This document describes the cisco-apicdc NED.

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
  | live-status show          | yes       | show-run - Gets the running config in xml format                 |
  |                           |           |                                                                  |
  | load-native-config        | yes       |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Application Policy        | 5.1             |        |                                                   |
  | Infrastructure Controller |                 |        |                                                   |
  |                           |                 |        |                                                   |
  | Application Policy        | 4.2             |        |                                                   |
  | Infrastructure Controller |                 |        |                                                   |
  |                           |                 |        |                                                   |
  | Application Policy        | 3.2             |        |                                                   |
  | Infrastructure Controller |                 |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-apicdc-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-apicdc-1.0.1.signed.bin
      > ./ncs-6.0-cisco-apicdc-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-apicdc-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-apicdc-1.0.1.tar.gz
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
     `cisco-apicdc-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-apicdc-1.0.1.tar.gz
     > ls -d */
     cisco-apicdc-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-apicdc-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-apicdc-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-apicdc-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-apicdc-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/cisco-apicdc-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-apicdc-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-apicdc-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-apicdc-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-apicdc-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-apicdc-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id cisco-apicdc-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
  - Configure the way the NED wil get the configuration when performing a sync-from.

    When executing sync-from the NED supports multiple ways of getting the configuration file.
    Using the following ned-settings, the NED can get the config file using ftp,sftp or scp protocols,
    localhost or a intermediate host. It also can do a sync-from a static (handled by the user)
    file without triggering a config export from APIC device.

    ```
    devices device dev-1 ned-settings cisco-apicdc protocol <sftp/ftp/scp>
    devices device dev-1 ned-settings cisco-apicdc config-path <path>
    devices device dev-1 ned-settings cisco-apicdc local-host <true/false>
    devices device dev-1 ned-settings cisco-apicdc host <host>
    devices device dev-1 ned-settings cisco-apicdc port <port>
    devices device dev-1 ned-settings cisco-apicdc user-name <user-name>
    devices device dev-1 ned-settings cisco-apicdc user-password  <user-password>
    devices device dev-1 ned-settings cisco-apicdc sync-from-file-enable <true/false>
    devices device dev-1 ned-settings cisco-apicdc sync-from-file-enable sync-from-fileName <staticFileName>
    ```
    - The process of getting the configuration from the APIC device to the NSO:
      * The NED triggers a configuration export on the APIC device.
      * The APIC device uses the protocol configured in “ned-settings cisco-apicdc protocol sftp” To connect to the host configured in “ned-settings cisco-apicdc host on the port configured in “ned-settings cisco-apicdc port”.
      * Then uses the username “ned-settings cisco-apicdc user-name” and password “ned-settings cisco-apicdc user-password” to authenticate on that host.
      * After successfully connected it will download the configuration archive in the path “ned-settings cisco-apicdc config-path”
      * If the “ned-settings cisco-apicdc local-host true” the NED will assume that the device is downloading the configuration archive on the host the NSO is running and using the path “ned-settings cisco-apicdc config-path” will look for the configuration file.
      * If the “ned-settings cisco-apicdc local-host false” the NED will use the protocol host port user-name user-password to retrieve the configuration archive from a remote host.
      * The NED will look for the exported configuration archive and if found, it will load it in the configuration database.
      * At the end the configuration archive is deleted by the NED.

  - Optionally set the ssl to accept-any 

    ```
    admin@ncs(config)# devices device dev-1 ned-settings cisco-fmc-connection ssl accept-any
    ```

  - Optionally specify a list of objects that are controlled by the NED.

    ```
      admin@ncs(config)#  devices device dev-1 ned-settings cisco-apicdc nso-controlled-dns-list [ uni/infra uni/l3dom-anL3Domain uni/tn-aTenant uni/vmmp-aVm ]
    ```

    * The list is used to limit the amount of configuration data exported from APIC. Only the dn:s in the list will be
      considered by the check-sync and sync-from functions. This allows to have APIC configuration to be split into NSO
     controlled and not NSO controlled items. If the list is empty, the complete APIC config will be used
     in check-sync and sync-from.
      - Items in the list shall be in dn format:

        * Example: [uni/tn-aTenant uni/infra uni/l3dom-aL3Domain ].

       The objects in the list must be direct under uni. Objects further down in the tree cannot be specified in this list.

  - Optionally enable cluster alternative-hosts.
    * The NED has the ability to connect to alternative devices in the APIC cluster if the main APIC is down. 
    * If the connection fails to the main APIC the NED will try one by one the hosts in the alternative-hosts list.
    ```
    admin@ncs(config)#devices device dev-1 ned-settings cisco-apicdc alternative-hosts [ 1.1.1.1 2.2.2.2 3.3.3.3 ]
    ```

  - Optionally enable cluster health checking before commit.

    * APIC has a "health" field, to indicate its health state (if APIC is available to accept the configuration changes/updates)
    If the field shows "fully-fit", that means the APIC is available to use for normal operation.
    If the field shows any other state, that means we can't use the primary APIC.
    * When the "health" field shows other state than "fully-fit" the NED needs to inspect another alternative host (if configured) and check it is available to use.
    * When the "commit-fully-fit-only" field is set to true an extra device status read will be performed after login, and if the "health" field is not set to "fully-fit" then the device will be rejected, and the ned will try the next device from the "alternative-hosts" list.
    The following filed enables the extra health check:

    ```
    admin@ncs(config)#devices device dev-1 ned-settings cisco-apicdc commit-fully-fit-only (default false)
    ```

  - Optionally disable-check-sync. 
    * When set to true, check-sync function will be disabled and commits will be accepted even if the NED is out of sync with the device. Used to speed up the commit procedure when the check sync feature is not mandatory.

    ```
    admin@ncs(config)#devices device dev-1 ned-settings cisco-apicdc disable-check-sync true
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

  `$NSO_RUNDIR/logs/ned-cisco-apicdc-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-apicdc logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-apicdc logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.ciscoApicdc \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-apicdc logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-apicdc logger java true
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

  ## 4.1 Config example

  ```
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device cisco-apicdc-0 
  admin@ncs(config-device-cisco-apicdc-0)# config 
  admin@ncs(config-config)# apic fvTenant tn001_apic112
  admin@ncs(config-fvTenant-tn001_apic112)# bfdIfPol BFD-Policy1
  admin@ncs(config-bfdIfPol-BFD-Policy1)# adminSt enabled
  admin@ncs(config-bfdIfPol-BFD-Policy1)# detectMult 3
  admin@ncs(config-bfdIfPol-BFD-Policy1)# echoAdminSt enabled
  admin@ncs(config-bfdIfPol-BFD-Policy1)# echoRxIntvl 50
  admin@ncs(config-bfdIfPol-BFD-Policy1)# minRxIntvl 50
  admin@ncs(config-bfdIfPol-BFD-Policy1)# minTxIntvl 50
  admin@ncs(config-bfdIfPol-BFD-Policy1)# exit
  admin@ncs(config-fvTenant-tn001_apic112)#
  admin@ncs(config-fvTenant-tn001_apic112)# bgpCtxPol TSYS-BGP-TIMER
  admin@ncs(config-bgpCtxPol-TSYS-BGP-TIMER)# grCtrl helper
  admin@ncs(config-bgpCtxPol-TSYS-BGP-TIMER)# holdIntvl 180
  admin@ncs(config-bgpCtxPol-TSYS-BGP-TIMER)# kaIntvl 60
  admin@ncs(config-bgpCtxPol-TSYS-BGP-TIMER)# maxAsLimit 0
  admin@ncs(config-bgpCtxPol-TSYS-BGP-TIMER)# staleIntvl default
  admin@ncs(config-bgpCtxPol-TSYS-BGP-TIMER)# exit
  admin@ncs(config-fvTenant-tn001_apic112)#
  admin@ncs(config-fvTenant-tn001_apic112)# l3extOut extOut1
  admin@ncs(config-l3extOut-extOut1)# targetDscp unspecified
  admin@ncs(config-l3extOut-extOut1)# enforceRtctrl export
  admin@ncs(config-l3extOut-extOut1)# 
  admin@ncs(config-l3extOut-extOut1)# l3extLNodeP test01
  admin@ncs(config-l3extLNodeP-test01)# tag yellow-green
  admin@ncs(config-l3extLNodeP-test01)# l3extLIfP test02
  admin@ncs(config-l3extLIfP-test02)# tag yellow-green
  admin@ncs(config-l3extLIfP-test02)# eigrpIfP eigrpRsIfPol tnEigrpIfPolName default
  admin@ncs(config-l3extLIfP-test02)# exit
  admin@ncs(config-l3extOut-extOut1)# l3extLNodeP extLNodeP1
  admin@ncs(config-l3extLNodeP-extLNodeP1)# tag yellow-green
  admin@ncs(config-l3extLNodeP-extLNodeP1)# l3extLIfP extLifp1
  admin@ncs(config-l3extLIfP-extLifp1)# ospfIfP authKeyId 1
  admin@ncs(config-l3extLIfP-extLifp1)# ospfIfP authType none
  admin@ncs(config-l3extLIfP-extLifp1)# ospfIfP ospfRsIfPol tnOspfIfPolName OSPF-P2Ps
  admin@ncs(config-l3extLIfP-extLifp1)# bfdIfP keyId 1
  admin@ncs(config-l3extLIfP-extLifp1)# bfdIfP type none
  admin@ncs(config-l3extLIfP-extLifp1)# bfdIfP bfdRsIfPol tnBfdIfPolName BFD-Policy1
  admin@ncs(config-l3extLIfP-extLifp1)# tag yellow-green
  admin@ncs(config-l3extLIfP-extLifp1)#
  admin@ncs(config-l3extLIfP-extLifp1)# l3extRsPathL3OutAtt topology/pod-1/protpaths-1001-1002/pathep-[testvpc1g]
  admin@ncs(config-l3extRsPathL3OutAtt-topology/pod-1/protpaths-1001-1002/pathep-[testvpc1g])# addr 0.0.0.0
  admin@ncs(config-l3extRsPathL3OutAtt-topology/pod-1/protpaths-1001-1002/pathep-[testvpc1g])# encap vlan-300
  admin@ncs(config-l3extRsPathL3OutAtt-topology/pod-1/protpaths-1001-1002/pathep-[testvpc1g])# ifInstT ext-svi
  admin@ncs(config-l3extRsPathL3OutAtt-topology/pod-1/protpaths-1001-1002/pathep-[testvpc1g])# llAddr ::
  admin@ncs(config-l3extRsPathL3OutAtt-topology/pod-1/protpaths-1001-1002/pathep-[testvpc1g])# mac 00:FF:FF:FF:FF:FF
  admin@ncs(config-l3extRsPathL3OutAtt-topology/pod-1/protpaths-1001-1002/pathep-[testvpc1g])# bgpPeerP 2.2.2.1
  admin@ncs(config-bgpPeerP-2.2.2.1)# bgpRsPeerToProfile uni/tn-tn001_apic112/prof-STEP6Routemapforctr import
  admin@ncs(config-bgpRsPeerToProfile-uni/tn-tn001_apic112/prof-STEP6Routemapforctr/import)# allowedSelfAsCnt 3
  admin@ncs(config-bgpPeerP-2.2.2.1)# ttl 1
  admin@ncs(config-bgpPeerP-2.2.2.1)# exit
  admin@ncs(config-l3extRsPathL3OutAtt-topology/pod-1/protpaths-1001-1002/pathep-[testvpc1g])# bgpPeerP 2.2.2.3
  admin@ncs(config-bgpPeerP-2.2.2.3)# addrTCtrl af-mcast
  admin@ncs(config-bgpPeerP-2.2.2.3)# allowedSelfAsCnt 3
  admin@ncs(config-bgpPeerP-2.2.2.3)# ttl 1
  admin@ncs(config-bgpPeerP-2.2.2.3)# bgpLocalAsnP localAsn 34
  admin@ncs(config-bgpPeerP-2.2.2.3)# password apic148
  admin@ncs(config-bgpPeerP-2.2.2.3)# weight  256
  admin@ncs(config-bgpPeerP-2.2.2.3)# privateASctrl remove-exclusive
  admin@ncs(config-bgpPeerP-2.2.2.3)# ctrl as-override
  admin@ncs(config-bgpPeerP-2.2.2.3)# 
  admin@ncs(config-bgpPeerP-2.2.2.3)# commit
  Commit complete.

  ```


# 5. Built in live-status actions
---------------------------------

  This sections describes the RPCs (remote procedure cals) provided by the NED:

  ## 5.1 lldp-api
  - REST call:
    - method: GET 
    - URI: /api/node/class/topology/pod-1/node-101/lldpIf.json?
  rsp-subtree=children&rsp-subtree-class=lldpIf,lldpAdjEp&rsp-subtree-include=required&subscription=yes&order-by=lldpIf.name

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec lldp-api <nodeId> <podId>
  ```

  ## 5.2 disable-interface
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/fabric/outofsvc.xml
    - body: <fabricRsOosPath tDn=topology/pod-\<podId>/paths-\<leafId>/pathep-[<portId>] lc=blacklist/>

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec disable-interface <leafId> <podId> <portId>
  ```

  ## 5.3 delete-tech-support-status
  - REST call:
    - method: POST 
    - URI: /api/node/mo/expcont/expstatus-\<polName>/inst-\<collectionTime>/tsnode-\<nodeId>.json
    - body: {"dbgexpTechSupStatus":{"attributes":{"dn":"expcont/expstatus-tsod-3811/inst-2018-09-21T13:50:58.846-08:00/tsnode-3811","status":"deleted"},"children":[]}}

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec delete-tech-support-status <polName> <collectionTime> <nodeId>
  ```

  ## 5.4 device-rest-call
  - REST call: Generic REST call that depends on the provided parameters

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec device-rest-call <http-method> <url> <query> <body>
  ```

  ## 5.5 enable-interface
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/fabric/outofsvc.xml
    - body: \<fabricRsOosPath dn="uni/fabric/outofsvc/rsoosPath-[topology/pod-<podId>/paths-\<leafId>/pathep-[\<portId>]]" status="deleted"/>

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec enable-interface <leafId> <podId> <portId>
  ```

  ## 5.6 delete-remote-location 
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/fabric/path-\<name>
    - body: \<fileRemotePath  dn="uni/fabric/path-\<name>" status="deleted"/>


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec delete-remote-location  <name>
  ```

  ## 5.7 delete-export-policy 
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/fabric/configexp-<name>
    - body: \<configExportP  dn="uni/fabric/configexp-\<name>" status="deleted"/>

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec delete-export-policy <name>
  ```

  ## 5.8 post-fabricRsOosPath
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/fabric/outofsvc.xml
    - body: \<fabricRsOosPath dn=\<dn> tDn=\<tDn> lc=\<lc> status=\<status>/>


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec post-fabricRsOosPath <dn> <tDn> <lc> <status>
  ```


  ## 5.9 show-run
  Gets the running config in xml format either for all config or for speciffic DN

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec show-run 

  OR 

  admin@ncs(config-config)# live-status exec show-run "uni/tn-aTenant" 

  ```

  ## 5.10 exportcryptkey-set
  - Set Encryption Passphrase and Keys for Config Export(and Import).
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/.xml
    - body: \<pkiExportEncryptionKey>  ... \</pkiExportEncryptionKey>

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec exportcryptkey-set <passphrase> <strongEncryptionEnabled> <clearEncryptionKey>
  ```

  ## 5.11 exportcryptkey-status
  - Get the status Encryption Passphrase and Keys for Config Export(and Import)
  - REST call:
    - method: GET 
    - URI: /api/node/mo/uni/exportcryptkey.xml

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec exportcryptkey-status
  ```

  ## 5.12 query-dhcp-client
  - REST call:
    - method: GET 
    - URI: /api/node/class/dhcpClient.xml?query-target-filter=\<query-target-filter>

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec query-dhcp-client <query-target-filter>
  ```

  ## 5.13 check-leaf-existence
  - REST call:
    - method: GET 
    - URI: /api/node/mo/topology/pod-\<pod>/node-\<node>.xml

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec check-leaf-existence <pod> <node> 
  ```

  ## 5.14 check-operation-state
  - REST call:
    - method: GET 
    - URI: /api/node/mo/topology/pod-\<id>/node-\<id>.xml?query-target=subtree&target-subtree-class=infraWiNode


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec check-operation-state <pod> <node> 
  ```

  ## 5.15 check-epg-config
  - REST call:
    - method: GET 
    - URI: /api/node/mo/topology/pod-\<pod>/node-\<node>/sys/phys-[phys].xml?rsp-subtree-include=full-deployment&target-node=all&target-path=l1EthIfToEPg


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec check-epg-config <pod> <node> <phys> 
  ```

  ## 5.16 change-apic-adminState
  - REST call:
    - method: POST 
    - URI: /api/node/mo/topology/pod-\<podId>/node-\<nodeId>/av.xml
    - body: <fabricNode dn="topology/pod-\<podId>/node-\<podId>" adSt=\<adSt>/>

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec change-apic-adminState <podId> <nodeId> <adSt> 
  ```

  ## 5.17 change-apic-service-state
  - REST call:
    - method: POST 
    - URI: /api/node/mo/topology/pod-\<podId>/node-\<nodeId>/av.xml
    - body: <infraWiNode dn="topology/pod-\<podId>/node-\<nodeId1>/av/\<nodeId2>" adminSt=\<adminSt>/> 


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec change-apic-service-state <podId> <nodeId1> <nodeId2> <adminSt> 
  ```

  ## 5.18 switch-decommission
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/fabric/outofsvc.xml
    - body: \<fabricRsDecommissionNode tDn="topology/pod-\<podId>/node-\<nodeId>" removeFromController="true"/>

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec switch-decommission <podId> <nodeId>
  ```

  ## 5.19 switch-register 
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/controller/nodeidentpol.xml
    - body: <fabricNodeIdentP dn="uni/controller/nodeidentpol/nodep-\<nodeId>"  serial=\<serial>  nodeId=\<nodeId>  name=\<name> status=\"created,modified\"/>


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec switch-register <serial> <nodeId> <name>
  ```

  ## 5.20 switch-commission  
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/fabric/outofsvc.xml
    - body: \<fabricRsDecommissionNode tDn="topology/pod-\<podId>/node-\<nodeId>" status="deleted"/>


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec switch-commission <nodeId> <podId>
  ```


  ## 5.21 switch-commission  
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/fabric/outofsvc.xml
    - body: \<fabricRsDecommissionNode tDn="topology/pod-<podId>/node-<nodeId>" status="deleted"/>

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec switch-commission <nodeId> <podId>
  ```

  ## 5.21 download_apic_image   
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/fabric/fwrepop/osrc-\<name>
    - body: {"firmwareOSource":{"attributes":{"dn":"uni/fabric/fwrepop/osrc-\<name>", name":\<name>,"url":\<imagePath>
  "proto":"http","status":"created,modified","rn":"osrc-\<name>"},"children":[]}}


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec download_apic_image <name> <imagePath>
  ```

  ## 5.22 status_download_apic_image
  - REST call:
    - method: GET 
    - URI: /api/node/mo/topology/pod-\<pod>/node-\<node>/sys/phys-[phys].xml?rsp-subtree-include=full-deployment&target-node=all&target-path=l1EthIfToEPg


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec status_download_apic_image <name> 
  ```

  ## 5.22 trigger_apic_update
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/controller.json
    - body: {"ctrlrInst":{"attributes":{"dn":"uni/controller", "status":"modified"},"children":[{"firmwareCtrlrFwP":{"attributes":{"dn":"uni/controller/ctrlrfwpol"
  ,"ignoreCompat":"false","version":"%s","name":"%s"},"children":[]}},
  {"maintCtrlrMaintP":{"attributes":{"dn":"uni/controller/ctrlrmaintpol","adminSt":"triggered"},
  "children":[]}},{"trigSchedP":{"attributes":{"dn":"uni/controller/schedp-%s","status":"modified"},
  "children":[{"trigAbsWindowP":{"attributes":{"dn":"uni/controller/schedp-%s/abswinp-%s"
  ,"date":"%s"},"children":[]}}]}}]}}


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec trigger_apic_update <version> <name> <schedp> <abswinp> <date> 
  ```

  ## 5.23 status_update
  - REST call:
    - method: GET 
    - URI: /api/node/class/maintUpgJob.json?"query-target-filter=and(eq(maintUpgJob.fwPolName,"all"))&order-by=maintUpgJob.modTs|desc"


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec status_update <fwPolName>
  ```

  ## 5.24 trigger_leaf_update
  - REST call:
    - method: POST 
    - URI: /api/node/mo/uni/fabric.json
    - body: {"fabricInst":{ ... "children":[{"maintMaintGrp":{ ... "children":[{"fabricNodeBlk":{


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec trigger_leaf_update <maintgrp> <leafs> <maintpol> <version> <schedp> <abswinp> <date>

  ```
  ## 5.25 get_pods
  - REST call:
    - method: GET 
    - URI: /api/node/class/fabricPod.json

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec get_pods
  ```

  ## 5.26 get_pod_nodes
  - REST call:
    - method: GET 
    - URI: api/node/mo/topology/pod-\<pod>?query-target=children&target-subtree-class=fabricNode&query-target-filter=and(eq(fabricNode.role,"\<type-filter>"))

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec get_pod_nodes <type-filter> <pod>
  ```


  ## 5.27 get_pod_node_interfaces
  - REST call:
    - method: GET 
    - URI: /api/node/mo/topology/pod-<pod>/node-<node>/l1PhysIf.json

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec get_pod_node_interfaces <pod> <node>

  OR

  admin@ncs(config-config)# live-status exec get_pod_node_interfaces <pod>
  ```

  ## 5.28 get_bgpPeerEntrys
  - REST call:
    - method: GET 
    - URI: api/node/mo/topology/pod-\<pod>/node-\<node>/sys/bgp/inst/dom-\<dom>.json?
  query-target=subtree&target-subtree-class=bgpPeerEntry&subscription=\<subscription>


  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec get_pod_nodes <pod> <node> <dom> <subscription>
  ```

  ## 5.29 get_bgpPeers
  - REST call:
    - method: GET 
    - URI: /api/node/class/bgpPeer.json

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-apicdc-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# live-status exec get_bgpPeers
  ```


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  ## 7.1 /apic/pkiExportEncryptionKey container not present at sync-from

  It seems that the APIC device version 6.0 does not export pkiExportEncryptionKey in the 
  exported configuration. This will manifest itself in the fact that this configuration will not 
  ne present whne executing a sync-from. To verify this issue the user can execute
  "devices device cisco-apicdc-0 live-status cisco-apicdcstats:exec show-run" and look
  for the pkiExportEncryptionKey object.

  As for the configuration part it seems that the APIC device does accept the configuration
  that come from the NED side regarding pkiExportEncryptionKey object.


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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-apicdc logging level debug
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


# 10. Ned read timeout policy
---------------------------------
- From  v3.0.24 the NED adopts a custom timeout policy. When getting the configuration
from the CISCO APIC device several steps are executed:
  * 1. An configuration export is triggered.
  * 2. The configuration file is copied by APIC on local host or a remote host.
  * 3. The configuration file is read and the config is loaded in NSO configuration database.

- There are two timeout values that can be modified:

  * devices device <apicdc-device> read-timeout  <seconds>
    - Guards the time interval between step 1. and the first time the config file appears on the host.

  * devices device <apicdcdev> ned-settings cisco-apicdc cfgDownloadTimeout <ms>
    - Guards the time in which the config file is downloaded on the host.

# 11. APIC cluster health handling
-------------------------------
APIC has a field, "health" field, to indicate its health state if APIC is available to accept the configuration changes/updates. 
If the field shows "fully-fit", that means the APIC is available to use for normal operation.
If the field shows any other state, that means we can't use the primary APIC.

When the "health" field shows other state than "fully-fit" the NED needs to inspect another alternative host
(if configured in ned-settings cisco-apicdc alternative-hosts).

The following filed enables the extra health check:

```
devices device <apicdcdev> ned-settings cisco-apicdc commit-fully-fit-only (default FALSE)
```

When the "commit-fully-fit-only" field is set to "TRUE" an extra device status read will be performed after login,
and if the "healt" field is not set to "fully-fit" then the device will be rejected, and the ned will try the devices from the "alternative-hosts" list.
