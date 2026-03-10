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
  11. Save configuration on the device (persistent after restart)
  12. Adding known errors to a list that are checked at "connect" and "sync-from"
  ```


# 1. General
------------

  This document describes the alu-omniswitch-6k NED.

  The NED has been tested with ALU Omniswitch 6850 and ALU Omniswitch 6860 devices.

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
  | live-status actions       | yes       | -                                                                |
  |                           |           |                                                                  |
  | live-status show          | yes       | -                                                                |
  |                           |           |                                                                  |
  | load-native-config        | yes       | -                                                                |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | ALCATEL OMNISWITCH 6850   | 6.4.4.411.R01   | Alcate | -                                                 |
  |                           |                 | l-     |                                                   |
  |                           |                 | Lucent |                                                   |
  |                           |                 | OS6850 |                                                   |
  |                           |                 | -U24X  |                                                   |
  |                           |                 |        |                                                   |
  | ALCATEL OMNISWITCH 6860   | 8.2.1.276.R01   | Alcate | -                                                 |
  |                           |                 | l-     |                                                   |
  |                           |                 | Lucent |                                                   |
  |                           |                 | OS6860 |                                                   |
  |                           |                 | E-U28  |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-alu-omniswitch-6k-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-alu-omniswitch-6k-1.0.1.signed.bin
      > ./ncs-6.0-alu-omniswitch-6k-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-alu-omniswitch-6k-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-alu-omniswitch-6k-1.0.1.tar.gz
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
     `alu-omniswitch-6k-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-alu-omniswitch-6k-1.0.1.tar.gz
     > ls -d */
     alu-omniswitch-6k-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package alu-omniswitch-6k-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package alu-omniswitch-6k-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-alu-omniswitch-6k-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package alu-omniswitch-6k-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/alu-omniswitch-6k-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-alu-omniswitch-6k-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-alu-omniswitch-6k-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install alu-omniswitch-6k-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-alu-omniswitch-6k-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-alu-omniswitch-6k-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id alu-omniswitch-6k-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-alu-omniswitch-6k-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings alu-omniswitch-6k logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings alu-omniswitch-6k logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.aluomniswitch6k \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings alu-omniswitch-6k logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings alu-omniswitch-6k logger java true
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

  Create a vlan and a new ip interface:

  ```
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device dev-1 config 
  admin@ncs(config-config)# vlan 17 enable name VLAN17
  admin@ncs(config-config)# ip interface "TEST" address 1.2.3.4 mask 255.255.255.0 vlan 17 no-forward admin enable
  admin@ncs(config-config)# commit
  Commit complete.
  ```

  Verify that NCS is in-sync with the device

  Alternative 1

  ```
  admin@ncs(config-config)# check-sync
  result in-sync
  ```

  Alternative 2

  ```
  admin@ncs(config-config)# compare-config
  admin@ncs(config-config)# 
  ```


# 5. Built in live-status actions
---------------------------------

  Example:

  ```
  admin@ncs(config)# devices device dev-1 live-status exec any show system 
  result 
  System:
    Description:  6.3.4.378.R01 GA, March 11, 2009.,
    Object ID:    1.3.6.1.4.1.6486.800.1.1.2.1.7.1.3,
    Up Time:      5 days 11 hours 29 minutes and 57 seconds,
    Contact:      NONE,
    Name:         alu6850,
    Location:     NONE,
    Services:     72,
    Date & Time:  SUN JUN 04 2022  22:40:40 (PDT)

  Flash Space:
      Primary CMM:
        Available (bytes):  10492928,
        Comments         :  None
  ```


# 6. Built in live-status show
------------------------------

  Example:

  ```
  admin@ncs# show devices device alu-device live-status interfaces 
  SLOT  ADMIN    LINK                                                                                            
  PORT  STATUS   STATUS  ALIAS                                                                                   
  ---------------------------------------------------------------------------------------------------------------
  1/1   disable  down    ""                                                                                      
  1/2   disable  down    ""                                                                                      
  1/3   disable  down    ""                                                                                      
  1/4   disable  down    ""                                                                                      
  1/5   enable   down    ""                                                                                      
  1/6   disable  down    ""                                                                                      
  1/7   disable  down    ""                                                                                      
  1/8   enable   down    "MiTOP DS3 Circuit Emulation|Drake_05-15-
                                         13"   
  1/9   disable  down    ""                                                                                      
  1/10  enable   down    "test|12-31-2012|Drake's testing"                                                    
  1/11  disable  down    ""                                                                                      
  1/12  disable  down    ""                                                                                      
  1/13  disable  down    ""                                                                                      
  1/14  disable  down    "test2|06-30-13|Strategic IP"                                                         
  1/15  disable  down    "test2|06-30-13|Strategic IP"                                                         
  1/16  enable   down    "Joe"                                                                                   
  1/17  enable   down    ""                                                                                      
  1/18  enable   down    ""                                                                                      
  1/19  enable   down    "3.3"                                                                                   
  1/20  enable   down    ""                                                                                      
  1/21  disable  down    ""                                                                                      
  1/22  enable   down    " "                                                                                     
  1/23  enable   down    "test3|05-15-13"                                                                       
  1/24  enable   up      ""                                                                                      
  1/25  enable   down    "IL|12-31-15|alu6850-6|1/26|ESP<-->MES Ri
                                         ng"   
  1/26  enable   down    "IL|12-31-15|alu7750-1|1/1/1|ESP<-->MES R
                                         ing"  
  ```


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
     admin@ncs(config)# devices device dev-1 ned-settings alu-omniswitch-6k logging level debug
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
  > devices device dev-1 ned-settings alu-omniswitch-6k logger level debug
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

