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
  11. How to avoid out-of-sync
  ```


# 1. General
------------

  This document describes the extreme-xos NED.

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
  | netsim                    | yes       | additional info                                                  |
  |                           |           |                                                                  |
  | check-sync                | yes       | additional info                                                  |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | additional info                                                  |
  |                           |           |                                                                  |
  | live-status actions       | yes       | The ned supports all device commands                             |
  |                           |           |                                                                  |
  | live-status show          | no        | The ned does not dedicated show commands                         |
  |                           |           |                                                                  |
  | load-native-config        | yes       |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```
  Custom NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | proxy                     | yes       | The NED supports up to 2 jump servers                            |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Extreme Switch:           | Version 22.6.1. | EXOS   |                                                   |
  | X450G2/EXOS               | 4               |        |                                                   |
  | Version 22.6.1.4          |                 |        |                                                   |
  |                           |                 |        |                                                   |
  | Extreme Switch            | Version 30.5.1. | EXOS   |                                                   |
  |                           | 15              |        |                                                   |
  |                           |                 |        |                                                   |
  | Extreme Switch            | Version 32.1.1. | EXOS   |                                                   |
  |                           | 6               |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-extreme-xos-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-extreme-xos-1.0.1.signed.bin
      > ./ncs-6.0-extreme-xos-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-extreme-xos-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-extreme-xos-1.0.1.tar.gz
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
     `extreme-xos-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-extreme-xos-1.0.1.tar.gz
     > ls -d */
     extreme-xos-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package extreme-xos-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package extreme-xos-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-extreme-xos-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package extreme-xos-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/extreme-xos-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-extreme-xos-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-extreme-xos-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install extreme-xos-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-extreme-xos-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-extreme-xos-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id extreme-xos-cli-1.0
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

  When connecting through a proxy using SSH or TELNET
  ----------------------------------------------------------------------------------------

     Do as follows to setup to connect to a xos device that resides
     behind a proxy or terminal server:

     +-----+  A   +-------+   B  +-----+
     | NCS | <--> | proxy | <--> | xos |
     +-----+      +-------+      +-----+

     Setup connection (A):

     # devices device <xosdev> address <proxy address>
     # devices device <xosdev> port <proxy port>
     # devices device <xosdev> device-type cli protocol <proxy proto - telnet or ssh>
     # devices authgroups group ciscogroup umap admin remote-name <proxy username>
     # devices authgroups group ciscogroup umap admin remote-password <proxy password>
     # devices device <xosdev> authgroup ciscogroup

     Setup connection (B):

     Define the type of connection to the device:

     # devices device <xosdev> ned-settings extreme-xos proxy remote-connection <ssh|telnet>

     Define login credentials for the device:

     # devices device <xosdev> ned-settings extreme-xos proxy remote-name <user name on the xos device>
     # devices device <xosdev> ned-settings extreme-xos proxy remote-password <password on the xos device>

     Define prompt on proxy server:

     # devices device <xosdev> ned-settings extreme-xos proxy proxy-prompt <prompt pattern on proxy>

     Define address and port of xos device:

     # devices device <xosdev> ned-settings extreme-xos proxy remote-address <address to the xos device>
     # devices device <xosdev> ned-settings extreme-xos proxy remote-port <port used on the xos device>
     # commit

     Complete example config:

     devices authgroups group jump-server default-map remote-name MYUSERNAME remote-password MYPASSWORD
     devices device xos-via-1234 address 1.2.3.4 port 22
     devices device xos-via-1234 authgroup jump-server device-type cli ned-id extreme-xos
     devices device xos-via-1234 connect-timeout 60 read-timeout 120 write-timeout 120
     devices device xos-via-1234 state admin-state unlocked
     devices device xos-via-1234 ned-settings extreme-xos proxy remote-connection telnet
     devices device xos-via-1234 ned-settings extreme-xos proxy proxy-prompt ".*#"
     devices device xos-via-1234 ned-settings extreme-xos proxy remote-address 5.6.7.8
     devices device xos-via-1234 ned-settings extreme-xos proxy remote-port 23
     devices device xos-via-1234 ned-settings extreme-xos proxy remote-name admin
     devices device xos-via-1234 ned-settings extreme-xos proxy remote-password admin987

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

  `$NSO_RUNDIR/logs/ned-extreme-xos-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings extreme-xos logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings extreme-xos logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.extremexos \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings extreme-xos logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings extreme-xos logger java true
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

  Any device command can be run on the device with:

  ```
     devices device <devname> live-status exec any <command>
  ```

  The output will be printed out as it it returned by the device.


  The NED has support for all operational  commands
  by use of the 'devices device live-status exec any' action.
  For example:

  ```
  admin@ncs(config-device-exos-30.5)# live-status exec any "show version"
  result show version
  Switch          : PN:1N2039    SN:123456   Rev 01 BootROM: 1.2        IMG: 30.5.1.15
  PSUCTRL-1       : PN:MEAD      SN:MD1      Rev 01 BootROM: 2.1
  PSUCTRL-2       : PN:MEAD      SN:MD2      Rev 11 BootROM: 2.3
  mouse-usb       : PN:MOUSE     SN:4321     Rev 11 BootROM: 4.3
  floppy-A        :
  PSU-1       : Internal PSU-2 PN:1N2039 SN:12345
  PSU-2       : Internal PSU-3 PN:1N2039 SN:12345

  Image   : ExtremeXOS version 30.5.1.15 by release-manager
            on Thu Jan 30 21:20:35 EST 2020
  BootROM : 1.2
  Certified Version : EXOS Linux 4.14.123, FIPS fips-ecp-2.0.16

  Build Tools Version : exos-x32-sdk-2.5.3.1.0

  ```

  To execute multiple commands, separate them with " ; "
  *NOTE:* Must be a white space on either side of the comma.
  For example:

  ```
  admin@ncs(config-device-exos-30.5)# live-status exec any "show version ; show switch"
  result show version
  Switch          : PN:1N2039    SN:123456   Rev 01 BootROM: 1.2        IMG: 30.5.1.15
  PSUCTRL-1       : PN:MEAD      SN:MD1      Rev 01 BootROM: 2.1
  PSUCTRL-2       : PN:MEAD      SN:MD2      Rev 11 BootROM: 2.3
  mouse-usb       : PN:MOUSE     SN:4321     Rev 11 BootROM: 4.3
  floppy-A        :
  PSU-1       : Internal PSU-2 PN:1N2039 SN:12345
  PSU-2       : Internal PSU-3 PN:1N2039 SN:12345

  Image   : ExtremeXOS version 30.5.1.15 by release-manager
            on Thu Jan 30 21:20:35 EST 2020
  BootROM : 1.2
  Certified Version : EXOS Linux 4.14.123, FIPS fips-ecp-2.0.16

  Build Tools Version : exos-x32-sdk-2.5.3.1.0
  EXOS-Switch.18 # show switch

  SysName:          EXOS-Switch
  SysLocation:      NO LOCATION PROVIDED
  SysContact:       https://www.extremenetworks.com/support/
  System MAC:       00:50:56:8F:81:8E
  System Type:      EXOS-VM
  ....

  ```

  Generally the command output parsing halts when the NED detects
  an operational prompt, however sometimes the command
  requests additional input, 'answer(s)' to questions.

  ```
  ned-settings extreme-xos console extension

  ```
  Using these settings it is possible to define a separate way of
  interacting with the device, ignoring the default behaviour of the ned.

  The state machine involves configuring the pattern to be expected,
  the command to execute at match and the next state:

  E.g:

  ```
   ned-settings extreme-xos console extension command CMD-PWD "password value"
   ned-settings extreme-xos console extension command CMD-APPC-USER "user"
   ned-settings extreme-xos console extension pattern PAT-PWD Password:
   ned-settings extreme-xos console extension pattern PAT-USER Username:
   ned-settings extreme-xos console extension action ACT-APPC
    init  <a command to be sent initially"
    flush true
    state PAT-USER sendCommand CMD-USER next ACT-APPC
    state PAT--PWD sendSecret CMD-PWD next ACT-APPC
    state PAT-OPER-PMT next DONE
    state PAT-APPC-ERR reportError next ACT-APPC
   !

  ```

  Example of execution:

  ```
  # live-status exec any ACT-APPC

  ```


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

   - 'configure access-list filename any *'

   The filename must be introduced without the .pol extension:

   ```

  native {
      device {
          name test
          data configure access-list policyfilename any ingress
      }
  }
  admin@ncs(config)# commit 
  Commit complete.


  ```


   - 'configure stpd <name> ports mode dot1d <ports value>'
    This command seems to be auto-created and auto-deleted by the device, thus, the user must mimic the device behavior.
    For create, the ned will send the configure command, but for delete, the unconfigure command it's not available, and the ned
    will skip sending it to the device.


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
     admin@ncs(config)# devices device dev-1 ned-settings extreme-xos logging level debug
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
  > devices device dev-1 ned-settings extreme-xos logger level debug
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

