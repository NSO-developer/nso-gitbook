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

  This document describes the cisco-staros NED.

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
  | netsim                    | yes       | Simulate device from NED yang model                              |
  |                           |           |                                                                  |
  | check-sync                | yes       | NED uses device built-in checksum command i.e 'show config       |
  |                           |           | checksum'                                                        |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | NED fetches full config from device and nedcom turbo parser      |
  |                           |           | filters config for partial paths                                 |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Check README.md section 'Built in live-status actions'           |
  |                           |           |                                                                  |
  | live-status show          | yes       | Check README.md section 'Built in live-status show'              |
  |                           |           |                                                                  |
  | load-native-config        | yes       | Device native 'show configuration' CLIs can be parsed and loaded |
  |                           |           | using this feature.                                              |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```
  Custom NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | proxy-connection          | yes       | Supports up to 1 proxy jumps                                     |
  |                           |           |                                                                  |
  | NSO ned secret type       | yes       | Check READM.md section 9                                         |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Cisco Systems QvPC-       | 18.X, 19.X,     | STAROS |                                                   |
  | SI/QvPC-DI Intelligent    | 20.X, 21.X      |        |                                                   |
  | Mobile Gateway            |                 |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-staros-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-staros-1.0.1.signed.bin
      > ./ncs-6.0-cisco-staros-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-staros-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-staros-1.0.1.tar.gz
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
     `cisco-staros-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-staros-1.0.1.tar.gz
     > ls -d */
     cisco-staros-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-staros-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-staros-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-staros-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-staros-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/cisco-staros-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-staros-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-staros-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-staros-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-staros-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-staros-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id cisco-staros-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-cisco-staros-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-staros logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-staros logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.staros \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-staros logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-staros logger java true
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

  ```
  admin@ncs(config)# devices device dev-1 config
  admin@ncs(config-config)# context test
  admin@ncs(config-ctx)# ip igmp profile default
  admin@ncs(config-igmp-default)# exit
  admin@ncs(config-ctx)# gtpp group default
  admin@ncs(config-group-default)# gtpp limit-secondary-rat-usage 32
  admin@ncs(config-group-default)# exit
  admin@ncs(config-ctx)# aaa group default
  admin@ncs(config-group-default)# exit
  admin@ncs(config-ctx)# subscriber default
  admin@ncs(config-default)# exit
  admin@ncs(config-ctx)# exit
  ```

  See what you are about to commit:

   ```
   admin@ncs(config)# commit dry-run outformat native
   native {
       device {
           name dev-1
           data context test
                 ip igmp profile default
                 exit
                 gtpp group default
                  gtpp limit-secondary-rat-usage 32
                 exit
                 aaa group default
                 exit
                 subscriber default
                 exit
                exit
       }
   }
   ```

  Commit new configuration in a transaction:

   ```
   # commit
   Commit complete.
   ```

  Verify that NCS is in-sync with the device:

   ```
   # devices device dev-1 check-sync
   result in-sync
   ```

  Compare configuration between device and NCS:

   ```
   # devices device dev-1 compare-config
   ```

  Note: if no diff is shown, supported config is the same in NSO as on the device.


