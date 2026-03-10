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
  9 Infoblox Perl API supoort
  ```


# 1. General
------------

  This document describes the infoblox-nios NED.

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
  | netsim                    | yes       |                                                                  |
  |                           |           |                                                                  |
  | check-sync                | no        |                                                                  |
  |                           |           |                                                                  |
  | partial-sync-from         | no        |                                                                  |
  |                           |           |                                                                  |
  | live-status actions       | yes       |                                                                  |
  |                           |           |                                                                  |
  | live-status show          | no        |                                                                  |
  |                           |           |                                                                  |
  | load-native-config        | no        |                                                                  |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Infoblox NIOS             | 3.x             |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-infoblox-nios-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-infoblox-nios-1.0.1.signed.bin
      > ./ncs-6.0-infoblox-nios-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-infoblox-nios-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-infoblox-nios-1.0.1.tar.gz
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
     `infoblox-nios-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-infoblox-nios-1.0.1.tar.gz
     > ls -d */
     infoblox-nios-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package infoblox-nios-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package infoblox-nios-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-infoblox-nios-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package infoblox-nios-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-infoblox-nios-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-infoblox-nios-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install infoblox-nios-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-infoblox-nios-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-infoblox-nios-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id infoblox-nios-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
  - Optionally set the ssl to accept-any
    ```
    admin@ncs(config)# devices device dev-1 ned-settings connection ssl accept-any
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

  `$NSO_RUNDIR/logs/ned-infoblox-nios-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings infoblox-nios logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings infoblox-nios logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.infoblox \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings infoblox-nios logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings infoblox-nios logger java true
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

  Command to create/update infoblox object:

  ```
  admin@ncs% set devices device <device-name> config infoblox:
  ```

  Possible completions:
    infoblox:record-a              infoblox:record-cname  infoblox:record-host
    infoblox:record-host_ipv4addr  infoblox:record-ptr    infoblox:zone_auth

  Command to delete object:

  ```
  admin@ncs% delete devices device <device-name> config infoblox:
  ```

  Possible completions:
    infoblox:record-a              infoblox:record-cname  infoblox:record-host
    infoblox:record-host_ipv4addr  infoblox:record-ptr    infoblox:zone_auth


