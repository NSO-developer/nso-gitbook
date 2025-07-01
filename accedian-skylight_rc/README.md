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
  5. Built in RPC actions
     5.1. rpc clean-package
     5.2. rpc compile-modules
     5.3. rpc export-package
     5.4. rpc get-modules
     5.5. rpc list-modules
     5.6. rpc list-profiles
     5.7. rpc patch-modules
     5.8. rpc rebuild-package
     5.9. rpc show-default-local-dir
     5.10. rpc show-loaded-schema
  6. Built in live-status show
  7. Limitations
  8. How to report NED issues and feature requests
  9. How to rebuild a NED
  10. NED connection methods
  11. NED Notifications
  ```


# 1. General
------------

  This document describes the accedian-skylight_rc NED.

  Accedian Skylight is a RESTCONF NED based on Accedian 3PY yang models. The 3PY yang models are slightly parsed while the NED is recompiled in order to make the model RESTCONF compliant.

  The NED is in POC state and it is not fully tested for full-RESTCONF CRUD operaitions.

  The NED connection with the device is based on either mTLS certificates or authorization bearer.
  Please check additional content in this readme and README-ned-settings.md

  IMPORTANT:
  This NED is delivered without any of the device YANG models bundled to the NED package.

  It is required to download the YANG files separately and rebuild the NED package before the NED is
  fully operational. See the README-rebuild.md for further information.

  The recommended way to do this is by following the steps below:

   1. Install and setup the NED. See chapter 1.1 to 1.3
   2. Download the YANG models. See chapter 1.1 in README-rebuild.md for the recommended method (alternatives are described in
      README-rebuild.md chapter 2 and 3).
   3. Rebuild the NED. See chapter 1.3 in README-rebuild.md (an alternative with a custom NED-ID is described in README-rebuild.md chapter 4).
   4. Reload the NED in NSO. See chapter 1.4 in README-rebuild.md

  Additional README files bundled with this NED package
  ```
  +---------------------------+------------------------------------------------------------------------------+
  | Name                      | Info                                                                         |
  +---------------------------+------------------------------------------------------------------------------+
  | README-ned-settings.md    | Information about all run time settings supported by this NED.               |
  |                           |                                                                              |
  | README-rebuild.md         | Detailed instructions on how to download the device YANG models and          |
  |                           | rebuilding the NED with them.                                                |
  +---------------------------+------------------------------------------------------------------------------+
  ```

  Common NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | netsim                    | yes       | Netsim device on port 7888, implements mTLS                      |
  |                           |           |                                                                  |
  | check-sync                | no        | Returns Unsupported                                              |
  |                           |           |                                                                  |
  | partial-sync-from         | no        | Not supported                                                    |
  |                           |           |                                                                  |
  | live-status actions       | no        | Currently not needed                                             |
  |                           |           |                                                                  |
  | live-status show          | no        | Does not support TTL'based data                                  |
  |                           |           |                                                                  |
  | load-native-config        | no        | Not implemented                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```
  Custom NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | notifications             | yes       | Supports all Accedian Skylight notification streams (service,    |
  |                           |           | session, service-endpoint)                                       |
  |                           |           |                                                                  |
  | notification-stream-      | yes       | Supports automated stream discovery for notifs                   |
  | autodiscovery             |           |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Accedian Skylight Gateway | NA              | NA     | Accedian Skylight Gateway Rest                    |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```

  Verified YANG model bundles
  ```
  +---------------------------+-----------------+------------------------------------------------------------+
  | Bundle                    | Version         | Info                                                       |
  +---------------------------+-----------------+------------------------------------------------------------+
  | Accedian                  | NA              | Accedian Skylight 3PY yang model                           |
  +---------------------------+-----------------+------------------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-accedian-skylight_rc-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-accedian-skylight_rc-1.0.1.signed.bin
      > ./ncs-6.0-accedian-skylight_rc-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-accedian-skylight_rc-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-accedian-skylight_rc-1.0.1.tar.gz
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

  **IMPORTANT**:

  This NED is delivered as an “empty” package, i.e without any device YANG models bundled.
  It must be rebuilt with the device YANG models to become operational.

  The procedure to rebuild the empty NED (described in the README-rebuild.md) shall typically
  be done in a lab environment. For this step a “local install” of the NED shall be used.
  It is not suitable to use “system install” here since it is intended for production systems only.

  Once this NED has been rebuilt with the device YANG and exported to one or many
  separate tar.gz customized NED packages, a “system installation” can be used on them.


