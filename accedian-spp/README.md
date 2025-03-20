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
  ```


# 1. General
------------

  This document describes the accedian-spp NED.

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
  | partial-sync-from         | yes       | -                                                                |
  |                           |           |                                                                  |
  | live-status actions       | yes       | -                                                                |
  |                           |           |                                                                  |
  | live-status show          | yes       | -                                                                |
  |                           |           |                                                                  |
  | load-native-config        | no        | -                                                                |
  +---------------------------+-----------+------------------------------------------------------------------+
  ```

  Verified target systems
  ```
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Model                     | Version         | OS     | Info                                              |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  | Skylight sensor: control  | VCX_19.12.0_219 | Linux- | -                                                 |
  |                           | 89              | based  |                                                   |
  |                           |                 |        |                                                   |
  | Skylight sensor: control  | VCX_22.12.2_254 | Linux- | -                                                 |
  |                           | 56              | based  |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-accedian-spp-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-accedian-spp-1.0.1.signed.bin
      > ./ncs-6.0-accedian-spp-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-accedian-spp-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-accedian-spp-1.0.1.tar.gz
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
     `accedian-spp-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-accedian-spp-1.0.1.tar.gz
     > ls -d */
     accedian-spp-cli-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package accedian-spp-cli-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package accedian-spp-cli-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-accedian-spp-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package accedian-spp-cli-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/accedian-spp-cli-1.0
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
               /tmp/ned-package-store/ncs-6.0-accedian-spp-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-accedian-spp-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install accedian-spp-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-accedian-spp-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-accedian-spp-cli-1.0
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
    admin@ncs(config)# devices device dev-1 device-type cli ned-id accedian-spp-cli-1.0
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

  `$NSO_RUNDIR/logs/ned-accedian-spp-cli-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings accedian-spp logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings accedian-spp logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.accedianspp \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings accedian-spp logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings accedian-spp logger java true
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

  For instance, create a new user:

  ```
  admin@ncs(config)# devices device dev-1 config
  admin@ncs(config-config)# user drneduser first Ned last Doctor phone 123456978 email doctor.ned@email.com
  ```

  See what you are about to commit:

  ```
  admin@ncs(config-if)# commit dry-run outformat native
  device
    name dev-1
    data user add drneduser first Ned last Doctor phone 123456978 email doctor.ned@email.com
  ```

  Commit new configuration in a transaction:

  ```
  admin@ncs(config-if)# commit
  Commit complete.
  ```

  Verify that NCS is in-sync with the device:

   ```
   admin@ncs(config-if)# devices device dev-1 check-sync
   result in-sync
   ```

  Compare configuration between device and NCS:

   ```
   admin@ncs(config-if)# devices device dev-1 compare-config
   admin@ncs(config-if)#
   ```

  Note: if no diff is shown, supported config is the same in
        NCS as on the device.


# 5. Built in live-status actions
---------------------------------

  The NED has support for subset of native accedian spp exec commands residing
  under device live-status. Presently, the following commands are supported:
  ```
  admin@ncs# devices device <device-name> live-status exec ?
  Possible completions:
   any                           Run any command on the device
   cfm-show-mep-status           get cfm show mep status
   get-policies-vcx-and-device   get count/number of policies existing on the VCX Controller or/and on specific ANT/NANO device
   set-password                  set password for user
   show                          Execute show commands
  ```
  To execute a command, run it in NCS exec mode like this:
  Example:
  ```
  admin@ncs# devices device <device-name> live-status exec any "remote-devices show"
  <result>
  ```
  If the command triggers a prompt like the example below:
  ```
  admin@ncs# devices device <device-name> live-status exec any "remote-devices factory-reset <remote-device>"
  ```
  This will only work properly if the ned-setting live-status auto-prompt
  is set correctly, see README-ned-settings.md chapter 7.1.

  NOTE: when using multiple commands user need to separate commands with " ; "

  5.1 Execute set user password
  ------------------------------
  As user password is not config that is shown on device,
  there is an action implemented that can simplify setting
  a password for specific user.

  Example:
  ```
  admin@ncs# devices device <device-name> live-status exec set-password user <username> password <password>
  ```

  5.2 Get the cfm show mep status of a remote device
  --------------------------------------------------
  Example:
  ```
  admin@ncs# devices device <device-name> live-status exec cfm-show-mep-status context <context-name> status <mep-index or mep-name>
  ```

  5.3 Get the number of policies existing on the VCX Controller or on a specific ANT/NANO device
  ----------------------------------------------------------------------------------------------
  Examples:

  To fetch policies on a VCX Controller:

  ```
  admin@ncs(config)# devices device <device-name> live-status exec get-policies-vcx-and-device context <context-name>
  result 4
  ```

  To fetch policies on a specific ANT/NANO device:

  ```
  admin@ncs(config)# devices device <device-name> live-status exec get-policies-vcx-and-device context <context-name> device <ANT-device-name>
  result 2
  ```

  5.4 The 'inventory add' and 'inventory clear' commands
  ------------------------------------------------------

  These commands affect the action that the user wants to do on the ANT modules. This is the action that takes place in the VCX inventory.

  Examples:  
  Checking the inventory status:

  ```
  admin@ncs(config)# devices device <device-name> live-status exec any inventory show remote-devices
  result
  inventory show remote-devices ->
  Serial            System description         IP address      FW version             Name
  ----------------- -------------------------- --------------- ---------------------- ------------
  C404-9787         ANT-1000-AX-R-AC           0.0.0.0         rAFF_PMON_20.11_8134   C404-9787

  AFB5CAAD-C1D9-451E-8376-8D80A59B5D96:
  ```

  Checking the remote-devices status:

  ```
  admin@ncs(config)# devices device <device-name> live-status exec any remote-devices show
  result 
  remote-devices show ->
  Instance Remote Device Name             MAC address       Linked       Auth Admin State State
  -------- ------------------------------ ----------------- ------------ ---- ----------- ------------

  AFB5CAAD-C1D9-451E-8376-8D80A59B5D96:
  ```

  Once a device is discovered and available under the inventory section, then it can be transferred to the remote-devices list as below:

  ```
  admin@ncs(config)# devices device <device-name> live-status exec any inventory add remote-device serial-number C404-9787 override-config yes
  result 
  inventory add remote-device serial-number C404-9787 override-config yes ->
  AFB5CAAD-C1D9-451E-8376-8D80A59B5D96:
  ```

  Checking if it was added under the remote-devices list:

  ```
  admin@ncs(config)# devices device <device-name> live-status exec any remote-devices show
  result
  remote-devices show ->
  Instance Remote Device Name             MAC address       Linked       Auth Admin State State
  -------- ------------------------------ ----------------- ------------ ---- ----------- ------------
         1 C404-9787                      00:15:AD:3C:AF:0C Initializing Yes  OOS         Connected

  AFB5CAAD-C1D9-451E-8376-8D80A59B5D96:
  ```

  The “inventory clear” command will only clear the inventory for 2 seconds and then the ANT will reappear.  
  If the ANT is on the network, the "clear" command will make the ANT disappear, but then it will reappear, which is normal.

  ```
  admin@ncs(config)# devices device <device-name> live-status exec any inventory clear remote-devices
  result 
  inventory clear remote-devices ->
  AFB5CAAD-C1D9-451E-8376-8D80A59B5D96:
  ```


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  7.1 remote-devices override-config not configurable
  ---------------------------------------------------
  UPDATE: "override-config no" is for now not supported by the NED.

  The leaf "override-config" is only configurable to the
  value "yes". However, if the value "authorize" in the same
  list instance is edited from "yes" to "no", "override-config"
  will also be set to "no".

  Hence this value is not configurable but is subject to auto-config
  behaviour.

  7.2 remote-devices context mode
  -------------------------------
  Updated context mode. The remote-devices list is now modeled
  and used as a specific mode by the NED. This will significantly
  improve the speed when doing larger commits, since it won't
  enter the specific context mode multiple times.

  Note: this is an backward incompatible change. Some scripts
  or user config files could have to be changed.
  Example of how to config a remote-device and a virtual-connection:
    remote-devices REMOTE-DEVICE-NAME
      authorize yes layer2-interface None override-config yes type Ant2Combo flex-monitor disable device-mac-addr 00:15:AD:21:FB:88 default-traffic-fwd permit
      virtual-connection vca-vlan VC-NAME tp-a-vlan-stack-size all-to-one tp-a-port UNI tp-z-vlan-stack-size 1 vlan-tp-z-1-tpid 0x8100 vlan-tp-z-1-id 100 tp-z-port NNI tp-a1z1-pcp-mapping drnedcosprof
    exit

  7.3 inventory remote-devices
  ----------------------------
  Since the device module "inventory" is not controlled by the device itself,
  the config it is holding is dependent on what is discovered in the
  device network, it is not valid to model for the NED at this stage.

  Beware that if the user adds a remote-device by issuing a
    inventory add remote-devices <remote-device-serial>
  with a live-status exec, the NED will need a sync-from
  to fetch the newly created remote-devices instance along with its
  sub-config.

  7.4 port auto-config
  --------------------
  When a remote-devices instance is configured on the device,
  four corresponding port instances will be generated/auto-configured.

  Hence, when this config has to be similarly mirrored on the NED side
  to stay in sync.

  7.5 port/state availability on device
  --------------------------------------
  As the "state" of a port instance can only be changed for some
  cases, the NED will now only read the state value from device
  if the port instance is connected through "SFP-2", example:

  port show configuration C404-9787-UNI
  "
    Port name: C404-9787-UNI
      Connector           : SFP-2
    ...
  "

  There are currently no restrictions from NED side when sending
  config towards the device regarding this "state" leaf.

  7.6 remote-devices/virtual-connection/vca-vlan auto-config
  ----------------------------------------------------------
  When creating a instance of this node with config that
  has values for all three TP Z's, two TP A's, along with
  "contain-tunnel yes", the device will automatically create
  a new instance of vca-vlan. This instance will be named
  with the same name as the original one, only with a "VCA-"
  as prefix and "-Z" as suffix. This has to be mirrored from
  the NED side. But the NED will filter out these lines when
  committing to device, since an error could be thrown if, for
  example, try to add an instance which is already created.

  Example:

  When creating the following:
    virtual-connection vca-vlan TESTNAME tp-a-vlan-stack-size 2 tp-a-port UNI tp-z-vlan-stack-size 3 vlan-tp-z-1-tpid 0x8100 vlan-tp-z-1-id 100 tp-z-port NNI tp-a1z1-pcp-mapping 8P0D-8P0D vlan-tp-a-1-tpid 0x8100 vlan-tp-a-1-id 100 vlan-tp-z-2-id 200 vlan-tp-z-2-tpid 0x88a8 vlan-tp-a-2-tpid 0x88a8 vlan-tp-a-2-id 200 vlan-tp-z-3-id 400 vlan-tp-z-3-tpid 0x9100 contain-tunnel yes tp-z1a1-pcp-mapping 8P0D-8P0D

  Will have to be mirrored by:
    virtual-connection vca-vlan VCA-TESTNAME-Z tp-a-vlan-stack-size 2 tp-a-port UNI tp-z-vlan-stack-size 3 tp-z-port NNI tp-a1z1-pcp-mapping none vlan-tp-z-3-id 400 vlan-tp-z-3-tpid 0x9100 contain-tunnel yes tp-z1a1-pcp-mapping none

  What NED will send to device:
    virtual-connection add vca-vlan TESTNAME tp-a-vlan-stack-size 2 tp-a-port UNI tp-z-vlan-stack-size 3 vlan-tp-z-1-tpid 0x8100 vlan-tp-z-1-id 100 tp-z-port NNI tp-a1z1-pcp-mapping 8P0D-8P0D vlan-tp-a-1-tpid 0x8100 vlan-tp-a-1-id 100 vlan-tp-z-2-id 200 vlan-tp-z-2-tpid 0x88a8 vlan-tp-a-2-tpid 0x88a8 vlan-tp-a-2-id 200 vlan-tp-z-3-id 400 vlan-tp-z-3-tpid 0x9100 contain-tunnel yes tp-z1a1-pcp-mapping 8P0D-8P0D

  Now the NED and device will still be in sync.

  NOTE: Short example that does not include any extra lines
  that would be needed here like remote-devices context mode,
  or bandwidth-regulator-set auto-configuration.

  7.7 virtual-connection/vca-vlan/bandwidth-regulator-envelope/rank
  -----------------------------------------------------------------
  This is currently modeled as a leaf, this requires
  that when configuring it for multiple
  bandwidth-regulator(s) the user has to quote the
  values. Do not use commas, as the NED will not have
  those when reading from device, and the NED will
  automatically append those when sending config to
  device.

  Example:
    remote-devices REMOTE-D-NAME
      virtual-connection vca-vlan VCA-VLAN-NAME bandwidth-regulator-envelope direction AtoZ rank "bwregulator1 bwregulator2 bwregulator4 bwregulator6 bwregulator3 bwregulator5"
    !

  7.8 device prompt
  ----------------------------------------------------------
  Currently the NED has a requirement that the device
  prompt has a "-" (hyphen-sign) in it. If users encounter
  a scenario where this is not the case, submit a bug
  and the NED team will look in to it.

  Examples of current acceptable prompts:
    1. A631E32D-98C3-45D0-8D9C-42F6B78F885F:
    2. VCX-DUMMYPROMPT:

  7.9 loopback name and device-name
  ----------------------------------------------------------
  The VCX device requires a remote-device or port to be entered
  before the loopback name (list key) when creating an instance.
  Example:
    loopback add <REMOTE DEVICE> <LOOPBACK NAME>

  To "mirror" this behavior, the NED requires remote-device
  to be entered before specifiying loopback name, both when creating
  and modifying. When deleting an instance, only loopback name should
  be used.
  Example NCS_CLI:
  create/modify:
    loopback <REMOTE DEVICE> <LOOPBACK NAME>
  delete:
    no loopback <LOOPBACK NAME>

  The above may not be easily understood with only tab completion
  in NCS_CLI.

  7.10 "edit"-only nodes and undeletable configs
  ----------------------------------------------------------
  Some config may only be modified in device, no other operations
  allowed. At least as of now it's not known how to delete them
  without doing a complete device reset.

  This may make the NED unable to rollback certain scenarios,
  where the config is set for the first time on device.

  7.11 modify port "auto-nego" and "advertisement" parameters
  -----------------------------------------------------------
  The "advertisement" and "auto-nego" parameters must be always provided togheter(even when the new values are similar to the old ones).  
  It is necessary to keep the sync between device's CDB and the accedian device.  

  To be able to change the "advertisement", the "auto-nego" must be enabled first.  
  To set "auto-nego" back to disabled, the "advertisement" must be provided before "auto-nego disabled".

  Example: given the initial state below:

  ```
  port rem-device1-NNI lldp-state enable advertisement 1G-FD auto-nego disable speed 1G
  ```

  1. enable "auto-nego"

  ```
  port rem-device1-NNI auto-nego enable advertisement 100M-FD,1G-FD speed 100M

  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name dev-1
          data port edit rem-device1-NNI lldp-state enable auto-nego enable advertisement 100M-FD,1G-FD speed 100M
      }
  }
  admin@ncs(config-config)# commit
  Commit complete.
  admin@ncs(config-config)# compare-config
  admin@ncs(config-config)# 
  ```

  2. disable "auto-nego"

  ```
  port C404-9787-NNI lldp-state enable advertisement 1G-FD auto-nego disable speed 1G

  admin@ncs(config-config)# commit dry-run outformat native 
  native {
      device {
          name dev-1
          data port edit C404-9787-NNI lldp-state enable advertisement 1G-FD auto-nego disable speed 1G
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
    - SSH/TELNET access to a device where the issue can be reproduced by the Cisco NSO NED team.
      This typically means both read and write permissions are required.
      Pseudo access via tools like Webex, Zoom etc is not acceptable.
      However, it is ok with device access through VPNs, jump servers etc though.

  Do as follows to gather the necessary information needed for your device, here named 'dev-1':

  1. Enable full debug logging in the NED

     ```
     ncs_cli -C -u admin
     admin@ncs# configure
     admin@ncs(config)# devices device dev-1 ned-settings accedian-spp logging level debug
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
  > devices device dev-1 ned-settings accedian-spp logger level debug
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
