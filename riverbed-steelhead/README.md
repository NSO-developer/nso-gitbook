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
  11. Configure IF
     11.1 Configure LAN(lan0_0)
     11.2 Configure WAN interface(wan0_0)
     11.3 Configure in_path interface(in_path0_0) in_path interface: Logical IF to apply optimization/acceleration
  12. Configure “MyGlobalApp”
  13. Configure QoS
  14. Configure optimization for the specific connections with vlan 10, from 10.0.0.0/24 to 10.0.1.0/24
     14.1 Optimization for cifs protocol
     14.2 Optimization for ftp protocol
     14.3 Optimization for http protocol
  ```


# 1. General
------------

  This document describes the riverbed-steelhead NED.

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
  | check-sync                | yes       | -                                                                |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | NED fetches full config from device and nedcom turbo parser      |
  |                           |           | filters config for partial paths                                 |
  |                           |           |                                                                  |
  | live-status actions       | no        | -                                                                |
  |                           |           |                                                                  |
  | live-status show          | no        | -                                                                |
  |                           |           |                                                                  |
  | load-native-config        | no        | -                                                                |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Riverbed Steelhead CXA    |                 | RiOS   | -                                                 |
  | 1555-B010                 |                 |        |                                                   |
  |                           |                 |        |                                                   |
  | Virtual Steelhead         |                 | RiOS   | -                                                 |
  | VCX-1555-M                |                 |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-riverbed-steelhead-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-riverbed-steelhead-1.0.1.signed.bin
      > ./ncs-6.0-riverbed-steelhead-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-riverbed-steelhead-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-riverbed-steelhead-1.0.1.tar.gz
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
     `riverbed-steelhead-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-riverbed-steelhead-1.0.1.tar.gz
     > ls -d */
     riverbed-steelhead-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package riverbed-steelhead-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package riverbed-steelhead-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-riverbed-steelhead-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package riverbed-steelhead-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/riverbed-steelhead-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-riverbed-steelhead-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-riverbed-steelhead-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install riverbed-steelhead-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-riverbed-steelhead-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-riverbed-steelhead-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id riverbed-steelhead-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-riverbed-steelhead-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings riverbed-steelhead logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings riverbed-steelhead logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.riverbed \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings riverbed-steelhead logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings riverbed-steelhead logger java true
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

  Add a banner

  The commands in the ncs_cli:

  ```
  admin@ncs(config-config)# banner login  "Riverbed SteelHead"
  admin@ncs(config-config)# banner motd "Security Warning - all activities are monitored"
  ```

  Inspect what would be sent to the device if we would commit the made changes:

  ```
  admin@ncs(config-config)# commit dry-run outformat native
  native {
      device {
          name dev-1
          data banner login "Riverbed SteelHead"
               banner motd "Security Warning - all activities are monitored"
      }
  }
  ```

  Commit the changes to the device:

  ```
  admin@ncs(config-config) # commit
  Commit complete.
  ```


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
     admin@ncs(config)# devices device dev-1 ned-settings riverbed-steelhead logging level debug
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
  > devices device dev-1 ned-settings riverbed-steelhead logger level debug
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

# 11. Configure IF
------------------

## 11.1 Configure LAN(lan0_0)
-----------------------------

These commands correspond to the Riverbed device:

```
prompt (config) # interface lan0_0 description ""
prompt (config) # no interface lan0_0 dhcp
prompt (config) # no interface lan0_0 dhcp dynamic-dns
prompt (config) # no interface lan0_0 force-mdi-x enable
prompt (config) # interface lan0_0 mtu "1500"
prompt (config) # interface lan0_0 napi-weight "128"
prompt (config) # no interface lan0_0 shutdown
prompt (config) # interface lan0_0 speed "auto"
prompt (config) # interface lan0_0 txqueuelen "100"
```

Set in the NCS CLI:

```
admin@ncs(config)# devices device dev-1 config
admin@ncs(config-config)# interface lan0_0 description ""
admin@ncs(config-config)# no interface lan0_0 dhcp
admin@ncs(config-config)# no interface lan0_0 dhcp dynamic-dns
admin@ncs(config-config)# no interface lan0_0 force-mdi-x enable
admin@ncs(config-config)# interface lan0_0 mtu 1500
admin@ncs(config-config)# interface lan0_0 napi-weight 128
admin@ncs(config-config)# no interface lan0_0 shutdown
admin@ncs(config-config)# interface lan0_0 speed auto
admin@ncs(config-config)# interface lan0_0 txqueuelen 100
```