### 1.2.1 Local install
-----------------------

  This section describes how to install a NED package on a locally installed NSO
  (see "NSO Local Install" in the NSO Installation guide).

  It is assumed the NED package has been been unpacked to a tar.gz file as described in 1.1.

  1. Untar the tar.gz file. This creates a new sub-directory named:
     `accedian-skylight_rc-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-accedian-skylight_rc-1.0.1.tar.gz
     > ls -d */
     accedian-skylight_rc-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package accedian-skylight_rc-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package accedian-skylight_rc-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-accedian-skylight_rc-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package accedian-skylight_rc-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/accedian-skylight_rc-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-accedian-skylight_rc-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-accedian-skylight_rc-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install accedian-skylight_rc-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-accedian-skylight_rc-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-accedian-skylight_rc-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id accedian-skylight_rc-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
    **IMPORTANT**:

    The *device-type* shall always be set to *generic* when configuring a device instance
    to use a 3PY NED. A common mistake is configuring it as *netconf*, which will cause
    NSO to use its internal netconf client instead.

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

  `$NSO_RUNDIR/logs/ned-accedian-skylight_rc-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings accedian-skylight_rc logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings accedian-skylight_rc logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.AccedianSkylight \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings accedian-skylight_rc logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings accedian-skylight_rc logger java true
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

  The following example represents a common use-case of creating service-endpoints, sessions and services:

  ```
  admin@ncs(config-config)#
  admin@ncs(config-config)# service-endpoints service-endpoint NED-SE-EP01
  admin@ncs(config-service-endpoint-NED-SE-EP01)#    endpoint-name "NED_SE_EP01"
  admin@ncs(config-service-endpoint-NED-SE-EP01)#    description   "NED Session sender EP01"
  admin@ncs(config-service-endpoint-NED-SE-EP01)#    type          ne-endpoint
  admin@ncs(config-service-endpoint-NED-SE-EP01)#    config ne-config ne-id p.P-.881-KiKIKKKk.
  admin@ncs(config-service-endpoint-NED-SE-EP01)#    config ne-config vlan-id 11
  admin@ncs(config-service-endpoint-NED-SE-EP01)#    config ne-config ip 22.11.22.11
  admin@ncs(config-service-endpoint-NED-SE-EP01)# exit
  admin@ncs(config-config)# service-endpoints service-endpoint NED-SE-EP02
  admin@ncs(config-service-endpoint-NED-SE-EP02)#    endpoint-name "NED_SE_EP02"
  admin@ncs(config-service-endpoint-NED-SE-EP02)#    description   "NED Session sender EP02"
  admin@ncs(config-service-endpoint-NED-SE-EP02)#    type          ne-endpoint
  admin@ncs(config-service-endpoint-NED-SE-EP02)#    config ne-config ne-id p.P-.881-KiKIKKKk.
  admin@ncs(config-service-endpoint-NED-SE-EP02)#    config ne-config vlan-id 22
  admin@ncs(config-service-endpoint-NED-SE-EP02)#    config ne-config ip 11.22.11.22
  admin@ncs(config-service-endpoint-NED-SE-EP02)# exit
  admin@ncs(config-config)#
  admin@ncs(config-config)# sessions session NED_Test_Session_01
  admin@ncs(config-session-NED_Test_Session_01)#    session-name NED_Test_Session_01
  admin@ncs(config-session-NED_Test_Session_01)#    session-type twamp-light
  admin@ncs(config-session-NED_Test_Session_01)#    service-endpoints NED-SE-EP01
  admin@ncs(config-service-endpoints-NED-SE-EP01)#     session-protocol twamp-light session-reflector admin-state true
  admin@ncs(config-service-endpoints-NED-SE-EP01)#    exit
  admin@ncs(config-session-NED_Test_Session_01)#    service-endpoints NED-SE-EP01
  admin@ncs(config-service-endpoints-NED-SE-EP01)#     session-protocol twamp-light session-sender admin-state true
  admin@ncs(config-service-endpoints-NED-SE-EP01)#     session-protocol twamp-light session-sender reflector-udp-port 888
  admin@ncs(config-service-endpoints-NED-SE-EP01)#    exit
  admin@ncs(config-session-NED_Test_Session_01)# exit
  admin@ncs(config-config)# sessions session NED_Test_Session_02
  admin@ncs(config-session-NED_Test_Session_02)#    session-name NED_Test_Session_02
  admin@ncs(config-session-NED_Test_Session_02)#    session-type twamp-light
  admin@ncs(config-session-NED_Test_Session_02)#    service-endpoints NED-SE-EP01
  admin@ncs(config-service-endpoints-NED-SE-EP01)#     session-protocol twamp-light session-sender admin-state true
  admin@ncs(config-service-endpoints-NED-SE-EP01)#     session-protocol twamp-light session-sender reflector-ip 11.11.11.11
  admin@ncs(config-service-endpoints-NED-SE-EP01)#     session-protocol twamp-light session-sender report-interval 35
  admin@ncs(config-service-endpoints-NED-SE-EP01)#     session-protocol twamp-light session-sender test-packets payload-size 120
  admin@ncs(config-service-endpoints-NED-SE-EP01)#     session-protocol twamp-light session-sender test-packets dscp 1
  admin@ncs(config-service-endpoints-NED-SE-EP01)#     session-protocol twamp-light session-sender test-packets ttl 200
  admin@ncs(config-service-endpoints-NED-SE-EP01)#     session-protocol twamp-light session-sender test-packets vlan-priority 7
  admin@ncs(config-service-endpoints-NED-SE-EP01)#    exit
  admin@ncs(config-session-NED_Test_Session_02)#    service-endpoints NED-SE-EP02
  admin@ncs(config-service-endpoints-NED-SE-EP02)#     session-protocol twamp-light session-sender admin-state true
  admin@ncs(config-service-endpoints-NED-SE-EP02)#     session-protocol twamp-light session-sender reflector-udp-port 888
  admin@ncs(config-service-endpoints-NED-SE-EP02)#    exit
  admin@ncs(config-session-NED_Test_Session_02)# exit
  admin@ncs(config-config)# services service NED_service_1
  admin@ncs(config-service-NED_service_1)#    service-name ned_service_1
  admin@ncs(config-service-NED_service_1)#    sessions NED_Test_Session_01
  admin@ncs(config-sessions-NED_Test_Session_01)#    exit
  admin@ncs(config-service-NED_service_1)#    sessions NED_Test_Session_02
  admin@ncs(config-sessions-NED_Test_Session_02)#    exit
  admin@ncs(config-service-NED_service_1)# exit
  ```

  Checking the NED device-native output:

  ```
  admin@ncs(config-config)# commit dry-run outformat native
  native {
      device {
          name accsky-1
          data RESTCONF POST :: <NED NOT CONNECTED>/restconf/data/Accedian-service-endpoint:service-endpoints
               {
                   "Accedian-service-endpoint:service-endpoint":[{
                       "endpoint-id":"NED-SE-EP01",
                       "endpoint-name":"NED_SE_EP01",
                       "description":"NED Session sender EP01",
                       "type":"Accedian-service-endpoint-type:ne-endpoint",
                       "config":{
                           "Accedian-service-endpoint-ne:ne-config":{
                               "ne-id":"p.P-.881-KiKIKKKk.",
                               "vlan-id":11,
                               "ip":"22.11.22.11"
                           }
                       }
                   }]
               }
               RESTCONF POST :: <NED NOT CONNECTED>/restconf/data/Accedian-service-endpoint:service-endpoints
               {
                   "Accedian-service-endpoint:service-endpoint":[{
                       "endpoint-id":"NED-SE-EP02",
                       "endpoint-name":"NED_SE_EP02",
                       "description":"NED Session sender EP02",
                       "type":"Accedian-service-endpoint-type:ne-endpoint",
                       "config":{
                           "Accedian-service-endpoint-ne:ne-config":{
                               "ne-id":"p.P-.881-KiKIKKKk.",
                               "vlan-id":22,
                               "ip":"11.22.11.22"
                           }
                       }
                   }]
               }
               RESTCONF POST :: <NED NOT CONNECTED>/restconf/data/Accedian-session:sessions
               {
                   "Accedian-session:session":[{
                       "session-id":"NED_Test_Session_01",
                       "session-name":"NED_Test_Session_01",
                       "session-type":"Accedian-session-type:twamp-light",
                       "service-endpoints":[{
                           "endpoint-id":"NED-SE-EP01",
                           "session-protocol":{
                               "Accedian-session-twamp-light:twamp-light":{
                                   "session-sender":{
                                       "admin-state":true,
                                       "reflector-udp-port":888
                                   },
                                   "session-reflector":{
                                       "admin-state":true
                                   }
                               }
                           }
                       }]
                   }]
               }
               RESTCONF POST :: <NED NOT CONNECTED>/restconf/data/Accedian-session:sessions
               {
                   "Accedian-session:session":[{
                       "session-id":"NED_Test_Session_02",
                       "session-name":"NED_Test_Session_02",
                       "session-type":"Accedian-session-type:twamp-light",
                       "service-endpoints":[{
                           "endpoint-id":"NED-SE-EP01",
                           "session-protocol":{
                               "Accedian-session-twamp-light:twamp-light":{
                                   "session-sender":{
                                       "admin-state":true,
                                       "reflector-ip":"11.11.11.11",
                                       "report-interval":35,
                                       "test-packets":{
                                           "payload-size":120,
                                           "dscp":1,
                                           "ttl":200,
                                           "vlan-priority":7
                                       }
                                   }
                               }
                           }
                       },{
                           "endpoint-id":"NED-SE-EP02",
                           "session-protocol":{
                               "Accedian-session-twamp-light:twamp-light":{
                                   "session-sender":{
                                       "admin-state":true,
                                       "reflector-udp-port":888
                                   }
                               }
                           }
                       }]
                   }]
               }
               RESTCONF POST :: <NED NOT CONNECTED>/restconf/data/Accedian-service:services
               {
                   "Accedian-service:service":[{
                       "service-id":"NED_service_1",
                       "service-name":"ned_service_1",
                       "sessions":[{
                           "session-id":"NED_Test_Session_01"
                       },{
                           "session-id":"NED_Test_Session_02"
                       }]
                   }]
               }
      }
  }
  admin@ncs(config-config)#
  ```

  Commiting the changes to the device:

  ```
  admin@ncs(config-config)#commit
  Commit complete.
  admin@ncs(config-config)#
  ```

  Checking if there are compare-config issues: (Note: compare-config output should be empty, otherwise something went wrong with the commit)


  ```
  admin@ncs(config-config)# compare-config
  admin@ncs(config-config)#
  ```

  Starting/Stopping sessions:

  ```
  admin@ncs(config-config)# sessions session NED_Test_Session_01
  admin@ncs(config-session-NED_Test_Session_01)# start

  ```