# 5. Built in live-status actions
---------------------------------

  1. Execute native device command:

     The NED has support for a subset of native Cisco STAROS exec commands residing
     under device live-status. Presently, the following commands are supported:

     ```
     admin@ncs# devices device dev-1 live-status exec ?
     Possible completions:
       any          Execute any command on device
       clear        Empties the contents of specified files or terminates session
       context      Execute show commands under context
       copy         Copies a file to/ from the local file system, FTP, TFTP, SFTP, or HTTP server
       dir          Lists files contained in local file system
       filesystem   Execute filesystem command
       newcall      Execute newcall command
       reload       Reboots or restarts system or specified card within system
       save         Execute save command
       show         Execute show commands
       srp          Execute service redundancy protocol commands
       update       Execute update commands
      ```

     To execute a command, run it in NCS exec mode like this:

      ```
      admin@ncs# devices device dev-1 live-status exec show context

      result
      Context Name    ContextID    State     Description
      --------------- --------- ----------   -----------------------
      local           1            Active
      ```

      ```
      admin@ncs# devices device dev-1 live-status exec show versíon

      result
      Active Software:
        Image Version:                  18.2.v0.60511
        Image Build Number:             60511
        Image Description:              NonDeployment_Build
        Image Date:                     Tue Jun 30 06:09:43 EDT 2015
        Boot Image:                     /flash/production.60511.qvpc-di.bin
      ```

      NOTE: To excute show commands under context.

      ```
      admin@ncs# devices device dev-1 live-status exec \
                              context <context-name> show ip route

      result
      "*" indicates the Best or Used route.  S indicates Stale.

      Destination        Nexthop     Protocol   Prec Cost Interface
      *x.x.x.x/28    	   0.0.0.0     connected  0    0    pool test
      *x.x.x.x/32   	   0.0.0.0     connected  0    0    test1

      Total route count : 2
      Unique route count: 2
      Connected: 2
      ```

      Use live-status " exec any" action to configure commands in device:

      Note:
        - Its not possible to rollback if we get some error,
          when live-status actions used to configure commands.
        - User must give "\n" for newline/cr and also user must give all exit commands.

      For example to configure below commands:

      ```
      configure
       boot system priority 11 image /flash/staros.bin config /flash/system.cfg
      exit
      ```

      ```
      admin@ncs# devices device dev-1 live-status exec any show boot
      result
      boot system priority 10 \
          image /flash/staros.bin \
          config /flash/system.cfg
      admin@ncs#
      admin@ncs# devices device dev-1 live-status exec any "configure\nboot system \
                        priority 11 image /flash/staros.bin config /flash/system.cfg\nexit"
      result success
      admin@ncs# devices device dev-1 live-status exec any show boot
      result
      boot system priority 10 \
          image /flash/staros.bin \
          config /flash/system.cfg

      boot system priority 11 \
          image /flash/staros.bin \
          config /flash/system.cfg
      admin@ncs# devices device dev-1 live-status exec any \
                      "configure\nno boot system priority 11\nexit"
      result success
      admin@ncs#
      ```

  2. Execute device config commands as action:

     Note:
      - Its not possible to rollback if we get some error,
        when this action is used to configure commands.
      - User must give "\n" for newline/cr and also user must give all exit commands.

     Example-1:

     ```
     configure
       boot system priority 11 image /flash/staros.bin config /flash/system.cfg
     exit
     ```

     ```
     admin@ncs# devices device dev-1 config exec \
                       "boot system priority 11 image /flash/staros.bin config /flash/system.cfg"
     result success
     admin@ncs#
     ```

     Example-2:

     ```
     context test
       interface test
       exit
     exit
     ```

     ```
     admin@ncs# devices device dev-1 config exec "context test\ninterface test\nexit\nexit"
     result success
     admin@ncs#

     admin@ncs# devices device dev-1 config exec "no context test"
     result success
     admin@ncs#
     ```


# 6. Built in live-status show
------------------------------

  NED supports following live-status show

  ```
  admin@ncs# show devices device dev-1 live-status ?
  Possible completions:
    card            Displays card level information
    srp             Displays Service Redundancy Protocol information
    <cr>
  ```

  Example:

  ```
  admin@ncs# show devices device dev-1 live-status card table

                              OPER
  SLOT   CARD TYPE            STATE   SPOF  ATTACH
  --------------------------------------------------
  1: VC  4-Port Virtual Card  Active  -     -
  ```


