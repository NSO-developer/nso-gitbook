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
  ```


# 1. General
------------

  This document describes the fortinet-fmg NED.

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
  | netsim                    | yes       | Simulate device using NED yang model over NETCONF protocol       |
  |                           |           |                                                                  |
  | check-sync                | yes       | Use a snapshot of the full running config for calculation        |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | NED fetches partial config from device for given NSO key path    |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Check README.md section 'Built in live-status actions'           |
  |                           |           |                                                                  |
  | live-status show          | no        | Use 'live-status actions' any instead.                           |
  |                           |           |                                                                  |
  | load-native-config        | no        | This feature commonly not supported in generic NEDs, only        |
  |                           |           | supported in CLI based NEDs.                                     |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | FortiManager              | 5.x, 6.x, 7.x   |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-fortinet-fmg-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-fortinet-fmg-1.0.1.signed.bin
      > ./ncs-6.0-fortinet-fmg-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-fortinet-fmg-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-fortinet-fmg-1.0.1.tar.gz
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
     `fortinet-fmg-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-fortinet-fmg-1.0.1.tar.gz
     > ls -d */
     fortinet-fmg-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package fortinet-fmg-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package fortinet-fmg-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-fortinet-fmg-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package fortinet-fmg-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/fortinet-fmg-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-fortinet-fmg-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-fortinet-fmg-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install fortinet-fmg-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-fortinet-fmg-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-fortinet-fmg-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id fortinet-fmg-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
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

  `$NSO_RUNDIR/logs/ned-fortinet-fmg-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings fortinet-fmg logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings fortinet-fmg logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.fortimanager \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings fortinet-fmg logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings fortinet-fmg logger java true
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

  ```
  admin@ncs(config)# devices device dev-1 config
  admin@ncs(config-config)# adom root
  admin@ncs(config-adom-root)# policy-package default
  admin@ncs(config-policy-package-default)# type pkg
  admin@ncs(config-policy-package-default)# firewall-policy 1
  admin@ncs(config-firewall-policy-1)# name firewall-policy-1
  admin@ncs(config-firewall-policy-1)# srcintf [ any ]
  admin@ncs(config-firewall-policy-1)# dstintf [ any ]
  admin@ncs(config-firewall-policy-1)# srcaddr [ all ]
  admin@ncs(config-firewall-policy-1)# dstaddr [ all ]
  admin@ncs(config-firewall-policy-1)# schedule always
  admin@ncs(config-firewall-policy-1)# service [ PING ]
  admin@ncs(config-firewall-policy-1)# action 1
  admin@ncs(config-firewall-policy-1)# logtraffic 2
  admin@ncs(config-firewall-policy-1)# logtraffic-start 1
  admin@ncs(config-firewall-policy-1)# status 1
  admin@ncs(config-firewall-policy-1)# nat 0
  admin@ncs(config-firewall-policy-1)# comments "firewall-policy 1"
  admin@ncs(config-firewall-policy-1)# utm-status 0
  admin@ncs(config-firewall-policy-1)# ssl-ssh-profile no-inspection
  admin@ncs(config-firewall-policy-1)# profile-protocol-options default
  admin@ncs(config-firewall-policy-1)# exit
  ```

  See what you are about to commit:

   ```
   admin@ncs(config)# commit dry-run outformat native
   native {
       device {
           name dev-1
           data ADD
                {
                    "method":"add",
                    "params":[{
                        "url":"/pm/config/adom/root/pkg/default/firewall/policy",
                        "data":[{
                            "policyid":1,
                            "name":"firewall-policy-1",
                            "srcintf":"any",
                            "dstintf":"any",
                            "srcaddr":"all",
                            "dstaddr":"all",
                            "schedule":"always",
                            "service":"PING",
                            "action":1,
                            "logtraffic":2,
                            "logtraffic-start":1,
                            "status":1,
                            "nat":0,
                            "comments":"firewall-policy 1",
                            "global-label":"",
                            "ssl-ssh-profile":"no-inspection",
                            "profile-protocol-options":"default",
                            "utm-status":0
                        }]
                    }],
                    "session":"null",
                    "id":1
                }
       }
   }
   ```

  Commit new configuration in a transaction:

   ```
   # commit
   Commit complete.
   ```

  Verify that NCS is in-sync with the device:

   ```
   # devices device dev-1 check-sync
   result in-sync
   ```

  Compare configuration between device and NCS:

   ```
   # devices device dev-1 compare-config
   ```

  Note: if no diff is shown, supported config is the same in NSO as on the device.


# 5. Built in live-status actions
---------------------------------

  The NED has support for native FortiManager REST commands residing under device live-status.
  Presently, the following commands are supported:

  ```
  # devices device <device-name> live-status exec ?
  Possible completions:
    any        Execute any JSON commands
    exec-any   Execute any exec commands
    get-any    Execute any get commands
  ```

  - live-status 'any' command:

      This is command is used to execute any REST commands, valid json-input is mandatory

      To execute a command, run it in NSO exec mode like this:

       ```
       # devices device <device-name> live-status exec any json-input "{ 'method': 'get', \
          'params': [ { 'url': '/dvmdb/adom' } ],'session': 'session-id', 'id': 1 }"
       ```

      NOTE-1: There are some limitations when you execute 'any' action in NSO CLI terminal.
              1) JSON should not contain any double quote, use single quote instead. (check example above)
              2) JSON should not contain any line breaks, must be single line.

      NOTE-2: Above limitations only for NSO CLI terminal, it is not a problem,
              if you execute 'any' action through NSO API (Java). JSON input can contain
              double quote and line breaks.

      NOTE-3: There are some common limitations to this action in both NSO terminal and NSO API.
              1) JSON must be complete and valid.
              2) User must use session-id as value for 'session' attribute.
                 NED will change session-id to actual session hash id internally.

  - live-status 'get-any' command:

      This is command is used to execute any GET REST commands, valid GET url is mandatory.

      ```
      # devices device <device-name> live-status fortimanager-stats:exec get-any ?
        Possible completions:
        url       get url (mandatory)
        fields    Limit the output by returning only the attributes specified in the string array.
        loadsub   Enable or disable the return of any sub-objects.
        option    Set fetch option for the request.
      ```

      To execute above command, run it in NSO exec mode like this:

       ```
       # devices device <device-name> live-status exec get-any url /task/task/1

       # devices device <device-name> live-status fortimanager-stats:exec get-any \
           url /dvmdb/adom/root/device loadsub 10 option "object member" fields [ name flags ]
       ```

  - live-status 'exec-any' command:

      This is command is used to execute any exec REST commands, valid exec url is mandatory

      Example:

      ```
      {
        "method": "exec",
        "session": "session-id",
        "params": [
          {
            "url": "/dvmdb/adom/root/workspace/commit"
          }
        ],
        "verbose": 1
      }
      ```

      To execute above command, run it in NSO exec mode like this:

       ```
       # devices device <device-name> live-status exec exec-any url /dvmdb/adom/root/workspace/commit
       ```


# 6. Built in live-status show
------------------------------

  Use live-status exec any instead. Check README.md section 'Built in live-status actions'.


# 7. Limitations
----------------

  1. When workflow mode is enabled, there some Workflow_revision(/revision[name={Workflow_revision}])
     auto created on the device. To avoid diff, by default NED does not sync workflow revisions.

  2. NED does not support /adom/device create, due to very complex scenario/use case.

     Main problem when adding device is that, as soon API /dvm/cmd/add/device is executed FMG syncs
     fortigate configs into FMG database and which makes CDB config and FMG config differ(out-of-sync),
     which will create many issues during sync-to and commit operation.
     Technically it looks like /dvm/cmd/add/device (exec), is kind of action towards device, not typical
     config object, so we should treat /adom/device same way in NSO/NED, which means we should not consider
     YANG model /adom/device as config data, instead this just YANG structure to keep and support device sub-configs.

     There some workaround can be done for this use case, i.e user/service application can execute live-status
     action to create /adom/device via NED.

     1) Add device via NED live-status exec action.

     ```
     # devices device <device-name> live-status fortimanager-stats:exec any json-input \
         "{'method': 'exec', 'params': [ { 'data': { 'adom': 'root', 'device': { 'adm_pass': '<password>', \
         'adm_usr': 'admin','ip': '<ip>','name': '<name>', 'platform_str': 'FortiGate-VM64-KVM', 'sn': '<serial-number>', \
         'device action': 'promote_unreg'}}, 'url': '/dvm/cmd/add/device' }], 'session': 'session-id', 'id': 1}"
     ```

     2) Use same payload to register device (it only works when executing same payload twice towards FMG device in NED lab,
     so assuming first exec is for adding device and second execution to register/sync device)

     ```
     # devices device <device-name> live-status fortimanager-stats:exec any json-input \
         "{'method': 'exec', 'params': [ { 'data': { 'adom': 'root', 'device': { 'adm_pass': '<password>', \
         'adm_usr': 'admin','ip': '<ip>','name': '<name>', 'platform_str': 'FortiGate-VM64-KVM', 'sn': '<serial-number>', \
         'device action': 'promote_unreg'}}, 'url': '/dvm/cmd/add/device' }], 'session': 'session-id', 'id': 1}"
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
    - Access to a device where the issue can be reproduced by the Cisco NSO NED team.
      This typically means both read and write permissions are required.
      Pseudo access via tools like Webex, Zoom etc is not acceptable.
      However, it is ok with device access through VPNs, jump servers etc though.

  Do as follows to gather the necessary information needed for your device, here named 'dev-1':

  1. Enable full debug logging in the NED

     ```
     ncs_cli -C -u admin
     admin@ncs# configure
     admin@ncs(config)# devices device dev-1 ned-settings fortinet-fmg logging level debug
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

  6. Gather the reproduction report and a copy of the raw trace file
     containing data recorded when the issue happened.

  7. Contact the Cisco support and request to open a case. Provide the gathered files
     together with access details for a device that can be used by the
     Cisco NSO NED when investigating the issue.


  **Requests for new features and extensions of the NED are handled by the Cisco NSO NED team when
  applicable. Such requests shall also go through the Cisco support channel.**

  The following information is required for feature requests and extensions:

  1. A detailed use case description, with details like:
     - Data of interest
     - The kind of operations to be used on the data. Like: 'read', 'create', 'update', 'delete'
       and the order of the operation
     - Device APIs involved in the operations (For example: REST URLs and payloads)
     - Device documentation describing the operations involved

  2. Run sync-from # devices device dev-1 sync-from (if relevant)

  3. Attach the raw trace to the ticket (if relevant)

  4. Access to a device that can be used by the Cisco NSO NED team for testing and verification
     of the new feature. This usually means that both read and write permissions are required.
     Pseudo access via tools like Webex, Zoom etc is not acceptable. However, it is ok with access
     through VPNs, jump servers etc.


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

