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

  This document describes the ericsson-enm NED.

  This NED is build to cover Ericsson Network Manager devices.

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
  | live-status actions       | no        |                                                                  |
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
  | Ericsson ENM              | NA              | NA     | NA                                                |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-ericsson-enm-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-ericsson-enm-1.0.1.signed.bin
      > ./ncs-6.0-ericsson-enm-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-ericsson-enm-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-ericsson-enm-1.0.1.tar.gz
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
     `ericsson-enm-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-ericsson-enm-1.0.1.tar.gz
     > ls -d */
     ericsson-enm-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package ericsson-enm-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package ericsson-enm-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-ericsson-enm-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package ericsson-enm-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/ericsson-enm-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-ericsson-enm-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-ericsson-enm-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install ericsson-enm-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-ericsson-enm-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-ericsson-enm-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id ericsson-enm-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
  - The NED requires a SSL certificate to be able to communicate with the ENM device.
    The certificate must be obtained from the device for the specific user that's configured in the selected auth group.
    Once the certificate is obtained from the device, it must be modified to be accepted by the NED:
    - each line must end in an explicit "\n" string, without any \r or \n terminator.
    - the certificate will be stored in "ned-settings ericsson-enm connection ssl certificate". 
    - it must include the "-----BEGIN CERTIFICATE-----" prefix and "-----END CERTIFICATE-----" suffix and take care not to have a "\n" group as the last characters.

    For example: ```ned-settings ericsson-enm connection ssl certificate "-----BEGIN CERTIFICATE-----\naaa...\nbbb....\nccc...\n-----END CERTIFICATE-----"```
    Also, the following ned-settings should be configured:
    - ned-settings ericsson-enm connection api-base-url ""
    - ned-settings ericsson-enm connection ssl accept-any false

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

  `$NSO_RUNDIR/logs/ned-ericsson-enm-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings ericsson-enm logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings ericsson-enm logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.ericssonEnm \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings ericsson-enm logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings ericsson-enm logger java true
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

  The yang model follows the structure of the configuration XML exported by the device and not the GUI naming scheme and structure.
  The top element `SubNetwork` can be a flat list or a tree. To cover this, the `SubNetwork` copies the unix path descriptor: `/topElement`, `/topElement/firstChild` or `/topElement/seccondChild`. In NSO it's modeled as a flat list with the key describing the path.
  This is how a managed element is modeled in NSO:
  ```
  devices device ericsson
   config
    SubNetwork /MW_LAB
     MeContext LAB_6651_3-A
      vsDataMeContext
       platformType MINI-LINK-Indoor
       neType       MINI-LINK-665x
      !
      ManagedElement LAB_6651_3-A
       vsDataManagedElement
        platformType MINI-LINK-Indoor
        neType       MINI-LINK-665x
       !
       vsDataTransport
        id 1
        vsDataInterfaces
         id 1
         ...
         vsDataInterface LAN-1/0/4
          enabled               false
          linkUpDownTrapEnabled true
          vsDataEthernet
           id            1
           duplex        fullDuplex
           autoNegotiate true
           mdix          auto
           syncEnable    disableSyncEthernet
          !
          vsDataSwitchPortConfig
           id                     2
           maxFrameSize           9216
           pvid                   0
           portRole               CEP
           etherTypeTpIid         UNDEFINED
           bandwidthProfileName   dropNone
           bandwidthProfileTarget NONE
          !
         !
         ...
         vsDataInterface WAN-1/1/1
          enabled               true
          linkUpDownTrapEnabled true
          vsDataEthernet
           id            1
           duplex        ""
           autoNegotiate UNDEFINED
           mdix          ""
           syncEnable    disableSyncEthernet
          !
          vsDataSwitchPortConfig
           id                     1
           maxFrameSize           9216
           pvid                   0
           portRole               INNI
           etherTypeTpIid         DEFAULT
           bandwidthProfileName   0
           bandwidthProfileTarget NONE
          !
         !
        !
        vsDataNetworkInstances
         id 1
         ...
         vsDataNetworkInstance L2_VLAN-400
          vsDataNetworkInstance
           id   L2_VLAN-400
           type L2_VLAN
          !
          vsDataL2VlanConnection
           vlanId 400
           name   ""
           vsDataL2VlanEndPoint LAN-1/0/4
            id           2
            untaggedPort false
            vsDataCVidMapping 0
             sVid 400
            !
            vsDataCVidMapping 400
             sVid 400
            !
           !
          !
         !
         ...
        !
        vsDataBandwidthProfiles
         id 1
         vsDataBandwidthProfile 1
         ...
         vsDataBandwidthProfile 3
          name testBw
          cir  0
          cbs  cbs128K
          eir  0
          ebs  ebs0
         !
        !
       !
      !
     !
    !
   !
  !
  ```

  There are several things that the user must be aware:
  1. The device uses several `id` fields. Most of them are already present at sync-from so the user should leave them as they are.
     They are covered in the config because the ENM needs those id's in the commit XML.
  2. There are 2 `id` elements that must be handled by the user:
    - `/vsDataBandwidthProfiles/vsDataBandwidthProfile */id` : this is the key of the `vsDataBandwidthProfile` list.
      This id field must be specified by the user when a `vsDataBandwidthProfile` entry is created or removed.
      Once a profile is created, it's refferenced by it's name in `/vsDataInterface/vsDataSwitchPortConfig/bandwidthProfileName`
      The user should pick the first unused index.
    - `/vsDataInterfaces/vsDataInterface */vsDataSwitchPortConfig/id`: this field is a device assigned `id` that must be used when configuring a new vsDataNetworkInstance entry
      When a new `vsDataL2VlanEndPoint` is added to a `/vsDataNetworkInstances/vsDataNetworkInstance */vsDataL2VlanConnection/` entry, the user must specify the interface name as the `vsDataL2VlanEndPoint` and the value of `/vsDataInterfaces/vsDataInterface */vsDataSwitchPortConfig/id` as the `vsDataL2VlanEndPoint */id` element.
      The NSO will show thi value as an auto-complete option in `ncs_cli` but it won't enforce it.


  This is an example of a typical commit step:
  ```
  !!! SERVICE 1 !!!
  !!!!!! SERVICE 1 DEVICE LAB_6651_3-B BandwidthProfile pr_170 !!!!!!
  SubNetwork /MW_LAB
  MeContext LAB_6651_3-B
  ManagedElement LAB_6651_3-B
  vsDataTransport
  vsDataBandwidthProfiles
  vsDataBandwidthProfile 3
  name pr_170
  cir 169984
  cbs cbs1024K
  eir 0
  ebs ebs0
  exit

  !!!!!! SERVICE 1 DEVICE LAB_6651_3-B INTERFACE A !!!!!!
  SubNetwork /MW_LAB
  MeContext LAB_6651_3-B
  ManagedElement LAB_6651_3-B
  vsDataTransport
  vsDataInterfaces
  vsDataInterface WAN-1/1/1
  enabled true
  linkUpDownTrapEnabled true
  vsDataSwitchPortConfig
  maxFrameSize 9216
  portRole INNI
  exit
  vsDataEthernet
  syncEnable disableSyncEthernet
  exit
  exit

  !!!!!! SERVICE 1 DEVICE LAB_6651_3-B INTERFACE B !!!!!!
  SubNetwork /MW_LAB
  MeContext LAB_6651_3-B
  ManagedElement LAB_6651_3-B
  vsDataTransport
  vsDataInterfaces
  vsDataInterface LAN-1/0/8
  enabled true
  vsDataSwitchPortConfig
  portRole CEP
  maxFrameSize 9216
  bandwidthProfileName pr_170
  bandwidthProfileTarget PORT
  pvid 1809
  exit
  vsDataEthernet
  duplex fullDuplex1000
  autoNegotiate true
  syncEnable disableSyncEthernet
  mdix auto
  exit
  exit

  !!!!!! SERVICE 1 DEVICE LAB_6651_3-B NetworkInstance L2_VLAN-1809 !!!!!!
  SubNetwork /MW_LAB
  MeContext LAB_6651_3-B
  ManagedElement LAB_6651_3-B
  vsDataTransport
  vsDataNetworkInstances
  vsDataNetworkInstance L2_VLAN-1809
  vsDataNetworkInstance
  id L2_VLAN-1809
  type L2_VLAN
  vsDataL2VlanConnection
  vlanId 1809
  name CC_DIA_150Mbps
  vsDataL2VlanEndPoint LAN-1/0/8
  id 7
  untaggedPort false
  vsDataCVidMapping 0
  sVid 1809
  vsDataCVidMapping 1809
  sVid 1809
  vsDataL2VlanEndPoint WAN-1/1/1
  id 1
  untaggedPort false
  exit
  exit
  exit

  !!!!!! SERVICE 1 DEVICE LAB_6651_3-A INTERFACE A !!!!!!
  SubNetwork /MW_LAB
  MeContext LAB_6651_3-A
  ManagedElement LAB_6651_3-A
  vsDataTransport
  vsDataInterfaces
  vsDataInterface WAN-1/1/1
  enabled true
  linkUpDownTrapEnabled true
  vsDataSwitchPortConfig
  portRole INNI
  maxFrameSize 9216
  exit
  vsDataEthernet
  syncEnable disableSyncEthernet
  exit
  exit

  !!!!!! SERVICE 1 DEVICE LAB_6651_3-A INTERFACE B !!!!!!
  SubNetwork /MW_LAB
  MeContext LAB_6651_3-A
  ManagedElement LAB_6651_3-A
  vsDataTransport
  vsDataInterfaces
  vsDataInterface LAN-1/0/9
  enabled true
  linkUpDownTrapEnabled true
  vsDataSwitchPortConfig
  portRole INNI
  etherTypeTpIid 0x8100
  maxFrameSize 9216
  exit
  vsDataEthernet
  autoNegotiate true
  mdix auto
  syncEnable disableSyncEthernet
  duplex fullDuplex1000
  exit
  exit

  !!!!!! SERVICE 1 DEVICE LAB_6651_3-A NetworkInstance L2_VLAN-1809 !!!!!!
  SubNetwork /MW_LAB
  MeContext LAB_6651_3-A
  ManagedElement LAB_6651_3-A
  vsDataTransport
  vsDataNetworkInstances
  vsDataNetworkInstance L2_VLAN-1809
  vsDataNetworkInstance
  id L2_VLAN-1809
  type L2_VLAN
  vsDataL2VlanConnection
  vlanId 1809
  name CC_DIA_150Mbps
  vsDataL2VlanEndPoint LAN-1/0/9
  id 8
  untaggedPort false
  vsDataL2VlanEndPoint WAN-1/1/1
  id 1
  untaggedPort false
  exit
  exit
  exit
  exit
  ```

  The `commit dry-run outformat native` displays the full set of XML's that will be sent towards the device:
  ```
  <?xml version="1.0" encoding="UTF-8" standalone="no"?>
  <bulkCmConfigDataFile xmlns="configData.xsd" xmlns:es="EricssonSpecificAttributes.xsd" xmlns:gn="geranNrm.xsd" xmlns:un="utranNrm.xsd" xmlns:xn="genericNrm.xsd">
      <fileHeader fileFormatVersion="32.615 V4.5" vendorName="Ericsson"/>
      <configData dnPrefix="Undefined">
          <xn:SubNetwork id="MW_LAB">
              <xn:MeContext id="LAB_6651_3-A">
                  <xn:VsDataContainer id="LAB_6651_3-A">
                      <xn:attributes>
                          <xn:vsDataType>vsDataMeContext</xn:vsDataType>
                          <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                          <es:vsDataMeContext>
                              <es:platformType>MINI-LINK-Indoor</es:platformType>
                              <es:MeContextId>LAB_6651_3-A</es:MeContextId>
                              <es:neType>MINI-LINK-665x</es:neType>
                          </es:vsDataMeContext>
                      </xn:attributes>
                  </xn:VsDataContainer>
                  <xn:ManagedElement id="LAB_6651_3-A">
                      <xn:VsDataContainer id="LAB_6651_3-A">
                          <xn:attributes>
                              <xn:vsDataType>vsDataManagedElement</xn:vsDataType>
                              <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                              <es:vsDataManagedElement>
                                  <es:ManagedElementId>LAB_6651_3-A</es:ManagedElementId>
                              </es:vsDataManagedElement>
                          </xn:attributes>
                      </xn:VsDataContainer>
                      <xn:VsDataContainer id="1">
                          <xn:attributes>
                              <xn:vsDataType>vsDataTransport</xn:vsDataType>
                              <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                              <es:vsDataTransport>
                                  <es:transportId>1</es:transportId>
                              </es:vsDataTransport>
                          </xn:attributes>
                          <xn:VsDataContainer id="1">
                              <xn:attributes>
                                  <xn:vsDataType>vsDataInterfaces</xn:vsDataType>
                                  <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                                  <es:vsDataInterfaces>
                                      <es:interfacesId>1</es:interfacesId>
                                  </es:vsDataInterfaces>
                              </xn:attributes>
                              <xn:VsDataContainer id="LAN-1/0/9">
                                  <xn:attributes>
                                      <xn:vsDataType>vsDataInterface</xn:vsDataType>
                                      <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                                      <es:vsDataInterface/>
                                  </xn:attributes>
                                  <xn:VsDataContainer id="8" modifier="update">
                                      <xn:attributes>
                                          <xn:vsDataType>vsDataSwitchPortConfig</xn:vsDataType>
                                          <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                                          <es:vsDataSwitchPortConfig>
                                              <es:maxFrameSize>9216</es:maxFrameSize>
                                          </es:vsDataSwitchPortConfig>
                                      </xn:attributes>
                                  </xn:VsDataContainer>
                              </xn:VsDataContainer>
                          </xn:VsDataContainer>
                      </xn:VsDataContainer>
                  </xn:ManagedElement>
              </xn:MeContext>
          </xn:SubNetwork>
      </configData>
      <fileFooter dateTime="2025-04-15T13:03:19.715+03:00"/>
  </bulkCmConfigDataFile>
  ------------------------------------------------------------------------------------
  ....
  ....
  ------------------------------------------------------------------------------------
  <?xml version="1.0" encoding="UTF-8" standalone="no"?>
  <bulkCmConfigDataFile xmlns="configData.xsd" xmlns:es="EricssonSpecificAttributes.xsd" xmlns:gn="geranNrm.xsd" xmlns:un="utranNrm.xsd" xmlns:xn="genericNrm.xsd">
      <fileHeader fileFormatVersion="32.615 V4.5" vendorName="Ericsson"/>
      <configData dnPrefix="Undefined">
          <xn:SubNetwork id="MW_LAB">
              <xn:MeContext id="LAB_6651_3-A">
                  <xn:VsDataContainer id="LAB_6651_3-A">
                      <xn:attributes>
                          <xn:vsDataType>vsDataMeContext</xn:vsDataType>
                          <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                          <es:vsDataMeContext>
                              <es:platformType>MINI-LINK-Indoor</es:platformType>
                              <es:MeContextId>LAB_6651_3-A</es:MeContextId>
                              <es:neType>MINI-LINK-665x</es:neType>
                          </es:vsDataMeContext>
                      </xn:attributes>
                  </xn:VsDataContainer>
                  <xn:ManagedElement id="LAB_6651_3-A">
                      <xn:VsDataContainer id="LAB_6651_3-A">
                          <xn:attributes>
                              <xn:vsDataType>vsDataManagedElement</xn:vsDataType>
                              <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                              <es:vsDataManagedElement>
                                  <es:ManagedElementId>LAB_6651_3-A</es:ManagedElementId>
                              </es:vsDataManagedElement>
                          </xn:attributes>
                      </xn:VsDataContainer>
                      <xn:VsDataContainer id="1">
                          <xn:attributes>
                              <xn:vsDataType>vsDataTransport</xn:vsDataType>
                              <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                              <es:vsDataTransport>
                                  <es:transportId>1</es:transportId>
                              </es:vsDataTransport>
                          </xn:attributes>
                          <xn:VsDataContainer id="1">
                              <xn:attributes>
                                  <xn:vsDataType>vsDataInterfaces</xn:vsDataType>
                                  <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                                  <es:vsDataInterfaces>
                                      <es:interfacesId>1</es:interfacesId>
                                  </es:vsDataInterfaces>
                              </xn:attributes>
                              <xn:VsDataContainer id="LAN-1/0/9">
                                  <xn:attributes>
                                      <xn:vsDataType>vsDataInterface</xn:vsDataType>
                                      <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                                      <es:vsDataInterface/>
                                  </xn:attributes>
                                  <xn:VsDataContainer id="8" modifier="update">
                                      <xn:attributes>
                                          <xn:vsDataType>vsDataSwitchPortConfig</xn:vsDataType>
                                          <xn:vsDataFormatVersion>EricssonSpecificAttributes</xn:vsDataFormatVersion>
                                          <es:vsDataSwitchPortConfig>
                                              <es:portRole>INNI</es:portRole>
                                          </es:vsDataSwitchPortConfig>
                                      </xn:attributes>
                                  </xn:VsDataContainer>
                              </xn:VsDataContainer>
                          </xn:VsDataContainer>
                      </xn:VsDataContainer>
                  </xn:ManagedElement>
              </xn:MeContext>
          </xn:SubNetwork>
      </configData>
      <fileFooter dateTime="2025-04-15T13:03:21.533+03:00"/>
  </bulkCmConfigDataFile>
  ------------------------------------------------------------------------------------
  ```


  The error messages are displayed in the raw JSON format used by the device.


# 5. Built in live-status actions
---------------------------------

  NONE


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  1. The commit XML must be broken into multiple commands, and, depending on the config, it can take a few minutes for a simple commit
  2. "bandwidthProfileName" change to "0" (the initial default value) is not allowed by the device, the NED will ignore it.
  3. "vsDataEthernet/duplex" can't be changed back to "fullDuplex" - the NED will skip this command and there's a risk NSO will end up "out-of-sync"
  4. "vsDataEthernet/autoNegotiate" can't be changed from "true" to "false" - the NED will skip this command and there's a risk NSO will end up "out-of-sync"


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
     admin@ncs(config)# devices device dev-1 ned-settings ericsson-enm logging level debug
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

