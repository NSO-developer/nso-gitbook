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
  11. How to execute native operational or config command on device
  12. NED Secrets - Securing your Secrets
  ```


# 1. General
------------

  This document describes the fortinet-fortios NED.

  Fortinet-fortios NED is built for Fortinet devices running FortiOS.

  The NED connects to the device CLI using either SSH or
  Telnet.

  Configuration is done by sending native CLI commands in a
  transaction to the device through the communication channel. If a
  single command fails, the whole transaction is aborted and reverted.

  If you suspect a bug in the NED, please see chapter 8.

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
  | netsim                    | yes       | -                                                                |
  |                           |           |                                                                  |
  | check-sync                | yes       | -                                                                |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | -                                                                |
  |                           |           |                                                                  |
  | live-status actions       | no        | -                                                                |
  |                           |           |                                                                  |
  | live-status show          | no        | -                                                                |
  |                           |           |                                                                  |
  | load-native-config        | yes       | -                                                                |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | FortiGate-60E             | 7.2.8           | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-100D            | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | Fortigate-200A            | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-200B            | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-200D            | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-300C            | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | Fortigate-310B            | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-500D            | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | Fortigate-800C            | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-1000C           | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-1000D           | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-1500D           | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-3040B           | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-3140B           | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-3240C           | 5.x             | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  |                           |                 |        |                                                   |
  | FortiGate-VM64            | 5.2.2           | FortiO | -                                                 |
  |                           |                 | S      |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-fortinet-fortios-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-fortinet-fortios-1.0.1.signed.bin
      > ./ncs-6.0-fortinet-fortios-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-fortinet-fortios-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-fortinet-fortios-1.0.1.tar.gz
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
     `fortinet-fortios-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-fortinet-fortios-1.0.1.tar.gz
     > ls -d */
     fortinet-fortios-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package fortinet-fortios-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package fortinet-fortios-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-fortinet-fortios-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package fortinet-fortios-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/fortinet-fortios-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-fortinet-fortios-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-fortinet-fortios-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install fortinet-fortios-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-fortinet-fortios-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-fortinet-fortios-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id fortinet-fortios-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-fortinet-fortios-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings fortinet-fortios logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings fortinet-fortios logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.fortinetfortios \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings fortinet-fortios logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings fortinet-fortios logger java true
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

  For instance, create a firewall vip entry:

  ```
  admin@ncs(config)# devices device dev-1 config
  admin@ncs(config-config)# vdom 
  admin@ncs(vdom)# root
  admin@ncs(root)# firewall vip
  admin@ncs(vip)# VIP1
  Value for 'extintf' [fortilink,port1,port2,port3,...]: port2
  admin@ncs(config-vip-VIP1)# mappedip 2.2.2.2
  admin@ncs(config-vip-VIP1)# portforward enable
  admin@ncs(config-vip-VIP1)# mappedport 2000
  admin@ncs(config-vip-VIP1)# extip 3.3.3.3
  admin@ncs(config-vip-VIP1)# extport 3000
  admin@ncs(config-vip-VIP1)# protocol sctp
  ```

  See what you are about to commit:

  ```
  admin@ncs(config-vip-VIP1)# commit dry-run outformat native 
  native {
      device {
          name dev-1
          data config vdom
               edit "root"
               config firewall vip
               edit "VIP1"
               set extintf port2
               set mappedip 2.2.2.2
               set extip 3.3.3.3
               set portforward enable
               set extport 3000
               set mappedport 2000
               set protocol sctp
               next
               end
               next
               end
      }
  }
  admin@ncs(config-vip-VIP1)#
  ```

  Commit new configuration in a transaction:

  ```
  admin@ncs(config-vip-VIP1)# commit
  Commit complete.
  ```

  Verify that NCS is in-sync with the device:

   ```
   admin@ncs(config-vip-VIP1)# devices device dev-1 check-sync
   result in-sync
   ```

  Compare configuration between device and NCS:

   ```
   admin@ncs(config-vip-VIP1)# devices device dev-1 compare-config
   admin@ncs(config-vip-VIP1)#
   ```

  Note: if no diff is shown, supported config is the same in
        NCS as on the device.


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
     admin@ncs(config)# devices device dev-1 ned-settings fortinet-fortios logging level debug
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
  > devices device dev-1 ned-settings fortinet-fortios logger level debug
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

# 11. How to execute native operational or config command on device
------------------------------------------------------------------

The NED has support for all exec commands in config mode, in both 'global' or
'vdom' mode. They can be accessed using the 'exec' prefix. For example:

```
admin@ncs(config)# devices device dev-1 config global
admin@ncs(global)# exec get system ha status
result
> get system ha status
Model: FortiGate-VM64
Mode: standalone
Group: 0
Debug: 0
ses_pickup: disable
number of vcluster: 0

host-Default (global) #
admin@ncs(global)#
```

To execute multiple commands, separate them with " ; ".
NOTE: Must be a white space on either side of the comma.
For example:

