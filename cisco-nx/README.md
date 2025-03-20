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
  12. Handling of varying device defaults for switchport and shutdown
  13. Detecting and/or ignoring warnings/errors from device during transactions
  14. Handling special config that can be considered 'dayzero'
  15. Handling error and warning messages from device
  16. Recompiling the NED to enable certain features
  ```


# 1. General
------------

  This document describes the cisco-nx NED.

  The NED supports two communication methods towards the device:

  - CLI
    The NED connects to the device CLI using either SSH or Telnet.
    Configuration is done by sending native CLI commands to the
    device through the communication channel.

  - NXAPI
    The NED connects the device using the Cisco Nexus NXAPI, which
    is a REST/XML interface. Configuration is done by sending a full
    sequence of CLI commands using NXAPI messages.

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
  | check-sync                | yes       | Several check-sync strategies acceped (config-hash, config-data, |
  |                           |           | device-command), see ned-setting trans-id-method                 |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | Will do a full show running-configuration towards device, and    |
  |                           |           | filter the contents before sending to NSO                        |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Commands suported as live-status exec:                           |
  |                           |           | show|copy|ping|traceroute|any|any-hidden                         |
  |                           |           |                                                                  |
  | live-status show          | yes       | See section 6 for info on what is modeled under live-status show |
  |                           |           |                                                                  |
  | load-native-config        | yes       | Can load native CLI commands through NSO. This includes          |
  |                           |           | deletions, see 'developer load-native-config' in README-ned-     |
  |                           |           | settings.md                                                      |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```
  Custom NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | proxy-connection          | yes       | Supports up to 2 proxy jumps as well as direct forwarding (i.e.  |
  |                           |           | no interaction with proxy)                                       |
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
  |                           | 5.2(1)SV3(1.2)  |        |                                                   |
  |                           |                 |        |                                                   |
  |                           | 5.0(3)N1(1b)    |        |                                                   |
  |                           |                 |        |                                                   |
  |                           | 7.3(0)D1(0.64)  |        |                                                   |
  |                           |                 |        |                                                   |
  |                           | 6.1(2)I3(3a)    |        |                                                   |
  |                           |                 |        |                                                   |
  |                           | 7.0(3)I1(2)     |        |                                                   |
  |                           |                 |        |                                                   |
  |                           | 7.0(3)I2(2c)    |        |                                                   |
  |                           |                 |        |                                                   |
  |                           | 9.x/10.x        |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-cisco-nx-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-cisco-nx-1.0.1.signed.bin
      > ./ncs-6.0-cisco-nx-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-cisco-nx-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-cisco-nx-1.0.1.tar.gz
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
     `cisco-nx-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-cisco-nx-1.0.1.tar.gz
     > ls -d */
     cisco-nx-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package cisco-nx-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package cisco-nx-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-cisco-nx-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package cisco-nx-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/cisco-nx-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-cisco-nx-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-nx-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install cisco-nx-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-cisco-nx-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-cisco-nx-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id cisco-nx-cli-1.0
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

  For a NXAPI connection configure method and port params:
    # devices device nxdev ned-settings cisco-nx connection method nxapi
    # devices device nxdev port <typically 80 or 443>

  For a NXAPI connection over HTTPS it is also necessary to configure SSL:

  SSL alternative 1:

    Accept any SSL certificate presented by the device. This is unsafe
    and should only be used for testing.

    In the NCS CLI:
    # devices device nxdev ned-settings cisco-nx connection ssl accept-any

  SSL alternative 2:

    Configure a specific SSL certificate for a device. The certificate
    shall be entered in DER Base64 format, which is the same as the
    PEM format but without the banners \"----- BEGIN CERTIFICATE-----\" etc.

    Use the Unix tool 'openssl' to fetch the PEM certificate from a device:

    In a Unix shell:
    > openssl s_client -connect <device address>:<port>

    In the NCS CLI:
    # devices device nxdev ned-settings cisco-nx connection ssl certificate <Base64 binary>

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

  `$NSO_RUNDIR/logs/ned-cisco-nx-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-nx logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings cisco-nx logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.nexus \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings cisco-nx logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings cisco-nx logger java true
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

     For instance, create a VLAN interface:
       # configure
       # devices device nxdev config
       # vlan 10
       # name TEST-VLAN
       # feature interface-vlan
       # interface Vlan10
       # no shutdown
       # ip address 1.2.3.4/24
       # commit

     Verify that NCS is in-sync with the device

     Alternative 1
       # check-sync

     Alternative 2
       # compare-config