# 5. Built in live-status actions
---------------------------------

   - All device specific actions are under live-status/exec. Currently follwoing actions are supported in NED.

  ### 5.1 get-all-grid-servicerestart-status (To get all grid service restart status)

  - Example:

  ```
  admin@ncs# devices device <device-name> live-status exec get-all-grid-servicerestart-status
  ```

  ### 5.2 get-single-grid-servicerestart-status (To get single grid service restart status)

  - Example:

  ```
  admin@ncs# devices device <device-name> live-status exec get-single-grid-servicerestart-status parent DNS
  ```

  ### 5.3 grid-servicerestart-request

  - Example:

  ```
  admin@ncs# devices device <device-name> live-status exec grid-servicerestart-request
  ```

  ### 5.4 restart-service

  - Example:

  ```
  admin@ncs# devices device <device-name> live-status exec restart-service grid-name Infoblox services DNS mode GROUPED
  ```

  ### 5.5 get-object (To get specifc object with spefic return fields)

  - Example:

  ```
  admin@ncs# devices device <device-name> live-status exec get-object object-type dtc-lbdn object-key test return_fields health,pools,disable
  ```

  ### 5.6 get-any-object (To get any object with query)

  - Example:

  ```
  admin@ncs# devices device <device-name> live-status infoblox-stats:exec get-any-object object-type grid query _return_type=json&_return_fields=audit_to_syslog_enable,external_syslog_server_enable,password_setting,security_banner_setting,security_setting,snmp_setting,syslog_facility,syslog_servers,syslog_size

  admin@ncs# devices device <device-name> live-status infoblox-stats:exec get-any-object object-type member

  admin@ncs# devices device <device-name> live-status infoblox-stats:exec get-any-object object-type member:dns query _return_fields%2B=max_cached_lifetime&_return_as_object=1
  ```

  NOTE:
  Example: /wapi/v2.6/member:dns?_return_fields%2B=max_cached_lifetime&_return_as_object=1
  User should not specify base API path i.e /wapi/v2.6/ and "?" for query.

  ### 5.7 request-network (To create a new network object using network:func:nextavailablenetwork)

  - Example:

  ```
  admin@ncs# devices device <device-name> live-status exec request-network cidr 1.2.3.0/24 subnet_mask 31
  result 1.2.3.136/31
  ```

  NOTE:
  Need to sync-from the device before the created network shows up in NSO


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  ### 7.1 Issue with handling special characters

  There are some issue with handling special characters \r and \n in NSO.
  To include \r and \n in config, user need to escape all \r and \n with "\".

  - Example-1:

  Assume config that we want to send to device:
  request "GET /StAtUs?p=SXssl_sso_test_com_https&mmember=1 HTTP/1.1\r\nHOST: sso.test.com\r\nConnection: Close\r\n\r\n"

  In NSO:
  We need to escape all \r and \n with "\" like below
  request "GET /StAtUs?p=SXssl_sso_test_com_https&mmember=1 HTTP/1.1\\r\\nHOST: sso.test.com\\r\\nConnection: Close\\r\\n\\r\\n"​

  NED will convert all \\r\\n to  \r\n before sending it to device and NED will convert all \r\n to \\r\\n in GET config(i.e sync-from)


  ```
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device d1 config infoblox:dtc-monitor-http test_slash
  admin@ncs(config-infoblox:dtc-monitor-http-test_slash)# request "GET /StAtUs?p=SXssl_sso_test_com_https&mmember=1 HTTP/1.1\\r\\nHOST: sso.test.com\\r\\nConnection: Close\\r\\n\\r\\n"
  admin@ncs(config-infoblox:dtc-monitor-http-test_slash)# commit dry-run outformat native
  native {
    device {
        name d1
        data POST https://x.x.x.x/wapi/v2.3.1/dtc:monitor:http
             {
               "request": "GET /StAtUs?p=SXssl_sso_test_com_https&mmember=1 HTTP/1.1\r\nHOST: sso.test.com\r\nConnection: Close\r\n\r\n",
               "name": "test_slash"
             }
    }
  }
  admin@ncs(config-infoblox:dtc-monitor-http-test_slash)# commit
  Commit complete.
  admin@ncs(config-infoblox:dtc-monitor-http-test_slash)#


  admin@ncs# show running-config devices device d1 config infoblox:dtc-monitor-http test_slash
  devices device d1
  config
  infoblox:dtc-monitor-http test_slash
   request "GET /StAtUs?p=SXssl_sso_test_com_https&mmember=1 HTTP/1.1\\r\\nHOST: sso.test.com\\r\\nConnection: Close\\r\\n\\r\\n"
  !
  !
  !
  admin@ncs#
  ```

  NOTE: user need to configure escape-special-char ned-settings(check section 3.6) if device expects esacape for special char as some NIOS version needs
  this behaviour. In this case \\r\\n send to device as it is.

  - Example-2:

  Assume config that we want to send to device:
  request "GET /StAtUs?p=SXssl_sso_test_com_https&mmember=1 HTTP/1.1\\r\\nHOST: sso.test.com\\r\\nConnection: Close\\r\\n\\r\\n"

  In NSO:
  We need to escape all \r and \n with "\" like below
  request "GET /StAtUs?p=SXssl_sso_test_com_https&mmember=1 HTTP/1.1\\r\\nHOST: sso.test.com\\r\\nConnection: Close\\r\\n\\r\\n"​

  ```
  admin@ncs# config
  Entering configuration mode terminal
  admin@ncs(config)# devices device d1 config infoblox:dtc-monitor-http test_slash
  admin@ncs(config-infoblox:dtc-monitor-http-test_slash)# request "GET /StAtUs?p=SXssl_sso_test_com_https&mmember=1 HTTP/1.1\\r\\nHOST: sso.test.com\\r\\nConnection: Close\\r\\n\\r\\n"
  admin@ncs(config-infoblox:dtc-monitor-http-test_slash)# commit dry-run outformat native
  native {
    device {
        name d1
        data POST https://x.x.x.x/wapi/v2.3.1/dtc:monitor:http
             {
               "request": "GET /StAtUs?p=SXssl_sso_test_com_https&mmember=1 HTTP/1.1\\r\\nHOST: sso.test.com\\r\\nConnection: Close\\r\\n\\r\\n",
               "name": "test_slash"
             }
    }
  }
  admin@ncs(config-infoblox:dtc-monitor-http-test_slash)# commit
  Commit complete.
  admin@ncs(config-infoblox:dtc-monitor-http-test_slash)#


  admin@ncs# show running-config devices device d1 config infoblox:dtc-monitor-http test_slash
  devices device d1
  config
  infoblox:dtc-monitor-http test_slash
   request "GET /StAtUs?p=SXssl_sso_test_com_https&mmember=1 HTTP/1.1\\r\\nHOST: sso.test.com\\r\\nConnection: Close\\r\\n\\r\\n"
  !
  !
  !
  admin@ncs#
  ```

  ### 7.2 Issue with network and networkcontainer objects

  This limitations occur because the NIOS device will change the configuration 
  out of band (some config is modified in response to other config being created or
  modified) in some situations.

    #### 7.2.1 Issue when creating networks
    Care must be taken when creating multiple networks. If the user creates two (or
    more) networks, and one network can be a container for the other (has a lower
    prefix length), the device will automatically create a new resource under 
    /networkcontainer REST endpoint.This behavior will result in differences between
    NSO configuration data base and the device.

    - Configure the networks:
    ```
    admin@ncs(config-device-infoblox-1)#     
    admin@ncs(config-device-infoblox-1)# config 
    admin@ncs(config-config)# infoblox:network 192.168.1.0/24
    admin@ncs(config-network-192.168.1.0/24)# comment "test comment!!"
    admin@ncs(config-network-192.168.1.0/24)# use_options true
    admin@ncs(config-network-192.168.1.0/24)# options dhcp-lease-time
    admin@ncs(config-options-dhcp-lease-time)# value 43200
    admin@ncs(config-options-dhcp-lease-time)# use_option true
    admin@ncs(config-options-dhcp-lease-time)# exit
    admin@ncs(config-network-192.168.1.0/24)# infoblox:network 192.168.0.0/16
    admin@ncs(config-network-192.168.0.0/16)# comment "test comment!!"
    admin@ncs(config-network-192.168.0.0/16)# use_options true
    admin@ncs(config-network-192.168.0.0/16)# options dhcp-lease-time
    admin@ncs(config-options-dhcp-lease-time)# value 43200
    admin@ncs(config-options-dhcp-lease-time)# use_option true
    admin@ncs(config-options-dhcp-lease-time)# exit
    admin@ncs(config-network-192.168.0.0/16)# commit dry-run 
    cli {
        local-node {
            data  devices {
                      device infoblox-1 {
                          config {
                 +            network 192.168.0.0/16 {
                 +                comment "test comment!!";
                 +                use_options true;
                 +                options dhcp-lease-time {
                 +                    value 43200;
                 +                    use_option true;
                 +                }
                 +            }
                 +            network 192.168.1.0/24 {
                 +                comment "test comment!!";
                 +                use_options true;
                 +                options dhcp-lease-time {
                 +                    value 43200;
                 +                    use_option true;
                 +                }
                 +            }
                          }
                      }
                  }
        }
    }
    admin@ncs(config-network-192.168.0.0/16)# commit
    Commit complete.
    ```

    - Even if the NED is executing a HTTP post to the /network REST endpoint, the device will automatically create a new resource under /networkcontainer endpoint. This will result in a diff:

    ```
    admin@ncs(config-config)# compare-config
    diff 
     devices {
         device infoblox-1 {
             config {
    +            networkcontainer 192.168.0.0/16 {
    +                comment "test comment!!";
    +                network_view default;
    +            }
    -            network 192.168.0.0/16 {
    -                comment "test comment!!";
    -                use_options true;
    -                options dhcp-lease-time {
    -                    value 43200;
    -                    use_option true;
    -                }
    -            }
             }
         }
     }
    ```

    #### 7.2.1.1 Issue workaround

    - To workaround this behavior you must be mindful of what config you want to create and what is already on the device.
    - To solve above example you should configure 192.168.0.0/16 as a networkcontainer and 192.168.1.0/24 as a network. 
      Please also by mindful of the "network_container" field in network configuration this is a read only field that is updated by the device when the network is under a networkcontainer. To avoid a diff between the device config and NSO config this field must be specified when creating a network.
    ```
    admin@ncs(config-config)# infoblox:networkcontainer 192.168.0.0/16
    admin@ncs(config-networkcontainer-192.168.0.0/16)# comment "test comment!!"
    admin@ncs(config-networkcontainer-192.168.0.0/16)# network_view default
    admin@ncs(config-networkcontainer-192.168.0.0/16)# exit
    admin@ncs(config-config)# 
    admin@ncs(config-config)# infoblox:network 192.168.1.0/24
    admin@ncs(config-network-192.168.1.0/24)# comment "test comment!!"
    admin@ncs(config-network-192.168.1.0/24)# use_options true
    admin@ncs(config-network-192.168.1.0/24)# network_container 192.168.0.0/16
    admin@ncs(config-network-192.168.1.0/24)# options dhcp-lease-time
    admin@ncs(config-options-dhcp-lease-time)# value 43200
    admin@ncs(config-options-dhcp-lease-time)# use_option true
    admin@ncs(config-options-dhcp-lease-time)# exit
    admin@ncs(config-options-dhcp-lease-time)# exit
    admin@ncs(config-network-192.168.1.0/24)# commit dry-run 
    cli {
        local-node {
            data  devices {
                      device infoblox-1 {
                          config {
                 +            networkcontainer 192.168.0.0/16 {
                 +                comment "test comment!!";
                 +                network_view default;
                 +            }
                 +            network 192.168.1.0/24 {
                 +                comment "test comment!!";
                 +                network_container 192.168.0.0/16;
                 +                use_options true;
                 +                options dhcp-lease-time {
                 +                    value 43200;
                 +                    use_option true;
                 +                }
                 +            }
                          }
                      }
                  }
        }
    }
    admin@ncs(config-network-192.168.1.0/24)# commit
    Commit complete.
    ```

    - Doing so will workaround this device behavior and there will be no diff:

    ```
    admin@ncs(config-config)# compare-config
    admin@ncs(config-config)#
    ```

  #### 7.2.2 Issue when deleting networkcontainers

  Care must be taken when deleting a networkcontainer because the device wil also delete all the networkcontainers and networks that reside under it:

  - Initial config:
  ```
    networkcontainer 192.0.0.0/8
     comment      "test comment!!"
     network_view default
    !
    networkcontainer 192.168.0.0/16
     comment      "test comment!!"
     network_view default
    !
    network 192.168.1.0/24
     comment           "test comment!!"
     network_container 192.168.0.0/16
     use_options       true
     options dhcp-lease-time
      value      43200
      use_option true
     !
    ! 
  ```

  - Delete networkcontainer 192.0.0.0/8
  ```
  admin@ncs(config-config)# no networkcontainer 192.0.0.0/8 
  admin@ncs(config-config)# commit 
  Commit complete.
  admin@ncs(config-config)# compare-config
  diff 
   devices {
       device infoblox-1 {
           config {
  -            networkcontainer 192.168.0.0/16 {
  -                comment "test comment!!";
  -                network_view default;
  -            }
  -            network 192.168.1.0/24 {
  -                comment "test comment!!";
  -                network_container 192.168.0.0/16;
  -                use_options true;
  -                options dhcp-lease-time {
  -                    value 43200;
  -                    use_option true;
  -                }
  -            }
           }
       }
   }
  ```

  As it can be seen the device also deleted networkcontainer 192.168.0.0/16 and network 192.168.1.0/24.

  #### 7.2.2.1 Issue workaround
   To workaround this device limitation you must be mindful of all network containers
    and networks that reside under the network container that you want to delete and also delete them:

  ```
  admin@ncs(config-config)# no infoblox:networkcontainer 192.0.0.0/8
  admin@ncs(config-config)# no infoblox:networkcontainer 192.168.0.0/16
  admin@ncs(config-config)# no infoblox:network 192.168.1.0/24
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device infoblox-1 {
                        config {
               -            networkcontainer 192.0.0.0/8 {
               -                comment "test comment!!";
               -                network_view default;
               -            }
               -            networkcontainer 192.168.0.0/16 {
               -                comment "test comment!!";
               -                network_view default;
               -            }
               -            network 192.168.1.0/24 {
               -                comment "test comment!!";
               -                network_container 192.168.0.0/16;
               -                use_options true;
               -                options dhcp-lease-time {
               -                    value 43200;
               -                    use_option true;
               -                }
               -            }
                        }
                    }
                }
      }
  }
  admin@ncs(config-config)# commit 
  Commit complete.
  admin@ncs(config-config)# compare-config
  admin@ncs(config-config)# 
  ```

  #### 7.2.3 Issue when creating networkcontainers for existing networks

  This issue manifests itself when reverting the config and its cause is the same device behavior of automatically deleting all that reside under a network container that is deleted.

  - Initial config:

  ```
    network 192.168.1.0/24
     comment           "test comment!!"
     use_options       true
     options dhcp-lease-time
      value      43200
      use_option true
     !
    !
  ```

  - We create a networkcontainer for this network and update the network_container field to avoid a diff:

  ```
  admin@ncs(config-config)# infoblox:networkcontainer 192.168.0.0/16
  admin@ncs(config-networkcontainer-192.168.0.0/16)# comment "test comment!!"
  admin@ncs(config-networkcontainer-192.168.0.0/16)# network_view default
  admin@ncs(config-networkcontainer-192.168.0.0/16)# exit
  admin@ncs(config-config)# 
  admin@ncs(config-config)# infoblox:network 192.168.1.0/24
  admin@ncs(config-network-192.168.1.0/24)# network_container 192.168.0.0/16
  admin@ncs(config-network-192.168.1.0/24)# exit
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device infoblox-1 {
                        config {
               +            networkcontainer 192.168.0.0/16 {
               +                comment "test comment!!";
               +                network_view default;
               +            }
                            network 192.168.1.0/24 {
               +                network_container 192.168.0.0/16;
                            }
                        }
                    }
                }
      }
  }
  admin@ncs(config-config)# commit 
  Commit complete.
  admin@ncs(config-config)# compare-config
  admin@ncs(config-config)#
  ```

  - Rollback the configuration to the previous commit 

  ```
  admin@ncs(config)# rollback configuration 10063   
  admin@ncs(config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device infoblox-1 {
                        config {
               -            networkcontainer 192.168.0.0/16 {
               -                comment "test comment!!";
               -                network_view default;
               -            }
                            network 192.168.1.0/24 {
               -                network_container 192.168.0.0/16;
                            }
                        }
                    }
                }
      }
  }
  admin@ncs(config)# commit 
  Commit complete.
  admin@ncs(config)# devices device infoblox-1 
  admin@ncs(config-device-infoblox-1)# compare-config
  diff 
   devices {
       device infoblox-1 {
           config {
  -            network 192.168.1.0/24 {
  -                comment "test comment!!";
  -                use_options true;
  -                options dhcp-lease-time {
  -                    value 43200;
  -                    use_option true;
  -                }
  -            }
           }
       }
   }

  ```

  - The network under the container is no more on the device, and the NED is out of sync.

  #### 7.2.3.1 Issue workaround

  To workaround this limitation you must avoid creating containers for existing networks if you plan to revert the configuration.
  Create the networkcontainer and networks that reside under it  at the same time.


  ```
    admin@ncs(config-config)# infoblox:networkcontainer 192.168.0.0/16
    admin@ncs(config-networkcontainer-192.168.0.0/16)# comment "test comment!!"
    admin@ncs(config-networkcontainer-192.168.0.0/16)# network_view default
    admin@ncs(config-networkcontainer-192.168.0.0/16)# exit
    admin@ncs(config-config)# 
    admin@ncs(config-config)# infoblox:network 192.168.1.0/24
    admin@ncs(config-network-192.168.1.0/24)# comment "test comment!!"
    admin@ncs(config-network-192.168.1.0/24)# use_options true
    admin@ncs(config-network-192.168.1.0/24)# network_container 192.168.0.0/16
    admin@ncs(config-network-192.168.1.0/24)# options dhcp-lease-time
    admin@ncs(config-options-dhcp-lease-time)# value 43200
    admin@ncs(config-options-dhcp-lease-time)# use_option true
    admin@ncs(config-options-dhcp-lease-time)# exit
    admin@ncs(config-options-dhcp-lease-time)# exit
    admin@ncs(config-network-192.168.1.0/24)# commit dry-run 
    cli {
        local-node {
            data  devices {
                      device infoblox-1 {
                          config {
                 +            networkcontainer 192.168.0.0/16 {
                 +                comment "test comment!!";
                 +                network_view default;
                 +            }
                 +            network 192.168.1.0/24 {
                 +                comment "test comment!!";
                 +                network_container 192.168.0.0/16;
                 +                use_options true;
                 +                options dhcp-lease-time {
                 +                    value 43200;
                 +                    use_option true;
                 +                }
                 +            }
                          }
                      }
                  }
        }
    }
    admin@ncs(config-network-192.168.1.0/24)# commit
    Commit complete.
  admin@ncs(config-config)# top rollback configuration 10066   
  admin@ncs(config-config)# commit dry-run 
  cli {
      local-node {
          data  devices {
                    device infoblox-1 {
                        config {
               -            networkcontainer 192.168.0.0/16 {
               -                comment "test comment!!";
               -                network_view default;
               -            }
               -            network 192.168.1.0/24 {
               -                comment "test comment!!";
               -                network_container 192.168.0.0/16;
               -                use_options true;
               -                options dhcp-lease-time {
               -                    value 43200;
               -                    use_option true;
               -                }
               -            }
                        }
                    }
                }
      }
  }
  admin@ncs(config-config)# commit 
  Commit complete.
  admin@ncs(config-config)# compare-config
  admin@ncs(config-config)# 
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
     admin@ncs(config)# devices device dev-1 ned-settings infoblox-nios logging level debug
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


# 9 Infoblox Perl API supoort

From NED version 3.4.0, NED have support for managing pool configs using infoblox perl API.

There are some required perl modules need to be installed to use this feature.

1) install infoblox perl module:

To install the Infoblox DMAPI packages on a UNIX management system, first download and install the API package from:

https://<ip_addr>/api/dist/CPAN/authors/id/INFOBLOX/

After you download the package, extract it to a temporary directory with:

```
tar xvfz Infoblox-xxxxxxx.tar.gz
```
Then execute the following commands:
```
cd Infoblox-xxxxxxx/
perl Makefile.PL
make
sudo make install
```
Optionally, before you install, test the package by running:
```
make test
```

The infoblox installation is complete.

2) sudo apt-get install libjson-perl
3) sudo apt-get install libcrypt-ssleay-perl
4) sudo apt-get install libxml-libxml-perl

Also we need use-perl-for-pool-object ned-settings to use this feature.
