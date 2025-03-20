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

  This document describes the unix-bind NED.


  This document describes the NED for the BIND9 DNS server project deployed on *NIX servers.
  This README applies to unix-bind project for the for NED version 2.1 onwards.


  ## 1.2 Quick summary on creating a new record file which is not present in ned-settings yet:
  - update "ned-settings/unix-bind/file-settings/record-files" list adding the full path to the new file
  - commit
  - sync-from
  - add/delete the config parsed and stored at sync

  ## 1.3 Quick summary on deleting a file record completely and permanently (including any potential legacy content present out there):
  - delete record file entry present under config (i.e. delete devices device <device-name> config unix-bind:record-file Apn1.db)
  - commit
  - remove file path entry from "ned-settings/unix-bind/file-settings/record-files"
  - commit
  - sync-from

  ## 1.4 Quick summary on deleting only the NED managed data within a file record:
  - delete all records under the record file, but NOT the record file entry itself from example 4.3.a;
    i.e.: 
    % delete devices device <device-name> config unix-bind:record-file Apn1.db resource-record domain1.naptr 
    % delete devices device <device-name> config unix-bind:record-file Apn1.db resource-record domain2.naptr 
    ...
  -  commit

  -  at this step, there are two possibilities:

     - I. File is kept for future possible usages, nothing else is done.

       - The existing record from record-file just confirms we are still watching over the defined file record as well and it is still manageable.

       - At this point, adding a new record can be easily done without adding again file path in ned-settings.

        I.e. running show on config will give you something like:

          unix-bind:record-file Apn1.db
            file-data filePath /path/to/folder/Apn1.db
          !

    - II. If no longer needed in the config, file entry is removed from ned-settings too, but not phisically from the device by following these steps:
      - delete file entry from "ned-settings/unix-bind/file-settings/record-files"
      - commit
      - sync-from

  ## 1.4 Other observations:
  ## 1.4.1 At the input of the records there must be considered the allowed BIND v9 syntax logic and named-checkzone utility validation.
         For example, setting all NAPTR records with active flag set to false should imply that you have to set the domain to inactive as well, as having an active domain defined with inactive records only is not an valid input for named-checkzone.

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
  | netsim                    | yes       | Basic support                                                    |
  |                           |           |                                                                  |
  | check-sync                | yes       | Supported                                                        |
  |                           |           |                                                                  |
  | partial-sync-from         | no        | Not supported                                                    |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Supports config exec any command                                 |
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
  | Unix device with BIND     | 10              | Solari |                                                   |
  |                           |                 | s      |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-unix-bind-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-unix-bind-1.0.1.signed.bin
      > ./ncs-6.0-unix-bind-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-unix-bind-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-unix-bind-1.0.1.tar.gz
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
     `unix-bind-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-unix-bind-1.0.1.tar.gz
     > ls -d */
     unix-bind-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package unix-bind-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package unix-bind-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-unix-bind-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package unix-bind-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/unix-bind-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-unix-bind-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-unix-bind-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install unix-bind-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-unix-bind-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-unix-bind-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id unix-bind-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```

     To authenticate with private key:
      ```
      # ssh private-key <private-key-name> key-data "<key-data-content>"
      # devices authgroups group <group-name> default-map remote-name <remote-name>
      # devices authgroups group <group-name> default-map public-key private-key name <private-key-name>
      # devices device <device-name> authgroup <group-name>
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

  `$NSO_RUNDIR/logs/ned-unix-bind-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings unix-bind logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings unix-bind logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.unixbind \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings unix-bind logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings unix-bind logger java true
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


  # Create/Update unix-bind Configuration
  ---

  ## Config model of the NED has the following structure:
  ```
  module: tailf-ned-unix-bind
    +--rw record-file* [record-name]
    |  +--rw record-name        string
    |  +--rw file-data
    |  |  +--rw filePath?   string
    |  +--rw resource-record* [domain-name]
    |     +--rw domain-name    string
    |     +--rw (record-type)?
    |        +--:(case-naptr)
    |        |  +--rw naptr
    |        |     +--rw domain-comment?     string
    |        |     +--rw is-domain-active?   boolean
    |        |     +--rw naptr-record* [naptr-id]
    |        |        +--rw naptr-id          string
    |        |        +--rw order?            uint16
    |        |        +--rw preference?       uint16
    |        |        +--rw flag?             enumeration
    |        |        +--rw services          string
    |        |        +--rw regexp?           string
    |        |        +--rw replacement       -> ../naptr-id
    |        |        +--rw class?            enumeration
    |        |        +--rw active?           boolean
    |        |        +--rw comment-before?   string
    |        +--:(case-a)
    |           +--rw a
    |              +--rw a-records* [ip-address]
    |                 +--rw ip-address        inet:ipv4-address
    |                 +--rw class?            enumeration
    |                 +--rw active?           boolean
    |                 +--rw comment-before?   string
  ```
  ---

  ## There is also a **config exec** section which takes place of the equivalent of a exec any command. 
  ### - Since the underlying OS is a nix based OS, any command can be executed using this command
  ### - The NSO users defined in the ned-settings and in the NSO system deployments must have a very high security level applied to ensure that the users are authorised to execute commands only within the allowed and desired borders. 
  ### - It has been designed to aid in programatic scripts deployments.

  ```
  module: tailf-ned-unix-bind
    +--rw EXEC
       +---x exec
          +---w input
          |  +---w args*   string
          +--ro output
  ```
  ---
  # 4.1) Create/update unix-bind objects for NEW resource record files which were NOT previously defined in NED-SETTINGS:
  ```    
    devices device <device-name> ned-settings unix-bind file-settings record-files </usr/local/bind9/master/epc/Apn1.db>
    commit
    devices device <device-name> sync-from
  ```

  ## WARNING! 
  ## Sync-from is MANDATORY after any file-settings update so that any legacy content would be accurately processed for the defined db record files found in ned settings.

  ### Adding new files can be done only AFTER defining their path in ned settings and running sync-from.    

  # 4.2 Create/update unix-bind NAPTR-record objects for EXISTING resource record files defined previously in NED-SETTINGS:

  ```
   config
    record-file apnTest.db
     file-data filePath /path/to/file/apnTest.db
     resource-record resource.record.001
      naptr naptr-record naptr.record.001
       flag           s
       services       x-3gpp-pgw:x-s8-gtp:x-gp
       replacement    naptr.record.001
       comment-before "comment before naptr.record.001"
      !
      naptr naptr-record naptr.record.002
       flag           s
       services       x-3gpp-pgw:x-s8-gtp:x-gp
       replacement    naptr.record.002
       comment-before "comment before naptr.record.002"
      !
     !
     resource-record resource.record.002
      naptr domain-comment "TEST COMMENT before naptr domain"
      naptr naptr-record naptr.record.003
       class          IN
       flag           s
       services       x-3gpp-pgw:x-s8-gtp:x-gp
       replacement    naptr.record.003
       active         false
       comment-before "comment before naptr record"
       order 1000
       preference 100
      !
     !
    !
  ```
  NOTE THAT <REPLACEMENT> has the same value as the <naptr-id> key of the naptr-record list. It is basically a leaf-ref to the key.


  ```    
  admin@ncs(config-naptr-record-naptr.record.001)# 
  devices device unix_bind_lab-1
   config
    record-file apnTest.db
     resource-record resource.record.001
      naptr naptr-record naptr.record.001
       order       1000
       preference  100
       flag        s
       services    x-3gpp-pgw:x-s8-gtp:x-gp
       replacement naptr.record.001
       class       IN
       active      true
      !
     !
    !
   !
  !
  ```

  ```
  admin@ncs(config-naptr-record-naptr.record.001)# commit dry-run outformat native 
  native {
      device {
          name unix_bind_lab-1
          data ========================
               Diff for file: [/usr/local/bind9/nanoJson-migrate/apnTest.db]:
               ============ 
               CREATED: 
               ============ 
               resource.record.001 (
                IN NAPTR 1000 100 "s" "x-3gpp-pgw:x-s8-gtp:x-gp" "" naptr.record.001 )

               ========================
      }
  }
  ```

  ### Deleting an entire naptr resource with its domain:
  ```
  admin@ncs(config-naptr-record-naptr.record.001)# commit dry-run outformat native reverse 
  native {
      device {
          name unix_bind_lab-1
          data ========================
               Diff for file: [/usr/local/bind9/nanoJson-migrate/apnTest.db]:
               ============ 
               DELETED: 
               ============ 
               resource.record.001 (
                IN NAPTR 1000 100 "s" "x-3gpp-pgw:x-s8-gtp:x-gp" "" naptr.record.001 )

               ========================
      }
  }
  ```

  # 4.3 NSO commands to create/update unix-bind A-record objects for EXISTING resource record files defined previously in NED-SETTINGS:     
  ```          
  devices device unix_bind_lab-1
   config
    record-file apnTest.db
     resource-record aRecord.abc
      a a-records 1.2.3.4
       class          IN
       active         true
       comment-before COMMENT
      !
      a a-records 5.6.7.8
       class          IN
       active         true
       comment-before "COMMENT BEFORE 5.6.7.8"
      !
     !
    !
   !
  !
  ```

  ```
  admin@ncs(config-a-records-5.6.7.8)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device unix_bind_lab-1 {
                        config {
                            record-file apnTest.db {
               +                resource-record aRecord.abc {
               +                    a {
               +                        a-records 1.2.3.4 {
               +                            class IN;
               +                            active true;
               +                            comment-before COMMENT;
               +                        }
               +                        a-records 5.6.7.8 {
               +                            class IN;
               +                            active true;
               +                            comment-before "COMMENT BEFORE 5.6.7.8";
               +                        }
               +                    }
               +                }
                            }
                        }
                    }
                }
      }
  }
  ```

  ```
  admin@ncs(config-resource-record-aRecord.abc)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device unix_bind_lab-1 {
                        config {
                            record-file apnTest.db {
               +                resource-record aRecord.abc {
               +                    a {
               +                        a-records 1.2.3.4 {
               +                            class IN;
               +                            active true;
               +                            comment-before COMMENT;
               +                        }
               +                        a-records 5.6.7.8 {
               +                            class IN;
               +                            active true;
               +                            comment-before "COMMENT BEFORE 5.6.7.8";
               +                        }
               +                    }
               +                }
                            }
                        }
                    }
                }
      }
  }
  ```

  ### Creating the a-records in native format:
  ```
  admin@ncs(config-resource-record-aRecord.abc)# commit dry-run outformat native 
  native {
      device {
          name unix_bind_lab-1
          data ========================
               Diff for file: [/usr/local/bind9/nanoJson-migrate/apnTest.db]:
               ============ 
               CREATED: 
               ============ 
               ;COMMENT
               aRecord.abc IN A 1.2.3.4
               ;COMMENT BEFORE 5.6.7.8
               aRecord.abc IN A 5.6.7.8

               ========================
      }
  }
  ```

  ## Deleting the a-records under test file only:
  ```
  admin@ncs(config-resource-record-aRecord.abc)# commit dry-run outformat native reverse 
  native {
      device {
          name unix_bind_lab-1
          data ========================
               Diff for file: [/usr/local/bind9/nanoJson-migrate/apnTest.db]:
               ============ 
               DELETED: 
               ============ 
               ;COMMENT
               aRecord.abc IN A 1.2.3.4
               ;COMMENT BEFORE 5.6.7.8
               aRecord.abc IN A 5.6.7.8

               ========================
      }
  }
  ```



  ## WARNING ! Deleting unix bind record file entry at final level causes db record deletion. User is responsible to handle this with caution:
  - Example: 
  `no device <device-name> config unix-bind:record-file Apn1.db`


  ## To delete records without removing the db record file, simply delete managed db record section as below:

  - First, delete all record entries under  top config/record-file{*}/resource-record *
  - Then, remove the file from ned-settings/unix-bind/file-settings/record-files
  - Then commit and sync-from

  Not following the above steps may lead to permanent db file loss.