Inspect what would be sent to the device if we would commit the made changes:

```
admin@ncs(config-config) # commit-dry-run outformat native
```

Commit the changes to the device:

```
admin@ncs(config-config) # commit
Commit complete.
```

## 11.2 Configure WAN interface(wan0_0)
---------------------------------------

These commands correspond to the Riverbed device:

```
prompt (config) # interface wan0_0 description ""
prompt (config) # no interface wan0_0 dhcp
prompt (config) # no interface wan0_0 dhcp dynamic-dns
prompt (config) # no interface wan0_0 force-mdi-x enable
prompt (config) # interface wan0_0 mtu "1500"
prompt (config) # interface wan0_0 napi-weight "128"
prompt (config) # no interface wan0_0 shutdown
prompt (config) # interface wan0_0 speed "auto"
prompt (config) # interface wan0_0 txqueuelen "100"
```

Set in the NCS CLI:

```
admin@ncs(config-config)# interface wan0_0 description ""
admin@ncs(config-config)# no interface wan0_0 dhcp
admin@ncs(config-config)# no interface wan0_0 dhcp dynamic-dns
admin@ncs(config-config)# no interface wan0_0 force-mdi-x enable
admin@ncs(config-config)# interface wan0_0 mtu 1500
admin@ncs(config-config)# interface wan0_0 napi-weight 128
admin@ncs(config-config)# no interface wan0_0 shutdown
admin@ncs(config-config)# interface wan0_0 speed auto
admin@ncs(config-config)# interface wan0_0 txqueuelen 100
```

Inspect what would be sent to the device if we would commit the made changes:

```
admin@ncs(config-config) # commit-dry-run outformat native
```

Commit the changes to the device:

```
admin@ncs(config-config) # commit
Commit complete.
```

## 11.3 Configure in_path interface(in_path0_0) in_path interface: Logical IF to apply optimization/acceleration
----------------------------------------------------------------------------------------------------------------

These correspond to the Riverbed commands:

```
prompt (config) # interface inpath0_0 description ""
prompt (config) # no interface inpath0_0 dhcp
prompt (config) # no interface inpath0_0 dhcp dynamic-dns
prompt (config) # no interface inpath0_0 force-mdi-x enable
prompt (config) # interface inpath0_0 ip address 192.168.0.100 /24
prompt (config) # interface inpath0_0 mtu "1500"
prompt (config) # interface inpath0_0 napi-weight "128"
prompt (config) # no interface inpath0_0 shutdown
prompt (config) # interface inpath0_0 speed "auto"
prompt (config) # interface inpath0_0 txqueuelen "100"
```

Set in the NCS CLI:

```
admin@ncs(config-config)# interface inpath0_0 description ""
admin@ncs(config-config)# no interface inpath0_0 dhcp
admin@ncs(config-config)# no interface inpath0_0 dhcp dynamic-dns
admin@ncs(config-config)# no interface inpath0_0 force-mdi-x enable
admin@ncs(config-config)# interface inpath0_0 ip address 192.168.0.100 /24
admin@ncs(config-config)# interface inpath0_0 mtu 1500
admin@ncs(config-config)# interface inpath0_0 napi-weight 128
admin@ncs(config-config)# no interface inpath0_0 shutdown
admin@ncs(config-config)# interface inpath0_0 speed auto
admin@ncs(config-config)# interface inpath0_0 txqueuelen 100
```

Inspect what would be sent to the device if we would commit the made changes:

```
admin@ncs(config-config) # commit-dry-run outformat native
```

Commit the changes to the device:

```
admin@ncs(config-config) # commit
Commit complete.
```

# 12. Configure “MyGlobalApp”
-----------------------------

The bellow command corresponds to the Riverbed device:

```
prompt (config) # port-label "MyGlobalApp" port "20-21, 80, 139, 445"
```

The equivalent command in the ncs_cli:

```
admin@ncs(config-config)# port-label MyGlobalApp port "20-21, 80, 139, 445"
```

Inspect what would be sent to the device if we would commit the made changes:

```
admin@ncs(config-config)# commit dry-run outformat native
native {
    device {
        name dev-1
        data interface lan0_0 txqueuelen 200
             port-label MyGlobalApp port "20-21, 80, 139, 445"
    }
}
```

Commit the changes to the device:

```
admin@ncs(config-config) # commit
Commit complete.
```

