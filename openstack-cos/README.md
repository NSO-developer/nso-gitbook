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
  8. How to report NED issues
  9. Openstack IDs store in NED
  10. Miscellaneous
  ```


# 1. General
------------

  This document describes the openstack-cos NED.

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
  | partial-sync-from         | no        | Not possible to support partial-sync due to dependency object    |
  |                           |           | UUID                                                             |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Check README.md section 'Built in live-status actions'           |
  |                           |           |                                                                  |
  | live-status show          | yes       | Check README.md section 'Built in live-status show'              |
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
  | OpenStack                 | Stein           | COS    |                                                   |
  |                           |                 |        |                                                   |
  | OpenStack                 | Train           | COS    |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-openstack-cos-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-openstack-cos-1.0.1.signed.bin
      > ./ncs-6.0-openstack-cos-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-openstack-cos-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-openstack-cos-1.0.1.tar.gz
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
     `openstack-cos-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-openstack-cos-1.0.1.tar.gz
     > ls -d */
     openstack-cos-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package openstack-cos-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package openstack-cos-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-openstack-cos-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package openstack-cos-gen-1.0
      result true
   }
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
               /tmp/ned-package-store/ncs-6.0-openstack-cos-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-openstack-cos-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install openstack-cos-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-openstack-cos-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-openstack-cos-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id openstack-cos-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
  - If following settings has been configured differently than
    default in OpenStack it is possible to set them as well:

    ```
    # devices device openstack ned-settings openstack-cos connection remote-protocol <default=http>
    # devices device openstack ned-settings openstack-cos connection domain-name <default=default>
    # devices device openstack ned-settings openstack-cos connection identity-port <default=5000>
    # devices device openstack ned-settings openstack-cos connection identity-api-path <default=v3>
    # devices device openstack ned-settings openstack-cos connection networking-port <default=9696>
    # devices device openstack ned-settings openstack-cos connection networking-api-path <default=v2.0>
    # devices device openstack ned-settings openstack-cos connection image-port <default=9292>
    # devices device openstack ned-settings openstack-cos connection image-api-path <default=v2.0>
    # devices device openstack ned-settings openstack-cos connection image-port <default=8774>
    # devices device openstack ned-settings openstack-cos connection image-api-path <default=v2.1>
    # commit
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

  `$NSO_RUNDIR/logs/ned-openstack-cos-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings openstack-cos logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings openstack-cos logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.openstack \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings openstack-cos logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings openstack-cos logger java true
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
  admin@ncs(config)# devices device openstack-1 config
  admin@ncs(config-config)# projects service
  admin@ncs(config-projects-service)# networks test-network
  admin@ncs(config-networks-test-network)# admin_state_up true
  admin@ncs(config-networks-test-network)# provider_network_type gre
  admin@ncs(config-networks-test-network)# provider_segmentation_id 123
  admin@ncs(config-networks-test-network)# router_external false
  admin@ncs(config-networks-test-network)# shared false
  ```

  See what you are about to commit:

   ```
   native {
       device {
           name dev-1
           data POST http://x.x.x.x:5000/v3/projects
                {
                    "project":{
                        "name":"service",
                        "description":"",
                        "enabled":true,
                        "is_domain":false,
                        "domain_id":"default"
                    }
                }
                POST http://x.x.x.x:9696/v2.0/networks
                {
                    "network":{
                        "name":"test-network",
                        "admin_state_up":true,
                        "provider:segmentation_id":123,
                        "provider:network_type":"gre",
                        "router:external":false,
                        "shared":false,
                        "project_id":""
                    }
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

  ## 5.1 get-any
  ---------------

  This action can be used to get any object from device.

  ```
  # devices device dev-1 live-status openstack-cos-stats:exec get-any ?
  Possible completions:
    api-type   API type (mandatory)
    url        Url (mandatory)
  ```

  Example-1:

  ```
  # devices device dev-1 live-status openstack-cos-stats:exec get-any api-type \
      image url "/images?name=cirros-0.3.5-x86_64-disk"
  result <json-result>
  ```

  Example-2:

  ```
  # devices device dev-1 live-status openstack-cos-stats:exec get-any api-type volume \
      url /</openstack-id-store/projects{admin}/id>/volumes/</openstack-id-store/projects{admin}/volumes{keep_ned_volume}/id>
  ```

  NED already store UUIDs in /openstack-id-store/ path. If url contains any UUID,
  use right oper-id-store path instead of UUID. NED will replace oper-id-store path to UUID.
  NED will convert above url to /project_uuid/volumes/volume_uuid

  NOTE: oper-id-store path should be valid NCS config path, and it should be inside <>.
  NOTE: URL should not contain IP, port and base version, i.e `http://<IP>:<PORT>/<VERSION>`, NED will add this.


  ## 5.2 post-any
  ---------------

  This action can be used to create any object on device.

  ```
  # devices device dev-1 live-status openstack-cos-stats:exec post-any ?
  Possible completions:
    api-type   API type (mandatory)
    url        Url (mandatory)
    json-data  Json data (mandatory)
  ```

  ```
  # devices device dev-1 live-status openstack-cos-stats:exec post-any api-type identity \
      url /roles json-data "{'role': { 'name': 'ned_role', 'description': 'ned_role' } }"
  result {"role": {"domain_id": null, "description": "ned_role", "id": "94828c07aa4b412ca68909444e7826de", \
  "links": {"self": "http://IP:PORT/v3/roles/94828c07aa4b412ca68909444e7826de"}, "name": "ned_role"}}
  ```

  NOTE-1: url should not contain ip, port and base version, i.e `http://<IP>:<PORT>/<VERSION>`, NED will add this.

  NOTE-2: There are some limitations when you execute 'post-any' action in NSO CLI terminal.
          1) JSON should not contain any double quote, use single quote instead. (check example above)
          2) JSON should not contain any line breaks, must be single line.

  NOTE-3: Above limitations only for NSO CLI terminal, it is not a problem,
          if you execute 'post-any' action through NSO API (Java). JSON input can contain
          double quote and line breaks.

  NOTE-4: There are some common limitations to this action in both NSO terminal and NSO API.
          1) JSON must be complete and valid.

  ## 5.3 delete-any
  -----------------

  This action can be used to delete any object on device.

  ```
  # devices device dev-1 live-status openstack-cos-stats:exec delete-any ?
  Possible completions:
    api-type   API type (mandatory)
    url        Url (mandatory)
  ```

  Example-1:

  ```
  # devices device dev-1 live-status openstack-cos-stats:exec delete-any api-type identity url /roles/<role_id>
  result successful
  ```

  NOTE: url should not contain ip, port and base version, i.e `http://<IP>:<PORT>/<VERSION>`, NED will add this.

  ## 5.4 put-any
  ---------------

  This action can be used to update any object on device.

  ```
  # devices device dev-1 live-status openstack-cos-stats:exec put-any ?
  Possible completions:
    api-type   API type (mandatory)
    url        Url (mandatory)
    json-data  Json data (mandatory)
  ```

  ```
  # devices device dev-1 live-status openstack-cos-stats:exec put-any api-type compute \
      url /os-services/disable json-data "{'binary': 'nova-compute' , 'host' : 'devstack1' }"
  result {"service": {"status": "disabled", "binary": "nova-compute", "host": "devstack1"}}
  ```

  NOTE-1: url should not contain ip, port and base version, i.e `http://<IP>:<PORT>/<VERSION>` NED will add this.

  NOTE-2: There are some limitations when you execute 'put-any' action in NSO CLI terminal.
          1) JSON should not contain any double quote, use single quote instead. (check example above)
          2) JSON should not contain any line breaks, must be single line.

  NOTE-3: Above limitations only for NSO CLI terminal, it is not a problem,
          if you execute 'put-any' action through NSO API (Java). JSON input can contain
          double quote and line breaks.

  NOTE-4: There are some common limitations to this action in both NSO terminal and NSO API.
          1) JSON must be complete and valid.

  ## 5.5 upload-image
  -------------------

  Uploading image is not supported via config data model. User has to use following action to upload image to openstack.

  ```
  # devices device dev-1 live-status openstack-cos-stats:exec upload-image \
      image-name <image-name> path-to-image "/home/user/filename"
  ```

  ## 5.6 import-image
  -------------------

  Example:

  ```
  # devices device dev-1 live-status openstack-cos-stats:exec import-image image-name \
     <image-name> import-method web-download uri "https://download.cirros-cloud.net/0.4.0/cirros-0.4.0-ppc64le-disk.img"
  ```

  ## 5.7 set-user-password
  ------------------------

  Setting user password is not supported via config data model. Use following action to configure password for a user.

  ```
  # devices device dev-1 live-status exec set-user-password user-name <user-name> password <password>
  ```

  ## 5.8 update-volume-bootable-status
  ------------------------------------

  Update volume bootable status

  ```
  # devices device dev-1 live-status exec update-volume-bootable-status project-name \
     <project-name> volume-name <volume-name> bootable <bootable-status>
  ```

  ## 5.9 any-cli-actions
  ----------------------

  This generic action can be used to execute any cli commands on the device. check some examples below.

  ```
  # devices device dev-1 live-status exec cli-actions any-cli-actions \
      "ansible-playbook -i inventory openstack_verify.yml"

  # devices device dev-1 live-status exec cli-actions any-cli-actions \
      "cd devstack/ ; source openrc admin admin ; openstack image list"
  ```

  To execute multiple commands, separate them with " ; "
  NOTE: Must be a white space on either side of the comma.

  NOTE: To execute cli-actions user must configure following 'cli-connection' ned-settings.

  ```
  # devices device dev-1 ned-settings openstack-cos cli-connection enable true
  # devices device dev-1 ned-settings openstack-cos cli-connection remote-connection-type <ssh|telnet>
  # devices device dev-1 ned-settings openstack-cos cli-connection remote-prompt <".*(\$|#)[ ]?$">
  # devices device dev-1 port <ssh_port|telnet_port>
  ```

  If remote-connection-type is ssh, do fetch the host keys now:

  ```
  admin@ncs(config)# devices device dev-1 ssh fetch-host-keys
  ```

  With above ned-settings NED will use /devices/device/address, /devices/device/port, and
  /devices/device/authgroup to establish cli connection.

  Use the settings below if, for example, the CLI interface (OSC) has a different IP
  address than the OpenStack web server.

  ```
  # devices device dev-1 ned-settings openstack-cos cli-connection remote-ip <OSC_IP>
  # devices device dev-1 ned-settings openstack-cos cli-connection remote-port <OSC_PORT>
  ```

  NOTE: NED looks for cli-connection/remote-ip host-keys in /<user_home>/.ssh/known_hosts file.
  CLI connection will fail if no host-keys found for cli-connection/remote-ip.
  User must add 'remote-ip' host-keys in /<user_home>/.ssh/known_hosts or configure below settings.

  ```
  - connection ssh host-key known-hosts-file <string>
      Path to openssh formatted 'known_hosts' file containing valid host keys.

  - connection ssh host-key public-key-file <string>
      Path to openssh formatted public (.pub) host key file.
  ```

  Use the settings below if, for example, the CLI interface (OSC) has a different credentials
  than the OpenStack web server(/devices/device/authgroup).

  ```
  # devices device dev-1 ned-settings openstack-cos cli-connection remote-name <CLI_USER>
  # devices device dev-1 ned-settings openstack-cos cli-connection remote-password <CLI_USER_PASSWORD>
  ```