# 11. Save configuration on the device (persistent after restart)
----------------------------------------------------------------

A. The user can save the configuration on the device at a certain moment (and if the contents of the "working directory" have been verified as the best version of the CMM files).
Depending on the type of the switch (standalone or part of the stack), the user can issue the following commands:

For a standalone device
```
admin@ncs# devices device dev-1 live-status exec copy working certified
```

For a standalone device

```
admin@ncs# devices device dev-1 live-status exec copy flash-synchro
```

Please note that if the user is using `commit-queue`, then he must assure that all the commits have been executed and there is no other task in the queue. Please see the following example.

Commands from the first commit:

```
admin@ncs(config-config)# system contact NONE
admin@ncs(config-config)# system location NONE
admin@ncs(config-config)# no system timezone

admin@ncs(config-config)# commit dry-run outformat native 
native {
    device {
        name dev-1
        data system contact NONE
             system location NONE
             system timezone PST
             qos apply
    }
}

admin@ncs(config-config)# commit commit-queue async
commit-queue {
    id 1548246954737
    status async
}
Commit complete.
```

Command for the second commit:

```
admin@ncs(config-config)# session timeout ftp 5
admin@ncs(config-config)# commit commit-queue async
commit-queue {
    id 1548246957707
    status async
}
Commit complete.
```

Checking the status of the commits:

```
admin@ncs(config-config)# end
admin@ncs# show devices commit-queue | notab
devices commit-queue queue-item 1548246954737
 age       6
 status    executing
 devices   [ dev-1 ]
 is-atomic true

devices commit-queue queue-item 1548246957707
 age         3
 status      blocked
 devices     [ dev-1 ]
 waiting-for [ dev-1 ]
 is-atomic   true
```

At this moment we have 2 commits in the commit-queue, with 2 commit IDs.
Before sending any "copy" command to the device, the user must wait for all the commands to be executed (no commits in the queue).  
Otherwise, a different device configuration can be saved on the "certified" directory that the one we want to(the "copy" command executed before the commit).

To check if there are commands pending, please use the following command:

```
admin@ncs# show devices commit-queue | notab
devices commit-queue queue-item 1548246957707
 age       15
 status    executing
 devices   [ dev-1 ]
 is-atomic true
admin@ncs# show devices commit-queue | notab
devices commit-queue queue-item 1548246957707
 age       17
 status    executing
 devices   [ dev-1 ]
 is-atomic true
admin@ncs# show devices commit-queue | notab
devices commit-queue queue-item 1548246957707
 age       21
 status    executing
 devices   [ dev-1 ]
 is-atomic true

admin@ncs# show devices commit-queue | notab
% No entries found.
```

If there are no more entries, then it is safe for the user to send a "copy" exec action to the device, as below:

```
admin@ncs# devices device dev-1 live-status exec copy working certified
```

B. Also, these commands (the "copy" commands) can be triggered automatically from the NED, if "copy-certified" is enabled under ned-settings:

```
admin@ncs# config
admin@ncs(config)# devices device dev-1 ned-settings alu-omniswitch-6k persistent-store copy-certified enabled
```

Note:
- `disconnect` and `connect` commands are mandatory for enable a ned-setting


# 12. Adding known errors to a list that are checked at "connect" and "sync-from"
---------------------------------------------------------------------------------

Sometimes, errors could appear even for basic commands, like: "show system" (called at `connect`) or when NED wants to perform a `sync-from`.  
Such an example is the case when the user has limited access towards device and the "show system" command will return an error similar to: "ERROR: Authorization failed. No functional privileges for this command".

The above type of error is handled in the NED, but if similar errors occur, the user can add those to a list
that will be treated in NED. To be able to do that, the user must configure "alu-omniswitch-6k/write/known-errors"
list under the `ned-settings` section.

Example:  
Supposing that "show system" might return, in particular cases, the following error:  
"Error: An error message".
To make the NED aware of checking this error at `connect` - where "show system" command is called - the
following setting is necessary:

```
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# devices device dev-1 ned-settings alu-omniswitch-6k write known-errors ?
Possible completions:
  <WORD>   Warning regular expression, part of the device's reply
admin@ncs(config)# devices device dev-1 ned-settings alu-omniswitch-6k write known-errors "(?m)^Error: An error message"
admin@ncs(config-device-dev-1)# commit
Commit complete.

admin@ncs(config-device-dev-1)# config
admin@ncs(config-config)# disconnect
admin@ncs(config-config)# connect
```

Note:
- `disconnect` and `connect` commands are mandatory above, so the ned-setting can be taken into account
- special characters from regular expressions must be escaped using \"\\" character

The value for "known-errors" list must be a regular expression. In the above example, the exact error is matched.
But if the following regular expression: "(?m)^Error:.*", is used instead of the previous, then NED will
throw an exception if the reply from the device (for "show-system" command) has a line starting with string "Error:".