# 13. Configure QoS
-------------------
These commands correspond to the Riverbed device:

```
prompt (config) #qos shaping interface wan0_0 enable
prompt (config) #qos shaping interface wan0_0 rate 10000
prompt (config) #qos inbound interface wan0_0 rate 10000
prompt (config) #no qos inbound interface wan0_0 enable
prompt (config) #qos classification class add class-name 
"Default-Site$$parent_class" priority normal min-pct
90.0000000 link-share 1.0000000 upper-limit-pct
100.0000000 conn-limit 0 queue-type sfq queue-length 100
parent root out-dscp 255

prompt (config) #qos classification class add class-name
"Default-Site$$Business-Critical" priority business min-pct
20.0000000 link-share 100.0000000 upper-limit-pct
100.0000000 conn-limit 0 queue-type sfq queue-length 100
parent Default-Site$$parent_class out-dscp 255

prompt (config) #qos classification class add class-name
"Default-Site$$Interactive" priority interactive min-pct
20.0000000 link-share 100.0000000 upper-limit-pct
100.0000000 conn-limit 0 queue-type sfq queue-length 100
parent Default-Site$$parent_class out-dscp 255

prompt (config) #qos classification class add class-name
"Default-Site$$Low-Priority" priority low min-pct 9.0000000
link-share 100.0000000 upper-limit-pct 100.0000000
conn-limit 0 queue-type sfq queue-length 100 parent
Default-Site$$parent_class out-dscp 255

prompt (config) #qos classification class add class-name "Default-Site$$Normal"
priority normal min-pct 40.0000000 link-share 100.0000000
upper-limit-pct 100.0000000 conn-limit 0 queue-type sfq
queue-length 100 parent Default-Site$$parent_class out-dscp 255

prompt (config) #qos classification class add class-name
"Default-Site$$Realtime" priority realtime min-pct
10.0000000 link-share 100.0000000 upper-limit-pct
100.0000000 conn-limit 0 queue-type sfq queue-length 100
parent Default-Site$$parent_class out-dscp 255
prompt (config) #qos classification class add class-name "MyGlobalApp" priority
business min-pct 0 link-share 100.0000000
upper-limit-pct 10.0000000 conn-limit 0 queue-type sfq
queue-length 100 parent root out-dscp 255

prompt (config) #qos classification site edit site-name "Default-Site"
default-class "MyGlobalApp"
prompt (config) #qos classification site edit site-name "Default-Site" def-out-dscp 255
prompt (config) #qos inbound class modify class-name "Default" priority "low"
min-pct 10.0000000 upper-limit-pct 100.0000000 link-share 100.0000000

prompt (config) #qos classification mode hierarchy enable
prompt (config) #qos shaping enable
prompt (config) #no qos inbound enable
```

Set in the NCS CLI:

```
admin@ncs(config-config)# qos shaping interface wan0_0 enable
admin@ncs(config-config)# qos shaping interface wan0_0 rate 10000
admin@ncs(config-config)# qos inbound interface wan0_0 rate 10000
admin@ncs(config-config)# no qos inbound interface wan0_0 enable
admin@ncs(config-config)# qos classification class add class-name Default-Site$$parent_class priority normal min-pct 90.0000000 link-share 1.0000000 upper-limit-pct 100.0000000 conn-limit 0 queue-type sfq queue-length 100 parent root out-dscp 255
admin@ncs(config-config)# qos classification class add class-name Default-Site$$Business-Critical priority business min-pct 20.0000000 link-share 100.0000000 upper-limit-pct 100.0000000 conn-limit 0 queue-type sfq queue-length 100 parent Default-Site$$parent_class out-dscp 255
admin@ncs(config-config)# qos classification class add class-name Default-Site$$Interactive priority interactive min-pct 20.0000000 link-share 100.0000000 upper-limit-pct 100.0000000 conn-limit 0 queue-type sfq queue-length 100 parent Default-Site$$parent_class out-dscp 255
admin@ncs(config-config)# qos classification class add class-name Default-Site$$Low-Priority priority low min-pct 9.0000000 link-share 100.0000000 upper-limit-pct 100.0000000 conn-limit 0 queue-type sfq queue-length 100 parent Default-Site$$parent_class out-dscp 255
admin@ncs(config-config)# qos classification class add class-name Default-Site$$Normal priority normal min-pct 40.0000000 link-share 100.0000000 upper-limit-pct 100.0000000 conn-limit 0 queue-type sfq queue-length 100 parent Default-Site$$parent_class out-dscp 255
admin@ncs(config-config)# qos classification class add class-name Default-Site$$Realtime priority realtime min-pct 10.0000000 link-share 100.0000000 upper-limit-pct 100.0000000 conn-limit 0 queue-type sfq queue-length 100 parent Default-Site$$parent_class out-dscp 255
admin@ncs(config-config)# qos classification class add class-name MyGlobalApp priority business min-pct 0 link-share 100.0000000 upper-limit-pct 10.0000000 conn-limit 0 queue-type sfq queue-length 100 parent root out-dscp 255
admin@ncs(config-config)# qos classification site edit site-name Default-Site default-class "MyGlobalApp"
admin@ncs(config-config)# qos classification site edit site-name Default-Site def-out-dscp 255
admin@ncs(config-config)# qos inbound class modify class-name Default priority low min-pct 10.0000000 upper-limit-pct 100.0000000 link-share 100.0000000
admin@ncs(config-config)# qos classification mode hierarchy enable
admin@ncs(config-config)# qos shaping enable
admin@ncs(config-config)# no qos inbound enable
```

