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
  11. object-group dependency problems
  12. When connecting through a proxy using SSH or TELNET
  13. When connecting to a terminal server
  14. NED Secrets - Securing your Secrets
  ```


# 1. General
------------

  This document describes the cisco-asa NED.

  The NED connects to the device CLI using either SSH or Telnet.
  Support for accessing device via a proxy is also available.

  Configuration is done by sending native CLI commands to the
  device through the communication channel. If a single command
  fails, the whole transaction is aborted and reverted.

  WARNING:

  In order for the NED to work pager must be disabled and the terminal
  width must be configured directly on the device (using TELNET/SSH
  login) to maximum width:
  dev-1(config)# pager lines 0
  dev-1(config)# terminal width 511
  dev-1(config)# write memory

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
  | netsim                    | yes       | Doesn't emulate a specific device, just using the model 'best-   |
  |                           |           | effort'                                                          |
  |                           |           |                                                                  |
  | check-sync                | yes       | Six check-sync strategies accepted, see ned-setting 'read        |
  |                           |           | transaction-id-method'                                           |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | Will do a full show running-configuration towards device, and    |
  |                           |           | filter the contents before sending to NSO                        |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Commands supported as live-status actions:                       |
  |                           |           | show|clear|license|any                                           |
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
  | ASA 1000V                 | 8.7(1)14        | asa    |                                                   |
  |                           |                 |        |                                                   |
  | ASA5545                   | 9.8(2)(context) | asa    |                                                   |
  |                           |                 |        |                                                   |
  | ASAv                      | 9.4(1)241       | asa    |                                                   |
  |                           |                 |        |                                                   |
  | ASAv                      | 9.6(2)          | asa    |                                                   |
  |                           |                 |        |                                                   |
  | ASAv                      | 9.12(4)         | asa    |                                                   |
  |                           |                 |        |                                                   |
  | ASAv                      | 9.15(1)         | asa    |                                                   |
  |                           |                 |        |                                                   |
  | ASAv                      | 9.18(1)         | asa    |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-asa-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-asa-1.0.1.signed.bin
      > ./ncs-6.0-cisco-asa-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-asa-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-asa-1.0.1.tar.gz
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
     `cisco-asa-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-asa-1.0.1.tar.gz
     > ls -d */
     cisco-asa-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-asa-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-asa-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-asa-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-asa-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/cisco-asa-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-asa-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-asa-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-asa-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-asa-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-asa-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id cisco-asa-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-cisco-asa-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-asa logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-asa logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.asa \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-asa logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-asa logger java true
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

     For instance, change the device hostname:

     admin@ncs(config)# devices device dev-1 config
     admin@ncs(config-config)# hostname mynewhostname

     See what you are about to commit:

     admin@ncs(config-config)# commit dry-run outformat native
     device dev-1-1
       hostname mynewhostname

     Commit new configuration in a transaction:

     admin@ncs(config-config)# commit
     Commit complete.

     Verify that NCS is in-sync with the device:

      admin@ncs(config-config)# devices device dev-1 check-sync
      result in-sync

     Compare configuration between device and NCS:

      admin@ncs(config-config)# devices device dev-1 compare-config
      admin@ncs(config-config)#

     Note: If no diff is shown, supported config is the same in
           NCS as on the device.