# 6. Built in live-status show
------------------------------

  NED supports following live-status show models:

  ```
  # show devices device dev-1 live-status openstack-operational-data ?
  Possible completions:
    hypervisors
    availabilityZoneInfo
    images
  ```


# 7. Limitations
----------------

  Openstack device have dynamic configuration behavior, i.e. extra configuration is added
  when specific configuration is created, deleted or modified.

  1. auto-created security_groups and security_group_rules

     When project created there some default security_groups and security_group_rules
     created by openstack automatically. This will lead to compare-config diff like below.

     ```
     admin@ncs# config
     Entering configuration mode terminal
     admin@ncs(config)# devices device dev-1 config openstack-cos:projects ned_test
     admin@ncs(config-openstack-cos:projects-ned_test)# commit dry-run outformat native
     native {
         device {
             name dev-1
             data POST http://10.147.46.140:5000/v3/projects
                  {"project": {
                    "domain_id": "default",
                    "is_domain": false,
                    "name": "ned_test",
                    "description": "",
                    "enabled": true
                  }}
         }
     }
     admin@ncs(config-openstack-cos:projects-ned_test)# commit
     Commit complete.
     admin@ncs(config-openstack-cos:projects-ned_test)# top devices device dev-1 compare-config
     diff
      devices {
          device dev-1 {
              config {
                  openstack-cos:projects ned_test {
     +                security_groups default {
     +                    description "Default security group";
     +                    security_group_rules default_egress_ipv6 {
     +                        direction egress;
     +                        ethertype IPv6;
     +                    }
     +                    security_group_rules default_egress_ipv4 {
     +                        direction egress;
     +                        ethertype IPv4;
     +                    }
     +                    security_group_rules default_ingress_ipv4 {
     +                        direction ingress;
     +                        ethertype IPv4;
     +                        remote_group_id default;
     +                    }
     +                    security_group_rules default_ingress_ipv6 {
     +                        direction ingress;
     +                        ethertype IPv6;
     +                        remote_group_id default;
     +                    }
     +                }
                  }
     ```

     To avoid compare diff, user must create default security_groups and
     default(default_egress_ipv4, default_egress_ipv6, default_ingress_ipv4 and default_ingress_ipv6)
     security_group_rules in same commit when project created.

     NOTE: default security_group_rules name must be default_egress_ipv4,
     default_egress_ipv6, default_ingress_ipv4 and default_ingress_ipv6


   2. There are some configs automatically created by openstack device,
      which can not be configured via NED in same commit. In this case,
      If required, the service application can do sync-from after commit.


   3. Public and private flavors/volume_types

      - Note that public flavors and volume_types can be only created in project-scope.

      - In GET public flavors/volume_types fetched in all projects.
        During sync-from NED fetches public flavors/volume_types only
        for project-scope to avoid any compare-config diff in NED.

      - Private flavors/volume_types fetched for each project. Note private flavors/volume_types
        are skipped in sync-from if private flavors/volume_types is not associated to any project.


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
     admin@ncs(config)# devices device dev-1 ned-settings openstack-cos logging level debug
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


# 9. Openstack IDs store in NED
-------------------------------

  - openstack-id-store

    Auto generated UUIDs are stored in following path.
    NOTE: following id-store is used by NED internally so do not modify it in other applications.

    ```
    # show devices device dev-1 openstack-id-store
    ```


  - kicker-openstack-id-store

    This id store can be used by service applications and kickers.

    ```
    # show devices device dev-1 kicker-openstack-id-store
    ```

    NOTE: check README-ned-settings.md to enable kicker-openstack-id-store in NED.

# 10. Miscellaneous
-------------------

   1. Plain object name to ID handling:

   NED internally converts human-readable object name to object ID,
   so user need to specify human-readable for any object references not ID references.

   2. multi-tenancy support:

   During connection only project-scope is authenticated. If user creates /projects/volumes,
   /projects/snapshots, /projects/servers in other project, NED will get auth token for a
   specific project and use that to create the object. NOTE: Specific project must be attached
   to admin role to use this multi-tenancy object creation.