# 11. How to avoid out-of-sync
------------------------------
All delete operations are performed using standard "no" command in front of the
configuration line. The ned will transform those command into expected device commands:

```
"no create" ---> "delete"
"no configure" --->" unconfigure"
"no configure * add *" --> "configure * delete *"
"no enable" --> "disable"
"no disable" --> "enable"

```

Also, the automatic deletion of some fields must be mirrored by the user:
E.g

```
create vlan test1
configure vlan test1 tag 100

delete vlan test1 -> will automatically delete everything in configure vlan test1.

```
To keep in sync, the 'configure ***' deletion must be performed by the user:
```
no configure vlan test 1
```
The ned will send only what is expected, as there is no command for tag deletion.



## 11.1 Create and Configure
----------------------------------------

   The Extreme device does various automatic changes to the running configuration.
   To keep in sync, the user must mimic device behavior, as the ned will not
   autoconfigure NSO cdb (using hooks is prohibited).
   The Ned will only do various operations over the device.

   E.g:
   Deleting VR and vlan configurations, both "no create" and "no configure" commands must be sent:

```
    no create vr vr-test1
    no create vr vr-test2

    no configure vr vr-test1
    no configure vr vr-test2

    no create vlan ned-test1
    no create vlan ned-test2

    no configure vlan ned-test1
    no configure vlan ned-test2
```