# 5. Built in RPC actions
---------------------------------

  ## 5.1. rpc clean-package
  -------------------------

    Cleans the NED package from all downloaded third party YANG files.

      Input arguments:

      - verbose <empty>

        Print the full clean output also for successful executions (otherwise only printed on errors).


  ## 5.2. rpc compile-modules
  ---------------------------

    Compile YANG modules, showing all non-fatal warnings found.

      Input arguments:

      - local-dir <string>

        Path to the directory where the YANG files are found (defaults to src/yang in package).


      - no-deviations <empty>

        Set to disable deviations.


  ## 5.3. rpc export-package
  --------------------------

    Export the customized and rebuilt NED. The exported archive file can then be used to install the
    NED package in other NSO instances. The name of the file will have the following format ncs-<NSO
    version>-<NED name>-<NED-version>-customized.tgz.

      Input arguments:

      - destination <string> (default /tmp)

        Set destination directory for the exported archive file.


      - suffix <string> (default -customized)

        Configure a customized suffix to the name of the archive file.


  ## 5.4. rpc get-modules
  -----------------------

    Fetch the YANG modules advertised by the device, from device or given source.

      Input arguments:

      - module-include-regex <string>

        Regular expression matching all YANG models to be included in the download. Example:
        'openconfig-.*'.


      - module-exclude-regex <string>

        Regular expression matching all YANG models to be excluded from the download. Example:
        'tailf-.*'.


      - namespace-include-regex <string>

        Regular expression matching all namespaces to be included in the download. Example:
        'tailf-.*'.


      - namespace-exclude-regex <string>

        Regular expression matching all namespaces to be excluded from the download. Example:
        'tailf-.*'.


      - module-additional-include-regex <string>

        Regular expression matching additional YANG models that are not advertised by the device. For
        instance vendor specific deviation models. Example: cisco-nx-openconfig-deviations.*.


      - module-additional-exclude-regex <string>

        Regular expression matching exceptions from the additional-include-regex.


      - profile <string>

        Use a download profile to match a predefined subset of matching YANG files.


      - local-dir <string>

        Path to the directory where the YANG files are to be copied (defaults to src/yang in package).


      - ignore-errors <empty>

        Ignore errors during download. For example missing files of failed revision checks.


        Either of:

          - remote device <empty>

            The device itself.

        OR:

          - remote dir <string>

            A directory on the local host holding all YANG files. For instance a local clone of a git
            repository.

        OR:

          - remote archive <string>

            A path to a zip/tgz archive file containing the YANG files.

        OR:

          - remote git repository <string>

            The URL to the git repository. Example: https://github.com/YangModels/yang.git.

          - remote git dir <string>

            Path to a sub directory inside the git repo where the YANG files can be found. Example:
            vendor/cisco/nx/10.1-2.

          - remote git checkout <string>

            Optionally, a name of a branch/tag in the git repo where the YANG files can be found.
            Example: master.

          - remote git include-dir <string>

            Optional extra include paths to be used when searching for YANG files. Each include path
            is relative to the git root directory.


  ## 5.5. rpc list-modules
  ------------------------

    Use this command to list the YANG modules advertised by the device. Returns a list with module
    names, including revision tag if available.

      Input arguments:

      - module-include-regex <string>

        Regular expression matching all YANG models to be included in the download. Example:
        'openconfig-.*'.


      - module-exclude-regex <string>

        Regular expression matching all YANG models to be excluded from the download. Example:
        'tailf-.*'.


      - namespace-include-regex <string>

        Regular expression matching all namespaces to be included in the download. Example:
        'tailf-.*'.


      - namespace-exclude-regex <string>

        Regular expression matching all namespaces to be excluded from the download. Example:
        'tailf-.*'.


      - module-additional-include-regex <string>

        Regular expression matching additional YANG models that are not advertised by the device. For
        instance vendor specific deviation models. Example: cisco-nx-openconfig-deviations.*.


      - module-additional-exclude-regex <string>

        Regular expression matching exceptions from the additional-include-regex.


      - profile <string>

        Use a download profile to match a predefined subset of matching YANG files.


  ## 5.6. rpc list-profiles
  -------------------------

    List all predefined download profiles bundled with the NED. Including a short description of each.

      No input arguments


  ## 5.7. rpc patch-modules
  -------------------------

    Patch YANG modules, to remove non-fatal warnings found.

      Input arguments:

      - local-dir <string>

        Path to the directory where the YANG files are found (defaults to src/yang in package).


      - no-deviations <empty>

        Set to disable deviations.


      - output-dir <string>

        Path to the directory where the patched YANG files are written (defaults to src/yang in
        package), existing files will be renamed to <name>.yang.orig.


  ## 5.8. rpc rebuild-package
  ---------------------------

    Rebuild the NED package directly from within NSO. This invokes the gnu make internally.

      Input arguments:

      - verbose <empty>

        Print the full build output also for successful builds (otherwise only printed on errors).


      - profile <string>

        Apply a certain build profile.


      - filter scope dir <string>

        Directory containing one or many xml file representing the wanted scope.


      - filter trim-schema method <enum> (default patch)

        Select method to be used for trimming.

        deviate  - Trim by creating a YANG deviation file containing all selected nodes.

        patch    - Trim by patching the YANG models and remove all selected nodes from them before
                   they are being compiled.


        Either of:

          - filter trim-schema nodes <string>

            List of nodes to trim. Use one of the pre-defined top node names. Alternatively, specify a
            custom xpath to trim (prefix is mandatory on each element in the path).

        OR:

          - filter trim-schema all-unused <empty>

            Trim all currently unused nodes in the schema. This means all config nodes that are
            currently not populated in CDB.

        OR:

          - filter trim-schema nodes-from-file <string> (default /tmp/nedcom-trim-schema-nodes.txt)

            Specify a path to a custom file to be used for trimming nodes. The file shall contain
            schema paths, including relevant prefixes to all nodes to be trimmed. One schema path per
            line.

        OR:

          - filter trim-schema custom-deviation-file <string>

            Specify a path to a custom YANG deviation file to be used for trimming the schema. The
            file shall comply to the standard for deviation files and contain paths to all nodes to be
            trimmed from the schema.

        OR:


      - filter auto-config dir <string>

        Directory containing the files used for auto-config filtering. The following files must be
        present: before.xml and after.xml.


      - filter auto-config file <string> (default /tmp/nedcom-auto-deviations.yang)

        Name of auto generated deviation file.


      - ned-id major <string>

        Set a custom major number in the generated ned-id.


      - ned-id minor <string>

        Set a custom minor number in the generated ned-id.


      - ned-id suffix <string>

        Set a custom suffix in the generated ned-id.


      - additional-build-args <string>

        Additional arguments to pass to build(make) commands.


  ## 5.9. rpc show-default-local-dir
  ----------------------------------

    Show the path to the default directory where the YANG files are to be copied. I.e <path to current
    NED package>/src/yang.

      No input arguments


  ## 5.10. rpc show-loaded-schema
  -------------------------------

    Display the schema currently built into the NED package. Each node will by default be listed with
    a schema path.

      Input arguments:

      - scope <enum> (default all)

        Select the scope for the nodes that will be listed.

        all     - Display all nodes in the schema. This is the default.

        used    - Display only the config nodes in use, i.e currently populated in CDB.

        unused  - Display only the config nodes that are not in use.


      - count <empty>

        Count the nodes and return the sum instead of the full list of nodes.


      - root-paths <string>

        Specify root paths for which nodes shall be listed or counted. Only nodes with a schema path
        starting any of the specified roots will then be processed.


      - details <empty>

        Display schema details like must/when expression, leafrefs and leafref targets.


      - config <true|false> (default true)

        Set to false to display non config nodes in the schema. Note: scope will in this case be
        'all'.

  The NED does not support live-status actions.


