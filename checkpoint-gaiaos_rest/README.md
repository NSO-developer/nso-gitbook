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
  10. Oper-Data
  11. sync-from verbose and load-native-config file
  12. VSX Provisioning
  13. /packages/movable-nat-rule
  14. Information about the device
  15. Using show-changes for calculating transaction id
  16. Nameless access-section
  ```


# 1. General
------------

  This document describes the checkpoint-gaiaos_rest NED.

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
  |                           | R80             | Gaia   |                                                   |
  |                           |                 |        |                                                   |
  |                           | R81             | Gaia   |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-checkpoint-gaiaos_rest-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-checkpoint-gaiaos_rest-1.0.1.signed.bin
      > ./ncs-6.0-checkpoint-gaiaos_rest-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-checkpoint-gaiaos_rest-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-checkpoint-gaiaos_rest-1.0.1.tar.gz
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
     `checkpoint-gaiaos_rest-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-checkpoint-gaiaos_rest-1.0.1.tar.gz
     > ls -d */
     checkpoint-gaiaos_rest-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package checkpoint-gaiaos_rest-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package checkpoint-gaiaos_rest-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-checkpoint-gaiaos_rest-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package checkpoint-gaiaos_rest-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/checkpoint-gaiaos_rest-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-checkpoint-gaiaos_rest-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-checkpoint-gaiaos_rest-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install checkpoint-gaiaos_rest-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-checkpoint-gaiaos_rest-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-checkpoint-gaiaos_rest-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id checkpoint-gaiaos_rest-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
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

  `$NSO_RUNDIR/logs/ned-checkpoint-gaiaos_rest-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings checkpoint-gaiaos_rest logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings checkpoint-gaiaos_rest logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.checkpointgaiaosrest \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings checkpoint-gaiaos_rest logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings checkpoint-gaiaos_rest logger java true
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

  NONE


# 5. Built in live-status actions
---------------------------------

  5.1 Install policy
    % request devices device <device-name> live-status exec install-policy args { access true/false policy-package <package-name> targets [ <gateway-target> ] }

  5.2 Run script
    % request devices device <device-name> live-status exec run-script args { script <script> script-name <script-name> set-session-id true/false targets [ <gateway-target> ] }

  5.3 Set one-time password on a gateway
    % request devices device <device-name> live-status exec set-one-time-password-simple-gateway args { simple-gateway <gateway-name> one-time-password <password> }

  5.4 Set password-hash
    % request devices device <device-name> live-status exec set-password args { user <user> password <password> }

  5.5 Set password-hash
    % request devices device <device-name> live-status exec set-password-hash args { user <user> password-hash <password-hash> }

  5.6 Set lock-out
    % request devices device <device-name> live-status exec set-lock-out args { user <user> lock-out <lock-out> }

  5.7 Show gateways and servers
    % request devices device <device-name> live-status exec show-gateways-and-servers args { limit <limit> offset <offset> }

  5.8 Show all access-rules in a give access-section
    % request devices device <device-name> live-status exec show-access-section args { access-layer <access-layer> access-section <access-section> }

  5.9 Show task progress
    % request devices device <device-name> live-status exec show-task args { task-id <task-id> }

  5.10 Send a rest call
    % request devices device <device-name> live-status exec send-rest-call args { path <path> json-body <json-body> publish true}

  5.11 Execute reboot
    The following NED-Settings need to be set:
    1. use-config-mode-configuration or is-gateway-device must be set to true (see README-ned-settings.md)
    % request devices device <device-name> live-status exec execute-reboot

  5.12 Run a command in expert mode
    The following NED-Settings need to be set:
    1. use-config-mode-configuration or is-gateway-device must be set to true (see README-ned-settings.md)
    2. expert-mode-password must be set to the expert mode login password (see README-ned-settings.md)
    % request devices device <device-name> live-status exec run-in-expert-mode args { command "COMMAND -FLAGS" }

  5.13 Run a command in config mode
    The following NED-Settings need to be set:
    1. use-config-mode-configuration or is-gateway-device must be set to true (see README-ned-settings.md)
    % request devices device <device-name> live-status exec run-in-config-mode args { command "COMMAND" }

  5.14 Only get config with domain name <domain-name>
    request devices device <device-name> live-status exec get-domain-objects args { domain <domain-name> json-body <json-body> path <path> }

  5.15 Reset the data used in show-changes
    request devices device <device-name> live-status exec reset-show-changes-data


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  7.1 Avoid duplicated object names
      Do not name multiple access-rules or any other objects with the same name.
      Duplicated access-rule names will be overwritten by the last access-rule with the duplicated name.

      Update:
        Support for duplicated or no name for /access-layer/access-rule added, see:
          ned-setting for expanding /access-layer/access-rule/name support

  7.2 Access-sections not supported
      Access-layers containing access-sections is not supported.

  7.3 Non deleteable values

      The Checkpoint R80 device do not support deletion of object values.
      Therefore these values should not be deleted through the NED:
      host
        ipv4-address
        ipv6-address

      network
        subnet4
        subnet6
        mask-length4
        mask-length6

      A deletion of any values mentioned above will result in an error message being printed.
      Instead try setting the value to something else.
      An example on how to modify the ipv4-address value in the host object:
      set devices device <device-name> config checkpoint-gaiaos_rest:host ExampleHost ipv4-address 127.0.0.1

  7.4 /network/subnet-mask not supported

      The NED does not support the value /network/subnet-mask.

  7.5 Dynamic creation of "PACKAGE_NAME" Network on the device side

      When creating a package with the access value true and adding access-layers to it, the device will automatically create an access-layer called "PACKAGE_NAME" Network.

      Example:

      admin@ncs% set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access true access-layers ACCESS-LAYER1
      [ok][2017-03-24 14:46:46]

      [edit]
      admin@ncs% commit
      Commit complete.
      [ok][2017-03-24 14:48:47]

      [edit]
      admin@ncs% request devices device <device-name> compare-config
      diff
       devices {
           device <device-name> {
               config {
      +            checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" {
      +                access-rule "Cleanup rule" {
      +                    enabled;
      +                    comments "";
      +                    custom-fields {
      +                        field-1 "";
      +                        field-2 "";
      +                        field-3 "";
      +                    }
      +                    action {
      +                        name Drop;
      +                    }
      +                    track {
      +                        name None;
      +                    }
      +                    source Any;
      +                    destination Any;
      +                    service Any;
      +                }
      +            }
                   checkpoint-gaiaos_rest:packages PACKAGE_NAME {
      +                # after access-layers ACCESS-LAYER1
      +                access-layers "PACKAGE_NAME Network";
                   }
               }
           }
       }

      [ok][2017-03-24 14:49:49]

      [edit]
      admin@ncs%

      In order to solve this compare-config issue one must also create the dynamically
      created configurations in the NED.

      Step 1.
      Add the access-layer to the package as intended
        set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access true access-layers ACCESS-LAYER

      Step 2.
      Create a new access-layer named "PACKAGE_NAME Network".
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network"

      Step 3.
      Create a new access-rule called Cleanup rule in the newly created access-layer "PACKAGE_NAME Network" containing these values:

        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" comments "" custom-fields field-1 "" field-2 "" field-3 ""
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" action name Drop
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" track name None
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" enabled
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" destination Any
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" source Any
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" service Any

      Step 4.
      Assign this newly created access-layer "PACKAGE_NAME Network" to the package PACKAGE_NAME
        set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access-layers "PACKAGE_NAME Network"

      Only commands:
        set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access true access-layers ACCESS-LAYER

        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" comments "" custom-fields field-1 "" field-2 "" field-3 ""
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" action name Drop
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" track name None
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" enabled
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" destination Any
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" source Any
        set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" access-rule "Cleanup rule" service Any

        set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access-layers "PACKAGE_NAME Network"

      These configuration creations will not be sent to the device since the device have already created them dynamically.

  7.6 Dynamic deletion of access-layers under the deleted Package

      When you delete a package the device will also automatically delete all access-layers under that package.
      Therefore the access-layers under the package to be deleted must also be deleted in the NED to avoid a compare-config issue such as:

      edit]
      admin@ncs% request devices device <device-name> compare-config
      diff
       devices {
           device <device-name> {
               config {
      -            checkpoint-gaiaos_rest:access-layer ACCESS-LAYER_NAME {
      -                access-rule "Cleanup rule" {
      -                    enabled;
      -                    comments "";
      -                    custom-fields {
      -                        field-1 "";
      -                        field-2 "";
      -                        field-3 "";
      -                    }
      -                    action {
      -                        name Drop;
      -                    }
      -                    track {
      -                        name None;
      -                    }
      -                    source Any;
      -                    destination Any;
      -                    service Any;
      -                }
      -                access-rule ACCESS_RULE_NAME {
      -                    enabled;
      -                    comments test;
      -                    custom-fields {
      -                        field-1 test;
      -                        field-2 test;
      -                        field-3 test;
      -                    }
      -                    action {
      -                        name Accept;
      -                    }
      -                    track {
      -                        name Log;
      -                    }
      -                    source TEST_SOURCE;
      -                    destination TEST_DESTINATION;
      -                    service TEST_SERVIE;
      -                }
      -            }
      -            checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" {
      -                access-rule "Cleanup rule" {
      -                    enabled;
      -                    comments "";
      -                    custom-fields {
      -                        field-1 "";
      -                        field-2 "";
      -                        field-3 "";
      -                    }
      -                    action {
      -                        name Drop;
      -                    }
      -                    track {
      -                        name None;
      -                    }
      -                    source Any;
      -                    destination Any;
      -                    service Any;
      -                }
      -            }
               }
           }
       }

      [ok][2017-03-27 15:40:09]

      Step 1.
      Find out all access-layers under that package
        show devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access-layers
          access-layers ACCESS-LAYER_NAME;
          access-layers "PACKAGE_NAME Network";

      Step 2.
      Delete the package
        delete devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME

      Step 3.
      Delete the package's access-layers.
      The access-layers deletion commands will not be sent to the device since both the package and the access-layers deletion are in the same transaction.

        delete devices device <device-name> config checkpoint-gaiaos_rest:access-layer ACCESS-LAYER_NAME
        delete devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network"

      Only commands:
        show devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access-layers

        delete devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME
        delete devices device <device-name> config checkpoint-gaiaos_rest:access-layer ACCESS-LAYER1
        delete devices device <device-name> config checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network"

  7.7 Source, destination and service values for access-rule in access-layer

      If you create an access-rule without specifying the source, destination and service value the device will automatically assign them the value "Any"

      To avoid a compare config issue when you do not intend to have any other value for the source, destination and service then you need to assign "Any"
      to them in the NED as well.

       set devices device <device-name> config checkpoint-gaiaos_rest:access-layer ACCESS_LAYER_NAME Network access-rule RULE_NAME source Any
       set devices device <device-name> config checkpoint-gaiaos_rest:access-layer ACCESS_LAYER_NAME Network access-rule RULE_NAME destination Any
       set devices device <device-name> config checkpoint-gaiaos_rest:access-layer ACCESS_LAYER_NAME Network access-rule RULE_NAME service Any

      If you do assign a value other to the source, destination and service then the device will not automatically assign the value "Any".

  7.8 Package with value access true

      When the value access in a package is true then the device will automatically assign configuration to the package. To avoid a compare-config issue
      the following commands must be issued in the NED:

       set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access-layers "PACKAGE_NAME" Network
       set devices device <device-name> config checkpoint-gaiaos_rest:access-layer PACKAGE_NAME

      These commands creates the configuration but does not send it to the device since the device already creates it by itself.
      Not doing so will result in a compare config issue such as:
      admin@ncs% request devices device <device-name> compare-config
      diff
       devices {
           device <device-name> {
               config {
      +            checkpoint-gaiaos_rest:access-layer "PACKAGE_NAME Network" {
      +                access-rule "Cleanup rule" {
      +                    source Any;
      +                    destination Any;
      +                    service Any;
      +                }
      +            }
                   checkpoint-gaiaos_rest:packages "PACKAGE_NAME" {
      +                # first
      +                access-layers "PACKAGE_NAME Network";
                   }
               }
           }
       }

  7.9 Adding NAT-rules in a package
      When adding a NAT-rule the position must be specified. In the device you can add an NAT-rule regardless of its position and the device will automatically update the position of the other NAT-rules.

      However this automatic update of positions can not be handled by the NED.
      To illustrate, we will add a new rule with a new comment value between existing rules.

      When adding a rule, the below has to be done in the NED since the NED, unlike the device, does not automatically update the positions:

       1. Remove all the rules with position higher than the one you want to add
       2. Add the rule at the desired position
       3. Add the rules you removed after the newly added rule.
          To avoid compare-config diff the rules to be re-added needs to be identical to the rules previously removed, both in terms of config (except position value) and ordering.

       Example:
         We have
          position comments
           1        ""
           2        ""
           3        three
           4        four

         We want to add a new rule at position 3 with comments newThree so the result will be:
          position comments
           1        ""
           2        ""
         ->3        newThree
           4        three
           5        four

         At the device adding the new rule with comment newThree at position 3 would suffice. The device will automatically update the positions.
         But from the NED this has to be done:

         Step 1:
           Remove all the rules with position higher than and equal to the position you want to add the new rule
           Result:
            position comments
             1        ""
             2        ""

         Step 2:
           Add the rule at the intended position
           Result:
            position comments
             1        ""
             2        ""
           ->3        newThree


         Step 3:
           Add the rules you removed previously, the ordering and config (except position value) has be be identical:
            position comments
             1        ""
             2        ""
          -> 3        newThree
             4        three
             5        four

          The resulting NED operations towards the device would be:
            set comment at position 3 to newThree
            add a new rule at position 5 with the comment four

            i.e.
            admin@ncs% commit dry-run outformat native
              native {
                  device {
                      name checkpoint-gaiaos_rest-1
                      data POST /web_api/add-nat-rule
                           {
                             "package": "TEST",
                             "comments": four,
                             "original-destination": "Any",
                             "original-source": "Any",
                             "position": 5,
                             "install-on": "Policy Targets",
                             "enabled": true
                           }
                           POST /web_api/set-nat-rule
                           {
                            "rule-number" : 3,
                            "package" : "TEST",
                            "comments" : "newThree"
                           }
                  }
              }

  7.10 Creation of NAT-Rules in a Package

       When creating a NAT-rule at the device the device will also automatically create two other NAT-rules.
       In order to avoid a compare-config issue these NAT-rules needs to be created in the NED as well.

       The commands for creating them are
       set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME nat-rule 1 enabled true
       set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME nat-rule 1 install-on All
       set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME nat-rule 1 original-source name CP_default_Office_Mode_addresses_pool
       set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME nat-rule 1 original-destination name CP_default_Office_Mode_addresses_pool
       set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME nat-rule 2 enabled true
       set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME nat-rule 2 install-on All
       set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME nat-rule 2 original-source name CP_default_Office_Mode_addresses_pool
       set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME nat-rule 2 original-destination name Any

       The NED will not send these NAT-rule creation commands to the device since the device will create these NAT-rule automatically.

       Note that the access value in package have to be set to true in order to configure the nat-rules.

       Also note that since nat-rule 1 and 2 cannot be modified on the device the NED have been tested against, any modification to them will not be sent by the NED to the device.

       This description applies to the default behaviour of the device. If sending nat-rule with position 1 or 2 is needed, please refer to block-nat-rule-positions in README-ned-settings.md

  7.11 Packages nat-rule install-on values

       If you do not specify any value for install-on under nat-rule then the device will automatically
       assign it to "Policy Targets".

       To avoid a compare-config issue assign it to "Policy Targets" in the NED as well by issuing:
         set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME nat-rule NUMBER install-on "Policy Targets"

       But once you assign a value to the install-on then the device will automatically remove the "Policy Targets"
       value. To avoid a compare config issue in the NED issue:
         delete devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME nat-rule NUMBER install-on "Policy Targets"


  7.12 Package access value

       The access value of a package must be set to true in order to enable access-layers and nat-rules configuration.

       This means that in the NED if you have a package with access-layers and nat-rules then special care must be taken when changing the access value.

       1. Changing access from true to false
       When changing access from true to false the device will not display the access-layers and nat-rules. Commands to remove the access-layers and nat-rules will automatically be sent to the NED but not the device since the device handles it automatically.

       2. Changing access from false to true
       When changing access from false to true the device will display the access-layers and nat-rules. In the NED the access-layers and nat-rules will not exist until created or a sync-from is done. To avoid a compare-config issue all the access-layers and nat-rules which are stored in the device but hidden due to access false must be created at the NED as well.

       The access-layers and nat-rules creation and deletion above will not be sent to be device since the access value will affect them on the device side.

       If you want to add additional nat-rules/access-layers not existing on the device and change the access value from false to true, you need to split it into two calls.
       The first call will change the access from false to true and set the nat-rules/access-layers already existing at the device but hidden.
       The nat-rules/access-layers set in this call will not be sent to the device since the device already has them.
       The second call will add the additional nat-rules/access-layers to the package.


  7.13 Adding access-rules to access-layer and access-layers to packages.

       In the device you can specify a position when adding access-rules to access-layer and access-layers to packages.
       In the NED however that is not possible. Instead, when you add a new access-rule/access-layer it will always be added
       with the highest position value i.e at the end of the list.

       If you want to add the access-rule/access-layer at another position then you first add it and then move it.

       An example(the same reasoning applies to both access-layers/access-rule and packages/access-layers):
           Your package has three access-layers and you would like to add an access-layer after the second one i.e the position would
           be three. In that case you would need to add the fourth access-layer and then move it before access-layer with position 3
           or after access-layer with position 2.
           The example demonstrates the above:

           Add the access-layers to the package
            set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access-layers FIRST
            set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access-layers SECOND
            set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access-layers THIRD
            commit
           We want to add FOURTH at position 3 so we add and move
            set devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access-layers FOURTH
            move devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access-layers FOURTH before THIRD
             or
            move devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME access-layers FOURTH after SECOND

  7.14 Setting one-time-passwords for simple-gateway

       Example:
       To set the one-time-password TEST_ONE_TIME_PASSWORD for the simple-gateway TEST_SIMPLE_GATEWAY issue the following commands:

         request devices device <device-name> live-status exec set-one-time-password-simple-gateway args { one-time-password
           TEST_ONE_TIME_PASSWORD simple-gateway TEST_SIMPLE_GATEWAY }

       The output will be the device's response.

  7.15 simple-gateway/fire-wall-settings/memory-pool-size automatically calculated

       When creating a simple-gateway with firewall set to true the memory-pool-size will automatically be calculated by the device. This will lead to a compare-config issue since the memory-pool-size value exist at the device but not at the NED.

       To avoid the compare config issue the memory-pool-size also needs to be set in the NED when firewall is true. But this memory-pool-size will not be sent to the device.

       Sending it to the device yields this error:
       400 Bad Request
       {
        "code" : "generic_err_invalid_parameter",
        "message" : "Invalid parameter for [memory-pool-size]. auto-calculate-connections-hash-table-size-and-memory-pool is set to true"
       }

       So memory-pool-size will not be sent when it is set upon simple-gateway creation and firewall true.

  7.16 Enabling config mode configuration in the NED

       The config mode configuration (i.e configuration not configured in the management server) can be found under the YANG-path
         /config_mode_config.
       To use these configurations in the NED the NED setting use-config-mode-configuration needs to be set to true.
         See "Checkpoint modes" in README-ned-settings.md.


  7.17 Changing to version v3 in /snmp/traps/receiver

       /snmp/traps/receiver/version v1 and v2 has a mandatory leaf called community.
       This community leaf does not exist when version is v3.
       So when changing from v1 or v2 to v3 the community leaf has to be deleted. This deletion will not be sent to
         the device since the device does this deletion automatically.

       Example:
         admin@ncs% set devices device device-name config checkpoint-gaiaos_rest:snmp traps receiver 1.1.1.1 version v1 community TEST
         admin@ncs% commit
         admin@ncs% set devices device <device-name> config checkpoint-gaiaos_rest:snmp traps receiver 1.1.1.1 version v3
         admin@ncs% delete devices device <device-name> config checkpoint-gaiaos_rest:snmp traps receiver 1.1.1.1 community
         admin@ncs% commit

         Also, when changing the version from v3 to v1 or v2 the leaf community must be set as well

  7.18 Non mandatory field /config_mode_config/user/realname

       When creating a new user the leaf realname is not mandatory. However if it is not set on the NED side a compare config issue will arise. The reason is because the device will automatically set realname to the user's name.

       To avoid this compare config issue a recommendation is to set the user's realname as well when creating a new user.

       Example 1 - compare config issue because realname was not set in the NED:
         admin@ncs% set devices device <device-name> config checkpoint-gaiaos_rest:config_mode_config user AAA uid 1234 homedir /home/AAA
         admin@ncs% set devices device <device-name> config checkpoint-gaiaos_rest:config_mode_config rba user AAA
         admin@ncs% commit
         admin@ncs% request devices device <device-name> compare-config
         diff
          devices {
              device <device-name> {
                  config {
                      checkpoint-gaiaos_rest:config_mode_config {
                          user AAA {
         +                    realname AAA;
                          }
                      }
                  }
              }
          }
         admin@ncs%

       Example 2 - no compare config issue because realname was set in the NED

         admin@ncs% set devices device <device-name> config checkpoint-gaiaos_rest:config_mode_config rba user BBB
         admin@ncs% set devices device <device-name> config checkpoint-gaiaos_rest:config_mode_config user BBB uid 5678 homedir /home/BBB realname BBB
         admin@ncs% commit
         admin@ncs% request devices device <device-name> compare-config
         admin@ncs%

  7.19 User and rba user

       On the device, when a user is created the corresponding rba user is created.
       When deleting a user the corresponding rba user gets deleted.

       To avoid compare config issues related to rba user when creating and deleting user,
       creation and deletion for rba user has to be issued as well. This creation/deletion of a rba user only will not be sent to the device.

       Example 1 - User creation:
         admin@ncs% set devices device <device-name> config checkpoint-gaiaos_rest:config_mode_config user TEST123 uid 1234 homedir /home/TEST123 realname TEST123
         admin@ncs% commit
         Commit complete.
         admin@ncs% request devices device <device-name> compare-config
         diff
          devices {
              device <device-name> {
                  config {
                      checkpoint-gaiaos_rest:config_mode_config {
                          rba {
         +                    user TEST123 {
         +                    }
                          }
                      }
                  }
              }
          }
         admin@ncs% set devices device <device-name> config checkpoint-gaiaos_rest:config_mode_config rba user TEST123
         admin@ncs% commit dry-run outformat native
         native {
             device {
                 name <device-name>
                 data     }                      <--- Nothing gets sent to the device since the
                                                       device automatically creates it
         }
         admin@ncs% commit
         admin@ncs% request devices device <device-name> compare-config
         admin@ncs%



       Example 2- User deletion:
         admin@ncs% delete devices device <device-name> config checkpoint-gaiaos_rest:config_mode_config user TEST123
         admin@ncs% commit
         admin@ncs% request devices device <device-name> compare-config
         diff
          devices {
              device <device-name> {
                  config {
                      checkpoint-gaiaos_rest:config_mode_config {
                          rba {
         -                    user TEST123 {
         -                    }
                          }
                      }
                  }
              }
          }
         admin@ncs% delete devices device <device-name> config checkpoint-gaiaos_rest:config_mode_config rba user TEST123
         admin@ncs% commit dry-run outformat native
         native {
             device {
                 name <device-name>                 <--- Nothing gets sent to the device since the
                 data     }                            device automatically deletes it
         }
         admin@ncs% commit
         admin@ncs% request devices device <device-name> compare-config
         admin@ncs%


  7.20 Secret in aaa radius-server and key in aaa tacacs-server

       When creating an aaa radius-server the value secret must be specified. The same applies for
       aaa tacacs-server and the value key. But from the device it is not possible to show the value secret for an aaa radius-server nor the value key for an aaa tacacs-server.

       Therefore there is no mandatory statement in the YANG model enforcing this. This also means that if
       aaa radius-server/tacacs-server is created or the values secret/key is set through the NED these values can be shown in the NED. If these values have not been created or set from the NED then they cannot be shown through the NED.


  7.21 Add access-rule "Cleanup rule" as the first rule when creating new access-layer

       When creating new access-layer the device will automatically add
       "Cleanup rule" as the first access-rule. "Cleanup rule" is
       auto-config and the corresponding "Cleanup rule" needs to be added
       in the NED as well:

         set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "ACCESS-LAYER" access-rule "Cleanup rule" comments "" custom-fields field-1 "" field-2 "" field-3 ""
         set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "ACCESS-LAYER" access-rule "Cleanup rule" action name Drop
         set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "ACCESS-LAYER" access-rule "Cleanup rule" track name None
         set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "ACCESS-LAYER" access-rule "Cleanup rule" enabled
         set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "ACCESS-LAYER" access-rule "Cleanup rule" destination Any
         set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "ACCESS-LAYER" access-rule "Cleanup rule" source Any
         set devices device <device-name> config checkpoint-gaiaos_rest:access-layer "ACCESS-LAYER" access-rule "Cleanup rule" service Any

       The "Cleanup rule" will not be sent by the NED to the device since
       the device creates it automatically.

  7.22 /access-layer/access-rule/action "Apply-Layer" and "Inner-Layer"

       It is not possible to set the /access-layer/access-rule/action to "Inner-Layer". Doing so will yield this error:
       400 Bad Request
         {
           "code" : "generic_err_invalid_parameter",
           "message" : "Invalid parameter for [action]. The invalid value: [Inner Layer]"
         }

       Instead set the action value to "Apply Layer" and the device will translate it to "Inner Layer".

  7.23 Creating access-rule within an access-section

       By default(when the position argument is not specified) the NED will send the access-rule creation commands to the device in the same order as they were created in the NED.

       To create an access-rule within an access-section the position argument needs to be specified.

       Once the access-rule is created it also needs to be moved to the right position in accordance to the device so as to avoid compare-config differences.

       Example:
         1. In the device the last access-rule in the access-section TEST-SECTION is LAST-SECTION-RULE

         2. A new access-rule ACCESS-RULE should be added at the bottom of TEST-SECTION i.e after LAST-SECTION-RULE

         3. NED-side:
         Adding the access-rule ACCESS-RULE to the bottom of the access-section TEST-SECTION would mean that ACCESS-RULE would be placed after LAST-SECTION-RULE.

         Therefore these commands would need to be issued:
           set devices device <device-name> config checkpoint-gaiaos_rest:access-layer ACCESS-LAYER  access-rule ACCESS-RULE position bottom TEST-SECTION

           move devices device <device-name> config checkpoint-gaiaos_rest:access-layer ACCESS-LAYER access-rule ACCESS-RULE after LAST-SECTION-RULE

           commit dry-run outformat native
           native {
               device {
                   name <device-name>
                   data POST https://IP:PORT/web_api/add-access-rule
                      {
                        "comments": "",
                        "name": "ACCESS-RULE",
                        "action": "Drop",
                        "position": {"bottom": "TEST-SECTION"},
                        "custom-fields": {
                          "field-1": "",
                          "field-2": "",
                          "field-3": ""
                        },
                        "track": "None",
                        "enabled": true,
                        "layer": "ACCESS-LAYER"
                      }
               }
             }

           The NED will only send the access-rule creation command. It will not send the move command since the device automatically moves the access-rule to the position at the bottom of TEST-SECTION

  7.24 Setting the edition value

       The device requires a save config and a reboot for the new edition value to be persisted.
       Therefore the following steps needs to be done from the NED in order to set the edition value.

       Example: setting to 32-bit
         1. The NED-Setting use-config-mode-configuration or is-gateway-device must be set to true (see Checkpoint modes in README-ned-settings.md)
         2. request devices device <device-name> live-status exec run-in-config-mode args { command "set edition 32-bit"  }
         3. request devices device <device-name> live-status exec run-in-config-mode args { command "save config" }
         4. request devices device <device-name> live-status exec execute-reboot

  7.25 Modifying the environment variables under /config_mode_config/clienv

       The leaf /config_mode_config/clienv/rows should NOT be used.
       The NED will set device's value to 0 when connecting to device,
       which is needed for the NED to function properly.

       It is possible to alter the device details by modifying the device's environment variables under /config_mode_config/clienv.
       The NED has been tested for the environment variable setup below:

       show devices device <device-name> config checkpoint-gaiaos_rest:config_mode_config clienv
         prompt       %M;
         syntax-check off;
         debug        0;
         echo-cmd     off;
         output       pretty;
         rows         0;

       New NED enhancements might be required for different environment variable setup.

  7.26 Rba role and auto-config

       When configuring the device rba role configuration might automatically get updated with new config. This could lead to a compare-config diff.
       One way to solve the diff is to configure the auto config on the NED and prevent the NED from sending it.

       Example: prevent the NED from sending the auto config line: add rba role adminRole domain-type System writeonly-features vrrp6

       When configuring the device sometime the config line
         add rba role adminRole domain-type System writeonly-features vrrp6
       automatically gets issued on the device.

       To solve this, create the same config on the NED but prevent the NED from sending it by using the following commands:

        set devices device <device-name> ned-settings checkpoint-gaiaos-rest-config-mode-config block-cli-line "add rba role adminRole domain-type System writeonly-features vrrp6"

        commit
        Commit complete.

        request devices device <device-name> disconnect
        request devices device <device-name> connect
        result true

  7.27 Configuring /message

       For the configurations
        /message/banner
        /message/motd
       it is possible to have multiple identical lines. Therefore the NED does not store those configuration in the CDB.

       To configure them the following example live-status commands can be used:
        request devices device <device-name> live-status exec run-in-config-mode args { command "set message banner on line msgvalue TEST-BANNER" }

        request devices device <device-name> live-status exec run-in-config-mode args { command "set message motd on line msgvalue TEST-MOTD" }

        request devices device <device-name> live-status exec run-in-config-mode args { command "set message caption off" }

        request devices device <device-name> live-status exec run-in-config-mode args { command "show configuration banner" }


  7.28 Dynamic config for /config_mode_config/bonding/group and /config_mode_config/interface

        When creating a /config_mode_config/bonding/group NUMBER an /config_mode_config/interface with the name bondNUMBER will be automatically created.

        To solve the compare config issue the same interface bondNUMBER must be created from the NED. This interface creation will not be sent to the device.

        Similarly, when deleting a /config_mode_config/bonding/group NUMBER the /config_mode_config/interface bondNUMBER must be
        deleted from the NED. This deletion will not be sent to the device.

  7.29 Auto config when adding or deleting vlans from interface
       When adding or deleting a vlan from interface another interface(called ethNBR.VLAN_ID) will be automatically added or deleted.

       Example:
         We add vlan 33 to interface eth0. Then the interface eth0.33 will be automatically created on the device. To avoid a compare config issue eth0.33 with state on must be created on the NED as well(it is only automatically created on the device).

         The same applies for deletion of vlans from an interface i.e. the deletion command of ethNBR.VLAN_ID must be issued to the NED as well when deleting a vlan from an interface.

  7.30 The leaf section-name in access-rule and nat-rule
       The below leaves list the section-name for an access-rule/nat-rule if the access-rule/nat-rule reside within a section.
         /access-layer/access-rule/section-name
         /packages/nat-rule/section-name

       Note that you cannot create a access/nat-rule in a certain section through this leaf

  7.31 Handling nameless /access-layer/access-rule
       The NED cannot create, modify, delete or move access-rules without name. It can however fetch them during sync-from and the access-rule's uid will be used as a name and in extension the key.

  7.32 Deleting nat-rule whose position is not highest and having automatic generated rules in between
       When deleting nat-rules whose position are not the highest through
         admin@ncs% delete devices device <device-name> config checkpoint-gaiaos_rest:packages PACKAGE_NAME nat-rule NOT-HIGHEST

       what the NED does is:
         1. send delete-nat-rule to the nat-rule with the highest position
         2. send one/several set-nat-rule to reflect the changes of the deletion on the device side

       Example:
         We have in the NED and device
           nat-rule comments
            1        ""
            2        ""
            3        n3
            4        n4
            5        n5  <---- we want to delete this
            6        n6
            7        n7
            8        n8
            9        n9

         What the NED does is:
           1. send delete-nat-rule to 9
             nat-rule comments
              1        ""
              2        ""
              3        n3
              4        n4
              5        n5  <---- we want to delete this
              6        n6
              7        n7
              8        n8
              9        n9  <---- (NED delete this through delete-nat-rule)

           2. send set-nat-rule to reflect the devices auto config change i.e. update all rules from the one we want to delete to the new nat-rule with highest position
             nat-rule comments
              1        ""
              2        ""
              3        n3
              4        n4
              5        n5  <---- (NED will update this to n6 through set-nat-rule)
              6        n6  <---- (NED will update this to n7 through set-nat-rule)
              7        n7  <---- (NED will update this to n8 through set-nat-rule)
              8        n8  <---- (NED will update this to n9 through set-nat-rule)

           3. Result
             This is the result for both NED and device
             nat-rule comments
              1        ""
              2        ""
              3        n3
              4        n4
              5        n6  <---- updated
              6        n7  <---- updated
              7        n8  <---- updated
              8        n9  <---- updated

             The above works as long as the nat-rules between the one we want to delete and the one with the highest position are not auto generated.
             If there is an auto-generated nat-rule in between (example nat-rule 7) the above will not work, since auto-generated nat-rules cannot be modified.

             Instead this needs to be used:
               request devices device <device-name> live-status exec send-rest-call args { path "/web_api/delete-nat-rule" json-body
                 "{\"package\":\"PACKAGE\",\"rule-number\":\"NBR\"}" publish true}
               request devices device <device-name> sync-from

  7.33 Auth/privacy password handling in /config_mode_config/snmp/usm/users/security-level
       The device lists the hashed passwords, even if clear text passwords are set in the NED and sent to the device.

       If clear text passwords are set in the ned then the clear text will be stored in the operational cdb.
       During sync-from the clear-text password will be fetched from the operational cdb and injected into the config.

       However, if hashed passwords are to be used instead of clear text then it is important to first delete the clear text password
       from the cdb before setting the hashed password in the ned.

       If only hashed passwords are to be used then the above does not need to be taken into account as the device lists the password hash.

       Clear text to hashed
         Clear text must be deleted from the ned since device only lists hashed.
         This deletion will not be sent.

       Hashed to clear text
         Adding the clear text to the ned is enough since the device lists hashed.


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
     admin@ncs(config)# devices device dev-1 ned-settings checkpoint-gaiaos_rest logging level debug
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


# 10. Oper-Data
============
  10.1 UIDs
  The uids of /access-layer/access-rule, /service-*, and /package/nat-rule will be:
    saved as oper-data during creation
    removed from oper-data during deletion

  Example command:
    admin@ncs> show devices device checkpoint-gaiaos_rest-1 rest_config
  Example output:
             DOMAIN
    NAME     TYPE    NAME          UID
    ---------------------------------------------------------------------
    Network  domain  Cleanup rule  e5c72b7a-811f-4b4b-a6fe-2cf646e0b4c7

    NAME      POSITION  UID                                   ALIAS  UID
    ----------------------------------------------------------------------
    Standard  1         6104aab6-392a-4202-93a0-68f5a02f9734
              2         c8f8d462-9029-423c-81fa-3ce80adce70f

    NAME                     UID
    ---------------------------------------------------------------
    AD_Dcerpc_services       b0a28547-24cd-6144-b20a-0edd5b0ca470
    AH                       97aeb422-9aea-11d5-bd16-0090272ccb30
    ALL_DCE_RPC              3d0d46b6-4ddb-43e0-9faa-c969dbc3e19f
    AOL                      97aeb44f-9aea-11d5-bd16-0090272ccb30
    ...                      ...

  10.2 cluster member-names
  The cluster-member-names of CpmiGatewayCluster objects can be populated in the CDB as
  oper-data by running the live-status command populate-cluster-members.

  Example:
    admin@ncs(config)# devices device checkpoint-1 live-status exec populate-cluster-members
    message Populated cluster members

  Example output:
    admin@ncs# show devices device checkpoint-1 rest_config cluster | display keypath
    /devices/device{checkpoint-1}/checkpoint-gaiaos_rest-oper:rest_config/cluster{cluster1}/member-names [ gateway1 gateway2 ]

  10.3 access-layer domain-type
  The domain types of access-layers are populated during sync-from and partial-sync-from.

  Example:
    admin@ncs# show devices device checkpoint-gaiaos_rest-1 rest_config access-layer domain-type
             DOMAIN
    NAME     TYPE
    -----------------
    Network  domain

    admin@ncs# show devices device checkpoint-gaiaos_rest-1 rest_config access-layer domain-type | display keypath
    /devices/device{checkpoint-gaiaos_rest-1}/checkpoint-gaiaos_rest-oper:rest_config/access-layer{Network}/domain-type domain

# 11. sync-from verbose and load-native-config file
=================================================

  11.1 sync-from verbose: To show what config is being fetched during sync-from
    REST
      admin@ncs% request devices device checkpoint-gaiaos_rest-1 sync-from verbose
      result true
      info
        Loaded: /access-layer
        ...
        ...
        Loaded: /simple-gateway
      admin@ncs%

    Config_mode_config
      admin@ncs% request devices device <device-name> sync-from verbose
      result true
      info
        Loaded: /config_mode_config/allowed-client
        ...
        ...
        Loaded: /config_mode_config/web
      admin@ncs%

    Db_edit
      admin@ncs% request devices device checkpoint-gaiaos_rest-1 sync-from verbose
      result true
      info
        Loaded: /db_edit/network_objects
        ...
        ...
        Loaded: /db_edit/services_groups
      admin@ncs%

  11.2 load-native-config verbose: To load config from file and show what config is loaded
    REST
      To load a package's nat-rules, it's name must be added in the nat-rule json.
      The loading only supports one REST object type per file.
      admin@ncs% request devices device <device-name> load-native-config file /path/to/file verbose
      info
        Loaded: /service-dce-rpc
      admin@ncs%

    Config_mode_config
      admin@ncs% request devices device <device-name> load-native-config file /path/to/file verbose
      info
        Loaded: /config_mode_config/allowed-client
        ...
        ...
        Loaded: /config_mode_config/web
      admin@ncs%

    Db_edit
      admin@ncs% request devices device <device-name> load-native-config file /path/to/file verbose
      info
        Loaded: /db_edit/network_objects
        ...
        ...
        Loaded: /db_edit/services_groups
      admin@ncs%

# 12. VSX Provisioning
====================

To enable VSX provisioning, enable it in ned-settings:

admin@ncs(config)# devices device <device> ned-settings checkpoint-gaiaos_rest vsx-settings use-vsx-provisioning-tool true

When VSX provisioning is enabled, the NED will only push/pull config
that can be handled vsx_provisioning_tool.

The vsx_provisioning_tool works on domains, and credentials for those
domains must be specified before attempting to push/pull config. This
is also done with ned-settings:

admin@ncs(config)# devices device <device> ned-settings checkpoint-gaiaos_rest vsx-settings vsx-credentials <ip of domain> user <user> password <passwd>

After such credentials have been set up, the NED is now able to pull
config (sync-from) from the device.

The domains can not be created, modified or deleted from the NED.
Therefore sync-from must be performed before trying to push (commit)
configuration for vsx_provisioning_tool.

Special cases and known issues:

12.1 Refer to interface by name or leads_to
  The ability to refer to interface either by name or by leads_to can
  not be accommodated by the Yang modeling language, therefore this
  configuration node has been duplicated as two nodes: interface-with-name
  and interface-with-leads_to. (We say interface-* when we mean either of
  those.)

12.2 Changing name/leads_to for interface
  The ability to change name/leads_to for an interface-* can not be
  accommodated by the Yang modeling language. To change name/leads_to of a
  certain interface-*, that interface-* must first be deleted, then an
  interface-* with the new name/leads_to must be created.

12.3 Default values for interface and topology
  The node interface-*/topology has different default values
  depending on the type of the virtual device (vd) which contains it. This
  can not be accommodated by the Yang modeling language, whence topology is
  modeled without any default value. Because of this, topology must always
  be specified when creating or modifying interface-*.

12.4 Slash notation for interface-*/ip and route/destination
  interface-*/ip and route/destination must use slash notation, e.g.
  1.2.3.4/24, and {interface-*,route}/{netmask,prefix} have not been
  implemented. This is because if, say, a route is configured with
  destination=1.2.3.4 prefix=24, the device will display destination with
  slash notation, and not display the prefix separately.

12.5 Use auth group credentials in vsx mode
  Please refer to: ned-settings checkpoint-gaiaos_rest vsx-settings in README-ned-settings.md

# 13. /packages/movable-nat-rule
=============================

  13.1 Introduction
    The previous /packages/nat-rule used the position as key. If the nat-rule needs to be moved that will cause
    the position to differ between the NED and device. As a result, /packages/movable-nat-rule was introduced.
    Movable-nat-rules does not store the nat-rule's position, instead the position is calculated through the cdb.

    An alias will be used as the key for a movable-nat-rule. This alias will be mapped to the device's auto-generated nat-rule uid.
    This mapping is stored in the operational-cdb.

    To enable /packages/movable-nat-rule please refer to
      1. ned-settings checkpoint-gaiaos_rest enabling /packages/movabl-nat-rule and disabling /packages/nat-rule

  13.2 Movable-nat-rule alias
    Every movable-nat-rule is mapped to an alias.

    Nat-rule created through the NED
      If the movable-nat-rule was created through the NED, then the alias will be specified by the user.

    Nat-rule auto-generated uid
      If the movable-nat-rule was not created through the NED, then the alias will be the nat-rule's auto-generated uid.

  13.3 Alias-uid mapping in operational database
    Creating a movable-nat-rule
      When creating a moveable-nat-rule through the NED, the nat-rule's uid from the device's response will be used in the alias-uid mapping.

      Note that movable-nat-rules that are blocked through ned-setting (see block-nat-rule-positions in README-ned-settings.md)
      will not get an uid mapping until after sync-from.
      The reason is because to get the uid, the movable-nat-rule creation must be sent to the device.
      If the uid is known beforehand then the uid can be used as the movable-nat-rule's alias.

    Deleting a movable-nat-rule
      Deleting a movable-nat-rule will automatically delete it's alias-uid mapping from the operational database.

# 14. Information about the device
================================

  14.1 Updating /simple-cluster/cluster-members/interfaces/ipv4-address
    Due to a device bug the updated value of
      /simple-cluster/cluster-members/interfaces/ipv4-address
    will not be showed by the device. Instead the original value will be shown. This will lead to a compare-config diff.

    How to recreate:
      14.1.1 Create simple-cluster with interface and member
        set devices device <device-name> config simple-cluster test ipv4-address 1.1.1.1 firewall true vpn true version R80.40

        set devices device <device-name> config simple-cluster test interfaces eth0 interface-type cluster ipv4-address 1.1.1.11 topology internal anti-spoofing false ipv4-network-mask 255.255.255.0 ipv4-mask-length 24

        set devices device <device-name> config simple-cluster test cluster-members mem1 ipv4-address 1.1.1.12 interfaces eth0 ipv4-address 1.1.1.12 ipv4-network-mask 255.255.255.0

        commit
        Commit complete.

      14.1.2 Update /simple-cluster/cluster-members/interfaces/ipv4-address and get the compare-config diff

        set devices device <device-name> config simple-cluster test cluster-members mem1 interfaces eth0 ipv4-address 1.1.1.13
        commit dry-run outformat native
          native {
            device {
                name checkpoint-gaiaos_rest-cluster
                data POST https://IP:PORT/web_api/set-simple-cluster
                     {
                       "members": {"update": {
                         "interfaces": {
                           "ipv4-address": "1.1.1.13",
                           "name": "eth0",
                           "ipv4-network-mask": "255.255.255.0"
                         },
                         "ipv4-address": "1.1.1.12",
                         "name": "mem1"
                       }},
                       "name": "test"
                     }
                  }
                }
        commit
        Commit complete.

        request devices device checkpoint-gaiaos_rest-cluster compare-config
          diff
           devices {
               device checkpoint-gaiaos_rest-cluster {
                   config {
                       simple-cluster test {
                           cluster-members mem1 {
                               interfaces eth0 {
          -                        ipv4-address 1.1.1.13;
          +                        ipv4-address 1.1.1.12;
                               }
                           }
                       }
                   }
               }
           }

        In the above diff it can be seen that the device returns a 1.1.1.12 when we have set it to 1.1.1.13.
        This device bug will be fixed by the vendor and be available from Checkpoint version R80.40.

  14.2 Setting /packages/nat-rule/method

    To change the value of /packages/nat-rule/method the below must be fulfilled:
      1. /packages/nat-rule/translated-source/name must be sent in the same POST call
          This is handled by the NED.

      2. /packages/nat-rule/translated-source/name cannot have the value Original
          it could point to another REST object, such as simple-gateway. host or network.
          This must be handled by the user.

# 15. Using show-changes for calculating transaction id
====================================================

  To enable polling, which is required for show-changes, the ned-setting:
    /ned-settings/checkpoint-gaiaos_rest/developer-settings/polling-interval
  needs to be set to an integer larger than zero.

  The ned's default way of calculating the transaction id is by fetching all the rest object config in use and calculate the transaction id.
  In case of no changes, a better approach is to use the show-changes rest endpoint and reuse the existing transaction id.

    Note:
      One commit must be sent from the ned before the ned will use show-changes instead of fetching all config.
      The reason is because this commit's published id will be used as from-session.
      This also applies after recovering from out-of-sync through sync-from.

    There are cases where show-changes cannot be used. In those cases the default approach will be used.
    Those cases are:
      1. never having issued a commit from the ned and issuing a check-sync.
      2. having issued a commit and then issuing a check-sync in the same connection session.

    Show-changes will be issued:
      1. when a commit has been issued by the ned in a previous connection session and
        check-sync is issued in this connection session before a commit.

  Here are the difference when using the show-changes approach:
    1. out-of-sync will be reported if any out of band changes are discovered when show-changes are issued by the ned.

# 16. Nameless access-section
==========================

  When /access-layer/access-rule exist within an access-section, the access-section's name will be added into the leaf:
    /access-layer/access-rule/section-name.
  If the access-section is nameless then the value:
    NAMELESS-SECTION
  will be added into the leaf:
    /access-layer/access-rule/section-name