# 5. Built in live-status actions
---------------------------------

     The NED has support for all exec commands in config mode. They can
     be accessed using the 'exec' prefix. For example:

      admin@ncs(config)# devices device dev-1 config exec "clear config int Ethernet0/6"
      result
      dev-1(config)#
      admin@ncs(config)#

     The NED also has support for all operational Cisco ASA commands
     by use of the 'devices device live-status exec any' action.
     For example:

     admin@ncs# devices device dev-1 live-status exec any "show run int Ethernet0/6"
     result
     !
     interface Ethernet0/6
      shutdown
     dev-1#
     admin@ncs#

     To execute multiple commands, separate them with " ; "
     NOTE: Must be a white space on either side of the comma.
     For example:

     admin@ncs# devices device dev-1 live-status exec any "show run int Ethernet0/5 ; show run int Ethernet0/6"
     result
     > show run int Ethernet0/5
     !
     interface Ethernet0/5
     dev-1#
     > show run int Ethernet0/6
     !
     interface Ethernet0/6
      shutdown
     dev-1#
     admin@ncs#

     For multi-mode devices you can also specify the context which to
     run the command in, for example to run the command in FOO context:

     admin@ncs# devices device asa5545-adm live-status exec any context FOO "show run int int1"
     result
     !
     interface int1
      nameif inside
      security-level 100
      ip address 172.29.64.228 255.255.255.0
     asa5545-adm/FOO#
     admin@ncs#

     Another input leaf worth knowing about is the input-string, which
     can be used to pass config to when device prompts for a TEXT
     string, e.g.:

     asa5545-adm/FOO(config)# crypto ca import MyEntry pkcs12 cisco123
     Enter the base 64 encoded pkcs12.
     End with the word "quit" on a line by itself:

     In the above case input-string should be set to the certificate,
     with \r\n signifying a newline.

     Furthermore, the command output parsing halts when the NED detects
     an operational or config prompt, however sometimes the command
     requests additional input, 'answer(s)' to questions.

     To respond to device question(s) there are 3 different methods,
     checked in the listed order below:

     [1] the action auto-prompts list, passed in the action
     [2] the ned-settings cisco-asa live-status auto-prompts list
     [3] the command line args "| prompts" option

     IMPORTANT: [3] can be used to override an answer in auto-prompts.

     Read on for details on each method:

     [1] action auto-prompts list

     The auto-prompts list is used to pass answers to questions, to
     exit parsing, reset timeout or ignore output which triggered the
     the built-in question handling. Each list entry contains a question
     (regex format) and an optional answer (text or built-in keyword).

     The following built-in answers are supported:

     <exit>     Halt parsing and return output
     <prompt>   Retrieve the answer from "| prompts" argument(s)
     <timeout>  Reset the read timeout, useful for slow commands
     <ignore>   (or IGNORE) Ignore the output and continue parsing
     <enter>    (or ENTER) Send a newline and continue parsing

     Any other answer value is sent to the device followed by a newline,
     unless the answer is a single letter answer in case which only the
     single character is sent.

     Note: not configuring an answer is the same as setting it to <ignore>

     Here is an example of a command which needs to ignore some output
     which would normally be interpreted as a question due to the colon:

     exec auto-prompts { question "Certificate Request follows[:]" answer
           "<ignore>" } "crypto pki enroll LENNART-TP | prompts yes no"

     Also note the use of method 3, answering yes and no to the remaining
     device questions.


     [2] ned-settings cisco-asa live-status auto-prompts list

     The auto-prompts list works exactly as [1] except that it is
     configured and used for all device commands, i.e. not only for
     this specific action.

     Here are some examples of auto-prompts ned-settings:

     devices device dev-1 ned-settings cisco-asa live-status auto-prompts \
          caimport1 question " Do you really want to replace them\\? \\[yes/no\\]:" answer yes
     devices device dev-1 ned-settings cisco-asa live-status auto-prompts \
          caimport2 question " the hierarchy\\? \\[yes/no\\]:" answer yes

     NOTE: Due to backwards compatibility, ned-setting auto-prompts
     questions get ".*" appended to their regex unless ending with
     "$". However, for option [1] the auto-prompt list passed in the
     action, you must add ".*" yourself if this matching behaviour is
     desired.


     [3] "| prompts"

     "| prompts" is passed in the command args string and is used to
     submit answer(s) to the device without a matching question pattern.
     IMPORTANT: It can also be used to override answer(s) configured in
     auto-prompts list, unless the auto-prompts contains <exit> or
     <timeout>, which are always handled first.

     One or more answers can be submitted following this syntax:

         | prompts <answer 1> .. [answer N]

     For example:

     devices device dev-1 live-status exec any "reload | prompts no yes"

     The following output of the device triggers the NED to look for the
     answer in | prompts arguments:

        "\\S+:\\s*$"
        "\\S+\\][\\?]?\\s*$"

     In other words, the above two patterns (questions) have a built-in
     <prompt> for an answer.

     Additional patterns triggering | prompts may be configured by use
     of auto-lists and setting the answer to <prompt>. This will force
     the user to specify the answer in | prompts.

     The <ignore> or IGNORE keywords can be used to ignore device output
     matching the above and continue parsing. If all output should be
     ignored, i.e. for a show command, '| noprompts' should be used.

     Some final notes on the 'answer' leaf:

     - "ENTER" or <enter> means a carriage return + line feed is sent.

     - "IGNORE", "<ignore>" or unset means the prompt was not a
        question, the device output is ignored and parsing continues.

     - A single letter answer is sent without carriage return + line,
       i.e. "N" will be sent as N only, with no return. If you want a
       return, set "NO" as the answer instead.