# 6. Built in live-status show
------------------------------

  The NED does not support TTL'based data


# 7. Limitations
----------------

  Accedian Skylight have strong limitations related to service-endpoints creation. This is because the server handles the service-endpoint management.
  It is not possible to create a service-endpoint from scratch, however, it is possible to delete an existing service-endpoint and to re-create it with the same id.


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
     admin@ncs(config)# devices device dev-1 ned-settings accedian-skylight_rc logging level debug
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

  Check the README-rebuild.md file, chapter 1.3, for more information.


# 10. NED connection methods
----------------------------

The NED has the following authentication options thoward the device: mTLS
Note: it is highly recommeded to use 'ned-settings accedian-skylight_rc connection ssl accept-any false', but for this, the server certificate needs to be valid and trusted by a CA.
If it is not the case, then set accept-any to true:

```
ned-settings accedian-skylight_rc connection ssl accept-any true
```

For the mTLS mode, use the following ned-settings;

```
devices device accsky-1
 address         <server-ip-or-hostname>
 port            <server-port>
 authgroup       default
 device-type generic ned-id accedian-skylight_rc
 state admin-state unlocked
 ned-settings accedian-skylight_rc connection ssl accept-any false
 ned-settings accedian-skylight_rc connection ssl certificate <server-cert>
 ned-settings accedian-skylight_rc connection ssl mtls client certificate <client-cert>
 ned-settings accedian-skylight_rc connection ssl mtls client private-key <client-key>
 ned-settings accedian-skylight_rc live-status time-to-live 15
 ned-settings accedian-skylight_rc restconf url-base "/restconf"
 ned-settings accedian-skylight_rc restconf model-discovery disabled
 ned-settings accedian-skylight_rc restconf profile accedian-skylight_rc
 ned-settings accedian-skylight_rc connection authentication method none
 ned-settings accedian-skylight_rc restconf notif automatic-stream-discovery enabled
 ned-settings accedian-skylight_rc restconf notif preferred-encoding json
 ned-settings accedian-skylight_rc restconf capability-discovery disabled
 ned-settings accedian-skylight_rc restconf config gather-updates-into-single-patch true
 ned-settings accedian-skylight_rc restconf config update-method put

```

