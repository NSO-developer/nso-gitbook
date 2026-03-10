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
  11. Mandatory commands that have to be provided by the user
  12. "security" section commands
  13. How to configure additional config warning exceptions
  ```


# 1. General
------------

  This document describes the cisco-fxos NED.

  The cisco-fxos NED is built for 41xx/93xx devices.
  Also, the NED supports partial configuration for CISCO FXOS 21xx device.

  The NED connects to the device CLI using SSH.
  The configuration is done by sending native CLI commands to the device
  through the communication channel.

  FXOS uses a managed object model, where managed objects are abstract
  representations of physical or logical entities that can be managed.
  There are 4 commands available for object management:
   - create object
   - delete object
   - enter object
   - scope object

  All these 4 keywords (create, delete, enter and scope) are internally handled
  by the NED, so they should NOT be mentioned by the user.
  Also, the keyword 'set' used for setting property values, is controlled by
  the NED and the user must skip it.

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
  | load-native-config        | no        |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Firepower 41xx            | 2.4(1.205)      | FXOS   | -                                                 |
  |                           |                 |        |                                                   |
  | Firepower 21xx            | 2.8(1.105)      | FXOS   | -                                                 |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-fxos-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-fxos-1.0.1.signed.bin
      > ./ncs-6.0-cisco-fxos-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-fxos-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-fxos-1.0.1.tar.gz
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
     `cisco-fxos-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-fxos-1.0.1.tar.gz
     > ls -d */
     cisco-fxos-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-fxos-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-fxos-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-fxos-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-fxos-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/cisco-fxos-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-fxos-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-fxos-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-fxos-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-fxos-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-fxos-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id cisco-fxos-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-cisco-fxos-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-fxos logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-fxos logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.fxos \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-fxos logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-fxos logger java true
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

  **How to set a 'pre-login-banner' message**

  When configuring a 'pre-login-banner' you must assure that the line ends with a '\r\n'.
  In other words, the minimum size for a banner line is: '\r\n'.  
  Using the 'commit dry-run outformat-native' command, will display how the command that will be send to the device will look like.

  'set message' and 'ENDOFBUF' commands are automatically added.

  Notes:
   - On the device the following 2 commands are equivalent:  
     *clear message*  
       and  
     *set message*  
     *>ENDOFBUF*  
     To obtain the same behavior in NED, is enough to delete the message via 'no message' command.


   - The device will trim the trailing spaces, so if the user sets the follwing banner:

     ```
     message "just an example      \r\n",
     ```

     the device will delete the last spaces and the result will be:

     ```
     message "just an example\r\n".
     ```

     In this case the compare-config diff is expected.
     Please be aware to trim the trailing spaces when the pre-login-banner is set via ncs_cli.


   - Special characters must be escaped.  
     Example:

     ```
     message "this is a line\r\nspecial chars \\ and \"\r\n"
     ```


  Please check below examples of how to configure a 'pre-login banner':
  1. '\r\n' is missing from the command so no new line is provided

     ```
     admin@ncs(config-config)# security
     admin@ncs(config-security)# banner
     admin@ncs(config-banner)# pre-login-banner
     admin@ncs(config-pre-login-banner)# message "simple pre-login message"
     admin@ncs(config-pre-login-banner)# commit dry-run outformat native
     native {
         device {
             name fxos-dev
             data scope security
                  scope banner
                    scope pre-login-banner
                     set message
                     simple pre-login messageENDOFBUF
                    exit
                   exit
                  exit
         }
     }

     Adding '\r\n' to the command:
     admin@ncs(config-pre-login-banner)# message "simple pre-login message\r\n"
     admin@ncs(config-pre-login-banner)# commit dry-run outformat native
     native {
         device {
             name fxos-dev
             data scope security
                   scope banner
                    scope pre-login-banner
                     set message
                     simple pre-login message
                     ENDOFBUF
                    exit
                   exit
                  exit
         }
     }
     admin@ncs(config-pre-login-banner)# commit
     Commit complete.
     admin@ncs(config-pre-login-banner)# compare-config
     admin@ncs(config-pre-login-banner)#
     ```


  2. set a pre-login-banner on multiline

     ```
     admin@ncs(config-pre-login-banner)# message "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\r\n+         This is a first line banner. If you are             +\r\n+  not authorized to log on, please exit immediately.         +\r\n+           Your activities are           being monitored     +\r\n"
     admin@ncs(config-pre-login-banner)# commit dry-run outformat native
     native {
         device {
             name fxos-dev
             data scope security
                   scope banner
                    scope pre-login-banner
                     set message
                     +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                     +         This is a first line banner. If you are             +
                     +  not authorized to log on, please exit immediately.         +
                     +           Your activities are           being monitored     +
                     ENDOFBUF
                    exit
                   exit
                  exit
         }
     }
     admin@ncs(config-pre-login-banner)# commit
     Commit complete.
     admin@ncs(config-pre-login-banner)# compare-config
     admin@ncs(config-pre-login-banner)#
     ```