# 7. Limitations
----------------

  1. To configure `no neighbor <ip> activate` command in `/context/router/bgp/address-family`
     user/service should configure `neighbor <ip>` command before `no neighbor <ip> activate`.

     ```
     admin@ncs# config
     Entering configuration mode terminal
     admin@ncs(config)# devices device dev-1 config staros:context test
     admin@ncs(config-context-test)# router bgp 64512
     admin@ncs(config-bgp-64512)# address-family ipv4
     admin@ncs(config-ipv4)# neighbor <ip-address>
     admin@ncs(config-ipv4)# no neighbor <ip-address> activate
     admin@ncs(config-ipv4)# commit dry-run outformat native
     device dev-1
       context test
        router bgp 64512
         address-family ipv4
          no neighbor <ip-address> activate
         exit
        exit
       exit
     admin@ncs(config-ipv4)#
     ```

  2. The STAROS device replace the `/active-charging/service/rulebase/action/priority` entry if it exists
     within the same `group-of-ruledefs/ruledef`.  However, according to YANG RFC and NSO, there is
     no mechanism to replace a list key based on optional leaves. This is a limitation in both YANG
     and NSO. The only viable approach is to remove the existing entry and recreate it with the updated
     key and optional leaves.

     The NED implements `group-of-ruledefs/ruledef` as unique in the priority list to prevent duplicate
     entries from being pushed to the STAROS device.

     ```
     # devices device dev-1 config
     # active-charging service ecs rulebase test
     # action priority 65535 group-of-ruledefs gof-test1 charging-action ca-test1

     admin@ncs(config-rulebase-test)# commit dry-run outformat native
     Aborted: values are not unique: mms_CE-MSISDN-IMSI-SGSN-IP-SUBSCRIBER-IP
     'devices device dev-1 config active-charging service ecs rulebase test action priority 55555 group-of-ruledefs'
     'devices device dev-1 config active-charging service ecs rulebase test action priority 65535 group-of-ruledefs'
     admin@ncs(config-rulebase-test)#
     admin@ncs(config-rulebase-test)#
     ```

     Resolution:

     To resolve this issue, first remove the conflicting priority entry and then recreate the desired configuration.

     ```
     # no action priority 55555
     # commit dry-run outformat native
     native {
         device {
             name dev-1
             data active-charging service ecs
                   rulebase test
                    no action priority 55555
                   exit
                   rulebase test
                    action priority 65535 group-of-ruledefs gof-test1 charging-action ca-test1
                   exit
                  exit
         }
     }
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
    - SSH/TELNET access to a device where the issue can be reproduced by the Cisco NSO NED team.
      This typically means both read and write permissions are required.
      Pseudo access via tools like Webex, Zoom etc is not acceptable.
      However, it is ok with device access through VPNs, jump servers etc though.

  Do as follows to gather the necessary information needed for your device, here named 'dev-1':

  1. Enable full debug logging in the NED

     ```
     ncs_cli -C -u admin
     admin@ncs# configure
     admin@ncs(config)# devices device dev-1 ned-settings cisco-staros logging level debug
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
  > devices device dev-1 ned-settings cisco-staros logger level debug
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
------------------------------------------------------

## 11.1 General STAROS NED secret problems and solutions
--------------------------------------------------------

  Problems:

  1. STAROS device encrypts passwords/secrets clear-text value.
  2. STAROS device always returns new/randomly encrypted value every
     time "show config" is executed, which means this could possibly
     trigger compare-config diff.

  Possible solutions in NED:

  1. NED supports configuring password/url/secrets in clear-text which
     gets encrypted on the device. NED stores clear-text value in operDB
     and replaces device encrypted value with clear-text when
     sync-from/compare-config is performed.

     Note: NED assumes that passwords/secrets are not changed outside NSO.
     There is no way to differentiate encrypted configs in NED/NSO as STAROS
     device returns new random encrypted value every time "show config" is executed.

  2. There can be secret encrypted configs on STAROS device which are not
     configured via NED, these config could trigger compare-config diff
     even after multiple sync-from due above mentioned problem(2). One way
     to avoid compare-diff is to let NED store these encrypted secrets in
     operDB by doing sync-to operation. When performing sync-to NED stores
     all encrypted values in operDB and replaces device encrypted value with
     operDB when sync-from/compare-config is performed.

  3. By default all secret/encrypted yang nodes are supported/configurable in NED.

     Please use "cisco-staros/disable-encrypted-config" ned-settings
     to disable all encrypted/secret yang nodes. You can use this ned-settings,
     if you are not managing encrypted configs via NSO or if you do not want to
     sync/commit any encrypted configs in NSO.

     ```
     # devices device dev-1 ned-settings cisco-staros disable-encrypted-configs true
     # commit
     ```

     Note: in order for the above settings to take effect, user must disconnect and do sync-from.


  4. Filter config when reading from device. There may be few commands
     NSO not authorized to configure on device, or in any other
     scenario where user would like to filter certain configs in
     sync-from(e.g password/encrypted/secret configs).

     ```
     # devices device dev-1 ned-settings cisco-staros \
             read replace-config skip-snmp regexp "\s+snmp community encrypted name \S+ \S+"
     # commit
     ```

     Note: in order for the above settings to take effect, user must disconnect and connect again.

     Please check README-ned-settings.md for more info regarding this ned-settings.

  NOTE:
   It is not possible for NED/NSO to avoid compare-config diff
   if user do not have any of above option(s).