Note: the certificates format (eg server/client cert/key) shall be entered in DER Base64 format, which is the same as the PEM format but without the banners \"----- BEGIN CERTIFICATE-----\", \"----- END CERTIFICATE-----\" and newlines (eg '\n') should be escaped (eg replace '\n' with '\\n').

Here is an example of how a certificate should look like:

```
ned-settings accedian-skylight_rc connection ssl certificate "MIIFrDCCBJSgAwIBAgISA0OTtTWsWgFCAjyUCH4PcMfhMA0GCSqGSIb3DQEBCwUA\nMDIxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MQswCQYDVQQD\nEwJSMzAeFw0yMzAzMDYyMTM3NDJaFw0yMzA2MDQyMTM3NDFaMEIxQDA+BgNVBAMT\nN3BlcmZvcm1hbmNlLnBlcmZvcm1hbmNlLmFnZW50c2xhYi5hbmFseXRpY3MuYWNj\nZWRpYW4uaW8wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDfViyXJXn3\nZWJNciV8qGeiCJhzwOmaUAyhH38UCXpRDQpXhuALuvK9l3BsYImLlEQBxwoAO8ki\nMnRHRZrZk/o28WQ3kHHkQ2A+DRE7AhtJe4d/pe9apqDS2tGRPrZ/2l08v3V4XxyU\n45C7Gkvt3CZ94+meRmfxHQzwqDiFqG8dYOinsxDO815VgjE0FweZhd5sPn4s+JXk\nDMhilDp6VxiBIjanAP5BUldp8TLtItsEz2taIXXwSfSYbmLi2Z5bYAOr9FhtcFOC\nki8lfk9hsDSNsG3tnR+YlzM6ck1Dr10Jam80P2Kf/zzmV92cNeOBn00KCF6i5XjG\nSTq0giI2AAEZAgMBAAGjggKqMIICpjAOBgNVHQ8BAf8EBAMCBaAwHQYDVR0lBBYw\nFAYIKwYBBQUHAwEGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFNaK\nacTcDrSbB/lTYKMRGsqNPBt7MB8GA1UdIwQYMBaAFBQusxe3WFbLrlAJQOYfr52L\nFMLGMFUGCCsGAQUFBwEBBEkwRzAhBggrBgEFBQcwAYYVaHR0cDovL3IzLm8ubGVu\nY3Iub3JnMCIGCCsGAQUFBzAChhZodHRwOi8vcjMuaS5sZW5jci5vcmcvMHoGA1Ud\nEQRzMHGCNmFuYWx5dGljczEucGVyZm9ybWFuY2UuYWdlbnRzbGFiLmFuYWx5dGlj\ncy5hY2NlZGlhbi5pb4I3cGVyZm9ybWFuY2UucGVyZm9ybWFuY2UuYWdlbnRzbGFi\nLmFuYWx5dGljcy5hY2NlZGlhbi5pbzBMBgNVHSAERTBDMAgGBmeBDAECATA3Bgsr\nBgEEAYLfEwEBATAoMCYGCCsGAQUFBwIBFhpodHRwOi8vY3BzLmxldHNlbmNyeXB0\nLm9yZzCCAQQGCisGAQQB1nkCBAIEgfUEgfIA8AB2AHoyjFTYty22IOo44FIe6YQW\ncDIThU070ivBOlejUutSAAABhrkSy48AAAQDAEcwRQIhAP1KEfRw2KlUrSkl4s2y\ntD2o8ZNIlcLfyUd3Cgxm2v1CAiBt/lRVvILBJKrLs+fyhfPv48Gwj9p4bOYyym5x\njs+XCwB2AK33vvp8/xDIi509nB4+GGq0Zyldz7EMJMqFhjTr3IKKAAABhrkSy7cA\nAAQDAEcwRQIgd2lLSYzz8Qyy2MsUAH/ug0yFW00/uBsVPHUVMsCw4N0CIQCnnaWR\nohpVUV6wV1yg4wOk2+85Z8kqAKrxs9WOIrOfxjANBgkqhkiG9w0BAQsFAAOCAQEA\nW9fbOIawvoGEes//ddPbO2j0HccFzfljq/mPJG9rC28woCrOu7NA5zKHYZSjjgk6\nHRUtfN51zm3Pww+X7e1zq0LhPQfBXw/XCyFlCTXL3m8pjwJAaoy1NU5qG1ivW4YP\n7zaLq11AjEIkwyBuhz8Zd6lk84eOn4BFxZvSyZmCnbwJ8OTrfyQ2Yy34ameDdcxQ\nPw/ullGjS3u7mLU/DJWLzf0VkAxxSzo4d2CkteEEaaQl5QasjjH4VLA/NsGozjMP\nn0RVXLU/CREWPsRabxh5z3seUwRBzoliAdnCEXLeeDGKxYV27h1jRaAaf3xyioVX\nzBoz0BW3JL5MQF0HHhQYSQ=="
```

