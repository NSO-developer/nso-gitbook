# This README is strictly addressing only the 'VERSION_6_TSM' mode of the NED.

-----------
# Contents
-----------
 
* GENERAL CONSIDERATIONS
  * Config data models
  * Live status actions


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
    50. search-all-networkConstructs          Command to get all or filtered networkConstructs
    51. search-tunnel-endpoints               Command to get Optical Details - serviceTopology for optical FRE Id


---------------------------
### GENERAL CONSIDERATIONS
---------------------------

--------------------------------------------------------------
## !!! Warning: !!!
- Please make sure the mcp-service-model-api ned-setting is set to 'VERSION_6_TSM' :
- i.e.: `admin@ncs(config-device-ciena-lab1)# ned-settings ciena-mcp mcp-service-model-api VERSION_6_TSM`
--------------------------------------------------------------

-------------------------------
### Initial config / setup example
-------------------------------

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

---------------------
## Config data models
---------------------

- Addresses only the resources managed under the path:
  - devices device <DEVICENAME> / config / tsm / *
```  
    admin@ncs(config)# devices device <device-name> config tsm ?
    Possible completions:
    L1OTNSwitchingProtService   Resources of type: ifd.v6.resourceTypes.L1OTNSwitchingProtServiceIntentFacade
    L1OTNSwitchingService       Resources of type: ifd.v6.resourceTypes.L1OTNSwitchingServiceIntentFacade
    eLineServices               Resources of type: ifd.v6.resourceTypes.L2ServiceIntentFacade
    l1Services                  Resources of type: ifd.v6.resourceTypes.L1NCPClientServiceIntentFacade
    mplsTunnels                 Resources of type: ifd.v6.resourceTypes.MplsTunnelIntentFacade
    tdmCircuits                 Resources of type: ifd.v6.resourceTypes.TDMServiceIntentFacade
    <cr>
```
- In this build version you should be able, on top of using the live-status actions for various provisioning tasks,
to sync, create and delete MPLS Tunnels, E-LINE and EPL/EVPL Services, L1 Services, TDM Circuits

- After configuring the NED instance as above presented, run a sync-from and check:
  - ../config/tsm/mplsTunnels
  - ../config/tsm/eLineServices
  - ../config/tsm/l1Services
  - ../config/tsm/tdmCircuits
  - ../config/tsm/L1OTNSwitchingProtService
  - ../config/tsm/L1OTNSwitchingService


- For the above, the transactions supported widely are SYNC, CREATE, DELETE.
- For some of the resources, partial EDIT/UPDATE is also possible, but generally it is very limited in this config mode.


### NED config tsm mplsTunnels model:
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

### NED config tsm eLineServices model:
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

### NED config tsm l1Services model:

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

### NED config tsm tdmCircuits model:
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


### NED config tsm L1OTNSwitchingProtService model:
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

### NED config tsm L1OTNSwitchingService model:
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




---------------------
# Live status actions  
---------------------

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
      search-tunnel-endpoints               Command to get Optical Details - serviceTopology for optical FRE Id
      sync-network-elements                 Command to get resync Network Elements
      test-benchmarkOperations              Command to run a benchmark test using reflectorTpe
      test-lspOperations                    Command to run a E-Tree service test from root-to-leaf or leaf-to-root
      test-pseudowire                       Command to test EPL service
      test-tdmOperations                    Command to Run test enabling/disabling tdmLoopback
      upload-script                         Command to upload custom script
      upload-script-profile                 Command to upload scriptProfiles
      wavelength                            COLLECTION: Wavelength commands



- Each action has its own inputs and outputs. See stats yang model in the NED for more details.
- Based on the input combinations we will call one api or another.



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
    admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-tpes tpeId 8086be7a-b781-3cc6-b19c-020e2cf37511::TPE_VALUE___NAME__headEnd useTpeIdOnly


*** GET TPEs : ***
----------------------------------------------------------
    admin@ncs(config-device-ciena-bharti-lab1)# live-status exec tsm get-tpes tpeId 8086be7a-b781-3cc6-b19c-020e2cf37511::TPE_VALUE___NAME__headEnd


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
```
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
```
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
                                                "id": "8bdb1e66-6486-37f3-8038-12345678901::TPE_NAME__VCE_NAME_
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
                            "id": "8bdb1e66-6486-37f3-8038-12345678901::TPE_FTP_MPLS-PROTECTION_NAME__"
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
                            "id": "12df49ed-c140-3c5b-8146-2826a3e89c0c::TPE_NAME__VCE_NAME_
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

```
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

```
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
    - 12345678-1234-1234-1234-123456789012::TPE_1_CTPServerToClient_EQPTGRP_9_PW__NAME__PW_3

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
                pseudowireName _NAME__PW_3
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
                pseudowireName _NAME__PW_3
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

```
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



  