Inspect what would be sent to the device if we would commit the made changes:

```
admin@ncs(config-config) # commit-dry-run outformat native
```

Commit the changes to the device:

```
admin@ncs(config-config) # commit
Commit complete.
```




# 14. Configure optimization for the specific connections with vlan 10, from 10.0.0.0/24 to 10.0.1.0/24
-------------------------------------------------------------------------------------------------------
These commands correspond to the Riverbed device:

```
prompt (config) #in-path rule auto-discover srcaddr 10.0.1.0/24 dstaddr
10.0.0.0/24 dstport "MyGlobalApp" preoptimization "none"
optimization "normal" latency-opt "normal" vlan 10
neural-mode "always" saas_action auto wan-visibility "full" wan-vis-opt "none"
chksum-inval disable description "Optimization for
MyGlobalApp" auto-kickoff disable rule-enable true rulenum 1

prompt (config) #in-path rule pass-through srcaddr all-ipv4 srcport "all" dstaddr
all-ipv4 dstport "all" vlan -1 protocol "tcp" saas_action auto description ""
rule-enable true rulenum 2

prompt (config) #in-path enable
prompt (config) #in-path interface inpath0_0 enable
```

Set in the NCS CLI:

```
admin@ncs(config-config)# in-path rule auto-discover srcaddr 10.0.1.0/24 dstaddr 10.0.0.0/24 dstport MyGlobalApp preoptimization none optimization normal latency-opt normal vlan 10 neural-mode always saas_action auto wan-visibility full wan-vis-opt none chksum-inval disable description "Optimization for MyGlobalApp" auto-kickoff disable rule-enable true rulenum 1
admin@ncs(config-config)# in-path rule pass-through srcaddr all-ipv4 srcport all dstaddr all-ipv4 dstport all vlan -1 protocol tcp saas_action auto description "" rule-enable true rulenum 2
admin@ncs(config-config)# in-path enable
admin@ncs(config-config)# in-path interface inpath0_0 enable
```

Inspect what would be sent to the device if we would commit the made changes:

```
admin@ncs(config-config)# commit dry-run outformat native
native {
    device {
        name dev-1
        data in-path enable
             in-path interface inpath0_0 enable
             in-path rule auto-discover srcaddr 10.0.1.0/24 dstaddr 10.0.0.0/24 dstport MyGlobalApp preoptimization none optimization normal latency-opt normal vlan 10 neural-mode always saas_action auto wan-visibility full wan-vis-opt none chksum-inval disable description "Optimization for MyGlobalApp" auto-kickoff disable rule-enable true rulenum 1
             in-path rule pass-through srcaddr all-ipv4 srcport all dstaddr all-ipv4 dstport all vlan -1 protocol tcp saas_action auto description "" rule-enable true rulenum 2
    }
}
```

Commit the changes to the device:

```
admin@ncs(config-config) # commit
Commit complete.
```

## 14.1 Optimization for cifs protocol
--------------------------------------

These commands correspond to the Riverbed device:

```
prompt (config) #protocol cifs applock enable
prompt (config) #no protocol cifs clear-read-resp enable
prompt (config) #no protocol cifs disable write optimization
prompt (config) #protocol cifs dw-throttling enable
prompt (config) #protocol cifs enable
prompt (config) #no protocol cifs ext-dir-cache enable
prompt (config) #protocol cifs mac oplock enable
prompt (config) #no protocol cifs mac qpath-allinfo squash enable
prompt (config) #protocol cifs nosupport client add "macunk"
prompt (config) #protocol cifs nosupport client add "novell"
prompt (config) #protocol cifs nosupport client add "winunk"
prompt (config) #protocol cifs nosupport client add "wnt3"
prompt (config) #protocol cifs nosupport server add "bsd"
prompt (config) #protocol cifs nosupport server add "win98"
prompt (config) #protocol cifs nosupport server add "winunk"
prompt (config) #protocol cifs nosupport server add "wnt3"
prompt (config) #no protocol cifs oopen enable
prompt (config) #protocol cifs oopen extension modify ldb setting deny
prompt (config) #protocol cifs oopen extension modify mdb setting deny
prompt (config) #protocol cifs oopen extension modify sldasm setting allow
prompt (config) #protocol cifs oopen extension modify slddrw setting allow
prompt (config) #protocol cifs oopen extension modify slddwg setting allow
prompt (config) #protocol cifs oopen extension modify sldprt setting allow
prompt (config) #protocol cifs oopen policy deny
prompt (config) #protocol cifs secure-sig-opt enable
prompt (config) #no protocol cifs smb signing enable
prompt (config) #protocol cifs smb signing mode-type "transparent"
prompt (config) #no protocol cifs smbv1-mode enable
prompt (config) #no protocol cifs spoolss enable 
```

Set in the NCS CLI:

```
admin@ncs(config-config)# protocol cifs applock enable
admin@ncs(config-config)# no protocol cifs clear-read-resp enable
admin@ncs(config-config)# no protocol cifs disable write optimization
admin@ncs(config-config)# protocol cifs dw-throttling enable
admin@ncs(config-config)# protocol cifs enable
admin@ncs(config-config)# no protocol cifs ext-dir-cache enable
admin@ncs(config-config)# protocol cifs mac oplock enable
admin@ncs(config-config)# no protocol cifs mac qpath-allinfo squash enable
admin@ncs(config-config)# protocol cifs nosupport client add "macunk"
admin@ncs(config-config)# protocol cifs nosupport client add "novell"
admin@ncs(config-config)# protocol cifs nosupport client add "winunk"
admin@ncs(config-config)# protocol cifs nosupport client add "wnt3"
admin@ncs(config-config)# protocol cifs nosupport server add "bsd"
admin@ncs(config-config)# protocol cifs nosupport server add "win98"
admin@ncs(config-config)# protocol cifs nosupport server add "winunk"
admin@ncs(config-config)# protocol cifs nosupport server add "wnt3"
admin@ncs(config-config)# no protocol cifs oopen enable
admin@ncs(config-config)# protocol cifs oopen extension modify ldb setting deny
admin@ncs(config-config)# protocol cifs oopen extension modify mdb setting deny
admin@ncs(config-config)# protocol cifs oopen extension modify sldasm setting allow
admin@ncs(config-config)# protocol cifs oopen extension modify slddrw setting allow
admin@ncs(config-config)# protocol cifs oopen extension modify slddwg setting allow
admin@ncs(config-config)# protocol cifs oopen extension modify sldprt setting allow
admin@ncs(config-config)# protocol cifs oopen policy deny
admin@ncs(config-config)# protocol cifs secure-sig-opt enable
admin@ncs(config-config)# no protocol cifs smb signing enable
admin@ncs(config-config)# protocol cifs smb signing mode-type "transparent"
admin@ncs(config-config)# no protocol cifs smbv1-mode enable
admin@ncs(config-config)# no protocol cifs spoolss enable
```

Inspect what would be sent to the device if we would commit the made changes:

```
admin@ncs(config-config)# commit dry-run outformat native
native {
    device {
        name dev-1
        data protocol cifs enable
             protocol cifs applock enable
             protocol cifs dw-throttling enable
             protocol cifs mac oplock enable
             protocol cifs nosupport client add macunk
             protocol cifs nosupport client add novell
             protocol cifs nosupport client add winunk
             protocol cifs nosupport client add wnt3
             protocol cifs nosupport server add bsd
             protocol cifs nosupport server add win98
             protocol cifs nosupport server add winunk
             protocol cifs nosupport server add wnt3
             protocol cifs oopen extension add ldb setting deny
             protocol cifs oopen extension add mdb setting deny
             protocol cifs oopen extension add sldasm setting allow
             protocol cifs oopen extension add slddrw setting allow
             protocol cifs oopen extension add slddwg setting allow
             protocol cifs oopen extension add sldprt setting allow
             protocol cifs oopen policy deny
             protocol cifs secure-sig-opt enable
             protocol cifs smb signing mode-type transparent
    }
}
```

