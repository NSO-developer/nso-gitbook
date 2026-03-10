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

  This document describes the ciena-mcp NED.


  # QUICK SUMMARY - Current Design (ESM vs BSM vs TSM)

  --------------------------------------------------
  [IMPORTANT] CURRENT DESIGN GENERAL CONSIDERATIONS:
  --------------------------------------------------

  * The NED was initially designed to interact with the device only through a set of live-status actions or rpc calls.
  * The initial design is enabled under ESM config mode of the NED, and it enables only the live-status commands in that mode. 

  * Over time it has evolved based on requests, with focus and specific behavior especially for two modes of working, BSM and TSM.

  To choose the mode NED operates in, NED can be configured in ned-settings under config path `../device<deviceName>/ned-settings/ciena-mcp/mcp-service-model-api`:

  Ex.:    
      admin@ncs(config-device-netsim-0)# ned-settings ciena-mcp mcp-service-model-api ?
      Description: Define latest max API vers supported by the NED; Warning! Customer dependent selection!
      Possible completions:
      VERSION_1_ESM_PROVISION  VERSION_4_BSM_L2SERVICE  VERSION_6_TSM

  1. **VERSION_1_ESM_PROVISION** : 
      * Allows only live-status commands to be used for provisioning operations'

  2. **VERSION_4_BSM_L2SERVICE** : 
      * It is the default current mode the NED is delivered with, for legacy reasons. 
      * It enables the NED config model under the config path: `/devices/device<deviceName>/config/services/`
      * It is used for very specific, customized resourceTypes, behaving in a Ciena MDSO like configuration of the device. 

  2. **VERSION_6_TSM** : 
      * It enables the NED config model under the config path: `/devices/device<deviceName>/config/tsm/`
      * It is used for very specific, customized resourceTypes, behaving in a Ciena MDSO like configuration of the device. 

  ## BSM mode specific - config data model
        * /ned-settings/ciena-mcp/mcp-service-model-api VERSION_4_BSM_L2SERVICE

  ---
  For BSM mode, we can find the config data implemented under **services** NED config tree '/devices/device<deviceName>/config/services/ *': 

      admin@ncs(config)# show configuration devices device <dev-1> config services ?
      Possible completions:
          l2Service                 //adresses resourceType: bharti.resourceTypes.L2Service
          tdmServices               //adresses resourceType: bharti.resourceTypes.TDMService 

  ## YANG Schema Tree structure of the BSM mode enabled config model: 

  ```
      module: tailf-ned-ciena-mcp
      +--rw services
      |  +--rw l2Service* [label]
      |  |  +--rw label         string
      |  |  +--rw productId?    string
      |  |  +--rw properties
      |  |     +--rw serviceType?           string
      |  |     +--rw customerName?          string
      |  |     +--rw customerSegment?       string
      |  |     +--rw service?               string
      |  |     +--rw transportProtection?   string
      |  |     +--rw cos
      |  |     |  +--rw ingressCosPolicy?   string
      |  |     +--rw serviceEndPointList* [interfaceType]
      |  |        +--rw interfaceType    string
      |  |        +--rw node?            string
      |  |        +--rw port?            string
      |  |        +--rw vlanIds?         string
      |  |        +--rw bwp
      |  |           +--rw cbs?   uint16
      |  |           +--rw cir?   uint64
      |  |           +--rw ebs?   uint32
      |  |           +--rw eir?   uint64
      |  +--rw tdmServices* [label]
      |     +--rw label         string
      |     +--rw productId?    string
      |     +--rw properties
      |        +--rw rate?                  string
      |        +--rw rollbackPatch?         boolean
      |        +--rw customerName?          string
      |        +--rw customerSegment?       string
      |        +--rw transportProtection?   string
      |        +--rw vlanId?                uint32
      |        +--rw services* [circuitLabel]
      |           +--rw circuitLabel               string
      |           +--rw reuseExistingPseudowire?   boolean
      |           +--rw serviceEndPointList* [klm]
      |              +--rw node?                string
      |              +--rw port?                string
      |              +--rw klm                  string
      |              +--rw clockRecoveryMode?   string
      |              +--rw rtpSetting?          string
      |              +--rw priority?            uint32
      |              +--rw jitterBuffer?        uint32
  ```

  ------------------------------------------------------
  ### Supported operations on the BSM config data model:
  ------------------------------------------------------

  The BSM NED config/services data model supports the following operations:

  * Sync-from
  * Create
  * Delete

  There is **NO** or very limited support for Update or Modify operations on the existing attributes of the BSM config data. 

  The Ciena MCP/MSDO device is not supporting any direct updates of these elements by design. 
  For more details go to chapter 7. below. 



  ## TSM mode specific - config data model
      * ned-settings ciena-mcp mcp-service-model-api VERSION_6_TSM
  ------------------------------_

  For TSM mode specifics, refer to 'README.TSM'

  For TSM mode, we can find the config data implemented under '/devices/device<deviceName>/config/tsm/*': 
  ```
  admin@ncs(config)# show configuration devices device dummy-1 config tsm ?
  Possible completions:
      L1OTNSwitchingProtService   Resources of type: ifd.v6.resourceTypes.L1OTNSwitchingProtServiceIntentFacade
      L1OTNSwitchingService       Resources of type: ifd.v6.resourceTypes.L1OTNSwitchingServiceIntentFacade
      eLineServices               Resources of type: ifd.v6.resourceTypes.L2ServiceIntentFacade
      l1Services                  Resources of type: ifd.v6.resourceTypes.L1NCPClientServiceIntentFacade
      mplsTunnels                 Resources of type: ifd.v6.resourceTypes.MplsTunnelIntentFacade
      networkConstructs           List of networkConstructs found on Ciena MCP
      tdmCircuits                 Resources of type: ifd.v6.resourceTypes.TDMServiceIntentFacade        module: tailf-ned-ciena-mcp
  ```

  ```
      +--rw tsm
          +--rw L1OTNSwitchingProtService* [name]
              ...
          +--rw L1OTNSwitchingService* [name]
              ...
          +--rw eLineServices* [name]
              ...
          +--rw l1Services* [name]
              ...
          +--rw mplsTunnels* [name]
              ...
          +--rw networkConstructs* [name]
              ...
          +--rw tdmCircuits* [name]
              ...
  ```

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
  | netsim                    | yes       | See README.md for further info on how to configure the NED to    |
  |                           |           | use netsim as a RESTCONF target.                                 |
  |                           |           |                                                                  |
  | check-sync                | yes       | Disabled by default. Can be enabled on devices that meet certain |
  |                           |           | requirements. See README-ned-settings.md for further info.       |
  |                           |           |                                                                  |
  | partial-sync-from         | yes       | Granular support only on particular nodes, as the REST API       |
  |                           |           | allows it. Contact developer for more details                    |
  |                           |           |                                                                  |
  | live-status actions       | yes       | Multiple live status commands implemented for provisioning and   |
  |                           |           | asynchronous APIs.                                               |
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
  | CIENA BLUEPLANET MCP      | artifactory.cie | BLUEPL | Ciena mcp:4.x                                     |
  |                           | na.com.blueplan | ANET   |                                                   |
  |                           | et.platform:18. | MCP    |                                                   |
  |                           | 06              |        |                                                   |
  |                           |                 |        |                                                   |
  | CIENA BLUEPLANET MCP      | artifactory.cie | BLUEPL | Ciena mcp:5.x                                     |
  |                           | na.com.blueplan | ANET   |                                                   |
  |                           | et.mcp:5.x      | MCP    |                                                   |
  |                           |                 |        |                                                   |
  | CIENA BLUEPLANET MCP      | ['artifactory.c | BLUEPL | Ciena mcp:6.x                                     |
  |                           | iena.com.bluepl | ANET   |                                                   |
  |                           | anet.platform:2 | MCP    |                                                   |
  |                           | 2.08', 'artifac |        |                                                   |
  |                           | tory.ciena.com. |        |                                                   |
  |                           | blueplanet.mcp: |        |                                                   |
  |                           | 6.2']           |        |                                                   |
  +---------------------------+-----------------+--------+---------------------------------------------------+
  ```


## 1.1 Extract the NED package
------------------------------

  It is assumed the NED package `ncs-<NSO version>-ciena-mcp-<NED version>.signed.bin` has already
  been downloaded from software.cisco.com.

  In this instruction the following example settings will be used:

  - NSO version: 6.0
  - NED version: 1.0.1
  - NED package downloaded to: /tmp/ned-package-store

  1. Extract the NED package and verify its signature:

      ```
      > cd /tmp/ned-package-store
      > chmod u+x ncs-6.0-ciena-mcp-1.0.1.signed.bin
      > ./ncs-6.0-ciena-mcp-1.0.1.signed.bin
      ```

  2. In case the signature can not be verified (for instance if no internet connection),
     do as below instead:

      ```
      > ./ncs-6.0-ciena-mcp-1.0.1.signed.bin --skip-verification
      ```

  3. The result of the extraction shall be a tar.gz file with the same name as the .bin file:

      ```
      > ls *.tar.gz
      ncs-6.0-ciena-mcp-1.0.1.tar.gz
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
     `ciena-mcp-<NED major digit>.<NED minor digit>`:

     ```
     > tar xfz ncs-6.0-ciena-mcp-1.0.1.tar.gz
     > ls -d */
     ciena-mcp-gen-1.0
     ```

  2. Install the NED into NSO, using the ncs-setup tool:

     ```
     > ncs-setup --package ciena-mcp-gen-1.0 --dest $NSO_RUNDIR
     ```

  3. Open a NSO CLI session and load the new NED package like below:

     ```
     > ncs_cli -C -u admin
     admin@ncs# packages reload
     reload-result {
         package ciena-mcp-gen-1.0
         result true
     }
     ```

  Alternatively the tar.gz file can be installed directly into NSO. Then skip steps 1 and 2 and do like
  below instead:

  ```
    > ncs-setup --package ncs-6.0-ciena-mcp-1.0.1.tar.gz --dest $NSO_RUNDIR
    > ncs_cli -C -u admin
    admin@ncs# packages reload
    reload-result {
      package ciena-mcp-gen-1.0
      result true
   }
  ```

  Set the environment variable NED_ROOT_DIR to point at the NSO NED package:

  ```
  > export NED_ROOT_DIR=$NSO_RUNDIR/packages/ciena-mcp-gen-1.0
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
               /tmp/ned-package-store/ncs-6.0-ciena-mcp-1.0.tar.gz
     admin@ncs# software packages list
     package {
      name ncs-6.0-ciena-mcp-1.0.tar.gz
      installable
     }
     ```

  3. Install the NED package (add the argument replace-existing if a previous version has been loaded):

     ```
     admin@ncs# software packages install ciena-mcp-1.0
     admin@ncs# software packages list
     package {
      name ncs-6.0-ciena-mcp-1.0.tar.gz
      installed
     }
     ```

  4. Load the NED package

     ```
     admin@ncs# packages reload
     admin@ncs# software packages list
     package {
       name ncs-6.0-ciena-mcp-gen-1.0
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
    admin@ncs(config)# devices device dev-1 device-type generic ned-id ciena-mcp-gen-1.0
    admin@ncs(config)# devices device dev-1 state admin-state unlocked
    admin@ncs(config)# devices device dev-1 authgroup my-group
    ```
  -------------------------------------
  ### TSM_MODE: GENERAL CONSIDERATIONS
  -------------------------------------

  ## !!! Warning: !!!
  - Please make sure the mcp-service-model-api ned-setting is set to 'VERSION_6_TSM' to use config/tsm section:
  - i.e.: 
  `admin@ncs(config-device-ciena-lab1)# ned-settings ciena-mcp mcp-service-model-api VERSION_6_TSM`

  ## TSM_MODE Features 
  - visible under **`devices device <deviceName> ned-settings ciena-mcp`**

  ### **-> LAG Management <-**
  - Enables config management under **/config/tsm/networkConstructs{neName}/ethernetPortMgmt/lag{*}**
  - Make sure you enable managed-lag flag before running sync-from. 
  ```
  admin@ncs(config-device-netsim-0)# ned-settings ciena-mcp managed-lag?
  Possible completions:
    managed-lag   TSM Specific: enable to manage LAG section
  ```


  ----------------------------------
  ### TSM_MODE: Initial config / setup example
  ----------------------------------

  ```
  devices authgroups group ciena-auth
   default-map remote-name admin
   default-map remote-password $8$AEF7NqMC9u7dc3qOkwAhW4/12345689abcdef=
  !

  devices device ciena-lab1
   address   123.456.789.123
   port      443
   authgroup ciena-auth
   device-type generic ned-id ciena-mcp-gen-1.8
   trace     raw
   ned-settings ciena-mcp connection remote-protocol https
   ned-settings ciena-mcp connection ssl accept-any true
   ned-settings ciena-mcp logger level debug
   ned-settings ciena-mcp logger java true
   ned-settings ciena-mcp developer progress-verbosity debug
   ned-settings ciena-mcp mcp-service-model-api VERSION_6_TSM
   ned-settings ciena-mcp tsm-global-limit 1000
   ned-settings use-transaction-id false
   state admin-state unlocked
  !
  ```

  -------------------------------
  ## TSM_MODE: Config data models
  -------------------------------

  - Addresses only the resources managed under the path:
    - devices device <DEVICENAME> / config / tsm / *
  ```  
      admin@ncs(config)# devices device <device-name> config tsm ?
      Possible completions:
        L0ServiceIntentFacade       Resources of type: ifd.v6.resourceTypes.L0ServiceIntentFacade
        L1OTNSwitchingProtService   Resources of type: ifd.v6.resourceTypes.L1OTNSwitchingProtServiceIntentFacade
        L1OTNSwitchingService       Resources of type: ifd.v6.resourceTypes.L1OTNSwitchingServiceIntentFacade
        eLineServices               Resources of type: ifd.v6.resourceTypes.L2ServiceIntentFacade
        l1Services                  Resources of type: ifd.v6.resourceTypes.L1NCPClientServiceIntentFacade
        mplsTunnels                 Resources of type: ifd.v6.resourceTypes.MplsTunnelIntentFacade
        networkConstructs           List of networkConstructs found on Ciena MCP
        tdmCircuits                 Resources of type: ifd.v6.resourceTypes.TDMServiceIntentFacade
  ```
  - In this build version you should be able, on top of using the live-status actions for various provisioning tasks,
  to sync, create and delete MPLS Tunnels, E-LINE and EPL/EVPL Services, L1 Services, TDM Circuits

  - After configuring the NED instance as above presented, run a sync-from and check:
    - ../config/tsm/mplsTunnels
    - ../config/tsm/eLineServices
    - ../config/tsm/l1Services
    - ../config/tsm/tdmCircuits
    - ../config/tsm/L0ServiceIntentFacade
    - ../config/tsm/L1OTNSwitchingProtService
    - ../config/tsm/L1OTNSwitchingService

  - if `ned-settings/ciena-mcp/managed-lag` == true, check also:
    - ../config/tsm/networkConstructs


  - For the above, the transactions supported widely are SYNC, CREATE, DELETE.
  - For some of the resources, partial EDIT/UPDATE is also possible, but generally it is very limited in this config mode.
  - For LAG management: 
     - top level is READ ONLY, SYNC-ONLY ALLOWED:  `/../config/tsm/networkConstructs{*}`
     - SYNC, CREATE, DELETE LAGs at level:  `/../config/tsm/networkConstructs{*}/ethernetPortMgmt/lag{*}`
     - Update possible via live status; complex provisioning flow 

  ### TSM_MODE: NED /config/tsm/mplsTunnels model:
  - Handles Resources of type: ifd.v6.resourceTypes.MplsTunnelIntentFacade

  ```
  module: tailf-ned-ciena-mcp
    +--rw tsm
       +--rw mplsTunnels* [name]
       |  +--rw name          string
       |  +--rw label?        string
       |  +--rw productId?    string
       |  +--rw properties
       |     +--rw backupPathName?          string
       |     +--rw customerName?            string
       |     +--rw turnUpDateTime?          string
       |     +--rw protectionType?          string
       |     +--rw interactive_mode?        string
       |     +--rw bfdInterval?             string
       |     +--rw aisRefreshTimer?         string
       |     +--rw autoReversionPossible?   boolean
       |     +--rw waitToRevertDelay?       uint32
       |     +--rw reversionTimeUnit?       string
       |     +--rw globalDiversity
       |     |  +--rw diversityLevel?      string
       |     |  +--rw selectionCriteria?   string
       |     +--rw bandwidth
       |     |  +--rw assignedBandwidth?       uint32
       |     |  +--rw bandwidthLockout?        boolean
       |     |  +--rw assignedBandwidthUnit?   string
       |     |  +--rw bookingFactor?           union
       |     +--rw endPointA
       |     |  +--rw networkElement
       |     |  |  +--rw name?   string
       |     |  +--rw primary
       |     |  |  +--rw port?      string
       |     |  |  +--rw shelf?     string
       |     |  |  +--rw slot?      string
       |     |  |  +--rw eqptGrp?   string
       |     |  +--rw backup
       |     |     +--rw port?      string
       |     |     +--rw shelf?     string
       |     |     +--rw slot?      string
       |     |     +--rw eqptGrp?   string
       |     +--rw endPointZ
       |     |  +--rw networkElement
       |     |  |  +--rw name?   string
       |     |  +--rw primary
       |     |  |  +--rw port?      string
       |     |  |  +--rw shelf?     string
       |     |  |  +--rw slot?      string
       |     |  |  +--rw eqptGrp?   string
       |     |  +--rw backup
       |     |     +--rw port?      string
       |     |     +--rw shelf?     string
       |     |     +--rw slot?      string
       |     |     +--rw eqptGrp?   string
       |     +--rw routingConstraints* [index]
       |        +--rw index                  uint16
       |        +--rw endPoints*             string
       |        +--rw includeRouteObjects* [index]
       |           +--rw index             uint16
       |           +--rw objectType?       string
       |           +--rw constraintType?   string
       |           +--rw value*            string
       |           +--rw locations* [nodeName]
       |              +--rw nodeName         string
       |              +--rw interfaceName?   string
       |              +--rw shelf?           string
       |              +--rw slot?            string
       |              +--rw port?            string
       |              +--rw eqptGrp?         string
  ```

  ### TSM_MODE: NED /config/tsm/eLineServices model:
  - Handles Resources of type: ifd.v6.resourceTypes.L2ServiceIntentFacade
  ```
  module: tailf-ned-ciena-mcp
    +--rw tsm
       +--rw eLineServices* [name]
       |  +--rw name          string
       |  +--rw label?        string
       |  +--rw productId?    string
       |  +--rw discovered?   boolean
       |  +--rw properties
       |     +--rw type?                  string
       |     +--rw structure?             string
       |     +--rw serviceType?           string
       |     +--rw userLabel?             string
       |     +--rw customerName?          string
       |     +--rw protectedPseudowire?   boolean
       |     +--rw oamEnabled?            boolean
       |     +--rw linearOnly?            boolean
       |     +--rw allowQinQSpur?         boolean
       |     +--rw interactive_mode?      string
       |     +--rw ccmInterval?           string
       |     +--rw ccmPriority?           uint32
       |     +--rw turnUpDateTime?        string
       |     +--rw coreSvid?              uint32
       |     +--rw routeMeta
       |     |  +--rw originator?   string
       |     +--rw constraints
       |     |  +--rw transport
       |     |  |  +--rw directionality?   string
       |     |  +--rw routes* [directionFrom directionTo]
       |     |     +--rw directionFrom          enumeration
       |     |     +--rw directionTo            enumeration
       |     |     +--rw protection?            string
       |     |     +--rw objectType?            string
       |     |     +--rw constraintType?        string
       |     |     +--rw includeRouteObjects* [index]
       |     |        +--rw index             uint16
       |     |        +--rw objectType?       string
       |     |        +--rw constraintType?   string
       |     |        +--rw locations* [nodeName]
       |     |           +--rw nodeName    string
       |     |           +--rw lspName?    string
       |     +--rw endpoints* [node role]
       |     |  +--rw role        string
       |     |  +--rw node        string
       |     |  +--rw settings
       |     |     +--rw oamEnabled?           boolean
       |     |     +--rw ccmTransmitEnabled?   boolean
       |     |     +--rw dmmEnabled?           boolean
       |     |     +--rw dmmPriority?          uint32
       |     |     +--rw dmmCount?             uint32
       |     |     +--rw dmmInterval?          string
       |     |     +--rw dmmFrameSize?         uint32
       |     |     +--rw dmmIterate?           uint32
       |     |     +--rw dmmRepeatDelay?       uint32
       |     |     +--rw slmEnabled?           boolean
       |     |     +--rw slmPriority?          uint32
       |     |     +--rw slmCount?             uint32
       |     |     +--rw slmInterval?          string
       |     |     +--rw slmFrameSize?         uint32
       |     |     +--rw slmIterate?           uint32
       |     |     +--rw slmRepeatDelay?       uint32
       |     |     +--rw details* [index]
       |     |        +--rw index           uint16
       |     |        +--rw flowSettings* [index]
       |     |           +--rw index                               uint16
       |     |           +--rw vlliState?                          string
       |     |           +--rw controlFrameTunneling?              string
       |     |           +--rw controlFrameTunnelingProfileName?   string
       |     |           +--rw filter
       |     |           |  +--rw outerVLANEthertype?   string
       |     |           |  +--rw outerVlanId*          uint16
       |     |           +--rw profiles* [profileName]
       |     |           |  +--rw profileName    string
       |     |           |  +--rw profileType?   string
       |     |           +--rw location
       |     |           |  +--rw shelf?     string
       |     |           |  +--rw slot?      string
       |     |           |  +--rw port?      string
       |     |           |  +--rw eqptGrp?   string
       |     |           |  +--rw lagName?   string
       |     |           +--rw ingressPolicer
       |     |           |  +--rw cbs?   uint32
       |     |           |  +--rw cir?   uint64
       |     |           |  +--rw ebs?   uint32
       |     |           |  +--rw eir?   uint64
       |     |           +--rw ingressCosSetting
       |     |              +--rw ingressCosPbit?     uint32
       |     |              +--rw ingressCosPolicy?   string
       |     +--rw profiles* [index]
       |     |  +--rw index          uint16
       |     |  +--rw profileName?   string
       |     |  +--rw profileType?   string
       |     +--rw note
       |        +--rw lastUpdatedBy?     string
       |        +--rw lastUpdatedTime?   string
       |        +--rw noteMsg?           string
  ```

  ### TSM_MODE: NED /config/tsm/l1Services model:

  - Handles Resources of type: ifd.v6.resourceTypes.L1NCPClientServiceIntentFacade

  ```
  module: tailf-ned-ciena-mcp
    +--rw tsm 
       +--rw l1Services* [name]
       |  +--rw name          string
       |  +--rw label?        string
       |  +--rw productId?    string
       |  +--rw properties
       |     +--rw customerName?             string
       |     +--rw turnUpDateTime?           string
       |     +--rw directionality?           string
       |     +--rw layerRate?                string
       |     +--rw interactive_mode?         string
       |     +--rw endPoints* [index]
       |     |  +--rw index                 uint16
       |     |  +--rw networkElement
       |     |  |  +--rw name?   string
       |     |  +--rw name?                 string
       |     |  +--rw ains?                 string
       |     |  +--rw shelf?                string
       |     |  +--rw port?                 string
       |     |  +--rw signalConditioning?   string
       |     |  +--rw slot?                 string
       |     +--rw primaryPathConstraints
       |     |  +--rw includeRouteObjects* [nodeName]
       |     |  |  +--rw nodeName          string
       |     |  |  +--rw objectType?       string
       |     |  |  +--rw constraintType?   string
       |     |  +--rw excludeRouteObjects* [nodeName]
       |     |     +--rw nodeName          string
       |     |     +--rw objectType?       string
       |     |     +--rw constraintType?   string
       |     +--rw note
       |        +--rw lastUpdatedBy?     string
       |        +--rw lastUpdatedTime?   string
       |        +--rw noteMsg?           string

  ```

  ### TSM_MODE: NED /config/tsm/tdmCircuits model:
  - Handles Resources of type: ifd.v6.resourceTypes.TDMServiceIntentFacade

  ```
  module: tailf-ned-ciena-mcp
    +--rw tsm  
       +--rw tdmCircuits* [name]
       |  +--rw name          string
       |  +--rw productId?    string
       |  +--rw properties
       |     +--rw type?                      string
       |     +--rw structure?                 string
       |     +--rw customerName?              string
       |     +--rw routeMeta
       |     |  +--rw originator?   string
       |     +--rw serviceType?               string
       |     +--rw protectedPseudowire?       boolean
       |     +--rw oamEnabled?                boolean
       |     +--rw linearOnly?                boolean
       |     +--rw allowQinQSpur?             boolean
       |     +--rw reuseExistingPseudowire?   boolean
       |     +--rw interactive_mode?          string
       |     +--rw tdm
       |     |  +--rw layerRate?   string
       |     |  +--rw endPoints* [index]
       |     |     +--rw index             uint16
       |     |     +--rw networkElement
       |     |     |  +--rw name?   string
       |     |     +--rw tdmCosSettings
       |     |     |  +--rw pcp?   uint16
       |     |     +--rw rtpSetting?       string
       |     |     +--rw port?             string
       |     |     +--rw signalIndex?      string
       |     +--rw endpoints* [node role]
       |     |  +--rw role        string
       |     |  +--rw node        string
       |     |  +--rw settings
       |     |     +--rw details* [index]
       |     |        +--rw index           uint16
       |     |        +--rw flowSettings* [index]
       |     |           +--rw index       uint16
       |     |           +--rw filter
       |     |           |  +--rw outerVlanId*   uint16
       |     |           +--rw profiles* [profileName]
       |     |           |  +--rw profileName    string
       |     |           |  +--rw profileType?   string
       |     |           +--rw location
       |     |              +--rw port?   string
       |     +--rw globalDiversity
       |     |  +--rw diversityLevel?      string
       |     |  +--rw selectionCriteria?   string
       |     +--rw primaryPathConstraints
       |     |  +--rw includeRouteObjects* [nodeName]
       |     |     +--rw nodeName          string
       |     |     +--rw lspName?          string
       |     |     +--rw objectType?       string
       |     |     +--rw constraintType?   string
       |     +--rw note
       |        +--rw lastUpdatedBy?     string
       |        +--rw lastUpdatedTime?   string
       |        +--rw noteMsg?           string

  ```


  ### TSM_MODE: NED /config/tsm/L1OTNSwitchingProtService model:
  - Handles Resources of type: ifd.v6.resourceTypes.L1OTNSwitchingProtServiceIntentFacade

  ```
  module: tailf-ned-ciena-mcp
    +--rw tsm      
       +--rw L1OTNSwitchingProtService* [name]
       |  +--rw name          string
       |  +--rw label?        string
       |  +--rw productId?    string
       |  +--rw properties
       |     +--rw layerRate?              string
       |     +--rw interactive_mode?       string
       |     +--rw directionality?         string
       |     +--rw endPointA
       |     |  +--rw protServiceEndpoint
       |     |     +--rw networkElement
       |     |     |  +--rw name?   string
       |     |     +--rw port?             string
       |     |     +--rw shelf?            string
       |     |     +--rw slot?             string
       |     +--rw endPointZ
       |     |  +--rw protServiceEndpoint
       |     |     +--rw networkElement
       |     |     |  +--rw name?   string
       |     |     +--rw port?             string
       |     |     +--rw shelf?            string
       |     |     +--rw slot?             string
       |     +--rw workSncAttributes
       |     |  +--rw controlPlanePackage
       |     |  |  +--rw resiliencyType?   string
       |     |  +--rw primaryPathConstraints
       |     |     +--rw pathConstraint
       |     |        +--rw pathConstraintOption?   string
       |     |        +--rw costCriteria?           string
       |     +--rw protectSncAttributes
       |        +--rw controlPlanePackage
       |        |  +--rw resiliencyType?   string
       |        +--rw primaryPathConstraints
       |           +--rw pathConstraint
       |              +--rw pathConstraintOption?   string
       |              +--rw costCriteria?           string


  ```

  ### TSM_MODE: NED /config/tsm/L1OTNSwitchingService model:
  - Handles Resources of type: ifd.v6.resourceTypes.L1OTNSwitchingServiceIntentFacade

  ```
  module: tailf-ned-ciena-mcp
    +--rw tsm   
       +--rw L1OTNSwitchingService* [name]
          +--rw name          string
          +--rw label?        string
          +--rw productId?    string
          +--rw properties
             +--rw layerRate?          string
             +--rw interactive_mode?   string
             +--rw directionality?     string
             +--rw routingType?        string
             +--rw diversityType?      string
             +--rw endPointA
             |  +--rw networkElement
             |  |  +--rw name?   string
             |  +--rw ains?                 string
             |  +--rw signalConditioning?   string
             |  +--rw port?                 string
             |  +--rw shelf?                string
             |  +--rw slot?                 string
             +--rw endPointZ
             |  +--rw networkElement
             |  |  +--rw name?   string
             |  +--rw ains?                 string
             |  +--rw signalConditioning?   string
             |  +--rw port?                 string
             |  +--rw shelf?                string
             |  +--rw slot?                 string
             +--rw sncAttributes
                +--rw controlPlanePackage
                |  +--rw resiliencyType?      string
                |  +--rw dtlSetExclusivity?   string
                |  +--rw regroomAllowed?      boolean
                +--rw primaryPathConstraints
                   +--rw pathConstraint
                      +--rw pathConstraintOption?   string
  ```  


  ### TSM_MODE: NED /config/tsm/networkConstructs model:
  - Used for handling **Ethernet Port management LAGs**:
  - Usable only when **ned-settings ciena-mcp managed-lag** is enabled!
  - Node **networkConstructs** and information at same level is READ ONLY 
  - LAG under `networkConstructs/ethernetPortMgmt/lag/*` supports: SYNC, CREATE, DELETE; 
  - LAG update/edit assumes adding or removing primaryPorts or protectionPorts only. It is currently doable only via live-status commands. 
  - Complete LAG provisioning can be achieved using a combination of live status commands and below data tree model. 

  ```
       +--r networkConstructs* [neName]
          +--r neName              string
          +--r ncid?               string
          +--r typegroup?          string
          +--r sessionid?          string
          +--r softwareVersion?    string
          +--r deviceType?         string
          +--r resourceType?       string
          +--r group?              string
          +--r shelf?              string
          +--r ethernetPortMgmt
             +--rw lag* [aggName]
                +--rw aggName            string
                +--rw aggMode?           string
                +--rw primaryPorts*      string
                +--rw protectionPorts*   string

  ```



  ### TSM_MODE: NED /config/tsm/L0ServiceIntentFacade model:
  - Used for handling resources of type: ifd.v6.resourceTypes.L0ServiceIntentFacade

  ```
       +--rw L0ServiceIntentFacade* [label]
       |  +--rw label         string
       |  +--rw productId?    string
       |  +--rw properties
       |     +--rw name?                     string
       |     +--rw customerName?             string
       |     +--rw maximizeCapacity?         boolean
       |     +--rw directionality?           string
       |     +--rw osrpEnabled?              boolean
       |     +--rw centerFrequency?          string
       |     +--rw interactive_mode?         string
       |     +--rw turnUpDateTime?           string
       |     +--rw transponder_source?       string
       |     +--rw totalCapacity
       |     |  +--rw isForMultipleRoutes?   boolean
       |     |  +--rw unit?                  string
       |     |  +--rw value?                 string
       |     +--rw endPoints* [index]
       |     |  +--rw index             uint16
       |     |  +--rw networkElement
       |     |  |  +--rw name?   string
       |     |  +--rw shelf?            string
       |     |  +--rw port?             string
       |     |  +--rw slot?             string
       |     |  +--rw photonicTpeId?    string
       |     +--rw primaryPathConstraints
       |     |  +--rw includeRouteObjects* [nodeName]
       |     |  |  +--rw nodeName          string
       |     |  |  +--rw objectType?       string
       |     |  |  +--rw constraintType?   string
       |     |  +--rw excludeRouteObjects* [nodeName]
       |     |  |  +--rw nodeName          string
       |     |  |  +--rw objectType?       string
       |     |  |  +--rw constraintType?   string
       |     |  +--rw pathConstraint
       |     |     +--rw pathConstraintOption?   string
       |     +--rw note
       |        +--rw lastUpdatedBy?     string
       |        +--rw lastUpdatedTime?   string
       |        +--rw noteMsg?           string

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

  `$NSO_RUNDIR/logs/ned-ciena-mcp-gen-1.0-<device name>.trace`

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
     admin@ncs(config)# devices device dev-1 ned-settings ciena-mcp logger \
                       level [debug | verbose | info | error]
     admin@ncs(config)# commit
     ```

     Alternatively the log level can be set globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices device global-settings ned-settings ciena-mcp logger \
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
     admin@ncs(config)# java-vm java-logging logger com.tailf.packages.ned.cienamcp \
                       level level-all
     admin@ncs(config)# commit
     ```

  4. Configure the NED to log to the Java logger

     ```
     admin@ncs(config)# devices device dev-1 ned-settings ciena-mcp logger java true
     admin@ncs(config)# commit
     ```

     Alternatively Java logging can be enabled globally affecting all configured
     device instances using this NED package.

     ```
     admin@ncs(config)# devices global-settings ned-settings ciena-mcp logger java true
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

  ## SUMMARY on the NED usage for Service config handling (BSM Mode)
  ---

  It is enabled only when setting mcp-service-model-api ned-settings to VERSION_4_BSM_L2SERVICE: 
  * /ned-settings/ciena-mcp/mcp-service-model-api VERSION_4_BSM_L2SERVICE

  -----------------------------------------
  ###  BSM_CONFIG_1 : L2 service config provisioning
  -----------------------------------------  
  * Deployed under /config / services / l2Service
      * Supported operations: **create** | **delete** | **sync** 
      * **Update** operation NOT SUPPORTED. 

  ---
  Sample config loaded in the CDB: 
  ---
  ```
  devices device netsim-0
   config
    services
     l2Service NED-EVPL-1.2.1
      productId 5e43210d-ce79-44c5-aecc-1a2b34c5d6
      properties serviceType EVPL
      properties customerName TEST-CX-1
      properties customerSegment Mobility
      properties service  P2P
      properties transportProtection PROTECTED_BEST_EFFORT
      properties cos
       ingressCosPolicy L3DscpCos
      !
      properties serviceEndPointList interfaceType A_UNI
       node    LAB_A_3928
       port    100/GigE-1
       vlanIds 121
       bwp
        cbs 64
        cir 10001
        ebs 64
        eir 10002
       !
      !
      properties serviceEndPointList interfaceType Z_UNI
       node    LAB_B_3928
       port    100/GigE-2
       vlanIds 121
       bwp
        cbs 64
        cir 10001
        ebs 64
        eir 10002
       !
      !
     !
    !
   !
  !
  ```

  -----------------------------------------
  ### BSM_CONFIG_2 : L2 service live check:
  -----------------------------------------
  * Added enhancements to show live status services by label too, or in bulk, all services
  * Added provisioningStatus parameter display in the results


  i.e. getting a single service status by label:
  ---
  ```
  admin@ncs(config-device-deviceName01)# live-status exec l23-service get-services label NED-EPL-1.5.2
  result {
      requestStatus passed
  }
  response {
      items {
          label NED-EPL-1.5.2
          id 5ea6a1f1-b27b-46ab-be1f-9ec299121cd1
          resourceTypeId <cxDependent>.resourceTypes.L2Service
          productId 5e43210d-ce79-44c5-aecc-1a2b34c5d6
          tenantId 7488eaff-a7fb-4dd8-b4da-48fa3e2c0318
          subDomainId 7fd5144c-552f-39a3-9464-08d3b9cfb251
          orchState active
          reason
          properties {
              serviceType EPL
              provisionStatus AWAITING-ACTION
              transportProtection PROTECTED_BEST_EFFORT
          }
      }
  }
  ```

  or just fetching all live statuses for all existing services:
  ---
  ```
  admin@ncs(config-device-deviceName01)# live-status exec l23-service get-services
  result {
      requestStatus passed
  }
  response {
      items {
          label NED-EVPL-1.2.1
          id 5ea6a082-7d94-4e41-8b5d-2339b5f4eaf5
          resourceTypeId <cxDependent>.resourceTypes.L2Service
          productId 5e43210d-ce79-44c5-aecc-1a2b34c5d6
          tenantId 7488eaff-a7fb-4dd8-b4da-48fa3e2c0318
          subDomainId 7fd5144c-552f-39a3-9464-08d3b9cfb251
          orchState active
          reason
          properties {
              serviceType EVPL
              provisionStatus AWAITING-ACTION
              transportProtection PROTECTED_BEST_EFFORT
          }
      }
      items {
          label NED-DH-EVPL-1.4.1
          id 5ea6a09f-45b4-467b-96e7-14ed7945dcac
          resourceTypeId <cxDependent>.resourceTypes.L2Service
          productId 5e43210d-ce79-44c5-aecc-1a2b34c5d6
          tenantId 7488eaff-a7fb-4dd8-b4da-48fa3e2c0318
          subDomainId 7fd5144c-552f-39a3-9464-08d3b9cfb251
          orchState active
          reason
          properties {
              serviceType EVPL
              provisionStatus AWAITING-ACTION
              transportProtection PROTECTED_BEST_EFFORT
          }
      }
      items {
          label NED-EPL-1.5.2
          id 5ea6a1f1-b27b-46ab-be1f-9ec299121cd1
          resourceTypeId <cxDependent>.resourceTypes.L2Service
          productId 5e43210d-ce79-44c5-aecc-1a2b34c5d6
          tenantId 7488eaff-a7fb-4dd8-b4da-48fa3e2c0318
          subDomainId 7fd5144c-552f-39a3-9464-08d3b9cfb251
          orchState active
          reason
          properties {
              serviceType EPL
              provisionStatus AWAITING-ACTION
              transportProtection PROTECTED_BEST_EFFORT
          }
      }
  }
  ```


  -------------------------------
  ###  BSM_CONFIG_3 : L2 service update:
  -------------------------------
  * showing existing config on a particular existing service:

  ```
  admin@ncs(config-config)# services l2Service NED-EPL-1.5.2
  admin@ncs(config-l2Service-NED-EPL-1.5.2)# show full
  devices device netsim-0
   config
    services
     l2Service NED-EPL-1.5.2
      productId 5e43210d-ce79-44c5-aecc-1a2b34c5d6
      properties serviceType EPL
      properties customerName TEST-CX-4
      properties customerSegment Mobility
      properties service  P2MP
      properties transportProtection PROTECTED_BEST_EFFORT
      properties cos
       ingressCosPolicy L3DscpCos
      !
      properties serviceEndPointList interfaceType A_ENNI
       node    LAB_A_3928
       port    100/GigE-1
       vlanIds 1531
       bwp
        cbs 64
        cir 1234
        ebs 64
        eir 4567
       !
      !
      properties serviceEndPointList interfaceType Z_ENNI
       node    LAB_B_3928
       port    100/GigE-2
       vlanIds 1531
       bwp
        cbs 64
        cir 7890
        ebs 64
        eir 1234
       !
      !
      properties serviceEndPointList interfaceType Z_PRIME_ENNI
       node    LAB_A_3928
       port    GigE-5
       vlanIds 1531
       bwp
        cbs 64
        cir 7890
        ebs 64
        eir 1234
       !
      !
     !
    !
   !
  !
  ```

  * only very few certain elements are updatable (mainly bwp params):

  * device will reject updates if updates requested are not allowed or will revert any update requests if they go through.
  * device basically overwrites any update attempts, with minor exceptions, such as the bwp param, even if the REST api call response is succcessful and the request is accepted by the device. 
  * overall, updates of the services in BSM mode are not recommended. 

  ---
  Example update for:
  * `properties/serviceEndPointList/interfaceType{A_ENNI}/bwp/ebs` to 1234
  ----------------------------------------------------------------
  ```
  admin@ncs(config-l2Service-NED-EPL-1.5.2)# properties serviceEndPointList interfaceType A_ENNI bwp ebs 1234
  ```

  * Commit dry run to show pending ops:
  ----------------------------------------------------------------
  ```
  admin@ncs(config-bwp)# commit dry-run
  cli {
      local-node {
          data  devices {
                      device deviceName01 {
                          config {
                              services {
                                  l2Service NED-EPL-1.5.2 {
                                      properties {
                                          serviceEndPointList A_ENNI {
                                              bwp {
                  -                                ebs 64;
                  +                                ebs 1234;
                                              }
                                          }
                                      }
                                  }
                              }
                          }
                      }
                  }
      }
  }
  ```

  * Commit dry run native to show exactly what's going to the device:
  ----------------------------------------------------------------
  ```
  admin@ncs(config-bwp)# commit dry-run outformat native
  native {
      device {
          name deviceName01
          data PATCH : /bpocore/market/api/v1/resources/5ea6a1f1-b27b-46ab-be1f-9ec299121cd1?validate=false&obfuscate=true
                  {
                      "label":"NED-EPL-1.5.2",
                      "productId":"5e43210d-ce79-44c5-aecc-1a2b34c5d6",
                      "properties":{
                          "serviceType":"EPL",
                          "customerName":"TEST-CX-4",
                          "customerSegment":"Mobility",
                          "service":"P2MP",
                          "transportProtection":"PROTECTED_BEST_EFFORT",
                          "cos":{
                              "ingressCosPolicy":"L3DscpCos"
                          },
                          "serviceEndPointList":[{
                              "interfaceType":"A_ENNI",
                              "node":"LAB_A_3928",
                              "port":"100/GigE-1",
                              "vlanIds":"1531",
                              "bwp":{
                                  "cbs":64,
                                  "cir":1234,
                                  "ebs":1234,
                                  "eir":4567
                              }
                          },{
                              "interfaceType":"Z_ENNI",
                              "node":"LAB_B_3928",
                              "port":"100/GigE-2",
                              "vlanIds":"1531",
                              "bwp":{
                                  "cbs":64,
                                  "cir":7890,
                                  "ebs":64,
                                  "eir":1234
                              }
                          },{
                              "interfaceType":"Z_PRIME_ENNI",
                              "node":"LAB_A_3928",
                              "port":"GigE-5",
                              "vlanIds":"1531",
                              "bwp":{
                                  "cbs":64,
                                  "cir":7890,
                                  "ebs":64,
                                  "eir":1234
                              }
                          }]
                      },
                      "id":"5ea6a1f1-b27b-46ab-be1f-9ec299121cd1"
                  }
      }
  }
  ```

  * Commit changes:


  ```
  admin@ncs(config-bwp)# commit
  ```

  -----------------------------------------
  ### BSM_CONFIG_4 : L2 service delete:
  -----------------------------------------
  Delete example: 

  ```
  admin@ncs(config-config)# no services l2Service NED-EPL-1.5.2
  admin@ncs(config)# commit dry-run outformat native
  native {
      device {
          name deviceName01
          data DELETE : /bpocore/market/api/v1/resources/5ea6a1f1-b27b-46ab-be1f-9ec299121cd1?validate=false
      }
  }
  admin@ncs(config)# commit
  ```



  ---
  ## TSM_MODE: NED config handling under TSM Mode
  ---

  It is enabled only when setting mcp-service-model-api ned-settings to VERSION_6_TSM: 
  - i.e.: `admin@ncs(config-device-deviceName01)# ned-settings ciena-mcp mcp-service-model-api VERSION_6_TSM`


  -------------------------------------------------------
  ###  TSM_CONFIG_1 : Sync-from & check schema structure:
  -------------------------------------------------------

  ```
  admin@ncs(config-device-deviceName01)# config tsm ?
  Possible completions:
    L1OTNSwitchingProtService   Resources of type: ifd.v6.resourceTypes.L1OTNSwitchingProtServiceIntentFacade
    L1OTNSwitchingService       Resources of type: ifd.v6.resourceTypes.L1OTNSwitchingServiceIntentFacade
    eLineServices               Resources of type: ifd.v6.resourceTypes.L2ServiceIntentFacade
    l1Services                  Resources of type: ifd.v6.resourceTypes.L1NCPClientServiceIntentFacade
    mplsTunnels                 Resources of type: ifd.v6.resourceTypes.MplsTunnelIntentFacade
    tdmCircuits                 Resources of type: ifd.v6.resourceTypes.TDMServiceIntentFacade
  ```  

  -------------------------------------------------------
  ###  TSM_CONFIG_1.2 : MPLS Tunnel
  -------------------------------------------------------

  - addresses resources of type : **ifd.v6.resourceTypes.MplsTunnelIntentFacade**

  ```
  admin@ncs(config-mplsTunnels-MPLS_TUNNEL_TEST_001)# show full
  devices device deviceName01
   config
    tsm mplsTunnels name MPLS_TUNNEL_TEST_001
     productId 012d3cba-9f33-11ec-8c39-4fd50172ad0b
     properties
      backupPathName        MPLS_TUNNEL_TEST_001_BAK
      turnUpDateTime        2022-11-22T05:32:42
      protectionType        PROTECTED
      interactive_mode      true
      bfdInterval           10msec
      aisRefreshTimer       10sec
      autoReversionPossible false
      globalDiversity diversityLevel LINK_DIVERSE
      globalDiversity selectionCriteria BEST_EFFORT
      bandwidth assignedBandwidth 1
      bandwidth bandwidthLockout false
      bandwidth assignedBandwidthUnit mbps
      bandwidth bookingFactor 1
      endPointA
       networkElement name FRED5171-0101
       primary port 2
       primary slot 1
       backup port 32
      !
      endPointZ
       networkElement name FRED5142-0101
       primary port 23
       backup port 23
      !
      routingConstraints 0
       includeRouteObjects 0
        objectType     NODE_NAME
        constraintType HARD
        locations nodeName FRED6500-0301
        !
       !
      !
      routingConstraints 1
       includeRouteObjects 0
        objectType     NODE_NAME
        constraintType HARD
        locations nodeName FRED6500-0101
        !
       !
      !
     !
    !
   !
  !
  ```


  -------------------------------------------------------
  ###  TSM_CONFIG_1.3 : E-Line Services 
  -------------------------------------------------------

  - addresses resources of type : **ifd.v6.resourceTypes.L2ServiceIntentFacade**

  ```
  admin@ncs(config-eLineServices-EPL_SERVICE_001)# show full
  devices device deviceName01
   config
    tsm eLineServices name EPL_SERVICE_001
     productId  9876abcd-9f33-11ec-8c39-4fd50172ad0b
     discovered false
     properties
      type                FDFR
      structure           P2P
      serviceType         EPL
      userLabel           "test LABEL"
      protectedPseudowire false
      oamEnabled          true
      allowQinQSpur       true
      interactive_mode    true
      routeMeta originator BP2
      constraints
       transport directionality bidirectional
       routes A Z
        protection unprotected
        includeRouteObjects 0
         objectType     LSP_NAME
         constraintType HARD
         locations nodeName FRED5142-0101
          lspName EPL_SERVICE_LSP_NAME
         !
        !
       !
      !
      endpoints node FRED5142-0101 role A_UNI
       settings
        oamEnabled         true
        ccmTransmitEnabled true
        dmmEnabled         true
        slmEnabled         true
        details 0
         flowSettings 0
          controlFrameTunneling            enabled
          controlFrameTunnelingProfileName Default_Tunnel-All
          location
           port 2
          !
          ingressPolicer
           cbs 5
           cir 100000
           ebs 0
           eir 0
          !
          ingressCosSetting
           ingressCosPbit   0
           ingressCosPolicy fixed
          !
         !
        !
       !
      !
      endpoints node FRED5171-0101 role Z_UNI
       settings
        oamEnabled         true
        ccmTransmitEnabled true
        dmmEnabled         true
        slmEnabled         false
        details 0
         flowSettings 0
          controlFrameTunneling            enabled
          controlFrameTunnelingProfileName Default_Tunnel-All
          location
           port 1
          !
          ingressPolicer
           cbs 5
           cir 100000
           ebs 0
           eir 0
          !
          ingressCosSetting
           ingressCosPbit   0
           ingressCosPolicy fixed
          !
         !
        !
       !
      !
     !
    !
   !
  !
  ```


  -------------------------------------------------------
  ###  TSM_CONFIG_1.4 : l1Services 
  -------------------------------------------------------

  - addresses resources of type : **ifd.v6.resourceTypes.L1NCPClientServiceIntentFacade**

  ```
  admin@ncs(config-l1Services-L1-SERVICE-001)# show full
  devices device deviceName01
   config
    tsm l1Services name L1-SERVICE-001
     label     L1-SERVICE-001
     productId 5f3f55aa-9a05-479a-bb10-8dc27ccc4562
     properties
      customerName     CustomerName
      turnUpDateTime   2021-02-12T03:25:06.989881+0000
      directionality   bidirectional
      layerRate        DSR_10GE
      interactive_mode true
      endPoints 0
       networkElement name TEB4-C6500-0001
       ains               ACTIVE
       shelf              1
       port               1
       signalConditioning NONE
       slot               12
      !
      endPoints 1
       networkElement name TEB4-C6500-0002
       ains               ACTIVE
       shelf              1
       port               1
       signalConditioning NONE
       slot               5
      !
     !
    !
   !
  !
  ```


  -------------------------------------------------------
  ###  TSM_CONFIG_1.5 : TDM Circuits
  -------------------------------------------------------

  - addresses resources of type : **ifd.v6.resourceTypes.TDMServiceIntentFacade**

  ```
  admin@ncs(config-tdmCircuits-TDM-CIRCUIT-001)# show full
  devices device deviceName01
   config
    tsm tdmCircuits TDM-CIRCUIT-001
     productId abc1a2b3c-1a94-4e70-958a-375ca97f830d
     properties routeMeta originator BP2
     properties serviceType  EVPL
     properties protectedPseudowire false
     properties oamEnabled   false
     properties linearOnly   false
     properties allowQinQSpur true
     properties reuseExistingPseudowire false
     properties interactive_mode true
     properties tdm layerRate E1
     properties tdm endPoints 0
      networkElement name NE-C5142-0001
      tdmCosSettings pcp 5
      port        10
      signalIndex None
     !
     properties tdm endPoints 1
      networkElement name NE-C5142-0002
      tdmCosSettings pcp 5
      port        8
      signalIndex 3
     !
     properties endpoints node NE-C5142-0001 role A_UNI
      settings
       details 0
        flowSettings 0
         filter
          outerVlanId [ 100 ]
         !
         profiles profileName VLAN
          profileType filter
         !
         location
          port FTP
         !
        !
       !
      !
     !
     properties endpoints node NE-C5142-0002 role Z_UNI
      settings
       details 0
        flowSettings 0
         filter
          outerVlanId [ 100 ]
         !
         profiles profileName VLAN
          profileType filter
         !
         location
          port FTP
         !
        !
       !
      !
     !
     properties globalDiversity diversityLevel LINK_DIVERSE
     properties globalDiversity selectionCriteria MANDATORY
     properties primaryPathConstraints includeRouteObjects nodeName NE-C5142-0001
      lspName        LSP_NAME-003
      objectType     LSP_NAME
      constraintType HARD
     !
    !
   !
  !

  ```


  -------------------------------------------------------
  ###  TSM_CONFIG_1.6 : L1OTN Switching Service 
  -------------------------------------------------------
  - addresses resources of type : **ifd.v6.resourceTypes.L1OTNSwitchingServiceIntentFacade**

  ```
  admin@ncs(config-L1OTNSwitchingService-L1OTN-SW-001)# show full
  devices device deviceName01
   config
    tsm L1OTNSwitchingService name L1OTN-SW-001
     label     L1OTN-SW-001
     productId 12ab34cd-201a-4b1b-af74-e599d7dc6738
     properties
      layerRate        DSR_100GE
      interactive_mode true
      directionality   bidirectional
      routingType      MCP_DEFINED
      diversityType    NONE
      endPointA
       networkElement name NENAME00001
       ains               ACTIVE
       signalConditioning NONE
       port               2
       shelf              1
       slot               1
      !
      endPointZ
       networkElement name NENAME00002
       ains               ACTIVE
       signalConditioning NONE
       port               2
       shelf              1
       slot               1
      !
      sncAttributes
       controlPlanePackage resiliencyType MESH_RESTORABLE
       controlPlanePackage dtlSetExclusivity Working
       controlPlanePackage regroomAllowed true
       controlPlanePackage rhp false
       sncResiliencyController autoReversionType delay
       sncResiliencyController waitToRevertDelay 300
       primaryPathConstraints pathConstraint pathConstraintOption MIN_HOP
       restorationPathConstraints pathConstraint pathConstraintOption MIN_HOP
       numberOfRestorationPaths 0
      !
     !
    !
   !
  !

  ```


  -------------------------------------------------------
  ###  TSM_CONFIG_1.7 : L1OTN PROT Switching Service 
  -------------------------------------------------------
  - addresses resources of type : **ifd.v6.resourceTypes.L1OTNProtSwitchingServiceIntentFacade**

  ```
  admin@ncs(config-L1OTNSwitchingProtService-L1_OTN_PROT_001)# show full
  devices device deviceName01
   config
    tsm L1OTNSwitchingProtService name L1_OTN_PROT_001
     label     L1_OTN_PROT_001
     productId 60b73c20-37d8-4b7d-8b7c-a045c9960bd7
     properties
      layerRate        OC3
      interactive_mode false
      directionality   bidirectional
      endPointA
       protServiceEndpoint networkElement name G5821-2-NEE-00001
       protServiceEndpoint port 1
       protServiceEndpoint shelf 2
       protServiceEndpoint slot 3
      !
      endPointZ
       protServiceEndpoint networkElement name G5821-2-NEE-00002
       protServiceEndpoint port 2
       protServiceEndpoint shelf 3
       protServiceEndpoint slot 4
      !
      workSncAttributes
       controlPlanePackage resiliencyType PERMANENT
       primaryPathConstraints pathConstraint pathConstraintOption ADMIN_WT
       primaryPathConstraints pathConstraint costCriteria DISABLED
      !
      protectSncAttributes
       controlPlanePackage resiliencyType PERMANENT
       primaryPathConstraints pathConstraint pathConstraintOption ADMIN_WT
       primaryPathConstraints pathConstraint costCriteria DISABLED
      !
     !
    !
   !
  !

  ```


  -------------------------------------------------------
  ###  TSM_CONFIG_1.8 : LAG management
  -------------------------------------------------------
  - Complicated flow used for provisioning; 
  - Combo of live-status commands + NED config data can be used for full lifecycle/provisioning of ethernet port LAG management resources.  

  ```
  admin@ncs(config-device-deviceName01)# config tsm networkConstructs neName FRED5142-0001
  admin@ncs(config-networkConstructs-FRED5142-0001)# show full
  devices device deviceName01
   config
    tsm networkConstructs neName FRED5142-0101
     ncid            d53bcf8e-2e8e-3b5e-ade7-368eabb12b34
     typegroup       PN6x
     sessionid       acca4fd3-2bbe-4679-849d-7c2e34843e56
     softwareVersion saos-06-20-00-0206
     deviceType      "5142 Service Aggregation Switch"
     resourceType    5142
     ethernetPortMgmt
      lag LAG_Name-01
       primaryPorts    [ 12 34 ]
      !
      lag LAG_Name-02
       primaryPorts [ 24/4 ]
      !
      lag LAG_Name-03
       primaryPorts    [ 22 23 ]
       protectionPorts [ 10 24/0 ]
      !
     !
    !
   !
  !

  ```

  # Example of full provisioning of a LAG for 6500 network Element type: 

  ----------------------------------------------------
  # TSM_CONFIG_1.8.1 : 6500 NE LAG MANAGEMENT :
  ----------------------------------------------------

  ## PRE-REQUISITES:
  a) LOAD LATEST NED BUILD + PACKAGES RELOAD
  b) SYNC-FROM
  c) COLLECT NETWORK ELEMENT DETAILS NEEDED from device config (NE6500 IN THIS EXAMPLE):

  ex: 
  ---
  ```
  admin@ncs(config-networkConstructs-FRED6500-1234)# show full
  devices device mcp-model
   config
    ...
    tsm networkConstructs neName FRED6500-1234
     ncid            _network_construct_ID_
     typegroup       Ciena6500
     sessionid       _session_management_id_
     softwareVersion 12.85
     deviceType      "6500 32-Slot Packet-Optical Shelf Assembly"
     resourceType    6500
     group           9
     shelf           1
     ethernetPortMgmt
      lag LAG_TEST-001
       primaryPorts [ 24/3 24/4 ]
      !
     !
    !
    ...
    ...
    ...
   !
  ! 
  ```



  - params that we will use in all the live status requests:

  ```
      neName FRED6500-1234 
      ncid _network_construct_ID_ 
      typegroup Ciena6500 
      sessionid _session_management_id_ 
      softwareVersion 12.85 
      deviceType "6500 32-Slot Packet-Optical Shelf Assembly" 
      resourceType 6500 
      group 9 
      shelf 1
  ```
  ---




  ## TSM_CONFIG_1.8.1 : Part 1: get ethernet port status:
  ------------------------------
  ```
  live-status exec tsm get-ethernet-port-status neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1
  ```


  ## TSM_CONFIG_1.8.1 : Part 2: disable port 24/3 / 24/4
  ------------------------------
  ```
  live-status exec tsm update-ethernet-port-state query { neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1 } linkState Disabled port 24/3
  ```


  ## TSM_CONFIG_1.8.1 : Part 3: enable ports:
  ------------------
  ```
  live-status exec tsm update-ethernet-port-state query { neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1 } linkState Enabled port 24/4
  ```


  ## TSM_CONFIG_1.8.1 : Part 4: resync components:
  ------------------------
  -  managementSessionId is sessionid from the device config

  ```
  live-status exec tsm manage-lag resync-components managementSessionId _session_management_id_
  ```


  ## TSM_CONFIG_1.8.1 : Part 5: create 6500 LAG:
  ---------------------
  ```
  config tsm networkConstructs neName FRED6500-1234 ethernetPortMgmt lag LAG_NSO-2305 primaryPorts [ 24/3 24/4 ]
  commit dry-run
  commit dry-run outformat native
  commit
  ```


  ## TSM_CONFIG_1.8.1 : Part 6: get ALL interfaces for 6500-0101:
  --------------------------------------
  ```
  live-status exec tsm manage-lag get-interfacemanagement-values neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1

  ```

  ## TSM_CONFIG_1.8.1 : Part 6.1 get interface IP-IF_LAG-001:
  ---------------------------------
  ```
  live-status exec tsm manage-lag get-interfacemanagement-values neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1 interfaceName IP-IF_LAG-001

  ```

  ## TSM_CONFIG_1.8.1 : Part 7 create interfacemanagement:
  ------------------------------
  ```
  live-status exec tsm manage-lag create-interfacemanagement neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 value { group 9 shelf 1 interfaceName IP-IF_LAG-230 subnetmask 30 interfaceIfMtu 1500 interfaceIpAddr 10.0.110.1 vlan 1720 vsName VS_LAG-2305 port LAG_NSO-2305 }

  ```

  ## TSM_CONFIG_1.8.1 : Part 7.2 get interfacemanagement IP-IF_LAG-230 details:
  ----------------------------------------------------
  ```
  live-status exec tsm manage-lag get-interfacemanagement-values neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1 interfaceName IP-IF_LAG-230
  ```


  ## TSM_CONFIG_1.8.1 : Part 7.2 get all interfacemanagement IP-IF_LAG-230 details:
  --------------------------------------------------------
  ```
  live-status exec tsm manage-lag get-interfacemanagement-values neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1 
  ```


  ## TSM_CONFIG_1.8.1 : Part 7.3: resync components:
  ------------------------
  -  managementSessionId is sessionid from the device config
  ```
  live-status exec tsm manage-lag resync-components managementSessionId _session_management_id_
  ```


  ## TSM_CONFIG_1.8.1 : Part 8 UPDATE interfacemanagement IP-IF_LAG-2305 vlan to 1721:
  --------------------------------------------------------
  ```
  live-status exec tsm manage-lag update-interfacemanagement neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 value { interfaceName IP-IF_LAG-230 vlan 1721 shelf 1 group 9 }
  ```

  ## TSM_CONFIG_1.8.1 : Part 8.1 UPDATE interfacemanagement IP-IF_LAG-2305 - DISABLE interface:
  --------------------------------------------------------
  ```
  live-status exec tsm manage-lag update-interfacemanagement neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 value { interfaceName IP-IF_LAG-230 shelf 1 group 9 interfaceState disabled }
  ```


  ## TSM_CONFIG_1.8.1 : Part 8.2 UPDATE interfacemanagement IP-IF_LAG-2305 - ENABLE interface:
  --------------------------------------------------------
  ```
  live-status exec tsm manage-lag update-interfacemanagement neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 value { interfaceName IP-IF_LAG-230 shelf 1 group 9 interfaceState enabled }
  ```

  ## TSM_CONFIG_1.8.1 : Part 8.3 UPDATE interfacemanagement IP-IF_LAG-2305 - DISABLE interface:
  --------------------------------------------------------
  ```
  live-status exec tsm manage-lag update-interfacemanagement neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 value { interfaceName IP-IF_LAG-230 shelf 1 group 9 interfaceState disabled }
  ```

  ## TSM_CONFIG_1.8.1 : Part 9.1 DELETE interfacemanagement v1 : short name:
  --------------------------------------------------------
  ```
  live-status exec tsm manage-lag delete-interfacemanagement neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1 ROW_ID IP-IF_LAG-230
  ```

  ## TSM_CONFIG_1.8.1 : Part 9.2 DELETE interfacemanagement v2 : long name (row id):
  --------------------------------------------------------
  ```
  live-status exec tsm manage-lag delete-interfacemanagement neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1 ROW_ID 1::::9::::IP-IF_LAG-230
  ```


  ## TSM_CONFIG_1.8.1 : Part 10: disable ports 24/3 / 24/4
  ------------------------------
  ```
  live-status exec tsm update-ethernet-port-state query { neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1 } linkState Disabled port 24/3
  ```

  ```
  live-status exec tsm update-ethernet-port-state query { neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1 } linkState Disabled port 24/4
  ```

  ## TSM_CONFIG_1.8.1 : Part 11. remove ports from LAG
  ------------------------------
  ```
  live-status exec tsm manage-lag update-lag-entry neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 group 9 shelf 1 lagName LAG_NSO-2305 operation removeports value { primaryPorts [ 24/3 24/4 ] }
  ```

  ## TSM_CONFIG_1.8.1 : Part 12. delete LAG:
  ------------------------------
  ```
  config tsm networkConstructs neName FRED6500-1234 
  no ethernetPortMgmt lag LAG_NSO-2305
  commit dry-run
  commit dry-run outformat native
  commit
  ```


  ## TSM_CONFIG_1.8.1 : Part 13. additional commands - VIRTUALSWITCH :
  -------------------------------------------
  - to get VS info, use **operation get**
  ```
  live-status exec tsm manage-lag manage-virtualswitch-entry query { neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 } virtualSwitchName VS_LAG-2305 operation get
  ```
  - to delete virtualswitch  use **operation delete**:
  ```
  live-status exec tsm manage-lag manage-virtualswitch-entry query { neName FRED6500-1234 ncid _network_construct_ID_ typegroup Ciena6500 sessionid _session_management_id_ softwareVersion 12.85 deviceType "6500 32-Slot Packet-Optical Shelf Assembly" resourceType 6500 } virtualSwitchName VS_LAG-2305 operation delete
  ```



  -------------------------------------------------------
  ###  TSM_CONFIG_1.9 : L0ServiceIntentFacade
  -------------------------------------------------------
  - Market resources provisioning
  - Discovered services are pushed as FREs 
  - Complex handling TPE-FRE relationship.


  ```
  admin@ncs(config-device-lab)# show full-configuration devices device lab01 config tsm L0ServiceIntentFacade
  devices device lab01
  config
    tsm L0ServiceIntentFacade label TEST-SERVICE-ABC-100
     productId 2267b0e0-a352-11ed-8f50-c7aa620abcde
     properties
      name               TEST-SERVICE-ABC-100
      maximizeCapacity   false
      directionality     bidirectional
      osrpEnabled        false
      centerFrequency    123.45
      interactive_mode   false
      transponder_source Ciena
      totalCapacity isForMultipleRoutes false
      totalCapacity unit  GBPS
      totalCapacity value 100
      endPoints 0
       networkElement name ABCD-ROADM-0101
       shelf         1
       port          1
       slot          3
       photonicTpeId abcd96ad-1234-1234-1234-ef1492e3b8e6::TPE_abcd96ad-1234-1234-1234-ef1492e3b8e6::EQPT_2_84-59-PTP
      !
      endPoints 1
       networkElement name EFGH-ROADM-0101
       shelf         1
       port          1
       slot          5
       photonicTpeId efgh241a-1234-1234-1234-9ed4bd31c2d6::TPE_abcd96ad-1234-1234-1234-ef1492e3b8e6::EQPT_2_84-59-PTP
      !
      primaryPathConstraints includeRouteObjects nodeName IJKL-ROADM-0101
       objectType     NODE_NAME
       constraintType HARD
      !
      primaryPathConstraints pathConstraint pathConstraintOption MIN_HOP
      note lastUpdatedBy userName
      note lastUpdatedTime 2023-06-01T00:00:01
      note noteMsg    noteMessage
     !
    !
  ```