# 5. Built in live-status actions
---------------------------------

  The NED both has some yang-modeled actions as well as the ability to run
  arbitrary CLI commands from either exec or config mode.

  The yang-modeled actions are: show, copy, ping, and traceroute. While these
  covers some basic needs, it would be impossible to yang-model all CLI commands
  in any useful way. This is why the 'any' action was introduced.

  Two modes of running CLI commands are implemented, both in device 'exec' mode,
  and in 'configure' mode.

  By convention, in exec-mode (i.e. live-status exec) command-lines are prepended
  with 'any'. For example:

   admin@ncs# devices device nx7k live-status exec any event manager run my_app

  To run a command in config mode on the other hand, the 'exec' keyword is
  prepended to the command-line to run (i.e. while in config mode in ncs_cli),
  like:

   admin@ncs(config)# devices device nx7k config exec default interface e3/1

  NOTE: This action is present in the config yang model as the action node
  /nx:EXEC/exec (where the EXEC in capital letters are 'hidden' in the ncs_cli
  when in cisco style mode).

  When commands run on device requests info from user, the NED defaults to just
  sending RETURN to choose a default value (if possible). Sometimes one needs to
  actually add specific answers (e.g. a password) to these prompts, this can be
  done by adding them as a list of comma-separated strings enclosed in
  square-brackets, for example:

   admin@ncs# devices device nx7k live-status exec any any ping [management, 1.2.3.4, 3, 100]

  This will send the strings enclosed in square-brackets as answers to the first
  four prompts from the device (i.e. management, 1.2.3.4 et.c.).

  NOTE: You can also add standard question/answers to use with the ned-setting
  auto-prompts described in README-ned-settings.md.

  You can send multiple commands by separating them with ';' (i.e. just like on
  device). For example, when running a 'config exec', to enter sub-modes, this
  needs to be done with separate commands delimited with ';' like this:

    admin@ncs(config-config)# exec "interface port-channel 17 ; description Foo  Bar ; switchport ; shutdown ; switchport mode trunk"

  To force each command to be sent separately to device (i.e. just like typing
  each command and entering it into console), use the ned-setting
  '/cisco-nx/connection/split-exec-any' (see below).

  The timeout while waiting for response from device is the 'write-timeout' set
  for the NED instance.

  There is a special keyword '_NOWAIT_' (i.e. the string NOWAIT 'enclosed' in
  underscores) which can be used as the last string in the answers array. This
  will cause the NED to not wait for a device response after the last answer has
  been sent (e.g. 'y' when doing reload). Also, the NED will ignore an end-of-file
  error from device if this keyword is used (e.g. if device 'hangs up' directly
  when a previous answer in the array was sent).

  Also, when '_NOWAIT_' is used, if device 'hangs' or is doing a long-running
  operation, and the NED timeouts while waiting for a response, it is not
  considered an error.

  NOTE: When '_NOWAIT_' is used, the session is closed before returning call,
  hence the NED instance will be disconnected afterwards to avoid the 'stale'
  instance being re-used.

   admin@ncs# devices device nx7k live-status exec any reload vdc [y, y, _NOWAIT_]


