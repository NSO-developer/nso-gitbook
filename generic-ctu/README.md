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
  11. Targeting the NED to a specific device type

  12. Targeting generic-ctu as live-status-protocol NED from other existing devices

  13. Sending RPC actions to a device
  ```


# 1. General
------------

  This document describes the generic-ctu NED.

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
  | netsim                    | yes       | NED does not have yang model                                     |
  |                           |           |                                                                  |
  | check-sync                | no        | NED does not have yang model                                     |
  |                           |           |                                                                  |
  | partial-sync-from         | no        | NED does not have yang model                                     |
  |                           |           |                                                                  |
  | load-native-config        | no        | NED does not have yang model                                     |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Ned support nonconfig and config actions                         |
  |                           |           |                                                                  |
  | live-status show          | no        | NED does not implement TTL-based data                            |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | a10-acos                  | any NED version | any    | can be used as stand-alone configured device or   |
  |                           |                 | NED ve | as a call-through NED                             |
  |                           |                 | rsion  |                                                   |
  |                           |                 |        |                                                   |
  | cisco-asa                 | any NED version | any    | can be used as stand-alone configured device or   |
  |                           |                 | NED ve | as a call-through NED                             |
  |                           |                 | rsion  |                                                   |
  |                           |                 |        |                                                   |
  | cisco-ftd                 | any NED version | any    | can be used as stand-alone configured device or   |
  |                           |                 | NED ve | as a call-through NED                             |
  |                           |                 | rsion  |                                                   |
  |                           |                 |        |                                                   |
  | ciso-ios                  | any NED version | any    | can be used as stand-alone configured device or   |
  |                           |                 | NED ve | as a call-through NED                             |
  |                           |                 | rsion  |                                                   |
  |                           |                 |        |                                                   |
  | cisco-iosxe_netconf       | any NED version | any    | can be used as stand-alone configured device or   |
  |                           |                 | NED ve | as a call-through NED                             |
  |                           |                 | rsion  |                                                   |
  |                           |                 |        |                                                   |
  | cisco-iosxr               | any NED version | any    | can be used as stand-alone configured device or   |
  |                           |                 | NED ve | as a call-through NED                             |
  |                           |                 | rsion  |                                                   |
  |                           |                 |        |                                                   |
  | cisco-iosxr_netconf       | any NED version | any    | can be used as stand-alone configured device or   |
  |                           |                 | NED ve | as a call-through NED                             |
  |                           |                 | rsion  |                                                   |
  |                           |                 |        |                                                   |
  | juniper-junos             | any NED version | any    | can be used as stand-alone configured device or   |
  |                           |                 | NED ve | as a call-through NED                             |
  |                           |                 | rsion  |                                                   |
  |                           |                 |        |                                                   |
  | unix-host                 | any NED version | any    | can be used as stand-alone configured device or   |
  |                           |                 | NED ve | as a call-through NED                             |
  |                           |                 | rsion  |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-generic-ctu-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-generic-ctu-1.0.1.signed.bin
      > ./ncs-6.0-generic-ctu-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-generic-ctu-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-generic-ctu-1.0.1.tar.gz
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
     `generic-ctu-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-generic-ctu-1.0.1.tar.gz
     > ls -d */
     generic-ctu-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package generic-ctu-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package generic-ctu-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-generic-ctu-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package generic-ctu-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/generic-ctu-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-generic-ctu-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-generic-ctu-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install generic-ctu-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-generic-ctu-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-generic-ctu-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id generic-ctu-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-generic-ctu-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings generic-ctu logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings generic-ctu logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.genericctu \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings generic-ctu logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings generic-ctu logger java true
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
     admin@ncs(config)# devices device dev-1 ned-settings generic-ctu logging level debug
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
  > devices device dev-1 ned-settings generic-ctu logger level debug
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

# 11. Targeting the NED to a specific device type
-------------------------------------------------

  In order to target this NED thoward a specific device type, it is mandatory to configure the following NED settings:

   ned-settings generic-ctu rpc-actions device-mapping <device-id> ned juniper-junos

   The settings above sets a correspondence between <device-id> device ID and the juniper-junos underlying NED. 
   NOTE this settings is MANDATORY before trying to connect to the device, as this settings is used to properly select the connection state-machines.

   The ned-settings/generic-ctu/rpc-actions/device-mapping/ned should be set to one of the following values:
       - a10-acos
       - cisco-asa
       - cisco-ftd
       - cisco-ios
       - cisco-iosxe_netconf
       - cisco-iosxr
       - cisco-iosxr_netconf
       - juniper-junos
       - unix-host

   Since this NED can be used to target any device, the privileged prompt and configuration prompt also needs to be mandatory configured using the following settings:
   ```
   ned-settings generic-ctu rpc-actions expect-patterns "\\A[^#]*#\\s\\Z"
   ned-settings generic-ctu rpc-actions expect-patterns "\\A[^>]*>\\s\\Z"
   ```

   NOTE: the above patterns are compiled as regular expressions, so special characters needs to be escaped. 
   It is advised to define the regular expression as strict as possible, to avoid cases where a part of a RPC result matches into one of the defined expressions.

   Besides the mandatory prompt patterns, other optional patterns can be defined for special cases, eg when a RPC alters the expected prompts.

