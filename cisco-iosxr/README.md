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
  11. When connecting through a proxy using SSH or TELNET
  12. Example of how to configure an 'EXEC PROXY'
  13. Configure route-policy in NSO
  14. Compilation options
  15. Special handling of platform model/version (and serial) in NETSIM
  16. NED Secrets - Securing your Secrets
  ```


# 1. General
------------

  This document describes the cisco-iosxr NED.

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
  | check-sync                | yes       | Two check-sync strategies accepted (config-hash and commit-      |
  |                           |           | list), see ned-setting read transaction-id-method                |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | Will do a full show running-configuration towards device, and    |
  |                           |           | filter the contents before sending to NSO                        |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Commands supported as live-status actions:                       |
  |                           |           | show|copy|reload|crypto|clear|any|any-hidden                     |
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
  | proxy-connection          | yes       | Supports 2 proxy jumps as well as direct forwarding (i.e. no     |
  |                           |           | interaction with proxy)                                          |
  |                           |           |                                                                  |
  | NSO ned secret type       | yes       | See ned-settings cleartext-provisioning and cleartext-stored-    |
  |                           |           | encrypted for info                                               |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | ASR9K                     | 6.1.3           | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | ASR9K                     | 6.5.2           | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | ASR9K                     | 7.7.1           | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | NCS-5500                  | 6.5.3           | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | NCS-5500                  | 7.9.2           | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | NCS-560                   | 7.6.2           | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | IOS XRv                   | 5.1.1.50U       | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | IOS XRv                   | 5.3.0           | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | IOS-XRv 9000              | 7.0.2           | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | IOS-XRv 9000              | 7.4.1           | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | IOS-XRv 9000              | 7.6.1           | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | IOS-XRv 9000              | 7.8.1           | ios-xr |                                                   |
  |                           |                 |        |                                                   |
  | IOS-XRv 9000              | 7.9.1           | ios-xr |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-iosxr-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-iosxr-1.0.1.signed.bin
      > ./ncs-6.0-cisco-iosxr-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-iosxr-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-iosxr-1.0.1.tar.gz
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
     `cisco-iosxr-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-iosxr-1.0.1.tar.gz
     > ls -d */
     cisco-iosxr-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-iosxr-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-iosxr-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-iosxr-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-iosxr-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/cisco-iosxr-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-iosxr-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-iosxr-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-iosxr-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-iosxr-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-iosxr-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id cisco-iosxr-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-cisco-iosxr-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-iosxr logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-iosxr logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.iosxr \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-iosxr logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-iosxr logger java true
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

     For instance, create a second Loopback interface that is down:

     admin@ncs(config)# devices device xrdev config
     admin@ncs(config-config)# interface Loopback 1
     admin@ncs(config-if)# ip address 128.0.0.1 255.0.0.0
     admin@ncs(config-if)# shutdown

     See what you are about to commit:

     admin@ncs(config-if)# commit dry-run outformat native
     device xrdev
       interface Loopback1
        ip address 128.0.0.1 255.0.0.0
        shutdown
       exit

     Commit new configuration in a transaction:

     admin@ncs(config-if)# commit
     Commit complete.

     Verify that NCS is in-sync with the device:

      admin@ncs(config-if)# devices device xrdev check-sync
      result in-sync

     Compare configuration between device and NCS:

      admin@ncs(config-if)# devices device xrdev compare-config
      admin@ncs(config-if)#

     Note: if no diff is shown, supported config is the same in
           NCS as on the device.