# 6. Built in live-status show
------------------------------

  The ASA NED supports a limited set of live-status 'show' TTL-based commands. Here is a list of supported elements:

  ```
  admin@ncs# show devices device asav-1 live-status ?
  Possible completions:
    interfaces-state
    inventory          show inventory
    ssl                show ssl mib (partial)
    version            show version
    vpn-sessiondb      show vpn-sessiondb anyconnect

  ```

  Example of a live-status call:

  ```
  admin@ncs# show devices device asav-1 live-status version
  live-status version name asa
  live-status version version 9.6(2)
  live-status version model ASAv
  live-status version serial-number 9A9D8CS82CD
  admin@ncs#

  ```


# 7. Limitations
----------------

  The NED can not configure a device which has pager enabled or terminal width set to low.

  Hence, in order for the NED to work pager must be disabled and the terminal width must be
  pre-configured directly on the device (using TELNET/SSH login) to maximum width:

  dev-1(config)# pager lines 0
  dev-1(config)# terminal width 511
  dev-1(config)# write memory


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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-asa logging level debug
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

     Please always also show the change in CLI format before commit:

      admin@ncs(config)# commit dry-run outformat native

     In addition to this, it helps if you can show how it should work
     by manually logging into the device using SSH/TELNET and type
     the relevant commands showing a successful operation.

     If the commit succeeds but the problem is a compare-config or
     out of sync issue, then end with a 2nd compare-config:

      admin@ncs(config)# devices device dev-1 compare-config

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
  > devices device dev-1 ned-settings cisco-asa logger level debug
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

# 11. object-group dependency problems
-------------------------------------

    When committing object-groups the device may throw ERROR Exceptions due
    to dependency issues with other object-groups or access-lists, e.g.

    - Removing obj from object-group not allowed;
      object-group (<name>),  being used in access-list or threat-detection or NAT, would become empty

    - Adding obj (group-object <name>) to grp (<name2>) failed; cause a loop in grp hierarchy

    - Removing object-group (<name>) not allowed, it is being used

    - object-group (<name>) is empty. Cannot add an empty group-object to object-group

    These problems can all be solved by enabling 'forward-reference enable' on the device.
    If this config is not desired on the device it can be temporarily injected by enabling
    the 'auto inject-forward-reference-enable' ned-setting.

    Finally, if 'forward-reference enable' is not supported on the device you must
    either upgrade the ASA OS on the device or solve the dependency issue(s) yourself in
    two transactions.

    Or in other words, the NED has a known LIMITATION in not being able to solve
    these object-group dependencies; hence 'forward-reference enable' must be used.