## 11.2 Banner
------------------------

A special case is the banner configuration. As this device expects a particular set of operations to set and reset the banner,
in NSO, the banner string must be quoted, and no '\r' must be added, as the device adds it automatically. For eol use only '\n'.
The delimiters are added/detected automatically by the ned.
Configuration example:

```
   1 line banner:    configure banner before-login save-to-configuration "1 liner test"

   multiple lines:  configure banner before-login save-to-configuration "1 liner test\n2 liner test\n3 liner test"

                              configure banner before-login save-to-configuration "************************* NOTICE *************************\n
                              This system is intended to be used solely by authorized\nusers in the course of legitimate corporate business.\n
                              Users are monitored to the extent necessary to properly\nadminister the system, to identify unauthorized users\n
                              or users operating beyond their proper authority, and to\ninvestigate improper access or use. By accessing this\n
                              system, you are consenting to this monitoring.\n
                              ************************* NOTICE *************************"
```

   Deleting the banner: 

```   
   no configure banner before-login save-to-configuration
```

   For multiline banner, in the commit dry-run outformat native output, the ned will add "! meta-data :: turbo :: no-prompt-after-send" tag before each line
   that is expected to be part of the banner text.


## 11.3 UPM profile
-------------------

Similar to banner configuration, 'upm profile' creation expects a multiline input with the desired configuration.
The configuration is ended with "."

The ned expects the configuration to be quoted in a single line and the all the command lines must be ended concatenated using a \n. 
The "." terminator is added automatically by the ned:

```  
  admin@ncs(config-config)# create upm profile fallbackvlanupm
  admin@ncs(config-profile-fallbackvlanupm)# "configure cli mode non-persistent\ncreate log message \"RADIUS Servers down. Moved port to Fallback VLAN\"\nconfigure netlogin port $(EVENT.LOG_PARAM_4) authentication mode optional\nconfigure vlan NAC_INET_USER add ports $(EVENT.LOG_PARAM_4)"
  admin@ncs(config-profile-fallbackvlanupm)# commit dry-run outformat native
native {
    device {
        name deviceName
        data ! meta-data :: /ncs:devices/device{deviceName}/config/extreme-xos:create/upm/profile{fallbackvlanupm} :: ! meta-data :: turbo :: no-prompt-after-send
             create upm profile fallbackvlanupm
             ! meta-data :: turbo :: no-prompt-after-send
             configure cli mode non-persistent
             ! meta-data :: turbo :: no-prompt-after-send
             create log message "RADIUS Servers down. Moved port to Fallback VLAN"
             ! meta-data :: turbo :: no-prompt-after-send
             configure netlogin port $(EVENT.LOG_PARAM_4) authentication mode optional
             ! meta-data :: turbo :: no-prompt-after-send
             configure vlan NAC_INET_USER add ports $(EVENT.LOG_PARAM_4)
              .
    }
}

```

