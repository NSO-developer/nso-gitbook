# NedCmd <a href="#cls-NedCmd" id="cls-NedCmd"></a>

```java
public class com.tailf.ned.NedCmd
    implements ch.ethz.ssh2.ServerHostKeyVerifier
```

A NedCmd represents the command send from the NCS with all
 parameters. A NedCmd is passed from the NedMux to a NedWorker
 to finally arrive at a NetConnection for processing.

## Members

**Constructors**:

- [NedCmd(ConfETuple)](#m-NedCmd-4a85ef572624)

**Fields**:

- [ABORT_CLI](#m-ABORT_CLI)
- [ABORT_GENERIC](#m-ABORT_GENERIC)
- [CLOSE](#m-CLOSE)
- [CLOSE_ALL](#m-CLOSE_ALL)
- [CMD](#m-CMD)
- [COMMIT](#m-COMMIT)
- [CONFIG_MERGE](#m-CONFIG_MERGE)
- [CONFIG_REPLACE](#m-CONFIG_REPLACE)
- [CONNECT_CLI](#m-CONNECT_CLI)
- [CONNECT_GENERIC](#m-CONNECT_GENERIC)
- [CREATE_SUBSCRIPTION](#m-CREATE_SUBSCRIPTION)
- [CREATE_TELEMETRY_SUBSCRIPTION](#m-CREATE_TELEMETRY_SUBSCRIPTION)
- [FILTER_NONE](#m-FILTER_NONE)
- [FILTER_SUBTREE](#m-FILTER_SUBTREE)
- [FILTER_XPATH](#m-FILTER_XPATH)
- [GET_TRANS_ID](#m-GET_TRANS_ID)
- [INITIALIZE](#m-INITIALIZE)
- [IS_ALIVE](#m-IS_ALIVE)
- [KEEP_ALIVE](#m-KEEP_ALIVE)
- [KNOWN_ALGOS](#m-KNOWN_ALGOS)
- [NEW_THREAD](#m-NEW_THREAD)
- [NO_WORKER](#m-NO_WORKER)
- [NOCONNECT_CLI](#m-NOCONNECT_CLI)
- [NOCONNECT_GENERIC](#m-NOCONNECT_GENERIC)
- [NONE](#m-NONE)
- [PERSIST](#m-PERSIST)
- [PREPARE_CLI](#m-PREPARE_CLI)
- [PREPARE_DRY_CLI](#m-PREPARE_DRY_CLI)
- [PREPARE_DRY_GENERIC](#m-PREPARE_DRY_GENERIC)
- [PREPARE_GENERIC](#m-PREPARE_GENERIC)
- [RECONNECT](#m-RECONNECT)
- [REJECT_MISMATCH](#m-REJECT_MISMATCH)
- [REJECT_UNKNOWN](#m-REJECT_UNKNOWN)
- [RESTART](#m-RESTART)
- [REVERT_CLI](#m-REVERT_CLI)
- [REVERT_GENERIC](#m-REVERT_GENERIC)
- [SHOW_CLI](#m-SHOW_CLI)
- [SHOW_GENERIC](#m-SHOW_GENERIC)
- [SHOW_OFFLINE_CLI](#m-SHOW_OFFLINE_CLI)
- [SHOW_OFFLINE_GENERIC](#m-SHOW_OFFLINE_GENERIC)
- [SHOW_PARTIAL_CLI](#m-SHOW_PARTIAL_CLI)
- [SHOW_PARTIAL_GENERIC](#m-SHOW_PARTIAL_GENERIC)
- [SHOW_STATS_FILTER](#m-SHOW_STATS_FILTER)
- [SHOW_STATS_PATH](#m-SHOW_STATS_PATH)
- [STOP_THREAD](#m-STOP_THREAD)
- [SUBTREE](#m-SUBTREE)
- [UNINITIALIZE](#m-UNINITIALIZE)
- [XPATH](#m-XPATH)

**Methods**:

- [cmdString()](#m-cmdString-14890451befe)
- [cmdToDevicePhase(int)](#m-cmdToDevicePhase-315de652ea11)
- [cmdToString(int)](#m-cmdToString-f5ed8a204e6f)
- [getActionName()](#m-getActionName-c421fe4033d7)
- [getAdditionalInfo()](#m-getAdditionalInfo-e1cb561024ba)
- [getAuthOrder()](#m-getAuthOrder-2d552ed01a0e)
- [getCliConfigChars()](#m-getCliConfigChars-2a8ea15c9753)
- [getCmdPaths()](#m-getCmdPaths-37171ce7c8eb)
- [getCommand()](#m-getCommand-f6f76ff7d38b)
- [getComment()](#m-getComment-a5625f95afef)
- [getConnectionId()](#m-getConnectionId-600ebb3e7d7f)
- [getConnectTimeout()](#m-getConnectTimeout-cfec33294648)
- [getDevice()](#m-getDevice-4acac4557fc6)
- [getDevList()](#m-getDevList-1a6070a968b7)
- [getFilter()](#m-getFilter-2b84817e0707)
- [getFilterIntent()](#m-getFilterIntent-2bc571cd2560)
- [getFilterType()](#m-getFilterType-de1618989694)
- [getFilterTypeAsString()](#m-getFilterTypeAsString-1352f2ea19d5)
- [getFromTransactionId()](#m-getFromTransactionId-c49683f287a8)
- [getGenericConfigChars()](#m-getGenericConfigChars-d9c9c3f287f2)
- [getHostKeyAlgos()](#m-getHostKeyAlgos-580f9f4a42c3)
- [getHostKeys()](#m-getHostKeys-afeb8a087227)
- [getHostKeyVerifAsString()](#m-getHostKeyVerifAsString-888e4c14e9d7)
- [getHostKeyVerifier()](#m-getHostKeyVerifier-5231b47d5444)
- [getHostKeyVerify()](#m-getHostKeyVerify-faec6b615eba)
- [getId()](#m-getId-199a349c70ef)
- [getIdentities(NedWorker)](#m-getIdentities-65d4c5a4a59e)
- [getIP()](#m-getIP-c2f1d3db411f)
- [getKeyDir()](#m-getKeyDir-07c13308c833)
- [getLabel()](#m-getLabel-72bf899bf6f1)
- [getLoadOp()](#m-getLoadOp-ab5127869701)
- [getLocalUser()](#m-getLocalUser-6ac239a3b919)
- [getMfaExecutable()](#m-getMfaExecutable-c68a3fe5954e)
- [getMfaOpaque()](#m-getMfaOpaque-1ba5d0f480c6)
- [getOperations()](#m-getOperations-bb0a308eca4c)
- [getParams()](#m-getParams-4abd21251a20)
- [getPassword()](#m-getPassword-003001cc6c91)
- [getPath()](#m-getPath-88fb21895561)
- [getPathIntent()](#m-getPathIntent-e49c0ca975d0)
- [getPaths()](#m-getPaths-ce548cbbccae)
- [getPort()](#m-getPort-a2225f868a2b)
- [getProtocol()](#m-getProtocol-7199008875a5)
- [getProvisionalTransId()](#m-getProvisionalTransId-746567171fc9)
- [getPublicKeys()](#m-getPublicKeys-319aca5ff00c)
- [getReadTimeout()](#m-getReadTimeout-640fc089c1de)
- [getRemoteUser()](#m-getRemoteUser-bdfb4a23b5ff)
- [getSecondaryPassword()](#m-getSecondaryPassword-34fb12bcee21)
- [getServerKeyMismatch()](#m-getServerKeyMismatch-397bbe151bff)
- [getSourceAddress()](#m-getSourceAddress-873953ea3b38)
- [getSSHAlgorithms()](#m-getSSHAlgorithms-9546086e7915)
- [getStartTime()](#m-getStartTime-f237c63a0230)
- [getStream()](#m-getStream-f9fafde50565)
- [getTelemetrySettings()](#m-getTelemetrySettings-fbb071630f56)
- [getTimeout()](#m-getTimeout-c6606d7f7c00)
- [getTopTag()](#m-getTopTag-4bbcffa59820)
- [getToTransactionId()](#m-getToTransactionId-3beba3c28e0e)
- [getTransaction()](#m-getTransaction-4f1c72a828a1)
- [getUsid()](#m-getUsid-62d0ecfd68fd)
- [getWorkerId()](#m-getWorkerId-80f0b625907c)
- [getWriteTimeout()](#m-getWriteTimeout-866d6552aa46)
- [getXPathIntent()](#m-getXPathIntent-67290eec645d)
- [isAll()](#m-isAll-9d62c2f960b8)
- [isForce()](#m-isForce-f9ef7f4abb1e)
- [isSuppressTransId()](#m-isSuppressTransId-ea2b7aa87e80)
- [isTrace()](#m-isTrace-98fd54ca3d6c)
- [isVerbose()](#m-isVerbose-224af8693204)
- [parseOps(ConfEList)](#m-parseOps-4ab9ce41ccc1)
- [setAdditionalInfo(String)](#m-setAdditionalInfo-b262ce567572)
- [setProvisionalTransId(String)](#m-setProvisionalTransId-e17c71c7b76d)
- [toString()](#m-toString-e9d48c5503ef)
- [verifyServerHostKey(String, int, String, byte[])](#m-verifyServerHostKey-df5f7c8ae1fe)

**Nested Types**:

- [NedPublicKey](NedCmd/NedPublicKey.md#cls-NedPublicKey)
- [NedSSHAlgorithms](NedCmd/NedSSHAlgorithms.md#cls-NedSSHAlgorithms)

## Constructors

### NedCmd(ConfETuple) <a href="#m-NedCmd-4a85ef572624" id="m-NedCmd-4a85ef572624"></a>

```java
public NedCmd(com.tailf.proto.ConfETuple t) throws com.tailf.ned.NedException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.proto.ConfETuple t`


## Fields

### ABORT_CLI <a href="#m-ABORT_CLI" id="m-ABORT_CLI"></a>

```java
public static final int ABORT_CLI = 7;
```

### ABORT_GENERIC <a href="#m-ABORT_GENERIC" id="m-ABORT_GENERIC"></a>

```java
public static final int ABORT_GENERIC = 8;
```

### CLOSE <a href="#m-CLOSE" id="m-CLOSE"></a>

```java
public static final int CLOSE = 14;
```

### CLOSE_ALL <a href="#m-CLOSE_ALL" id="m-CLOSE_ALL"></a>

```java
public static final int CLOSE_ALL = 15;
```

### CMD <a href="#m-CMD" id="m-CMD"></a>

```java
public static final int CMD = 17;
```

### COMMIT <a href="#m-COMMIT" id="m-COMMIT"></a>

```java
public static final int COMMIT = 6;
```

### CONFIG_MERGE <a href="#m-CONFIG_MERGE" id="m-CONFIG_MERGE"></a>

```java
public static final int CONFIG_MERGE = 1;
```

### CONFIG_REPLACE <a href="#m-CONFIG_REPLACE" id="m-CONFIG_REPLACE"></a>

```java
public static final int CONFIG_REPLACE = 0;
```

### CONNECT_CLI <a href="#m-CONNECT_CLI" id="m-CONNECT_CLI"></a>

```java
public static final int CONNECT_CLI = 0;
```

### CONNECT_GENERIC <a href="#m-CONNECT_GENERIC" id="m-CONNECT_GENERIC"></a>

```java
public static final int CONNECT_GENERIC = 1;
```

### CREATE_SUBSCRIPTION <a href="#m-CREATE_SUBSCRIPTION" id="m-CREATE_SUBSCRIPTION"></a>

```java
public static final int CREATE_SUBSCRIPTION = 34;
```

### CREATE_TELEMETRY_SUBSCRIPTION <a href="#m-CREATE_TELEMETRY_SUBSCRIPTION" id="m-CREATE_TELEMETRY_SUBSCRIPTION"></a>

```java
public static final int CREATE_TELEMETRY_SUBSCRIPTION = 37;
```

### FILTER_NONE <a href="#m-FILTER_NONE" id="m-FILTER_NONE"></a>

```java
public static final int FILTER_NONE = 0;
```

### FILTER_SUBTREE <a href="#m-FILTER_SUBTREE" id="m-FILTER_SUBTREE"></a>

```java
public static final int FILTER_SUBTREE = 2;
```

### FILTER_XPATH <a href="#m-FILTER_XPATH" id="m-FILTER_XPATH"></a>

```java
public static final int FILTER_XPATH = 1;
```

### GET_TRANS_ID <a href="#m-GET_TRANS_ID" id="m-GET_TRANS_ID"></a>

```java
public static final int GET_TRANS_ID = 20;
```

### INITIALIZE <a href="#m-INITIALIZE" id="m-INITIALIZE"></a>

```java
public static final int INITIALIZE = 24;
```

### IS_ALIVE <a href="#m-IS_ALIVE" id="m-IS_ALIVE"></a>

```java
public static final int IS_ALIVE = 22;
```

### KEEP_ALIVE <a href="#m-KEEP_ALIVE" id="m-KEEP_ALIVE"></a>

```java
public static final int KEEP_ALIVE = 30;
```

### KNOWN_ALGOS <a href="#m-KNOWN_ALGOS" id="m-KNOWN_ALGOS"></a>

```java
public static final String[] KNOWN_ALGOS = null;
```

### NEW_THREAD <a href="#m-NEW_THREAD" id="m-NEW_THREAD"></a>

```java
public static final int NEW_THREAD = 16;
```

### NO_WORKER <a href="#m-NO_WORKER" id="m-NO_WORKER"></a>

```java
public static final int NO_WORKER = -1;
```

### NOCONNECT_CLI <a href="#m-NOCONNECT_CLI" id="m-NOCONNECT_CLI"></a>

```java
public static final int NOCONNECT_CLI = 28;
```

### NOCONNECT_GENERIC <a href="#m-NOCONNECT_GENERIC" id="m-NOCONNECT_GENERIC"></a>

```java
public static final int NOCONNECT_GENERIC = 29;
```

### NONE <a href="#m-NONE" id="m-NONE"></a>

```java
public static final int NONE = 2;
```

### PERSIST <a href="#m-PERSIST" id="m-PERSIST"></a>

```java
public static final int PERSIST = 11;
```

### PREPARE_CLI <a href="#m-PREPARE_CLI" id="m-PREPARE_CLI"></a>

```java
public static final int PREPARE_CLI = 2;
```

### PREPARE_DRY_CLI <a href="#m-PREPARE_DRY_CLI" id="m-PREPARE_DRY_CLI"></a>

```java
public static final int PREPARE_DRY_CLI = 3;
```

### PREPARE_DRY_GENERIC <a href="#m-PREPARE_DRY_GENERIC" id="m-PREPARE_DRY_GENERIC"></a>

```java
public static final int PREPARE_DRY_GENERIC = 5;
```

### PREPARE_GENERIC <a href="#m-PREPARE_GENERIC" id="m-PREPARE_GENERIC"></a>

```java
public static final int PREPARE_GENERIC = 4;
```

### RECONNECT <a href="#m-RECONNECT" id="m-RECONNECT"></a>

```java
public static final int RECONNECT = 23;
```

### REJECT_MISMATCH <a href="#m-REJECT_MISMATCH" id="m-REJECT_MISMATCH"></a>

```java
public static final int REJECT_MISMATCH = 1;
```

### REJECT_UNKNOWN <a href="#m-REJECT_UNKNOWN" id="m-REJECT_UNKNOWN"></a>

```java
public static final int REJECT_UNKNOWN = 0;
```

### RESTART <a href="#m-RESTART" id="m-RESTART"></a>

```java
public static final int RESTART = 21;
```

### REVERT_CLI <a href="#m-REVERT_CLI" id="m-REVERT_CLI"></a>

```java
public static final int REVERT_CLI = 9;
```

### REVERT_GENERIC <a href="#m-REVERT_GENERIC" id="m-REVERT_GENERIC"></a>

```java
public static final int REVERT_GENERIC = 10;
```

### SHOW_CLI <a href="#m-SHOW_CLI" id="m-SHOW_CLI"></a>

```java
public static final int SHOW_CLI = 12;
```

### SHOW_GENERIC <a href="#m-SHOW_GENERIC" id="m-SHOW_GENERIC"></a>

```java
public static final int SHOW_GENERIC = 13;
```

### SHOW_OFFLINE_CLI <a href="#m-SHOW_OFFLINE_CLI" id="m-SHOW_OFFLINE_CLI"></a>

```java
public static final int SHOW_OFFLINE_CLI = 32;
```

### SHOW_OFFLINE_GENERIC <a href="#m-SHOW_OFFLINE_GENERIC" id="m-SHOW_OFFLINE_GENERIC"></a>

```java
public static final int SHOW_OFFLINE_GENERIC = 33;
```

### SHOW_PARTIAL_CLI <a href="#m-SHOW_PARTIAL_CLI" id="m-SHOW_PARTIAL_CLI"></a>

```java
public static final int SHOW_PARTIAL_CLI = 26;
```

### SHOW_PARTIAL_GENERIC <a href="#m-SHOW_PARTIAL_GENERIC" id="m-SHOW_PARTIAL_GENERIC"></a>

```java
public static final int SHOW_PARTIAL_GENERIC = 27;
```

### SHOW_STATS_FILTER <a href="#m-SHOW_STATS_FILTER" id="m-SHOW_STATS_FILTER"></a>

```java
public static final int SHOW_STATS_FILTER = 36;
```

### SHOW_STATS_PATH <a href="#m-SHOW_STATS_PATH" id="m-SHOW_STATS_PATH"></a>

```java
public static final int SHOW_STATS_PATH = 31;
```

### STOP_THREAD <a href="#m-STOP_THREAD" id="m-STOP_THREAD"></a>

```java
public static final int STOP_THREAD = 35;
```

### SUBTREE <a href="#m-SUBTREE" id="m-SUBTREE"></a>

```java
public static final String SUBTREE = "subtree";
```

### UNINITIALIZE <a href="#m-UNINITIALIZE" id="m-UNINITIALIZE"></a>

```java
public static final int UNINITIALIZE = 25;
```

### XPATH <a href="#m-XPATH" id="m-XPATH"></a>

```java
public static final String XPATH = "xpath";
```


## Methods

### cmdString() <a href="#m-cmdString-14890451befe" id="m-cmdString-14890451befe"></a>

```java
public String cmdString()
```

### cmdToDevicePhase(int) <a href="#m-cmdToDevicePhase-315de652ea11" id="m-cmdToDevicePhase-315de652ea11"></a>

```java
public static String cmdToDevicePhase(int cmd)
```

**Parameters**

- `int cmd`

### cmdToString(int) <a href="#m-cmdToString-f5ed8a204e6f" id="m-cmdToString-f5ed8a204e6f"></a>

```java
public static String cmdToString(int cmd)
```

**Parameters**

- `int cmd`

### getActionName() <a href="#m-getActionName-c421fe4033d7" id="m-getActionName-c421fe4033d7"></a>

```java
public String getActionName()
```

### getAdditionalInfo() <a href="#m-getAdditionalInfo-e1cb561024ba" id="m-getAdditionalInfo-e1cb561024ba"></a>

```java
public String getAdditionalInfo()
```

### getAuthOrder() <a href="#m-getAuthOrder-2d552ed01a0e" id="m-getAuthOrder-2d552ed01a0e"></a>

```java
public String[] getAuthOrder()
```

### getCliConfigChars() <a href="#m-getCliConfigChars-2a8ea15c9753" id="m-getCliConfigChars-2a8ea15c9753"></a>

```java
public String getCliConfigChars()
```

### getCmdPaths() <a href="#m-getCmdPaths-37171ce7c8eb" id="m-getCmdPaths-37171ce7c8eb"></a>

```java
public String[] getCmdPaths()
```

### getCommand() <a href="#m-getCommand-f6f76ff7d38b" id="m-getCommand-f6f76ff7d38b"></a>

```java
public int getCommand()
```

### getComment() <a href="#m-getComment-a5625f95afef" id="m-getComment-a5625f95afef"></a>

```java
public String getComment()
```

### getConnectionId() <a href="#m-getConnectionId-600ebb3e7d7f" id="m-getConnectionId-600ebb3e7d7f"></a>

```java
public int getConnectionId()
```

### getConnectTimeout() <a href="#m-getConnectTimeout-cfec33294648" id="m-getConnectTimeout-cfec33294648"></a>

```java
public int getConnectTimeout()
```

### getDevice() <a href="#m-getDevice-4acac4557fc6" id="m-getDevice-4acac4557fc6"></a>

```java
public String getDevice()
```

### getDevList() <a href="#m-getDevList-1a6070a968b7" id="m-getDevList-1a6070a968b7"></a>

```java
public java.util.Set<String> getDevList()
```

### getFilter() <a href="#m-getFilter-2b84817e0707" id="m-getFilter-2b84817e0707"></a>

```java
public String getFilter()
```

### getFilterIntent() <a href="#m-getFilterIntent-2bc571cd2560" id="m-getFilterIntent-2bc571cd2560"></a>

```java
public com.tailf.ned.NedShowFilter[] getFilterIntent()
```

Types: [NedShowFilter](NedShowFilter.md#cls-NedShowFilter)

### getFilterType() <a href="#m-getFilterType-de1618989694" id="m-getFilterType-de1618989694"></a>

```java
public int getFilterType()
```

### getFilterTypeAsString() <a href="#m-getFilterTypeAsString-1352f2ea19d5" id="m-getFilterTypeAsString-1352f2ea19d5"></a>

```java
public String getFilterTypeAsString()
```

### getFromTransactionId() <a href="#m-getFromTransactionId-c49683f287a8" id="m-getFromTransactionId-c49683f287a8"></a>

```java
public int getFromTransactionId()
```

### getGenericConfigChars() <a href="#m-getGenericConfigChars-d9c9c3f287f2" id="m-getGenericConfigChars-d9c9c3f287f2"></a>

```java
public String getGenericConfigChars()
```

### getHostKeyAlgos() <a href="#m-getHostKeyAlgos-580f9f4a42c3" id="m-getHostKeyAlgos-580f9f4a42c3"></a>

```java
protected String[] getHostKeyAlgos()
```

### getHostKeys() <a href="#m-getHostKeys-afeb8a087227" id="m-getHostKeys-afeb8a087227"></a>

```java
public com.tailf.ned.NedCmd.NedPublicKey[] getHostKeys()
```

Types: [NedPublicKey](NedCmd/NedPublicKey.md#cls-NedPublicKey)

### getHostKeyVerifAsString() <a href="#m-getHostKeyVerifAsString-888e4c14e9d7" id="m-getHostKeyVerifAsString-888e4c14e9d7"></a>

```java
public String getHostKeyVerifAsString()
```

### getHostKeyVerifier() <a href="#m-getHostKeyVerifier-5231b47d5444" id="m-getHostKeyVerifier-5231b47d5444"></a>

```java
protected ch.ethz.ssh2.ServerHostKeyVerifier getHostKeyVerifier()
```

### getHostKeyVerify() <a href="#m-getHostKeyVerify-faec6b615eba" id="m-getHostKeyVerify-faec6b615eba"></a>

```java
public int getHostKeyVerify()
```

### getId() <a href="#m-getId-199a349c70ef" id="m-getId-199a349c70ef"></a>

```java
public String getId()
```

### getIdentities(NedWorker) <a href="#m-getIdentities-65d4c5a4a59e" id="m-getIdentities-65d4c5a4a59e"></a>

```java
protected java.util.Collection<ch.ethz.ssh2.auth.AgentIdentity> getIdentities(
    com.tailf.ned.NedWorker worker
)
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### getIP() <a href="#m-getIP-c2f1d3db411f" id="m-getIP-c2f1d3db411f"></a>

```java
public java.net.InetAddress getIP()
```

### getKeyDir() <a href="#m-getKeyDir-07c13308c833" id="m-getKeyDir-07c13308c833"></a>

```java
public String getKeyDir()
```

### getLabel() <a href="#m-getLabel-72bf899bf6f1" id="m-getLabel-72bf899bf6f1"></a>

```java
public String getLabel()
```

### getLoadOp() <a href="#m-getLoadOp-ab5127869701" id="m-getLoadOp-ab5127869701"></a>

```java
public int getLoadOp()
```

### getLocalUser() <a href="#m-getLocalUser-6ac239a3b919" id="m-getLocalUser-6ac239a3b919"></a>

```java
public String getLocalUser()
```

### getMfaExecutable() <a href="#m-getMfaExecutable-c68a3fe5954e" id="m-getMfaExecutable-c68a3fe5954e"></a>

```java
public String getMfaExecutable()
```

### getMfaOpaque() <a href="#m-getMfaOpaque-1ba5d0f480c6" id="m-getMfaOpaque-1ba5d0f480c6"></a>

```java
public String getMfaOpaque()
```

### getOperations() <a href="#m-getOperations-bb0a308eca4c" id="m-getOperations-bb0a308eca4c"></a>

```java
public com.tailf.ned.NedEditOp[] getOperations()
```

Types: [NedEditOp](NedEditOp.md#cls-NedEditOp)

### getParams() <a href="#m-getParams-4abd21251a20" id="m-getParams-4abd21251a20"></a>

```java
public com.tailf.conf.ConfXMLParam[] getParams()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

### getPassword() <a href="#m-getPassword-003001cc6c91" id="m-getPassword-003001cc6c91"></a>

```java
public String getPassword()
```

### getPath() <a href="#m-getPath-88fb21895561" id="m-getPath-88fb21895561"></a>

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

### getPathIntent() <a href="#m-getPathIntent-e49c0ca975d0" id="m-getPathIntent-e49c0ca975d0"></a>

```java
public com.tailf.conf.ConfPath[] getPathIntent()
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

### getPaths() <a href="#m-getPaths-ce548cbbccae" id="m-getPaths-ce548cbbccae"></a>

```java
public com.tailf.conf.ConfPath[] getPaths() throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

### getPort() <a href="#m-getPort-a2225f868a2b" id="m-getPort-a2225f868a2b"></a>

```java
public int getPort()
```

### getProtocol() <a href="#m-getProtocol-7199008875a5" id="m-getProtocol-7199008875a5"></a>

```java
public String getProtocol()
```

### getProvisionalTransId() <a href="#m-getProvisionalTransId-746567171fc9" id="m-getProvisionalTransId-746567171fc9"></a>

```java
public String getProvisionalTransId()
```

### getPublicKeys() <a href="#m-getPublicKeys-319aca5ff00c" id="m-getPublicKeys-319aca5ff00c"></a>

```java
public com.tailf.ned.NedCmd.NedPublicKey[] getPublicKeys()
```

Types: [NedPublicKey](NedCmd/NedPublicKey.md#cls-NedPublicKey)

### getReadTimeout() <a href="#m-getReadTimeout-640fc089c1de" id="m-getReadTimeout-640fc089c1de"></a>

```java
public int getReadTimeout()
```

### getRemoteUser() <a href="#m-getRemoteUser-bdfb4a23b5ff" id="m-getRemoteUser-bdfb4a23b5ff"></a>

```java
public String getRemoteUser()
```

### getSecondaryPassword() <a href="#m-getSecondaryPassword-34fb12bcee21" id="m-getSecondaryPassword-34fb12bcee21"></a>

```java
public String getSecondaryPassword()
```

### getServerKeyMismatch() <a href="#m-getServerKeyMismatch-397bbe151bff" id="m-getServerKeyMismatch-397bbe151bff"></a>

```java
protected boolean getServerKeyMismatch()
```

### getSourceAddress() <a href="#m-getSourceAddress-873953ea3b38" id="m-getSourceAddress-873953ea3b38"></a>

```java
public java.net.InetSocketAddress getSourceAddress()
```

### getSSHAlgorithms() <a href="#m-getSSHAlgorithms-9546086e7915" id="m-getSSHAlgorithms-9546086e7915"></a>

```java
public com.tailf.ned.NedCmd.NedSSHAlgorithms getSSHAlgorithms()
```

Types: [NedSSHAlgorithms](NedCmd/NedSSHAlgorithms.md#cls-NedSSHAlgorithms)

### getStartTime() <a href="#m-getStartTime-f237c63a0230" id="m-getStartTime-f237c63a0230"></a>

```java
public String getStartTime()
```

### getStream() <a href="#m-getStream-f9fafde50565" id="m-getStream-f9fafde50565"></a>

```java
public String getStream()
```

### getTelemetrySettings() <a href="#m-getTelemetrySettings-fbb071630f56" id="m-getTelemetrySettings-fbb071630f56"></a>

```java
public java.util.Map<String,java.util.List<String>> getTelemetrySettings()
```

### getTimeout() <a href="#m-getTimeout-c6606d7f7c00" id="m-getTimeout-c6606d7f7c00"></a>

```java
public int getTimeout()
```

### getTopTag() <a href="#m-getTopTag-4bbcffa59820" id="m-getTopTag-4bbcffa59820"></a>

```java
public String getTopTag()
```

### getToTransactionId() <a href="#m-getToTransactionId-3beba3c28e0e" id="m-getToTransactionId-3beba3c28e0e"></a>

```java
public int getToTransactionId()
```

### getTransaction() <a href="#m-getTransaction-4f1c72a828a1" id="m-getTransaction-4f1c72a828a1"></a>

```java
public int getTransaction()
```

### getUsid() <a href="#m-getUsid-62d0ecfd68fd" id="m-getUsid-62d0ecfd68fd"></a>

```java
public int getUsid()
```

### getWorkerId() <a href="#m-getWorkerId-80f0b625907c" id="m-getWorkerId-80f0b625907c"></a>

```java
public int getWorkerId()
```

### getWriteTimeout() <a href="#m-getWriteTimeout-866d6552aa46" id="m-getWriteTimeout-866d6552aa46"></a>

```java
public int getWriteTimeout()
```

### getXPathIntent() <a href="#m-getXPathIntent-67290eec645d" id="m-getXPathIntent-67290eec645d"></a>

```java
public String[] getXPathIntent()
```

### isAll() <a href="#m-isAll-9d62c2f960b8" id="m-isAll-9d62c2f960b8"></a>

```java
public boolean isAll()
```

### isForce() <a href="#m-isForce-f9ef7f4abb1e" id="m-isForce-f9ef7f4abb1e"></a>

```java
public boolean isForce()
```

### isSuppressTransId() <a href="#m-isSuppressTransId-ea2b7aa87e80" id="m-isSuppressTransId-ea2b7aa87e80"></a>

```java
public boolean isSuppressTransId()
```

### isTrace() <a href="#m-isTrace-98fd54ca3d6c" id="m-isTrace-98fd54ca3d6c"></a>

```java
public boolean isTrace()
```

### isVerbose() <a href="#m-isVerbose-224af8693204" id="m-isVerbose-224af8693204"></a>

```java
public boolean isVerbose()
```

### parseOps(ConfEList) <a href="#m-parseOps-4ab9ce41ccc1" id="m-parseOps-4ab9ce41ccc1"></a>

```java
public final com.tailf.ned.NedEditOp[] parseOps(com.tailf.proto.ConfEList l)
```

Types: [NedEditOp](NedEditOp.md#cls-NedEditOp), [ConfEList](../proto/ConfEList.md#cls-ConfEList)

**Parameters**

- `com.tailf.proto.ConfEList l`

### setAdditionalInfo(String) <a href="#m-setAdditionalInfo-b262ce567572" id="m-setAdditionalInfo-b262ce567572"></a>

```java
public void setAdditionalInfo(String info)
```

**Parameters**

- `String info`

### setProvisionalTransId(String) <a href="#m-setProvisionalTransId-e17c71c7b76d" id="m-setProvisionalTransId-e17c71c7b76d"></a>

```java
protected void setProvisionalTransId(String id)
```

**Parameters**

- `String id`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### verifyServerHostKey(String, int, String, byte[]) <a href="#m-verifyServerHostKey-df5f7c8ae1fe" id="m-verifyServerHostKey-df5f7c8ae1fe"></a>

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

- [NedPublicKey](NedCmd/NedPublicKey.md#cls-NedPublicKey)
- [NedSSHAlgorithms](NedCmd/NedSSHAlgorithms.md#cls-NedSSHAlgorithms)
