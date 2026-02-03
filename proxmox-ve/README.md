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
  ```


# 1. General
------------

  This document describes the proxmox-ve NED.

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
  | Virtual Environment       | 8.1.4           |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-proxmox-ve-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-proxmox-ve-1.0.1.signed.bin
      > ./ncs-6.0-proxmox-ve-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-proxmox-ve-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-proxmox-ve-1.0.1.tar.gz
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
     `proxmox-ve-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-proxmox-ve-1.0.1.tar.gz
     > ls -d */
     proxmox-ve-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package proxmox-ve-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package proxmox-ve-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-proxmox-ve-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package proxmox-ve-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-proxmox-ve-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-proxmox-ve-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install proxmox-ve-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-proxmox-ve-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-proxmox-ve-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id proxmox-ve-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
  - Optionally set the ssl to accept-any
    ```
    admin@ncs(config)# devices device dev-1 ned-settings proxmox-ve connection ssl accept-any true
    ```

  - Regarding the remote-name, the device requires a format like "root@pam"

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

  `$NSO_RUNDIR/logs/ned-proxmox-ve-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings proxmox-ve logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings proxmox-ve logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.proxmoxve \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings proxmox-ve logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings proxmox-ve logger java true
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

  ## 4.1 Configure ve cluster sdn zones

  ```
  admin@ncs(config-config)# 
  ve cluster sdn zones tzon01
  bridge vmbr0
  tag    90
  mtu    100
  type   qinq
  exit

  admin@ncs(config-config)# 
  ve cluster sdn zones tzon02
  bridge vmbr0
  tag    91
  mtu    100
  type   qinq
  exit
  ```

  ## 4.2 Configure ve cluster sdn vnets and subnets

  ```
  admin@ncs(config-config)# 
  ve cluster sdn vnets tvnet01
  zone tzon01
  tag  80

  subnets 10.1.0.0/24
  type subnet
  vnet tvnet01
  dhcp-dns-server 10.1.4.99
  dhcp-range 10.1.0.20 10.1.0.30
  exit
  dhcp-range 10.1.0.60 10.1.0.80
  exit
  gateway 10.1.0.1
  snat 1
  exit

  subnets 10.1.1.0/24
  type subnet
  vnet tvnet01
  dhcp-dns-server 10.1.4.99
  dhcp-range 10.1.1.20 10.1.1.200
  exit
  gateway 10.1.1.1
  snat 0
  exit

  exit

  admin@ncs(config-config)# 
  ve cluster sdn vnets tvnet02
  zone tzon01
  tag  81

  subnets 10.1.2.0/24
  type subnet
  vnet tvnet02
  dhcp-dns-server 10.1.4.99
  gateway 10.1.2.1
  snat 1
  exit

  subnets 10.1.3.0/24
  type subnet
  vnet tvnet02
  dhcp-dns-server 10.1.4.99
  gateway 10.1.3.1
  snat 0
  exit
  ```

  ## 4.3 Configure ve nodes qemu


  ```
  admin@ncs(config-config)# 
  ve nodes pve3
  qemu 201
  config name nedTest201
  config cdrom cephfs:iso/ubuntu-22.04.3-live-server-amd64.iso,media=cdrom
  config ostype l26
  config scsihw virtio-scsi-single
  config scsi0 sharedpool1:8,iothread=on
  config sockets 1
  config cores 1
  config cpu x86-64-v2-AES
  config memory 2048
  config net0 virtio,bridge=vmbr0
  exit

  admin@ncs(config-config)# 
  qemu 202
  config name nedTest202
  config cdrom cephfs:iso/ubuntu-22.04.3-live-server-amd64.iso,media=cdrom
  config ostype l26
  config scsihw virtio-scsi-single
  config scsi0 sharedpool1:8,iothread=on
  config sockets 1
  config cores 1
  config cpu x86-64-v2-AES
  config memory 2048
  config net0 virtio,bridge=vmbr0
  exit
  ```

  ## 4.4 Configure ve nodes network

  The NED will automatically apply the network config on the device at commit.

  ```
  admin@ncs(config-config)# 
  ve nodes pve3

  network vmbr0
  type bridge
  address 192.168.100.1
  netmask 255.255.255.0
  autostart 1
  exit

  network vmbr1
  type bridge
  address 192.168.101.1
  netmask 255.255.255.0
  autostart 0
  exit

  network vmbr2
  type bridge
  address 192.168.102.1
  netmask 255.255.255.0
  exit
  ```


# 5. Built in live-status actions
---------------------------------

  This sections describes the RPCs (remote procedure cals) provided by the NED:

  ## 5.1 Start a VM

  REST call: POST /nodes/{node}/qemu/{vmid}/status/start

  ```
  admin@ncs# config
  devices device proxmox-ve-0
  live-status exec node-qemu-status-start node pve3 vmid 512
  ```

  ## 5.2 Stop a VM

  REST call: POST /nodes/{node}/qemu/{vmid}/status/stop

  ```
  admin@ncs# config
  devices device proxmox-ve-0
  live-status exec node-qemu-status-stop node pve3 vmid 512
  ```

  ## 5.3 Get VM status

  REST call: GET /nodes/{node}/qemu/{vmid}/status/current

  ```
  admin@ncs# config
  devices device proxmox-ve-0
  live-status exec node-qemu-status-current node pve3 vmid 512
  ```


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  ## 7.1 ve/nodes/qemu/config/

  The device is modifing the configuring that the NED is POSTing to "/api2/json/nodes/pve3/qemu/512/config".
  When executing a GET on the same endpoin the device will return modified config like in bellow example.

  ```
   devices {
       device proxmox-ve-0 {
           config {
               ve {
                   nodes pve3 {
                       qemu 512 {
                           config {
  -                            cdrom cephfs:iso/ubuntu-22.04.3-live-server-amd64.iso,media=cdrom;
  +                            cdrom cephfs:iso/ubuntu-22.04.3-live-server-amd64.iso,media=cdrom,size=2083390K;
  -                            scsi0 sharedpool1:8,iothread=on;
  +                            scsi0 sharedpool1:vm-512-disk-0,iothread=1,size=8G;
  -                            net0 virtio,bridge=vmbr0;
  +                            net0 virtio=BC:24:11:65:31:42,bridge=vmbr0;
                           }
                       }
                   }
               }
           }
       }
   }

  ```

  Because of this behaviour the NED will not update parameters cdrom, scsi[x], net[x] to the values retuned by the device
  to avoid this difference. 
  Because of this if thouse parameters will change out of band, this changed will not be detected by compare-confing.

  ## 7.2 ve/nodes/zones/

  If you create a zone in ve/cluster/sdn/zones the device will automatically populate the list ve/nodes/zones/ with that entry for all nodes present.
  Because of this a diff will be generated when doing a compare-config.


  ```
  radu@ncs(config-config)# ve cluster sdn zones NED02
  radu@ncs(config-zones-NED02)# bridge vmbr0
  radu@ncs(config-zones-NED02)# tag    40
  radu@ncs(config-zones-NED02)# mtu    100
  radu@ncs(config-zones-NED02)# type   qinq
  radu@ncs(config-zones-NED02)# exit
  radu@ncs(config-config)# commit
  Commit complete.
  radu@ncs(config-config)# compare-config
  diff 
   devices {
       device proxmox-ve-0 {
           config {
               ve {
                   nodes pve {
                       sdn {
  +                        zones NED02 {
  +                        }
                       }
                   }
                   nodes pve2 {
                       sdn {
  +                        zones NED02 {
  +                        }
                       }
                   }
                   nodes pve3 {
                       sdn {
  +                        zones NED02 {
  +                        }
                       }
                   }
               }
           }
       }
   }
  ```

  To mitigate this limitation the user should create/delete 've nodes sdn zones' list entry in the same 
  transaction that is creating/deleting 've cluster sdn zones' list entries.

  ```
  radu@ncs(config-config)# ve cluster sdn zones NED02
  radu@ncs(config-zones-NED02)# bridge vmbr0
  radu@ncs(config-zones-NED02)# tag    40
  radu@ncs(config-zones-NED02)# mtu    100
  radu@ncs(config-zones-NED02)# type   qinq
  radu@ncs(config-zones-NED02)# exit
  radu@ncs(config-config)# 
  radu@ncs(config-config)# ve nodes pve sdn zones NED02
  radu@ncs(config-zones-NED02)# exit
  radu@ncs(config-nodes-pve)# 
  radu@ncs(config-nodes-pve)# ve nodes pve2 sdn zones NED02
  radu@ncs(config-zones-NED02)# exit
  radu@ncs(config-nodes-pve2)# 
  radu@ncs(config-nodes-pve2)# ve nodes pve3 sdn zones NED02
  radu@ncs(config-zones-NED02)# exit
  radu@ncs(config-nodes-pve3)# commit
  Commit complete.
  radu@ncs(config-nodes-pve3)# compare-config
  radu@ncs(config-nodes-pve3)# 
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
     admin@ncs(config)# devices device dev-1 ned-settings proxmox-ve logging level debug
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