# 6. Built in live-status show
------------------------------

  Several CLI 'show commands' on the device are transformed to yang-modeled operational data under live-status.

  The CLI commands currently modeled are:

      show inventory

      show nve peers|vni|interface

      show mac address-table

      show system internal l2rib event-history mac

      show l2route evpn fl|imet|mac|mac-ip all

      show cdp neighbors

      show lldp neighbors

      show bgp event-history events

      show bgp internal evi

      show bgp l2vpn evpn [neighbors|summary]

      show vrf + show forwarding vrf <vrf> ipv4 route

      show interface ethernet|port-channel|vlan <interface-name>

      show ip route vrf all

      show vlan [counters]

      show vpc brief|role|peer-keepalive|consistency-parameters

      show port-channel summary

      show vtp status


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
     admin@ncs(config)# devices device dev-1 ned-settings cisco-nx logging level debug
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
  > devices device dev-1 ned-settings cisco-nx logger level debug
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
-----------------------------------------

Setting keys and passwords in cleartext (e.g. 'ntp authentication-key 1 md5
foobar 0') results in the device showing the encrypted value along with the
algorithm/type of the key in the running-config resulting in a diff between what
NSO stored and what is shown on device. To mitigate this, i.e. to be able to
provision cleartext keys and passwords from NSO, there is a ned-setting to
enable the NED to take care of this situation (i.e. storing the cleartext in
NSO).

To enable this feature enable the ned-setting cleartext-provisioning, like this:

   'devices device nx-1 ned-settings cisco-nx behaviours cleartext-provisioning enable'

When type-6 keys are enabled/disabled, the ned can handled 'encryption
re-encrypt obfuscated' and 'encryption decrypt type6' commands if run through
the 'exec any' feature. I.e. keys that have been set in cleartext before
encryption/decryption to/from type-6 will still be in-sync after operation
(NOTE: only when run through 'exec any' in ned, not if run directly on device).

By default all keys/passwords are stored in cleartext in CDB. To avoid this, the
ned-setting 'behaviours cleartext-stored-encrypted' can be enabled. When this
setting is enabled, all passwords/keys provisioned must be set encrypted using
the type 'tailf:aes-cfb-128-encrypted-string'. Note that the type in the
yang-model in the NED for these fields has not changed, it is NOT the encryped
type. Instead, this means that the value put INTO these fields must be encrypted
(e.g. by using a value from a leaf in a template where the yang type is
tailf:aes-cfb-128-encrypted-string).

Another feature to avoid storing cleartext passwords in CDB (i.e. keys and
passwords in the device model) is to recompile the NED and setting an alternate
yang-type to all nodes handled as "secret". This is done by recompiling, and
setting the compile variable NEDCOM_SECRET_TYPE to the desired type, like this:

  make NEDCOM_SECRET_TYPE="tailf:aes-cfb-128-encrypted-string" clean all

This will change the yang type of all leaf nodes containing keys/passwords
(check yang-model for type NEDCOM_SECRET_TYPE for all nodes that are
handled). When NED is recompiled like this, the values of these nodes can be set
with cleartext (i.e. as opposed to using the feature
'cleartext-stored-encrypted' described above).

NOTE: When cleartext-provisioning is enabled for an exisiting device
(i.e. already containing keys/passwords), the cleartext keys/passwords are NOT
available to the NED/NSO. If one wants to handle exising keys/passwords they
need to be re-commited to the device. Set all keys and passwords to same value
as it already has on device, but in cleartext, and commit to device. This will
not change anything on the device, but will capture the cleartext/encrypted
'mappings' in the NED so it can handle these values as cleartext values.

NOTE2: When cleartext-stored-encrypted is enabled the output of "dry-run native"
doesn't show decrypted values, it shows the "verbatim" encrypted values,
however, the decrypted values will be sent to device.


# 12. Handling of varying device defaults for switchport and shutdown
--------------------------------------------------------------------

The ned-settings found under 'system-interface-defaults' can be used to improve
handling of default values for switchport/shutdown of interfaces.

The problem (from an NSO perspective) with Ethernet and port-channel ports on
Nexus is that the default state can be set dynamically with the global settings
'system default switchport' and 'system default switchport shutdown. To that,
these global settings also have varying default setting on different devices
which further adds to the confusion how to handle these.

The ned-setting 'show-interface-all' is a bit of an ineffective way to discover
'hidden' default values for swichport/shutdown of ports. Also, the default
shutdown state of sub-interfaces will not be reflected correctly even when this
setting is used.

The new settings under 'system-interface-defaults' can be used to resolve this
problem by injecting the 'hidden' defaults before NSO sees the config, hence NSO
is made aware of these settings (this is necessary both for dynamic defaults,
and also config modeled as an empty leaf, which NSO can't handle).

The setting 'system-interface-defaults/handling is used to enable the use of
this feature. By default it is disabled.

The setting 'system-interface-defaults/handling' value 'auto' can be used with
CLI mode connect to device (i.e. currently not supported with NXAPI). This will
make the NED inspect the global settings on the device at connect, then use this
'knowledge' to pretend these defaults are not hidden by injecting them.

Some devices have a different default value for L3 physical ports (i.e. not same
as the system port default). This has been observed for switches which have the
system default set to L2 ports which are shutdown by default. In this case the
ned-setting 'system-interface-defaults/default-l3-port-shutdown' can be used to
set the default to false, i.e. 'no shutdown' will be default for L3 ports in
that case.

If the auto handling fails for some reason, or you are using NXAPI, you need to
use the value 'explicit' for the 'system-interface-defaults/handling'
setting. Then you must explicitly set the corresponding system default under the
node 'system-interface-defaults/explicit'. The leaf 'switchport' corresponds to
the value of 'system default switchport' on the device (i.e. if this leaf is
present on device, this setting should be set to 'true'). The leaf 'shutdown'
corresponds in the same way to the value of 'system default switchport shutdown'
on the device.

NOTE: when inspecting these values on your device, you might need to do:

      'show running-config all | inc 'system default switchport'

To actually see them, since the default value of these settings are hidden,
also, on some switches the 'system default switchport' is not there at all,
implying it has layer 2, switchport, as default.

In addition to the dynamic defaults dependent on 'system default switchport' The
default value of the shutdown leaf will be correctly handled for Vlan/Bdi/Tunnel
interfaces as well as sub-interfaces of port-channel and Ethernet ports.

For details on where this is used, see yang-model, look for the custom extension
cli:context-value-inject, with when-expression containing reference to virtual
node '/tailfned/inject-switchport-defaults'.


# 13. Detecting and/or ignoring warnings/errors from device during transactions
-------------------------------------------------------------------------------

When the NED applies config to the device during a transaction it will
automatically abort the transaction if it detects an error according to a
hard-coded list of known "fatal" error-messages. However, sometimes there might
be warnings that indicate that the config being applied is not valid, leading to
the device ignoring it. This will lead to an inconsistent state, where NSO and
the device is not in sync. In other situations, the device might indicate an
error, but for a specific scenario it can safely be ignored.

In sitations like these it is useful to be able to define messages that the
device reports back as either to be ignored, or to be treated as fatal
errors. This can be done with the ned-settings 'transaction
config-abort-warning' and 'transaction config-ignore-error'. With these, one can
set regular expressions which are matched against the message sent back from
device in response to config being applied (i.e. the message is searched for a
match against each expression in the lists). Each ned-setting is a list, where
the key is the regular-expression. When an expression matches, it either ignores
the error message, or abort the transaction depending on in which ned-setting
list it is found.

Example to ignore the error message "Cannot remove primary address" (which is
normally considered fatal, aborting transaction), one can set this:

  devices device nx-1 ned-settings cisco-nx transaction config-ignore-error "^.*annot remove primary address.*$"

NOTE: the regular expression is a standard multi-line regular expression, using
^ and $ for start/end-of-line.


# 14. Handling special config that can be considered 'dayzero'
--------------------------------------------------------------

Some configuration is not easily handled in NSO, often this config can be
considered 'dayzero' in the sense that it's some global parameter deciding the
profile of the device (e.g. 'system admin-vdc'), set at initial device
setup. Some times it can be convenient to be able to read that config from
within NSO. For such cases the ned-setting behaviours/dayzero-included can be
enabled. This will include some more config in the model (search yang-model for
annotation 'nx:dayzero-config'). Enabling this ned-setting will consider the
extra config to be read-only, hence if one tries to change it the transaction
will be aborted.

To be able to write this kind of config (even though it means doing a sync-from
after transaction to get in sync with the device). One must also enable the
ned-setting behaviours/dayzero-permit-write.

The below config is currently marked as 'dayzero' and will not be visible in NSO
by default:

   /system/admin-vdc
   /system/default/switchport
   /system/default/switchport-config/switchport/shutdown
   /system/default/switchport-config/switchport/fabricpath
   /slot/port


# 15. Handling error and warning messages from device
-----------------------------------------------------

The NED tries to interpret errors and warnings which the device reports as the
result of applying configuration. In a basic scenario any message containing the
word 'error' can be considered a true error, causing NSO to abort the
transaction. However, there are numerous messages reported by the device which
needs to be interpreted as either transient or permanent failures, these
messages follow no simple rule and needs to be handled mostly on a case-by-case
basis. Also, the wording of messages can vary between device models/versions.

To provide a flexible way of controlling the behaviour of the NED when it
encounters a new message reported by device, which needs to be treated in a
specific way, there are two ned-setting lists 'config-abort-warning' and
'config-ignore-error', which can be used to fine-tune the behaviour of the NED
with respect to messages sent from device. These are described in
README-ned-settings.md. Basically its a question of matching messages which
should be either interpreted as an error, though the wording doesn't contain the
word 'error', or, to not treat a message which seems like an error as such.

Another condition that can be reported by the device is that there was a
transient failure. Currently the errors considered transient, i.e. indicating
that the application of config can be retried, are hard-coded into the NED, and
can not be set with ned-settings. The below list of partial messages are matched
against replies from the device (case-insensitive). A message containing any of
these is considered a transient failure and will be retried:

  "wait for it to complete"
  "re-try this command at a later time"
  "please try creating later"
  "is being removed, retry later"
  "wait for the system"
  "unable to confirm radius group name with aaa daemon"
  "vrf in delete pending/holddown"
  "validation timed out"
  "delete in progress"
  "please check if command was successful"
  "irresponsive app timeout"
  "cli server not ready"
  "commit is in progress"


EXAMPLE: if the device replies with the message:

    Configuration update aborted: services in transient state, wait for the system to stabilize

This will be considered a transient failure since the string "wait for the
system" is part of the message.

By default the NED will retry 60 times, with a one second delay. The
ned-settings 'device-retry-count' and 'device-retry-delay' can be used to change
this. See README-ned-settings.md for details on this.

NOTE: Both CLI and NXAPI modes use the same retry-behaviour/settings. In NXAPI
the field 'clierror' is used for determining if a reply is to be interpreted as
a transient error.


# 16. Recompiling the NED to enable certain features
----------------------------------------------------

Some specific features might not be possible to achieve "dynamically" in the
NED. Instead these can only be enabled by re-compiling the NED package, setting
specific compile time variables.

One such feature is to change the yang-type of keys and passwords (see section
10 for info on this).

## Changing representation of allowed vlan range in trunk ports

The NED has the feature to change the yang node type for 'switchport trunk
allowed vlan' in trunk ports from leaf-list to a simple leaf.

To do this, re-compile the NED package with the below variable set:

  make ALLOWED_VLAN_AS_LEAF=True clean all

NOTE: When changing to leaf, the functionality of using add/remove can no longer
be used by the NED since the value is an "opaque" string representation of the
range(s), this means that each edit sets the whole range.
