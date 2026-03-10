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

  This document describes the cisco-ise NED.

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
  | Cisco Identity Services   | 3.2.0           |        |                                                   |
  | Engine for VMWare         |                 |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-ise-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-ise-1.0.1.signed.bin
      > ./ncs-6.0-cisco-ise-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-ise-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-ise-1.0.1.tar.gz
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
     `cisco-ise-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-ise-1.0.1.tar.gz
     > ls -d */
     cisco-ise-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-ise-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-ise-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-ise-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-ise-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-ise-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-ise-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-ise-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-ise-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-ise-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id cisco-ise-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
  - Optionally set the ssl to accept-any
    ```
    admin@ncs(config)# devices device dev-1 ned-settings connection ssl accept-any
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

  `$NSO_RUNDIR/logs/ned-cisco-ise-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-ise logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-ise logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.identityservicesengine \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-ise logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-ise logger java true
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

  ## 4.1 Perform a sync-from 

  Perform a sync-from to get the configuration from the device:

  ```
  admin@ncs#config 
  admin@ncs(config)#devices device dev-1
  admin@ncs(config-device-dev-1)# sync-from 
  result true
  ```

  ## 4.2 Configure cisco-ise:ise policy network-access policy-set 

  Define 'ned_test_policy_set_01':

  ```
  admin@ncs# config 
  admin@ncs(config)#devices device dev-1 config
  admin@ncs(config-config)# cisco-ise:ise policy network-access policy-set ned_test_policy_set_01
  default false
  description "NED TEST 01"
  state enabled
  condition conditionType ConditionAndBlock
  condition isNegate false
  condition children 0
  dictionaryName HP
  attributeName HP-Command-Exception
  attributeValue Deny-List
  conditionType ConditionAttributes
  isNegate false
  operator equals
  exit
  condition children 1
  dictionaryName "Network Access"
  attributeName WasMachineAuthenticated
  attributeValue False
  conditionType ConditionAttributes
  isNegate false
  operator equals
  exit
  serviceName "Default Network Access"
  isProxy false
  ```

  When ned_test_policy_set_01 will be created on the device the Default authorization will be also created.
  To avoid a diff in config between NSO and the device we create this Default configuration:

  ```
  admin@ncs(config-policy-set-ned_test_policy_set_01)# authorization Default
  default true
  state enabled
  profile [ DenyAccess ]
  exit
  exit
  admin@ncs(config-config)# 
  ```

  Define 'ned_test_policy_set_02':

  ```
  admin@ncs(config-config)#cisco-ise:ise policy network-access policy-set ned_test_policy_set_02
  default false
  description "NED TEST 02"
  state enabled
  condition conditionType ConditionAttributes
  condition isNegate false
  condition dictionaryName PassiveID
  condition attributeName PassiveID_Provider
  condition operator equals
  condition attributeValue Agent
  serviceName "Default Network Access"
  isProxy false
  authorization Default
  default true
  state enabled
  profile [ DenyAccess ]
  exit
  exit
  ```

  Since the device allows adding new policy sets only above the Default one the newly created entries need to be moved:

  ```
  admin@ncs(config-config)# top move devices device dev-1 config ise policy network-access policy-set ned_test_policy_set_01 before Default
  admin@ncs(config-config)# top move devices device dev-1 config ise policy network-access policy-set ned_test_policy_set_02 before Default
  ```

  Commit:

  ```
  admin@ncs(config-config)# commit
  Commit complete.
  ```

  ## 4.2 Modify policy network-access policy-set 

  Modify the condition of the newly created 'ned_test_policy_set_02'. We will create a more complex condition with multiple children.

  Please note that the name of the condition children is an integer and it must represent the position of the child within the list. For more details about this please see the Limitations section 7.5 from this document.


  ```
  admin@ncs(config-config)#cisco-ise:ise policy network-access policy-set ned_test_policy_set_02
  admin@ncs(config-policy-set-ned_test_policy_set_02)#no condition
  admin@ncs(config-policy-set-ned_test_policy_set_02)#condition conditionType ConditionAndBlock
  condition isNegate false
  condition children 0
  conditionType  ConditionAttributes
  isNegate       false
  dictionaryName PassiveID
  attributeName  PassiveID_Provider
  operator       equals
  attributeValue Agent
  exit
  condition children 1
  conditionType ConditionAndBlock
  isNegate      false
  children 0
  conditionType  ConditionAttributes
  isNegate       false
  dictionaryName 3gpp
  attributeName  3gpp-3GPP-GLI
  operator       equals
  attributeValue test
  exit
  children 1
  conditionType  ConditionAttributes
  isNegate       false
  dictionaryName Cisco-VPN3000
  attributeName  CVPN3000/ASA/PIX7x-WebVPN-Port-Forwarding-Enable
  operator       equals
  attributeValue 1234
  exit
  children 2
  conditionType ConditionOrBlock
  isNegate      false
  children 0
  conditionType  ConditionAttributes
  isNegate       false
  dictionaryName Microsoft
  attributeName  MS-CHAP-CPW-1
  operator       equals
  attributeValue 1243
  exit
  children 1
  conditionType  ConditionAttributes
  isNegate       false
  dictionaryName DEVICE
  attributeName  "Device Type"
  operator       equals
  attributeValue "All Device Types"
  exit
  exit
  exit
  admin@ncs(config-policy-set-ned_test_policy_set_02)# commit 
  Commit complete.
  ```

  Another example is to replace a condition child:

  ```
  admin@ncs(config-policy-set-ned_test_policy_set_02)#no condition children 0
  admin@ncs(config-policy-set-ned_test_policy_set_02)#condition children 0
  conditionType ConditionOrBlock
  isNegate      false
  children 0
  conditionType  ConditionAttributes
  isNegate       false
  dictionaryName Microsoft
  attributeName  MS-CHAP-CPW-1
  operator       equals
  attributeValue 1243
  exit
  children 1
  conditionType  ConditionAttributes
  isNegate       false
  dictionaryName DEVICE
  attributeName  "Device Type"
  operator       equals
  attributeValue "All Device Types"
  exit
  exit
  admin@ncs(config-policy-set-ned_test_policy_set_02)# commit 
  Commit complete.
  ```

  ## 4.4 Create a cisco-ise:ise policy network-access policy-set <name> authorization

  Define 'ned_test_authorization_pol_00' under the Default policy-set:

  Please note that the name of the condition children is an integer and it must represent the position of the child within the list. For more details about this please see the Limitations section 7.5 from this document.


  ```
  admin@ncs# config 
  admin@ncs(config)#devices device dev-1 config
  admin@ncs(config-config)#cisco-ise:ise policy network-access policy-set Default
  authorization ned_test_authorization_pol_00
  default false
  state enabled
  securityGroup Contractors
  profile [ DenyAccess Non_Cisco_IP_Phones ]
  condition conditionType ConditionAndBlock
  condition isNegate false

  condition children 0
  conditionType  ConditionAttributes
  isNegate false
  dictionaryName Cisco-VPN3000
  attributeName  CVPN3000/ASA/PIX7x-IE-Proxy-Server
  operator equals
  attributeValue 192.168.3.4
  exit
  condition children 1
  conditionType ConditionOrBlock
  isNegate false
  children 0
  conditionType  ConditionAttributes
  isNegate false
  dictionaryName Cisco-VPN3000
  attributeName  CVPN3000/ASA/PIX7x-WebVPN-Port-Forwarding-Enable
  operator equals
  attributeValue 2134
  exit
  children 1
  conditionType  ConditionAttributes
  isNegate false
  dictionaryName Cisco-VPN3000
  attributeName  CVPN3000/ASA/PIX7x-WebVPN-Port-Forwarding-HTTP-Proxy
  operator equals
  attributeValue 2314
  exit
  exit
  condition children 2
  conditionType ConditionOrBlock
  isNegate false
  children 0
  conditionType  ConditionAttributes
  isNegate false
  dictionaryName Cisco-VPN3000
  attributeName  CVPN3000/ASA/PIX7x-WebVPN-Port-Forwarding-HTTP-Proxy
  operator equals
  attributeValue 2131
  exit
  children 1
  conditionType  ConditionAttributes
  isNegate false
  dictionaryName Cisco-VPN3000
  attributeName  CVPN3000/ASA/PIX7x-User-Auth-Server-Port
  operator equals
  attributeValue 2314
  exit
  children 2
  conditionType ConditionAndBlock
  isNegate      false
  children 0
  conditionType  ConditionAttributes
  isNegate false
  dictionaryName Radius
  attributeName  Login-LAT-Port
  operator equals
  attributeValue 231
  exit
  children 1
  conditionType  ConditionAttributes
  isNegate false
  dictionaryName Cisco-VPN3000
  attributeName  CVPN3000/ASA/PIX7x-User-Auth-Server-Port
  operator equals
  attributeValue 13
  exit
  children 2
  conditionType  ConditionAttributes
  isNegate false
  dictionaryName Cisco-VPN3000
  attributeName  CVPN3000/ASA/PIX7x-WebVPN-Port-Forwarding-Enable
  operator equals
  attributeValue 21
  exit
  children 3
  name Wireless_802.1X
  conditionType ConditionReference
  isNegate false
  description   "A condition to match 802.1X based authentication requests from wireless LAN controllers, according to the corresponding 802.1x attributes defined in the device profile."
  exit
  children 4
  name Switch_Web_Authentication
  conditionType ConditionReference
  isNegate false
  description "A condition to match requests for web authentication from switches, according to the corresponding Web Authentication attributes defined in the device profile."
  exit
  exit
  exit
  exit
  exit
  ```

  Since the device allows adding new authorization rules only above the Default one the newly created entries need to be moved:

  ```
  admin@ncs(config-config)# top move devices device dev-1 config ise policy network-access policy-set Default authorization ned_test_authorization_pol_00 before Default
  ```

  Commit the changes:

  ```
  admin@ncs(config-config)# commit 
  Commit complete.
  ```


# 5. Built in live-status actions
---------------------------------

  NONE


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  ## 7.1 cisco-ise:ise networkdevicegroup limitation

  The NED user must mimic the behavior of the device API when creating resources
  under "/ers/config/networkdevicegroup" endpoint.

  When a POST is done to /ers/config/networkdevicegroup endopint with body:
  ```
  {
    "NetworkDeviceGroup": {
      "name": "Location#All Locations#HRN#3rd Floor#SE Lab",
      ...
  ```

  the device will create not one but three resources under /ers/config/networkdevicegroup endpoint:
  ```
  {
    "NetworkDeviceGroup": {
      "name": "Location#All Locations#HRN",
      ...

  {
    "NetworkDeviceGroup": {
      "name": "Location#All Locations#HRN#3rd Floor",
      ...
  {
    "NetworkDeviceGroup": {
      "name": "Location#All Locations#HRN#3rd Floor#SE Lab",
      ...
  ```

  To avoid a difference between the NED configuration and the device configuration
  the NED user needs to mimic this behavior when using the NED by creating all the
  hierarchy:
  ```
  cisco-ise:ise networkdevicegroup "Location#All Locations#HRN"
  description "HRN"
  ndgtype Location

  cisco-ise:ise networkdevicegroup "Location#All Locations#HRN#3rd Floor"
  description "HRN"
  ndgtype Location

  cisco-ise:ise networkdevicegroup "Location#All Locations#HRN#3rd Floor#SE Lab"
  description "HRN"
  ndgtype Location
  ```
  The same care must be taken when deleting entries from this hierachy.
  For example, if we whant to delete "Location#All Locations#HRN"
  we must also delete "Location#All Locations#HRN#3rd Floor" and
  "Location#All Locations#HRN#3rd Floor#SE Lab":
  ```
  no cisco-ise:ise networkdevicegroup "Location#All Locations#HRN"
  no cisco-ise:ise networkdevicegroup "Location#All Locations#HRN#3rd Floor"
  no cisco-ise:ise networkdevicegroup "Location#All Locations#HRN#3rd Floor#SE Lab"
  ```

  For for both creation and deletion the NED will asure the right order of REST API calls.

  Failing to mimic this device API behavior will result in a out of sync between
  the device and the NED (there will be differences between the device config and NED config).

  ## 7.2 Default authorization rule limitation

  When creating an entry in cisco-ise:ise policy network-access policy-set,the ISE device will
  automatically create a default authorization rule:

  ```
  cisco-ise:ise policy network-access policy-set <policy-name> authorization Default
  ```

  This will cause an out of sync situation where the device config will differ NSO config.
  To mitigate this device behavior you need to create the Default rule in the same commit with the
  policy-set like below.

  ```
  admin@ncs#config
  admin@ncs(config)#devices device dev-1
  admin@ncs(config-device-dev-1)#config

  admin@ncs(config-config)#cisco-ise:ise policy network-access policy-set test_policy_set
  default     false
  state       enabled
  serviceName "Default Network Access"
  isProxy     false
  condition conditionType ConditionAndBlock
  condition isNegate false
  condition children Radius null Framed-IP-Netmask 255.255.255.0
  conditionType ConditionAttributes
  isNegate      false
  operator      ipEquals
  exit
  condition children Radius null Framed-IPv6-Prefix 324
  conditionType ConditionAttributes
  isNegate      false
  operator      equals
  exit

  authorization Default
  default true
  state enabled
  profile [ DenyAccess ]
  exit
  exit
  ```

  ## 7.3 Default policy-set must be the last in the list

  For the cisco-ise:ise policy network-access policy-set list the device is supporting adding
  new entries only before the Default (so Default policy-set must remain the last item in the list).

  To mitigate this requirement you must first create the desired policy sets, then move it in the
  desired position in the list and after that commit the changes. The NED will automatically generate the
  "rank" parameter that is used to inform the ISE device about the policy position within the list.


  ```
  admin@ncs(config-config)#admin@ncs#config
  admin@ncs(config)#devices device dev-1
  admin@ncs(config-device-dev-1)#config

  admin@ncs(config-config)#cisco-ise:ise policy network-access policy-set ned_test_policy_set_01
  default     false
  description "NED TEST 01"
  state       enabled
  condition conditionType ConditionAndBlock
  condition isNegate false
  condition children HP null HP-Command-Exception Deny-List
  conditionType ConditionAttributes
  isNegate      false
  operator      equals
  exit
  condition children "Network Access" null WasMachineAuthenticated False
  conditionType ConditionAttributes
  isNegate      false
  operator      equals
  exit
  serviceName "Default Network Access"
  isProxy     false

  authorization Default
  default true
  state enabled
  profile [ DenyAccess ]
  exit
  exit

  cisco-ise:ise policy network-access policy-set ned_test_policy_set_02
  default     false
  description "NED TEST 02"
  state       enabled
  condition conditionType ConditionAndBlock
  condition isNegate false
  condition children "Network Access" null Protocol RADIUS
  conditionType ConditionAttributes
  isNegate      false
  operator      equals
  exit
  condition children Radius null Port-Limit 200
  conditionType ConditionAttributes
  isNegate      false
  operator      equals
  exit
  serviceName "Default Network Access"
  isProxy     false

  authorization Default
  default true
  state enabled
  profile [ DenyAccess ]
  exit
  exit

  admin@ncs(config-config)# top move devices device dev-1 config ise policy network-access policy-set ned_test_policy_set_01 before Default
  admin@ncs(config-config)# top move devices device dev-1 config ise policy network-access policy-set ned_test_policy_set_02 before Default

  admin@ncs(config-config)#commit
  ```
  Failing to move the policy-sets somewhere above the Default will result in following error:

  ```
  device {
     name dev-1
     data External error in the NED implementation for device dev-1: Prepare error:
     The list /ncs:devices/device{dev-1}/config/cisco-ise:ise/policy/network-access/policy-set does not support adding items at the end!
  }
  ```

  ## 7.4 Default policy-set <name> authorization rule must be the last in the list

  For the cisco-ise:ise policy network-access policy-set <policy_set_name> authorization list the device is
  supporting adding new entries only before the Default (so Default authorization must remain the last item in the list).

  To mitigate this requirement you must first create the desired authorization, then move it in the
  desired position in the list and after that commit the changes. The NED will automatically generate the
  "rank" parameter that it is used to inform the ISE device about the authorization position within the list.
  Because of this the NED does not support creating a policy-set and a policy-set/authorization in the same commit.


  ```
  admin@ncs(config-config)#admin@ncs#config
  admin@ncs(config)#devices device dev-1
  admin@ncs(config-device-dev-1)#config

  admin@ncs(config-config)#cisco-ise:ise policy network-access policy-set Default

  authorization ned_test_authorization_pol_01
  default       false
  state         enabled
  securityGroup BYOD
  profile       [ Block_Wireless_Access Cisco_IP_Phones PermitAccess ]
  condition conditionType ConditionAndBlock
  condition isNegate false
  condition children 3gpp null 3gpp-3GPP-HFC_NodeId 2134
  conditionType ConditionAttributes
  isNegate      false
  operator      equals
  exit
  condition children Microsoft null MS-CHAP-CPW-1 sadfFDS
  conditionType ConditionAttributes
  isNegate      false
  operator      equals
  exit
  exit

  authorization ned_test_authorization_pol_02
  default       false
  state         enabled
  securityGroup BYOD
  profile       [ Block_Wireless_Access Cisco_IP_Phones PermitAccess ]
  condition conditionType ConditionAndBlock
  condition isNegate false
  condition children 3gpp null 3gpp-3GPP-HFC_NodeId 2134
  conditionType ConditionAttributes
  isNegate      false
  operator      equals
  exit
  condition children Cisco null cisco-port-used 999
  conditionType ConditionAttributes
  isNegate      false
  operator      equals
  exit
  exit

  exit

  admin@ncs(config-config)# top move devices device dev-1 config ise policy network-access policy-set Default authorization ned_test_authorization_pol_01 before Default
  admin@ncs(config-config)# top move devices device dev-1 config ise policy network-access policy-set Default authorization ned_test_authorization_pol_02 before Default

  admin@ncs(config-config)# commit
  ```

  Failing to move the policy-sets somewhere above the Default will result in following error:

  ```
  device {
      name dev-1
      data External error in the NED implementation for device dev-1: Prepare error:
      The list /ncs:devices/device{dev-1}/config/cisco-ise:ise/policy/network-access/policy-set{test}/authorization does not support adding items at the end!
  }
  ```

  ## 7.5 Condition children name limitation

  Conditions used in :
  "cisco-ise:ise policy network-access condition <name>", 
  "cisco-ise:ise policy network-access policy-set <name> condition" and
  "cisco-ise:ise policy network-access policy-set <name> authorization <name> condition"
  can be also defined using a series of children conditions. 

  In the cisco ISE REST API these children are defined in a list and these children do not have any name field. 
  Since NSO yang lists need to have an index, at sync-from, the NED will generate this index in form of an integer
  that specifies the position of the child in the list.

  When creating a condition that has childrens you must copy this behavior and specify an increasing index that
  represents the position of the child in the list like bellow:

  ```
  cisco-ise:ise policy network-access policy-set Default
  authorization ned_test_authorization_pol_00
  condition conditionType ConditionAndBlock
  condition children 0
    conditionType  ConditionAttributes

  condition children 1
    conditionType ConditionOrBlock

    children 0
      conditionType  ConditionAttributes
    children 1
      conditionType  ConditionAttributes

  condition children 2
    conditionType ConditionOrBlock

    children 0
      conditionType  ConditionAttributes
    children 1
      conditionType ConditionAndBlock

      children 0
        conditionType  ConditionAttributes
      children 1
        conditionType  ConditionAttributes
  ```

  Failing to specify the children index as in the above example will result in an error when a commit is issued.
  Also as it can be seen in the above example that there is a hierarchy of children that define a condition.
  For now the NED only supports a depth of 4 in this hierarchy.

  ```
  condition children 0
    children 0
      children 0
        children 0

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-ise logging level debug
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