# 5. Built in live-status actions
---------------------------------

  NONE


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------



  ## !IMPORTANT! ##

  Please note ned-settings paths have changed starting with ned version 2.1.x onwards. 

  Due to multiple incompatibilities, it is not automatically backwards/forwards compatible with 2.0 or lower versions.

  It is a one time change, it will be fully compatible with future versions. 

  Check *README_upgrade-unix-bind-2.x.pdf* for a more detailed example or request it from the NED lead developer.

  ---    

  Packages reload is broken between 2.0 and 2.1, so a few more actions are needed:

  1. Save existing deployed devices configurations using this NED package
  2. Device settings and ned-id must be manually updated as following:
     * From "unix-bind-common-settings" to "unix-bind common-settings"
     * From "unix-bind-file-settings"   to "unix-bind file-settings"
     * From "ned-id unix-bind"          to "ned-id unix-bind-gen-2.1"

  I.e. From:  
  ``` 
  device-type generic ned-id unix-bind
  ned-settings unix-bind-common-settings username $username
  ned-settings unix-bind-file-settings file-dir-backup $backup_path
  ned-settings unix-bind-file-settings record-files $db_path/file1.db
  !
  ned-settings unix-bind-file-settings record-files $db_path/file2.db
  !
  ...
  ned-settings unix-bind-file-settings record-files $db_path/file2.db
  !
  ...
  ned-settings unix-bind-file-settings warning-message-separator ";<MESSAGE LINE 1>\n;<MESSAGE LINE 2>\n ... \n"


  ```  

  To:
  ```
  device-type generic ned-id unix-bind-gen-2.1
  ned-settings unix-bind common-settings username $username
  ned-settings unix-bind file-settings file-dir-backup $backup_path
  ned-settings unix-bind file-settings record-files $db_path/file1.db
  !
  ned-settings unix-bind file-settings record-files $db_path/file2.db
  !
  ...
  ned-settings unix-bind file-settings record-files $db_path/file2.db
  !
  ...
  ned-settings unix-bind file-settings warning-message-separator ";<MESSAGE LINE 1>\n;<MESSAGE LINE 2>\n ... \n"
  ```
  3. Delete deployed devices using the NED
  4. Run packages reload force 
  5. Reload saved updated configuration with the new ned-settings and ned-id.
  6. Commit, connect, sync-from to get back all config.


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
     admin@ncs(config)# devices device dev-1 ned-settings unix-bind logging level debug
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