## 11.2 NSO encryption and NEDCOM_SECRET_TYPE
---------------------------------------------

  It is best practice to avoid storing secrets (e.g. passwords and
  urls) in clear-text in NSO. NSO in general has no way of
  encrypting/decrypting secrets config on the device. This means that
  if nothing is done about this, NED will become out of sync once we write
  secrets to the device.

  In order to avoid becoming out of sync the NED stores clear-text value(s)
  in a special `secrets` table in oper data. Later on, when config is read from the
  device, the NED replaces all device encrypted values with their clear-text
  values; effectively avoiding all config diffs in this area.

  -- Handling auto-encryption

  Let us say that we have password-encryption on and we want to write a new
  snmp user to our device:

  ```
  admin@ncs(config)# devices device dev-1 config snmp user user1 password testtest1 security-model usm noauth
  admin@ncs(config-config)# commit
  ```

  this will be automatically encrypted by the device

  ```
   [local]qvpc# show configuration | grep "snmp user"
      snmp user user1 encrypted password +B3lcaqas14x3wxyz security-model usm noauth
   [local]qvpc1#
  ```

  But the secrets management will store this clear-text value in our `secrets` table:
  NOTE: clear-text is hidden from below table.

  ```
  admin@ncs# show devices device dev-1 ned-settings cisco-staros-oper | tab
  PATH              ENCRYPTED
  -----------------------------
  snmp/user(user1)  -
  ```

  which means that compare-config or sync-from will not show any
  changes and will not result in any updates to CDB. In fact, we can
  still see the unencrypted value in the NSO device tree:

  ```
  admin@ncs# show running-config devices device dev-1 config snmp user user1
  devices device dev-1
   config
    snmp user user1 password testtest1 security-model usm noauth
   !
  !
  ```

  -- Increasing security with NSO-side encryption

  NED handles the device-side encryption, but passwords are still unencrypted
  in NSO. To deal with this NED supports NSO-encrypted strings instead of
  clear-text secrets in the NSO data model.

  We have two alternatives, either we can manually encrypt our values using
  one of the NSO-encrypted types (e.g `tailf:aes-256-cfb-128-encrypted-string`) and
  set them to the tree, or we can recompile the NED to always encrypt secrets.

  -- Setting encrypted value

  Let us say we know that the NSO-encrypted string
    `$9$IUbJUkP0ggBHEHDUNd8fwygAp8QLTHUBtA72VByxNqc=` (`admin123`), we
  can then set it in the device tree as normal

  ```
  admin@ncs(config)# snmp user user2 encrypted password $9$IUbJUkP0ggBHEHDUNd8fwygAp8QLTHUBtA72VByxNqc= security-model usm noauth
  admin@ncs(config-config)# commit
  ```

  when committing this value, NED will decrypt it and the clear-text will be written to the device.
  Unlike the previous example the clear-text is not visible in the NSO device tree:

  ```
  admin@ncs# show running-config devices device dev-1 config snmp user user2
  devices device dev-1
   config
    snmp user user2 password $9$IUbJUkP0ggBHEHDUNd8fwygAp8QLTHUBtA72VByxNqc= security-model usm noauth
   !
  !
  ```

  -- Auto-encrypting passwords in NSO

  To avoid having to pre-encrypt your passwords you can rebuild your NED in your OS
  command shell specifying NSO encryption type in NEDCOM_SECRET_TYPE flag:

  ```
  yourhost:~/cisco-staros-cli-x.y$ NEDCOM_SECRET_TYPE="tailf:aes-cfb-128-encrypted-string" make -C src/ clean all
  ```
  Or by adding the line `NEDCOM_SECRET_TYPE=tailf:aes-cfb-128-encrypted-string`
  in top of the `Makefile` located in <cisco-staros-cli-x.y>/src directory.

  When the NED has been successfully rebuilt, it is necessary to reload the package into NSO.

  ```
  admin@ncs# packages reload
  ```

  Doing this means that even if the input to a passwords a clear-text string, NSO will always
  encrypt it, and you will never see clear-text secrets in the NSO device tree.

  If we reload our example with the new NEDCOM_SECRET_TYPE, all of the secrets are now NSO encrypted:

  ```
  admin@ncs# show running-config devices device dev-1 config snmp user
  devices device dev-1
   config
    snmp user user1 password $9$tTxhe3kqucTNlFWWuanA4D/XAnptBPI4aNPd0SwNgs8= security-model usm noauth
    snmp user user2 password $9$IUbJUkP0ggBHEHDUNd8fwygAp8QLTHUBtA72VByxNqc= security-model usm noauth
   !
  !
  ```

  and if we create yet another user we get the desired result:

  ```
  admin@ncs(config)# devices device dev-1 config snmp user user3 password admin1234 security-model usm noauth
  admin@ncs(config-config)# commit dry-run outformat native
  native {
      device {
          name dev-1
          data snmp user user3 password $9$4cUvr4gFIRE3yyDpEyXgjFlim6nKluRA6t0Of+C6z8w= security-model usm noauth
      }
  }
  admin@ncs(config-config)# commit
  Commit complete.
  admin@ncs(config-config)# end
  admin@ncs# show running-config devices device dev-1 config snmp user user3
  devices device dev-1
   config
    snmp user user3 password $9$4cUvr4gFIRE3yyDpEyXgjFlim6nKluRA6t0Of+C6z8w= security-model usm noauth
   !
  !
  admin@ncs#
  ```

  NOTE: Its not possible to support NEDCOM_SECRET_TYPE for "snmp community name" config.
  "snmp community name" is a list in yang model and having tailf:aes-cfb-128-encrypted-string
  for a list key, user can not delete or modify those instances using the clear text
  option, this is known NSO issue/side effect.


