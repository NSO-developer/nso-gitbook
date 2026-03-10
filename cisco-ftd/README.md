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
  8. How to report NED issues
  ```


# 1. General
------------

  This document describes the cisco-ftd NED.

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
  | check-sync                | no        |                                                                  |
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
  | Cisco Firepower Threat    | 6.5             |        |                                                   |
  | Defense for VMWare        |                 |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-ftd-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-ftd-1.0.1.signed.bin
      > ./ncs-6.0-cisco-ftd-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-ftd-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-ftd-1.0.1.tar.gz
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
     `cisco-ftd-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-ftd-1.0.1.tar.gz
     > ls -d */
     cisco-ftd-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-ftd-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-ftd-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-ftd-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-ftd-gen-1.0
      result true
   }
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
               /tmp/ned-package-store/ncs-6.0-cisco-ftd-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-ftd-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-ftd-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-ftd-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-ftd-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id cisco-ftd-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
  - Optionally set the ssl to accept-any
      * Accept any certificate (unsafe).Accept any SSL certificate presented by the device.Warning! This enables Man in the Middle attacks and should only be used for testing and troubleshooting.

    ```
    admin@ncs(config)# devices device dev-1 ned-settings connection ssl accept-any
    ```


  - Optionally configure  HA (High Availability) related settings: 
    * The NED can automatically connect to the other device in the HA pair. The NED has an alternate ip list containing other nodes in HA. If the NED could not connect (get the api version and get the auth token) to the main configured ip,
    it will try one by one the nodes in the list until it will find one that can be connected.

    * Erasing alternative hosts list:

    ```
    admin@ncs(config)# no devices device dev-1 ned-settings cisco-ftd connection ha alternative-hosts
    ```

    * Configuring alternative host list:

    ```
    admin@ncs(config)# devices device dev-1 ned-settings cisco-ftd connection ha alternative-hosts x.x.x.x
    ```

    * By default the NED will read the HA status of the hosts in the alternative-hosts and wait for the status to become HA_ACTIVE_NODE. If the node does not become HA_ACTIVE_NODE in 60 seconds an error will be thrown.

    * The HA state checking feature can be disabled by:
    ```
    admin@ncs(config)# devices device dev-1 ned-settings cisco-ftd connection ha check-ha-active false
    ```

    * The NED can automatically call HA (High Availability) Join after HA is configuration is commited. To enable this:
    ```
    admin@ncs(config)# devices device dev-1 ned-settings cisco-ftd nedBehavior callHaJoinAfterHaConfig true
    ```

  - Optionally configure custom NED behaviour that may be helpful in some situations: 

    * The NED can automatically call HA (High Availability) Join after HA is configuration is commited. To enable this:
    ```
    admin@ncs(config)# devices device dev-1 ned-settings cisco-ftd nedBehavior callHaJoinAfterHaConfig true
    ```

    * The NED can automatically deploy the configuration after each commit. To enable this:

    ```
    admin@ncs(config)# devices device dev-1 ned-settings cisco-ftd nedBehavior enableAutoDeploy true
    ```

    * The NED can automatically end the initial easy setup device state. To enable this:

    ```
    admin@ncs(config)# devices device dev-1 ned-settings cisco-ftd nedBehavior autoEndEasySetup true
    ```

    * The device does not return the token value for the: cisco-ftd:ftd license smartagentconnections smartagentconnection token. The NED cand handle this behaviour by reading the last value of the token from its configuration database at sync-from.
    To enable this:

    ```
    admin@ncs(config)# devices device dev-1 ned-settings cisco-ftd nedBehavior retrieve-old-license-token-val true
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

  `$NSO_RUNDIR/logs/ned-cisco-ftd-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-ftd logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-ftd logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.ftd \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-ftd logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-ftd logger java true
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

  ## 4.1 Sample configuration of cisco-ftd:ftd object ipv4prefixlists, cisco-ftd:ftd object routemaps, cisco-ftd:ftd object realms


  ```
  admin@ncs#config
  devices device dev-1
  config
  cisco-ftd:ftd object ipv4prefixlists NEDIPv4ProfixList
  entries 192.168.2.0/24
  action PERMIT
  sequence 2
  minPrefixLength 32
  type ipprefixentry
  exit
  exit


  cisco-ftd:ftd object routemaps ravpn-routeMap3
  entries 20
  action PERMIT
  type routemapentry
  ipv4PrefixListAddresses NEDIPv4ProfixList
  exit
  metricRouteValues [ 120 ]
  routeTypeExternal1 false
  routeTypeExternal2 false
  routeTypeInternal false
  routeTypeLocal false
  routeTypeNSSAExternal1 false
  routeTypeNSSAExternal2 false
  asPathConvertRouteTagIntoASPath false
  communityListSettingInternet false
  communityListSettingNoAdvertise false
  communityListSettingNoExport false
  automaticTagSetting false
  exit
  exit


  cisco-ftd:ftd object realms NedTestIdRealm02
  directoryConfigurations ad.example.com
  port 390
  encryptionProtocol NONE
  type directoryconfiguration
  exit
  enabled
  systemDefined false
  dirUsername nedTestUser
  dirPassword 123
  baseDN ou
  adPrimaryDomain www.example.com
  exit

  admin@ncs(config-config)# commit 
  Commit complete.

  ```