Commit the changes to the device:

```
admin@ncs(config-config) # commit
Commit complete.
```


## 14.2 Optimization for ftp protocol
-------------------------------------

These commands correspond to the Riverbed device:

```
prompt (config) #protocol ftp port "21"
prompt (config) #protocol ftp port 21 enable
```

Set in the NCS CLI:

```
admin@ncs(config-config)# protocol ftp port "21"
admin@ncs(config-config)# protocol ftp port 21 enable
```


Inspect what would be sent to the device if we would commit the made changes:

```
admin@ncs(config-config)# commit dry-run outformat native
```


Commit the changes to the device:

```
admin@ncs(config-config) # commit
Commit complete.
```

## 14.3 Optimization for http protocol
--------------------------------------

These commands correspond to the Riverbed device:

```
prompt (config) #protocol http auto-config enable
prompt (config) #protocol http enable
prompt (config) #protocol http metadata-resp extension "css"
prompt (config) #protocol http metadata-resp extension "gif"
prompt (config) #protocol http metadata-resp extension "jpg"
prompt (config) #protocol http metadata-resp extension "js"
prompt (config) #protocol http metadata-resp extension "png"
prompt (config) #protocol http metadata-resp mode "all"
prompt (config) #no protocol http native-krb enable
prompt (config) #protocol http prefetch extension "css"
prompt (config) #protocol http prefetch extension "gif"
prompt (config) #protocol http prefetch extension "jpg"
prompt (config) #protocol http prefetch extension "js"
prompt (config) #protocol http prefetch extension "png"
prompt (config) #protocol http prefetch tag "base" attribute "href"
prompt (config) #protocol http prefetch tag "body" attribute "background"
prompt (config) #protocol http prefetch tag "img" attribute "src"
prompt (config) #protocol http prefetch tag "link" attribute "href"
prompt (config) #protocol http prefetch tag "script" attribute "src"
prompt (config) #protocol http prepop verify-svr-cert enable
prompt (config) #protocol http server-table subnet all obj-pref-table yes
parse-prefetch no url-learning yes reuse-auth no
```

Set in the NCS CLI:

```
admin@ncs(config-config)# protocol http auto-config enable
admin@ncs(config-config)# protocol http enable
admin@ncs(config-config)# protocol http metadata-resp extension "css"
admin@ncs(config-config)# protocol http metadata-resp extension "gif"
admin@ncs(config-config)# protocol http metadata-resp extension "jpg"
admin@ncs(config-config)# protocol http metadata-resp extension "js"
admin@ncs(config-config)# protocol http metadata-resp extension "png"
admin@ncs(config-config)# protocol http metadata-resp mode "all"
admin@ncs(config-config)# no protocol http native-krb enable
admin@ncs(config-config)# protocol http prefetch extension "css"
admin@ncs(config-config)# protocol http prefetch extension "gif"
admin@ncs(config-config)# protocol http prefetch extension "jpg"
admin@ncs(config-config)# protocol http prefetch extension "js"
admin@ncs(config-config)# protocol http prefetch extension "png"
admin@ncs(config-config)# protocol http prefetch tag "base" attribute "href"
admin@ncs(config-config)# protocol http prefetch tag "body" attribute "background"
admin@ncs(config-config)# protocol http prefetch tag "img" attribute "src"
admin@ncs(config-config)# protocol http prefetch tag "link" attribute "href"
admin@ncs(config-config)# protocol http prefetch tag "script" attribute "src"
admin@ncs(config-config)# protocol http prepop verify-svr-cert enable
admin@ncs(config-config)# protocol http server-table subnet all obj-pref-table yes parse-prefetch no url-learning yes reuse-auth no strip-auth-hdr no gratuitous-401 no force-nego-ntlm no strip-compress yes insert-cookie no insrt-keep-aliv no
admin@ncs(config-config)# protocol http space-in-uri enable
admin@ncs(config-config)# no protocol http stream-split live enable
```

Inspect what would be sent to the device if we would commit the made changes:

```
admin@ncs(config-config)# commit dry-run outformat native
```

Commit the changes to the device:

```
admin@ncs(config-config) # commit
Commit complete.
```