## 11.3  NSO key-rotation and standard NED secrets oper-data
------------------------------------------------------------

  From NED version 5.55 cisco-staros NED supports storing NED secrets
  oper-data under standard secrets path which is common in most NEDs i.e
  /devices/device/ned-settings/secrets/secret(standard). Before version 5.55 NED
  supports only /devices/device/ned-settings/cisco-staros-oper/secrets(legacy).

  From NED version 5.55, NED will move ned-settings/staros-op:cisco-staros-oper/secrets
  (legacy-secrets) to standard path ned-settings/secrets:secrets/secret
  automatically when data found in legacy-secrets path. Legacy data checked
  and moved in SHOW/PREPARE operations. This is one time NED internal operation
  i.e once existing data moved to standard path, NED will continue to use standard
  secrets path for future operations.

  ```
  admin@ncs# show devices device dev-1 ned-settings cisco-staros-oper
  % No entries found.
  admin@ncs#
  ```

  If you see 'no entries', all good with NED, below information is not relevant.

  For some reason, if legacy data is not moved automatically, user need to move oper secrets
  manually to standard secrets path. These are NED internal operational data caches that
  are usually not relevant to the user. However when new NSO key-rotation feature applied, NSO
  re-encrypts internal operational data caches only under /devices/device/ned-settings/secrets/secret.
  This means if a user wants to use the NSO key-rotation feature and there is data in the legacy
  secrets path, the legacy secrets cache must be moved to the standard path. This can be achieved
  by following an internal live-status exec action.
  Note: This is only relevant if the NED is recompiled with the NSO encryption type
  (e.g., tailf:aes-cfb-128-encrypted-string) and the NSO key-rotation feature is applied.

  ```
  admin@ncs# devices device dev-1 live-status exec any move-to-standard-secrets
  result
  Moved all legacy cached secrets to standard secrets location.
  admin@ncs#
  ```