# 5. Built in live-status actions
---------------------------------

     The NED has support for all exec commands in config mode. They can
     be accessed using the 'exec' prefix. For example:

      admin@ncs(config)# devices device asr9k-2 config exec "default int TenGigE0/0/0/9"
      result
      RP/0/RSP0/CPU0:asr9k-2(config)#
      admin@ncs(config)#

     The NED also has support for all operational Cisco IOS XR commands
     by use of the 'devices device live-status exec any' action. Or,
     if you do not want to log|trace the command, use the any-hidden.

     For example:

     admin@ncs# devices device asr9k-2 live-status exec any "show run int TenGigE0/0/0/9"
     result
     Thu Sep  6 09:13:34.638 UTC
     interface TenGigE0/0/0/9
      shutdown
     !
     RP/0/RSP0/CPU0:asr9k-2#
     admin@ncs#

     To execute multiple commands, separate them with " ; "
     NOTE: Must be a white space on either side of the comma.
     For example:

     admin@ncs# devices device asr9k-2 live-status exec any "show run int TenGigE0/0/0/8 ; show run int TenGigE0/0/0/9"
     result
     > show run int TenGigE0/0/0/8
     Thu Sep  6 09:20:16.919 UTC
     interface TenGigE0/0/0/8
      shutdown
     !

     RP/0/RSP0/CPU0:asr9k-2#
     > show run int TenGigE0/0/0/9
     Thu Sep  6 09:20:17.311 UTC
     interface TenGigE0/0/0/9
      shutdown
     !

     RP/0/RSP0/CPU0:asr9k-2#
     admin@ncs#

     NOTE: To Send CTRL-C send "CTRL-C" or "CTRL-C async" to avoid
           waiting for device output. Also note that you most likely
           will have to extend timeouts to avoid closing the current
           connection and send CTRL-C to a new connection, i.e. CTRL-C
           being ignored

     Generally the command output parsing halts when the NED detects
     an operational or config prompt, however sometimes the command
     requests additional input, 'answer(s)' to questions.

     To respond to device question(s) there are 3 different methods,
     checked in the listed order below:

     [1] the action auto-prompts list, passed in the action
     [2] the ned-settings cisco-iosxr live-status auto-prompts list
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


     [2] ned-settings cisco-iosxr live-status auto-prompts list

     The auto-prompts list works exactly as [1] except that it is
     configured and used for all device commands, i.e. not only for
     this specific action.

     Here are some examples of auto-prompts ned-settings:

     devices global-settings ned-settings cisco-iosxr live-status auto-prompts Q1 question "System configuration has been modified" answer "no"
     devices global-settings ned-settings cisco-iosxr live-status auto-prompts Q2 question "Do you really want to remove these keys" answer "yes"
     devices global-settings ned-settings cisco-iosxr live-status auto-prompts Q3 question "Press RETURN to continue" answer ENTER

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

     devices device asr9k-2 live-status exec any "reload | prompts no yes"

     The following output of the device triggers the NED to look for the
     answer in | prompts arguments:

         ":\\s*$"
         "\\][\\?]?\\s*$"

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

  The cisco-iosxr NED supports the following live-status 'show' TTL-based commands:

  ```
  admin@ncs# show devices device asr9k-4 live-status
  Possible completions:
    cdp                show cdp
    controllers        Interface controller status and configuration
    interfaces-state
    inventory          show inventory
    lldp               show lldp

  ```

  Example of a live-status call:

  ```
  admin@ncs# show devices device asr9k-4 live-status inventory
  NAME       DESCR                                   PID              VID  SN
  --------------------------------------------------------------------------------------
  0/0        ASR 9903 1600G Fixed Linecard           ASR-9903-LC      V03  FOC2613NS0E
  0/FT0      ASR 9903 Fan Tray                       ASR-9903-FAN     V01  DCH253800LE
  0/FT1      ASR 9903 Fan Tray                       ASR-9903-FAN     V01  DCH253800LD
  0/FT2      ASR 9903 Fan Tray                       ASR-9903-FAN     V01  DCH253800LH
  0/FT3      ASR 9903 Fan Tray                       ASR-9903-FAN     V01  DCH253800LF
  0/PT0      Simulated Power Tray IDPROM             ASR-9900-AC-PEM  V03  FOT1981P81A
  0/PT0-PM0  1.6kW-AC Power Module                   PWR-1.6KW-AC     V01  POG2551D3AJ
  0/PT0-PM1  1.6kW-AC Power Module                   PWR-1.6KW-AC     V01  POG2551D38A
  0/PT0-PM2  1.6kW-AC Power Module                   PWR-1.6KW-AC     V01  POG2551D3AH
  0/PT0-PM3  1.6kW-AC Power Module                   PWR-1.6KW-AC     V01  POG2551D387
  0/RP0      ASR 9900 Fixed Chassis Route Processor  A99-RP-F         V02  FOC2618N0WW
  Rack 0     ASR 9903 Chassis                        ASR-9903         V03  FOC2615P3DP

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-iosxr logging level debug
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
  > devices device dev-1 ned-settings cisco-iosxr logger level debug
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

# 11. When connecting through a proxy using SSH or TELNET
--------------------------------------------------------

   Do as follows to setup to connect to a IOS XR device that resides
   behind a proxy or terminal server:

   +-----+  A   +-------+   B  +-----+
   | NCS | <--> | proxy | <--> | IOS |
   +-----+      +-------+      +-----+

   Setup connection (A):

   # devices device dev-1 address <proxy address>
   # devices device dev-1 port <proxy port>
   # devices device dev-1 device-type cli protocol <proxy proto - telnet or ssh>
   # devices authgroups group ciscogroup umap admin remote-name <proxy username>
   # devices authgroups group ciscogroup umap admin remote-password <proxy password>
   # devices device dev-1 authgroup ciscogroup

   Setup connection (B):

   Define the type of connection to the device:

   # devices device dev-1 ned-settings cisco-iosxr proxy remote-connection <ssh|telnet>

   Define login credentials for the device:

   # devices device dev-1 ned-settings cisco-iosxr proxy remote-name <user name on the XR device>
   # devices device dev-1 ned-settings cisco-iosxr proxy remote-password <password on the XR device>

   Define prompt on proxy server:

   # devices device dev-1 ned-settings cisco-iosxr proxy proxy-prompt <prompt pattern on proxy>

   Define address and port of XR device:

   # devices device dev-1 ned-settings cisco-iosxr proxy remote-address <address to the XR device>
   # devices device dev-1 ned-settings cisco-iosxr proxy remote-port <port used on the XR device>
   # commit

   Complete example config:

   devices authgroups group jump-server default-map remote-name MYUSERNAME remote-password MYPASSWORD
   devices device dev-1 address 1.2.3.4 port 22
   devices device dev-1 authgroup jump-server device-type cli ned-id cisco-ios-xr protocol ssh
   devices device dev-1 connect-timeout 60 read-timeout 120 write-timeout 120
   devices device dev-1 state admin-state unlocked
   devices device dev-1 ned-settings cisco-iosxr proxy remote-connection telnet
   devices device dev-1 ned-settings cisco-iosxr proxy proxy-prompt ".*#"
   devices device dev-1 ned-settings cisco-iosxr proxy remote-address 5.6.7.8
   devices device dev-1 ned-settings cisco-iosxr proxy remote-port 23
   devices device dev-1 ned-settings cisco-iosxr proxy remote-name cisco
   devices device dev-1 ned-settings cisco-iosxr proxy remote-password cisco


# 12. Example of how to configure an 'EXEC PROXY'
-------------------------------------------------

   Here is an example of how to configure a device which is accessed
   through a local terminal server on port 2023:

   devices authgroups group cisco default-map remote-name cisco remote-password cisco
   devices device terminal address localhost port 2023
   devices device terminal authgroup cisco device-type cli ned-id cisco-ios-xr protocol telnet
   devices device terminal connect-timeout 60 read-timeout 120 write-timeout 120
   devices device terminal state admin-state unlocked

   Here is the actual connect to the device, using 'connect' command:

   devices device terminal ned-settings cisco-iosxr proxy remote-connection exec
   devices device terminal ned-settings cisco-iosxr proxy remote-command "connect 192.168.0.225"
   devices device terminal ned-settings cisco-iosxr proxy remote-prompt "Open"
   devices device terminal ned-settings cisco-iosxr proxy remote-name cisco
   devices device terminal ned-settings cisco-iosxr proxy remote-password cisco


# 13. Configure route-policy in NSO
-----------------------------------

   There has been a number of questions/tickets on route-policy in
   cisco-iosxr NED, hence the the need of this section in README.

   route-policy configuration in NSO looks different from how it is
   configured on the device. NSO uses a single string 'value' for all
   the route-policy lines. The reason for this is that there may be
   multiple identical lines in the route-policy and this was not
   possible to model in YANG.

   The best way to learn how to configure a route-policy in NSO is to
   first configure it on the device, then perform a sync-from in NSO
   and watch how it looks. For example:

   Step 1: Configure route-policy on device

   RP/0/RSP0/CPU0:asr9k-1(config)#route-policy no-redes-tiws-ipv6
   RP/0/RSP0/CPU0:asr9k-1(config-rpl)# # description Redes asignables
   RP/0/RSP0/CPU0:asr9k-1(config-rpl)# if destination in sti-redes-asignables-ipv6 then
   RP/0/RSP0/CPU0:asr9k-1(config-rpl-if)# pass
   RP/0/RSP0/CPU0:asr9k-1(config-rpl-if)# # description Redes de tiws
   RP/0/RSP0/CPU0:asr9k-1(config-rpl-if)# elseif destination in sti-redes-tiws-ipv6 then
   RP/0/RSP0/CPU0:asr9k-1(config-rpl-elseif)# drop
   RP/0/RSP0/CPU0:asr9k-1(config-rpl-elseif)# endif
   RP/0/RSP0/CPU0:asr9k-1(config-rpl)#end-policy
   RP/0/RSP0/CPU0:asr9k-1(config)#commit

   Step 2: Sync-from to NSO and show how it looks:

   admin@ncs# devices device asr9k-1 sync-from
   result true

   admin@ncs# show running-config devices device asr9k-1 config route-policy no-redes-tiws-ipv6
   devices device asr9k-1
    config
     route-policy no-redes-tiws-ipv6
       "  # description Redes asignables\r\n  if destination in sti-redes-asignables-ipv6 then\r\n    pass\r\n    # description Redes de tiws\r\n  elseif destination in sti-redes-tiws-ipv6 then\r\n    drop\r\n  endif\r\n"
      end-policy
     !
    !
   !

   Step 3: Copy the route-policy to your template|config file:

   Copy the route-policy to your template|config file, taking extra care
   to not modify the white spacing (space, \r and \n in CLI) because if
   you do modify it, you will get a compare-config diff vs the device later.
   The reason for this is because the device dynamically modifies the white
   spacing after the commit. And if NSO does not set it exactly the same way,
   there will be a diff.

   Note, if you are using XML templates, you can see how it should look
   exactly by showing it in XML outformat

   admin@ncs# show running-config devices device asr9k-3 config route-policy | display xml

   <config xmlns="http://tail-f.com/ns/config/1.0">
    <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>asr9k-3</name>
        <config>
        <route-policy xmlns="http://tail-f.com/ned/cisco-ios-xr">
          <name>no-redes-tiws-ipv6</name>
          <value> # description Redes asignables&#13;
    if destination in sti-redes-asignables-ipv6 then&#13;
      pass&#13;
      # description Redes de tiws&#13;
    elseif destination in sti-redes-tiws-ipv6 then&#13;
      drop&#13;
    endif&#13;
   </value>
        </route-policy>
        </config>
    </device>
    </devices>
   </config>

   Note: &#13; is the XML code for "\r" and it must be included or diff!

   Step 4: Test your NSO config by deleting the route-policy on the device:

   RP/0/RSP0/CPU0:asr9k-1(config)#no route-policy no-redes-tiws-ipv6
   RP/0/RSP0/CPU0:asr9k-1(config)#commit

   Step 5: Test the NSO config by sync-to device, restoring route-policy:

   admin@ncs# config
   Entering configuration mode terminal
   admin@ncs(config)# devices device asr9k-1 sync-to dry-run
   data
      route-policy no-redes-tiws-ipv6
        # description Redes asignables
        if destination in sti-redes-asignables-ipv6 then
          pass
          # description Redes de tiws
        elseif destination in sti-redes-tiws-ipv6 then
          drop
        endif
       end-policy

   Note how NSO unpacks the single string to multiple lines, with the
   exact same whitespacing as the device had it. Now let's commit:

   admin@ncs(config)# devices device asr9k-1 sync-to
   result true
   admin@ncs(config)# devices device asr9k-1 compare-config
   admin@ncs(config)#

   CAUTION: The number one issue with this config is if white spacing
   inside the single route-policy string does not EXACTLY match that
   of the device. Hence please take careful note of how it looks and
   mimic it exactly. Again, best way to do this is to sync-from device
   and look how NSO formats it.


# 14. Compilation options
-----------------------------------

   To improve performance due to slow handling of large leaf-lists in
   interface/encapsulation/dot1q a make variable has been introduced
   to change nodes vlan-id and second-dot1q from leaf-list to leaf.

   To change node-type to leaf from leaf-list (i.e. to handle these
   ranges explicitly as a string) re-compile the NED package from the
   src directory in the package using the below command line:

   <build host>$ make ENCAP_DOT1Q_AS_LEAF=True clean all

   Switching to use type string in this config area also saves memory.


# 15. Special handling of platform model/version (and serial) in NETSIM
-----------------------------------------------------------------------

    If the script show_version.sh is modified to include the real output from a
    device, along with the token 'CUSTOMNETSIM' appended to the text the NED
    will extract model and version information as if it's running towards a real
    device. Sample content of show_version.sh to simulate an NCS-5500 with
    version 6.5.3:

    #!/bin/bash

    cat <<EOF
    Cisco IOS XR Software, Version 6.5.3
    Copyright (c) 2013-2019 by Cisco Systems, Inc.

    Build Information:
     Built By     : ahoang
     Built On     : Tue Mar 26 06:46:13 PDT 2019
     Built Host   : iox-ucs-027
     Workspace    : /auto/srcarchive13/prod/6.5.3/ncs5500/ws
     Version      : 6.5.3
     Location     : /opt/cisco/XR/packages/

    cisco NCS-5500 () processor
    System uptime is 1 year 3 weeks 2 days 16 hours 58 minutes
    CUSTOMNETSIM
    EOF

    NOTE: The token 'CUSTOMNETSIM' must be appended to the text to enable the
    NED to detect that it's running towards a netsim node.

    When using this feature, the NED also handles output of 'show diag' or
    'show inventory' commands (mounted in netsim) to extract serial number as if
    running towards a real device. See included sample files show_diag.sh and
    show_inventory.sh in netsim directory.


# 16. NED Secrets - Securing your Secrets
---------------------------------------------------

    It is best practice to avoid storing your secrets (e.g. passwords and
    shared keys) in plain-text, either on NSO or on the device. In NSO we
    support multiple encrypted datatypes that are encrypted using a local
    key, similarly many devices such as Cisco IOS XR supports automatically
    encrypting all passwords stored on the device.

    Naturally, for security reasons, NSO in general has no way of encrypting/
    decrypting passwords with the secret key on the device. This means that if
    nothing is done about this we will become out of sync once we write secrets
    to the device.

    In order to avoid becoming out of sync the NED reads back these elements
    immediately after set and stores the encrypted value(s) in a special
    `secrets` table in oper data. Later on, when config is read from the
    device, the NED replaces all cached encrypted values with their plaintext
    values; effectively avoiding all config diffs in this area. If the values
    are changed on the device, the new encrypted value will not match the
    cached pair and no replacement will take place. This is desired, since out
    of band changes should be detected.

    This handles the device-side encryption, but passwords are still unencrypted
    in NSO. To deal with this we support using NSO-encrypted strings instead of
    plaintext passwords in the NSO data model.

    --- Handling auto-encryption

    Let us say that we have password-encryption on and we want to write a new
    user to our device:

      admin@ncs(config)# devices device dev-1 config username newuser password 0 magic
      admin@ncs(config-config)# commit

    this will be automatically encrypted by the device

      RP/0/RP0/CPU0:xrv9000#show running-config username newuser
      Tue Mar 11 09:11:02.557 UTC
      username newuser
       password 7 03095A0C0F0C
       !

    But the secrets management will store this new encrypted value in our `secrets` table:

      admin@ncs# show devices device dev-1 ned-settings secrets
      ID                                                ENCRYPTED
      ------------------------------------------------------------------
      cisco-ios-xr:username(newuser)/password/password  7 03095A0C0F0C

      which means that compare-config or sync-from will not show any changes and
      will not result in any updates to CDB". In fact, we can still see the
      unencrypted value in the device tree:

       admin@ncs# show running-config devices device dev-1 config username newuser
       devices device dev-1
        config
          username newuser
           password 0 magic
          exit
        !
       !

    --- Increasing security with NSO-side encryption

    We have two alternatives, either we can manually encrypt our values using
    one of the NSO-encrypted types (e.g `aes-256-cfb-128-encrypted-string`) and
    set them to the tree, or we can recompile the NED to always encrypt secrets.

    --- Setting encrypted value

    Let us say we know that the NSO-encrypted string
    `$8$x0CA6MmKLevpJyBq7/aaSOmmKJPUeCpeojAUW0p29eI=` (`admin`), we can then set
     it in the device tree as normal:

      admin@ncs(config-un)# username newuser2 password 0 $8$x0CA6MmKLevpJyBq7/aaSOmmKJPUeCpeojAUW0p29eI=
      admin@ncs(config-un)# commit

    when commiting this value it will be decrypted and the plaintext will be written to the device.
    Unlike the previous example the plaintext is not visible in the device tree:

      admin@ncs# show running-config devices device dev-1 config username newuser2
      devices device dev-1
       config
         username newuser2
          password 0 $8$x0CA6MmKLevpJyBq7/aaSOmmKJPUeCpeojAUW0p29eI=
         exit
       !
      !

    On the device side this plaintext value is of course encrypted with the device key,
    and just as before we store it in our `secrets` table:

      admin@ncs# show devices device dev-1 ned-settings secrets
      ID                                                 ENCRYPTED
      -------------------------------------------------------------------
      cisco-ios-xr:username(newuser2)/password/password  7 06070B2C4540

    We can see that this corresponds to the value set on the device:

      RP/0/RP0/CPU0:xrv9000#show run username newuser2
      Tue Mar 11 09:37:35.578 UTC
      username newuser2
       password 7 06070B2C4540
      !

    Note that the device in turn encrypted "admin" to "7 06070B2C4540".

    --- Auto-encrypting passwords in NSO

    To avoid having to pre-encrypt your passwords you can rebuild your NED in your OS
    command shell specifying an encrypted type for secrets using a command like:

    yourhost:~/cisco-iosxr-cli-x.y$ NEDCOM_SECRET_TYPE="tailf:aes-cfb-128-encrypted-string" make -C src/ clean all

    Or by adding the line `NEDCOM_SECRET_TYPE=tailf:aes-cfb-128-encrypted-string`
    in top of the `Makefile` located in <cisco-ios-cli-x.y>/src directory.

    Doing this means that even if the input to a passwordis a plaintext string, NSO will always
    encrypt it, and you will never see plain text secrets in the device tree.

    If we reload our example with the new NED all of the secrets are now encrypted:


      admin@ncs# show running-config devices device dev-1 config username
      devices device dev-1
       config
        username admin
         group cisco-support
         group root-lr
         secret 5 $8$73YtdrHGlorNhhEbJml8L3+luGcACfKlahmjawK1wSzRVdY4QFhmBG6PVCp9H/LU
        exit
        username newuser
         password 7 $8$ffNdYrrCwxMMmf13YzdQvGh73+gv51g8D6m2LoDZPrc=
        exit
        username newuser2
         password 0 $8$x0CA6MmKLevpJyBq7/aaSOmmKJPUeCpeojAUW0p29eI=
        exit
       !
      !

    and if we create yet another user we get the desired result:

      admin@ncs(config-config)# username newuser3 password 0 MY-CLEAR-PW
      admin@ncs(config-un)# commit dry-run outformat native
      native {
          device {
              name dev-1
              data ! generated offline
                   username newuser3
                    password 0 $8$vXyD8pKUnMkbvz/afo9JbHxiNpfclmce4ZQ6ghZlvc4=
                   exit
          }
      }
      admin@ncs(config-un)# commit
      Commit complete.
      admin@ncs(config-config)# end
      admin@ncs# show running-config devices device dev-1 config username newuser3
      devices device dev-1
       config
        username newuser3
         password 0 $8$vXyD8pKUnMkbvz/afo9JbHxiNpfclmce4ZQ6ghZlvc4=
        exit
       !
      !
      admin@ncs# show devices device dev-1 ned-settings secrets
      ID                                                 ENCRYPTED
      -------------------------------------------------------------------------------
      cisco-ios-xr:username(newuser2)/password/password  7 06070B2C4540
      cisco-ios-xr:username(newuser3)/password/password  7 11242048343E2E2D36671B13