For more details of other ned-settings, please check README-ned-settings.md


# 11. NED Notifications
------------------------

The NED supports all notifications streams of Accedian Skylight device.
In order to check the available streams on the device, run the following command:

```
admin@ncs# show devices device accsky-1 notifications stream
notifications stream notification-stream/Accedian-service-endpoint:state-change-event
 description              "This notification is sent when the state of the endpoint changes"
 replay-support           true
 replay-log-creation-time 2024-03-26T16:51:09.89014+00:00
notifications stream notification-stream/Accedian-service:state-change-event
 description              "A top level notification providing state change information on the service and it's\nassociated service sessions and service endpoints"
 replay-support           true
 replay-log-creation-time 2024-03-26T13:23:45.883485+00:00
notifications stream notification-stream/Accedian-session:state-change-event
 description              "This notification is sent when the state of the session changes"
 replay-support           true
 replay-log-creation-time 2024-03-27T10:35:57.18182+00:00
notifications stream notification-stream/sal-remote:data-changed-notification
 description    "Data change notification."
 replay-support true
admin@ncs#
```

After finding out the usable notifications streams, create new subscriptions in order to subscribe to a certain stream:

```
dmin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# devices device accsky-1
admin@ncs(config-device-accsky-1)# notifications subscription TEST_SUB01 stream notification-stream/Accedian-session:state-change-event local-user admin
admin@ncs(config-subscription-TEST_SUB01)# commit
Commit complete.
admin@ncs(config-subscription-TEST_SUB01)#
```