# 12. Targeting generic-ctu as live-status-protocol NED from other existing devices
-----------------------------------------------------------------------------------
   It is possible to reconfigure existing devices in NSO to target generic-ctu NED as live-status-protocol NED. For example, one can reconfigure a netconf device to call RPC's without defining additional devices.
   Here are some examples on how to configure live-status-protocol settings for juniper-junos and cisco-iosxe_netconf deices (assuming the deivces are already configured in NSO)

   ```
   devices device mx960-1
    address   172.20.161.28
    port      22
    authgroup mx960-1
    device-type netconf ned-id juniper-junos-nc-4.5
    live-status-protocol generic-ctu
     authgroup mx960-1
     device-type cli ned-id generic-ctu
    !
    state admin-state unlocked 
   !
   ```

   ```
   devices device asr900-1
    address   10.122.161.149
    port      22
    authgroup asr900-1
    device-type netconf ned-id cisco-iosxe_netconf-nc-16.9
    live-status-protocol generic-ctu
     authgroup asr900-1
     device-type cli ned-id generic-ctu
    !
    state admin-state unlocked

    Besides the live-status-protocol, following ned-settings needs to be configured also (note these are just examples):

    devices global-settings ned-settings generic-ctu rpc-actions expect-patterns "\A[^#]*#\Z"
    !
    devices global-settings ned-settings generic-ctu rpc-actions expect-patterns "\A[^#]*#\s\Z"
    !
    devices global-settings ned-settings generic-ctu rpc-actions expect-patterns "\A[^>]*>\Z"
    !
    devices global-settings ned-settings generic-ctu rpc-actions expect-patterns "\A[^>]*>\s\Z"
    !
    devices global-settings ned-settings generic-ctu rpc-actions device-mapping asr900-1
     ned cisco-iosxe_netconf
    !
    devices global-settings ned-settings generic-ctu rpc-actions device-mapping mx960-1
     ned juniper-junos
    !
    ```

    In the above examples, rpc-actions expect-patterns is a list commonly used for all devices and should contain regular expression used to match devices prompts.
    The device association is done through the rpc-actions device-mapping list. First item of the list corresponds to the name of the device defined in NSO and the second parameter is the NED name.

    NOTE: live-status-protocol NED feature requires NSO 5.3.1 or higher


# 13. Sending RPC actions to a device
-------------------------------------

   There are two main categories of commands that can be sent using generic-ctu NED: configuration commands (RPC's that are sent from the device configuration) and privileged commands (RPC's that are sent from privileged mode).
   Following RPC's exemplify the two categories:

   ```
   top devices device mx960-1 config config-actions action { action-payload "show configuration" }

   top devices device mx960-1 live-status exec nonconfig-actions action { action-payload "show route" }
   ```

   Each main RPC category also divides in the following sub-categories: simple commands that does not use additional prompts (eg "show configuration"), interactive commands that uses additional prompts (eg a RPC's that requests username/password or any other prompts) and internal NED commands, that does not interact with the device but with the NED. 
   The last category is supported but not implemented for a specific feature.

   Simple command format is as follows:

   ```
   action { action-payload "RPC CLI command" }
   ```

   Interactive command contains the simple command and adds the following list:

   ```
   action { action-payload "import bw-list bl1 overwrite use-mgmt-port scp://11.11.11.11/file" interaction { prompt-pattern "User name.*" value myuser } interaction { prompt-pattern Password.* value mypassword } interaction { prompt-pattern "Do you want to overwrite.*" value yes } }
   ```

   In the above command, the interaction list defines each prompt that it is expected from the device, along with its corresponding value.
   Note that prompt-pattern is compiled in a regular expression, so special characters that are expected from prompts should be escaped.
   The order of the interaction list definition is not important, but all the possible expected prompts should be defined.
   For example, in the above command, the prompt "Do you want to overwrite.*" is only active when the file exists.

   Internal commands looks the same as simple commands, but also contain the keyword "internal":

   ```
   action { action-payload "Internal RPC" internal }
   ```

   All the above command sub-categories can be chained and sent in the same request, by defining a list of actions:

   top devices device mx960-1 live-status exec nonconfig-actions action { action-payload "show route" } action { action-payload "show interfaces" } action { action-payload "Internal RPC" internal }

   The new implementation of RPC action execution allows a more structured way of sending multiple RPC's, by using its XML format:

   ```
  <?xml version="1.0" encoding="UTF-8"?><fragment xmlns="http://www.tailf.com">
   <a10-acos-stats:action xmlns:a10-acos-stats="http://tail-f.com/ned/a10-acos-stats">
    <a10-acos-stats:action-payload>import bw-list bl1 use-mgmt-port scp://11.11.11.11/file</a10-acos-stats:action-payload>
    <a10-acos-stats:interaction>
      <a10-acos-stats:prompt-pattern>User name.*</a10-acos-stats:prompt-pattern>
      <a10-acos-stats:value>admin</a10-acos-stats:value>
    </a10-acos-stats:interaction>
    <a10-acos-stats:interaction>
      <a10-acos-stats:prompt-pattern>Password.*</a10-acos-stats:prompt-pattern>
      <a10-acos-stats:value>admin</a10-acos-stats:value>
    </a10-acos-stats:interaction>
    <a10-acos-stats:interaction>
      <a10-acos-stats:prompt-pattern>Do you want to overwrite.*</a10-acos-stats:prompt-pattern>
      <a10-acos-stats:value>yes</a10-acos-stats:value>
    </a10-acos-stats:interaction>
    <a10-acos-stats:interaction>
      <a10-acos-stats:prompt-pattern>Do you want to save the remote host information.*</a10-acos-stats:prompt-pattern>
      <a10-acos-stats:value>no</a10-acos-stats:value>
    </a10-acos-stats:interaction>
   </a10-acos-stats:action>
   <a10-acos-stats:action xmlns:a10-acos-stats="http://tail-f.com/ned/a10-acos-stats">
    <a10-acos-stats:action-payload>show running</a10-acos-stats:action-payload>
   </a10-acos-stats:action>
  </fragment>
  ```
