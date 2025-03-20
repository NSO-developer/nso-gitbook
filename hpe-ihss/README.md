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
  11. Executing RPCs
     11.1. IMSI QUERY
          11.1.0. Navigation
          11.1.1. Read IMSI from the GSM HLR
          11.1.2. Read IMSI from the EPS HSS
     11.2. MSISDN QUERY
          11.2.0. Navigation
          11.2.1. Read MSISDN from the GSM HLR
          11.2.2. Read MSISDN from the EPS HSS
     11.3. APN Creation
          11.3.0. Navigation
          11.3.1. APN Creation for 3G (PDP ID)
          11.3.2. APN Creation for LTE (PDN ID)
     11.4. Generated standalone RPCs
          11.4.1. Execute CMD-<ENTITY> RPCs
     11.5. Roaming Restriction
          11.5.0. Navigation
          11.5.1. Additional Read Commands for Roaming Restriction Query
  ```


# 1. General
------------

  This document describes the hpe-ihss NED.

  The hpe-ihss NED is built for HPE I-HSS devices.

  It supports the following versions:
  - HSS 05.00.00

  The NED connects to the device CLI using either SSH or Telnet.

  Configuration is done/viewed by sending CLI commands or by executing the provided RPCs commands (see chapter 9).

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
  | partial-sync-from         | no        | -                                                                |
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
  |                           | 05.00.00        | HSS    | -                                                 |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-hpe-ihss-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-hpe-ihss-1.0.1.signed.bin
      > ./ncs-6.0-hpe-ihss-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-hpe-ihss-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-hpe-ihss-1.0.1.tar.gz
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
     `hpe-ihss-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-hpe-ihss-1.0.1.tar.gz
     > ls -d */
     hpe-ihss-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package hpe-ihss-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package hpe-ihss-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-hpe-ihss-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package hpe-ihss-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/hpe-ihss-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-hpe-ihss-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-hpe-ihss-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install hpe-ihss-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-hpe-ihss-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-hpe-ihss-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id hpe-ihss-cli-1.0
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

  ---

  - Add entities to be retrieved from device on sync:
    ```
    devices device <device-name> ned-settings hpe-ihss connection sync
    (example: ned-settings hpe-ihss connection sync ENTITY HOMEADDR KEYS PATTERN_TYPE MSISDN PATTERN 88235.)
    ```

  ---

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

  `$NSO_RUNDIR/logs/ned-hpe-ihss-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings hpe-ihss logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings hpe-ihss logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.ihss \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings hpe-ihss logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings hpe-ihss logger java true
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
     admin@ncs(config)# devices device dev-1 ned-settings hpe-ihss logging level debug
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
  > devices device dev-1 ned-settings hpe-ihss logger level debug
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

# 11. Executing RPCs
-------------------

Enter device mode:
```
devices device <device-name>
```

Perform `<entity=[homeaddr]><action=[read|add|delete]> (only by <KEY>; <params> is optional)`:
```
rpc rpc-<entity>-<action> <entity>-<action> KEY "<KEY>" params "<params>"
```

Examples:
```
rpc rpc-homeaddr-read homeaddr-read KEY "123"
rpc rpc-homeaddr-add homeaddr-add KEY "123" params "2^E164_NUMBER^8823508936^LOCAL_DIAM_HOST_NAME^HSSLABO51"
rpc rpc-homeaddr-delete homeaddr-delete KEY "123" params "2^E164_NUMBER^8823508936^LOCAL_DIAM_HOST_NAME^HSSLAB51"
```

NAVIGATION INFO (where applicable):
  - the order of called actions is important.
  - first you must call read action, which will also store navigation params
    (such as current KEY or current read-from source).
  - if no KEY is provided for action, the current resource stored KEY will be used.
  - you can also update navigation params independently, if you don't want to call the read action.


## 11.1. IMSI QUERY
------------------

### 11.1.0. Navigation
---------------------

11.1.0.1. Update/view current navigation params:
```
rpc rpc-imsi-params imsi-params
```

11.1.0.2. View navigation stored data (from ncs-root/first-level mode):
```
show devices device <device-name> box IMSI
```

---

### 11.1.1. Read IMSI from the GSM HLR
-----------------------------------

11.1.1.1. Read Request:
```
rpc rpc-imsi-read imsi-read KEY "<KEY>" read-from gsm-hlr
```

11.1.1.2. Read Request First Subscriber IMSI:
```
rpc rpc-imsi-first imsi-first
```

11.1.1.3. Read Next Subscriber IMSI (with Reference IMSI):
```
rpc rpc-imsi-next imsi-next
```

---

### 11.1.2. Read IMSI from the EPS HSS
-------------------------------------

11.1.2.1. Read Request:
```
rpc rpc-imsi-read imsi-read KEY "<KEY>" read-from eps-hss
```

11.1.2.2. Read Request First Subscriber IMSI:
```
rpc rpc-imsi-first imsi-first
```

11.1.2.3. Read Next Subscriber IMSI (with Reference IMSI):
```
rpc rpc-imsi-next imsi-next
```

---

## 11.2. MSISDN QUERY
--------------------

### 11.2.0. Navigation
---------------------

11.2.0.1. Update/view current navigation params:
```
rpc rpc-msisdn-params msisdn-params
```

11.2.0.2. View navigation stored data (from ncs-root/first-level mode):
```
show devices device <device-name> box MSISDN
```

---

### 11.2.1. Read MSISDN from the GSM HLR
---------------------------------------

11.2.1.1. Read Request:
```
rpc rpc-msisdn-read msisdn-read KEY "<KEY>" read-from gsm-hlr
```

11.2.1.2. Read Next Subscriber IMSI (with Reference IMSI):
```
rpc rpc-msisdn-next msisdn-next
```

---

### 11.2.2. Read MSISDN from the EPS HSS
---------------------------------------

11.2.2.1. Read Request:
```
rpc rpc-msisdn-read msisdn-read KEY "<KEY>" read-from eps-hss
```

---

## 11.3. APN Creation
--------------------

### 11.3.0. Navigation
---------------------

11.3.0.1. Update/view current navigation params:
```
rpc rpc-apn-params apn-params
```

11.3.0.2. View navigation stored data (from ncs-root/first-level mode):
```
show devices device <device-name> box APN
```

---

### 11.3.1. APN Creation for 3G (PDP ID)
---------------------------------------

- On ADD:
  - If the "read-key" param is present and used, a new READ request (using this READ KEY)
    is performed within the same transaction and the returned response is used for new APN Creation Request.
  - If the "read-key" param is present but ignored,
    the previous cached READ response is used for new APN Creation Request.

11.3.1.1. COS APN Query

11.3.1.1.1. Read QOS Template PDP ID QoS parameters

11.3.1.1.1.1. Read Request:
```
rpc rpc-apn-read apn-read KEY "<KEY>" read-from qos-cos
```

---

11.3.1.1.2. ADD New PDP ID with QOS Template PDP ID QoS parameters

11.3.1.1.2.1. Add Request:
```
rpc rpc-apn-add apn-add KEY "<KEY>" APN-1 <APN-1> COS-NAME <COS-NAME>
```

---

11.3.1.1.3. READ the newly added PDP ID

11.3.1.1.3.1. Read Request:
```
rpc rpc-apn-read apn-read
```

---

11.3.1.1.4. Additional Read Commands for COS APN Query

11.3.1.1.4.1. Read Previous (Using Reference COS APN ID):
```
rpc rpc-apn-prev apn-prev
```

11.3.1.1.4.2. Read Next (Using Reference COS APN ID):
```
rpc rpc-apn-next apn-next
```

---


11.3.1.2. PDP Context Query

11.3.1.2.1. READ the QoS Template PDP ID from EPS -> PDP Context COS Entry

11.3.1.2.1.1. Read Request:
```
rpc rpc-apn-read apn-read KEY "<KEY>" read-from eps-pdp
```

---

11.3.1.2.2. ADD the new PDP ID at EPS -> PDP Context COS Entry

11.3.1.2.2.1. Add Request:
```
rpc rpc-apn-pdp-add apn-pdp-add KEY "<KEY>" ...
```

11.3.1.2.2.2. Read The new created PDP:
```
rpc rpc-apn-read apn-read
```

---

11.3.1.2.3. Additional Read Commands for PDP Context Query

11.3.1.2.3.1. Read First Entry:
```
rpc rpc-apn-first apn-first
```

11.3.1.2.3.2. Read Next Entry (Using Reference PDP Context ID):
```
rpc rpc-apn-next apn-next
```

11.3.1.2.3.3. Read Last Entry:
```
rpc rpc-apn-last apn-last
```

11.3.1.2.3.4 Read Previous Entry (Using Reference PDP Context ID):
```
rpc rpc-apn-prev apn-prev
```

---


### 11.3.2. APN Creation for LTE (PDN ID)
----------------------------------------

11.3.2.1. Read QOS Template PDN ID QoS parameters

11.3.2.1.1. Read Request:
```
rpc rpc-apn-read apn-read KEY "<KEY>" read-from apn-pdn
```

---

11.3.2.2. ADD new PDN ID with QOS Template PDN ID QoS parameters

11.3.2.2.1. Add Request:
```
rpc rpc-apn-pdn-add apn-pdn-add KEY "<KEY>" APN_NAME <APN_NAME>
```

---

11.3.2.3. READ the newly added PDN ID

11.3.2.3.1. Read Request:
```
rpc rpc-apn-read apn-read
```

---

11.3.2.4. Additional Read Commands for APN Configuration Query

11.3.2.4.1. Read First Entry:
```
rpc rpc-apn-first apn-first
```

11.3.2.4.2. Read Next Entry (Using Reference APN Configuration ID):
```
rpc rpc-apn-next apn-next
```

11.3.2.4.3. Read Last Entry:
```
rpc rpc-apn-last apn-last
```

11.3.2.4.4. Read Previous Entry (Using Reference APN Configuration ID):
```
rpc rpc-apn-prev apn-prev
```

---


## 11.4. Generated standalone RPCs
---------------------------------

### 11.4.1. Execute CMD-`<ENTITY>` RPCs:
-------------------------------------

Usage of all RPC actions starting with "CMD-" prefix is similar:
```
rpc rpc-CMD-<ENTITY> CMD-<ENTITY> cmd-action <cmd-action:AddCommand|UpdateCommand|ReadCommand|DeleteCommand> ...
```

- The "cmd-action" element is mandatory as it states the action to be performed;
  "cmd-action" is used internally by the NED and is not sent to the device;
  all other elements/parameters are used to generate the request.
- The KEY for action is madantory (it is marked with "KEY ::" in the description).

---


## 11.5. Roaming Restriction
---------------------------

### 11.5.0. Navigation
---------------------

11.5.0.1. Update/view current navigation params:
```
rpc rpc-roam-rest-params roam-rest-params
```

11.5.0.2. View navigation stored data (from ncs-root/first-level mode):
```
show devices device <device-name> box ROAMRESTCOS
```

---

### 11.5.1. Additional Read Commands for Roaming Restriction Query
-----------------------------------------------------------------

The KEY from response will be saved to be used for next navigation requests

11.5.1.1. Read Request:
```
rpc rpc-roam-rest-read roam-rest-read KEY "<KEY>"
```

11.5.1.2. Read First Entry:
```
rpc rpc-roam-rest-first roam-rest-first
```

11.5.1.3. Read Next Entry:
```
rpc rpc-roam-rest-next roam-rest-next
```

11.5.1.4. Read Last Entry:
```
rpc rpc-roam-rest-last roam-rest-last
```

11.5.1.5. Read Previous Entry:
```
rpc rpc-roam-rest-prev roam-rest-prev
```

---