Note: once the subscription configuration is commited, the notification stream monitoring is started automatically and notifications will be received.

To check for received notifications:

```
admin@ncs(config-subscription-TEST_SUB01)#
admin@ncs# show devices device accsky-1 notifications received-notifications
notifications received-notifications notification 2024-03-27T16:25:20.025481+00:00 0
 user          admin
 subscription  TEST_SUB01
 stream        notification-stream/Accedian-session:state-change-event
 received-time 2024-03-27T16:25:20.15546+00:00
 data acdses:state-change-event session-id bt_demo_Session_ID_2
 data acdses:state-change-event status Stopped
admin@ncs# show devices device accsky-1 notifications received-notifications
notifications received-notifications notification 2024-03-27T16:25:20.025481+00:00 0
 user          admin
 subscription  TEST_SUB01
 stream        notification-stream/Accedian-session:state-change-event
 received-time 2024-03-27T16:25:20.15546+00:00
 data acdses:state-change-event session-id bt_demo_Session_ID_2
 data acdses:state-change-event status Stopped
admin@ncs#
```

Stopping and starting a notification subscription:

```
admin@ncs# config
admin@ncs(config)# devices device accsky-1 notifications subscription TEST_SUB01
admin@ncs(config-subscription-TEST_SUB01)# disconnect
admin@ncs(config-subscription-TEST_SUB01)# reconnect
admin@ncs(config-subscription-TEST_SUB01)#
```