# 5. Built in live-status actions
---------------------------------

  This sections describes the RPCs (remote procedure cals) provided by the NED:

  ## 5.1 cisco-ftd:ftd actions ha break
  - REST call:
    - method: POST 
    - URI: /api/fdm/\<api-version>/devices/default/action/ha/break?clearIntfs=false
    - body: empty

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions ha break
  ```

  ## 5.2 cisco-ftd:ftd actions ha join
  - REST call:
    - method: POST 
    - URI: /api/fdm/\<api-version>/devices/default/action/ha/join
    - body: empty

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions ha join
  ```

  ## 5.3 cisco-ftd:ftd actions ha resume
  - REST call:
    - method: POST 
    - URI: /api/fdm/\<api-version>/devices/default/action/ha/resume
    - body: empty

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions ha resume
  ```

  ## 5.4 cisco-ftd:ftd actions ha suspend
  - REST call:
    - method: POST 
    - URI: /api/fdm/\<api-version>/devices/default/action/ha/suspend
    - body: empty

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions ha suspend
  ```

  ## 5.5 cisco-ftd:ftd actions ha failover
  - REST call:
    - method: POST 
    - URI: /api/fdm/\<api-version>/devices/default/action/ha/failover
    - body: empty

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions ha failover
  ```

  ## 5.6 cisco-ftd:ftd actions ha reset
  - REST call:
    - method: POST 
    - URI: /api/fdm/\<api-version>/devices/default/action/ha/reset
    - body: empty

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions ha reset
  ```

  ## 5.7 cisco-ftd:ftd actions ntpstatus
  - REST call:
    - method: GET 
    - URI: /api/fdm/\<api-version>/operational/ntpstatus/{objId}

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions ntpstatus <ntp-name>
  ```

  ## 5.8 cisco-ftd:ftd actions smartagentstatuses
  - REST call:
    - method: GET 
    - URI: /api/fdm/\<api-version>//license/smartagentstatuses

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions smartagentstatuses
  ```

  ## 5.9 cisco-ftd:ftd actions smartagentsyncrequests
  - REST call:
    - method: POST 
    - URI: /api/fdm/\<api-version>/license/smartagentsyncrequests
    - body: {"sync":true, "type":"smartagentsyncrequest"}

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions smartagentsyncrequests sync <boolean>
  ```

  ## 5.10 cisco-ftd:ftd actions easysetupstatus
  - REST call:
    - method: POST 
    - URI: /api/fdm/\<api-version>/easysetup/easysetupstatus
    - body: {"nextPage":"string", "currentPage":"string", "taskComplete":true, "type":easysetupstatus"}

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions smartagentsyncrequests nextPage <string> currentPage <string>  taskComplete <boolean>
  ```


  ## 5.11 cisco-ftd:ftd actions provision
  - REST call:
    - method: POST 
    - URI: /api/fdm/\<api-version>/devices/default/action/provision
    - body: {"currentPassword":"string", "newPassword":"string", "acceptEULA":true, "type":initialprovision", "eulaText":"eula text"}

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions provision currentPassword <string> newPassword <string>  acceptEULA <boolean>
  ```

  ## 5.12 cisco-ftd:ftd actions deploy-configuration
  - REST call:
    - method: POST 
    - URI: /api/fdm/\<api-version>/operational/deploy
    - body: empty

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions deploy-configuration deploy
  ```

  ## 5.13 cisco-ftd:ftd actions generic-call
  - A generic POST/GET/DELETE/PUT to any uri and with any body

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions generic-call http-method <string> uri <string> body <string>
  ```

  ## 5.14 cisco-ftd:ftd actions command
  - REST call:
    - method: POST 
    - URI: /api/fdm/\<api-version>/action/command
    - body: {"commandInput":"string", "timeOut":"string", "type":Command"}

  ```
  admin@ncs# config
  admin@ncs(config)# devices cisco-ftd-0
  admin@ncs(config-device-cisco-fmc-0)# config
  admin@ncs(config-config)# cisco-ftd:ftd actions command commandInput <string> timeOut <string>
  ```


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  # 7.1 Smartagentconnection token limitation
  The device does not return the token value for the: cisco-ftd:ftd license smartagentconnections smartagentconnection token. 
  The NED cand handle this behaviour by reading the last value of the token from its configuration database at sync-from.
    To enable this:

    ```
    admin@ncs(config)# devices device dev-1 ned-settings cisco-ftd nedBehavior retrieve-old-license-token-val true
    ```


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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-ftd logging level debug
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