# 5. Built in live-status actions
---------------------------------

  # Live-status commands - actions 
  ## Summary and conventions
  ---

  - Juniper style CLI:  
      `% request devices device *device-name* live-status exec **command** *arg* *argValue*`
  - Cisco style CLI:      
      `# devices device *device-name* live-status exec **command** *arg* *argValue*`


  The custom response consists of two separate sections, **RESULT** and **RESPONSE** sections, as following:
  ---
  ### 1. **result** section, which is modeled under *'grouping exec-result-container result'* container in the *ciena-mcp-stats* yang module:

  This section will ALWAYS be populated within all the responses of the actions performed, as a general rule of thumb. 

  This section will be used as a first status check reference.

  Most important elements of the **result** section are: 
  - **requestStatus** 
  - **resultString** 
  - **errorMessage**

  Example:
  ```
  % request devices device **device-name** live-status exec **command** **arg** **argValue**
  result {
      resultString    <...>             // Raw Http api response string received from device
      errorMessage    <...>             // Error message, if available within the http response or if within exception captured
      errorCode       <...>             // Error code, if available
      requestStatus   <failed|passed>   // <passed> or <failed> general status of the request
      ...
      nedMessage      <...>             // Custom message generated inside the NED trying to clarify status
  }
  response {                            // response section ONLY if successful response available
  <...>
  }
  ```

  ---------------------------
  ### 2. **response** section, which is modeled under 'grouping exec-result-container result' container in the ciena-mcp-stats yang module:

  - **response** section, which is modeled under each 'response' container in the ciena-mcp-stats yang module:
      - This section is customized for each and every action request.
      - This section is available ONLY when a successful response is available to be parsed
      - The parsed elements will be displayed as per the content designed within ciena-mcp-stats yang module.
      - Shall a request fail or not meet the expected response timeline, this section will not be populated. 
      - In general, it consists of either a leaf of type string, containing a full json object string result extracted from the device response, or a container with 'data' or 'items' arrays or direct json decomposed content extracted. 

  ```
  result {
      <...>
      requestStatus   passed           // <passed> general status of the processed request should be passed to have some relevant data in response section
      <...>
  }
  response {                           // response section ONLY if successful response available
      <...>                            // custom parameters parsed at output per each call.
      data <...>                       // most of the responses content are parsed under 'data' container
  }
  ```

  # Most common Live status command used in BSM MODE:

  **Top commands used in BSM mode:**

      admin@ncs(config-device-netsim-0)# live-status exec
      Possible completions:
      audits                             Actions needed for Audit report handling and updates
      get-jobId-status                   Command to fetch the status and data available for a previously scheduled jobId
      get-network-construct-id           Command to fetch the Network Construct element id
      get-network-element-availability   Command to verify the port status of the Network Construct element
      get-network-element-content        Command to verify the parameters of the given element name
      get-network-element-userLabel      Command to retrieve userLabel of the nw element if available
      l23-service                        Actions needed for L2 L3 Service provisioning
      push-mcp-configuration             Command to Push Configuration to MCP server
      show-constructs-elements-ids       Show id of all elements belonging to given network construct id
      upload-custom-script               Command to Upload Custom Script
      upload-empty-profile               Command to Upload Custom Script

  **Audit commands used in BSM mode:**

      admin@ncs(config-device-netsim-0)# live-status exec audits
      Possible completions:
      create-schedule              Command to Create Audit Schedule
      execute-audit                Command to Execute audit operation on given resource id; Modeled for type 'string'.resourceTypes.Audit
      get-compliance-reports       Command to get audit reports for all resources or by resource id for type <string>.resourceTypes.NonCompliant
      get-schedule                 Command to get Audit Schedule - default type: EPTConfig
      update-schedule-properties   Command to update EPTConfig Audit Schedule Properties by resource id

  **L23 Services provisioning commands used in BSM mode:**

      admin@ncs(config-device-netsim-0)# live-status exec l23-service
      Possible completions:
      create-service-profile      Command to create service profile
      delete-resource             Command to delete L2Service or Service profile or any other resource by id
      get-resources-nodes         Command to get Nodes by given resourceTypeId;
      get-resources-nodes-ports   Command to get given node ports by resourceTypeId;
      get-service-product-id      Command to get L2Service products
      get-service-profiles        Command to get service profiles
      get-services                Command to get L2 Services
      provision-service           Command to request L2Service provisioning to MCP by service id
      unprovision-service         Command to request L2Service un-provisioning to MCP by service id

  Some of these live status actions presented below:

  ---------------------------------------------------------------------
  ### get-network-construct-id : Fetch the Network Construct element id
  ---------------------------------------------------------------------
  ```
  Params:
      elementName    Name of the network element port to get the id for; Accepts 'any'
  ```

  Usage:

  ```
        % request devices device <device-name> live-status exec get-network-construct-id name <networkConstructName>
            or
        % request devices device <device-name> live-status exec get-network-construct-id name any
  ```


  ----------------------------------------------------------------------------------------------
  ### get-network-element-availability : Verify the port status of the Network Construct element
  * RETURNS TPEs RELATED DATA
  ----------------------------------------------------------------------------------------------

  Params:
  ```
      constructId   Unique ID of the network construct for element to search for (Obtained at show-port-id)
      elementName   Name of the network element port to search for; Accepts 'any' to fetch all TPEs filtered content
  ```

  Usage:

        % request devices device <device-name> live-status exec get-network-element-availability constructId <constructId> elementName <elementName>
             or
        % request devices device <device-name> live-status exec get-network-element-availability constructId <constructId> elementName any


  -----------------------------------------------------------------------------------------
  ### get-network-element-content : Verify the port status of the Network Construct element
  -----------------------------------------------------------------------------------------

  Params:
  ```
      constructId   Unique ID of the network construct for element to search for (Obtained at show-port-id)
      elementName   Name of the network element port to search for
  ```

  Usage:
  ```
        % request devices device <device-name> live-status exec get-network-element-content constructId <constructId> elementName <elementName>
  ```



  ------------------------
  ### upload-custom-script : Push custom configuration script
  ------------------------

  Params:
  ```
      protocolType   Protocol type;     tl1|cli
      scriptContent  Full content of the script to be created, then loaded                  !!! Check [WARNING] subsection below
      scriptFile     Full canonical path of the script to be loaded
      scriptName     Script short Name; if left empty, config file short name will be used
                      ** Providing just the scriptFile without a scriptName, will result in extracting the scriptName from the scriptFile given at input.
                      ** Providing just the scriptName without a scriptFile, will result in creating the scriptFile at the path defined in 'mcp-scripts-folder' under ned-settings.
      typeGroup      Script type group; Ciena6500|Waveserver
  ```

  ----------------------
  [WARNING]   ATTENTION!
  ----------------------
      scriptContent
          -> Input string with the content of the script should have all special characters carefully escaped, so that NSO will be able to accept the content on the input leaf of type string (RFC 6020).
          -> Most of the cautions to be considered for double commas (") and escape (\) chars and newlines
              -> i.e.
                  ->> commas char  "   escaped to:   \"
                  ->> escape char  \   escaped to:   \\
                  ->> escaping escaped commas  :  \\\"
                  ->> new line   represented with:   \n
              -> Whole content must be given on single line, with clear text encoded newline separators ( \n );

  For example, taking following input for scriptContent parameter:
  ``` 
  {
      "commands":[
      "INTF-INTF1:ELEM.LAB:INTF1-2-3:123:::SOME_PARAM=ENABLED,SOME_PARAM_2=\"SOME_STRING\",,:,;"
      ]
  }
  ```

  Should be passed to scriptContent leaf as the following one line compact string:
  ```
          "{\n  \"commands\":[\n    \"INTF-INTF1:ELEM.LAB:INTF1-2-3:123:::SOME_PARAM=ENABLED,SOME_PARAM_2=\\\"SOME_STRING\\\",,:,;\"\n  ]\n}"
  ```

  * Failing to do as instructed above will lead in getting the script content truncated at the first new line or at the first unescaped double comma within the string.

  * Providing both scriptContent and scriptFile, will result in overwriting the scriptFile with the given scriptContent.

  ------
  Usage:
  ------

  ### Scenario I, when scriptContent will be available from file:
  ---
  a) Providing both scriptFile and scriptName, without scriptContent:

  ```
      % request devices device <device-name> live-status exec upload-custom-script protocolType <tl1|cli> typeGroup <Ciena6500|Waveserver> scriptFile </full/path/to/script.txt> scriptName <script.txt>
  ```


  b) Providing just the scriptFile without a scriptName, will result in extracting the scriptName from the scriptFile given at input.
  ```
      % request devices device <device-name> live-status exec upload-custom-script protocolType <tl1|cli> typeGroup <Ciena6500|Waveserver> scriptFile </full/path/to/script.txt>
  ```

  c) Providing just the scriptName without a scriptFile, will result in creating the scriptFile at the path defined in 'mcp-scripts-folder' under ned-settings.
      % request devices device <device-name> live-status exec upload-custom-script protocolType <tl1|cli> typeGroup <Ciena6500|Waveserver> scriptName <script.txt>

  ### Scenario II, when scriptContent will be available from input:
  ---
  [WARNING] Regardless the input combinations from scenario I, the content of the scriptFile resulted will be overwritten with the content within scriptContent 

  This is why it is very important that the scriptContent is correctly formatted at input.
  ```
      % request devices device <device-name> live-status exec upload-custom-script protocolType <tl1|cli> typeGroup <Ciena6500|Waveserver> scriptFile </full/path/to/script.txt> scriptName <script.txt> scriptContent <string[a-zA-Z_-:;,.[]() ] with simple escaped quote \" or double escaped quote \\\" and newline as \n">
  ```
  or
  ```
      % request devices device <device-name> live-status exec upload-custom-script protocolType <tl1|cli> typeGroup <Ciena6500|Waveserver> scriptName <script.txt> scriptContent <string[a-zA-Z_-:;,.[]() ] with simple escaped quote \" or double escaped quote \\\" and newline as \n">
  ```
  or
  ```
      % request devices device <device-name> live-status exec upload-custom-script protocolType <tl1|cli> typeGroup <Ciena6500|Waveserver> scriptFile </full/path/to/script.txt> scriptContent <string[a-zA-Z_-:;,.[]() ] with simple escaped quote \" or double escaped quote \\\" and newline as \n">
  ```


  ----------------------------------------------------------
  ### upload-empty-profile : Push empty configuration script
  ----------------------------------------------------------

  Params:
  ```
      emptyProfilePath   Full canonical path of the empty profile script to be loaded
                          ** If none provided, no-profile.txt will be created at the path defined in 'mcp-scripts-folder' under ned-settings.
  ```

  Usage:
  ```
      % request devices device <device-name> live-status exec upload-empty-profile emptyProfilePath </path/to/no-profile.txt>
  ```


  -------------------------------------------------------------
  ### push-mcp-configuration : Push Configuration to MCP server
  -------------------------------------------------------------

  NOTE:
  --------
  ** For this command, either one of the params can be set, but AT LEAST ONE has to be provided.
      > if a file path is given, file is read and content is pushed as data.
      > if the json content is given directly, it is pushed as data and file read is omitted


  --------------------------------
  [WARNING]   ATTENTION!
  --------------------------------
      cmdPushJsonContent
          -> same cautions must be applied as for the upload-custom-script/scriptContent
          -> Input string with the content of the script should have all special characters carefully escaped,
              so that NSO will be able to accept the content on the input leaf of type string (RFC 6020).
          -> Most of the cautions to be considered for double commas (") and escape (\) chars and newlines
              -> i.e.
              ->> commas char  "   escaped to:   \"
              ->> escape char  \   escaped to:   \\
                  ->> escaping escaped commas  :  \\\"
              ->> new line   represented with:   \n
          -> Whole content must be given on single line, with clear text encoded newline separators ( \n );

  Params:
  ```
      cmdPushJsonContent   Raw content of json script to be loaded for pushing the config
      cmdPushJsonFile      Full canonical path of the json script whose content is to be loaded for pushing the config
  ```

  Usage:
  ```
  % request devices device <device-name> live-status exec push-mcp-configuration cmdPushJsonFile </path/to/file/configFile.json>
  ```

  or

  ```
  % request devices device <device-name> live-status exec push-mcp-configuration cmdPushJsonContent <string[a-zA-Z_-:;,.[]() ] with simple escaped quote \" or double escaped quote \\\" and newline as \n">
  ```


  -----------------------------------------------------------------------------
  ### show-constructs-elements-ids : Show all network constructor element names
  -----------------------------------------------------------------------------

  Params:
  ```
      networkConstructId   Enter networkConstructId to fetch network element ids for; Accepts 'any' to fetch them all
                              If 'any' or empty string is given, returns all ids for all constructs
  ```

  Usage:
  - `% request devices device <device-name> live-status exec show-constructs-elements-ids networkConstructId <networkConstructId>`
  or
  - `% request devices device <device-name> live-status exec show-constructs-elements-ids networkConstructId any`


  ---------------------------------------------------------------------------------------
  ### get-network-element-userLabel : Get userLabel of a Network Construct element if set
  ---------------------------------------------------------------------------------------

  Params:
  ```
      constructId   Unique ID of the network construct for element to search for (Obtained at show-port-id)
          elementName   Name of the network element port to search for
  ```

  Usage:
  - `% request devices device <device-name> live-status exec get-network-element-userLabel constructId <constructId> elementName <elementName>`


  ----------------------------------------------------------------------------------------------------
  ### get-jobId-status : Get jobId details and parse data Description and Conditioning Type if present
  ----------------------------------------------------------------------------------------------------

  Params:
  ```
      jobId       Scheduled jobId to fetch the data for
  ```

  Usage:
  - `% request devices device <device-name> live-status exec get-jobId-status jobId <jobId>`


  ## L23 service provisioning - BSM specific:
  ==============================================================================
  * Live status actions added to enable L23 service provisioning:
  ```
  admin@ncs(config-device-netsim-0)# live-status exec l23-service ?
  Possible completions:
      create-service-profile      Command to create service profile
      delete-resource             Command to delete L2Service or Service profile or any other resource by id
      get-resources-nodes         Command to show existing Nodes by given resourceTypeId;
      get-resources-nodes-ports   Command to show given node ports by resourceTypeId;
      get-service-product-id      Command to show L2Service products
      get-service-profiles        Command to show service profiles
      get-services                Command to show L2 Services
      provision-service           Command to request L2Service provisioning to MCP by service id
      unprovision-service         Command to request L2Service un-provisioning to MCP by service id
  ```

  --------------------------------------------------------------------------------------------
  ### get-resources-nodes : Get resources nodes to identify labels for fetching port later on:
  --------------------------------------------------------------------------------------------

  ```
  admin@ncs(config)# devices device <device-name> live-status exec l23-service get-resources-nodes
  result {
      requestStatus passed
  }
  response {
      items {
          label <LABEL-NAME>
          id <NODE_ID>
          resourceTypeId tosca.resourceTypes.NetworkConstruct
          productId <PRODUCT_ID>
          tenantId <TENANT_ID>
          subDomainId <SUBDOMAIN_ID>
      }
  }
  ```

  ------------------------------------------------------------------------------------
  ### get-resources-nodes-ports : Get resources node PORTS by the label fetched at 4.1
  ------------------------------------------------------------------------------------
  ```
  admin@ncs(config)# devices device <device-name> live-status exec l23-service get-resources-nodes-ports nodeLabel <LABEL-NAME>
  result {
      requestStatus passed
  }
  response {
      items {
          label <LABEL-NAME>_PTP_<INTERFACE_TYPE>
          id <NODE_PORT_ID>
          resourceTypeId tosca.resourceTypes.TPE
          productId <NODE_PRODUCT_ID>
          tenantId <TENANT_ID>
          subDomainId <SUBDOMAIN_ID>
      }
  }
  ```

  -----------------------------------------
  ### get-services : Get all L2 services      
  -----------------------------------------
  ```
  admin@ncs(config)# devices device <device-name> live-status exec l23-service get-services
  result {
      requestStatus passed
  }
  response {
      items {
          label <SERVICE_LABEL>
          id <SERVICE_ID>
          resourceTypeId {cxDependent}.resourceTypes.L2Service
          productId <SERVICE_PRODUCT_ID>
          tenantId <TENANT_ID>
          subDomainId <SUBDOMAIN_ID>
          orchState <ORCH STATE>
          reason <failure reason if any>
          properties {
              serviceType <EPL|EVPL|DH...>
              provisionStatus <PROVISION_STATUS>
              transportProtection <TRANSPORT_PROTECTION_MODE>
          }
      }
      items {
          label <SERVICE_LABEL>
          id <SERVICE_ID>
          resourceTypeId {cxDependent}.resourceTypes.L2Service
          productId <SERVICE_PRODUCT_ID>
          tenantId <TENANT_ID>
          subDomainId <SUBDOMAIN_ID>
          orchState <ORCH STATE>
          reason <failure reason if any
          properties {
              serviceType E-LINE EVPL
              provisionStatus <PROVISION_STATUS>
              transportProtection <TRANSPORT_PROTECTION_MODE>
          }
      }
      ...
  }
  ```


  ---------------------------------------------------
  ### get-services : Get specific L2 service by label
  ---------------------------------------------------
  ```
  admin@ncs(config)# devices device <device-name> live-status exec l23-service get-services label <SERVICE_LABEL>
  result {
      requestStatus passed
  }
  response {
      items {
          label <SERVICE_LABEL>
          id <SERVICE_ID>
          resourceTypeId {cxDependent}.resourceTypes.L2Service
          productId <SERVICE_PRODUCT_ID>
          tenantId <TENANT_ID>
          subDomainId <SUBDOMAIN_ID>
          orchState <ORCH STATE>
          reason <failure reason if any>
          properties {
              serviceType <EPL|EVPL|DH...>
              provisionStatus <PROVISION_STATUS>
              transportProtection <TRANSPORT_PROTECTION_MODE>
          }
      }
  }
  ```

  ------------------------------------------------------
  ### get-service-profiles : Get all L2 service profiles
  ------------------------------------------------------
  ```
  admin@ncs(config)# devices device <device-name> live-status exec l23-service get-service-profiles
  result {
      requestStatus passed
  }
  response {
      items {
          label <SERVICE_PROFILE_LABEL>
          id <SERVICE_PROFILE_ID>
          resourceTypeId {cxDependent}.resourceTypes.ServiceProfile
          productId <SERVICE_PROFILE_PRODUCT_ID>
          tenantId <TENANT_ID>
          subDomainId <SUBDOMAIN_ID>
          properties {
              serviceType E-LINE EPL
          }

      }
      items {
          label <SERVICE_PROFILE_LABEL>
          id 5dc1ade5-388d-4cbf-821a-b98cac70dbce
          resourceTypeId {cxDependent}.resourceTypes.ServiceProfile
          productId <SERVICE_PROFILE_PRODUCT_ID>
          tenantId <TENANT_ID>
          subDomainId <SUBDOMAIN_ID>
          properties {
              serviceType E-LINE EVPL
          }
      }
      ...
  }
  ```

  ----------------------------------------------------------
  ### get-service-product-id : Get all L2 service PRODUCT ID
  ----------------------------------------------------------
  ```
  admin@ncs(config)# devices device <device-name> live-status exec l23-service get-service-product-id
  result {
      requestStatus passed
  }
  response {
      items {
          id <SERVICE_PRODUCT_ID>
          resourceTypeId {cxDependent}.resourceTypes.L2Service
          title Cx L2 Service
          description "DESCRIPTION"
      }
  }
  ```

  ---------------------------------------------------
  ### create-service-profile : Create service profile
  ---------------------------------------------------
  ```
  devices device <device-name> live-status exec l23-service create-service-profile \
                                      label <STRING> \
                                      description "DESCRIPTION" \
                                      productId <STRING> \
                                      resourceTypeId {cxDependent}.resourceTypes.ServiceProfile \
                                      properties { \
                                          bwp { cbs <UINT> cir <UINT> ebs <UINT> eir <UINT> } \
                                          ccmInterval <STRING> \
                                          ccmPriority  <UINT> \
                                          cos { ingressCosPolicy <STRING> pbit <UINT> } \
                                          pseudowire { protectedPseudowire <BOOLEAN> } \
                                          transportProtection <STRING> \
                                          serviceType "E-LINE EPL" \
                                      } \
  ```


  -----------------------------------------
  ### create-service : Create service
  ### !!!! DEPRECATED since ciena-mcp NED version 1.5.4  !!!!
  -----------------------------------------
  - Logic is present under config, no reason to keep separate action to interact with config.

  -----------------------------------------
  ### delete-resource : Delete service or service profile or any other /resource by given ID.
  -----------------------------------------
  ### !!! WARNING !!! DO NOT USE THIS API TO DELETE L2SERVICES! Services are managed in config starting with NED version 1.5.4
  ```
  admin@ncs(config)# devices device <device-name> live-status exec l23-service delete-resource id <ID>
  result {
      requestStatus passed
  }
  response OK
  ```

  In case the resource is already deleted, we get explicit messages from the device:
  ```
  admin@ncs(config)# devices device lab1-bh live-status exec l23-service delete-resource id 5dc4119c-99d6-445e-878f-e838b903a88a
  result {
      requestStatus passed
  }
  response {"statusCode":404,"failureInfo":{"reason":"Resource '5dc4119c-99d6-445e-878f-e838b903a88a' not found","detail":""}}
  ```
  ------------------------------------
  ## AUDIT REPORTS HANDLING (BSM Mode)
  ------------------------------------
  ```
      admin@ncs(config-device-netsim-0)# live-status exec audits ?
      Possible completions:
          create-schedule              Command to Create Audit Schedule
          execute-audit                Command to Execute audit operation on given resource id; Modeled for type 'string'.resourceTypes.Audit
          get-compliance-reports       Command to get audit reports for all resources or by resource id for type <string>.resourceTypes.NonCompliant
          get-schedule                 Command to get Audit Schedule - default type: EPTConfig
          update-schedule-properties   Command to update EPTConfig Audit Schedule Properties by resource id
  ```
  -----------------------------------------
  ### > audits get-compliance-reports : Get Compliance reports
  -----------------------------------------
  Get custom reports by resourceType, expected (modeled***) for:
  - {cxDependent}.resourceTypes.NonCompliant
  - {cxDependent}.resourceTypes.NonComplianceReport
  - Any other existing resourceTypeId can be used, the outputs will be populated with minimal info, without properties content



      admin@ncs(config)# devices device <device-name> live-status exec audits get-compliance-reports ?
      Possible completions:
      id               OPTIONAL: id; Id of resource to get the report detail for; Default: all
      resourceTypeId   OPTIONAL: resourceTypeId of the report type to get; expects {cxDependent}.resourceTypes.NonCompliant or
                          ComplianceReport
                          defaults to type: {cxDependent}.resourceTypes.NonCompliant



  Examples of usage on different combinations
  ---
  ### > audits get-compliance-reports : Get all NonCompliant type reports (default values, no id or resourcetype needed, gets all reports)
  ---
  ```
      admin@ncs(config)# devices device <device-name> live-status exec audits get-compliance-reports
      result {
          requestStatus passed
      }
      response {
          items {
              id 5de79770-b0f7-419d-b2a2-f508d65982f6
              label LABEL
              resourceTypeId {cxDependent}.resourceTypes.NonCompliant
              productId 5de4de61-fa09-4c37-9f46-fea763d92085
              tenantId 314fd7ab-d662-4946-a0a1-eaf1bed002fd
              subDomainId 7fd5144c-552f-39a3-9464-08d3b9cfb251
              shared false
              discovered false
              desiredOrchState active
              orchState active
              reason 
              updatedAt 2019-12-04T11:24:32.841Z
              createdAt 2019-12-04T11:24:32.804Z
              properties {
                  bestFitSPLabel EVPL_UPR_PW
                  serviceType EVPL
                  resolvable false
                  transportProtection ANY
                  bestFitSPID 5de6258f-f345-4e42-97fa-fe6ad36ad467
                  serviceEndPointList {
                      endPointLabel 1234-5-6-A_UNI
                      endPointType A End
                  }
                  serviceEndPointList {
                      endPointLabel 5678-1-Z_UNI
                      endPointType Z End
                  }
                  differences {
                      nonCompliantProperty transportProtection
                      actual 
                      expected UNPROTECTED_ONLY
                  }

                ...

                  differences {
                      nonCompliantProperty Protected Pseudowire
                      actual False
                      expected True
                  }
              }
          }
      }
  ```   

  ---
  ### > audits get-compliance-reports : Get particular NonCompliant type report detail (resource id required, Resourcetype defaults to NonCompliant)
  ---
  ```
      admin@ncs(config)# devices device <device-name> live-status exec audits get-compliance-reports id 5de79776-9bc9-4e8e-9c4e-bec179423c1d
      result {
          requestStatus passed
      }
      response {
          items {
              id 5de79776-9bc9-4e8e-9c4e-bec179423c1d
              label CISCO_UP
              resourceTypeId {cxDependent}.resourceTypes.NonCompliant
              productId 5de4de61-fa09-4c37-9f46-fea763d92085
              tenantId 314fd7ab-d662-4946-a0a1-eaf1bed002fd
              subDomainId 7fd5144c-552f-39a3-9464-08d3b9cfb251
              shared false
              discovered false
              desiredOrchState active
              orchState active
              reason 
              updatedAt 2019-12-04T11:24:38.437Z
              createdAt 2019-12-04T11:24:38.400Z
              properties {
                  bestFitSPLabel EVPL_UPR_PW
                  serviceType EVPL
                  resolvable false
                  transportProtection ANY
                  bestFitSPID 5de6258f-f345-4e42-97fa-fe6ad36ad467
                  serviceEndPointList {
                      endPointLabel LAB_A_3928--7-A_UNI
                      endPointType A End
                  }
                  serviceEndPointList {
                      endPointLabel 3928-1--7-Z_UNI
                      endPointType Z End
                  }
                  differences {
                      nonCompliantProperty transportProtection
                      actual 
                      expected UNPROTECTED_ONLY
                  }

                  ...

                  differences {
                      nonCompliantProperty pbit
                      actual 2
                      expected 5
                  }
              }
          }
      } 
  ```

  ---
  ### > audits get-compliance-reports : Get all compliance custom type reports (Resourcetype required)
  ---
  ```
      admin@ncs(config)# devices device <device-name> live-status exec audits get-compliance-reports resourceTypeId {cxDependent}.resourceTypes.ComplianceReport
      result {
          requestStatus passed
      }
      response {
          items {
              id 5de7977b-3497-45b3-a1ba-263277f67613
              label ComplianceReport_2019-12-04 11:24:43.867035
              resourceTypeId {cxDependent}.resourceTypes.ComplianceReport
              productId 5de4de61-f261-44b3-9eb9-f5e749546118
              tenantId 314fd7ab-d662-4946-a0a1-eaf1bed002fd
              subDomainId 7fd5144c-552f-39a3-9464-08d3b9cfb251
              shared false
              discovered false
              desiredOrchState active
              orchState active
              reason
              updatedAt 2019-12-04T11:24:43.937Z
              createdAt 2019-12-04T11:24:43.894Z
              properties {
                  auditResult {
                      serviceId 5de671ec-c1f4-403a-9fff-cc1afb9e67b3
                      bestMatchSPLabel EVPL_UPR_PW
                      transportProtection ANY
                      status AWAITING_ACTION
                      bestMatchSPID 5de6258f-f345-4e42-97fa-fe6ad36ad467
                      serviceLabel cisco_new
                      serviceType EVPL
                      serviceEndPointList {
                          endPointLabel 3928-1--11-A_UNI
                          endPointType A End
                      }
                      serviceEndPointList {
                          endPointLabel LAB_B_3928--1-Z_UNI
                          endPointType Z End
                      }
                      differences {
                          nonCompliantProperty transportProtection
                          actual
                          expected UNPROTECTED_ONLY
                      }
                      ...
                      differences {
                          nonCompliantProperty Protected Pseudowire
                          actual False
                          expected True
                      }
                  }
                  auditResult {
                      serviceId 5de671f2-6c12-4bbc-a56c-7f4f0564eabc
                      bestMatchSPLabel EVPL_UPR_PW
                      transportProtection ANY
                      status AWAITING_ACTION
                      bestMatchSPID 5de6258f-f345-4e42-97fa-fe6ad36ad467
                      serviceLabel CISCO_UP
                      serviceType EVPL
                      serviceEndPointList {
                          endPointLabel LAB_A_3928--7-A_UNI
                          endPointType A End
                      }
                      serviceEndPointList {
                          endPointLabel 3928-1--7-Z_UNI
                          endPointType Z End
                      }
                      differences {
                          nonCompliantProperty transportProtection
                          actual
                          expected UNPROTECTED_ONLY
                      }
                      ...
                      differences {
                          nonCompliantProperty pbit
                          actual 2
                          expected 5
                      }
                  }
              }
          }
          items {
              ...
          }
      }
  ```

  ---
  ### > audits get-compliance-reports : Get custom type report detail (Resourcetype and id required)
  ---
  ``` 
      admin@ncs(config)# devices device <device-name> live-status exec audits get-compliance-reports resourceTypeId {cxDependent}.resourceTypes.ComplianceReport id 5de7977b-3497-45b3-a1ba-263277f67613
      result {
          requestStatus passed
      }
      response {
          items {
              id 5de7977b-3497-45b3-a1ba-263277f67613
              label ComplianceReport_2019-12-04 11:24:43.867035
              resourceTypeId {cxDependent}.resourceTypes.ComplianceReport
              productId 5de4de61-f261-44b3-9eb9-f5e749546118
              tenantId 314fd7ab-d662-4946-a0a1-eaf1bed002fd
              subDomainId 7fd5144c-552f-39a3-9464-08d3b9cfb251
              shared false
              discovered false
              desiredOrchState active
              orchState active
              reason
              updatedAt 2019-12-04T11:24:43.937Z
              createdAt 2019-12-04T11:24:43.894Z
              properties {
                  auditResult {
                      serviceId 5de671ec-c1f4-403a-9fff-cc1afb9e67b3
                      bestMatchSPLabel EVPL_UPR_PW
                      transportProtection ANY
                      status AWAITING_ACTION
                      bestMatchSPID 5de6258f-f345-4e42-97fa-fe6ad36ad467
                      serviceLabel cisco_new
                      serviceType EVPL
                      serviceEndPointList {
                          endPointLabel 3928-1--11-A_UNI
                          endPointType A End
                      }
                      serviceEndPointList {
                          endPointLabel LAB_B_3928--1-Z_UNI
                          endPointType Z End
                      }
                      differences {
                          nonCompliantProperty transportProtection
                          actual
                          expected UNPROTECTED_ONLY
                      }
                      ...
                      differences {
                          nonCompliantProperty Protected Pseudowire
                          actual False
                          expected True
                      }
                  }
                  auditResult {
                      serviceId 5de671f2-6c12-4bbc-a56c-7f4f0564eabc
                      bestMatchSPLabel EVPL_UPR_PW
                      transportProtection ANY
                      status AWAITING_ACTION
                      bestMatchSPID 5de6258f-f345-4e42-97fa-fe6ad36ad467
                      serviceLabel CISCO_UP
                      serviceType EVPL
                      serviceEndPointList {
                          endPointLabel LAB_A_3928--7-A_UNI
                          endPointType A End
                      }
                      serviceEndPointList {
                          endPointLabel 3928-1--7-Z_UNI
                          endPointType Z End
                      }
                      differences {
                          nonCompliantProperty transportProtection
                          actual
                          expected UNPROTECTED_ONLY
                      }
                      ...
                      differences {
                          nonCompliantProperty pbit
                          actual 2
                          expected 5
                      }
                  }
              }
          }
      }
  ```

  ---
  ### audits get-schedule : Get Schedule reports [EPTConfig]
  ---
  Get all Schedule Audit reports by resourceType, expected (modeled) for {cxDependent}.resourceTypes.Audit
  ```
  admin@ncs(config)# devices device <device-name> live-status exec audits get-schedule ?
      Possible completions:
      resourceTypeId   OPTIONAL: Defaults to : resourceTypeId={cxDependent}.resourceTypes.Audit
  ```


  ---
  ### audits get-schedule : Get all scheduled reports of type {cxDependent}.resourceTypes.Audit
  ---

      admin@ncs(config)# devices device <device-name> live-status exec audits get-schedule                                                                                             
      result {
          requestStatus passed
      }
      response {
          items {
              id 5de4e32d-eecd-48cf-a8f7-dccca6368308
              label app_config
              description abc
              resourceTypeId {cxDependent}.resourceTypes.Audit
              productId 5de4de61-d321-478e-a6d4-fb1123e8fe1a
              tenantId 314fd7ab-d662-4946-a0a1-eaf1bed002fd
              subDomainId 7fd5144c-552f-39a3-9464-08d3b9cfb251
              shared false
              discovered false
              desiredOrchState active
              orchState active
              reason 
              updatedAt 2019-12-03T22:41:46.513Z
              createdAt 2019-12-02T10:10:53.463Z
              properties {
                  labelCheckDetails {
                      maxLabelLength 13
                      patternsNotAllowed /@!#$%&\*\(\)\?:^~
                  }
                  auditDetails {
                      auditDays Mon Tues
                  }
                  utilizationThreshold 95
                  activationTimeoutSeconds 800
                  allowedVlans 1-4094
              }
          }
      }


  ---
  ### audits get-schedule : Get Schedule reports [EPTConfig]
  ---

  Get all scheduled reports of other type, different of {cxDependent}.resourceTypes.Audit
  Sample output for:  {cxDependent}.resourceTypes.Audit
  ```
      admin@ncs(config)# devices device <device-name> live-status exec audits get-schedule resourceTypeId {cxDependent}.resourceTypes.Audit
      result {
          requestStatus passed
      }
      response {
          items {
              id 5de4e0e9-1409-4cb2-aca1-ac87c1484208
              label audit
              resourceTypeId {cxDependent}.resourceTypes.Audit
              productId 5de4de61-310b-4f3a-8782-d4e95056183f
              tenantId 314fd7ab-d662-4946-a0a1-eaf1bed002fd
              subDomainId 7fd5144c-552f-39a3-9464-08d3b9cfb251
              shared false
              discovered false
              desiredOrchState active
              orchState active
              reason
              updatedAt 2019-12-02T10:01:13.930Z
              createdAt 2019-12-02T10:01:13.892Z
              properties {
              }
          }
      }
  ```


  ---
  ### audits update-schedule : Update audit schedule properties (no entire object needed)
  ---

  Update audit schedule properties (no entire object needed)
  - (modeled) for properties of {cxDependent}.resourceTypes.Audit
  ```
      admin@ncs(config)# devices device <device-name> live-status exec audits update-schedule ?
      Possible completions:
      id           MANDATORY: id; Id of resource audit schedule is to be updated for
      properties
                  activationTimeoutSeconds    <string>
                  allowedVlans                <string>
                  utilizationThreshold        <unsignedShort>
                  auditDetails                
                                              auditScheduleName       <string>
                                              auditTime               <string>
                                              auditDays               [ string ]                                              
  ```

  ---
  ### audits update-schedule : Update audit schedule properties only for type {cxDependent}.resourceTypes.Audit
  ---
  ```
      admin@ncs(config)# devices device <device-name> live-status exec audits update-schedule id 5de4e32d-eecd-48cf-a8f7-dccca6368308 properties { auditDetails { auditDays [ Mon Tues Wed ] } }
      result {
          requestStatus passed
      }
      response {
          id 5de4e32d-eecd-48cf-a8f7-dccca6368308
          status updated
          properties {
              auditDetails {
                  auditDays Mon Tues Wed
                  auditScheduleName UpdatedScheduleName2
                  auditTime 00:36:00
              }
          }
      }
  ```   

  ---
  ### audits execute-audit : Execute AUDIT operation [Audits]
  ---
  Execute audit operation on given resource id, expected (modeled) for: {cxDependent}.resourceTypes.Audit 
  ```
      admin@ncs(config)# devices device <device-name> live-status exec audits execute-audit ?
      Possible completions:
      id   MANDATORY: id; Id of resource to Execute audit operation for
  ```

  ```
      admin@ncs(config)# devices device <device-name> live-status exec audits execute-audit id 5de4e0e9-1409-4cb2-aca1-ac87c1484208
      result {
          requestStatus passed
      }
      response {
          id 5def97c8-8165-48c4-8beb-5734781763a8
          resourceId 5de4e0e9-1409-4cb2-aca1-ac87c1484208
          interface audit
          state requested
          createdAt 2019-12-10T13:04:08.550Z
          updatedAt 2019-12-10T13:04:08.550Z
      }
  ```
  *** One can refer to section 5.2.2*** to fetch the {cxDependent}.resourceTypes.Audit ids available for current section.


  ----------------------------------
  ## Service provisioning (BSM Mode)
  ----------------------------------


  ### l23-service provision-service  :  Command to request L2Service provisioning to MCP by service id
  ---

  ```
      Provision Service <ACTION>;; Command to request L2Service provisioning to MCP by service id

      admin@ncs(config)# devices device <device-name> live-status exec l23-service provision-service id <serviceId>          
  ```

  ---
  ### l23-service unprovision-service  :  Command to request L2Service un-provisioning to MCP by service id
  ---

  ```
      UnProvision Service <ACTION>;; Command to request L2Service un-provisioning to MCP by service id
      admin@ncs(config)# devices device <device-name> live-status exec l23-service unprovision-service id <serviceId>    
  ```


  # TSM_MODE: Most common Live status command used in TSM MODE:

  1. tsm get-networkconstructs    Command to get Network Constructs using given inputs filtering; 
  2. tsm get-equipment            Command to get Equipment under a particular network construct using given inputs filtering; 
  3. tsm get-fres                 Command to get Network Constructs FREs using given inputs filtering; 
  4. tsm get-tpes                 Command to get TPEs using given inputs filtering; 
  5. tsm get-service-intent       Command to get resources Service Intent using given inputs filtering;
  6. tsm get-service-topology     Command to get Service Topology of a given id
  7. tsm get-ne-profiles          Command to get NE Profiles for a given typeGroup
  8. tsm get-market-resources     Command to get market resources as filtered 
  9. tsm commit-route             Command to commit routes
  10. tsm delete-resource-id      Command to delete L2Service or Service profile or any other resource by id
  11. tsm get-relationships       Command to get relationships targetID by facadeId
  12. tsm request-routes          Command to request routes for retreiving Resources ID
  13. tsm get-requested-routes    Command to get requested routes options
  14. tsm get-tsm-products        Command to get all products to fetch ids or for a particular type
  15. tsm search                  Command to search and get various Service Topologies: tpes|fres|nwConstructs
  16. tsm test-pseudowire         Command to test EPL service
  17. tsm get-ethernet-port-status    Command to Retrieve Ethernet Management Port Status (NM Server API)
  18. tsm get-performance-metrics     Command to get Performance Metrics
  19. tsm test-benchmarkOperations    Command to run a benchmark test using reflectorTpe
  20. tsm node-upgrade            COLLECTION: Node Upgrade commands
      1.  check-ne-upgrade-details   Command to start firmware download
      2.  disable-docs               Command to disable docs
      3.  get-node-backups           Command to get backups for node
      4.  get-node-docs              Command to start firmware download
      5.  get-shelf-config           Command to get shelf config for node
      6.  resume-upgrade             Command to resume upgrade
      7.  retrieve-upgrade-state     Command to start firmware download
      8.  schedule-node-backup       Command to schedule node backup
      9.  search-nodes-doc           Command to get node docs
      10. start-firmware-download    Command to start firmware download
      11. suspend-upgrade            Command to suspend upgrade of the given network element node
      12. upgrade-state              Command to start firmware download
  21. tsm node-enrolment          COLLECTION: Node Enrolment commands
      1.    tsm node-enrolment backup-schedule                   Command to schedule backup
      2.    tsm node-enrolment clear-and-deEnroll                Command to clear and de-enroll NE managementSessions
      3.    tsm node-enrolment create-group                      Command to create a group
      4.    tsm node-enrolment delete-group                      Command to delete planned group
      5.    tsm node-enrolment delete-networkConstructs-groups   Command to delete Group from All NCs
      6.    tsm node-enrolment get-configmgmt-profiles           Command to run Node Reconnect
      7.    tsm node-enrolment get-management-sessions           Command to get management sessions for node enrolment
      8.    tsm node-enrolment get-ne-maintenanceDetails         Command to get backup schedules for network elements
      9.    tsm node-enrolment get-ne-managementSessions         Command to get NE managementSessions
      10.   tsm node-enrolment get-node-upgrade-details          Command to get Node Upgrade Details
      11.   tsm node-enrolment get-resource-serviceTopology      Command to get Optical Details - serviceTopology for optical FRE Id
      12.   tsm node-enrolment get-schedules                     Command to get schedules for node enrolment
      13.   tsm node-enrolment lldp-link-tag                     Command to patch LLDP Link Tag with TDM-Project tag or to clear it
      14.   tsm node-enrolment node-reconnect                    Command to run Node Reconnect
      15.   tsm node-enrolment patch-ne-managementSessions       Command to PATCH NE management Sessions
      16.   tsm node-enrolment patch-networkConstructs           Command to PATCH NE management Sessions - network constructs
      17.   tsm node-enrolment run-enrolment                     Command to run enrolment
      18.   tsm node-enrolment run-node-backup                   Command to run node backup
      19.   tsm node-enrolment search-networkConstructs          Command to search Parent Group
      20.   tsm node-enrolment search-parent-group               Command to search Parent Group
      21.   tsm node-enrolment session-pre-enrolment             Command to request session pre enrolment
      22.   tsm node-enrolment trigger-group-creation            Command to trigger the creation of group
  22. tsm otn-*                   Intermediate OTN Links (OTU P-Links) 
      1.    otn-create-otm-facility               Command to CREATE : OTN (OTM 1-4) Facility, OOS, NDP, GCC, etc
      2.    otn-create-otm2-facility              Command to CREATE : OTN (OTM2) Facility, OOS, NDP, GCC, etc
      3.    otn-delete-facility-params            Command to DELETE OTN (OTM2) Facility
      4.    otn-get-equipment-facility-submenus   Command to get OTN Facility Submenus
      5.    otn-get-equipment-information         Command to get OTN Equipment information
      6.    otn-patch-fre                         Command to Modify OTN Service FRE
  23. tsm manage-service-operations   Command to Manage Market Resources Services Operations
  24. alarms
      1. tsm get-alarms   Command to get filtered or correlated Alarms
  25. create-virtual-pLink                  Command to get Optical Details - serviceTopology for optical FRE Id
  26. get-configmgmt-script-job             Command to get Script Output job id
  27. delete-configmgmt-script-job          Command to get Script Output job id
  28. get-configmgmt-scripts                Command to GET config management scripts by type
  29. delete-configmgmt-scripts             Command to GET config management scripts by type
  30. get-fre-ccstatus                      Command to retrieve ccStatus (Continuity Check)
  31. delete-fres-expectations              Command to delete FRES expectations for stuck in Scheduled state
  32. delete-tpe                            Command to delete TPEs using given tpe id
  33. get-equipment-information             Command to get Equipment information
  34. get-equipment-topology-planning       Command to retrieve Available A-End ports for the rate selected
  35. get-lag-details                       Command to Retrieve LAG details.
  36. get-tpe-expectations                  Command to get TPE tpeExpectations using given tpeExpectations.serviceIntent.id
  37. get-jobId-status-response             Command to fetch the status and data available for a previously scheduled jobId
  38. get-resource-operation-state          Command to get Market Resources Service Operation state
  39. get-service-intent-facade-id          Command to get relationships targetID by facadeId
  40. get-tdc-pageLoad                      Command to Run test enabling/disabling tdmLoopback
  41. get-test-pseudowire-result            Command to test EPL service
  42. manage-eline-attributes               Command to retrieve Available A-End ports for the rate selected
  43. sync-network-elements                 Command to get resync Network Elements
  44. test-lspOperations                    Command to run a E-Tree service test from root-to-leaf or leaf-to-root
  45. test-tdmOperations                    Command to Run test enabling/disabling tdmLoopback
  46. upload-script                         Command to upload custom script
  47. upload-script-profile                 Command to upload scriptProfiles
  48. wavelength                            COLLECTION: Wavelength commands
      1. get-adj-values      Command to get Optical Details - serviceTopology for optical FRE Id
      2. update-adj-values   Command to get Optical Details - serviceTopology for optical FRE Id
  49. manage-lag                            COLLECTION: LAG management commands
      1. create-interfacemanagement       Command to Create LAG InterfaceManagement entry
      2. create-lag-entry                 Command to Create LAG entry
      3. delete-lag-entry                 Command to Delete LAG entry
      4. get-interfacemanagement-values   Command to get interface management values
      5. get-lag-values                   Command to get LAG values
      6. resync-components                Command to resynchronize all components of a NcManagementSessionId
      7. update-lag-entry                 Command to Update LAG entry
      8. show-all-ne-lags                 Command to get all LAGs associated with any or the network element specified
      9. delete-interfacemanagement       Command to Delete LAG InterfaceManagement entry
     10. execute-any-request              Generic command; execute any API callback, mentioning details
     11. manage-virtualswitch-entry       Command to get or delete ethernetConnectivity VirtualSwitch values
     12. update-interfacemanagement       Command to Update LAG InterfaceManagement entry
  50. search-all-networkConstructs          Command to get all or filtered networkConstructs
  51. search-tunnel-endpoints               Command to get Optical Details - serviceTopology for optical FRE Id
  52. update-ethernet-port-state            Command to update Ethernet port state to disabled or enabled

  # Live status actions  

  ## All TSM related actions will be found under:

      devices / device {deviceName} / live-status exec tsm 

  --------------------------------------------------------------

      admin@ncs(config-device-netsim-0)# live-status exec tsm ?
        Possible completions:
          commit-route                          Command to commit routes
          create-virtual-pLink                  Command to get Optical Details - serviceTopology for optical FRE Id
          delete-configmgmt-script-job          Command to get Script Output job id
          delete-configmgmt-scripts             Command to GET config management scripts by type
          delete-fres-expectations              Command to delete FRES expectations for stuck in Scheduled state
          delete-resource-id                    Command to delete clear routes or any other resource by id
          delete-tpe                            Command to delete TPEs using given tpe id
          get-alarms                            Command to get filtered or correlated Alarms
          get-configmgmt-script-job             Command to get Script Output job id
          get-configmgmt-scripts                Command to GET config management scripts by type
          get-equipment                         Command to get Equipment under a particular network construct using given inputs filtering;
          get-equipment-information             Command to get Equipment information
          get-equipment-topology-planning       Command to retrieve Available A-End ports for the rate selected
          get-ethernet-port-status              Command to Retrieve Ethernet Management Port Status (NM Server API)
          get-fre-ccstatus                      Command to retrieve ccStatus (Continuity Check)
          get-fres                              Command to get Network Constructs FREs using given inputs filtering;
          get-jobId-status-response             Command to fetch the status and data available for a previously scheduled jobId
          get-lag-details                       Command to Retrieve LAG details.
          get-market-resources                  Command to get market resources as filtered
          get-ne-profiles                       Command to get NE Profiles for a given typeGroup
          get-networkconstructs                 Command to get Network Constructs using given inputs filtering;
          get-performance-metrics               Command to get Performance Metrics
          get-relationships                     Command to get relationships targetID by facadeId
          get-requested-routes                  Command to get requested routes options
          get-resource-operation-state          Command to get Market Resources Service Operation state
          get-service-intent                    Command to get resources Service Intent using given inputs filtering;
          get-service-intent-facade-id          Command to get relationships targetID by facadeId
          get-service-topology                  Command to get Service Topology of a given id
          get-tdc-pageLoad                      Command to Run test enabling/disabling tdmLoopback
          get-test-pseudowire-result            Command to test EPL service
          get-tpe-expectations                  Command to get TPE tpeExpectations using given tpeExpectations.serviceIntent.id
          get-tpes                              Command to get TPEs using given inputs filtering;
          get-tsm-products                      Command to get all products to fetch ids or for a particular type
          manage-eline-attributes               Command to retrieve Available A-End ports for the rate selected
          manage-lag                            COLLECTION: LAG management commands
          manage-service-operations             Command to Manage Market Resources Services Operations
          node-enrolment                        COLLECTION: Node Enrolment commands
          node-upgrade                          COLLECTION: Node Upgrade commands
          otn-create-otm-facility               Command to CREATE : OTN (OTM 1-4) Facility, OOS, NDP, GCC, etc
          otn-create-otm2-facility              Command to CREATE : OTN (OTM2) Facility, OOS, NDP, GCC, etc
          otn-delete-facility-params            Command to DELETE OTN (OTM2) Facility
          otn-get-equipment-facility-submenus   Command to get OTN Facility Submenus
          otn-get-equipment-information         Command to get OTN Equipment information
          otn-patch-fre                         Command to Modify OTN Service FRE
          request-routes                        Command to request routes for retreiving Resources ID
          search                                Command to search and get various Service Topologies: tpes|fres|nwConstructs
          search-all-networkConstructs          Command to get all or filtered networkConstructs
          search-tunnel-endpoints               Search MPLS tunnel endpoints state for protected tunnels.
          sync-network-elements                 Command to get resync Network Elements
          test-benchmarkOperations              Command to run a benchmark test using reflectorTpe
          test-lspOperations                    Command to run a E-Tree service test from root-to-leaf or leaf-to-root
          test-pseudowire                       Command to test EPL service
          test-tdmOperations                    Command to Run test enabling/disabling tdmLoopback
          update-ethernet-port-state            Command to update Ethernet port state to disabled or enabled
          upload-script                         Command to upload custom script
          upload-script-profile                 Command to upload scriptProfiles
          wavelength                            COLLECTION: Wavelength commands


  - Each action has its own inputs and outputs. See stats yang model in the NED for more details.
  - Based on the input combinations we will call one api or another.
  - COLLECTION refers to a group of commands used for a common purpose.


  --------------------------------------------------------------
  ## 1. tsm get-networkconstructs    Get NetworkConstructs:
  --------------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-networkconstructs ?
      Possible completions:
      fields            Specify <fields> query such as <id,links,data.attributes.displayData> etc, separated by commas
      id                Network Construct id;
      include           Specify include query params, such as <phisicalLocation>
      name              Network Construct Name;
      use-api-version   Enforce particular api version in /nsi/api/    (Currently only V6 and V1 are enforced, based on selection. if v4 is selected, still v6 is enforced)

  ---
  ### Sample callbacks from the live status command: ### 
  ---

  *** Get network constructs with enforced v1 api: ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-networkconstructs use-api-version v1 name MUDF-C5142-0001


  *** Get network constructs by network element name - works only with v4: ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-networkconstructs networkConstructType networkElement name CFWT-C3930-0001 use-api-version v4


  *** Get network constructs with v6 api (default option): ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-networkconstructs name MUDF-C5142-0001

  *** Get network constructs with v6 api (enforced option): ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-networkconstructs use-api-version v6 name MUDF-C5142-0001

  *** Get network constructs with v6 links: ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-networkconstructs name MUDF-C5142-0001 fields id,links


  *** Get network constructs with v6 links: ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-networkconstructs name MUDF-C5142-0001 fields id,links

  *** Get network constructs with v6 physicalLocation: ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-networkconstructs include physicalLocation

  *** Get network constructs with physicalLocation: ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-networkconstructs include physicalLocation fields id,data.attributes.displayData,links

  *** Get network constructs with id ! works only with v1 or v4 !: ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-networkconstructs id 12df49ed-c140-3c5b-8146-2826a3e89c0c use-api-version v4


  --------------------------------------------------------------
  ## 2. tsm get-equipment            Get Equipment
  --------------------------------------------------------------
      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-equipment ?
      Possible completions:
      include              Specify include query params, such as <expectations>, comma separated if multiple
      networkConstructId   Network Construct id;

  ---
  ##  Sample callbacks from the live status command ##
  ---

  *** GET all equipment for NetworkConstructID : ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-equipment networkConstructId 8086be7a-b781-3cc6-b19c-020e2cf37511


  *** GET all equipment for NetworkConstructID and Include Expectations ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-equipment networkConstructId 8086be7a-b781-3cc6-b19c-020e2cf37511 include expectations



  --------------------------------------------------------------
  ## 3. tsm get-fres                 Get FREs
  --------------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-fres ?
      Possible completions:
      freId                FRE full id;
      include              Specify include query params, such as <tpes>; comma separated if multiple
      layerRate            Specify layerRate query params, such as <MPLS,MPLS_PROTECTION> or <ETHERNET>; comma separated if multiple
      networkConstructId   Network Construct id to fetch the FRE for
      serviceIntentId      FRE serviceIntent Id ;
      <cr>

  ---
  ##  Sample callbacks from the live status command ### 
  ---

  *** GET FRE With Network Construct ID forTunnels : ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-fres networkConstructId 8086be7a-b781-3cc6-b19c-020e2cf37511 layerRate MPLS,MPLS_PROTECTION


  *** GET FRE With Network Construct ID And TPEs : ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-fres networkConstructId 8086be7a-b781-3cc6-b19c-020e2cf37511 layerRate MPLS,MPLS_PROTECTION include tpes


  *** GET FRE With FREID And TPEs : ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-fres freId -1157069420368330373 include tpes


  *** GET FRE With EthernetService using NetworkConstructID and TPEs : ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-fres networkConstructId 8086be7a-b781-3cc6-b19c-020e2cf37511 layerRate ETHERNET


  *** GET FRE With Network Construct ID : ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-fres networkConstructId 8086be7a-b781-3cc6-b19c-020e2cf37511


  *** GET FRE with FRE-ID: ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-fres freId -1157069420368330373


  *** GET FRE with FRE-ID with ServiceIntentID: ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-fres serviceIntentId 5deb992c-ced4-457e-ac03-4da471f17449




  --------------------------------------------------------------
  ## 4. tsm get-tpes                  Get TPEs
  --------------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-tpes ?
      Possible completions:
      content              Specify content query params, such as <detail>; comma separated if multiple
      include              Specify include query params, such as <expectations>; comma separated if multiple
      networkConstructId   Network Construct id;
      tpeId                TPE full id to filter or full entry; set useTpeIdOnly accordingly
      useTpeIdOnly         TPE Id filtration; Set to true for full tpeId body fetching; False for tpe Id as a query filter.
      <cr>


  ---
  ##  Sample callbacks from the live status command ## 
  ---

  *** GET TPE with Network Construct ID : ***
  ----------------------------------------------------------
      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-tpes networkConstructId 8086be7a-b781-3cc6-b19c-020e2cf37511 content detail


  *** Get TPE Using TPEID : ***
  ----------------------------------------------------------
      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-tpes tpeId 8086be7a-b781-3cc6-b19c-020e2cf37511::TPE_VALUE_{$NAME}headEnd useTpeIdOnly


  *** GET TPEs : ***
  ----------------------------------------------------------
      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-tpes tpeId 8086be7a-b781-3cc6-b19c-020e2cf37511::TPE_VALUE_{$NAME}headEnd


  *** GET TPEs for a Network ConstructID and Include Expectations : ***
  ----------------------------------------------------------
      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-tpes networkConstructId 001249ea-0b5a-3856-9900-47fab890c0d4 include expectations

  --------------------------------------------------------------
  ## 5. tsm get-service-intent       Get Service Intent
  --------------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-service-intent ?
      Possible completions:
      resourceId       Resource ID (Intent ID) to fetch the service intent of
      resourceTypeId   Resource type Id to get service intent for; default is MPLSTunnelIntent


  ---
  ##  Sample callbacks from the live status command ##
  ---

  *** Get Service Intent with MPLSTunnel Intent : ***
  ----------------------------------------------------------
  admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-service-intent resourceTypeId ifd.v6.resourceTypes.MplsTunnelIntent


  *** Get Service Intent Using IntentID : ***
  ----------------------------------------------------------
  admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-service-intent resourceId 5deb992c-ced4-457e-ac03-4da471f17449

  --------------------------------------------------------------
  ## 6. tsm get-service-topology     Get Service topology 
  --------------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-service-topology ?
      Possible completions:
      id     Resource or Service ID to get topology of
      <cr>

  ---
  ##  Sample callbacks from the live status command ##
  ---
  *** Get Service Topology : ***
  ----------------------------------------------------------
      admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-service-topology id -101232540542396702

  --------------------------------------------------------------
  ## 7. tsm get-ne-profiles          Get NE Profiles
  --------------------------------------------------------------
      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-ne-profiles ?
      Possible completions:
      typeGroup   Type Group to get ne profiles for; i.e. Ciena6500
      <cr>


  ---
  ##  Sample callbacks from the live status command ##
  ---

  *** Get NE profiles ***
  ----------------------------------------------------------

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-ne-profiles typeGroup Ciena6500
      or
      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-ne-profiles

  - **Latter is defaulting typeGroup to 'Ciena6500'**


  --------------------------------------------------------------
  ## 8. tsm get-market-resources         Get market-resources
  --------------------------------------------------------------

      admin@ncs(config-device-dummy-1)# live-status exec tsm get-market-resources ?
      Possible completions:
      exactTypeId      Resource type Id to get market-resources for
      id               Single Resource Id to get; Use single, without below options
      limit            OPTIONAL: override global page limit
      nextPageToken    OPTIONAL: nextPageToken to fetch next page of results
      offset           Offset paging index to start from; Consider multiple of global pagination param
      printRaw         Set to true to print raw Results from device
      productId        Product Id to get market-resources for
      q                Query data
      resourceTypeId   Resource type Id to get market-resources for
      subDomainId      subDomain Id to get market-resources for
      <cr>



  --------------------------------------------------------------
  ## 9. tsm commit-route                 Commit route
  --------------------------------------------------------------
      admin@ncs(config-device-ciena-lab1)# live-status exec tsm commit-route rawData "$rawJSON" targetId <tunnelId>

  - Where $rawJson should be full updated routes body for the API, with the following strict syntax, containing "interface" param and inputs.routes[] as the desired routes, i.e:
  ```json
  {
    "interface": "commitRoute",
    "inputs": {
      "routes": [
        {
          "fres": [...],
          "included": [...],
          "tpes": [...]
        }
      ]
    }
  }
  ```

  - To collect the routes to commit, run the live status command no 13. **tsm get-requested-routes**
    - Collect response.outputs.routes[] and use them as needed as input for this command. 

  - **Please note that the json object composed to have the above expected structure must be escaped/quoted when being passed to the live status command as the rawData parameter** 

    - For example:
  ```  
      admin@ncs(config-device-ciena-lab1)# live-status exec tsm commit-route targetId tunnelId-123-abcd rawData "{\"inputs\":{\"routes\":[{\"fres\":[],\"included\":[],\"tpes\":[]}]},\"interface\":\"commitRoute\"}"
  ```

  - Example of a full route json object:
  ```json
  {
  	"interface": "commitRoute",
  	"inputs": {
          "routes": [
              {
                  "fres": [
                      {
                          "included": [
                              {
                                  "relationships": {
                                      "tpes": {
                                          "data": [
                                              {
                                                  "type": "tpes",
                                                  "id": "8bdb1e66-6486-37f3-8038-12345678901::TPE_NAME_VCE_NAME_
                                              }
                                          ]
                                      }
                                  },
                                  "attributes": {
                                      "role": "symmetric",
                                      "directionality": "bidirectional"
                                  },
                                  "type": "endPoints",
                                  "id": "8bdb1e66-6486-37f3-8038-12345678901::FRE_EVC_NAME_:EP0"
                              },
                              {
                                  "relationships": {
                                      "tpes": {
                                          "data": [
                                              {
                                                  "type": "tpes",
                                                  "id": "8bdb1e66-6486-37f3-8038-12345678901::TPE_CTPServerToClient_PW_N1234567L_1"
                                              }
                                          ]
                                      }
                                  },
                                  "attributes": {
                                      "role": "symmetric",
                                      "directionality": "bidirectional"
                                  },
                                  "type": "endPoints",
                                  "id": "8bdb1e66-6486-37f3-8038-12345678901::FRE_EVC_NAME_:EP1"
                              }
                          ],
                          "data": {
                              "relationships": {
                                  "endPoints": {
                                      "data": [
                                          {
                                              "type": "endPoints",
                                              "id": "8bdb1e66-6486-37f3-8038-12345678901::FRE_EVC_NAME_:EP0"
                                          },
                                          {
                                              "type": "endPoints",
                                              "id": "8bdb1e66-6486-37f3-8038-12345678901::FRE_EVC_NAME_:EP1"
                                          }
                                      ]
                                  },
                                  "networkConstruct": {
                                      "data": {
                                          "type": "networkConstructs",
                                          "id": "8bdb1e66-6486-37f3-8038-12345678901"
                                      }
                                  }
                              },
                              "attributes": {
                                  "additionalAttributes": {
                                      "mplsMode": "vpws"
                                  },
                                  "signalContentType": "EVC",
                                  "topologySources": [
                                      "connection_rule"
                                  ],
                                  "serviceClass": "EVC",
                                  "mgmtName": "_MANAGEMENT_NAME_",
                                  "userLabel": "_USER_LABEL_",
                                  "networkRole": "IFRE",
                                  "layerRate": "ETHERNET",
                                  "directionality": "bidirectional",
                                  "cfmPackages": [
                                      {
                                          "ccmIntervalUnit": "sec",
                                          "mdLevel": "1",
                                          "cfmServiceName": "_cfmService_NAME_",
                                          "ccmInterval": "1"
                                      }
                                  ]
                              },
                              "type": "fres",
                              "id": "8bdb1e66-6486-37f3-8038-12345678901::FRE_EVC_NAME_"
                          }
                      },
                      ...
                  ],
                  "included": [
                      {
                          "data": {
                              "relationships": {
                                  "networkConstruct": {
                                      "data": {
                                          "type": "networkConstructs",
                                          "id": "8bdb1e66-6486-37f3-8038-12345678901"
                                      }
                                  }
                              },
                              "attributes": {
                                  "structureType": "FTP",
                                  "locations": [
                                      {
                                          "lspName": "_lsp_name_",
                                          "tunnelRole": "headEnd",
                                          "managementType": "saos"
                                      }
                                  ],
                                  "stackDirection": "bidirectional"
                              },
                              "type": "tpes",
                              "id": "8bdb1e66-6486-37f3-8038-12345678901::TPE_FTP_MPLS-PROTECTION_NAME_"
                          }
                      },
                      ...
                  ],
                  "tpes": [
                      {
                          "data": {
                              "relationships": {
                                  "networkConstruct": {
                                      "data": {
                                          "type": "networkConstructs",
                                          "id": "12df49ed-c140-3c5b-8146-2826a3e89c0c"
                                      }
                                  },
                                  "owningServerTpe": {
                                      "data": {
                                          "type": "tpes",
                                          "id": "12df49ed-c140-3c5b-8146-2826a3e89c0c::TPE_5_PTP"
                                      }
                                  }
                              },
                              "attributes": {
                                  "additionalAttributes": {
                                      "mplsMode": "vpws",
                                      "freId": "6512861967685836912"
                                  },
                                  "structureType": "CTPServerToClient",
                                  "layerTerminations": [
                                      {
                                          "additionalAttributes": {
                                              "cir": 10000,
                                              "eir": 0,
                                              "ingressCosPbit": 5,
                                              "ingressCosPolicy": "fixed",
                                              "trafficProfileName": "BP_PROFILE_1",
                                              "cbs": 21,
                                              "evcId": "N1234567L",
                                              "policing": "enabled",
                                              "ebs": 0,
                                              "controlFrameTunnelingProfileName": "Default_Tunnel-All",
                                              "controlFrameTunneling": "enabled",
                                              "vlliState": "enabled"
                                          },
                                          "structureType": "exposed lone cp",
                                          "active": true,
                                          "layerRate": "ETHERNET",
                                          "cfmPackages": [
                                              {
                                                  "mep": [
                                                      {
                                                          "mepId": 2,
                                                          "slm": {
                                                              "count": "895",
                                                              "frameSize": "65",
                                                              "interval": "1",
                                                              "enabled": "true",
                                                              "intervalUnit": "sec",
                                                              "priority": "5",
                                                              "repeatDelay": "0",
                                                              "remoteMepId": 1,
                                                              "iterate": "0"
                                                          },
                                                          "ccmTransmitState": "on",
                                                          "ccmPriority": "5",
                                                          "dmm": {
                                                              "count": "895",
                                                              "frameSize": "140",
                                                              "interval": "1",
                                                              "enabled": "true",
                                                              "intervalUnit": "sec",
                                                              "priority": "5",
                                                              "repeatDelay": "0",
                                                              "remoteMepId": 1,
                                                              "iterate": "0"
                                                          }
                                                      }
                                                  ],
                                                  "cfmServiceName": "N1234567L"
                                              }
                                          ],
                                          "terminationState": "layer termination cannot terminate",
                                          "signalIndex": {
                                              "mappingTable": [
                                                  {
                                                      "direction": "RX",
                                                      "label": "4096,4097"
                                                  }
                                              ]
                                          }
                                      }
                                  ],
                                  "locations": [
                                      {
                                          "managementType": "saos",
                                          "vce": "N1234567L",
                                          "port": "5"
                                      }
                                  ],
                                  "stackDirection": "bidirectional"
                              },
                              "type": "tpes",
                              "id": "12df49ed-c140-3c5b-8146-2826a3e89c0c::TPE_NAME_VCE_NAME_
                          }
                      },

                      ...
                  ]
              }
          ]
      }
  }
  ```


  --------------------------------------------------------------
  ## 10. tsm delete-resource-id      Delete resource by given id:
  --------------------------------------------------------------
  !warning! if you delete any resource potentially affecting config cdb, run a sync-from afterwads!
  --------------------------------------------------------------
      admin@ncs(config-device-ciena-lab1)# live-status exec tsm delete-resource-id id <$resourceId>


  --------------------------------------------------------------
  ## 11. tsm get-relationships       Get relationships by facadeId
  --------------------------------------------------------------
      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-relationships facadeId <$facadeId>


  --------------------------------------------------------------
  ## 12. tsm request-routes          Command to request routes for retreiving Resources ID
  --------------------------------------------------------------
      admin@ncs(config-device-ciena-lab1)# live-status exec tsm request-routes id <$routeId>

  --------------------------------------------------------------
  ## 13. tsm get-requested-routes    Command to get requested routes options
  --------------------------------------------------------------
      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-requested-routes routesId <$routesId> targetId <$targetId>

  --------------------------------------------------------------
  ## 14. tsm get-tsm-products        Command to show all products to fetch ids or for a particular type
  --------------------------------------------------------------
      admin@ncs(config-device-ciena-lab1)# live-status exec tsm get-tsm-products resourceTypeId <$resourceType>

  - resourcetypeId refers to object type, i.e. ifd.v6.resourceTypes.L2ServiceIntentFacade

  --------------------------------------------------------------
  ## 15. tsm search                  Command to show Service Topology of a given id by node type
  --------------------------------------------------------------
      admin@ncs(config-device-ciena-lab1)# live-status exec tsm search node ?
      Description: Where to search? Select one option below:
      Possible completions:
      fres  networkConstructs  tpes

  - Then choose a combination of filters for searching for that node type:
  ```
      Possible completions:
          directionality         Query directionality params; ie: <bidirectional>; comma separated if multiple
          facilityBypass         Query facilityBypass params; ie: <exclude>; comma separated if multiple
          include                Query include params; ie: <tpes>; comma separated if multiple
          namedQuery             Query namedQuery; comma separated i.e.
          networkConstructId     Query networkConstructId
          networkConstructType   Query networkConstructType; i.e.
          networkRole            Query networkRole params; ie: <FREAP>;
          offset                 Offset paging index to start from; Consider multiple of global pagination param
          searchFields           Query searchFields; i.e: <data.attributes.displayData.displayName>
          searchText             Query searchText params; ie: <tunnelNameSearch>; comma separated if multiple
          serviceClass           Query serviceClass params; ie: <Tunnel>
          sortBy                 Query sortBy param; ie: <name>
  ```

  - example *GET Network Constructs. Retrieve Available Z-End NE Ports - tpes*

      admin@ncs(config-device-ciena-lab1)# live-status exec tsm search node tpes include expectations namedQuery portsL2ApplicableEPLUniWithMcLag sortBy data.attributes.locations networkConstructId <$networkConstruct.id>


  --------------------------------------------------------------
  ## 16. tsm test-pseudowire         Command to test EPL service
  --------------------------------------------------------------

       admin@ncs(config-device-mcppsmod01)# live-status exec tsm test-pseudowire ?
       Possible completions:
         freId            freId or <string>
         localTpeId
         remotePoint
         testParameters   String value with Json Object syntax is expected!
         type             type i.e.
         userAnnotation   userAnnotation or <string>

  - Single segment pseudowire services have one pseudowire end-to-end on top of one LSP.
  - Multi-segment pseudowire services have multiple pseudowires stitched together over multiple LSPs to provide end-to-end service.

  ---

  - Inputs given offer a range of customization on the request body needed for the API to trigger the right segment:

  ```json
       // Single segment body created from given inputs
         {
           "data": {
             "type": "ping",
             "localTpeId": "$TPE_ID",
             "remotePoint": {
               "idType": "macAddress",
               "id": "string"
             },
             "freId": "string",
             "testParameters": {},
             "userAnnotation": "string"
           }
         }
  ```

  ```json
         //Multi-segment body created from given inputs
         {
             "data": {
             "type": "traceroute",
             "localTpeId": "id::label",
             "testParameters": {},
             "userAnnotation": "string"
             }
         }
  ```
  ---
  ## Sample callbacks : 
  ---

  - i.e.: test pseudowire Multi segment traceroute
    - <$localTpeId> : format sample :
      - 12345678-1234-1234-1234-123456789012::TPE_1_CTPServerToClient_EQPTGRP_9_PW{$NAME}PW_3

  ```
      admin@ncs(config-device-lab1)# live-status exec tsm test-pseudowire localTpeId <$localTpeId> type traceroute userAnnotation string
      result {
          requestStatus passed
      }
      response {
          resultsCode 202
          data {
              id abcdef12-8e9b-4562-856e-e30388240711
              type testResults
              attributes {
                  testResults 
                  testType pwTraceroute
                  testStatus Started
                  localTpeId <$localTpeId> 
                  remotePoints 
                  localNcId 12345678-1234-1234-1234-123456789012
                  remoteNcs 
                  startTime 1618502693996
                  lastUpdateTime 1618502693996
                  testParameters 
                  startTimeFormatted 2021-04-15T16:04:53.996Z
                  userAnnotation string
                  equipmentGroupId 9
                  dynamicTunnel false
                  lastUpdateTimeFormatted 2021-04-15T16:04:53.996Z
                  fecValidation true
                  startTestRequest {
      "data" : {
          "type" : "traceroute",
          "localTpeId" : "<$localTpeId> ",
          "remotePoint" : {
          "idType" : "macAddress",
          "id" : "string"
          },
          "freId" : "string",
          "testParameters" : { },
          "userAnnotation" : "string"
      }
      }
                  pseudowireName _NAME_PW_3
                  shelf 1
                  on6500 true
              }
              relationships {
                  tpes {
                      id <$localTpeId> 
                      type tpes
                  }
                  networkConstructs {
                      id 12345678-1234-1234-1234-123456789012
                      type networkConstructs
                  }
              }
          }
      }
  ```

  ---  
  - i.e.: test single segment ping :
  ---

  ```
      admin@ncs(config-device-lab1)# live-status exec tsm test-pseudowire localTpeId <$localTpeId> type ping userAnnotation string remotePoint { id string idType macAddress } 
      result {
          requestStatus passed
      }
      response {
          resultsCode 202
          data {
              id abcdef12-e2db-47b7-82f2-cff9e617a342
              type testResults
              attributes {
                  testResults 
                  testType pwPing
                  testStatus Started
                  localTpeId <$localTpeId> 
                  remotePoints 
                  localNcId 12345678-1234-1234-1234-123456789012
                  remoteNcs 
                  startTime 1618502752782
                  lastUpdateTime 1618502752782
                  testParameters 
                  startTimeFormatted 2021-04-15T16:05:52.782Z
                  userAnnotation string
                  equipmentGroupId 9
                  dynamicTunnel false
                  lastUpdateTimeFormatted 2021-04-15T16:05:52.782Z
                  fecValidation true
                  startTestRequest {
                      "data" : {
                          "type" : "ping",
                          "localTpeId" : "<$localTpeId> ",
                          "remotePoint" : {
                          "idType" : "macAddress",
                          "id" : "string"
                          },
                          "freId" : "string",
                          "testParameters" : { },
                          "userAnnotation" : "string"
                      }
                  }
                  pseudowireName _NAME_PW_3
                  shelf 1
                  on6500 true
              }
              relationships {
                  tpes {
                      id <$localTpeId> 
                      type tpes
                  }
                  networkConstructs {
                      id 12345678-1234-1234-1234-123456789012
                      type networkConstructs
                  }
              }
          }
      }
  ```


  --------------------------------------------------------------
  ## 17. tsm get-ethernet-port-status        Get Ethernet Port Status - operLink
  --------------------------------------------------------------
  - Inspect ports and states of the given input parameter
  - Returns ports and operLink states
  ---

      admin@ncs(config)# devices device ciena-test live-status exec tsm get-ethernet-port-status ?
      Possible completions:
        ncid              NetworkConstruct NE Id A END
        sessionid         NC Management Session Id
        softwareVersion   NC Software Version
        typegroup         NC Type Group

  ---  
  ### Sample callback:
  ---
  ```
  admin@ncs(config)# devices device ciena-test live-status exec tsm get-ethernet-port-status ncid <$ncId> sessionid <$sessionId> softwareVersion <$softwareVersion> typegroup <$ncTypeGroup> 
  result {
      requestStatus passed
  }
  response {
      data {
          id 0
          jsondata {
              port 23/7
              operLink Down
          }
          jsondata {
              port 3/11
              operLink Up
          }
          jsondata {
              port 23/32
              operLink Down
          }
  ...
          }
          jsondata {
              port 23/31
              operLink Down
          }
      }
  }
  ```


  --------------------------------------------------------------
  ## 18. tsm get-performance-metrics Get performance metrics
  - Check for traffic on a particular endpoint before deleting the service
  --------------------------------------------------------------
  ```
  admin@ncs(config)# devices device ciena-test live-status exec tsm get-performance-metrics ?
      Possible completions:
          displayName  {
              comparator          //ENUM: =|contains|endsWith|startsWith  //default: =
              value
          }
          facilityNameNative {    // port name 
              comparator          //ENUM: =|contains|endsWith|startsWith  //default: =
              value   
          }
          parameterNative {
              comparator          //ENUM: =|contains|endsWith|startsWith  //default: =
              value    
          }
          granularity {     
              comparator          //ENUM: =|contains|endsWith|startsWith  //default: =  
              value               //ENUM: 1_HOUR|15_MINUTE                //default: 15_MINUTE
          }
          pageLink                //direct link to next or current page (overrides all other inputs)
          pageSize                //int, default:  200

          startTime     <dateTime (CCYY-MM-DDTHH:MM:SSZ)>     i.e.: 2021-05-24T12:00:00Z
          endTime       <dateTime (CCYY-MM-DDTHH:MM:SSZ)>     i.e.: 2021-05-24T12:00:00Z
  ```

  --------------------------------------------------------------
  ### Example of minimal inputs callback with all the param values (displayName, facilityNameNative, parameterNative)


  - displayName, facilityNameNative, parameterNative can be passed individually, or in combinations, with values, defaulting the comparator to '='

  ```json
  admin@ncs(config)# devices device ciena-test live-status exec tsm get-performance-metrics displayName { value <$displayName> } parameterNative { value <$parameterNative> } facilityNameNative { value <$facilityNameNative> } startTime 2021-05-24T12:00:00Z endTime 2021-05-24T12:00:00Z 
  result {
      requestStatus passed
  }
  response {
      "data":[{
          "attributes":{
              "metaTags":{
                  "eqptGrp":"9",
                  "managementType":"saos"
              },
              "tags":{
                  "direction":"RECEIVE",
                  "displayName":"TEB4-C6500-0001",
                  "facilityName":"1_9_12/1",
                  "facilityNameNative":"12/1",
                  "granularity":"15_MINUTE",
                  "location":"NEAR_END",
                  "networkElementID":"d96476d6-ae82-3e96-956f-0f6675cd8ff3",
                  "networkElementName":"TEB4-C6500-0001",
                  "parameter":"PMP_PAUSEFR",
                  "parameterNative":"RX pause frames",
                  "port":"1",
                  "shelf":"1",
                  "slot":"12"
              },
              "values":{
                  "2021-04-28T23:30:02Z":{
                      "value":0
                  },
                  "2021-04-28T23:45:01Z":{
                      "value":0
                  },
                  "2021-04-29T00:00:01Z":{
                      "value":0
                  },
                  "2021-04-29T00:15:02Z":{
                      "value":0
                  }
              }
          }
      },
      ...
      ...
      ...
      ],
      "links":{
          "nextInterval":"/pm/api/v3/query/metrics?start=1619656140000&end=1619659680000&cursor=0",
          "previousInterval":"/pm/api/v3/query/metrics?start=1619649060000&end=1619652600000&cursor=0",
          "self":"/pm/api/v3/query/metrics?start=1619652600000&end=1619656140000&cursor=0"
      }
  }
  ```

  --------------------------------------------------------------
  ### Example of direct callback to fecth directly the nextInterval /pm/api/v3/query/metrics?start=1619656140000&end=1619659680000&cursor=0

  ```
  admin@ncs(config)# devices device ciena-test live-status exec tsm get-performance-metrics pageLink /pm/api/v3/query/metrics?start=1619656140000&end=1619659680000&cursor=0
  ```

  --------------------------------------------------------------
  ## 19. tsm test-benchmarkOperations    Command to test benchmark
  --------------------------------------------------------------

  ```
      admin@ncs(config-device-localmcp)# live-status exec tsm test-benchmarkOperations 
        Possible completions:
          freId            
          generatorId      
          printRaw         Set to true to print raw Results from device in fullRawResponse leaf
          testParameters   String value with Json Object syntax is expected or broken down container!
          type             type ex: benchmark
          <cr>
  ```      

  - Inputs given offer a range of customization on the request body needed for the API to trigger the right segment:
    - testParameters can be used with simple Json Object string content, or broken down into decomposed parameters.

  --------------------------------------------------------------
  ### Using testParameters as a quoted string value of a valid json with the needed parameters: 

  ```
        admin@nso# devices device mcppsmod01 live-status exec tsm test-benchmarkOperations generatorId 8bdb1e66-1232-3483-1234-3f1b3f1234567::TPE_2_CTPServerToClient_VCE_N123456L type benchmark testParameters "{\"reflectorType\":\"UNI\",\"testMode\":\"out-of-service\",\"reflectorId\":\"31ff3203-10fa-3a47-a39a-76228370ba3a::TPE_15_CTPServerToClient_VCE_N7770001L\",\"tests\":[\"frameloss\",\"throughput\",\"latency\"],\"maxSamples\":3,\"samplingInterval\":100,\"colourValidation\":\"off\",\"pcpValidation\":\"off\",\"frameSizesw\":[\"64\",\"128\",\"512\",\"1024\",\"1518\",\"9000\",\"9216\"],\"duration\":\"15min\",\"maxSearches\":16,\"bandwidth\":100,\"vlanEncapType\":\"untagged\"}" freId -2348918337467823885
  ```

  --------------------------------------------------------------
  ### Using testParameters broken down with te same parameters used in the json string:

  ``` 
        admin@nso# devices device localmcp live-status exec tsm test-benchmarkOperations generatorId 8bdb1e66-1232-3483-1234-3f1b3f1234567::TPE_2_CTPServerToClient_VCE_N123456L type benchmark testParameters {  reflectorType UNI testMode out-of-service reflectorId ne2clientTpeId tests [ frameloss throughput latency ] maxSamples 3 samplingInterval 100 colourValidation off pcpValidation off frameSizes [ 64 128 512 1024 1518 9000 9216 ] duration 15min maxSearches 16 bandwidth 100 vlanEncapType untagged }
  ```

  --------------------------------------------------------------
  ## 20. tsm node-upgrade            NODE UPGRADE COMMANDS
  --------------------------------------------------------------

      admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade ?           
      Possible completions:
          check-ne-upgrade-details   Command to start firmware download
          disable-docs               Command to disable docs
          get-node-backups           Command to get backups for node
          get-node-docs              Command to start firmware download
          get-shelf-config           Command to get shelf config for node
          resume-upgrade             Command to resume upgrade
          retrieve-upgrade-state     Command to start firmware download
          schedule-node-backup       Command to schedule node backup
          search-nodes-doc           Command to get node docs
          start-firmware-download    Command to start firmware download
          suspend-upgrade            Command to suspend upgrade of the given network element node
          upgrade-state              Command to start firmware download


  --------------------------------------------------------------
  ## 20.1 tsm node-upgrade check-ne-upgrade-details 

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade check-ne-upgrade-details ?
  Possible completions:
      name   Network Element node upgrade details to check for
  ```

  --------------------------------------------------------------
  ## 20.2 tsm node-upgrade disable-docs  

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade disable-docs ?           
  Possible completions:
    docDetails   Docs to disable
  ```
  --------------------------------------------------------------
  ## 20.3 tsm node-upgrade get-node-backups 

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade get-node-backups ?
  Possible completions:
    nename   Network Element node name to get backups for
  ```

  --------------------------------------------------------------
  ## 20.4 tsm node-upgrade get-node-docs

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade get-node-docs ?  
  Possible completions:
    networkConstructNames   Network Element node name to get docs for
  ```

  --------------------------------------------------------------
  ## 20.5 tsm node-upgrade get-shelf-config 

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade get-shelf-config ?
  Possible completions:
    physicalNeName   Network Element node name to get shelf config for
  ```

  --------------------------------------------------------------
  ## 20.6 tsm node-upgrade resume-upgrade 

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade resume-upgrade ? 
  Possible completions:
    neName   NE Name to resume upgrade for
  ```

  --------------------------------------------------------------
  ## 20.7 tsm node-upgrade retrieve-upgrade-state

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade retrieve-upgrade-state ?
  Possible completions:
    networkConstructName   Network Element node name to get upgraded state for
  ```

  --------------------------------------------------------------
  ## 20.8 tsm node-upgrade schedule-node-backup

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade schedule-node-backup ?           
  Possible completions:
    backupProfileName   Profile name for scripts[0].relationships.profile.data.id
    nename              Network Element node name to schedule backup for
    scheduleTime        Current Date Time
  ```

  --------------------------------------------------------------
  ## 20.9 tsm node-upgrade search-nodes-doc

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade search-nodes-doc ?                  
  Possible completions:
    networkConstructId   Network Construct Id to get docs for
  ```

  --------------------------------------------------------------
  ## 20.10 tsm node-upgrade start-firmware-download

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade start-firmware-download ?
  Possible completions:
    nename          Network Element node name to start firmware download for
    releaseNumber   FIRMWARE_TO release number
  ```

  --------------------------------------------------------------
  ## 20.11 tsm node-upgrade suspend-upgrade

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade suspend-upgrade ?
  Possible completions:
    neName   NE Name to suspend upgrade for
  ```

  --------------------------------------------------------------
  ## 20.12 tsm node-upgrade upgrade-state

  ```
  admin@ncs(config-device-localmcp)# live-status exec tsm node-upgrade upgrade-state ?  
  Possible completions:
    networkConstructName   Network Element node name to upgrade state for
  ```



  ---
  ## 21. tsm node-enrolment          NODE ENROLMENT COMMANDS              BEGIN :                             
  ---

  - Collection of new live status commands and extension of existing commands used to run node enrolment **
  *** The command collection is ordered as per the deployment process for node enrolment to exemplify usage ***
  ```
  admin@ncs(config)# devices device netsim-0 live-status exec tsm node-enrolment ?
  Possible completions:
    backup-schedule                   Command to schedule backup
    clear-and-deEnroll                Command to clear and de-enroll NE managementSessions
    create-group                      Command to create a group
    delete-group                      Command to delete planned group
    delete-networkConstructs-groups   Command to delete Group from All NCs
    get-configmgmt-profiles           Command to run Node Reconnect
    get-management-sessions           Command to get management sessions for node enrolment
    get-ne-maintenanceDetails         Command to get backup schedules for network elements
    get-ne-managementSessions         Command to get NE managementSessions
    get-node-upgrade-details          Command to get Node Upgrade Details
    get-resource-serviceTopology      Command to get Optical Details - serviceTopology for optical FRE Id
    get-schedules                     Command to get schedules for node enrolment
    lldp-link-tag                     Command to patch LLDP Link Tag with TDM-Project tag or to clear it
    node-reconnect                    Command to run Node Reconnect
    patch-ne-managementSessions       Command to PATCH NE management Sessions
    patch-networkConstructs           Command to PATCH NE management Sessions - network constructs
    run-enrolment                     Command to run enrolment
    run-node-backup                   Command to run node backup
    search-networkConstructs          Command to search Parent Group
    search-parent-group               Command to search Parent Group
    session-pre-enrolment             Command to request session pre enrolment
    trigger-group-creation            Command to trigger the creation of group
  ```


      ----------------------------------
      Collection for node enrolment process:
      4. 4 Enrolment/8 De-enrol:
      ----------------------------------

      ------------------------------------------------------
      2-1 GET neProfiles (build)
      ------------------------------------------------------	

          GET {{BaseURL}}/discovery/api/v1/neprofiles 
          ---------------
          [NED COMMAND] : live-status exec tsm get-ne-profiles api-version api/v1

      ------------------------------------------------------
      2-2 GET Schedules (21.12   tsm node-enrolment get-schedules)
      ------------------------------------------------------

          GET {{BaseURL}}/configmgmt/api/v1/schedules?state=SCHEDULED&type=BACKUP 
          ---------------
          [NED COMMAND] : live-status exec tsm node-enrolment get-schedules

      ------------------------------------------------------
      2-3 GET Management Sessions (21.7    tsm node-enrolment get-management-sessions)
      ------------------------------------------------------

          GET {{BaseURL}}/discovery/api/v4/managementSessions?limit=0&metaDataFields=resourceType,associationState,displayState,profileName,typeGroup,resourcePartitionInfo&searchFields=&searchText=
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment get-management-sessions use-metaDataFields true limit 0

      ------------------------------------------------------	
      2-3 GET Management Sessions Copy (21.7    tsm node-enrolment get-management-sessions)
      ------------------------------------------------------

          GET {{BaseURL}}/discovery/api/v4/managementSessions?offset=0&resourcePartitionInfo=&searchFields=&searchText=&sortBy=-data.attributes.created
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment get-management-sessions use-empty-resourcePartitionInfo true sortByCreated true offset 0

      ------------------------------------------------------
      2-3 GET Management Sessions Copy (21.7    tsm node-enrolment get-management-sessions)
      ------------------------------------------------------
          GET {{BaseURL}}/discovery/api/v4/managementSessions?resourcePartitionInfo=&searchFields=&searchText=&sortBy=-data.attributes.created&offset=20&limit=20
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment get-management-sessions use-empty-resourcePartitionInfo true sortByCreated true offset 20 limit 20

      ------------------------------------------------------
      3-1 POST Pre-Enrolment. Mgt Session (21.21   tsm node-enrolment session-pre-enrolment)
      ------------------------------------------------------
          POST {{BaseURL}}/discovery/api/v3/managementSessions
          {
              "data": {
                  "attributes": {
                      "ipAddress": "1.2.3.4",
                      "discoveryState": "PENDING",
                      "profile": "{{neConnectionProfileId}}",
                      "resourcePartitionInfo": [],
                      "additionalIpAddresses": [
                          "4.5.6.7"
                      ]
                  },
                  "type": "managementSessions"
              }
          }
          ---------------	
      [NED COMMAND] : live-status exec tsm node-enrolment session-pre-enrolment ipAddress 1.2.3.4 discoveryState PENDING profile {{neConnectionProfileId}} additionalIpAddresses [ 4.5.6.7 ]   

      ------------------------------------------------------
      3-1 POST Pre-Enrolment (no addional IP) (21.21   tsm node-enrolment session-pre-enrolment)
      ------------------------------------------------------
          POST {{BaseURL}}/discovery/api/v3/managementSessions
          {
              "data": {
                  "attributes": {
                      "ipAddress": "1.2.3.4",
                      "discoveryState": "PENDING",
                      "profile": "{{neConnectionProfileId}}",
                      "resourcePartitionInfo": [],
                      "additionalIpAddresses": []
                  },
                  "type": "managementSessions"
              }
          }
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment session-pre-enrolment ipAddress 1.2.3.4 discoveryState PENDING profile {{neConnectionProfileId}}                                  


      ------------------------------------------------------
      3-2 POST Pre-Enrolment. Backup Schedule (21.1    tsm node-enrolment backup-schedule)
      ------------------------------------------------------

          POST 	{{BaseURL}}/configmgmt/api/v1/schedule/assignNE
          BODY
          {
              "ipAddress": "1.2.3.4",
              "resourcePartitionInfo": [],
              "backupSchedule": "{{scheduleId}}",
              "additionalIpAddresses": [
                  "4.5.6.7"
              ]
          }
          ---------------	
          [NED COMMAND] : # live-status exec tsm node-enrolment backup-schedule ipAddress 1.2.3.4 backupSchedule {{scheduleId}} additionalIpAddresses [ 4.5.6.7 ] 

      ------------------------------------------------------
      3-3 PATCH Enrol (21.17   tsm node-enrolment run-enrolment)
      ------------------------------------------------------

          PATCH {{BaseURL}}/discovery/api/v4/managementSessions/{{preEnrolManagementSessionId}}
          {
              "operations": [
                  {
                      "op": "enroll"
                  }
              ]
          }
          ---------------	
          [NED COMMAND] :  # live-status exec tsm node-enrolment run-enrolment preEnrolManagementSessionId {{preEnrolManagementSessionId}} 

      ------------------------------------------------------
      5-1 GET NE Management Session (21.9    tsm node-enrolment get-ne-managementSessions)
      ------------------------------------------------------

          GET {{BaseURL}}/discovery/api/v3/managementSessions/{{preEnrolManagementSessionId}}
          ---------------	
          [NED COMMAND] :# live-status exec tsm node-enrolment get-ne-managementSessions preEnrolManagementSessionId {{preEnrolManagementSessionId}}

      ------------------------------------------------------
      6-1 DELETE Clear&DeEnrol (21.2    tsm node-enrolment clear-and-deEnroll)
      ------------------------------------------------------

          DELETE {{BaseURL}}/discovery/api/v3/managementSessions/{{preEnrolManagementSessionId}}
          ---------------	
          [NED COMMAND]  : # live-status exec tsm node-enrolment clear-and-deEnroll preEnrolManagementSessionId {{preEnrolManagementSessionId}}


      ----------------------------------
      5.2 Reconnect
      ----------------------------------
      ------------------------------------------------------
      2-3 GET Management Sessions Copy 2 (21.7    tsm node-enrolment get-management-sessions)
      ------------------------------------------------------
          GET {{BaseURL}}/discovery/api/v4/managementSessions?
                                                      limit=20
                                                      &offset=0
                                                      &resourcePartitionInfo=
                                                      &searchFields=
                                                      &searchText=
                                                      &sortBy=-data.attributes.created
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment get-management-sessions use-empty-resourcePartitionInfo true limit 20 sortByCreated true

      ------------------------------------------------------
      2-3 GET Management Sessions Copy 2 (21.7    tsm node-enrolment get-management-sessions)
      ------------------------------------------------------
          GET {{BaseURL}}/discovery/api/v4/managementSessions?
                                                      resourcePartitionInfo=
                                                      &searchFields=
                                                      &searchText=
                                                      &sortBy=-data.attributes.created
                                                      &offset=20
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment get-management-sessions use-empty-resourcePartitionInfo true offset 20  sortByCreated true

      ------------------------------------------------------
      3-1 PATCH Node Reconnect (21.14   tsm node-enrolment node-reconnect )
      ------------------------------------------------------
          PATCH {{BaseURL}}/discovery/api/v4/managementSessions/{{neManagementSessionId}}
          {
              "operations": [
                  {
                      "op": "reconnect"
                  }
              ]
          }
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment node-reconnect neManagementSessionId {{neManagementSessionId}}

      ------------------------------------------------------
      5-1 GET NE Management Session Copy (21.9    tsm node-enrolment get-ne-managementSessions)
      ------------------------------------------------------

          GET {{BaseURL}}/discovery/api/v3/managementSessions/{{reconnectManagementSessionId}}
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment get-ne-managementSessions preEnrolManagementSessionId {{reconnectManagementSessionId}}


      ----------------------------------
      6 Backups
      ----------------------------------

      ----------------------------------
      6.1 Backup Schedules
      ----------------------------------
      ------------------------------------------------------
      2-1 GET Backup Schedule (21.8    tsm node-enrolment get-ne-maintenanceDetails)
      ------------------------------------------------------
          GET {{BaseURL}}/configmgmt/api/v1/neMaintenanceDetails?limit=200&offset=0&sortBy=name
          ---------------	
          [NED COMMAND]  # live-status exectsm node-enrolment get-ne-maintenanceDetails



      ----------------------------------
      6.2 Adhoc Backups
      ----------------------------------
      ------------------------------------------------------
      2-1 GET Profiles (21.6    tsm node-enrolment get-configmgmt-profiles)
      ------------------------------------------------------
          GET {{BaseURL}}/configmgmt/api/v2/profiles?ipAddress=&limit=100&name=&offset=0
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment get-configmgmt-profiles limit 100 offset 0


      ------------------------------------------------------
      2-3 GET Management Sessions Copy 3 (21.7    tsm node-enrolment get-management-sessions)
      ------------------------------------------------------
          GET {{BaseURL}}/discovery/api/v4/managementSessions?
                                                          resourcePartitionInfo=
                                                          &searchFields=
                                                          &searchText=
                                                          &sortBy=-data.attributes.created
                                                          &offset=20
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment get-management-sessions use-empty-resourcePartitionInfo true offset 20 sortByCreated true

      ------------------------------------------------------
      2-3 GET Management Sessions Copy 3 (21.7    tsm node-enrolment get-management-sessions)
      ------------------------------------------------------
          GET {{BaseURL}}/discovery/api/v4/managementSessions?
                                                          limit=20
                                                          &offset=0
                                                          &resourcePartitionInfo=
                                                          &searchFields=
                                                          &searchText=
                                                          &sortBy=-data.attributes.created
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment get-management-sessions use-empty-resourcePartitionInfo true offset 0 limit 20 sortByCreated true

      ------------------------------------------------------
      3-1 POST Node Backup (21.18   tsm node-enrolment run-node-backup)
      ------------------------------------------------------
          POST {{BaseURL}}/configmgmt/api/v1/neBackups
          {
              "data": {
                  "type": "jobs",
                  "attributes": {
                      "maxConnections": 10,
                      "scheduleTime": "1655697099268",
                      "scripts": [
                          {
                              "scriptName": "bpoBackup",
                              "inputs": [
                                  {
                                      "label": "Backup"
                                  }
                              ],
                              "relationships": {
                                  "profile": {
                                      "data": {
                                          "type": "profiles",
                                          "id": "{{backupProfileName}}"
                                      }
                                  }
                              }
                          }
                      ]
                  },
                  "relationships": {
                      "connectionAttributes": {
                          "data": [
                              {
                                  "type": "connectionAttributes",
                                  "id": "{{ne1Name}}"
                              }
                          ]
                      }
                  }
              },
              "included": [
                  {
                      "type": "profiles",
                      "id": "{{backupProfileName}}",
                      "attributes": {
                          "profileName": "{{backupProfileName}}"
                      }
                  },
                  {
                      "id": "{{ne1Name}}",
                      "type": "connectionAttributes",
                      "attributes": {
                          "neName": "{{ne1Name}}",
                          "neType": "{{resourceType}}",
                          "typeGroup": "{{typeGroup}}"
                      }
                  }
              ]
          }
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment run-node-backup data { attributes { scheduleTime 1655697099268 scripts { scriptName bpoBackup relationships { profiles { data { id backupProfileName } } } inputs { label Backup } } } relationships { connectionAttributes { data { id ne1Name } } } } included { id backupProfileName type profiles attributes { profileName backupProfileName } } included { type connectionAttributes id ne1Name attributes { neName nename neType netype typeGroup typegroup } }   

      ------------------------------------------------------
      5-1 GET Node Upgrade Details (21.10   tsm node-enrolment get-node-upgrade-details)
      ------------------------------------------------------
          GET {{BaseURL}}/configmgmt/api/v1/neUpgradeDetails? 
                                                      limit=0
                                                      &metaDataFields=
                                                                      resourceType,
                                                                      associationState,
                                                                      syncState,
                                                                      softwareActiveVersion,
                                                                      associationStateQualifier,
                                                                      resourcePartitionInfo,
                                                                      subnetName
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment get-node-upgrade-details use-metaDataFields true

      ------------------------------------------------------
      5-2 GET Node Upgrade Details Copy (21.10   tsm node-enrolment get-node-upgrade-details)
      ------------------------------------------------------
          GET {{BaseURL}}/configmgmt/api/v1/neUpgradeDetails?
                                                      ipAddress=
                                                      &limit=200
                                                      &name=
                                                      &offset=0
                                                      &releaseMgmtSchedules=
                                                      &resourcePartitionInfo=
                                                      &sortBy=name
                                                      &subnetName=
                                                      &upgradeSchedules=

          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment get-node-upgrade-details use-metaDataFields false limit 200

      ----------------------------------
      7 Tags
      ----------------------------------


      ----------------------------------
      7.1.1 Node Logical Map Group Tags
      ----------------------------------
      ## Create Logical Map Group
          ------------------------------------------------------
          2-1 GET Parent Group (21.20   tsm node-enrolment search-parent-group)
          ------------------------------------------------------
              GET {{BaseURL}}/nsi/api/v1/search/groups?groupType=map&limit=1000
              ---------------	
              [NED COMMAND] : live-status exec tsm node-enrolment search-parent-group 

          ------------------------------------------------------
          3-1 POST Trigger the creation of group (21.22   tsm node-enrolment trigger-group-creation)
          ------------------------------------------------------
              POST {{BaseURL}}/nsi/api/v3/groups
              {
                  "data": {
                      "attributes": {},
                      "type": "group"
                  }
              }
              ---------------	
              [NED COMMAND] : live-status exec tsm node-enrolment trigger-group-creation

          ------------------------------------------------------
          3-2 PUT Create a group (21.3    tsm node-enrolment create-group)
          ------------------------------------------------------
              PUT {{BaseURL}}/nsi/api/v3/groups/{{groupPlannedId}}/groupPlanned
              {
                  "data": {
                      "attributes": {
                          "name": "{{groupName}}",
                          "groupType": "map"
                      },
                      "relationships": {
                          "parentGroup": {
                              "data": [
                                  {
                                      "type": "group",
                                      "id": "{{parentGroupId}}"
                                  }
                              ]
                          }
                      },
                      "type": "groupPlanned"
                  }
              }
              ---------------	
              [NED COMMAND] : live-status exec tsm node-enrolment create-group groupPlannedId {{groupPlannedId}} groupName {{groupName}} parentGroupId {{parentGroupId}}

          ------------------------------------------------------
          5-1 GET Group (21.20   tsm node-enrolment search-parent-group )
          ------------------------------------------------------
              GET {{BaseURL}}/nsi/api/v1/search/groups?groupType=map&limit=1000
              ---------------	
              [NED COMMAND] : live-status exec tsm node-enrolment search-parent-group 

      ------------------------------
      ## Deleting a group. Complex!
      ------------------------------

          ------------------------------------------------------
          6-1 GET Network Constructs with TAG (21.19   tsm node-enrolment search-networkConstructs)
          ------------------------------------------------------
              GET {{BaseURL}}/nsi/api/v1/search/networkConstructs?
                                                                  id=
                                                                  &tags={{groupName}}
                                                                  &resourceState=planned,discovered,plannedAndDiscovered
                                                                  &networkConstructType=networkElement,manual,submarineRepeater,branchingUnit,foreignNode
                                                                  &fields=data.attributes.tags,data.attributes.userData
                                                                  &limit=1000
              ---------------	
              [NED COMMAND] : live-status exec tsm node-enrolment search-networkConstructs tags {{groupName}} limit 1000

          ------------------------------------------------------
          6-1 GET All Network Constructs (alternative) (21.19   tsm node-enrolment search-networkConstructs)
          ------------------------------------------------------
              GET {{BaseURL}}/nsi/api/v1/search/networkConstructs?
                                                                  id=
                                                                  &resourceState=planned,discovered,plannedAndDiscovered
                                                                  &networkConstructType=networkElement,manual,submarineRepeater,branchingUnit,foreignNode
                                                                  &fields=data.attributes.tags,data.attributes.userData
                                                                  &limit=1000
              ---------------	
              [NED COMMAND] : live-status exec tsm node-enrolment search-networkConstructs limit 1000



      ------------------------------------------------------
      7-1 PATCH Delete Group Planned (21.4    tsm node-enrolment delete-group)
      ------------------------------------------------------
          PATCH {{BaseURL}}/nsi/api/v3/groups/{{groupId}}/groupPlanned
          {
              "operations": [
                  {
                      "op": "delete",
                      "relationships": {
                          "parentGroup": {
                              "data": [
                                  {
                                      "type": "group",
                                      "id": "{{parentGroupId}}"
                                  }
                              ]
                          }
                      }
                  }
              ]
          }
          ---------------	
          [NED COMMAND] : live-status exec tsm node-enrolment delete-group groupId {{groupId}} parentGroupId {{parentGroupId}}


      ------------------------------------------------------
      7-2 PATCH Delete Group from All NCs (21.5    tsm node-enrolment delete-networkConstructs-groups)
      ------------------------------------------------------
      PATCH {{BaseURL}}/nsi/api/networkConstructs/{{networkConstructWithGroupId}}
      {
          "operations": [
              {
                  "op": "delete",
                  "attribute": "userData",
                  "keys": [
                      "tagXY_{{groupName}}"
                  ]
              }
          ]
      }

      [NED COMMAND] : live-status exec tsm node-enrolment delete-networkConstructs-groups networkConstructWithGroupId {{networkConstructWithGroupId}} groupName {{groupName}}


      ----------------------------------
      7.1.3 Node Tags (missing heading in MCP guide)
      ----------------------------------

      ------------------------------------------------------
      2-1 GET Management Sessions (21.7    tsm node-enrolment get-management-sessions)
      ------------------------------------------------------
          GET {{BaseURL}}/discovery/api/v4/managementSessions?offset=0&resourcePartitionInfo=&searchFields=&searchText=&sortBy=-data.attributes.created
          ---------------	
          [NED COMMAND]  # live-status exectsm node-enrolment get-management-sessions use-empty-resourcePartitionInfo true sortByCreated true

      ------------------------------------------------------
      2-1 GET Management Sessions	(21.7    tsm node-enrolment get-management-sessions)
      ------------------------------------------------------
          GET {{BaseURL}}/discovery/api/v4/managementSessions?offset=20&resourcePartitionInfo=&searchFields=&searchText=&sortBy=-data.attributes.created
          ---------------	
          [NED COMMAND]  # live-status exectsm node-enrolment get-management-sessions use-empty-resourcePartitionInfo true sortByCreated true


      ------------------------------------------------------
      3-1 PATCH NE Mgt Session (21.15   tsm node-enrolment patch-ne-managementSessions)
      ------------------------------------------------------
          PATCH {{BaseURL}}/discovery/api/v4/managementSessions/{{managementSessionId}}
          {
              "operations": [
                  {
                      "op": "replace",
                      "attributes": {
                          "resourcePartitionInfo": []
                      }
                  }
              ]
          }	
          ---------------	
          [NED COMMAND]  # live-status exec tsm node-enrolment patch-ne-managementSessions managementSessionId {{managementSessionId}}

      ------------------------------------------------------	
      3-2 PATCH NE Mgt Session (21.16   tsm node-enrolment patch-networkConstructs)
      ------------------------------------------------------
          PATCH {{BaseURL}}/nsi/api/v3/networkConstructs/{{ne1NcId}}
          {
              "operations": [
                  {
                      "op": "replace",
                      "attributes": {
                          "tags": [
                              "TAG-NAME-001",
                              "TAG-NAME-002",
                              "TAG NAME 003",
                              "TAG-NAME-004"
                          ]
                      }
                  }
              ]
          }
          ---------------	
          [NED COMMAND]  # live-status exec tsm node-enrolment patch-networkConstructs neNetworkConstructId {{ne1NcId}} tags [ TAG-NAME-001 TAG-NAME-002 "TAG NAME 003" TAG-NAME-004 ] 

      ------------------------------------------------------
      5-1 GET Network Constructs (15. tsm search )
      ------------------------------------------------------
          GET {{BaseURL}}/nsi/api/v1/search/networkConstructs?
                                                              include=expectations
                                                              &limit=50
                                                              &networkConstructType=networkElement
                                                              &searchFields=data.attributes.displayData.displayName
                                                              &searchText={{ne1Name}}
                                                              &sortBy=data.attributes.displayData.displayName
          ---------------
          [NED COMMAND]  # live-status exec tsm search node networkConstructs include expectations limit 50 networkConstructType networkElement searchFields data.attributes.displayData.displayName searchText {{ne1Name}} sortBy data.attributes.displayData.displayName



      ----------------------------------
      7.2 LLDP Link Tags (Packet Infrastructure)
      ----------------------------------

      ------------------------------------------------------
      2-1 GET LLDP FRE ID(s?) (15. tsm search )
      ------------------------------------------------------
          GET {{BaseURL}}/nsi/api/v2/search/fres?serviceClass=LLDP&searchFields=data.attributes.tpeLocations&searchText={{ne1Name}}
          ---------------
          [NED COMMAND] : live-status exec tsm search node fres serviceClass LLDP searchFields data.attributes.tpeLocations searchText {{ne1Name}}

      ------------------------------------------------------
      3-1 PATCH LLDP Link Tag (21.13   tsm node-enrolment lldp-link-tag)
      ------------------------------------------------------
          PATCH {{BaseURL}}/nsi/api/v4/fres/{{lldpFreId}}

          {
              "operations": [
                  {
                      "op": "replace",
                      "attributes": {
                          "tags": [
                              "TAG-NAME-004"
                          ]
                      }
                  }
              ]
          }
          ---------------
          [NED COMMAND] : live-status exec tsm node-enrolment lldp-link-tag lldpFreId {{lldpFreId}} clearTags false

      ------------------------------------------------------
      3-2 PATCH LLDP Remove Link Tag (21.13   tsm node-enrolment lldp-link-tag)
      ------------------------------------------------------
          PATCH {{BaseURL}}/nsi/api/v4/fres/{{lldpFreId}}
          {
              "operations": [
                  {
                      "op": "replace",
                      "attributes": {
                          "tags": []
                      }
                  }
              ]
          }
          ---------------
          [NED COMMAND] : live-status exec tsm node-enrolment lldp-link-tag lldpFreId {{lldpFreId}} clearTags true

      ------------------------------------------------------
      5-1 GET LLDP Details (21.11   tsm node-enrolment get-resource-serviceTopology)
      ------------------------------------------------------
          GET {{BaseURL}}/revell/api/v2/serviceTopology/{{lldpFreId}}?
                                                                  include=fres,tpes,equipment,expectations,networkConstructs,abstracts,controllers,utilization
                                                                  &traversalScope=
          ---------------
          [NED COMMAND] : live-status exec tsm node-enrolment get-resource-serviceTopology resourceId {{lldpFreId}}


      ----------------------------------
      7.3 Optical Link Tags (Transport Infrastructure)
      ----------------------------------

      --------------------------------------------------------------------
      2-1 GET Optical FRE IDs (15. tsm search)
      --------------------------------------------------------------------
          GET	{{BaseURL}}/nsi/api/v2/search/fres?serviceClass=Fiber,OTU,OSRP Line,OSRP Link,ROADM Line,Embedded Ethernet Link,OMS&searchFields=data.attributes.tpeLocations&searchText={{ne1Name}}
          ---------------
          [NED COMMAND]  # live-status exec tsm search node fres serviceClass "Fiber,OTU,OSRP Line,OSRP Link,ROADM Line,Embedded Ethernet Link,OMS" searchFields data.attributes.tpeLocations searchText {{ne1Name}} 

      --------------------------------------------------------------------
      2-2 GET Transport Service FRE IDs (15. tsm search)
      --------------------------------------------------------------------
          GET {{BaseURL}}/nsi/api/v2/search/fres?serviceClass=Photonic,SNC,SNCP,Transport Client&searchFields=data.attributes.tpeLocations&networkConstruct.id={{ne1NcId}}
          ---------------
          [NED COMMAND]  # live-status exec tsm search node fres serviceClass "Photonic,SNC,SNCP,Transport Client" searchFields data.attributes.tpeLocations networkConstructId {{ne1NcId}}

      --------------------------------------------------------------------
      3-1 PATCH Optical Link Tag
      --------------------------------------------------------------------
          PATCH {{BaseURL}}/nsi/api/v4/fres/{{opticalFreId}}
          {
              "operations": [
                  {
                      "op": "replace",
                      "attributes": {
                          "tags": [
                              "TAG-NAME-001",
                              "TAG-NAME-002"
                          ]
                      }
                  }
              ]
          }
          ---------------
          [NED COMMAND]  # live-status exec tsm otn-patch-fre freId {{opticalFreId}} operations { op replace attributes { tags [ TAG-NAME-001 TAG-NAME-002 ] } }

      --------------------------------------------------------------------
      3-2 PATCH Optical Link Remove Tag
      --------------------------------------------------------------------
          PATCH {{BaseURL}}/nsi/api/v4/fres/{{opticalFreId}}
          {
              "operations": [
                  {
                      "op": "replace",
                      "attributes": {
                          "tags": [
                              "TAG-NAME-001"
                          ]
                      }
                  }
              ]
          }
          ---------------
          [NED COMMAND]  # live-status exec tsm otn-patch-fre freId {{opticalFreId}} operations { op replace attributes { tags [ TAG-NAME-001 ] } }

      --------------------------------------------------------------------
      5-1 GET Optical Details
      --------------------------------------------------------------------

          GET {{BaseURL}}/revell/api/v2/serviceTopology/{{opticalFreId}}?include=fres,tpes,equipment,expectations,networkConstructs,abstracts,controllers,utilization&traversalScope=
          ---------------
          [NED COMMAND]  # live-status exec tsm node-enrolment get-resource-serviceTopology resourceId {{transportClientFreId}}

      ----------------------------------
      7.4 Transport Service Tags
      ----------------------------------
      --------------------------------------------------------------------
      2-1 GET Network Constructs
      --------------------------------------------------------------------
          GET {{BaseURL}}/nsi/api/v1/search/networkConstructs?include=expectations&limit=50&networkConstructType=networkElement&searchFields=data.attributes.displayData.displayName&searchText={{ne1Name}}&sortBy=data.attributes.displayData.displayName
          ---------------
          [NED COMMAND]  # live-status exec tsm search node networkConstructs include expectations limit 50 networkConstructType networkElement searchFields data.attributes.displayData.displayName searchText {{ne1Name}} sortBy data.attributes.displayData.displayName

      --------------------------------------------------------------------	
      2-2 GET Transport Service FRE IDs
      --------------------------------------------------------------------
          GET {{BaseURL}}/nsi/api/v2/search/fres?serviceClass=Photonic,SNC,SNCP,Transport Client&searchFields=data.attributes.tpeLocations&networkConstruct.id={{ne1NcId}}
          ---------------
          [NED COMMAND]  # live-status exec tsm search node fres serviceClass "Photonic,SNC,SNCP,Transport Client" searchFields data.attributes.tpeLocations networkConstructId {{ne1NcId}}

      --------------------------------------------------------------------
      3-1 PATCH Transport Service Tag
      --------------------------------------------------------------------
          PATCH {{BaseURL}}/nsi/api/v4/fres/{{transportClientFreId}}
          {
              "operations": [
                  {
                      "op": "replace",
                      "attributes": {
                          "tags": [
                              "TAG-NAME-004"
                          ]
                      }
                  }
              ]
          }
          ---------------
          [NED COMMAND]  # live-status exec tsm otn-patch-fre freId {{opticalFreId}} operations { op replace attributes { tags [ TAG-NAME-004 ] } }


      --------------------------------------------------------------------
      3-2 PATCH Transport Service Remove Link Tag
      --------------------------------------------------------------------
          PATCH {{BaseURL}}/nsi/api/v4/fres/{{transportClientFreId}}
          {
              "operations": [
                  {
                      "op": "replace",
                      "attributes": {
                          "tags": []
                      }
                  }
              ]
          }
          ---------------
          [NED COMMAND]  # live-status exec tsm otn-patch-fre freId {{opticalFreId}} operations { op replace attributes { tags [ "" ] } }

      --------------------------------------------------------------------
      5-1 GET Transport Service Details
      --------------------------------------------------------------------
          GET {{BaseURL}}/revell/api/v2/serviceTopology/{{transportClientFreId}}	?include=fres,tpes,equipment,expectations,networkConstructs,abstracts,controllers,utilization&traversalScope=
          ---------------
          [NED COMMAND]  # live-status exec tsm node-enrolment get-resource-serviceTopology resourceId {{transportClientFreId}}

  ----------------------------------
  ###	21.	NODE ENROLMENT END ^                                                                              ###
  ----------------------------------



  ----------------------------------
  ##	22.	Intermediate OTN Links (OTU P-Links) : live status commands                                       ###
  ----------------------------------

       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-?
       Possible completions:
         otn-create-otm2-facility              Command to CREATE : OTN (OTM2) Facility, OOS, NDP, GCC, etc
         otn-delete-facility-params            Command to DELETE OTN (OTM2) Facility
         otn-get-equipment-facility-submenus   Command to get OTN Facility Submenus
         otn-get-equipment-information         Command to get OTN Equipment information
         otn-patch-fre                         Command to Modify OTN Service FRE

       ----------------------------------
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-get-equipment-information ?     
       Possible completions:
         query  <cr>

       ----------------------------------
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-get-equipment-information query { ?
       Possible completions:
         deviceType        Optical Intermediate Device Type
         ncid              NetworkConstruct NE Id A END
         neName            Optical Intermediate NE Display Name
         sessionid         Optical Intermediate Management Session Id
         softwareVersion   Optical Intermediate Software Version
         state             
         typegroup         Optical Intermediate Type Group
         }  

       ----------------------------------
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-get-equipment-facility-submenus ?
       Possible completions:
         equipment  query  <cr>
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-get-equipment-facility-submenus query { ?
       Possible completions:
         deviceType        Optical Intermediate Device Type
         ncid              NetworkConstruct NE Id A END
         neName            Optical Intermediate NE Display Name
         sessionid         Optical Intermediate Management Session Id
         softwareVersion   Optical Intermediate Software Version
         state             
         typegroup         Optical Intermediate Type Group
         }                 

       ----------------------------------  
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-get-equipment-facility-submenus equipment { ?
       Possible completions:
         cardType             Optical Intermediate Card Type
         carrierEqptPecCode   Optical Intermediate Carrier Eqpt Pec Code
         carrierEqptType      Optical Intermediate Carrier Eqpt Type
         nativeName           Optical Intermediate Native Name
         ncid                 Optical Intermediate networkConstructs Ne Id
         partNumber           Optical Intermediate Part Number
         shelf                Optical Intermediate Shelf
         slot                 Optical Intermediate Slot
         subslot              Optical Intermediate Sub Slot
         }                    

       ----------------------------------                   
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-create-otm2-facility             
       Possible completions:
         attributes  details  equipment  query
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-create-otm2-facility attributes { 
       Possible completions:
         AID                  
         CARRIER              
         CLFI                 
         EBERTH               
         FACILITYTYPE         Optical Intermediate Facility Type
         LASEROFFFARENDFAIL   i.e.: DISABLED
         LLSDCCENABLE         
         LLSDCCEXISTS         
         MAPPING              i.e: GFPMACTR
         MTU                  
         NDPENABLED           
         NDPEXISTS            
         NETDOMAIN            
         ODUMONITOR           
         ODUSDTHLEV           
         ODUSFTHLEV           
         OTURXFECFRMT         
         OTUSDTHLEV           
         OTUTXFECFRMT         
         PREFECSDTHLEV        
         PREFECSFTHLEV        
         PROTOCOL             
         PST                  i.e.: IS, OOS, etc
         SDTH                 
         SST                  
         }     

       ----------------------------------           
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-create-otm2-facility details {    
       Possible completions:
         AIDValue       
         facilityType   
         request        Request type
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-create-otm2-facility equipment { 
       Possible completions:
         cardType             Optical Intermediate Card Type
         carrierEqptPecCode   Optical Intermediate Carrier Eqpt Pec Code
         carrierEqptType      Optical Intermediate Carrier Eqpt Type
         nativeName           Optical Intermediate Native Name
         ncid                 Optical Intermediate networkConstructs Ne Id
         partNumber           Optical Intermediate Part Number
         shelf                Optical Intermediate Shelf
         slot                 Optical Intermediate Slot
         subslot              Optical Intermediate Sub Slot
         }     

       ----------------------------------               
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-create-otm2-facility query {     
       Possible completions:
         deviceType        Optical Intermediate Device Type
         ncid              NetworkConstruct NE Id A END
         neName            Optical Intermediate NE Display Name
         sessionid         Optical Intermediate Management Session Id
         softwareVersion   Optical Intermediate Software Version
         state             
         typegroup         Optical Intermediate Type Group
         }                 

       ----------------------------------               
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-patch-fre                    
       Possible completions:
         freId  operations
       ----------------------------------
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-patch-fre operations { 
       Possible completions:
         attributes   
         op           operation type: replace
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-patch-fre operations { attributes { 
       Possible completions:
         customerName  note  tags  }
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-patch-fre operations { attributes { note {       
       Possible completions:
         lastUpdatedBy  lastUpdatedTime  noteMsg  }
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-patch-fre operations { attributes { tags [ 
       Possible completions:
         string  ]
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-patch-fre operations { op ?                
       Description: operation type: replace 
       Possible completions:
         <string>

       ----------------------------------
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-delete-facility-params 
       Possible completions:
         AIDValue       Optical Intermediate FacilityType
         equipment      
         facilityType   Optical Intermediate FacilityType
         query          
       ----------------------------------
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-delete-facility-params equipment { 
       Possible completions:
         cardType             Optical Intermediate Card Type
         carrierEqptPecCode   Optical Intermediate Carrier Eqpt Pec Code
         carrierEqptType      Optical Intermediate Carrier Eqpt Type
         nativeName           Optical Intermediate Native Name
         ncid                 Optical Intermediate networkConstructs Ne Id
         partNumber           Optical Intermediate Part Number
         shelf                Optical Intermediate Shelf
         slot                 Optical Intermediate Slot
         subslot              Optical Intermediate Sub Slot
         }            
       ----------------------------------        
       admin@ncs(config-device-mcppsmod01)# live-status exec tsm otn-delete-facility-params query {     
       Possible completions:
         deviceType        Optical Intermediate Device Type
         ncid              NetworkConstruct NE Id A END
         neName            Optical Intermediate NE Display Name
         sessionid         Optical Intermediate Management Session Id
         softwareVersion   Optical Intermediate Software Version
         state             
         typegroup         Optical Intermediate Type Group
         }                 



  ----------------------------------
  ##	22.	Intermediate OTN Links (OTU P-Links) : live status commands   END^                                ###
  ----------------------------------


  ----------------------------------
  ## 23. tsm manage-service-operations   Manage service operations
  ----------------------------------

      admin@ncs(config-device-ciena-test)# live-status exec tsm manage-service-operations ?
      Possible completions:
        freId        FRE Id of the service to be managed
        interface    Interface Operation to perform: promoteService | manageService
        resourceId   Resource Id of service to be managed

      -----------------------------------------
      ### 23.1 Manage managedOperation Delete : 
      ----------------------------------------- 
          PromoteService and managedOperation resource operations are asynchronous; 
          initial successful state will be 'requested'
          then the $operationID must be polled for completion 
      ===================================================
      i.e.:

      admin@ncs(config-device-ciena-test)# live-status exec tsm manage-service-operations interface manageService managedOperation Delete resourceId $resourceId softDeleteAllowed true freId $freId
      result {
          requestStatus passed
      }
      response {
          operationId $operationID
          state requested
      }

      =========================
      managedOperation and softDeleteAllowed params are defaulted as specified so $freID and $resourceId are the only mandatory params if no other combination is needed:
      =========================
      admin@ncs(config-device-ciena-test)# live-status exec tsm manage-service-operations interface manageService freId $freId resourceId $resourceId 
      Possible completions:
        managedOperation    manageService: Operation to perform; default: Delete
        softDeleteAllowed   manageService: softDeleteAllowed param; default: true
        <cr>   
       =========================
       admin@ncs(config-device-ciena-test)# live-status exec tsm manage-service-operations interface manageService freId $freId resourceId $resourceId 
       result {
           requestStatus passed
       }
       response {
           operationId $operationId
           state requested
       }

      -----------------------------------------   
      23.2 Manage promoteService operations:  
      -----------------------------------------
          PromoteService and ManageService ops are asynchronous; 
          initial successful state will be 'requested'
          then the $operationID must be polled for completion
          promoteService requires only $freId and $resourceId input params 
      ===================================================
      i.e.:

      admin@ncs(config-device-ciena-test)# live-status exec tsm manage-service-operations interface promoteService ?
      Possible completions:
        freId        FRE Id of the service to be managed
        resourceId   Resource Id of service to be managed

      =========================
      admin@ncs(config-device-ciena-test)# live-status exec tsm manage-service-operations interface promoteService freId $freID resourceId $resourceId
      result {
          requestStatus passed
      }
      response {
          operationId $operationId
          state requested
      }

      -----------------------------------------
      23.3 Get operationId status:  
      -----------------------------------------
        To poll for operationId state, $operationID captured at 9.2 and 9.3 and $resourceId are needed:
      ===================================================

      admin@ncs(config-device-ciena-test)# live-status exec tsm get-resource-operation-state operationId $operationID resourceId $resourceId
      result {
          requestStatus passed
      }
      response {
          state successful
      }


  ----------------------------------
  ###	24. ALARMS                                                                                            ###
  ----------------------------------

      24.1)  Get Alarms
      -----------------------------------------
             * Fetch either filtered, correlated or entire alarms output
      -----------------------------------------
      admin@ncs(config-device-ciena-test)# live-status exec tsm get-alarms 
      Possible completions:
        alarm-type   Define alarm type callback : filtered | correlated
        Possible completions:
          correlatedAlarmsByService  filteredAlarms

        filters      Define alarm filters
        offset       
        pageSize     
        sort         Sort definition; i.e.: -last-raise-time
        <cr>      

      -----------------------------------------
      24.2) Get all filtered alarms   
      -----------------------------------------
      admin@ncs(config-device-ciena-test)# live-status exec tsm get-alarms alarm-type filteredAlarms 


      -----------------------------------------
      24.3) Get filtered alarm with custom filters:
      -----------------------------------------
      admin@ncs(config-device-ciena-test)# live-status exec tsm get-alarms alarm-type filteredAlarms filters { 
      Possible completions:
        additionalText        
        allTime               
        deviceId              
        deviceName            
        deviceType            
        keytext               
        lastRaisedTime        
        lastRaisedTimeFrom    
        nativeConditionType   
        refinedRaisedTimeTo   
        severity              
        state                 
        }                     Define alarm filters

      i.e.:
      admin@ncs(config-device-ciena-test)# live-status exec tsm get-alarms alarm-type filteredAlarms filters { deviceType $deviceType deviceName $deviceName allTime $allTime } sort -last-raise-time

      etc.

      -----------------------------------------
      24.4) Correlated alarms by Service
            !!! Requires $serviceId as mandatory input !!!    
      -----------------------------------------
      admin@ncs(config-device-ciena-test)# live-status exec tsm get-alarms alarm-type correlatedAlarmsByService ?
      Possible completions:
        filters     Define alarm filters
        offset      
        pageSize    
        serviceId   serviceId to get correlated alarms for
        sort        Sort definition; i.e.: -last-raise-time
        <cr>     


      Filters can be added as needed as well for correlatedAlarms:
      admin@ncs(config-device-ciena-test)# live-status exec tsm get-alarms alarm-type correlatedAlarmsByService serviceId $serviceId filters { deviceType 6500 deviceName $deviceName allTime $allTime } sort -last-raise-time


  ---
  ## 25. create-virtual-pLink                  Command to get Optical Details - serviceTopology for optical FRE Id
  ---

      admin@ncs(config-device-netsim-0)# live-status exec tsm create-virtual-pLink attributes {
      Possible completions:
          endpoints  
          equipmentOperation  
          networkElements  
          projectID  
          shelf  
          slot  
          vpEplNeName
      }


  ---
  ## 26. get-configmgmt-script-job             Command to get Script Output job id
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-configmgmt-script-job ?
  Possible completions:
    jobId   cliCutThrough JobId to fetch the output for
  ```

  ---
  ## 27. delete-configmgmt-script-job          Command to get Script Output job id
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm delete-configmgmt-script-job ?
  Possible completions:
    jobId   cliCutThrough JobId to delete the output for
  ```

  ---
  ## 28. get-configmgmt-scripts                Command to GET config management scripts by type
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-configmgmt-scripts ?
  Possible completions:
    limit
    offset
    scriptType   MANDATORY: Script type to fetch: customScripts or scriptProfiles
  ```

  ---
  ## 29. delete-configmgmt-scripts             Command to GET config management scripts by type
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm delete-configmgmt-scripts ?
  Possible completions:
    id
    scriptType   MANDATORY: Script type to delete: customScripts or scriptProfile
  ```

  ---
  ## 30. get-fre-ccstatus                      Command to retrieve ccStatus (Continuity Check)
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-fre-ccstatus ?
  Possible completions:
    freId
  ```

  ---
  ## 31. delete-fres-expectations              Command to delete FRES expectations for stuck in Scheduled state
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm delete-fres-expectations ?
  Possible completions:
    freExpectationsId   FRE freExpectationsId;
    freId               FRE full id;
  ```


  ---
  ## 32. delete-tpe                            Command to delete TPEs using given tpe id
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm delete-tpe ?
  Possible completions:
    id   Specify id to delete
  ```


  ---
  ## 33. get-equipment-information             Command to get Equipment information
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-equipment-information query {
  Possible completions:
    deviceType        Device Type
    ncid              NetworkConstruct NE Id A END
    neName            NE Display Name
    resourceType      NE Resource type
    sessionid         Management Session Id
    softwareVersion   Software Version
    state             State
    typegroup         Type Group
    }
  ```


  ---
  ## 34. get-equipment-topology-planning       Command to retrieve Available A-End ports for the rate selected
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-equipment-topology-planning ?
  Possible completions:
    clientRate  
    inUseByService  
    networkConstructId  
    <cr>
  ```


  ---
  ## 35. get-lag-details                       Command to Retrieve LAG details.
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-lag-details ?
  Possible completions:
    lagWithShelfEqptGrp   expected format: <<shelf::::eqptGrp::::LAGName::::LAGName>>
    ncid                  NetworkConstruct.id
    sessionid             NetworkConstruct.data.attributes.managementSession.data.id
    softwareVersion       NetworkConstruct.data.attributes.softwareVersion
    typegroup             NetworkConstruct.data.attributes.typeGroup
  ```


  ---
  ## 36. get-tpe-expectations                  Command to get TPE tpeExpectations using given tpeExpectations.serviceIntent.id
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-tpe-expectations ?
  Possible completions:
    limit             Limit value
    serviceIntentId   Specify tpes tpeExpectations.serviceIntent.id to get
  ```


  ---
  ## 37. get-jobId-status-response             Command to fetch the status and data available for a previously scheduled jobId
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-jobId-status-response ?
  Possible completions:
    jobId   Scheduled jobId to fetch the status for
  ```


  ---
  ## 38. get-resource-operation-state          Command to get Market Resources Service Operation state
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-resource-operation-state ?
  Possible completions:
    operationId   Operation Id of the resource to get the state for
    resourceId    Resource Id of service to be get op state for
  ```


  ---
  ## 39. get-service-intent-facade-id          Command to get relationships targetID by facadeId
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-service-intent-facade-id ?
  Possible completions:
    name             MANDATORY: L2ServiceIntentFacade Name
    resourceTypeId   Optional; i.e.: ifd.v6.resourceTypes.L2ServiceIntentFacade
  ```


  ---
  ## 40. get-tdc-pageLoad                      Command to Run test enabling/disabling tdmLoopback
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-tdc-pageLoad ?
  Possible completions:
    freId  includedInformation
  ```


  ---
  ## 41. get-test-pseudowire-result            Command to test EPL service
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm get-test-pseudowire-result ?
  Possible completions:
    printRaw   Set to true to print full raw Results from device
    testId
  ```


  ---
  ##     42. manage-eline-attributes               Command to retrieve Available A-End ports for the rate selected
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm manage-eline-attributes
  Possible completions:
    dry          Dry run display - not touching the device
    facadeName
    freId
    request      GET or UPDATE fre info; UPDATE assumes attributes exists!
    <cr>
  ```


  ---
  ##     43. sync-network-elements                 Command to get resync Network Elements
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm sync-network-elements ?
  Possible completions:
    networkConstructsMgtSessionId   MANDATORY: Network Construct Management Session Id
  ```


  ---
  ##     44. test-lspOperations                    Command to run a E-Tree service test from root-to-leaf or leaf-to-root
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm test-lspOperations ?
  Possible completions:
    localTpeId
    testParameters   String value with Json Object syntax is expected!
    type             type ex: ping|traceroute
    userAnnotation   userAnnotation or <string>
  ```


  ---
  ##     45. test-tdmOperations                    Command to Run test enabling/disabling tdmLoopback
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm test-tdmOperations ?
  Possible completions:
    freId
    localTpeId
    printRaw         Set to true to print full raw Results from device
    testParameters {
      Possible completions:
          channel
          mode        ex: terminal
          operation   ex: enable, disable
          type        ex: port
    }
    type             type ex: tdmLoopback
  ```


  ---
  ##     46. upload-script                         Command to upload custom script
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm upload-script
  Possible completions:
    description    description
    fullFilePath   MANDATORY: Full canonical path to script file.
    protocolType   MANDATORY: protocol type
    scriptName     MANDATORY: Script name
    typeGroup      MANDATORY: type group
  ```


  ---
  ##     47. upload-script-profile                 Command to upload scriptProfiles
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm upload-script-profile
  Possible completions:
    fullFilePath   MANDATORY: Full canonical path to script file.
    profileName    MANDATORY: Profile name
  ```


  ---
  ## 48. wavelength                            COLLECTION: Wavelength commands
  ---
  ## 48.1 get-adj-values      Command to get Optical Details - serviceTopology for optical FRE Id
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm wavelength get-adj-values
  Possible completions:
    adjType           equipmentinformation: adj Type; mandatory
    eqptName          equipmentinformation: equipment name; optional
    ncid              equipmentinformation: ncid; mandatory
    sessionid         query: session id; mandatory
    shelfNativeName   equipmentinformation: shelf native name; mandatory
    shelfPartNumber   equipmentinformation: shelf part number; mandatory
    slotNativeName    equipmentinformation: slot native name; mandatory
    slotPartNumber    equipmentinformation: slot part number; mandatory
    softwareVersion   query: software version; default <12.72>
    typegroup         query: type group; default <<Ciena6500>>
  ```


  ---
  ## 48.2 update-adj-values   Command to get Optical Details - serviceTopology for optical FRE Id
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm wavelength update-adj-values ?
  Possible completions:
    adjType           equipmentinformation: adj Type; mandatory
    adjUnitId         equipmentinformation: adj unit ID; mandatory
    eqptName          equipmentinformation: equipment name; optional
    ncid              equipmentinformation: ncid; mandatory
    neName            query: ne name; mandatory
    resourceType      query: resource type; mandatory; default <6500>
    sessionid         query: session id; mandatory
    shelfNativeName   equipmentinformation: shelf native name; mandatory
    shelfPartNumber   equipmentinformation: shelf part number; mandatory
    slotNativeName    equipmentinformation: slot native name; mandatory
    slotPartNumber    equipmentinformation: slot part number; mandatory
    softwareVersion   query: software version; default <12.72>
    typegroup         query: type group; default <Ciena6500>
    value             Build the body of the request: values to be updated {
      Possible completions:
        AID
        PADDRFORM
        PROVFEADDR
        }            Build the body of the request: values to be updated
  ```


  ----------------------------------
  ## 49. manage-lag                            COLLECTION: LAG management commands                       ###
  ----------------------------------


  ---
  ## 49.1 tsm manage-lag create-interfacemanagement : 
  - Command to Create LAG InterfaceManagement entry
  ---

      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag create-interfacemanagement ?
      Possible completions:
          deviceType        NetworkConstruct.data.attributes.deviceType
          ncid              NetworkConstruct.id
          neName            NetworkConstruct.data.attributes.name
          resourceType      NetworkConstruct.data.attributes: ex.
          sessionid         NetworkConstruct.data.attributes.managementSession.data.id
          softwareVersion   NetworkConstruct.data.attributes.softwareVersion
          typegroup         NetworkConstruct.data.attributes.typeGroup
          value             Build request body {
              Possible completions:
                  interfaceIfMtu           [common] Define interfaceIfMtu: ex: 1500
                  interfaceName            [common] Define interfaceName
                  interfaceSvlanPriority   [common] Define interfaceSvlanPriority; ex: 7
                  port                     [common] Define LAG port name; ex: <LAG_NAME-001>
                  vlan                     [common] Define vlan
          }                        Build request body

  - Varies based on the resourceType value:


  ### 5142 Example:
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag create-interfacemanagement resourceType 5142 value {
  Possible completions:
    interfaceIfMtu           [common] Define interfaceIfMtu: ex: 1500
    interfaceIpForwarding    [5142] Define interfaceIpForwarding: on|off
    interfaceName            [common] Define interfaceName
    interfaceSvlanPriority   [common] Define interfaceSvlanPriority; ex: 7
    ip                       [5142] Define interface Ip Addr: ex: 1.2.3.4
    port                     [common] Define LAG port name; ex: <LAG_NAME-001>
    subnetMaskLength         [5142|516x?] Define subnetMaskLength: ex: 30
    vlan                     [common] Define vlan
  ```

  ### 5171 Example:
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag create-interfacemanagement resourceType 5171 value {
  Possible completions:
    interfaceIfMtu           [common] Define interfaceIfMtu: ex: 1500
    interfaceIpAddr          [5171|6500] Define interface Ip Addr: ex: 1.2.3.4
    interfaceName            [common] Define interfaceName
    interfaceSvlanPriority   [common] Define interfaceSvlanPriority; ex: 7
    port                     [common] Define LAG port name; ex: <LAG_NAME-001>
    subnetmask               [6500|5171] Define subnetmask: ex: 30
    vlan                     [common] Define vlan
  ```

  ### 6500 Example:
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag create-interfacemanagement resourceType 6500 value {
  Possible completions:
    group                    [6500] Enter group|eqptGrp value
    interfaceIfMtu           [common] Define interfaceIfMtu: ex: 1500
    interfaceIpAddr          [5171|6500] Define interface Ip Addr: ex: 1.2.3.4
    interfaceName            [common] Define interfaceName
    interfaceSvlanPriority   [common] Define interfaceSvlanPriority; ex: 7
    port                     [common] Define LAG port name; ex: <LAG_NAME-001>
    shelf                    [6500] Enter shelf value
    subnetmask               [6500|5171] Define subnetmask: ex: 30
    vlan                     [common] Define vlan
    vsName                   [6500] Define virtualSwitch Name
  ```


  ---
  ## 49.2 tsm manage-lag create-lag-entry                
  - Command to Create LAG entry
  ---
      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag create-lag-entry
      Possible completions:
          deviceType        NetworkConstruct.data.attributes.deviceType
          eqptGrp           NetworkConstruct.data.attributes.l2Data[0].eqptGrp
          ncid              NetworkConstruct.id
          neName            NetworkConstruct.data.attributes.name
          resourceType      NetworkConstruct.data.attributes: ex.
          sessionid         NetworkConstruct.data.attributes.managementSession.data.id
          shelf             NetworkConstruct.data.attributes.l2Data[0].shelf
          softwareVersion   NetworkConstruct.data.attributes.softwareVersion
          typegroup         NetworkConstruct.data.attributes.typeGroup
          value             Build request body {
              Possible completions:
                  aggMinLinkAggregation   Define aggMinLinkAggregation: on|off ; default off
                  aggMinLinkThreshold     Define aggMinLinkThreshold; default 1
                  aggMode                 Define aggMode(LACP|Manual); default LACP
                  aggName                 Define LAG name
                  aggProtectionMode       Define aggProtectionMode; default <proprietary>
                  aggRevertDelay          Define aggRevertDelay; default 0
                  aggRevertProtection     Define aggRevertProtection: on|off; default off
                  aggSystemPriority       Define aggSystemPriority; default 0
                  maxFrameSize            Define maxFrameSize; default 1200
                  primaryPorts            Define primary ports to update
                  protectionPorts         Define protection ports to update
          }                       Build request body

  ---
  ## 49.3 tsm manage-lag delete-lag-entry                
  - Command to Delete LAG entry
  ---
      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag delete-lag-entry
      Possible completions:
          deviceType        NetworkConstruct.data.attributes.deviceType
          eqptGrp           NetworkConstruct.data.attributes.l2Data[0].eqptGrp
          lagName           Lag Name to DELETE
          ncid              NetworkConstruct.id
          neName            NetworkConstruct.data.attributes.name
          resourceType      NetworkConstruct.data.attributes: ex.
          sessionid         NetworkConstruct.data.attributes.managementSession.data.id
          shelf             NetworkConstruct.data.attributes.l2Data[0].shelf
          softwareVersion   NetworkConstruct.data.attributes.softwareVersion
          typegroup         NetworkConstruct.data.attributes.typeGroup
  ---
  ## 49.4 tsm manage-lag get-interfacemanagement-values                
  - Command to get interface management values
  ---
      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag get-interfacemanagement-values
      Possible completions:
          deviceType        NetworkConstruct.data.attributes.deviceType
          ncid              NetworkConstruct.id
          neName            NetworkConstruct.data.attributes.name
          resourceType      NetworkConstruct.data.attributes: ex.
          sessionid         NetworkConstruct.data.attributes.managementSession.data.id
          softwareVersion   NetworkConstruct.data.attributes.softwareVersion
          typegroup         NetworkConstruct.data.attributes.typeGroup
          <cr>    
  ---
  ## 49.5 tsm manage-lag get-lag-values
  - CommCommand to get LAG values
  ---
      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag get-lag-values
      Possible completions:
          deviceType        NetworkConstruct.data.attributes.deviceType
          ncid              NetworkConstruct.id
          neName            NetworkConstruct.data.attributes.name
          resourceType      NetworkConstruct.data.attributes: ex.
          sessionid         NetworkConstruct.data.attributes.managementSession.data.id
          softwareVersion   NetworkConstruct.data.attributes.softwareVersion
          typegroup         NetworkConstruct.data.attributes.typeGroup
          <cr>
  ---
  ## 49.6. tsm manage-lag resync-components 
  - Command to resynchronize all components of a NcManagementSessionId
  ---
      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag resync-components 
      Possible completions:
          managementSessionId   Enter NcManagementSessionId
  ---
  ## 49.7 tsm manage-lag update-lag-entry
  - Command to Update LAG entry
  ---
      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag update-lag-entry
      Possible completions:
          deviceType        NetworkConstruct.data.attributes.deviceType
          eqptGrp           NetworkConstruct.data.attributes.l2Data[0].eqptGrp
          lagName           Lag Name to UPDATE
          ncid              NetworkConstruct.id
          neName            NetworkConstruct.data.attributes.name
          operation         Select operation to perform; default <addports>
          resourceType      NetworkConstruct.data.attributes: ex.
          sessionid         NetworkConstruct.data.attributes.managementSession.data.id
          shelf             NetworkConstruct.data.attributes.l2Data[0].shelf
          softwareVersion   NetworkConstruct.data.attributes.softwareVersion
          typegroup         NetworkConstruct.data.attributes.typeGroup
          value             Build request body; Specify port values {
              Possible completions:
                  primaryPorts      Define primary ports to update
                  protectionPorts   Define protection ports to update
          }                 

  ---
  ## 49.8 tsm manage-lag show-all-ne-lags
  - Command to get all LAGs associated with any or the network element specified
  ---
      admin@ncs(config-device-dummy-1)# live-status exec tsm manage-lag show-all-ne-lags ?
      Possible completions:
          networkElement   Network Element name to show LAGs for
          <cr>

  - networkElement is optional. 


  ---
  ## 49.9 tsm manage-lag delete-interfacemanagement
  - Command to Delete LAG InterfaceManagement entry
  ---
      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag delete-interfacemanagement ?
      Possible completions:
      deviceType        NetworkConstruct.data.attributes.deviceType
      ncid              NetworkConstruct.id
      neName            NetworkConstruct.data.attributes.name
      resourceType      NetworkConstruct.data.attributes: ex.
      sessionid         NetworkConstruct.data.attributes.managementSession.data.id
      softwareVersion   NetworkConstruct.data.attributes.softwareVersion
      typegroup         NetworkConstruct.data.attributes.typeGroup
      value             Enter Interface name to delete



  ---
  ## 49.10 tsm manage-lag execute-any-request
  - Generic command; execute any API callback, mentioning details
  ---

      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag execute-any-request
      Possible completions:
          baseURL     Base URL: ex /api/v1/path
          httpQuery   Http Query params: ex param1=value&param2=value
          operation   Select operation to perform; default <GET>

      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag execute-any-request operation
      Possible completions:
          DELETE   Request DELETE
          GET      Request GET
          POST     Request POST


  ---
  ## 49.11 tsm manage-lag manage-virtualswitch-entry
  - Command to get or delete ethernetConnectivity VirtualSwitch values
  ---

      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag manage-virtualswitch-entry
      Possible completions:
          operation           Select operation to perform; default: get
          query               Build http Query params
          virtualSwitchName   Enter specific VirtualSwitch Name to get or delete; if none specified, all VS are shown for get
          <cr>

      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag manage-virtualswitch-entry operation
      Possible completions:
          delete   DELETE specified VirtualSwitch entry
          get      GET all or specified VirtualSwitch entry/es

      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag manage-virtualswitch-entry query {
      Possible completions:
          deviceType        NetworkConstruct.data.attributes.deviceType
          ncid              NetworkConstruct.id
          neName            NetworkConstruct.data.attributes.name
          resourceType      NetworkConstruct.data.attributes: 5142|5170|6500
          sessionid         NetworkConstruct.data.attributes.managementSession.data.id
          softwareVersion   NetworkConstruct.data.attributes.softwareVersion
          typegroup         NetworkConstruct.data.attributes.typeGroup
          }                 Build http Query params


  ---
  ## 49.12 tsm manage-lag update-interfacemanagement
  - Command to Update LAG InterfaceManagement entry
  ---

      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag update-interfacemanagement
      Possible completions:
          deviceType        NetworkConstruct.data.attributes.deviceType
          ncid              NetworkConstruct.id
          neName            NetworkConstruct.data.attributes.name
          resourceType      NetworkConstruct.data.attributes: 5142|5170|6500
          sessionid         NetworkConstruct.data.attributes.managementSession.data.id
          softwareVersion   NetworkConstruct.data.attributes.softwareVersion
          typegroup         NetworkConstruct.data.attributes.typeGroup
          value             Build request body
          <cr>

  - Depending on the resource type, there will be multiple parameter variations: 
  ### Example : resourceType == 5142: 
  ```
      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag update-interfacemanagement resourceType 5142 value {
      Possible completions:
          interfaceIfMtu           [common] Define interfaceIfMtu: ex: 1500
          interfaceIpForwarding    [5142] Define interfaceIpForwarding: on|off
          interfaceName            [common] Define interfaceName
          interfaceState           [common][UPDATE] specify state to UPDATE to: disabled|enabled
          interfaceSvlanPriority   [common] Define interfaceSvlanPriority; ex: 7
          ip                       [5142] Define interface Ip Addr: ex: 1.2.3.4
          port                     [common] Define LAG port name; ex: <LAG_NAME-001>
          subnetMaskLength         [5142] Define subnetMaskLength: ex: 30
          vlan                     [common] Define vlan
  ```
  ### Example : resourceType == 5171: 
  ```
      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag update-interfacemanagement resourceType 5171 value {
      Possible completions:
          interfaceIfMtu           [common] Define interfaceIfMtu: ex: 1500
          interfaceIpAddr          [5171|6500] Define interface Ip Addr: ex: 1.2.3.4
          interfaceName            [common] Define interfaceName
          interfaceState           [common][UPDATE] specify state to UPDATE to: disabled|enabled
          interfaceSvlanPriority   [common] Define interfaceSvlanPriority; ex: 7
          port                     [common] Define LAG port name; ex: <LAG_NAME-001>
          subnetmask               [6500|5171] Define subnetmask: ex: 30
          vlan                     [common] Define vlan
  ```

  ### Example : resourceType == 6500: 
  ```
      admin@ncs(config-device-netsim-0)# live-status exec tsm manage-lag update-interfacemanagement resourceType 6500 value {
      Possible completions:
          group                    [6500] Enter group|eqptGrp value
          interfaceIfMtu           [common] Define interfaceIfMtu: ex: 1500
          interfaceIpAddr          [5171|6500] Define interface Ip Addr: ex: 1.2.3.4
          interfaceName            [common] Define interfaceName
          interfaceState           [common][UPDATE] specify state to UPDATE to: disabled|enabled
          interfaceSvlanPriority   [common] Define interfaceSvlanPriority; ex: 7
          port                     [common] Define LAG port name; ex: <LAG_NAME-001>
          shelf                    [6500] Enter shelf value
          subnetmask               [6500|5171] Define subnetmask: ex: 30
          vlan                     [common] Define vlan
          vsName                   [6500] Define virtualSwitch Name
  ```

  ---
  ## 50. search-all-networkConstructs
  - Command to get all or filtered networkConstructs
  ---
      admin@ncs(config-device-dummy-1)# live-status exec tsm search-all-networkConstructs
      Possible completions:
        include                [Optional] include details; default : expectations,tpes,networkConstructs,utilization
        limit                  [Optional] Enter limit; default : 200
        networkConstructType   [Optional] Enter networkConstructType; default: networkElement
        searchFields           [Optional] Enter search fields to search into; comma separated; default: data.attributes.displayData.displayName
        searchText             Enter full or partial networkElement name to search for; ex 6500
        sortBy                 [Optional] Enter sortBy filter; default: data.attributes.displayData.displayName



  ---
  ## 51. search-tunnel-endpoints
  - Command to get Optical Details - serviceTopology for optical FRE Id
  ---
      admin@ncs(config-device-dummy-1)# live-status exec tsm search-tunnel-endpoints
      Possible completions:
        include           [Optional] include details; default : expectations,tpes,networkConstructs,utilization
        limit             [Optional] Enter limit; default : 200
        resilienceLevel   [Optional] Enter resilienceLevel; default : protected
        searchFields      [Optional] Enter search fields to search into; comma separated; ex: data.attributes.userLabel
        searchText        Enter full MPLS tunnel name to search for
        serviceClass      [Optional] Enter serviceClass; default : LAG,LLDP,Ethernet,Tunnel



  ---
  ## 52. update-ethernet-port-state
  - Command to update Ethernet port state to disabled or enabled
  ---
  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm update-ethernet-port-state
  Possible completions:
    linkState   Choose state to update port to
    port        Enter actual port value; ex: 22 | 24/10
    query
  ```

  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm update-ethernet-port-state linkState
  Possible completions:
    Disabled  Enabled
  ```

  ```
  admin@ncs(config-device-netsim-0)# live-status exec tsm update-ethernet-port-state query {
  Possible completions:
    deviceType        NetworkConstruct.data.attributes.deviceType
    ncid              NetworkConstruct NE Id A END
    neName            NetworkConstruct.data.attributes.deviceType
    portType          Enter portType; ex: 10Gig
    resourceType      NetworkConstruct.data.attributes: ex.
    sessionid         NC Management Session Id
    softwareVersion   NC Software Version
    typegroup         NC Type Group
  ```


# 6. Built in live-status show
------------------------------

  NONE


# 7. Limitations
----------------

  ## BSM mode : Show Partial - partial-sync-from 

  -> NED V 1.8.9 onwards
  ----------------------------------------------
  * To synchronize only a single list entry or a single list under the BSM specific configuration one can now use show partial command

  ### BSM_SHOW_PARTIAL_1: Partial sync-from an entire list; i.e. config/services/l2Service list:
  --------------------------------------------------------------------------
  ```
  admin@ncs(config)# devices partial-sync-from path [ /devices/device[name='device-name']/config/ciena-mcp:services/l2Service ]
  sync-result {
    device ciena-lab1
    result true
  }
  ```

  ### BSM_SHOW_PARTIAL_2: Partial sync-from a given list entry; i.e. config/services/l2Service{l2Service-Name} list entry:
  -----------------------------------------
  ```
  admin@ncs(config)# devices partial-sync-from path [ /devices/device[name='device-name']/config/ciena-mcp:services/l2Service[label='l2Service-Name'] ]
  sync-result {
    device ciena-lab1
    result true
  }
  ```

  ### BSM_SHOW_PARTIAL_3: Partial sync-from on deeper levels; i.e. config/services/l2Service{l2Service-Name}/properties/... :
  -----------------------------------------
  * available from NED version 1.8.10 onwards

  ```
  admin@ncs(config)# devices partial-sync-from path [ /devices/device[name='device-name']/config/ciena-mcp:services/l2Service[label='l2Service-Name']/properties ]   
  ```
  OR
  ```
  admin@ncs(config)# devices partial-sync-from path [ /devices/device[name='device-name']/config/ciena-mcp:services/l2Service[label='l2Service-Name']/properties/serviceEndPointList[interfaceType='interfaceType']/vlanIds ]   
  ```
  etc.

  **NOTE:**

  Requests like the ones above, either generated by NSO or by the end-user, will automatically generate at NED level a search up the tree for the first node that can be fetched using a device REST API available. 

  Taking the above two examples, finest search level is on the top list entry, i.e. l2Service{l2Service-Name} level, so requesting anything beneath that level, will result in a search on the $l2Service-Name resource at the MSDO level.


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
     admin@ncs(config)# devices device dev-1 ned-settings ciena-mcp logging level debug
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

