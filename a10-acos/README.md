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
  11. Aflex scripts
  12. NED Secrets - Securing your Secrets
  13. Device HA configuration considerations
  ```


# 1. General
------------

  This document describes the a10-acos NED.

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
  | netsim                    | yes       | Default emulated device: AX Series Advanced Traffic Manager      |
  |                           |           | v2.6.1-GR1                                                       |
  |                           |           |                                                                  |
  | check-sync                | yes       | check-sing using trans-id                                        |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | This feature is supported by filtering the needed config from a  |
  |                           |           | full show (device does not support partial show)                 |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Supports most of the device needed actions                       |
  |                           |           |                                                                  |
  | live-status show          | no        | The NED does not implement TTL-based data                        |
  |                           |           |                                                                  |
  | load-native-config        | no        |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```
  Custom NED Features
  ```
  +---------------------------+-----------+------------------------------------------------------------------+
  | Feature                   | Supported | Info                                                             |
  +---------------------------+-----------+------------------------------------------------------------------+
  | device partitions         | yes       | The NED supports device partitions by using config active-       |
  |                           |           | partition list                                                   |
  |                           |           |                                                                  |
  | ned-secrets               | yes       | NED supports device-enctypted password caching. Please check     |
  |                           |           | README.md                                                        |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Thunder Series TH3030S    | 2.7.1-GR1       | ACOS   | Hardware device                                   |
  | (th3030s-1)               |                 |        |                                                   |
  |                           |                 |        |                                                   |
  | Thunder Series TH3030S    | 2.7.2-P7-SP3    | ACOS   | Hardware device                                   |
  | (th3030s-2)               |                 |        |                                                   |
  |                           |                 |        |                                                   |
  | Thunder Series Unified    | 5.2.0           | ACOS   | Virtual device                                    |
  | Application Service       |                 |        |                                                   |
  | Gateway vThunder          |                 |        |                                                   |
  | (vThunder-1)              |                 |        |                                                   |
  |                           |                 |        |                                                   |
  | Thunder Series Unified    | 5.2.0           | ACOS   | Virtual device                                    |
  | Application Service       |                 |        |                                                   |
  | Gateway vThunder          |                 |        |                                                   |
  | (vThunder-2)              |                 |        |                                                   |
  |                           |                 |        |                                                   |
  | Thunder Series Unified    | 2.7.2-P4-SP1    | ACOS   | Virtual device                                    |
  | Application Service       |                 |        |                                                   |
  | Gateway vThunder          |                 |        |                                                   |
  | (vThunder-27)             |                 |        |                                                   |
  |                           |                 |        |                                                   |
  | AX Series Advanced        | 2.7.2-P10       | ACOS   | Virtual device                                    |
  | Traffic Manager vThunder  |                 |        |                                                   |
  | (vThunder-7)              |                 |        |                                                   |
  |                           |                 |        |                                                   |
  | Thunder Series Unified    | 4.1.4-GR1-P1    | ACOS   | Virtual device                                    |
  | Application Service       |                 |        |                                                   |
  | Gateway vThunder          |                 |        |                                                   |
  | (vThunder-8)              |                 |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-a10-acos-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-a10-acos-1.0.1.signed.bin
      > ./ncs-6.0-a10-acos-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-a10-acos-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-a10-acos-1.0.1.tar.gz
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
     `a10-acos-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-a10-acos-1.0.1.tar.gz
     > ls -d */
     a10-acos-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package a10-acos-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package a10-acos-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-a10-acos-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package a10-acos-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/a10-acos-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-a10-acos-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-a10-acos-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install a10-acos-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-a10-acos-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-a10-acos-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id a10-acos-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-a10-acos-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings a10-acos logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings a10-acos logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.a10 \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings a10-acos logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings a10-acos logger java true
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

  The following is an example of configuration data (CLI NED commands) that can be sent to an a10-acos device:
  ```
  system resource-usage class-list-ipv6-addr-count 600000
  system per-vlan-limit mcast 10000
  system per-vlan-limit unknown-ucast 10000

  snmp-server enable traps slb application-buffer-limit
  snmp-server enable traps slb server-conn-limit
  snmp-server enable traps slb server-conn-resume
  snmp-server enable traps slb server-down
  snmp-server enable traps slb server-up
  snmp-server enable traps slb service-conn-limit
  snmp-server enable traps slb service-conn-resume
  snmp-server enable traps slb service-down
  snmp-server enable traps slb service-up
  snmp-server enable traps slb vip-connlimit
  snmp-server enable traps slb vip-connratelimit
  snmp-server enable traps slb vip-port-connlimit
  snmp-server enable traps slb vip-port-connratelimit
  snmp-server enable traps slb vip-port-down
  snmp-server enable traps slb vip-port-up
  snmp-server enable traps system control-cpu-high
  snmp-server enable traps system fan
  snmp-server enable traps system high-disk-use
  snmp-server enable traps system high-memory-use
  snmp-server enable traps system high-temp
  snmp-server enable traps system pri-disk
  snmp-server enable traps system sec-disk
  snmp-server enable traps system shutdown
  snmp-server enable traps system start
  snmp-server enable traps vrrp-a active
  snmp-server enable traps vrrp-a standby 

  access-list 100 permit ip any any

  interface ethernet 1
  l3-vlan-fwd-disable 
  load-interval 200 
  enable 
  icmp-rate-limit 1000 lockup 2000 200 
  access-list 100 in
  ip cache-spoofing-port 
  ip helper-address 2.2.2.1
  ip helper-address 2.2.3.1
  ip nat inside 
  ip nat outside 
  ip router isis ASD 
  ipv6 address fe01::/64 anycast
  ipv6 address fe02::/64 anycast 
  ipv6 nat inside 
  ipv6 nat outside 

  interface ethernet 2
  icmp-rate-limit 1000

  slb server SERVER-COVERAGE-1 1.1.1.1
  slb server SERVER-COVERAGE-2 2.1.1.1

  slb service-group SERV-GROUP-COVERAGE-1 tcp 
  slb service-group SERV-GROUP-COVERAGE-2 tcp 
  slb service-group SERV-GROUP-COVERAGE-3 tcp 
  slb service-group SERV-GROUP-COVERAGE-4 tcp 
  slb service-group SERV-GROUP-COVERAGE-5 tcp 
  slb service-group SERV-GROUP-COVERAGE-6 tcp 
  slb service-group SERV-GROUP-COVERAGE-7 tcp 
  slb service-group SERV-GROUP-COVERAGE-8 tcp 
  slb service-group SERV-GROUP-COVERAGE-9 tcp 
  slb service-group SERV-GROUP-COVERAGE-10 tcp 
  slb service-group SERV-GROUP-COVERAGE-11 tcp 
  slb service-group SERV-GROUP-COVERAGE-12 tcp 
  slb service-group SERV-GROUP-COVERAGE-13 tcp 
  slb service-group SERV-GROUP-COVERAGE-14 tcp 
  slb service-group SERV-GROUP-COVERAGE-15 tcp 
  slb service-group SERV-GROUP-COVERAGE-16 tcp 
  slb service-group SERV-GROUP-COVERAGE-17 tcp 

  slb template persist cookie SLB-PERSIST-COOKIE-1
  slb template persist cookie SLB-PERSIST-COOKIE-2
  slb template persist cookie SLB-PERSIST-COOKIE-3
  slb template persist source-ip SLB-PERSIST-SRCIP-1
  slb template persist source-ip SLB-PERSIST-SRCIP-2
  slb template persist source-ip SLB-PERSIST-SRCIP-3
  slb template persist source-ip SLB-PERSIST-SRCIP-4
  slb template persist source-ip SLB-PERSIST-SRCIP-5
  slb template port SLB-TMP-PORT-1
  slb template port SLB-TMP-PORT-2
  slb template port SLB-TMP-PORT-3
  slb template port SLB-TMP-PORT-4

  slb virtual-server SLB-VIRT-SERVER-COVERAGE-1 5.1.1.1 
  slb virtual-server SLB-VIRT-SERVER-COVERAGE-2 5.2.1.1 
  slb virtual-server SLB-VIRT-SERVER-COVERAGE-3 5.3.1.1 /24 
  slb virtual-server SLB-VIRT-SERVER-COVERAGE-4 5.4.1.1 
  slb virtual-server SLB-VIRT-SERVER-COVERAGE-5 5.5.1.1 

  health monitor COVERAGE-HEALTH-1
  retry 5 
  up-retry 5 
  override-ipv4 1.2.3.5 
  override-ipv6 fe01::1 
  override-port 1000
  method https expect ASDASD  

  health monitor COVERAGE-HEALTH-2 
  method https expect response-code 100 

  health monitor COVERAGE-HEALTH-3
  method tcp port 1 send ASDASD response contains ASDASD
  ```