Note that quotes inside the config lines must be escaped, otherwise the input will not be correctly digested by NSO.
The ned adds the '!meta-data ***' comments to signal the internal device interactor that this is a multi-line 
input without expecting the prompt. 
These comment lines are present only in prepare phase (dry-run) and are skipped when sent to the device.


## 11.4 Shared-secrets
----------------------------------

The device accepts unencrypted secrets that after commit will be shown as encrypted strings.
To keep in sync, the ned expects the secret to be configured using the "encrypted" prefix for both encrypted and clear text secrets.
The secrets handler will keep track of it and will not generate an out-of-sync.

The ned also supports cleartext provisioning by default. This means that if the service layer has the secret encrypted
with tailf:aes-cfb-128-encrypted-string type, it will pass it encrypted to the ned. Then, the ned will automatically decrypt
it, and pass it as clear text password to the device (auto removing the "encrypted" label).
By default, the ned will not show the decrypted secret in the dry-run native format.

Also, by default the ned-settings/extreme-xos/console/obfuscate-secret is enabled and all secrets are obfuscated from the trace files.

E.g:
Service sends:

```
    create account admin test encrypted "test1234"
```

NSO will send to the Ned this command:

```
    create account admin test encrypted $8$GqMbKyhm8FV4ehszxVheW/eXcnXRccxzCd+asX9ej2Q=
```

Then the NED will transform it to this:

```
    create account admin test "test1234"
```

The secrets handler will keep track of it, and no compare diff will appear, keeping it in sync, and being able to correctly
use the device (e.g: login with test/test1234 credentials).

Example of supported strings:

```
    configure tacacs secondary shared-secret  encrypted "aaaabbbccc1234"
    configure tacacs-accounting primary shared-secret encrypted "#$uX38iktZDe2flTQu2+nspakLV9AZBQ=="
    configure tacacs primary shared-secret  encrypted "$8$GqMbKyhm8FV4ehszxVheW/eXcnXRccxzCd+asX9ej2Q="
```

## 11.5 Dynamic configurations
-------------------------------------------

In many places, at configuration, the device allows skipping some elements and values, using a shorted command or even a macro.
In these cases the configured commands become different from what is seen at 'show' leading to out-of-sync.
To avoid this, the user/service must mimic the device behavior, as the ned can't and will not autofill elements in its cdb (hooks usage is prohibited).


Adding snmpv3 users with clear text passwords
------------------------------------------------------------------------------------

This is a case where the device encrypts the password as hex-strings and also allows a short from of the configuration command.
While this kind of command is accepted by the device :

```
    "configure snmpv3 add user VINETrw authentication sha labtest1 privacy aes labtest2"
```

when looking at show configuration output, the result is quite different:

```
    "configure snmpv3 add user "VINETrw" engine-id 80:00:07:7c:03:52:54:00:10:62:f3 authentication sha auth-encrypted
    localized-key 23:24:68:76:35:6c:7a:4e:47:58:6a:4e:68:72:31:39:4c:62:71:34:4c:30:77:78:74:4d:42:57:62:31:4d:49:64:73:68:52:6e:31:54:33:36:69:
    54:31:72:39:2b:66:35:51:6b:51:59:3d privacy aes 128 privacy-encrypted localized-key 23:24:65:58:66:42:78:4d:74:72:44:56:63:73:41:5a:6c:31:
    50:30:2f:77:4b:66:63:32:42:47:77:33:52:46:2f:44:4d:4f:57:39:5a:70:51:47:78:6f:51:54:37:39:44:41:42:52:30:3d"
```

Both passwords are encrypted as hashed hex strings and added under "auth-encrypted  localized-key" and "privacy-encrypted localized-key".
Also, the engine-id is added and the aes value: 128.

The ned will format the output for clear-text sending:

```
   "configure snmpv3 add user VINETrw authentication sha labtest1 privacy aes 128 labtest2"
```

For NSO encrypted values, the ned will auto-decrypt the passwords and will send it to the device as clear-text. Node that in dry-run, the decrypt will not
occur due to security reasons.

NSO user input:

```
    configure snmpv3 add user NEDTEST333 authentication sha auth-encrypted localized-key $8$GqMbKyhm8FV4ehszxVheW/eXcnXRccxzCd+asX9ej2Q=
    privacy aes 128 privacy-encrypted localized-key $8$GqMbKyhm8FV4ehszxVheW/eXcnXRccxzCd+asX9ej2Q=
```

NSO dry-run output:

```
       configure snmpv3 add user NEDTEST333 authentication sha $8$GqMbKyhm8FV4ehszxVheW/eXcnXRccxzCd+asX9ej2Q= privacy aes 128 $8$GqMbKyhm8FV4ehszxVheW/eXcnXRccxzCd+asX9ej2Q=
```

NSO output (at commit):

```
       configure snmpv3 add user NEDTEST333 authentication sha test1234 privacy aes 128 privacy-encrypted localized-key test1234
```

Device final result (show config):

```
       configure snmpv3 add user "NEDTEST333" engine-id 80:00:07:7c:03:52:54:00:10:62:f3 authentication sha auth-encrypted localized-key 23:24:55:45:47:4c:62:2b:33:7a:69:54:4f:75:73:30:6c:77:75:66
:6b:4a:77:59:76:52:61:6b:42:68:2b:4e:57:6f:67:68:79:6a:32:36:52:71:31:74:42:33:56:6d:73:67:6d:32:73:3d privacy aes 128 privacy-encrypted localized-key 23:24:30:67:6a:52:57:73:69:75:54:54:66
:34:6a:4f:5a:46:64:7a:2f:30:55:51:56:35:7a:39:54:37:32:55:37:35:38:6c:31:66:43:73:57:71:5a:72:6f:54:31:61:31:4c:34:50:77:3d
```

*Note:* To also support get output reinsert scenarios (e.g: retreived output is saved, device is cleared, and then device saved output is reinserted), the ned
enforces at configuration an identic yang structure for passwords, i.e the user must introduce "auth/privacy-encrypted localized-key" in front of the
clear-text/NSO encyrpted passwords", even if these tags re not sent to the device.
Only if the passwords are of hex format (how the device exposes them in 'show configuration'), the ned will detect it and will send the full command format.

*Note:* as engine-id it's operational data, it's not included in the configuration model. This means that only local engine-id configurations are supported by the ned.


## 11.6 Default user accounts
--------------------------------------------------------

As there are "hidden" default accounts, that are not visible in "show config" output, but there the user can modify their password, the NED adds
"show accounts" output into the cdb as "create accounts admin(Access is R/W)| user (Access is RO) <name>.

Eg:
Output accounts:

```
        create account admin admin
        create account user user
        create account admin user1
        create account admin user2
        create account admin cisco
```

This way, the default accounts will appear in NSO cdb, as a list entry in the /create/accounts list, but with empty 'encrypted' value, as password

## 11.7 Changing account passwords
--------------------------------------------------------

To change an existing account password, the device expects 'configure account [encrypted] password' command.

In "show configuration" output the device does not expose "configure account" lines, like in other cases, where, the lists entries that can be modified
after they are created (e.g vlan), are present both in /create and in /configure modes.

For the "account" list, only "create account" command is available in the show output and in configuration mode.
To keep the NED in sync with the device, the NED will use the "create account" command both for creation and editing of  already existing parameters
(account passwords).

To change an account password, the user must send the same command as when creating a new account, always using the "encrypted" parameter,
even when the password is in clear-text:

```
  'create account <type> <name> encrypted <value>'.
```

If there is a password change, the ned will detect it, and act as follows:

### 11.7.1 Encrypted string
--------------------------

If the 'value' is a device encrypted string (post-encrypted hash code), then the command that is sent is:

```
  'configure account <name> password encrypted <value>'
```

In this case, the device doesn't require the current password to be introduced.
E.g:

```
    admin@ncs(config-config)# show f
    devices device exos-1
    config
    create account admin admin
    ....
    create account admin test encrypted cleartext1 <--- Existing account
    create account user user
    ....

    admin@ncs(config-config)# create account admin test encrypted $5$7Mpn5u$RYQ.N5m2UALzJB9kkGCIk3kYE9Ia10ec5JFRATy6Ie5
    admin@ncs(config-config)# commit dry-run outformat native
    native {
    device
    { name exos-1
      data
      configure account test password encrypted $5$7Mpn5u$RYQ.N5m2UALzJB9kkGCIk3kYE9Ia10ec5JFRATy6Ie5
      }
    }
    admin@ncs(config-config)# commit
    Commit complete.
    admin@ncs(config-config)# compare
    admin@ncs(config-config)#
```

