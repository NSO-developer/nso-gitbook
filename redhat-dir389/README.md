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

  This document describes the redhat-dir389 NED.

  ## General info and considerations.

  * **REDHAT-DIR389**: This NED addresses Redhat Dir389 deployments  
    - We  will reffer to them throughout this document simply as "the device" or "the Redhat-DIR389 device".

  * The devices are expected to run RedHat, Fedora or derived Linux systems. Interaction with the device is done via CLI using SSH session encrypted with strong secure ciphers. Telnet is not supported.

  * Since the underlying OS is a Linux based system, unless otherwise requested, live status commands or RPCs are limited/not implemented. 

  * Please make sure you have the right ned-settings configured as below at section 1.3.1 or refer to section 8 from NedSettings readme.

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
  | partial-sync-from         | no        | NED doesn't currently support partial sync-from                  |
  |                           |           |                                                                  |
  | live-status actions       | no        | NED doesn't currently support live-status actions or RPCs        |
  |                           |           |                                                                  |
  | live-status show          | no        | NED doesn't currently support live-status show                   |
  |                           |           |                                                                  |
  | load-native-config        | no        | NED doesn't currently support load-native-config                 |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | RedHat                    |                 | Linux  |                                                   |
  |                           |                 |        |                                                   |
  | Fedora                    |                 | Linux  |                                                   |
  |                           |                 |        |                                                   |
  | Centos                    |                 | Linux  |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-redhat-dir389-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-redhat-dir389-1.0.1.signed.bin
      > ./ncs-6.0-redhat-dir389-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-redhat-dir389-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-redhat-dir389-1.0.1.tar.gz
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
     `redhat-dir389-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-redhat-dir389-1.0.1.tar.gz
     > ls -d */
     redhat-dir389-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package redhat-dir389-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package redhat-dir389-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-redhat-dir389-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package redhat-dir389-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/redhat-dir389-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-redhat-dir389-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-redhat-dir389-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install redhat-dir389-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-redhat-dir389-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-redhat-dir389-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id redhat-dir389-cli-1.0
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



  ### 1.3.1 <MANDATORY!> Configure/define LDAP-SETTINGS:
  -----------------------
    * Define ldap-secret:
        * path:   `<device-name>/ned-settings/redhat-dir389/ldap-settings/ldap-secret`

        * ldap-secret is the directory 389 admin password defined for managing cn=Directory Manager ldap commands
        * It basically represents the -w argument value from ldap commands used

    ---
    Example :
    ```
    admin@ncs(config)# devices device <device-name> ned-settings redhat-dir389 ldap-settings ldap-secret <LDAPADMIN-SECRET>
    ```

  ## 1.3.2 From redhat-dir389 v1.2.0 onwards, additional options are available:
  -----------------------
    * These additional options can be used to enable tls auth and define/customize various ldap commands parameters 

  ```
      admin@ncs(config-device-redhat-dir-1)# ned-settings redhat-dir389 ldap-settings ?
      Possible completions:
        bind-dn           (-D) binddn : bind DN
        host              (-h) host : LDAP server
        ldap-secret       (-w) passwd : bind password (for simple authentication)
        managed-dn-list   Ldap basedn entries NED will manage at sync-from
        port              (-p) port : port on LDAP server
        tls               (-Z) : set Start TLS request; When false, simple auth (-xLLL) is used!
  ```

    * Options are self explanatory as per the **389 Directory Server** official documentation.
    * The intended design is to choose between tls and simple auth so that when tls flag s chosen, simple auth is deactivated.
    In this case bind-dn should be set too to a privileged binddn, to use other than the default `"cn=Directory Manager"`.
    * **NOTE** that when **tls** flag is used, the according flag for each NED-SETTING below will be used globally in all the NED operations.
      * Otherwise, simple auth will be used, using `bind-dn` as `"cn=Directory Manager"` and **ignoring** any additional LDAP server local host and port settings.


  ### 1.3.3 Example of ned-settings configuration with *tls* enabled:
  -----------------------
  ```
        ned-settings redhat-dir389 ldap-settings ldap-secret <$ldap_secret>
        ned-settings redhat-dir389 ldap-settings host ldap://localhost
        ned-settings redhat-dir389 ldap-settings port <$port_no>
        ned-settings redhat-dir389 ldap-settings bind-dn uid=<$uid_string_cn>,ou=<$ou_string>,o=o=<$org_string>,dc=<$dc_string>
        ned-settings redhat-dir389 ldap-settings tls true
        ned-settings redhat-dir389 ldap-settings managed-dn-list [...]o=<$org_string>,dc=<$dc_string>
                                                                 ...
  ```


  ### 1.3.4 Example of ned-settings configuration with *tls* disabled:
  -----------------------
  ```

        ned-settings redhat-dir389 ldap-settings ldap-secret <$ldap_secret>
        ned-settings redhat-dir389 ldap-settings managed-dn-list [...]o=<$org_string>,dc=<$dc_string>
                                                                 ...
  ```

  ##  1.3.5 VERY IMPORTANT! Define managed-dn-list BASE DN or full DN to be managed by the NED.
  -----------------------

   * path:   `<device-name>/ned-settings/redhat-dir389/ldap-settings/managed-dn-list *`

      * Define the dn ldap entries the NED is authorized to manage
      * **PLEASE NOTE THAT THE NED WILL TRY TO MANAGE ONLY THE DEFINED LDAP ENTRIES WITH DN FORMATTED AS FOLLOWS**:
         * [Important UPDATE]: base_dn can be used starting with NED v 1.1
         * if the base dn is provided, all entries returned by ldapsearch will be stored in `/config/ldap-entries` list accordingly.

         * Multiple **"dn"** formats accepted as inputs, i.e.:
            * ou=ouName,o=oName
            * ou=ouName,o=oName,dc=dcValue
            * ou=ouName,o=oName,dc=dcValue1,dc=dcValue2
            * ou=ouName,o=oName1,o=oName2
            * ou=ouName,o=oName1,o=oName2,dc=dcValue
            * ou=ouName,o=oName1,o=oName2,dc=dcValue1,dc=dcValue2

            * cn=abc-def.com,ou=ouName,o=oName
            * cn=abc-def.com,ou=ouName,o=oName,dc=dcValue
            * cn=abc-def.com,ou=ouName,o=oName,o=oName2
            * cn=abc-def.com,ou=ouName,o=oName,o=oName2,dc=dcValue
            * cn=abc-def.com,ou=ouName,o=oName,dc=dcValue1,dc=dcValue2
            * cn=abc-def.com,ou=ouName,o=oName,o=oName2,dc=dcValue1,dc=dcValue2

            * uid=12345,cn=abc-def.com,ou=ouName,o=oName
            * uid=12345,cn=abc-def.com,ou=ouName,o=oName,o=oName2
            * uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcValue
            * uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcValue1,dc=dcValue2
            * uid=12345,cn=abc-def.com,ou=ouName,o=oName,o=oName2,dc=dcValue1
            * uid=12345,cn=abc-def.com,ou=ouName,o=oName,o=oName2,dc=dcValue1,dc=dcValue2

          * **MANDATORY RDN parameters** requested are :
            * **ou**      Managed Organizational Unit Name to run ldap search on (ldapsearch 'ou' param)
            * **o**       Managed Organization to run ldap search on (ldapsearch 'o' param)
          * **OPTIONAL parameters**:
            * **uid**     Managed uid to run ldapsearch on (ldapsearch 'uid' param)
            * **cn**      Managed cn to run ldap search on (ldapsearch 'cn' param)
            * **dc**      Managed dc to run ldap search on (ldapsearch 'dc' param)

    * **Example :**
  ```
  admin@ncs(config)# devices device <device-name> ned-settings redhat-dir389 ldap-settings managed-dn-list uid=<UID>,cn=<cnName>,ou=<OuName>,o=<oName>,<dc=dcValue>
  ```

    * **Commit updated configuration to save ned-settings:**

      `admin@ncs(config)# commit`

    * **Sync-from to collect data from device using the committed ned-settings:**

      `admin@ncs(config)# devices device <device-name> sync-from`

    * **Sample of correct initial ned-settings expected configuration:**
  ```
    admin@ncs(config-device-<device-name>)# show full
     devices device <device-name>
      address         <ip-address>
      port            <SSH-PORT>
      ssh host-key ssh-rsa
       key-data "<ssh-fetch-host-keys>"
      !
      authgroup       <authgroup-name>
      device-type cli ned-id redhat-dir389-cli-1.0
      device-type cli protocol ssh
      trace           raw
      ned-settings redhat-dir389 logging all
      ned-settings redhat-dir389 log-verbose true
      ned-settings redhat-dir389 ldap-settings ldap-secret <ldap-admin-secret>
      ned-settings redhat-dir389 ldap-settings managed-dn-list ou=<OU1>,o=<O1>
      !
      ned-settings redhat-dir389 ldap-settings managed-dn-list ou=<OU1>,o=<O1>,o=<O2>
      !
      ned-settings redhat-dir389 ldap-settings managed-dn-list uid=<UID>,cn=<cnName>,ou=<OuName>,o=<oName>,<dc=dcValue>
      !
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

  `$NSO_RUNDIR/logs/ned-redhat-dir389-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings redhat-dir389 logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings redhat-dir389 logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.dir389 \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings redhat-dir389 logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings redhat-dir389 logger java true
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

  ### NED USAGE EXAMPLE

  ### LDAP entries are managed under ldap-entries list
    ```
      admin@ncs(config-config)# ?           
      Possible completions:
      ldap-entries   Expects dn input formatted with LDIF format - allowed RDNs in a combination of
      (uid, cn, ou, o's and dc's) as per the device configuration;
    ```
  ---            

  ### `/ldap-entries` list has 4 keys requested to work around the unique dn name combination, as defined in ned settings too:

  ```
    admin@ncs(config-config)# ldap-entries ?
    Possible completions:
      dn      dn;; Dn value from [uid?, cn?, ou+, o+, dc?] combinations

            uid     Uid;; uid value to build ldif queries with
            cn      Common Name;; cn value to build ldif queries with
            ou      Organizational Unit;; ou value to build ldif queries with
            o       Organization;; ou value to build ldif queries with
            dc      Domain Component;; dc value to build ldif queries with
  ```
  ---
  ### After the key is provided, all the attributes available will be visible:

  ```
      admin@ncs(config-config)# ldap-entries dn uid=<$uid>,cn=<$cn>,ou=<$o>,o=<$o>,dc=<$dc>
      Possible completions:
        attributes   ;; LDIF formatted attribute list
  ```
  ---
  ### Attributes list can contain quoted LDIF ready <attribute: value> pairs, quoted if the cli doesn't otherwise accept them.

    * Standard formats allowed for maximum flexibility, i.e.:
      * `attributes "<attributeName>: <attributeValue>"`
    * as long as it is in format: 
      * `attributes "<string>: <string>"`

    * This way any attribute pair value can be used inside attributes list:
  ```
      attributes "<attributeName1>: <attributeValue1>"
      attributes "<attributeName2>: <attributeValue2>"
      attributes "<attributeName3>: <attributeValue3>"
      attributes "<attributeName4>: <attributeValue4>"
      attributes "<attributeName5>: <attributeValue5>"
  ```

  ---
  ## 4.1 VERY IMPORTANT: Ldap Entries usage and management

  ### RedHat Dir389 default configuration seems to allow very relaxed combinations of Ldap Entries attributes name : values.

      For example, the creation of attribute "password" is allowed with multiple values, i.e.:
  ```
           ldap-entries dn uid=<$uid>,cn=<$cn>,ou=<$o>,o=<$o>,dc=<$dc>
             attributes "name: <value1>"
             attributes "name: <value2>"
           !
  ```

    Which would be just fine for attribute "objectClass" or "attribute" etc, but it would probably not be okay for
      "expected" unique attributes such as "password".

  ### RedHat directory 389 allows above behavior, and since we don't have any detailed yang design to limit this behavior, it will be allowed in the NED too.

   * Example - see parameters `objectClass`, `password` below:
  ```
      dn: uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dc1
      objectClass: top
      objectClass: cpe
      uid: 12345
      password: password1
      password: password2
      ...
  ```

  ### 4.2 Initial config, sample 

    * Example of a initial config stored in CDB formatting:
  ```
  admin@ncs(config)# devices device <device-name> config
      admin@ncs(config-config)# show full-configuration
      devices device redhat-dir389-1
       config
        ldap-entries dn uid=<$uid>,cn=<$cn>,ou=<$o>,o=<$o>,dc=<$dc>
          attributes "attribute: <value1>"
          attributes "attribute: <value2>"
          attributes "attribute: <value3>"
          attributes "attribute: <value4>"
          attributes "egresspolicyname: <value>"
          attributes "frameipaddress: <value>"
          attributes "frameipv6route: <value>"
          attributes "frameprotocol: <value>"
          attributes "frameroute: <value1>"
          attributes "frameroute: <value2>"
          attributes "frameroute: <value3>"
          attributes "frameroute: <value4>"
          attributes "ingresspolicyname: <value>"
          attributes "lsriname: <value>"
          attributes "objectClass: <value>"
          attributes "objectClass: <value>"
          attributes "password: <value>"
          attributes "servicetype: <value>"
          attributes "uid: <$uid>"
          [...]
        !
        [...]
        ldap-entries dn uid=<$uid>,cn=<$cn>,ou=<$o>,o=<$o>,dc=<$dc>
           attributes "attribute: <value1>"
           attributes "attribute: <value4>"
           [...]
           attributes "servicetype: <value>"
           attributes "uid: <$uid>"
         !
       !
      !
  ```


  ### 4.3 Create new Ldap Entry:
  ---

    * Load a preconfigured template or insert manually all parameters and attributes as needed:
      ```
       admin@ncs(config-config)# rload merge ../../init.cfg
       Loading.
       1.32 KiB parsed in 0.07 sec (17.64 KiB/sec)
       ```

    * Show loaded config:
  ```
  admin@ncs(config-ldap-entries-uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName)# show full
       devices device redhat-dir389-1
        config
         ldap-entries dn uid=54321,cn=abc-def.com,ou=ouName,o=oName,dc=dcName
           attributes "attribute: ATTRIBUTE 01 VALUE"
           attributes "attribute: ATTRIBUTE02VALUE"
           attributes "attribute: ATTRIBUTE-03-VALUE"
           attributes "attribute: ATTRIBUTE 04-VALUE"
           attributes "egresspolicyname: POLICY-VALUE"
           attributes "frameipaddress: 123.456.789.123/12"
           attributes "frameipv6route: 1234:abcd:0:0:100:200:300:1/123 0::0 tag 1234"
           attributes "frameprotocol: PROTO"
           attributes "frameroute: 1.1.1.1/24 tag 181"
           attributes "ingresspolicyname: policy value 2"
           attributes "lsriname: value:value2"
           attributes "objectClass: cpe"
           attributes "objectClass: top"
           attributes "password: password123"
           attributes "servicetype: TYPE"
           attributes "uid: 54321"
          !
        !
       !
  ```

   * Show NSO cli dry run output:
  -----------------------------------------------------------
        admin@ncs(config-ldap-entries-uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName)# commit dry-run                                     
        cli {
            local-node {
                data  devices {
                          device redhat-dir389-1 {
                              config {
                     +            ldap-entries uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName {
                     +                attributes "attribute: ATTRIBUTE 01 VALUE";
                     +                attributes "attribute: ATTRIBUTE02VALUE";
                     +                attributes "attribute: ATTRIBUTE-03-VALUE";
                     +                attributes "attribute: ATTRIBUTE 04-VALUE";
                     +                attributes "egresspolicyname: POLICY-VALUE"
                     [...]
                     +                attributes "uid: 12345";
                     +            }
                              }
                          }
                      }
            }
        }

    * Show prepared command to be sent to the dir389 device (dry run native - SUCCESSFUL SCENARIO) :
  -----------------------------------------------------------
        admin@ncs(config-ldap-entries-uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName)# commit dry-run outformat native
        native {
            device {
                name redhat-dir389-1
                data ldapadd -D "cn=Directory Manager" -w Cisco12345
                     dn: uid=123456,cn=abc-def.com,ou=ouName,o=orgName
                     objectClass: top
                     objectClass: cpe
                     uid: 123456
                     password: passwordValue
                     frameprotocol: PPP
                     servicetype: Framed
                     frameroute: 1.2.3.3/32 tag 987
                     frameroute: 192.123.100.0/24 distance 456 tag 321
                     frameroute: 66.1.111.0/24 distance 123
                     frameipaddress: 255.255.255.255
                     lsriname: abc:DEF
                     egresspolicyname: POLICY-NAME
                     ingresspolicyname: POLICY-NAME2
                     attribute: A02 ATT2-SECOND-VALUE
                     attribute: A03 frame-mode
                     attribute: A01 ATTRIBUTE-SECOND-VALUE
                     attribute: A04 -15
                     frameipv6route: 123:abcd:0:0:100:100:100:1/123 0::0
            }
        }

    * Simulate command to be sent to the dir389 device (dry run native) - **FAILED SCENARIO**:

      * **WARNING: exception will be thrown if NED settings are not updated accordingly. Commit will also be aborted if tried.**

      i.e.:
  -----------------------------------------------------------

          admin@ncs(config-ldap-entries-uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName)# commit dry-run outformat native
          native {
              device {
                  name redhat-dir389-1
                  data Internal error in the NED NCS framework affecting device redhat-dir389-1: EXCEPTION! [123456 abc-def.com ouName orgName ] is NOT defined in ned-settings;
                        Please define it accordingly and retry!
              }
          }

  ###  **TO fix above exception, update ned settings with the dn parameters, commit, run a connect/sync-from and retry.**

  ### 4.4 Delete existing ldap entry

  ```
  admin@ncs(config-config)# no ldap-entries dn uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName
  ```

    * Show NSO cli dry run output:
      ```
      admin@ncs(config-config)# commit dry-run
      cli {
          local-node {
              data  devices {
                        device redhat-dir389-1 {
                            config {
                  -            ldap-entries uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName {
                  -                attributes "attribute: ATTRIBUTE 01 VALUE";
                  -                attributes "attribute: ATTRIBUTE02VALUE";
                  -                attributes "attribute: ATTRIBUTE-03-VALUE";
                  -                attributes "attribute: ATTRIBUTE 04-VALUE";
                  -                attributes "egresspolicyname: POLICY-VALUE"
                  [...]
                  -                attributes "uid: 12345";
                  -            }
                            }
                        }
                    }
          }
      }
      ```
    * Show NSO cli dry run NATIVE output:
      ```
      admin@ncs(config-config)# commit dry-run outformat native
      native {
          device {
              name redhat-dir389-1
              data ldapdelete -D "cn=Directory Manager" -w Cisco12345
                  uid=123456,cn=abc-def.com,ou=ouName,o=orgName
          }
      }
      ```

    * commit
      ```
        admin@ncs(config-config)# commit
        Commit complete.
      ```

  ### 4.5 Modify existing ldap entry - replacing existing attribute value 
  ###     VERY IMPORTANT !: 
  ### To update existing attributes entry, if you wish to just replace the value of a given attribute, you must:
  ####  <1> delete existing attribute first,
  ####  <2> and then add the new attribute


  ###  * Example: update password attribute

    * Enter ldap entry: `admin@ncs(config-config)# ldap-entries dn uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName`

      a) Delete existing specific password attribute:  

          `admin@ncs(config-ldap-entries-uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName)# no attributes password:\ pass12345`

      b) Create expected new password attribute:

          `admin@ncs(config-ldap-entries-uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName)# attributes "password: updatedPAssword"`


  * Show NSO cli dry run output:
      ```
      admin@ncs(config-ldap-entries-uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName)# commit dry-run
      cli {
          local-node {
              data  devices {
                        device redhat-dir-1 {
                            config {
                                ldap-entries uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName {
                    -                attributes "password: pass12345" {
                    -                }
                    +                attributes "password: updatedPAssword" {
                    +                }
                                }
                            }
                        }
                    }
          }
      }
      ```

  * Show NSO cli dry run NATIVE output:
      ```
      admin@ncs(config-ldap-entries-uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName)# commit dry-run outformat native
      native {
        device {
            name redhat-dir-1
            data ldapmodify -D "cn=Directory Manager" -w Cisco12345
                dn: uid=12345,cn=abc-def.com,ou=ouName,o=oName,dc=dcName
                changetype: modify
                delete: password
                password: pass12345
                -
                add: password
                password: updatedPAssword
                -
        }
      }
      ```

  * commit
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
     admin@ncs(config)# devices device dev-1 ned-settings redhat-dir389 logging level debug
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
  > devices device dev-1 ned-settings redhat-dir389 logger level debug
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