# 5. Built in live-status actions
---------------------------------

  There are two main categories of commands that can be sent using a10-acos NED: configuration commands (RPC's that are sent from the device configuration) and privileged commands (RPC's that are sent from privileged mode). 

  Following RPC's exemplify the two categories:
  ```
  top devices device a10-0 config config-actions action { action-payload "show running-config" }
  top devices device a10-0 live-status exec nonconfig-actions action { action-payload "show interface" }
  ```

  Each main RPC category also divides in the following sub-categories: simple commands that does not use additional prompts (eg "show configuration"), interactive commands that uses additional prompts (eg a RPC's that requests username/password or any other prompts) and internal NED commands, that does not interact with the device but with the NED. 

  The last category is supported but not implemented for a specific feature.
  Simple command format is as follows:
  ```
  action { action-payload "RPC CLI command" }
  ```

  Interactive command contains the simple command and adds the following list:
  ```
  action { action-payload "import bw-list bl1 use-mgmt-port scp://11.11.11.11/file" interaction { prompt-pattern "User name.*" value myuser } interaction { prompt-pattern Password.* value mypassword } interaction { prompt-pattern "Do you want to overwrite.*" value yes } interaction { prompt-pattern \"Do you want to save the remote host information.*\" value no } }
  ```

  In the above command, the interaction list defines each prompt that it is expected from the device, along with its corresponding value. Note that prompt-pattern is compiled in a regular expression, so special characters that are expected from prompts should be escaped. 
  The order of the interaction list definition is not important, but all the possible expected prompts should be defined. For example, in the above command, the prompt "Do you want to overwrite.*" is only active when the file exists.

  Internal commands looks the same as simple commands, but also contain the keyword "internal":
  ```
  action { action-payload "Internal RPC" internal }
  ```

  All the above command sub-categories can be chained and sent in the same request, by defining a list of actions:
  ```
  top devices device a10-0 live-status exec nonconfig-actions action { action-payload "show route" } action { action-payload "show interfaces" } action { action-payload "Internal RPC" internal }
  ```

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


# 6. Built in live-status show
------------------------------

  The NED does not support TTL-based live-status data


# 7. Limitations
----------------

  The NED CLI does not implement the device behavior 1 to 1, since the device is not a netconf-compatible device. Also, the NED may use yang model workarounds (like node alternative naming) in order to support device behavior.


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
     admin@ncs(config)# devices device dev-1 ned-settings a10-acos logging level debug
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
  > devices device dev-1 ned-settings a10-acos logger level debug
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

# 11. Aflex scripts
-------------------

In order to activate aflex scripts support, run the following command:

```
admin@ncs(config-config)# config-actions action { action-payload "running-config display aflex" }
```
Note: after running this command, it is mandatory to do a sync-from, since the device will introduce the aflex section in the running-config

Once the aflex is activated, aflex scripts can be managed.
Note: since the device aflex scripts are multi-liners, the script payload needs to be properly escaped by replacing newlines - eg '\n' character with '\\n'. Also double quote - eg " needs to be escaped: '"' -> '\"'
Also, every script should end in a '\n'
Note2: since aflex script is a type string leaf in the NED, the script content needs to be quoted:
```
admin@ncs(config-config)# aflex test2
admin@ncs(config-aflex-test2)# script "script-content\n"
```

For example, to create a new script that would look like this on the device:
```
vThunder(NOLICENSE)#show aflex test4
Name:                    test4
Syntax:                  Check
Virtual port:            No
Content:
when HTTP_RESPONSE {
  # Check Content-Data to avoid unnecessary collects
  if { [HTTP::header "Content-Type"] contains "text" } {
    HTTP::collect
  }
}
```
the equivalent config on the NED will look like this:
```
admin@ncs(config-config)# aflex test2
admin@ncs(config-aflex-test2)# script "when HTTP_RESPONSE {\n  # Check Content-Data to avoid unnecessary collects\n  if { [HTTP::header \"Content-Type\"] contains \"text\" } {\n    HTTP::collect\n  }\n}\n"
admin@ncs(config-aflex-test2)# commit dry-run outformat native
native {
    device {
        name vThunder-8
        data aflex create test2
             when HTTP_RESPONSE {
               # Check Content-Data to avoid unnecessary collects
               if { [HTTP::header "Content-Type"] contains "text" } {
                 HTTP::collect
               }
             }
             .
    }
```

Disabling aflex support is done by the following command:
```
admin@ncs(config-config)# config-actions action { action-payload "no running-config display aflex" }
```

# 12. NED Secrets - Securing your Secrets
-----------------------------------------

    It is best practice to avoid storing your secrets (e.g. passwords and
    shared keys) in plain-text, either on NSO or on the device. In NSO we
    support multiple encrypted datatypes that are encrypted using a local
    key, similarly many devices such as ALU-SR supports automatically
    encrypting all passwords stored on the device.

    Naturally, for security reasons, NSO in general has no way of
    encrypting/decrypting passwords with the secret key on the
    device. This means that if nothing is done about this we will
    become out of sync once we write secrets to the device.

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

    system
     security
      user admin
       access console
       console
        member administrative
       exit
       password <admin-password>

    this will be automatically encrypted by the device

    *A:VSR-7750>config# system security user "admin"
    *A:VSR-7750>config>system>security>user# info
    ----------------------------------------------
                password "$2y$10$fBSDYG2MHpdpCTDQhq7BE.ojwFR5z10g61PUqWaXb52GXg0Ge8d8W"
                access console
                console
                    member "administrative"
                exit
    ----------------------------------------------

    But the secrets management will store this new encrypted value in our `secrets` table:

      admin@ncs# show devices device dev-1 ned-settings secrets
      ID                                        ENCRYPTED                                                     REGEX
      ---------------------------------------------------------------------------------------------------------------
      /system/security/user_admin_/password/id  $2y$10$fBSDYG2MHpdpCTDQhq7BE.ojwFR5z10g61PUqWaXb52GXg0Ge8d8W  -

      which means that compare-config or sync-from will not show any
      changes and will not result in any updates to CDB". In fact, we can
      still see the unencrypted value in the device tree:

      admin@ncs(config-config)# show full sys sec user
      devices device dev-1
       config
        system
         security
          user admin
          access console
          console
           member administrative
          !
          password <admin-password>

    --- Increasing security with NSO-side encryption

    We have two alternatives, either we can manually encrypt our values using
    one of the NSO-encrypted types (e.g `aes-256-cfb-128-encrypted-string`) and
    set them to the tree, or we can recompile the NED to always encrypt secrets.

    --- Setting encrypted value

    Let us say we know that the NSO-encrypted string
      `$2y$10$7ova9fF/bRe9B9GUtjVpA.w5mfeXJXRHyV0KsSfg4XWE9j3Fcq3Qi`, we
    can then set it in the device tree as normal

      admin@ncs(config-config)# system security user admin password $2y$10$7ova9fF/bRe9B9GUtjVpA.w5mfeXJXRHyV0KsSfg4XWE9j3Fcq3Qi
      admin@ncs(config-config)# commit

    when commiting this value it will be decrypted and the plaintext will be written to the device.
    Unlike the previous example the plaintext is not visible in the device tree:

      admin@ncs(config-config)# show full sys sec user
      devices device dev-1
       config
        system
         security
          user admin
          access console
          console
           member administrative
          !
          password $2y$10$7ova9fF/bRe9B9GUtjVpA.w5mfeXJXRHyV0KsSfg4XWE9j3Fcq3Qi

    On the device side this plaintext value is of course encrypted
    with the device key, and just as before we store it in our
    `secrets` table:

      admin@ncs# show devices device dev-1 ned-settings secrets
      ID                                        ENCRYPTED                                                     REGEX
      ---------------------------------------------------------------------------------------------------------------
      /system/security/user_admin_/password/id  $2y$10$fBSDYG2MHpdpCTDQhq7BE.ojwFR5z10g61PUqWaXb52GXg0Ge8d8W  -

    We can see that this corresponds to the value set on the device.

    --- Auto-encrypting passwords in NSO

    To avoid having to pre-encrypt your passwords you can rebuild your NED in your OS
    command shell specifying an encrypted type for secrets using a command like:

    yourhost:~/ned-folder$ NEDCOM_SECRET_TYPE="tailf:aes-cfb-128-encrypted-string" make -C src/ clean all

    Or by adding the line `NED_EXTRA_BUILDFLAGS ?= NEDCOM_SECRET_TYPE=tailf:aes-cfb-128-encrypted-string`
    in top of the `Makefile` located in <alu-sr-folder>/src directory.

    Doing this means that even if the input to a password is a plaintext string, NSO will always
    encrypt it, and you will never see plain text secrets in the device tree.

    If we reload our example with the new NED all of the secrets are now encrypted:

      admin@ncs(config-config)# show full sys sec user
      devices device dev-1
       config
        system
         security
          user admin
          access console
          console
           member administrative
          !
          password $2y$10$7ova9fF/bRe9B9GUtjVpA.w5mfeXJXRHyV0KsSfg4XWE9j3Fcq3Qi



# 13. Device HA configuration considerations
------------------------------------------
A10-ACOS devices implements native support for high availability (HA) nodes by configuring one primary device as the active device and 1 to 8 passive devices to mirror the active device configuration and to take over the traffic when the active node becomes unavailable for some reasons.
The HA on the targeted devices is configured by properly setting the VRRP-A (A10-ACOS proprietary VRRP protocol) and VCS settings, defining the HA cluster.

In theory, it is possible to fully configure the HA cluster from NSO. However, impacted devices configurations suffer significant changes after HA activation.
This means that once the HA is active, the CDB configuration of all involved devices becomes out-of-sync.
Moreover, if the passive devices were also configured through NSO, those devices should not be used for future changes, as passive devices in a HA cluster are not allowed to change configuration via its management interface anymore - their configuration is maintained by the active device arbiter.

Here are some examples of configuration changes that will take effect as soon as the HA becomes active:

- interfaces numbering - before HA, interfaces look like this:
```
interface ethernet 1
 enable
exit
interface ethernet 2
 enable
exit
...............
interface ve 4096
exit
```

- after HA activation, all interfaces are renamed, adding the device-id before the interface id:
```
interface ethernet 1/1
 enable
exit
interface ethernet 1/2
 enable
exit
...........................
interface ethernet 2/1
 enable
exit
interface ethernet 2/2
 enable
exit
..........................
interface ve 1/4096
exit
interface ve 2/4096
exit
```

In order to controll certain configuration parts on the nodes of the HA, A10-ACOS devices provides 'device-context' command that allows to switch to a certain device configuration. 
For instance, it is expected that all the devices have a management interface, each device with its own id. The management interface config would look like this:

```
device-context 1
  interface management
    ip address 11.11.11.11 255.255.255.0
    ip default-gateway 11.11.11.1
  exit
exit
.......
device-context 2
  interface management
    ip address 11.11.11.12 255.255.255.0
    ip default-gateway 11.11.11.11
  exit
exit
```

It is worth noting that not all the A10-ACOS commands belong in a device-context, but there are certain comands that they will be automatically routed by the device in the appropriate device-context, even if the device-context is not explicitly given.
Since the NED is a best-effort implementation of the device behavior, there are certain configuration considerations that have to be taken into account here, otherwise the NED can end up in a compare-config scenario.

For example: 'interface ethernet x' command - although this command can be executed from any device-context, this will directly affect the root configuration of the active device.

- on a real device:
```
vThunder-1-vMaster[1/1](config:1)(NOLICENSE)#device-context 2
All the following configuration will go to device 2
vThunder-1-vMaster[1/1](config:2)(NOLICENSE)#interface ethernet 1/1
vThunder-1-vMaster[1/1](config:1-if:ethernet:1/1)(NOLICENSE)#name test
vThunder-1-vMaster[1/1](config:1-if:ethernet:1/1)(NOLICENSE)#show runn

................
interface ethernet 1/1
  name test
................
vThunder-1-vMaster[1/1](config:1-if:ethernet:1/1)(NOLICENSE)#
```
In the above example, even if the device-context 2 was activated, the interface ethernet config was routed to root device configuration.
This kind of behavior needs to be taken into account in the NED: for instance, a correct configuration of the 'interface ethernet 1/1' would be done in the root device configuration and not in the 'device-context 2' as in the example above. 

A similar example (but the other way around) is with the interface management configuration: although it is possible to configure the interface management from root config, the device will route the configuration to the device-context node.
For instance, if we configure the following in the NED:

```
admin@ncs(config-config)# access-list 103 permit tcp any any
admin@ncs(config-config)# interface management
admin@ncs(config-management)# access-list 103 in
admin@ncs(config-management)# commit dry-run outformat native
native {
    device {
        name vThunder-1
        data access-list 103 permit tcp any any
             interface management
              access-list 103 in
             exit
    }
}
admin@ncs(config-config)# commit
Commit complete.
```
Although the device accepts the interface management change, the device will process the change in the device-context. This can be seen by the following compare-config:
```
admin@ncs(config-config)# compare
diff
 devices {
     device vThunder-1 {
         config {
             interface {
                 management {
                     access-list {
-                        id 103;
-                        in;
                     }
                 }
             }
             device-context 1 {
                 interface {
                     management {
                         access-list {
+                            id 103;
+                            in;
                         }
                     }
                 }
             }
         }
     }
 }
```
Note: to avoid such a compare-config, one should properly configure the interface management under device-context 1 in the NED. For instance, the following NED config would be a correct commit:
```
admin@ncs(config-config)# device-context 1
admin@ncs(config-device-context-1)# interface management
admin@ncs(config-management)# access-list 103 in
admin@ncs(config-management)# commit dry-run outformat native
native {
    device {
        name vThunder-1
        data device-context 1
              interface management
               access-list 103 in
              exit
             device-context 1
    }
}
admin@ncs(config-management)#
```

In conclusion, when HA is enabled, special care needs to be taken when configuring the targeted device. As the NED is implemented as a best-effort device support, it is possible to end up in compare-config issues if the configuration is improperly managed from the NED stand point of view.
However, with the proper care for the HA configuration, the NED should be able to cover all the HA use-cases.