### 11.7.2 Clear-text or NSO encrypted string
-------------------------------------------- 

If the 'value' is clear-text or NSO encrypted (tailf:aes-cfb-128-encrypted-string), then the device expects the following procedure for password change:

```
   configure account <name> password<CR>
   Current user's password: <OLD_password><CR>
   New password: <NEW_password><CR>
   Retype new password <NEW_password><CR>

```

In this case the current user's password is required to make a password change. The ned act as follows:

 - If the 'OLD password' value was previously set as clear-text/aes-cfb-128-encrypted-string by NSO (e.g at account creation), then the ned accepts the
   following format:

```
             create acccount <type> <name> encrypted "NEW_password"
```

The OLD_password value is NOT needed at user input as it is already known by NSO (Modify operation:  the value it's already present in cdb).
The NED retrieves it from NSO cdb and uses it as input at "Current user's password" prompt.
E.g:

```
      create account admin test encrypted $8$GqMbKyhm8FV4ehszxVheW/eXcnXRccxzCd+asX9ej2Q=

      Current user's password: oldpassword --> retreived by the NED from its cdb
      New password: newpassword  --> decrypted by the NED from $8$GqMbKyhm8FV4ehszxVheW/eXcnXRccxzCd+asX9ej2Q=
      Retype new password newpassword  --> decrypted by the NED from $8$GqMbKyhm8FV4ehszxVheW/eXcnXRccxzCd+asX9ej2Q=
```

 - If the 'OLD password' is unknown to NSO (either retreived at sync-from, or was previously set as device encrypted value,
   or it's hidden - the case for default accounts), then the user must provide the clear text current password as follows:

```
     'create account <type> <name> encrypted <NEW_password> <OLD_password>'
```

The password values must be clear-text or aes-cfb-128-encrypted-string format or any combo of these two.

E.g:
User input:

```   
        create account admin test encrypted $8$GqMbKyhm8FV4ehszxVheW/eXcnXRccxzCd+asX9ej2Q= $8$XqMbKyhm8FV4ehszxVheW/eXcnXRccxzCd+asX9ej2R=

```

decrypts to:


```
        create account admin test encrypted newpassword oldpassword
```

Device input:

```
       configure account cisco password
       Current user's password: oldpassword
       New password: newpassword
       Retype new password newpassword
```

*Note:*
 If NSO is aware of the oldpassword value (set in a prevous transaction), even if the old-password is introduced at user input, the NED will use the old cdb
 value instead. This was done to avoid cases where (at rollback), the old password switches places with the new one and the user input will be incorrect:

 E.g:

```
         create account admin test encrypted newpassword oldpassword
         commit

         create account admin test encrypted newpassword1 newpassword
         commit

         rollback config

         commit  -> will revert to previous valid transaction:

         create account admin test encrypted newpassword oldpassword
```

Here the current password is set to "oldpassword" as in previous transaction, but this is incorrect, as the current password is now "newpassword1".
This is detected by the NED and will use the current password value from its cdb ("newpassword1"):

Device input:

```
       configure account test password
       Current user's password: newpassword1
       New password: newpassword
       Retype new password newpassword
```


**Warning:**
   Note that if there are scenarios where the user changes an account password from clear-text to a post-encrypted hash value, the rollback operation will fail,
   as the device encrypted password is unknown to NSO, can't be decrypted, and it is used as "Current user's password" in the password change sequence:
   E.g:

```   
   create account admin test encrypted oldpassword
   commit - >ok
   create account admin test encrypted "$5$7Mpn5u$RYQ.N5m2UALzJB9kkGCIk3kYE9Ia10ec5JFRATy6Ie5"
   commit -> ok
   rollback config
   commit -> FAIL
     NED will send:
      "configure account test password"
     Current user's password: "$5$7Mpn5u$RYQ.N5m2UALzJB9kkGCIk3kYE9Ia10ec5JFRATy6Ie5"
```

The device expects a clear-text password. As NSO can't decrypt it, the device  will generate the following error:
Error:  Incorrect password for user "test" ,retry or logout and then login and try again  '

 - Special handling for empty password for string for "old_password":
In case the old password is an empty string, to avoid NSO confusion, "\n" must be introduced instead of an empty string:
e.g:

```
create account admin admin encrypted newpassword "\n"
```
