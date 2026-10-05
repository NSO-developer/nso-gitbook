<a id="cls-NedCmd"></a>
# NedCmd

```java
public class com.tailf.ned.NedCmd
    implements ch.ethz.ssh2.ServerHostKeyVerifier
```

A NedCmd represents the command send from the NCS with all
 parameters. A NedCmd is passed from the NedMux to a NedWorker
 to finally arrive at a NetConnection for processing.

## Members

**Constructors**:

- [NedCmd(ConfETuple)](#m-nedcmd-4a85ef572624)

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

- [cmdString()](#m-cmdstring-14890451befe)
- [cmdToDevicePhase(int)](#m-cmdtodevicephase-315de652ea11)
- [cmdToString(int)](#m-cmdtostring-f5ed8a204e6f)
- [getActionName()](#m-getactionname-c421fe4033d7)
- [getAdditionalInfo()](#m-getadditionalinfo-e1cb561024ba)
- [getAuthOrder()](#m-getauthorder-2d552ed01a0e)
- [getCliConfigChars()](#m-getcliconfigchars-2a8ea15c9753)
- [getCmdPaths()](#m-getcmdpaths-37171ce7c8eb)
- [getCommand()](#m-getcommand-f6f76ff7d38b)
- [getComment()](#m-getcomment-a5625f95afef)
- [getConnectionId()](#m-getconnectionid-600ebb3e7d7f)
- [getConnectTimeout()](#m-getconnecttimeout-cfec33294648)
- [getDevice()](#m-getdevice-4acac4557fc6)
- [getDevList()](#m-getdevlist-1a6070a968b7)
- [getFilter()](#m-getfilter-2b84817e0707)
- [getFilterIntent()](#m-getfilterintent-2bc571cd2560)
- [getFilterType()](#m-getfiltertype-de1618989694)
- [getFilterTypeAsString()](#m-getfiltertypeasstring-1352f2ea19d5)
- [getFromTransactionId()](#m-getfromtransactionid-c49683f287a8)
- [getGenericConfigChars()](#m-getgenericconfigchars-d9c9c3f287f2)
- [getHostKeyAlgos()](#m-gethostkeyalgos-580f9f4a42c3)
- [getHostKeys()](#m-gethostkeys-afeb8a087227)
- [getHostKeyVerifAsString()](#m-gethostkeyverifasstring-888e4c14e9d7)
- [getHostKeyVerifier()](#m-gethostkeyverifier-5231b47d5444)
- [getHostKeyVerify()](#m-gethostkeyverify-faec6b615eba)
- [getId()](#m-getid-199a349c70ef)
- [getIdentities(NedWorker)](#m-getidentities-65d4c5a4a59e)
- [getIP()](#m-getip-c2f1d3db411f)
- [getKeyDir()](#m-getkeydir-07c13308c833)
- [getLabel()](#m-getlabel-72bf899bf6f1)
- [getLoadOp()](#m-getloadop-ab5127869701)
- [getLocalUser()](#m-getlocaluser-6ac239a3b919)
- [getMfaExecutable()](#m-getmfaexecutable-c68a3fe5954e)
- [getMfaOpaque()](#m-getmfaopaque-1ba5d0f480c6)
- [getOperations()](#m-getoperations-bb0a308eca4c)
- [getParams()](#m-getparams-4abd21251a20)
- [getPassword()](#m-getpassword-003001cc6c91)
- [getPath()](#m-getpath-88fb21895561)
- [getPathIntent()](#m-getpathintent-e49c0ca975d0)
- [getPaths()](#m-getpaths-ce548cbbccae)
- [getPort()](#m-getport-a2225f868a2b)
- [getProtocol()](#m-getprotocol-7199008875a5)
- [getProvisionalTransId()](#m-getprovisionaltransid-746567171fc9)
- [getPublicKeys()](#m-getpublickeys-319aca5ff00c)
- [getReadTimeout()](#m-getreadtimeout-640fc089c1de)
- [getRemoteUser()](#m-getremoteuser-bdfb4a23b5ff)
- [getSecondaryPassword()](#m-getsecondarypassword-34fb12bcee21)
- [getServerKeyMismatch()](#m-getserverkeymismatch-397bbe151bff)
- [getSourceAddress()](#m-getsourceaddress-873953ea3b38)
- [getSSHAlgorithms()](#m-getsshalgorithms-9546086e7915)
- [getStartTime()](#m-getstarttime-f237c63a0230)
- [getStream()](#m-getstream-f9fafde50565)
- [getTelemetrySettings()](#m-gettelemetrysettings-fbb071630f56)
- [getTimeout()](#m-gettimeout-c6606d7f7c00)
- [getTopTag()](#m-gettoptag-4bbcffa59820)
- [getToTransactionId()](#m-gettotransactionid-3beba3c28e0e)
- [getTransaction()](#m-gettransaction-4f1c72a828a1)
- [getUsid()](#m-getusid-62d0ecfd68fd)
- [getWorkerId()](#m-getworkerid-80f0b625907c)
- [getWriteTimeout()](#m-getwritetimeout-866d6552aa46)
- [getXPathIntent()](#m-getxpathintent-67290eec645d)
- [isAll()](#m-isall-9d62c2f960b8)
- [isForce()](#m-isforce-f9ef7f4abb1e)
- [isSuppressTransId()](#m-issuppresstransid-ea2b7aa87e80)
- [isTrace()](#m-istrace-98fd54ca3d6c)
- [isVerbose()](#m-isverbose-224af8693204)
- [parseOps(ConfEList)](#m-parseops-4ab9ce41ccc1)
- [setAdditionalInfo(String)](#m-setadditionalinfo-b262ce567572)
- [setProvisionalTransId(String)](#m-setprovisionaltransid-e17c71c7b76d)
- [toString()](#m-tostring-e9d48c5503ef)
- [verifyServerHostKey(String, int, String, byte[])](#m-verifyserverhostkey-df5f7c8ae1fe)

**Nested Types**:

- [NedPublicKey](NedCmd/NedPublicKey.md#cls-NedPublicKey)
- [NedSSHAlgorithms](NedCmd/NedSSHAlgorithms.md#cls-NedSSHAlgorithms)

## Constructors

<a id="m-nedcmd-4a85ef572624"></a>
### NedCmd(ConfETuple)

```java
public NedCmd(com.tailf.proto.ConfETuple t) throws com.tailf.ned.NedException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.proto.ConfETuple t`


## Fields

<a id="m-ABORT_CLI"></a>
### ABORT_CLI

```java
public static final int ABORT_CLI = 7;
```

<a id="m-ABORT_GENERIC"></a>
### ABORT_GENERIC

```java
public static final int ABORT_GENERIC = 8;
```

<a id="m-CLOSE"></a>
### CLOSE

```java
public static final int CLOSE = 14;
```

<a id="m-CLOSE_ALL"></a>
### CLOSE_ALL

```java
public static final int CLOSE_ALL = 15;
```

<a id="m-CMD"></a>
### CMD

```java
public static final int CMD = 17;
```

<a id="m-COMMIT"></a>
### COMMIT

```java
public static final int COMMIT = 6;
```

<a id="m-CONFIG_MERGE"></a>
### CONFIG_MERGE

```java
public static final int CONFIG_MERGE = 1;
```

<a id="m-CONFIG_REPLACE"></a>
### CONFIG_REPLACE

```java
public static final int CONFIG_REPLACE = 0;
```

<a id="m-CONNECT_CLI"></a>
### CONNECT_CLI

```java
public static final int CONNECT_CLI = 0;
```

<a id="m-CONNECT_GENERIC"></a>
### CONNECT_GENERIC

```java
public static final int CONNECT_GENERIC = 1;
```

<a id="m-CREATE_SUBSCRIPTION"></a>
### CREATE_SUBSCRIPTION

```java
public static final int CREATE_SUBSCRIPTION = 34;
```

<a id="m-CREATE_TELEMETRY_SUBSCRIPTION"></a>
### CREATE_TELEMETRY_SUBSCRIPTION

```java
public static final int CREATE_TELEMETRY_SUBSCRIPTION = 37;
```

<a id="m-FILTER_NONE"></a>
### FILTER_NONE

```java
public static final int FILTER_NONE = 0;
```

<a id="m-FILTER_SUBTREE"></a>
### FILTER_SUBTREE

```java
public static final int FILTER_SUBTREE = 2;
```

<a id="m-FILTER_XPATH"></a>
### FILTER_XPATH

```java
public static final int FILTER_XPATH = 1;
```

<a id="m-GET_TRANS_ID"></a>
### GET_TRANS_ID

```java
public static final int GET_TRANS_ID = 20;
```

<a id="m-INITIALIZE"></a>
### INITIALIZE

```java
public static final int INITIALIZE = 24;
```

<a id="m-IS_ALIVE"></a>
### IS_ALIVE

```java
public static final int IS_ALIVE = 22;
```

<a id="m-KEEP_ALIVE"></a>
### KEEP_ALIVE

```java
public static final int KEEP_ALIVE = 30;
```

<a id="m-KNOWN_ALGOS"></a>
### KNOWN_ALGOS

```java
public static final String[] KNOWN_ALGOS = null;
```

<a id="m-NEW_THREAD"></a>
### NEW_THREAD

```java
public static final int NEW_THREAD = 16;
```

<a id="m-NO_WORKER"></a>
### NO_WORKER

```java
public static final int NO_WORKER = -1;
```

<a id="m-NOCONNECT_CLI"></a>
### NOCONNECT_CLI

```java
public static final int NOCONNECT_CLI = 28;
```

<a id="m-NOCONNECT_GENERIC"></a>
### NOCONNECT_GENERIC

```java
public static final int NOCONNECT_GENERIC = 29;
```

<a id="m-NONE"></a>
### NONE

```java
public static final int NONE = 2;
```

<a id="m-PERSIST"></a>
### PERSIST

```java
public static final int PERSIST = 11;
```

<a id="m-PREPARE_CLI"></a>
### PREPARE_CLI

```java
public static final int PREPARE_CLI = 2;
```

<a id="m-PREPARE_DRY_CLI"></a>
### PREPARE_DRY_CLI

```java
public static final int PREPARE_DRY_CLI = 3;
```

<a id="m-PREPARE_DRY_GENERIC"></a>
### PREPARE_DRY_GENERIC

```java
public static final int PREPARE_DRY_GENERIC = 5;
```

<a id="m-PREPARE_GENERIC"></a>
### PREPARE_GENERIC

```java
public static final int PREPARE_GENERIC = 4;
```

<a id="m-RECONNECT"></a>
### RECONNECT

```java
public static final int RECONNECT = 23;
```

<a id="m-REJECT_MISMATCH"></a>
### REJECT_MISMATCH

```java
public static final int REJECT_MISMATCH = 1;
```

<a id="m-REJECT_UNKNOWN"></a>
### REJECT_UNKNOWN

```java
public static final int REJECT_UNKNOWN = 0;
```

<a id="m-RESTART"></a>
### RESTART

```java
public static final int RESTART = 21;
```

<a id="m-REVERT_CLI"></a>
### REVERT_CLI

```java
public static final int REVERT_CLI = 9;
```

<a id="m-REVERT_GENERIC"></a>
### REVERT_GENERIC

```java
public static final int REVERT_GENERIC = 10;
```

<a id="m-SHOW_CLI"></a>
### SHOW_CLI

```java
public static final int SHOW_CLI = 12;
```

<a id="m-SHOW_GENERIC"></a>
### SHOW_GENERIC

```java
public static final int SHOW_GENERIC = 13;
```

<a id="m-SHOW_OFFLINE_CLI"></a>
### SHOW_OFFLINE_CLI

```java
public static final int SHOW_OFFLINE_CLI = 32;
```

<a id="m-SHOW_OFFLINE_GENERIC"></a>
### SHOW_OFFLINE_GENERIC

```java
public static final int SHOW_OFFLINE_GENERIC = 33;
```

<a id="m-SHOW_PARTIAL_CLI"></a>
### SHOW_PARTIAL_CLI

```java
public static final int SHOW_PARTIAL_CLI = 26;
```

<a id="m-SHOW_PARTIAL_GENERIC"></a>
### SHOW_PARTIAL_GENERIC

```java
public static final int SHOW_PARTIAL_GENERIC = 27;
```

<a id="m-SHOW_STATS_FILTER"></a>
### SHOW_STATS_FILTER

```java
public static final int SHOW_STATS_FILTER = 36;
```

<a id="m-SHOW_STATS_PATH"></a>
### SHOW_STATS_PATH

```java
public static final int SHOW_STATS_PATH = 31;
```

<a id="m-STOP_THREAD"></a>
### STOP_THREAD

```java
public static final int STOP_THREAD = 35;
```

<a id="m-SUBTREE"></a>
### SUBTREE

```java
public static final String SUBTREE = "subtree";
```

<a id="m-UNINITIALIZE"></a>
### UNINITIALIZE

```java
public static final int UNINITIALIZE = 25;
```

<a id="m-XPATH"></a>
### XPATH

```java
public static final String XPATH = "xpath";
```


## Methods

<a id="m-cmdstring-14890451befe"></a>
### cmdString()

```java
public String cmdString()
```

<a id="m-cmdtodevicephase-315de652ea11"></a>
### cmdToDevicePhase(int)

```java
public static String cmdToDevicePhase(int cmd)
```

**Parameters**

- `int cmd`

<a id="m-cmdtostring-f5ed8a204e6f"></a>
### cmdToString(int)

```java
public static String cmdToString(int cmd)
```

**Parameters**

- `int cmd`

<a id="m-getactionname-c421fe4033d7"></a>
### getActionName()

```java
public String getActionName()
```

<a id="m-getadditionalinfo-e1cb561024ba"></a>
### getAdditionalInfo()

```java
public String getAdditionalInfo()
```

<a id="m-getauthorder-2d552ed01a0e"></a>
### getAuthOrder()

```java
public String[] getAuthOrder()
```

<a id="m-getcliconfigchars-2a8ea15c9753"></a>
### getCliConfigChars()

```java
public String getCliConfigChars()
```

<a id="m-getcmdpaths-37171ce7c8eb"></a>
### getCmdPaths()

```java
public String[] getCmdPaths()
```

<a id="m-getcommand-f6f76ff7d38b"></a>
### getCommand()

```java
public int getCommand()
```

<a id="m-getcomment-a5625f95afef"></a>
### getComment()

```java
public String getComment()
```

<a id="m-getconnectionid-600ebb3e7d7f"></a>
### getConnectionId()

```java
public int getConnectionId()
```

<a id="m-getconnecttimeout-cfec33294648"></a>
### getConnectTimeout()

```java
public int getConnectTimeout()
```

<a id="m-getdevice-4acac4557fc6"></a>
### getDevice()

```java
public String getDevice()
```

<a id="m-getdevlist-1a6070a968b7"></a>
### getDevList()

```java
public java.util.Set<String> getDevList()
```

<a id="m-getfilter-2b84817e0707"></a>
### getFilter()

```java
public String getFilter()
```

<a id="m-getfilterintent-2bc571cd2560"></a>
### getFilterIntent()

```java
public com.tailf.ned.NedShowFilter[] getFilterIntent()
```

Types: [NedShowFilter](NedShowFilter.md#cls-NedShowFilter)

<a id="m-getfiltertype-de1618989694"></a>
### getFilterType()

```java
public int getFilterType()
```

<a id="m-getfiltertypeasstring-1352f2ea19d5"></a>
### getFilterTypeAsString()

```java
public String getFilterTypeAsString()
```

<a id="m-getfromtransactionid-c49683f287a8"></a>
### getFromTransactionId()

```java
public int getFromTransactionId()
```

<a id="m-getgenericconfigchars-d9c9c3f287f2"></a>
### getGenericConfigChars()

```java
public String getGenericConfigChars()
```

<a id="m-gethostkeyalgos-580f9f4a42c3"></a>
### getHostKeyAlgos()

```java
protected String[] getHostKeyAlgos()
```

<a id="m-gethostkeys-afeb8a087227"></a>
### getHostKeys()

```java
public com.tailf.ned.NedCmd.NedPublicKey[] getHostKeys()
```

Types: [NedPublicKey](NedCmd/NedPublicKey.md#cls-NedPublicKey)

<a id="m-gethostkeyverifasstring-888e4c14e9d7"></a>
### getHostKeyVerifAsString()

```java
public String getHostKeyVerifAsString()
```

<a id="m-gethostkeyverifier-5231b47d5444"></a>
### getHostKeyVerifier()

```java
protected ch.ethz.ssh2.ServerHostKeyVerifier getHostKeyVerifier()
```

<a id="m-gethostkeyverify-faec6b615eba"></a>
### getHostKeyVerify()

```java
public int getHostKeyVerify()
```

<a id="m-getid-199a349c70ef"></a>
### getId()

```java
public String getId()
```

<a id="m-getidentities-65d4c5a4a59e"></a>
### getIdentities(NedWorker)

```java
protected java.util.Collection<ch.ethz.ssh2.auth.AgentIdentity> getIdentities(
    com.tailf.ned.NedWorker worker
)
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="m-getip-c2f1d3db411f"></a>
### getIP()

```java
public java.net.InetAddress getIP()
```

<a id="m-getkeydir-07c13308c833"></a>
### getKeyDir()

```java
public String getKeyDir()
```

<a id="m-getlabel-72bf899bf6f1"></a>
### getLabel()

```java
public String getLabel()
```

<a id="m-getloadop-ab5127869701"></a>
### getLoadOp()

```java
public int getLoadOp()
```

<a id="m-getlocaluser-6ac239a3b919"></a>
### getLocalUser()

```java
public String getLocalUser()
```

<a id="m-getmfaexecutable-c68a3fe5954e"></a>
### getMfaExecutable()

```java
public String getMfaExecutable()
```

<a id="m-getmfaopaque-1ba5d0f480c6"></a>
### getMfaOpaque()

```java
public String getMfaOpaque()
```

<a id="m-getoperations-bb0a308eca4c"></a>
### getOperations()

```java
public com.tailf.ned.NedEditOp[] getOperations()
```

Types: [NedEditOp](NedEditOp.md#cls-NedEditOp)

<a id="m-getparams-4abd21251a20"></a>
### getParams()

```java
public com.tailf.conf.ConfXMLParam[] getParams()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

<a id="m-getpassword-003001cc6c91"></a>
### getPassword()

```java
public String getPassword()
```

<a id="m-getpath-88fb21895561"></a>
### getPath()

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

<a id="m-getpathintent-e49c0ca975d0"></a>
### getPathIntent()

```java
public com.tailf.conf.ConfPath[] getPathIntent()
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

<a id="m-getpaths-ce548cbbccae"></a>
### getPaths()

```java
public com.tailf.conf.ConfPath[] getPaths() throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath), [ConfException](../conf/ConfException.md#cls-ConfException)

<a id="m-getport-a2225f868a2b"></a>
### getPort()

```java
public int getPort()
```

<a id="m-getprotocol-7199008875a5"></a>
### getProtocol()

```java
public String getProtocol()
```

<a id="m-getprovisionaltransid-746567171fc9"></a>
### getProvisionalTransId()

```java
public String getProvisionalTransId()
```

<a id="m-getpublickeys-319aca5ff00c"></a>
### getPublicKeys()

```java
public com.tailf.ned.NedCmd.NedPublicKey[] getPublicKeys()
```

Types: [NedPublicKey](NedCmd/NedPublicKey.md#cls-NedPublicKey)

<a id="m-getreadtimeout-640fc089c1de"></a>
### getReadTimeout()

```java
public int getReadTimeout()
```

<a id="m-getremoteuser-bdfb4a23b5ff"></a>
### getRemoteUser()

```java
public String getRemoteUser()
```

<a id="m-getsecondarypassword-34fb12bcee21"></a>
### getSecondaryPassword()

```java
public String getSecondaryPassword()
```

<a id="m-getserverkeymismatch-397bbe151bff"></a>
### getServerKeyMismatch()

```java
protected boolean getServerKeyMismatch()
```

<a id="m-getsourceaddress-873953ea3b38"></a>
### getSourceAddress()

```java
public java.net.InetSocketAddress getSourceAddress()
```

<a id="m-getsshalgorithms-9546086e7915"></a>
### getSSHAlgorithms()

```java
public com.tailf.ned.NedCmd.NedSSHAlgorithms getSSHAlgorithms()
```

Types: [NedSSHAlgorithms](NedCmd/NedSSHAlgorithms.md#cls-NedSSHAlgorithms)

<a id="m-getstarttime-f237c63a0230"></a>
### getStartTime()

```java
public String getStartTime()
```

<a id="m-getstream-f9fafde50565"></a>
### getStream()

```java
public String getStream()
```

<a id="m-gettelemetrysettings-fbb071630f56"></a>
### getTelemetrySettings()

```java
public java.util.Map<String,java.util.List<String>> getTelemetrySettings()
```

<a id="m-gettimeout-c6606d7f7c00"></a>
### getTimeout()

```java
public int getTimeout()
```

<a id="m-gettoptag-4bbcffa59820"></a>
### getTopTag()

```java
public String getTopTag()
```

<a id="m-gettotransactionid-3beba3c28e0e"></a>
### getToTransactionId()

```java
public int getToTransactionId()
```

<a id="m-gettransaction-4f1c72a828a1"></a>
### getTransaction()

```java
public int getTransaction()
```

<a id="m-getusid-62d0ecfd68fd"></a>
### getUsid()

```java
public int getUsid()
```

<a id="m-getworkerid-80f0b625907c"></a>
### getWorkerId()

```java
public int getWorkerId()
```

<a id="m-getwritetimeout-866d6552aa46"></a>
### getWriteTimeout()

```java
public int getWriteTimeout()
```

<a id="m-getxpathintent-67290eec645d"></a>
### getXPathIntent()

```java
public String[] getXPathIntent()
```

<a id="m-isall-9d62c2f960b8"></a>
### isAll()

```java
public boolean isAll()
```

<a id="m-isforce-f9ef7f4abb1e"></a>
### isForce()

```java
public boolean isForce()
```

<a id="m-issuppresstransid-ea2b7aa87e80"></a>
### isSuppressTransId()

```java
public boolean isSuppressTransId()
```

<a id="m-istrace-98fd54ca3d6c"></a>
### isTrace()

```java
public boolean isTrace()
```

<a id="m-isverbose-224af8693204"></a>
### isVerbose()

```java
public boolean isVerbose()
```

<a id="m-parseops-4ab9ce41ccc1"></a>
### parseOps(ConfEList)

```java
public final com.tailf.ned.NedEditOp[] parseOps(com.tailf.proto.ConfEList l)
```

Types: [NedEditOp](NedEditOp.md#cls-NedEditOp), [ConfEList](../proto/ConfEList.md#cls-ConfEList)

**Parameters**

- `com.tailf.proto.ConfEList l`

<a id="m-setadditionalinfo-b262ce567572"></a>
### setAdditionalInfo(String)

```java
public void setAdditionalInfo(String info)
```

**Parameters**

- `String info`

<a id="m-setprovisionaltransid-e17c71c7b76d"></a>
### setProvisionalTransId(String)

```java
protected void setProvisionalTransId(String id)
```

**Parameters**

- `String id`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-verifyserverhostkey-df5f7c8ae1fe"></a>
### verifyServerHostKey(String, int, String, byte[])

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