# 5. Built in live-status actions
---------------------------------

  Execution of the generic RPC
  ----------------------------

  **A. The generic RPC handling mechanism which is based on a pre-defined YANG model is designed to support any kind of device RPC.**  
  The user can send the commands to the device using a generic list of actions.Each action can be simple, interactive or internal.  
  Please see below a general example for exporting the current configuration of the device:

   ```
   scope ssa
    scope system
     export-config scp://username@localhost/path/file.xml enabled
     Password: (password_value)
     commit-buffer
    exit
   exit
   ```

  To 'translate' the above CLI commands, the user can call the following list of actions:

   ```
   admin@ncs# devices device cisco-fxos-dev live-status exec nonconfig-actions action { action-payload "scope ssa" } action { action-payload "scope system" } action { action-payload " export-config scp://username@localhost/path/file.xml enabled" interaction { prompt-pattern Password.* value "password_value" } } action { action-payload "commit-buffer" } action { action-payload exit } action { action-payload exit }
   ```

  Explanations:
   - list action: defines a list of RPC's to be sent to the device. Each action can be simple
     (like the first 2) or interactive (like the 'export-config' action)
   - action-payload: the actual CLI command sent to the device, e.g "show configuration" or "scope ssa"  
     list interaction: used for interactive RPC's. Each entry defines a prompt-pattern and
     its corresponding value (e.g Password: -> password).

      Notes:
      - prompt-pattern string is a regular expression, so special characters needs to be escaped;  
      - the order of pattern definition is not important, so the list entries does not have to respect the device order of prompting.

  The user will send a list of simple actions to go in the particular mode: 'scope ssa', 'scope system'
  and for the 'export-config' action, will need an interactive action to be able to send the password
  when the prompt 'Password:' will pop up. The regex 'Password.*' was chosen here to map the prompt Password:

  Once the export-config was added, the user can call the 'show export-config' action to check the status as below:

   ```
   admin@ncs# devices device cisco-fxos-dev live-status exec nonconfig-actions action { action-payload "scope ssa" } action { action-payload "scope system" } action { action-payload "show export-config" } action { action-payload exit }

   result
   scope ssa

   scope system

   show export-config

   Export Configuration Task:
       Hostname   User       Protocol Admin State Status    Description
       ---------- ---------- -------- ----------- --------- -----------
       localhost
                  username   Scp      Disabled    Succeeded
       local                 Http     Disabled    Succeeded
   exit
   ```


  To modify the field description, the user has to run the following commands:

   ```
   scope ssa
    scope system
     scope export-config locahost
      set descr "some description"
      commit-buffer
     exit
    exit
   ```

  The equivalent actions are:

   ```
   admin@ncs# devices device cisco-fxos-dev live-status exec nonconfig-actions action { action-payload "scope ssa" } action { action-payload "scope system" } action { action-payload "scope export-config localhost" } action { action-payload "set descr \"some description \"" } action { action-payload commit-buffer } action { action-payload exit } action { action-payload exit }
   ```

  Here the " are escaped using '\\'.

  In order to delete the 'export-config localhost' the user must issue the following command:

   ```
   scope ssa
    scope system
     delete export-config localhost
     commit-buffer
    exit
   ```

  The related actions are:

   ```
   admin@ncs# devices device cisco-fxos-dev live-status exec nonconfig-actions action { action-payload "scope ssa" } action { action-payload "scope system" } action { action-payload "delete export-config localhost" } action { action-payload commit-buffer } action { action-payload exit }
   ```


  **B. Some of the generic RPC issued towards the device have a different prompt at the end of the execution.**  
  For example, suppose the prompt has the following format: 'prompt1# '  
  After a RPC is executed, the prompt will change.  
  Example:

   ```
   prompt1# run rpc1
   "This is a text following the execution of RPC."
   new-prompt2> 
   ```


  Also, multiple RPCs can be executed sequentially and the prompt may change one after another.  
  For this situation, the user must configure a list of "expect-patterns" that comprises all the possible
  prompt patterns that can be met when a RPC is sent to the device.  
  All the RPC will be treated as simple commands.  
  To configure the list of "expect-patterns", the following setting should be done under ned-settings:

   ```
   admin@ncs# config
   Entering configuration mode terminal
   admin@ncs(config)# devices device FXOS
   admin@ncs(config-device-FXOS)#  ned-settings cisco-fxos rpc-actions expect-patterns ".*> ?"
   ```

  Please note that the value(*".\*\> ?"*) for the list-entry above is a regex. If multiple regex are
  required to met all the possible prompt patterns, then configure multiple values for the list "expect-patterns".

  Example of RPCs for a 93xx fxos device:
  1. "connect module 1 telnet"
  2. "connect ftd"
  3. "system support diagnostic-cli"
  4. "enable" (expects a "Password:" prompt" and a password with value: "test")
  5. "show conn count"

  The prompt is changing after every RPC but the common thing is that it ends with ">" or "> " or "text> ".

  Hence, to match all the possibilities for these prompts, the expect-pattern will look like:

   ```
   admin@ncs(config-device-FXOS)#  ned-settings cisco-fxos rpc-actions expect-patterns ".*> ?"
   ```

  The interactive commands are the commands that expect a user interaction, like sending a username
  or password. RPC no 4, "enable" from above, is such an example.

  The generic RPC command will be similar with:

   ```
   admin@ncs# devices device FXOS live-status exec nonconfig-actions action { action-payload "connect module 1 telnet" } action { action-payload "connect ftd" } action { action-payload "system support diagnostic-cli" } action { action-payload en interaction { prompt-pattern Password: value "test" } } action { action-payload "show conn count" } action { action-payload exit } action { action-payload exit } action { action-payload exit } action { action-payload exit }
   ```

  In order to execute a new action in the same session, we have to leave the device in the
  init state, i.e. having the prompt from the beginning (when first connecting to it ). Hence,
  a few "exit" commands must be issued at the end of the generic RPCs.

  Note: when a command is sent to the device, the echo of that command is expected. If for some reason,
  the echo is missing or is incomplete, then after X seconds (X is the number of seconds set
  for the connect-timeout), the following command from the RPCs set is sent to the device.


# 6. Built in live-status show
------------------------------

  Examples of running live-status commands:
  1. live-status command for monitoring Logical Devices: "show resource-profile user-defined"

     ```
     admin@ncs# show devices device cisco-fxos-dev live-status resource-profile user-defined
     ```

  2. live-status command for show interface under fabric a (if fabric b is supported, then interface-fabric-b can be used also).

     ```
     admin@ncs# show devices device cisco-fxos-dev live-status interface-fabric-a
     ```

  3. live-status command for show slot and show monitor detail:

     ```
     admin@ncs# show devices device cisco-fxos-dev live-status slot
     admin@ncs# show devices device cisco-fxos-dev live-status slot 1 monitor detail
     ```

     The time the values are stored in the memory is called ttl(time to live) and this in configurable under ned-settings:

     ```
     admin@ncs(config)# devices device cisco-fxos-dev ned-settings cisco-fxos live-status time-to-live 50
     ```

     50 represents the value of 50 seconds.

     Example of running 'show' exec action:

     ```
     admin@ncs# devices device cisco-fxos-dev live-status exec show configuration
     ```


# 7. Limitations
----------------

  NED doesn't provide an exact copy of all details in the device CLI. Due to some YANG constraints,
  some of the CLI configuration commands may have a slightly different name.

  Examples of CLI commands(differences between the device and NED ncs_cli)

  ```
  +-------------------------------------------------+---------------------------------------------------+
  |      Command's name on the device               |        Command's name on the ncs_cli              |
  +-------------------------------------------------+---------------------------------------------------+
  |      enable https                               |        https-enable                               |
  |      create ssh-server host-key                 |        ssh-server host-key                        |
  |      enable ssh-server                          |        ssh-server-enable                          |
  |      set ssh-server host-key rsa 2048           |        ssh-server-set host-key rsa 2048           |
  |      set ssh-client stricthostkeycheck disable  |        ssh-client-set stricthostkeycheck disable  |
  |      scope fault policy                         |        fault-policy                               |
  |      enable core-export-target                  |        core-export-target-enable                  |
  |      disable core-export-target                 |        no core-export-target-enable               |
  |      monitoring/enable snmp                     |        snmp-enable                                |
  |      monitoring/disable snmp                    |        no snmp-enable                             |
  |      monitoring/enable syslog console           |        syslog-console-enable                      |
  |      monitoring/disable syslog console          |        no syslog-console-enable                   |
  |      monitoring/enable syslog file              |        syslog-file-enable                         |
  |      monitoring/disable syslog file             |        no syslog-file-enable                      |
  +-----------------------------------------------------------------------------------------------------+
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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-fxos logging level debug
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
  > devices device dev-1 ned-settings cisco-fxos logger level debug
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

# 11. Mandatory commands that have to be provided by the user
------------------------------------------------------------

In order to have a perfect synchronization between the NED (and its CDB) and the target device,
some commands that have default values on the device, must be provided by the user.

Please see the following examples:
1. *enable/disable* commands for the 'port-channel' or for the 'member-port' configured under the 'port-channel'.  
    Creating port-channel 4 under eth-uplink/fabric a from ncs_cli:

    ```
    admin@ncs(config-config)# eth-uplink
    admin@ncs(config-eth-uplink)# fabric a
    admin@ncs(config-fabric-a)# port-channel 4
    admin@ncs(config-port-channel-4)# disable
    ```

    If you would like to check how the commands that are going to be sent towards the device
    would look like, use the below dry-run command:

    ```
    admin@ncs(config-port-channel-4)# commit dry-run outformat native
     scope eth-uplink
       scope fabric a
        enter port-channel 4
         set auto-negotiation    no
         set duplex              fullduplex
         set flow-control-policy default
         set lacp-policy-name    default
         set port-channel-mode   active
         set descr               ""
         set port-type           data
         disable
         set speed               10gbps
        exit
       exit
      exit
    ```

    For the member-port:

    ```
    admin@ncs(config-config)# eth-uplink
    admin@ncs(config-eth-uplink)# fabric a
    admin@ncs(config-fabric-a)# port-channel 5
    admin@ncs(config-port-channel-5)# member-port 2 7
    admin@ncs(config-member-port-2/7)# disable
    admin@ncs(config-member-port-2/7)# exit
    admin@ncs(config-port-channel-5)# exit
    admin@ncs(config-fabric-a)# exit
    admin@ncs(config-eth-uplink)# exit
    admin@ncs(config-config)#
    ```

    When an interface becomes part of a member-port (interface 2 6 in the example below), the
    interface will be automatically removed by the device. Hence, to be sure the NED will be in
    sync with the device, the user must delete the related interface (interface 2 6) from fabric a.  
    Example:

    ```
    eth-uplink
      fabric a
        port-channel 4
          no member-port 2 6
        exit
        no interface 2 6 -> this line will be filtered out by the 'commit' command
      exit
    exit
    ```

    Note: this command is filtered and is not sent to the device but is used for keeping
    the internal CDB in sync with the dynamic configuration of the device.


2. When creating an external-port-link under the logical-device, a port-name command will be
    dynamically created on the device. The port-name command has to be provided in ncs_cli as follows:

    ```
    admin@ncs(config-config)# ssa
    admin@ncs(config-ssa)# logical-device ftd23 ftd 1 standalone
    admin@ncs(config-logical-device-ftd23)# external-port-link PC4_ftd Port-channel4(or Ethernet1/4 for example) ftd
    admin@ncs(config-external-port-link-PC4_ftd)# port-name Port-channel4(or Ethernet1/4 for example)
    admin@ncs(config-external-port-link-PC4_ftd)# exit
    admin@ncs(config-logical-device-ftd23)# exit
    admin@ncs(config-ssa)# exit
    admin@ncs(config-config)#
    ```


3. On the device, the "interface Ethernet1/8" and "interface 1 8 have" the same meaning and the device saves
    the interfaces configuration using the last format.
    Hence, in the NED when you want to address the interface Ethernetx/y just use interface x y. (The
    transition to the interface Ethernetx/y will be handled internally, when necessary).


# 12. "security" section commands
---------------------------------

1. local-user  
    When creating a "local-user", the user must provide mandatory fields like: "password" and "phone" number.  
    If the "phone" number is not provided, the fxos 21xx device will automatically set the phone number to `""` value.
    Normally, the `""` is not allowed and the following operation is not permitted: `set phone ""`.  
    The fields with default values must be provided by the user, to maintain the synchronization between the NED and the device.
    The fxos 21xx device will automatically create "maxfailedlogins 0", so must be provided by the user as well.

    Example of creating a "local-user":

    ```
    admin@ncs(config-config)# security
    admin@ncs(config-security)#   local-user user1
    admin@ncs(config-local-user-user1)#   role read-only
    admin@ncs(config-local-user-user1)#   account-status  active
    admin@ncs(config-local-user-user1)#   email           ""
    admin@ncs(config-local-user-user1)#   firstname       ""
    admin@ncs(config-local-user-user1)#   lastname        ""
    admin@ncs(config-local-user-user1)#   phone           +401234
    admin@ncs(config-local-user-user1)#   password        Test1234
    admin@ncs(config-local-user-user1)#   maxfailedlogins 0
    admin@ncs(config-local-user-user1)#   sshkey          none
    admin@ncs(config-local-user-user1)#  exit
       admin@ncs(config-security)# exit

       admin@ncs(config-local-user-user1)# commit dry-run outformat native 
             native {
                 device {
                     name fxos-dev
                     data scope security
                           enter local-user user1
                            enter role read-only
                            set account-status active
                            set email ""
                            set firstname ""
                            set lastname ""
                            set phone +401234
                            set password Test1234
                            set maxfailedlogins 0
                            set sshkey none
                           exit
                          exit
                 }
             }
       admin@ncs(config-local-user-user1)# commit
       Commit complete.
       admin@ncs(config-local-user-user1)# compare-config
       admin@ncs(config-local-user-user1)# 
    ```

2. password-profile  
    "change-interval" and "no-change-interval" cannot be both disabled at the same time.

3. fault policy/clear-interval never  
    When "never" value is set for "clear-interval", the fxos device will automatically add one *0*
    for days, hours, minutes and seconds.  
    Hence, "set clear-interval never" will be translated on the device "set clear-interval never 0 0 0 0".  
    The user must provide all zero values and NED will filter them out.



# 13. How to configure additional config warning exceptions
-----------------------------------------------------------

In some situations, when configuring a particular command, the NED will treat
the replies coming after, as an error if they are not part of known replies:

 ```
 "Warning: Changing lacp policy may flap the port-channel",
 "Warning: Port ",
 "Warning: Please accept the End User License Agreement",
 "Warning: Application image not found. Please upload the application csp file",
 "Warning: Applications deployed on the Logical Device",
 "Warning: The license",
 "Use commit-buffer command to commit the changes",
 "Warning: "
 ```

If one of the above reply is received by the NED, the command is considered correct,
because it maches the known replies.
If more similar replies are encountered, the NED list of known harmless replies must be updated.  
However, the user can get the same result by configuring "cisco-fxos write config-warning" ned-setting.

The 'config-warning' list key is a regular expression with a warning that should be ignored.

For example, if we receive a reply, which is splitted on more than 1 row and it doesn't match the known
replies list from above, we can ignore it as below.

User can add a new warning that should be ignored, instead of throwing an error.  
Example:
 - when enabling "cc-mode" on the device, it returns a reply on 2 rows with the following content:  
 `device-prompt # enable cc-mode`

Reply from device:  
*Warning: Connectivity to one or more services may be denied when committed. Please consult the product's CC Security Policy documentation.  
WARNING: A reboot of the system is required in order for the system to be operating in a CC approved mode.*

This reply will lead to a NED error, since is not part of the known replies and it splitted on more than 1 row.

To avoid this, the user must add a new warning in the 'config-warning' list as below:
 ```
 admin@ncs(config)# devices global-settings ned-settings cisco-fxos
 write config-warning WARNING: A reboot of the system is required in order for the system.*
 admin@ncs(config)# commit
 Commit complete.
 admin@ncs(config)# devices disconnect
 admin@ncs(config)# devices connect
 result true
 ```

Notes:
 - in order for the warning exception to take effect, the ned-settings must be read again, using
   "disconnect" and "connect" commands.
    ```
    admin@ncs(config)# devices disconnect
    admin@ncs(config)# devices connect
    result true
    ```
 - the warning from the example above is already handled in NED and there is no need to be added
   under the "cisco-fxos write config-warning" section.
