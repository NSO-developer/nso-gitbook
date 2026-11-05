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
  11. The load-native-config feature
  12. VLAN participation(Mode: Interface Config)
  13. Saving configuration
  ```


# 1. General
------------

  This document describes the tejas-tejnos NED.

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
  | check-sync                | yes       | Use a snapshot of the full running config or only modeled parts  |
  |                           |           | for calculation                                                  |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | NED fetches full config from device and nedcom turbo parser      |
  |                           |           | filters config for partial paths                                 |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Check the README.md file, 'Built in live-status actions' section |
  |                           |           |                                                                  |
  | live-status show          | no        | Use 'live-status actions' instead                                |
  |                           |           |                                                                  |
  | load-native-config        | yes       | Device native 'show running-config' CLIs can be parsed and       |
  |                           |           | loaded using this feature.                                       |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | TJ1400P-Mx                | 8.0             | TejNOS |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```

  NOTE: The NED is not limited to the versions and models listed above and may support additional
  versions or models. Please try the NED with your target version and model. To request support for
  additional configuration features or use cases, contact Cisco Support and follow the process
  described in Section 8.


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-tejas-tejnos-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-tejas-tejnos-1.0.1.signed.bin
      > ./ncs-6.0-tejas-tejnos-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-tejas-tejnos-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-tejas-tejnos-1.0.1.tar.gz
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
     `tejas-tejnos-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-tejas-tejnos-1.0.1.tar.gz
     > ls -d */
     tejas-tejnos-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package tejas-tejnos-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package tejas-tejnos-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-tejas-tejnos-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package tejas-tejnos-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/tejas-tejnos-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-tejas-tejnos-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-tejas-tejnos-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install tejas-tejnos-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-tejas-tejnos-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-tejas-tejnos-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id tejas-tejnos-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-tejas-tejnos-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings tejas-tejnos logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings tejas-tejnos logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.tejastejnos \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings tejas-tejnos logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings tejas-tejnos logger java true
     admin@ncs(config)# commit
     ```

  **IMPORTANT**:
  Java logging does not use any IPC messages sent to NSO. Consequently, NSO performance is not
  affected. However, all log printouts from all log enabled devices are saved in one single file.
  This means that the usability is limited. Typically single device use cases etc.

## SSH Client Debug Logging

For issues related to the SSH connection, it is useful to enable full logging. First, identify which SSH client your NED is currently using:
	1.	Check Configuration: Check the NED setting: `show running-config <ned-name> connection ssh client`.
	2.	Check Trace Logs: Look in your NED trace file for the initialization line:
		•	`-- new ssh client (mina-sshd)`
		•	`-- new ssh client (sshj)`


Once you have identified the client, use the appropriate logger setting to see detailed output in $NSO_RUNDIR/logs/ncs-java-vm.log.

### Enabling Logging

#### For SSHJ client:
```
admin@ncs(config)# java-vm java-logging logger net.schmizz.sshj level level-all
admin@ncs(config)# commit
```

