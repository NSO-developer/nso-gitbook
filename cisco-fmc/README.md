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

  This document describes the cisco-fmc NED.

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
  | live-status actions       | yes       | The standard action get-any is supported                         |
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
  | Cisco Firepower           | 6.5.0           | Cisco  |                                                   |
  | Management Center for     |                 | Fire   |                                                   |
  | VMWare                    |                 | Linux  |                                                   |
  |                           |                 | OS     |                                                   |
  |                           |                 | 6.5.0  |                                                   |
  |                           |                 | (build |                                                   |
  |                           |                 | 6)     |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-fmc-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-fmc-1.0.1.signed.bin
      > ./ncs-6.0-cisco-fmc-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-fmc-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-fmc-1.0.1.tar.gz
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
     `cisco-fmc-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-fmc-1.0.1.tar.gz
     > ls -d */
     cisco-fmc-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-fmc-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-fmc-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-fmc-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-fmc-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-fmc-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-fmc-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-fmc-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-fmc-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-fmc-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id cisco-fmc-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
  - Optionally set the ssl to accept-any
    ```
    admin@ncs(config)# devices device dev-1 ned-settings cisco-fmc-connection ssl accept-any
    ```


  - Define a custom managed device registration timeout value:

    The NED setting parameter async-task-timeout value is used at device registration as a timeout.

    The default is set to 600 seconds, if managed devices registration takes more due to the 
    complexity of the environment, this value could be increased here.

    ```
    admin@ncs(config)# devices device dev-1 ned-settings cisco-fmc cisco-fmc-settings async-task-timeout <value>
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

  `$NSO_RUNDIR/logs/ned-cisco-fmc-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-fmc logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-fmc logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.firemc \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-fmc logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-fmc logger java true
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

  ## 4.1 Configure access policies

  * Access rules lists suport insert : before, after, first, last in:
    - /ncs:devices/device{\*}/config/cisco-fmc:policy/accesspolicies{\*}/categories{\*}/accessrules{\*}
    - /ncs:devices/device{\*}/config/cisco-fmc:policy/accesspolicies{\*}/accessrules{\*}

  Please see bellow example:



  - The following starting config is on the device:
    ```
    policy accesspolicies NSO_Test_Policy01
     ...
     categories NsoTestCategory01
      accessrules TestAccessPolCategory01Rule01
       category        NsoTestCategory01
       ...
     categories NsoTestCategory02
      accessrules TestAccessPolCategory02Rule01
       category        NsoTestCategory02
       ...
      accessrules TestAccessPolCategory02Rule02
       category        NsoTestCategory02
       ...
     accessrules nsoNotCatRule01
     ...

     ```
  - Define new access rules:
    ```
    admin@ncs(config-config)# pwd
    Current submode path:
      devices device cisco-fmc-0 \ config


    admin@ncs(config-config)# 
    cisco-fmc:policy accesspolicies NSO_Test_Policy01
    accessrules nsoNotCatRule02
    action ALLOW
    sendEventsToFMC true
    logFiles false
    logBegin true
    logEnd true
    variableSet name  Default-Set
    sourceZones objects TestSecZone01
    exit
    destinationPorts objects Bittorrent
    protocol TCP
    type ProtocolPortObject
    exit
    destinationZones objects TestSecZone4
    exit
    sourceNetworks objects IPv4-Private-172.16.0.0-12
    type Network
    exit
    destinationNetworks objects IPv4-Private-192.168.0.0-16
    type Network
    exit
    enabled
    exit

    categories NsoTestCategory02
    accessrules TestAccessPolCategory02Rule03
    category NsoTestCategory02
    action ALLOW
    sendEventsToFMC false
    logFiles false
    logBegin false
    logEnd false
    variableSet name Default-Set
    sourceZones objects TestSecZone01
    exit
    destinationPorts objects Bittorrent
    protocol TCP
    type ProtocolPortObject
    exit
    sourcePorts objects Bittorrent
    protocol TCP
    type ProtocolPortObject
    exit
    destinationZones objects TestSecZone4
    exit
    applications applications BigUpload
    exit
    applications applications BitCoin
    exit
    sourceNetworks objects IPv4-Private-172.16.0.0-12
    type Network
    exit
    destinationNetworks objects IPv4-Private-192.168.0.0-16
    type Network
    exit
    enabled
    exit
    exit
    exit
    ```

  - From top level move the newly defined rules where are needed:
    ```
    admin@ncs(config)# pwd
    At top level
    admin@ncs(config)# move devices device cisco-fmc-0 config policy accesspolicies NSO_Test_Policy01 accessrules   nsoNotCatRule02 before nsoNotCatRule01
    admin@ncs(config)# move devices device cisco-fmc-0 config policy accesspolicies NSO_Test_Policy01 categories   NsoTestCategory02 accessrules TestAccessPolCategory02Rule03 before TestAccessPolCategory02Rule01
    ```
  - Commit the config
    ```
    admin@ncs(config)# commit
    Commit complete.
    ```

  - End config on device:
    ```
    policy accesspolicies NSO_Test_Policy01
    ...
     categories NsoTestCategory01
      accessrules TestAccessPolCategory01Rule01
       category        NsoTestCategory01
       ...
     categories NsoTestCategory02
      accessrules TestAccessPolCategory02Rule03
       category        NsoTestCategory02
       ...
      accessrules TestAccessPolCategory02Rule01
       category        NsoTestCategory02
       ...
      accessrules TestAccessPolCategory02Rule02
       category        NsoTestCategory02
       ...
     accessrules nsoNotCatRule02
     ...
     accessrules nsoNotCatRule01
     ...
    ```


# 5. Built in live-status actions
---------------------------------

  This sections describes the RPCs (remote procedure cals) provided by the NED:

  ## 5.1 Get deployable devices 
  REST call: GET /deployment/deployabledevices?expanded=true

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-fmc-0
  admin@ncs(config-device-cisco-fmc-0)# config

  admin@ncs(config-config)# cisco-fmc:actions get-deployabledevices
  ```

  ## 5.2 Request for a deployment of a policy on one or more devices.
  REST call: POST /deployment/deploymentrequests

  ```
  admin@ncs# config
  admin@ncs(config)# devices device cisco-fmc-0
  admin@ncs(config-device-cisco-fmc-0)# config

  admin@ncs(config-config)# cisco-fmc:actions deploy-policy deviceList { name CiscoFTDdev01 } version 0 ignoreWarning true forceDeploy false
  ```


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  ## 7.1 /object/ports limitation
  In ticket FMC-43 the folowing api was added:
   - /object/protocolportobjects
   - /object/icmpv4objects
   - /object/icmpv6objects

  To keep bacward compatibility the list /object/ports that contains all types
  of ports(and as per device API only suports HTTP GET) is also keept.
  To avoid a diff at compare config the service level has to
  also manage this list.

  * When adding new ports:
   ```
  cisco-fmc:object protocolportobjects NED_test_ProtocolPort01
  protocol TCP
  port     9999
  !
  cisco-fmc:object icmpv4objects NED_test_icmpV01
  icmpType 9
  code     0
  !
  cisco-fmc:object icmpv6objects NED_test_icmpV6_01
  icmpType 135
  code     0
  !

  cisco-fmc:object ports NED_test_ProtocolPort01

  cisco-fmc:object ports NED_test_icmpV01

  cisco-fmc:object ports NED_test_icmpV6_01
  ```

  * When deleting ports:
  ```
  no cisco-fmc:object protocolportobjects NED_test_ProtocolPort01
  no cisco-fmc:object icmpv4objects NED_test_icmpV4_01
  no cisco-fmc:object icmpv6objects NED_test_icmpV6_01

  no cisco-fmc:object ports NED_test_ProtocolPort01
  no cisco-fmc:object ports NED_test_icmpV4_01
  no cisco-fmc:object ports NED_test_icmpV6_01
  ```

  ## 7.2 /policy/ftdnatpolicies limitation
  In ticket FMC-42 the folowing api was added:
   - /policy/ftdnatpolicies */before-manualnatrules *
   - /policy/ftdnatpolicies */after-manualnatrules *

  Plese note that before commiting before-manualnatrules and after-manualnatrules
  the /policy/ftdnatpolicies has to be created first.

  Also because the /policy/ftdnatpolicies/manualnatrules device API does not suport
  a name or index, when adding /policy/ftdnatpolicies */before-manualnatrules * and
  /policy/ftdnatpolicies */after-manualnatrules * use incrementing indexes in NSO.

  ```
  policy ftdnatpolicies NatPolFMC-42

  before-manualnatrules 1
  before-manualnatrules 2
  before-manualnatrules 3

  after-manualnatrules 4
  after-manualnatrules 5
  after-manualnatrules 6
  ```

  ## 7.3 /policy/ftds2svpns limitation
  In ticket FMC-45 the folowing api was added:
  - /policy/ftds2svpns */endpoints *
  - /policy/ftds2svpns */ikeSettings IkeSetting
  - /policy/ftds2svpns */ipsecSettings IPSecSetting

  Plese note that before commiting endpoints, ikeSettings and ipsecSettings
  the /policy/ftds2svpns has to be created first on device.

  ## 7.4 /object/extendedaccesslists limitation
  In ticket FMC-85 the following api was added:
  - /object/extendedaccesslists

  Please note that modification of a list entry is not supported by the NED.
  What is supported is just creation of a new list entry and deletion of an entry.

  This limitation resulted from the way the REST API json for this endpoint is structured:
  ```
    { "items": [
      {
      "type": "ExtendedAccessList",
      "entries": [
        { entry_1 },
        { entry_2 },
        { entry_3 },
        ...
      ]
  ```
  In the above example entry_1,entry_2,entry_3, do not have any UUIDs or names. Besides that all can be identical.
  In NED yang a list is modeled mandatory with a key. The fact that the entries can be identical makes generating keys to identify them prone to error.

  At sync-from the NED will automatically generate the sequence list key on the order on which entry entry_x is present in the entries list.

  When creating new extendedaccesslists use incrementing numbers for the sequence list key:
  ```
  cisco-fmc:object extendedaccesslists test_extendedAccess_list_01
  overridable false
  entries 1
  logLevel INFORMATIONAL
  ...
  entries 2
  ...
  entries 3
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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-fmc logging level debug
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

