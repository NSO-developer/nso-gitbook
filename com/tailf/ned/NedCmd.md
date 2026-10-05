# NedCmd <a href="#nedcmd-52f884d2629b" id="nedcmd-52f884d2629b"></a>

```java
public class com.tailf.ned.NedCmd
    implements ch.ethz.ssh2.ServerHostKeyVerifier
```

A NedCmd represents the command send from the NCS with all
 parameters. A NedCmd is passed from the NedMux to a NedWorker
 to finally arrive at a NetConnection for processing.

## Members

**Constructors**:

- [NedCmd\(ConfETuple\)](#nedcmd-4a85ef572624)

**Fields**:

- [ABORT\_CLI](#abort_cli-97e12a8fe5e4)
- [ABORT\_GENERIC](#abort_generic-80b6fd7dfc5b)
- [CLOSE](#close-6f1f91e04693)
- [CLOSE\_ALL](#close_all-6a86a62147ba)
- [CMD](#cmd-2775633b1e65)
- [COMMIT](#commit-f1fa3408c3f3)
- [CONFIG\_MERGE](#config_merge-61e013f4151e)
- [CONFIG\_REPLACE](#config_replace-0cf909e2b6a4)
- [CONNECT\_CLI](#connect_cli-b8479e87ce13)
- [CONNECT\_GENERIC](#connect_generic-54717854d0e1)
- [CREATE\_SUBSCRIPTION](#create_subscription-c41b9590a0c6)
- [CREATE\_TELEMETRY\_SUBSCRIPTION](#create_telemetry_subscription-ebd10f3bdd9d)
- [FILTER\_NONE](#filter_none-fc3978fe5c04)
- [FILTER\_SUBTREE](#filter_subtree-4700db548c3a)
- [FILTER\_XPATH](#filter_xpath-54c1ee093024)
- [GET\_TRANS\_ID](#get_trans_id-dc096fb7139c)
- [INITIALIZE](#initialize-6ba30c51ac25)
- [IS\_ALIVE](#is_alive-fde44104d4b5)
- [KEEP\_ALIVE](#keep_alive-d3db88d81fc9)
- [KNOWN\_ALGOS](#known_algos-f36151104250)
- [NEW\_THREAD](#new_thread-f592910983cd)
- [NO\_WORKER](#no_worker-6833f88412a9)
- [NOCONNECT\_CLI](#noconnect_cli-187ef881f42d)
- [NOCONNECT\_GENERIC](#noconnect_generic-664dbca7eecf)
- [NONE](#none-b16a655cff45)
- [PERSIST](#persist-3052225c12e0)
- [PREPARE\_CLI](#prepare_cli-ba15b6011a5c)
- [PREPARE\_DRY\_CLI](#prepare_dry_cli-c0bdb5d483ac)
- [PREPARE\_DRY\_GENERIC](#prepare_dry_generic-c0d7bb2c4359)
- [PREPARE\_GENERIC](#prepare_generic-256e2bd92c77)
- [RECONNECT](#reconnect-487e3c78167a)
- [REJECT\_MISMATCH](#reject_mismatch-098d035bcd17)
- [REJECT\_UNKNOWN](#reject_unknown-eadb7e5bf40b)
- [RESTART](#restart-c33cb4341797)
- [REVERT\_CLI](#revert_cli-e6b347730b30)
- [REVERT\_GENERIC](#revert_generic-3faece9971be)
- [SHOW\_CLI](#show_cli-9b06ed64ec5b)
- [SHOW\_GENERIC](#show_generic-a9102a45f2bd)
- [SHOW\_OFFLINE\_CLI](#show_offline_cli-01acd37573da)
- [SHOW\_OFFLINE\_GENERIC](#show_offline_generic-40b188ba65c0)
- [SHOW\_PARTIAL\_CLI](#show_partial_cli-75cb073d9211)
- [SHOW\_PARTIAL\_GENERIC](#show_partial_generic-41b73f7a09f0)
- [SHOW\_STATS\_FILTER](#show_stats_filter-b9abc0f7f3c9)
- [SHOW\_STATS\_PATH](#show_stats_path-fdaecdbd814f)
- [STOP\_THREAD](#stop_thread-91d1564acc47)
- [SUBTREE](#subtree-75598fbc95e1)
- [UNINITIALIZE](#uninitialize-c62033927360)
- [XPATH](#xpath-85590d29a589)

**Methods**:

- [cmdString\(\)](#cmdstring-14890451befe)
- [cmdToDevicePhase\(int\)](#cmdtodevicephase-315de652ea11)
- [cmdToString\(int\)](#cmdtostring-f5ed8a204e6f)
- [getActionName\(\)](#getactionname-c421fe4033d7)
- [getAdditionalInfo\(\)](#getadditionalinfo-e1cb561024ba)
- [getAuthOrder\(\)](#getauthorder-2d552ed01a0e)
- [getCliConfigChars\(\)](#getcliconfigchars-2a8ea15c9753)
- [getCmdPaths\(\)](#getcmdpaths-37171ce7c8eb)
- [getCommand\(\)](#getcommand-f6f76ff7d38b)
- [getComment\(\)](#getcomment-a5625f95afef)
- [getConnectionId\(\)](#getconnectionid-600ebb3e7d7f)
- [getConnectTimeout\(\)](#getconnecttimeout-cfec33294648)
- [getDevice\(\)](#getdevice-4acac4557fc6)
- [getDevList\(\)](#getdevlist-1a6070a968b7)
- [getFilter\(\)](#getfilter-2b84817e0707)
- [getFilterIntent\(\)](#getfilterintent-2bc571cd2560)
- [getFilterType\(\)](#getfiltertype-de1618989694)
- [getFilterTypeAsString\(\)](#getfiltertypeasstring-1352f2ea19d5)
- [getFromTransactionId\(\)](#getfromtransactionid-c49683f287a8)
- [getGenericConfigChars\(\)](#getgenericconfigchars-d9c9c3f287f2)
- [getHostKeyAlgos\(\)](#gethostkeyalgos-580f9f4a42c3)
- [getHostKeys\(\)](#gethostkeys-afeb8a087227)
- [getHostKeyVerifAsString\(\)](#gethostkeyverifasstring-888e4c14e9d7)
- [getHostKeyVerifier\(\)](#gethostkeyverifier-5231b47d5444)
- [getHostKeyVerify\(\)](#gethostkeyverify-faec6b615eba)
- [getId\(\)](#getid-199a349c70ef)
- [getIdentities\(NedWorker\)](#getidentities-65d4c5a4a59e)
- [getIP\(\)](#getip-c2f1d3db411f)
- [getKeyDir\(\)](#getkeydir-07c13308c833)
- [getLabel\(\)](#getlabel-72bf899bf6f1)
- [getLoadOp\(\)](#getloadop-ab5127869701)
- [getLocalUser\(\)](#getlocaluser-6ac239a3b919)
- [getMfaExecutable\(\)](#getmfaexecutable-c68a3fe5954e)
- [getMfaOpaque\(\)](#getmfaopaque-1ba5d0f480c6)
- [getOperations\(\)](#getoperations-bb0a308eca4c)
- [getParams\(\)](#getparams-4abd21251a20)
- [getPassword\(\)](#getpassword-003001cc6c91)
- [getPath\(\)](#getpath-88fb21895561)
- [getPathIntent\(\)](#getpathintent-e49c0ca975d0)
- [getPaths\(\)](#getpaths-ce548cbbccae)
- [getPort\(\)](#getport-a2225f868a2b)
- [getProtocol\(\)](#getprotocol-7199008875a5)
- [getProvisionalTransId\(\)](#getprovisionaltransid-746567171fc9)
- [getPublicKeys\(\)](#getpublickeys-319aca5ff00c)
- [getReadTimeout\(\)](#getreadtimeout-640fc089c1de)
- [getRemoteUser\(\)](#getremoteuser-bdfb4a23b5ff)
- [getSecondaryPassword\(\)](#getsecondarypassword-34fb12bcee21)
- [getServerKeyMismatch\(\)](#getserverkeymismatch-397bbe151bff)
- [getSourceAddress\(\)](#getsourceaddress-873953ea3b38)
- [getSSHAlgorithms\(\)](#getsshalgorithms-9546086e7915)
- [getStartTime\(\)](#getstarttime-f237c63a0230)
- [getStream\(\)](#getstream-f9fafde50565)
- [getTelemetrySettings\(\)](#gettelemetrysettings-fbb071630f56)
- [getTimeout\(\)](#gettimeout-c6606d7f7c00)
- [getTopTag\(\)](#gettoptag-4bbcffa59820)
- [getToTransactionId\(\)](#gettotransactionid-3beba3c28e0e)
- [getTransaction\(\)](#gettransaction-4f1c72a828a1)
- [getUsid\(\)](#getusid-62d0ecfd68fd)
- [getWorkerId\(\)](#getworkerid-80f0b625907c)
- [getWriteTimeout\(\)](#getwritetimeout-866d6552aa46)
- [getXPathIntent\(\)](#getxpathintent-67290eec645d)
- [isAll\(\)](#isall-9d62c2f960b8)
- [isForce\(\)](#isforce-f9ef7f4abb1e)
- [isSuppressTransId\(\)](#issuppresstransid-ea2b7aa87e80)
- [isTrace\(\)](#istrace-98fd54ca3d6c)
- [isVerbose\(\)](#isverbose-224af8693204)
- [parseOps\(ConfEList\)](#parseops-4ab9ce41ccc1)
- [setAdditionalInfo\(String\)](#setadditionalinfo-b262ce567572)
- [setProvisionalTransId\(String\)](#setprovisionaltransid-e17c71c7b76d)
- [toString\(\)](#tostring-e9d48c5503ef)
- [verifyServerHostKey\(String, int, String, byte\[\]\)](#verifyserverhostkey-df5f7c8ae1fe)

**Nested Types**:

- [NedPublicKey](NedCmd/NedPublicKey.md#nedpublickey-99f8875cf44d)
- [NedSSHAlgorithms](NedCmd/NedSSHAlgorithms.md#nedsshalgorithms-7bd74eef0d12)

## Constructors

### NedCmd(ConfETuple) <a href="#nedcmd-4a85ef572624" id="nedcmd-4a85ef572624"></a>

```java
public NedCmd(com.tailf.proto.ConfETuple t) throws com.tailf.ned.NedException
```

Types: [ConfETuple](../proto/ConfETuple.md#confetuple-b1f9702a82a1), [NedException](NedException.md#nedexception-9d3a19f3640e)

**Parameters**

- `com.tailf.proto.ConfETuple t`


## Fields

### ABORT_CLI <a href="#abort_cli-97e12a8fe5e4" id="abort_cli-97e12a8fe5e4"></a>

```java
public static final int ABORT_CLI = 7;
```

### ABORT_GENERIC <a href="#abort_generic-80b6fd7dfc5b" id="abort_generic-80b6fd7dfc5b"></a>

```java
public static final int ABORT_GENERIC = 8;
```

### CLOSE <a href="#close-6f1f91e04693" id="close-6f1f91e04693"></a>

```java
public static final int CLOSE = 14;
```

### CLOSE_ALL <a href="#close_all-6a86a62147ba" id="close_all-6a86a62147ba"></a>

```java
public static final int CLOSE_ALL = 15;
```

### CMD <a href="#cmd-2775633b1e65" id="cmd-2775633b1e65"></a>

```java
public static final int CMD = 17;
```

### COMMIT <a href="#commit-f1fa3408c3f3" id="commit-f1fa3408c3f3"></a>

```java
public static final int COMMIT = 6;
```

### CONFIG_MERGE <a href="#config_merge-61e013f4151e" id="config_merge-61e013f4151e"></a>

```java
public static final int CONFIG_MERGE = 1;
```

### CONFIG_REPLACE <a href="#config_replace-0cf909e2b6a4" id="config_replace-0cf909e2b6a4"></a>

```java
public static final int CONFIG_REPLACE = 0;
```

### CONNECT_CLI <a href="#connect_cli-b8479e87ce13" id="connect_cli-b8479e87ce13"></a>

```java
public static final int CONNECT_CLI = 0;
```

### CONNECT_GENERIC <a href="#connect_generic-54717854d0e1" id="connect_generic-54717854d0e1"></a>

```java
public static final int CONNECT_GENERIC = 1;
```

### CREATE_SUBSCRIPTION <a href="#create_subscription-c41b9590a0c6" id="create_subscription-c41b9590a0c6"></a>

```java
public static final int CREATE_SUBSCRIPTION = 34;
```

### CREATE_TELEMETRY_SUBSCRIPTION <a href="#create_telemetry_subscription-ebd10f3bdd9d" id="create_telemetry_subscription-ebd10f3bdd9d"></a>

```java
public static final int CREATE_TELEMETRY_SUBSCRIPTION = 37;
```

### FILTER_NONE <a href="#filter_none-fc3978fe5c04" id="filter_none-fc3978fe5c04"></a>

```java
public static final int FILTER_NONE = 0;
```

### FILTER_SUBTREE <a href="#filter_subtree-4700db548c3a" id="filter_subtree-4700db548c3a"></a>

```java
public static final int FILTER_SUBTREE = 2;
```

### FILTER_XPATH <a href="#filter_xpath-54c1ee093024" id="filter_xpath-54c1ee093024"></a>

```java
public static final int FILTER_XPATH = 1;
```

### GET_TRANS_ID <a href="#get_trans_id-dc096fb7139c" id="get_trans_id-dc096fb7139c"></a>

```java
public static final int GET_TRANS_ID = 20;
```

### INITIALIZE <a href="#initialize-6ba30c51ac25" id="initialize-6ba30c51ac25"></a>

```java
public static final int INITIALIZE = 24;
```

### IS_ALIVE <a href="#is_alive-fde44104d4b5" id="is_alive-fde44104d4b5"></a>

```java
public static final int IS_ALIVE = 22;
```

### KEEP_ALIVE <a href="#keep_alive-d3db88d81fc9" id="keep_alive-d3db88d81fc9"></a>

```java
public static final int KEEP_ALIVE = 30;
```

### KNOWN_ALGOS <a href="#known_algos-f36151104250" id="known_algos-f36151104250"></a>

```java
public static final String[] KNOWN_ALGOS = null;
```

### NEW_THREAD <a href="#new_thread-f592910983cd" id="new_thread-f592910983cd"></a>

```java
public static final int NEW_THREAD = 16;
```

### NO_WORKER <a href="#no_worker-6833f88412a9" id="no_worker-6833f88412a9"></a>

```java
public static final int NO_WORKER = -1;
```

### NOCONNECT_CLI <a href="#noconnect_cli-187ef881f42d" id="noconnect_cli-187ef881f42d"></a>

```java
public static final int NOCONNECT_CLI = 28;
```

### NOCONNECT_GENERIC <a href="#noconnect_generic-664dbca7eecf" id="noconnect_generic-664dbca7eecf"></a>

```java
public static final int NOCONNECT_GENERIC = 29;
```

### NONE <a href="#none-b16a655cff45" id="none-b16a655cff45"></a>

```java
public static final int NONE = 2;
```

### PERSIST <a href="#persist-3052225c12e0" id="persist-3052225c12e0"></a>

```java
public static final int PERSIST = 11;
```

### PREPARE_CLI <a href="#prepare_cli-ba15b6011a5c" id="prepare_cli-ba15b6011a5c"></a>

```java
public static final int PREPARE_CLI = 2;
```

### PREPARE_DRY_CLI <a href="#prepare_dry_cli-c0bdb5d483ac" id="prepare_dry_cli-c0bdb5d483ac"></a>

```java
public static final int PREPARE_DRY_CLI = 3;
```

### PREPARE_DRY_GENERIC <a href="#prepare_dry_generic-c0d7bb2c4359" id="prepare_dry_generic-c0d7bb2c4359"></a>

```java
public static final int PREPARE_DRY_GENERIC = 5;
```

### PREPARE_GENERIC <a href="#prepare_generic-256e2bd92c77" id="prepare_generic-256e2bd92c77"></a>

```java
public static final int PREPARE_GENERIC = 4;
```

### RECONNECT <a href="#reconnect-487e3c78167a" id="reconnect-487e3c78167a"></a>

```java
public static final int RECONNECT = 23;
```

### REJECT_MISMATCH <a href="#reject_mismatch-098d035bcd17" id="reject_mismatch-098d035bcd17"></a>

```java
public static final int REJECT_MISMATCH = 1;
```

### REJECT_UNKNOWN <a href="#reject_unknown-eadb7e5bf40b" id="reject_unknown-eadb7e5bf40b"></a>

```java
public static final int REJECT_UNKNOWN = 0;
```

### RESTART <a href="#restart-c33cb4341797" id="restart-c33cb4341797"></a>

```java
public static final int RESTART = 21;
```

### REVERT_CLI <a href="#revert_cli-e6b347730b30" id="revert_cli-e6b347730b30"></a>

```java
public static final int REVERT_CLI = 9;
```

### REVERT_GENERIC <a href="#revert_generic-3faece9971be" id="revert_generic-3faece9971be"></a>

```java
public static final int REVERT_GENERIC = 10;
```

### SHOW_CLI <a href="#show_cli-9b06ed64ec5b" id="show_cli-9b06ed64ec5b"></a>

```java
public static final int SHOW_CLI = 12;
```

### SHOW_GENERIC <a href="#show_generic-a9102a45f2bd" id="show_generic-a9102a45f2bd"></a>

```java
public static final int SHOW_GENERIC = 13;
```

### SHOW_OFFLINE_CLI <a href="#show_offline_cli-01acd37573da" id="show_offline_cli-01acd37573da"></a>

```java
public static final int SHOW_OFFLINE_CLI = 32;
```

### SHOW_OFFLINE_GENERIC <a href="#show_offline_generic-40b188ba65c0" id="show_offline_generic-40b188ba65c0"></a>

```java
public static final int SHOW_OFFLINE_GENERIC = 33;
```

### SHOW_PARTIAL_CLI <a href="#show_partial_cli-75cb073d9211" id="show_partial_cli-75cb073d9211"></a>

```java
public static final int SHOW_PARTIAL_CLI = 26;
```

### SHOW_PARTIAL_GENERIC <a href="#show_partial_generic-41b73f7a09f0" id="show_partial_generic-41b73f7a09f0"></a>

```java
public static final int SHOW_PARTIAL_GENERIC = 27;
```

### SHOW_STATS_FILTER <a href="#show_stats_filter-b9abc0f7f3c9" id="show_stats_filter-b9abc0f7f3c9"></a>

```java
public static final int SHOW_STATS_FILTER = 36;
```

### SHOW_STATS_PATH <a href="#show_stats_path-fdaecdbd814f" id="show_stats_path-fdaecdbd814f"></a>

```java
public static final int SHOW_STATS_PATH = 31;
```

### STOP_THREAD <a href="#stop_thread-91d1564acc47" id="stop_thread-91d1564acc47"></a>

```java
public static final int STOP_THREAD = 35;
```

### SUBTREE <a href="#subtree-75598fbc95e1" id="subtree-75598fbc95e1"></a>

```java
public static final String SUBTREE = "subtree";
```

### UNINITIALIZE <a href="#uninitialize-c62033927360" id="uninitialize-c62033927360"></a>

```java
public static final int UNINITIALIZE = 25;
```

### XPATH <a href="#xpath-85590d29a589" id="xpath-85590d29a589"></a>

```java
public static final String XPATH = "xpath";
```


## Methods

### cmdString() <a href="#cmdstring-14890451befe" id="cmdstring-14890451befe"></a>

```java
public String cmdString()
```

### cmdToDevicePhase(int) <a href="#cmdtodevicephase-315de652ea11" id="cmdtodevicephase-315de652ea11"></a>

```java
public static String cmdToDevicePhase(int cmd)
```

**Parameters**

- `int cmd`

### cmdToString(int) <a href="#cmdtostring-f5ed8a204e6f" id="cmdtostring-f5ed8a204e6f"></a>

```java
public static String cmdToString(int cmd)
```

**Parameters**

- `int cmd`

### getActionName() <a href="#getactionname-c421fe4033d7" id="getactionname-c421fe4033d7"></a>

```java
public String getActionName()
```

### getAdditionalInfo() <a href="#getadditionalinfo-e1cb561024ba" id="getadditionalinfo-e1cb561024ba"></a>

```java
public String getAdditionalInfo()
```

### getAuthOrder() <a href="#getauthorder-2d552ed01a0e" id="getauthorder-2d552ed01a0e"></a>

```java
public String[] getAuthOrder()
```

### getCliConfigChars() <a href="#getcliconfigchars-2a8ea15c9753" id="getcliconfigchars-2a8ea15c9753"></a>

```java
public String getCliConfigChars()
```

### getCmdPaths() <a href="#getcmdpaths-37171ce7c8eb" id="getcmdpaths-37171ce7c8eb"></a>

```java
public String[] getCmdPaths()
```

### getCommand() <a href="#getcommand-f6f76ff7d38b" id="getcommand-f6f76ff7d38b"></a>

```java
public int getCommand()
```

### getComment() <a href="#getcomment-a5625f95afef" id="getcomment-a5625f95afef"></a>

```java
public String getComment()
```

### getConnectionId() <a href="#getconnectionid-600ebb3e7d7f" id="getconnectionid-600ebb3e7d7f"></a>

```java
public int getConnectionId()
```

### getConnectTimeout() <a href="#getconnecttimeout-cfec33294648" id="getconnecttimeout-cfec33294648"></a>

```java
public int getConnectTimeout()
```

### getDevice() <a href="#getdevice-4acac4557fc6" id="getdevice-4acac4557fc6"></a>

```java
public String getDevice()
```

### getDevList() <a href="#getdevlist-1a6070a968b7" id="getdevlist-1a6070a968b7"></a>

```java
public java.util.Set<String> getDevList()
```

### getFilter() <a href="#getfilter-2b84817e0707" id="getfilter-2b84817e0707"></a>

```java
public String getFilter()
```

### getFilterIntent() <a href="#getfilterintent-2bc571cd2560" id="getfilterintent-2bc571cd2560"></a>

```java
public com.tailf.ned.NedShowFilter[] getFilterIntent()
```

Types: [NedShowFilter](NedShowFilter.md#nedshowfilter-b3caa9383bc4)

### getFilterType() <a href="#getfiltertype-de1618989694" id="getfiltertype-de1618989694"></a>

```java
public int getFilterType()
```

### getFilterTypeAsString() <a href="#getfiltertypeasstring-1352f2ea19d5" id="getfiltertypeasstring-1352f2ea19d5"></a>

```java
public String getFilterTypeAsString()
```

### getFromTransactionId() <a href="#getfromtransactionid-c49683f287a8" id="getfromtransactionid-c49683f287a8"></a>

```java
public int getFromTransactionId()
```

### getGenericConfigChars() <a href="#getgenericconfigchars-d9c9c3f287f2" id="getgenericconfigchars-d9c9c3f287f2"></a>

```java
public String getGenericConfigChars()
```

### getHostKeyAlgos() <a href="#gethostkeyalgos-580f9f4a42c3" id="gethostkeyalgos-580f9f4a42c3"></a>

```java
protected String[] getHostKeyAlgos()
```

### getHostKeys() <a href="#gethostkeys-afeb8a087227" id="gethostkeys-afeb8a087227"></a>

```java
public com.tailf.ned.NedCmd.NedPublicKey[] getHostKeys()
```

Types: [NedPublicKey](NedCmd/NedPublicKey.md#nedpublickey-99f8875cf44d)

### getHostKeyVerifAsString() <a href="#gethostkeyverifasstring-888e4c14e9d7" id="gethostkeyverifasstring-888e4c14e9d7"></a>

```java
public String getHostKeyVerifAsString()
```

### getHostKeyVerifier() <a href="#gethostkeyverifier-5231b47d5444" id="gethostkeyverifier-5231b47d5444"></a>

```java
protected ch.ethz.ssh2.ServerHostKeyVerifier getHostKeyVerifier()
```

### getHostKeyVerify() <a href="#gethostkeyverify-faec6b615eba" id="gethostkeyverify-faec6b615eba"></a>

```java
public int getHostKeyVerify()
```

### getId() <a href="#getid-199a349c70ef" id="getid-199a349c70ef"></a>

```java
public String getId()
```

### getIdentities(NedWorker) <a href="#getidentities-65d4c5a4a59e" id="getidentities-65d4c5a4a59e"></a>

```java
protected java.util.Collection<ch.ethz.ssh2.auth.AgentIdentity> getIdentities(
    com.tailf.ned.NedWorker worker
)
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### getIP() <a href="#getip-c2f1d3db411f" id="getip-c2f1d3db411f"></a>

```java
public java.net.InetAddress getIP()
```

### getKeyDir() <a href="#getkeydir-07c13308c833" id="getkeydir-07c13308c833"></a>

```java
public String getKeyDir()
```

### getLabel() <a href="#getlabel-72bf899bf6f1" id="getlabel-72bf899bf6f1"></a>

```java
public String getLabel()
```

### getLoadOp() <a href="#getloadop-ab5127869701" id="getloadop-ab5127869701"></a>

```java
public int getLoadOp()
```

### getLocalUser() <a href="#getlocaluser-6ac239a3b919" id="getlocaluser-6ac239a3b919"></a>

```java
public String getLocalUser()
```

### getMfaExecutable() <a href="#getmfaexecutable-c68a3fe5954e" id="getmfaexecutable-c68a3fe5954e"></a>

```java
public String getMfaExecutable()
```

### getMfaOpaque() <a href="#getmfaopaque-1ba5d0f480c6" id="getmfaopaque-1ba5d0f480c6"></a>

```java
public String getMfaOpaque()
```

### getOperations() <a href="#getoperations-bb0a308eca4c" id="getoperations-bb0a308eca4c"></a>

```java
public com.tailf.ned.NedEditOp[] getOperations()
```

Types: [NedEditOp](NedEditOp.md#nededitop-b7874a11393d)

### getParams() <a href="#getparams-4abd21251a20" id="getparams-4abd21251a20"></a>

```java
public com.tailf.conf.ConfXMLParam[] getParams()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

### getPassword() <a href="#getpassword-003001cc6c91" id="getpassword-003001cc6c91"></a>

```java
public String getPassword()
```

### getPath() <a href="#getpath-88fb21895561" id="getpath-88fb21895561"></a>

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

### getPathIntent() <a href="#getpathintent-e49c0ca975d0" id="getpathintent-e49c0ca975d0"></a>

```java
public com.tailf.conf.ConfPath[] getPathIntent()
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

### getPaths() <a href="#getpaths-ce548cbbccae" id="getpaths-ce548cbbccae"></a>

```java
public com.tailf.conf.ConfPath[] getPaths() throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

### getPort() <a href="#getport-a2225f868a2b" id="getport-a2225f868a2b"></a>

```java
public int getPort()
```

### getProtocol() <a href="#getprotocol-7199008875a5" id="getprotocol-7199008875a5"></a>

```java
public String getProtocol()
```

### getProvisionalTransId() <a href="#getprovisionaltransid-746567171fc9" id="getprovisionaltransid-746567171fc9"></a>

```java
public String getProvisionalTransId()
```

### getPublicKeys() <a href="#getpublickeys-319aca5ff00c" id="getpublickeys-319aca5ff00c"></a>

```java
public com.tailf.ned.NedCmd.NedPublicKey[] getPublicKeys()
```

Types: [NedPublicKey](NedCmd/NedPublicKey.md#nedpublickey-99f8875cf44d)

### getReadTimeout() <a href="#getreadtimeout-640fc089c1de" id="getreadtimeout-640fc089c1de"></a>

```java
public int getReadTimeout()
```

### getRemoteUser() <a href="#getremoteuser-bdfb4a23b5ff" id="getremoteuser-bdfb4a23b5ff"></a>

```java
public String getRemoteUser()
```

### getSecondaryPassword() <a href="#getsecondarypassword-34fb12bcee21" id="getsecondarypassword-34fb12bcee21"></a>

```java
public String getSecondaryPassword()
```

### getServerKeyMismatch() <a href="#getserverkeymismatch-397bbe151bff" id="getserverkeymismatch-397bbe151bff"></a>

```java
protected boolean getServerKeyMismatch()
```

### getSourceAddress() <a href="#getsourceaddress-873953ea3b38" id="getsourceaddress-873953ea3b38"></a>

```java
public java.net.InetSocketAddress getSourceAddress()
```

### getSSHAlgorithms() <a href="#getsshalgorithms-9546086e7915" id="getsshalgorithms-9546086e7915"></a>

```java
public com.tailf.ned.NedCmd.NedSSHAlgorithms getSSHAlgorithms()
```

Types: [NedSSHAlgorithms](NedCmd/NedSSHAlgorithms.md#nedsshalgorithms-7bd74eef0d12)

### getStartTime() <a href="#getstarttime-f237c63a0230" id="getstarttime-f237c63a0230"></a>

```java
public String getStartTime()
```

### getStream() <a href="#getstream-f9fafde50565" id="getstream-f9fafde50565"></a>

```java
public String getStream()
```

### getTelemetrySettings() <a href="#gettelemetrysettings-fbb071630f56" id="gettelemetrysettings-fbb071630f56"></a>

```java
public java.util.Map<String,java.util.List<String>> getTelemetrySettings()
```

### getTimeout() <a href="#gettimeout-c6606d7f7c00" id="gettimeout-c6606d7f7c00"></a>

```java
public int getTimeout()
```

### getTopTag() <a href="#gettoptag-4bbcffa59820" id="gettoptag-4bbcffa59820"></a>

```java
public String getTopTag()
```

### getToTransactionId() <a href="#gettotransactionid-3beba3c28e0e" id="gettotransactionid-3beba3c28e0e"></a>

```java
public int getToTransactionId()
```

### getTransaction() <a href="#gettransaction-4f1c72a828a1" id="gettransaction-4f1c72a828a1"></a>

```java
public int getTransaction()
```

### getUsid() <a href="#getusid-62d0ecfd68fd" id="getusid-62d0ecfd68fd"></a>

```java
public int getUsid()
```

### getWorkerId() <a href="#getworkerid-80f0b625907c" id="getworkerid-80f0b625907c"></a>

```java
public int getWorkerId()
```

### getWriteTimeout() <a href="#getwritetimeout-866d6552aa46" id="getwritetimeout-866d6552aa46"></a>

```java
public int getWriteTimeout()
```

### getXPathIntent() <a href="#getxpathintent-67290eec645d" id="getxpathintent-67290eec645d"></a>

```java
public String[] getXPathIntent()
```

### isAll() <a href="#isall-9d62c2f960b8" id="isall-9d62c2f960b8"></a>

```java
public boolean isAll()
```

### isForce() <a href="#isforce-f9ef7f4abb1e" id="isforce-f9ef7f4abb1e"></a>

```java
public boolean isForce()
```

### isSuppressTransId() <a href="#issuppresstransid-ea2b7aa87e80" id="issuppresstransid-ea2b7aa87e80"></a>

```java
public boolean isSuppressTransId()
```

### isTrace() <a href="#istrace-98fd54ca3d6c" id="istrace-98fd54ca3d6c"></a>

```java
public boolean isTrace()
```

### isVerbose() <a href="#isverbose-224af8693204" id="isverbose-224af8693204"></a>

```java
public boolean isVerbose()
```

### parseOps(ConfEList) <a href="#parseops-4ab9ce41ccc1" id="parseops-4ab9ce41ccc1"></a>

```java
public final com.tailf.ned.NedEditOp[] parseOps(com.tailf.proto.ConfEList l)
```

Types: [NedEditOp](NedEditOp.md#nededitop-b7874a11393d), [ConfEList](../proto/ConfEList.md#confelist-78fa4ba3b3a8)

**Parameters**

- `com.tailf.proto.ConfEList l`

### setAdditionalInfo(String) <a href="#setadditionalinfo-b262ce567572" id="setadditionalinfo-b262ce567572"></a>

```java
public void setAdditionalInfo(String info)
```

**Parameters**

- `String info`

### setProvisionalTransId(String) <a href="#setprovisionaltransid-e17c71c7b76d" id="setprovisionaltransid-e17c71c7b76d"></a>

```java
protected void setProvisionalTransId(String id)
```

**Parameters**

- `String id`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### verifyServerHostKey(String, int, String, byte[]) <a href="#verifyserverhostkey-df5f7c8ae1fe" id="verifyserverhostkey-df5f7c8ae1fe"></a>

```java
public boolean verifyServerHostKey(
    String hostname,
    int port,
    String serverHostKeyAlgorithm,
    byte[] serverHostKey
)
```

**Parameters**

- `String hostname`
- `int port`
- `String serverHostKeyAlgorithm`
- `byte[] serverHostKey`


## Nested Types

- [NedPublicKey](NedCmd/NedPublicKey.md#nedpublickey-99f8875cf44d)
- [NedSSHAlgorithms](NedCmd/NedSSHAlgorithms.md#nedsshalgorithms-7bd74eef0d12)