#### For Apache MINA client:
```
admin@ncs(config)# java-vm java-logging logger org.apache.sshd level level-all
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

  Example:

  ```
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device dev-1 config
  admin@ncs(config-config)# vlan database
  admin@ncs(Vlan-database)#  vlan 342,391-397,452,455,478,3001,3100,3200,4092,4092-4093
  admin@ncs(Vlan-database)# exit
  admin@ncs(config-config)# interface 0/10
  admin@ncs(Interface-0/10)#  description ' ***Free Port*** '
  admin@ncs(Interface-0/10)#  no auto-negotiate
  admin@ncs(Interface-0/10)#  vlan participation 391-397,452,455,478
  admin@ncs(Interface-0/10)#  vlan tagging 393-397,3100,3200,4092
  admin@ncs(Interface-0/10)#  vlan pvid 3001
  admin@ncs(Interface-0/10)# exit
  admin@ncs(config-config)#
  ```

  Always enclose interface description text in single quotes (`'...'`), as seen in the example above.

  See what you are about to commit:

   ```
  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name a-tej-dev
          data exit
               vlan database
                vlan 342
                vlan 391
                vlan 392
                vlan 393
                vlan 394
                vlan 395
                vlan 396
                vlan 397
                vlan 452
                vlan 455
                vlan 478
                vlan 3001
                vlan 3100
                vlan 3200
                vlan 4092
                vlan 4093
               exit
               config
               interface 0/10
                description ' ***Free Port*** '
                no auto-negotiate
                no flowcontrol
                vlan participation 391
                vlan participation 392
                vlan participation 393
                vlan participation 394
                vlan participation 395
                vlan participation 396
                vlan participation 397
                vlan participation 452
                vlan participation 455
                vlan participation 478
                vlan tagging 393
                vlan tagging 394
                vlan tagging 395
                vlan tagging 396
                vlan tagging 397
                vlan tagging 3100
                vlan tagging 3200
                vlan tagging 4092
                vlan pvid 3001
               exit
      }
  }
   ```

  Commit new configuration in a transaction:

   ```
   admin@ncs(config-config)# commit
   Commit complete.
   ```

  Verify that NED is in-sync with the device:

   ```
   admin@ncs(config-config)# devices device dev-1 check-sync
   result in-sync
   ```

  Compare configuration between device and NED's CDB:

   ```
   admin@ncs(config-config)# devices device dev-1 compare-config
   ```

  Note:  
   - if no diff is shown, supported config is the same in NED's CDB(configuration database) as on the device.


  On the device, the default values are not displayed. If the user previously called a 'sync-from' command and wants to check the default values,  
  then the following command can be used: `admin@ncs(config-config)# show full | details`.  
  However, if the user set parameter with a default value, that specific value is visible in ncs_cli to ensure better traceability.


# 5. Built in live-status actions
---------------------------------

  - **exec any**

   The NED has support for all Tejas TJ1400P-M1 operational mode commands.
   Use 'live-status exec any' command action to execute operation mode command.

   Examples:

  ```
  admin@ncs# devices device dev-1 live-status exec any show vlan 1 
  result show vlan 1

  VLAN ID: 1
  VLAN Name: default
  VLAN Type: Default

  Interface   Current   Configured   Tagging
  ----------  --------  -----------  --------
  0/1         Include   Include      Untagged
  0/2         Exclude   Include      Untagged
  0/3         Exclude   Include      Untagged
  0/4         Include   Include      Untagged
  0/5         Exclude   Exclude      Untagged
  0/6         Include   Include      Untagged
  0/7         Include   Include      Untagged
  admin@ncs# 
  ```

  ```
  admin@ncs# devices device dev-1 live-status exec any "show version | include Model"
  result show version | include Model

  Machine Model.................................. TJ1400P-M1
  admin@ncs# 
  ```


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
     admin@ncs(config)# devices device dev-1 ned-settings tejas-tejnos logging level debug
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
  > devices device dev-1 ned-settings tejas-tejnos logger level debug
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



# 11. The load-native-config feature
------------------------------------

The tejas-tejnos NED supports the load-native-config feature to load native TejNOS configuration into NSO and check whether it can be parsed by the NED.  
No connection to the target device is required.

Provide the configuration using either the `data` argument (a configuration string) or the `file` argument (a file accessible to NSO).  
Use the native configuration format shown by the device's `show running-config` command, preserving line breaks, mode-entry commands and matching  
`exit` statements. When providing a string, use `\r\n` to separate configuration lines.

Run the action under `devices device <dev-1>` in NSO configuration mode. Inspect the resulting candidate configuration with `show configuration` command.  
The user can use the `verbose` option to investigate the unsupported configuration. Successful parsing confirms model support, not that the device will  accept the configuration.

Examples:
 - providing a string with device's native configuration