```
admin@ncs(global)# exec any "get system ha status ; get system performance status"
result
> get system ha status
Model: FortiGate-VM64
Mode: standalone
Group: 0
Debug: 0
ses_pickup: disable
number of vcluster: 0

host-Default (global) #
> get system performance status
CPU states: 1% user 0% system 0% nice 99% idle
CPU0 states: 1% user 0% system 0% nice 99% idle
Memory states: 49% used
Average network usage: 0 kbps in 1 minute, 0 kbps in 10 minutes, 0 kbps in 30 minutes
Average sessions: 6 sessions in 1 minute, 4 sessions in 10 minutes, 3 sessions in 30 minutes
Average session setup rate: 0 sessions per second in last 1 minute, 0 sessions per second in last 10 minutes, 0 sessions per second in last 30 minutes
Virus caught: 0 total in 1 minute
IPS attacks blocked: 0 total in 1 minute
Uptime: 21 days,  13 hours,  50 minutes

host-Default (global) #
admin@ncs(global)#


admin@ncs(config)# devices device dev-1 config
admin@ncs(config-config)# vdom
admin@ncs(vdom)# root
admin@ncs(root)#
admin@ncs(root)# exec get system performance firewall packet-distribution
result
> get system performance firewall packet-distribution
getting packet distribution statistics...
0 bytes - 63 bytes: 13858729 packets
64 bytes - 127 bytes: 12004431 packets
128 bytes - 255 bytes: 242901 packets
256 bytes - 383 bytes: 447139 packets
384 bytes - 511 bytes: 369061 packets
512 bytes - 767 bytes: 1117351 packets
768 bytes - 1023 bytes: 964 packets
1024 bytes - 1279 bytes: 2963 packets
1280 bytes - 1500 bytes: 48791 packets
 > 1500 bytes: 0 packets

host-Default (root) #
admin@ncs(root)#
```


# 12. NED Secrets - Securing your Secrets
-----------------------------------------

    It is best practice to avoid storing your secrets (e.g. passwords and
    shared keys) in plain-text, either on NSO or on the device. In NSO we
    support multiple encrypted datatypes that are encrypted using a local
    key, similarly many devices such as Fortinet FortiOS supports automatically
    encrypting all passwords stored on the device.

    Naturally, for security reasons, NSO in general has no way of
    encrypting/decrypting passwords with the secret key on the
    device.

    --- Increasing security with NSO-side encryption

    We have two alternatives, either we can manually encrypt our values using
    one of the NSO-encrypted types (e.g `aes-256-cfb-128-encrypted-string`) and
    set them to the tree, or we can recompile the NED to always encrypt secrets.

    --- Setting encrypted value

    Let us say we know that the NSO-encrypted string
      `$8$DVhpuxMJgeYTkPAu3kcb3vcGA9zdPUmme1n0ZtmPU+s=` (`admin`), we
    can then set it in the device tree as normal

```
      admin@ncs(config)# devices device dev-1 config
      admin@ncs(config-config)# global
      admin@ncs(global)# system admin
      admin@ncs(admin)# test-enc
      admin@ncs(config-admin-test-enc)# accprofile prof_admin
      admin@ncs(config-admin-test-enc)# vdom root
      admin@ncs(config-admin-test-enc)# password $8$DVhpuxMJgeYTkPAu3kcb3vcGA9zdPUmme1n0ZtmPU+s=
      admin@ncs(config-admin-test-enc)# commit dry-run outformat native
      native {
          device {
              name dev-1
              data config global
                   config system admin
                   edit "test-enc"
                   set accprofile prof_admin
                   set vdom root
                   set password $8$DVhpuxMJgeYTkPAu3kcb3vcGA9zdPUmme1n0ZtmPU+s=
                   end
                   end
          }
      }
      admin@ncs(config-admin-test-enc)# commit
```

    when commiting this value it will be decrypted and the plaintext will be written to the device.
    The plaintext value is not visible in the device tree:

```
      admin@ncs# show running-config devices device dev-1 config global system admin test-enc
      devices device dev-1
       config
      config global
      config system admin
          edit test-enc
           accprofile prof_admin
           vdom root
           password $8$DVhpuxMJgeYTkPAu3kcb3vcGA9zdPUmme1n0ZtmPU+s=
          exit
         !
        !
       !
      !
      admin@ncs#
```

    On the device side this plaintext value is of course encrypted
    with the device key.

    --- Auto-encrypting passwords in NSO

    To avoid having to pre-encrypt your passwords you can rebuild your NED in your OS
    command shell specifying an encrypted type for secrets using a command like:

    yourhost:~/fortinet-fortios-cli-x.y$ NEDCOM_SECRET_TYPE="tailf:aes-cfb-128-encrypted-string" make -C src/ clean all

    Or by adding the line `NED_EXTRA_BUILDFLAGS ?= NEDCOM_SECRET_TYPE=tailf:aes-cfb-128-encrypted-string`
    in top of the `Makefile` located in <fortinet-fortios-cli-x.y>/src directory.

    Doing this means that even if the input to a password is a plaintext string, NSO will always
    encrypt it, and you will never see plain text secrets in the device tree.

    If we reload our example with the new NED, all of the secrets are now encrypted:

```
      admin@ncs# show running-config devices device dev-1 config global system admin test-plain
      devices device dev-1
       config
      config global
      config system admin
          edit test-plain
           accprofile prof_admin
           vdom root
           password $8$N/ZpdEhC3SQl2/X7rPjvvmZzkZsw70Xc1fzIMprMh7M=
          exit
         !
        !
       !
      !
      admin@ncs#
```

    and if we create yet another user we get the desired result:

```
      admin@ncs(config)# devices device dev-1 config
      admin@ncs(config-config)# global
      admin@ncs(global)# system admin
      admin@ncs(admin)# test
      admin@ncs(config-admin-test)# accprofile prof_admin
      admin@ncs(config-admin-test)# vdom root
      admin@ncs(config-admin-test)# password admin
      admin@ncs(config-admin-test)# commit dry-run outformat native
      native {
          device {
              name dev-1
              data config global
                   config system admin
                   edit "test"
                   set accprofile prof_admin
                   set vdom root
                   set password $8$JwHd9mgOAi1xNdCEWijMyVW3NpHaEV8sSPXkoPdCfug=
                   end
                   end
          }
      }
      admin@ncs(config-admin-test)# commit
```