# 12. When connecting through a proxy using SSH or TELNET
---------------------------------------------------------

  When connecting through a proxy using SSH or TELNET you must use a
  set of ned-settings, all residing under 'cisco-asa proxy'.

  Do as follows to setup to connect to a ASA device that resides
  behind a proxy or terminal server:

   +-----+  A   +-------+   B  +-----+
   | NCS | <--> | proxy | <--> | ASA |
   +-----+      +-------+      +-----+

  Setup connection (A):

   # devices device cisco0 address <proxy address>
   # devices device cisco0 port <proxy port>
   # devices device cisco0 device-type cli protocol <proxy proto - telnet or ssh>
   # devices authgroups group ciscogroup umap admin remote-name <proxy username>
   # devices authgroups group ciscogroup umap admin remote-password <proxy password>
   # devices device cisco0 authgroup ciscogroup

  Setup connection (B):

  Define the type of connection to the device:

   # devices device cisco0 ned-settings cisco-asa proxy remote-connection <ssh|telnet>

  Define login credentials for the device:

   # devices device cisco0 ned-settings cisco-asa proxy remote-name <user name on the ASA device>
   # devices device cisco0 ned-settings cisco-asa proxy remote-password <password on the ASA device>

  (note: instead of configuring remote-name|password 'proxy authgroup' can be configured)

  [optional] Define prompt on proxy server before sending (not required for ASA proxy):

   # devices device cisco0 ned-settings cisco-asa proxy proxy-prompt <prompt pattern on proxy>

  Define pattern on proxy server after sending telnet/ssh, but before second login:

   # devices device cisco0 ned-settings cisco-asa proxy proxy-prompt2 <prompt pattern on proxy>

  Define address and port of ASA device:

   # devices device cisco0 ned-settings cisco-asa proxy remote-address <address to the ASA device>
   # devices device cisco0 ned-settings cisco-asa proxy remote-port <port used on the ASA device>

  [optional] Modify/extend the default connection command syntax from its default:

   # devices device cisco0 ned-settings cisco-asa proxy remote-command "telnet $address $port /vrf Mgmt-intf"

  Commit configuration and make sure the ned-settings are re-read:

   # commit
   # devices disconnect


# 13. When connecting to a terminal server
------------------------------------------

  Use cisco-asa proxy remote-connection serial when you are
  connecting to a terminal server. The setting triggers sending of
  extra new-lines to activate the login sequence.

  You also have the option of configuring a menu regexp and answer to
  be able to bypass menu selections.

  You may also need to specify remote-name and remote-password if the
  device has a separate set of login credentials.

  Finally, you may also need to set the cisco-asa connection
  prompt-timeout ned-setting (in milliseconds) to trigger sending of
  more newlines if the login process requires it. The NED will send
  onenewline per timeout until connect-timeout is reached and the the
  login fails.

  Example config for terminal server with 2nd login but no menu:

  devices authgroups group term-dev default-map remote-name 1st-username remote-password 1st-password remote-secondary-password cisco
  devices device term-dev address 1.2.3.4 port 1234
  devices device term-dev authgroup term-dev device-type cli ned-id cisco-asa protocol telnet
  devices device term-dev connect-timeout 30 read-timeout 600 write-timeout 600
  devices device term-dev state admin-state unlocked
  devices device term-dev ned-settings cisco-asa proxy remote-connection serial
  devices device term-dev ned-settings cisco-asa proxy remote-name 2nd-username
  devices device term-dev ned-settings cisco-asa proxy remote-password 2nd-password
  devices device term-dev ned-settings cisco-asa connection prompt-timeout 4000

  Example config for terminal server with menu but no 2nd login:

  devices authgroups group term-dev default-map remote-name 1st-username remote-password 1st-password remote-secondary-password cisco
  devices device term-dev address 1.2.3.4 port 22
  devices device term-dev authgroup term-dev device-type cli ned-id cisco-asa protocol ssh
  devices device term-dev connect-timeout 30 read-timeout 600 write-timeout 600
  devices device term-dev state admin-state unlocked
  devices device term-dev ned-settings cisco-asa proxy remote-connection serial
  devices device term-dev ned-settings cisco-asa connection prompt-timeout 4000
  devices device term-dev ned-settings cisco-asa proxy menu regexp "\\AChoose your option" answer "e\n"
    or a second example:
  devices device term-dev ned-settings cisco-asa proxy menu regexp "\\ASelection:" answer "x\n"


# 14. NED Secrets - Securing your Secrets
-----------------------------------------

    --- Auto-encrypting passwords in NSO

    To avoid having to pre-encrypt your passwords you can rebuild your NED in your OS
    command shell specifying an encrypted type for secrets using a command like:

    yourhost:~/cisco-asa-cli-x.y$ NEDCOM_SECRET_TYPE="tailf:aes-cfb-128-encrypted-string" make -C src/ clean all

    Or by adding the line `NEDCOM_SECRET_TYPE=tailf:aes-cfb-128-encrypted-string`
    in top of the `Makefile` located in <cisco-ios-cli-x.y>/src directory.

    Doing this means that even if the input to a passwordis a plaintext string, NSO will always
    encrypt it, and you will never see plain text secrets in the device tree.