```
admin@ncs(config-device-dev-1)# load-native-config data "interface 0/10\r\nstorm-control multicast\r\nstorm-control unicast action level 88\r\nstorm-control detection-interval 0\r\nclassofservice trust untrusted\r\ncos-queue scheduler untrustedWRR\r\ndescription 'desc'\r\nset igmp\r\nmtu 12288\r\nvlan pvid 342\r\nvlan participation include 342,392-393\r\nvlan tagging 342,393,4090\r\nport-security violation shutdown\r\nmac access-group g1 in 100\r\nmac access-group g2 in 120\r\nno isdp enable\r\nno loopback l2-rule\r\nno flowcontrol\r\nexit\r\n"
admin@ncs(config-device-dev-1)# show configuration
devices device dev-1
 config
  interface 0/10
   description 'desc'
   mtu         12288
   no flowcontrol
   mac access-group g1 in 100
   mac access-group g2 in 120
   storm-control multicast
   storm-control unicast action level 88
   classofservice trust untrusted
   cos-queue scheduler WRR
   vlan participation include 342
   vlan participation include 392
   vlan participation include 393
   vlan tagging 342
   vlan tagging 393
   vlan tagging 4090
   vlan pvid 342
  exit
 !
!
```

 - using 'verbose' option

```
admin@ncs(config-device-dev-1)# load-native-config data "interface 0/10\r\nstorm-control multicast\r\nstorm-control unicast action level 88\r\nstorm-control detection-interval 0\r\nset igmpexit\r\n" verbose
  number of lines parsed           :      5
  number of lines skipped          :      2
  skipped 2 lines in context '/' :
   (line 3) : 'storm-control detection-interval 0'
   (line 4) : 'set igmpexit'
admin@ncs(config-device-dev-1)# show configuration
devices device dev-1
 config
  interface 0/10
   no flowcontrol
   storm-control multicast
   storm-control unicast action level 88
  exit
 !
!
```


 - providing the configuration from a file

```
admin@ncs(config)# devices device dev-1 load-native-config file file-config.txt
```

In the 'file-config.txt' file, the configuration can be copied directly from the target device, i.e. get the output after running the 'show running-config' command.


# 12. VLAN participation(Mode: Interface Config)
------------------------------------------------

VLAN participation is configured per interface. Use `include` to make the interface an explicit member of a VLAN, or `exclude` to forbid membership.  
VLAN IDs can be specified individually, as comma-separated lists, or as ranges.

To restore automatic participation, delete the corresponding participation entry in NSO using `no vlan participation <vlan-id>`. The NED translates  
each deletion into `vlan participation auto <vlan-id>` on the device. The explicit participation entry then disappears from the device's running configuration.

Examples:

 - configuring explicit membership and exclusion

```
admin@ncs(config)# devices device dev-1 config
admin@ncs(config-config)# interface 0/10
admin@ncs(Interface-0/10)# vlan participation include 392-394,400
admin@ncs(Interface-0/10)# commit
```

 - restoring automatic participation for the configured VLANs

```
admin@ncs(Interface-0/10)# no vlan participation 392-394,400
admin@ncs(Interface-0/10)# commit dry-run outformat native
```

The native dry-run includes the following device commands:

```
interface 0/10
 vlan participation auto 392
 vlan participation auto 393
 vlan participation auto 394
 vlan participation auto 400
exit
```

Run `commit` to apply the changes. Both the `include` entries and the `exclude` entry are removed; the NED does not retain explicit `auto` entries.


# 13. Saving configuration
---------------------------

Configuration changes applied by the NED take effect immediately. To preserve them across a device reboot, the running configuration must also be saved  
to startup configuration using `write memory`.

The `write memory-mode` NED setting controls when this save occurs:

| Mode | Behavior |
|---|---|
| `disabled` (default) | The NED does not save the running configuration to startup configuration. |
| `on-commit` | Saves during the commit phase. A save failure causes the commit to fail and triggers rollback handling. |
| `on-persist` | Saves during the persist phase, after commit. A save failure is reported without rolling back the applied configuration. |

For example, to enable saving during commit for one device:

```
admin@ncs(config)# devices device dev-1 ned-settings tejas-tejnos write memory-mode on-commit
admin@ncs(config)# commit
```

The setting can also be configured under global NED settings or a device profile.
Device settings override profile settings, which override global settings.

**Note:** Saving writes the device's running configuration, including changes made outside NSO, not only the changes in the current transaction.
