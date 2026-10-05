<a id="s-NedCmd"></a>
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

- [NedCmd(ConfETuple)](#s-NedCmd-1)

**Fields**:

- [ABORT_CLI](#s-ABORT_CLI)
- [ABORT_GENERIC](#s-ABORT_GENERIC)
- [CLOSE](#s-CLOSE)
- [CLOSE_ALL](#s-CLOSE_ALL)
- [CMD](#s-CMD)
- [COMMIT](#s-COMMIT)
- [CONFIG_MERGE](#s-CONFIG_MERGE)
- [CONFIG_REPLACE](#s-CONFIG_REPLACE)
- [CONNECT_CLI](#s-CONNECT_CLI)
- [CONNECT_GENERIC](#s-CONNECT_GENERIC)
- [CREATE_SUBSCRIPTION](#s-CREATE_SUBSCRIPTION)
- [CREATE_TELEMETRY_SUBSCRIPTION](#s-CREATE_TELEMETRY_SUBSCRIPTION)
- [FILTER_NONE](#s-FILTER_NONE)
- [FILTER_SUBTREE](#s-FILTER_SUBTREE)
- [FILTER_XPATH](#s-FILTER_XPATH)
- [GET_TRANS_ID](#s-GET_TRANS_ID)
- [INITIALIZE](#s-INITIALIZE)
- [IS_ALIVE](#s-IS_ALIVE)
- [KEEP_ALIVE](#s-KEEP_ALIVE)
- [KNOWN_ALGOS](#s-KNOWN_ALGOS)
- [NEW_THREAD](#s-NEW_THREAD)
- [NO_WORKER](#s-NO_WORKER)
- [NOCONNECT_CLI](#s-NOCONNECT_CLI)
- [NOCONNECT_GENERIC](#s-NOCONNECT_GENERIC)
- [NONE](#s-NONE)
- [PERSIST](#s-PERSIST)
- [PREPARE_CLI](#s-PREPARE_CLI)
- [PREPARE_DRY_CLI](#s-PREPARE_DRY_CLI)
- [PREPARE_DRY_GENERIC](#s-PREPARE_DRY_GENERIC)
- [PREPARE_GENERIC](#s-PREPARE_GENERIC)
- [RECONNECT](#s-RECONNECT)
- [REJECT_MISMATCH](#s-REJECT_MISMATCH)
- [REJECT_UNKNOWN](#s-REJECT_UNKNOWN)
- [RESTART](#s-RESTART)
- [REVERT_CLI](#s-REVERT_CLI)
- [REVERT_GENERIC](#s-REVERT_GENERIC)
- [SHOW_CLI](#s-SHOW_CLI)
- [SHOW_GENERIC](#s-SHOW_GENERIC)
- [SHOW_OFFLINE_CLI](#s-SHOW_OFFLINE_CLI)
- [SHOW_OFFLINE_GENERIC](#s-SHOW_OFFLINE_GENERIC)
- [SHOW_PARTIAL_CLI](#s-SHOW_PARTIAL_CLI)
- [SHOW_PARTIAL_GENERIC](#s-SHOW_PARTIAL_GENERIC)
- [SHOW_STATS_FILTER](#s-SHOW_STATS_FILTER)
- [SHOW_STATS_PATH](#s-SHOW_STATS_PATH)
- [STOP_THREAD](#s-STOP_THREAD)
- [SUBTREE](#s-SUBTREE)
- [UNINITIALIZE](#s-UNINITIALIZE)
- [XPATH](#s-XPATH)

**Methods**:

- [cmdString()](#s-cmdString)
- [cmdToDevicePhase(int)](#s-cmdToDevicePhase)
- [cmdToString(int)](#s-cmdToString)
- [getActionName()](#s-getActionName)
- [getAdditionalInfo()](#s-getAdditionalInfo)
- [getAuthOrder()](#s-getAuthOrder)
- [getCliConfigChars()](#s-getCliConfigChars)
- [getCmdPaths()](#s-getCmdPaths)
- [getCommand()](#s-getCommand)
- [getComment()](#s-getComment)
- [getConnectionId()](#s-getConnectionId)
- [getConnectTimeout()](#s-getConnectTimeout)
- [getDevice()](#s-getDevice)
- [getDevList()](#s-getDevList)
- [getFilter()](#s-getFilter)
- [getFilterIntent()](#s-getFilterIntent)
- [getFilterType()](#s-getFilterType)
- [getFilterTypeAsString()](#s-getFilterTypeAsString)
- [getFromTransactionId()](#s-getFromTransactionId)
- [getGenericConfigChars()](#s-getGenericConfigChars)
- [getHostKeyAlgos()](#s-getHostKeyAlgos)
- [getHostKeys()](#s-getHostKeys)
- [getHostKeyVerifAsString()](#s-getHostKeyVerifAsString)
- [getHostKeyVerifier()](#s-getHostKeyVerifier)
- [getHostKeyVerify()](#s-getHostKeyVerify)
- [getId()](#s-getId)
- [getIdentities(NedWorker)](#s-getIdentities)
- [getIP()](#s-getIP)
- [getKeyDir()](#s-getKeyDir)
- [getLabel()](#s-getLabel)
- [getLoadOp()](#s-getLoadOp)
- [getLocalUser()](#s-getLocalUser)
- [getMfaExecutable()](#s-getMfaExecutable)
- [getMfaOpaque()](#s-getMfaOpaque)
- [getOperations()](#s-getOperations)
- [getParams()](#s-getParams)
- [getPassword()](#s-getPassword)
- [getPath()](#s-getPath)
- [getPathIntent()](#s-getPathIntent)
- [getPaths()](#s-getPaths)
- [getPort()](#s-getPort)
- [getProtocol()](#s-getProtocol)
- [getProvisionalTransId()](#s-getProvisionalTransId)
- [getPublicKeys()](#s-getPublicKeys)
- [getReadTimeout()](#s-getReadTimeout)
- [getRemoteUser()](#s-getRemoteUser)
- [getSecondaryPassword()](#s-getSecondaryPassword)
- [getServerKeyMismatch()](#s-getServerKeyMismatch)
- [getSourceAddress()](#s-getSourceAddress)
- [getSSHAlgorithms()](#s-getSSHAlgorithms)
- [getStartTime()](#s-getStartTime)
- [getStream()](#s-getStream)
- [getTelemetrySettings()](#s-getTelemetrySettings)
- [getTimeout()](#s-getTimeout)
- [getTopTag()](#s-getTopTag)
- [getToTransactionId()](#s-getToTransactionId)
- [getTransaction()](#s-getTransaction)
- [getUsid()](#s-getUsid)
- [getWorkerId()](#s-getWorkerId)
- [getWriteTimeout()](#s-getWriteTimeout)
- [getXPathIntent()](#s-getXPathIntent)
- [isAll()](#s-isAll)
- [isForce()](#s-isForce)
- [isSuppressTransId()](#s-isSuppressTransId)
- [isTrace()](#s-isTrace)
- [isVerbose()](#s-isVerbose)
- [parseOps(ConfEList)](#s-parseOps)
- [setAdditionalInfo(String)](#s-setAdditionalInfo)
- [setProvisionalTransId(String)](#s-setProvisionalTransId)
- [toString()](#s-toString)
- [verifyServerHostKey(String, int, String, byte[])](#s-verifyServerHostKey)

**Nested Types**:

- [NedPublicKey](NedCmd/NedPublicKey.md#s-NedPublicKey)
- [NedSSHAlgorithms](NedCmd/NedSSHAlgorithms.md#s-NedSSHAlgorithms)

## Constructors

<a id="s-NedCmd-1"></a>
### NedCmd(ConfETuple)

```java
public NedCmd(com.tailf.proto.ConfETuple t) throws com.tailf.ned.NedException
```

Types: [ConfETuple](../proto/ConfETuple.md#s-ConfETuple), [NedException](NedException.md#s-NedException)

**Parameters**

- `com.tailf.proto.ConfETuple t`


## Fields

<a id="s-ABORT_CLI"></a>
### ABORT_CLI

```java
public static final int ABORT_CLI = 7;
```

<a id="s-ABORT_GENERIC"></a>
### ABORT_GENERIC

```java
public static final int ABORT_GENERIC = 8;
```

<a id="s-CLOSE"></a>
### CLOSE

```java
public static final int CLOSE = 14;
```

<a id="s-CLOSE_ALL"></a>
### CLOSE_ALL

```java
public static final int CLOSE_ALL = 15;
```

<a id="s-CMD"></a>
### CMD

```java
public static final int CMD = 17;
```

<a id="s-COMMIT"></a>
### COMMIT

```java
public static final int COMMIT = 6;
```

<a id="s-CONFIG_MERGE"></a>
### CONFIG_MERGE

```java
public static final int CONFIG_MERGE = 1;
```

<a id="s-CONFIG_REPLACE"></a>
### CONFIG_REPLACE

```java
public static final int CONFIG_REPLACE = 0;
```

<a id="s-CONNECT_CLI"></a>
### CONNECT_CLI

```java
public static final int CONNECT_CLI = 0;
```

<a id="s-CONNECT_GENERIC"></a>
### CONNECT_GENERIC

```java
public static final int CONNECT_GENERIC = 1;
```

<a id="s-CREATE_SUBSCRIPTION"></a>
### CREATE_SUBSCRIPTION

```java
public static final int CREATE_SUBSCRIPTION = 34;
```

<a id="s-CREATE_TELEMETRY_SUBSCRIPTION"></a>
### CREATE_TELEMETRY_SUBSCRIPTION

```java
public static final int CREATE_TELEMETRY_SUBSCRIPTION = 37;
```

<a id="s-FILTER_NONE"></a>
### FILTER_NONE

```java
public static final int FILTER_NONE = 0;
```

<a id="s-FILTER_SUBTREE"></a>
### FILTER_SUBTREE

```java
public static final int FILTER_SUBTREE = 2;
```

<a id="s-FILTER_XPATH"></a>
### FILTER_XPATH

```java
public static final int FILTER_XPATH = 1;
```

<a id="s-GET_TRANS_ID"></a>
### GET_TRANS_ID

```java
public static final int GET_TRANS_ID = 20;
```

<a id="s-INITIALIZE"></a>
### INITIALIZE

```java
public static final int INITIALIZE = 24;
```

<a id="s-IS_ALIVE"></a>
### IS_ALIVE

```java
public static final int IS_ALIVE = 22;
```

<a id="s-KEEP_ALIVE"></a>
### KEEP_ALIVE

```java
public static final int KEEP_ALIVE = 30;
```

<a id="s-KNOWN_ALGOS"></a>
### KNOWN_ALGOS

```java
public static final String[] KNOWN_ALGOS = null;
```

<a id="s-NEW_THREAD"></a>
### NEW_THREAD

```java
public static final int NEW_THREAD = 16;
```

<a id="s-NO_WORKER"></a>
### NO_WORKER

```java
public static final int NO_WORKER = -1;
```

<a id="s-NOCONNECT_CLI"></a>
### NOCONNECT_CLI

```java
public static final int NOCONNECT_CLI = 28;
```

<a id="s-NOCONNECT_GENERIC"></a>
### NOCONNECT_GENERIC

```java
public static final int NOCONNECT_GENERIC = 29;
```

<a id="s-NONE"></a>
### NONE

```java
public static final int NONE = 2;
```

<a id="s-PERSIST"></a>
### PERSIST

```java
public static final int PERSIST = 11;
```

<a id="s-PREPARE_CLI"></a>
### PREPARE_CLI

```java
public static final int PREPARE_CLI = 2;
```

<a id="s-PREPARE_DRY_CLI"></a>
### PREPARE_DRY_CLI

```java
public static final int PREPARE_DRY_CLI = 3;
```

<a id="s-PREPARE_DRY_GENERIC"></a>
### PREPARE_DRY_GENERIC

```java
public static final int PREPARE_DRY_GENERIC = 5;
```

<a id="s-PREPARE_GENERIC"></a>
### PREPARE_GENERIC

```java
public static final int PREPARE_GENERIC = 4;
```

<a id="s-RECONNECT"></a>
### RECONNECT

```java
public static final int RECONNECT = 23;
```

<a id="s-REJECT_MISMATCH"></a>
### REJECT_MISMATCH

```java
public static final int REJECT_MISMATCH = 1;
```

<a id="s-REJECT_UNKNOWN"></a>
### REJECT_UNKNOWN

```java
public static final int REJECT_UNKNOWN = 0;
```

<a id="s-RESTART"></a>
### RESTART

```java
public static final int RESTART = 21;
```

<a id="s-REVERT_CLI"></a>
### REVERT_CLI

```java
public static final int REVERT_CLI = 9;
```

<a id="s-REVERT_GENERIC"></a>
### REVERT_GENERIC

```java
public static final int REVERT_GENERIC = 10;
```

<a id="s-SHOW_CLI"></a>
### SHOW_CLI

```java
public static final int SHOW_CLI = 12;
```

<a id="s-SHOW_GENERIC"></a>
### SHOW_GENERIC

```java
public static final int SHOW_GENERIC = 13;
```

<a id="s-SHOW_OFFLINE_CLI"></a>
### SHOW_OFFLINE_CLI

```java
public static final int SHOW_OFFLINE_CLI = 32;
```

<a id="s-SHOW_OFFLINE_GENERIC"></a>
### SHOW_OFFLINE_GENERIC

```java
public static final int SHOW_OFFLINE_GENERIC = 33;
```

<a id="s-SHOW_PARTIAL_CLI"></a>
### SHOW_PARTIAL_CLI

```java
public static final int SHOW_PARTIAL_CLI = 26;
```

<a id="s-SHOW_PARTIAL_GENERIC"></a>
### SHOW_PARTIAL_GENERIC

```java
public static final int SHOW_PARTIAL_GENERIC = 27;
```

<a id="s-SHOW_STATS_FILTER"></a>
### SHOW_STATS_FILTER

```java
public static final int SHOW_STATS_FILTER = 36;
```

<a id="s-SHOW_STATS_PATH"></a>
### SHOW_STATS_PATH

```java
public static final int SHOW_STATS_PATH = 31;
```

<a id="s-STOP_THREAD"></a>
### STOP_THREAD

```java
public static final int STOP_THREAD = 35;
```

<a id="s-SUBTREE"></a>
### SUBTREE

```java
public static final String SUBTREE = "subtree";
```

<a id="s-UNINITIALIZE"></a>
### UNINITIALIZE

```java
public static final int UNINITIALIZE = 25;
```

<a id="s-XPATH"></a>
### XPATH

```java
public static final String XPATH = "xpath";
```


## Methods

<a id="s-cmdString"></a>
### cmdString()

```java
public String cmdString()
```

<a id="s-cmdToDevicePhase"></a>
### cmdToDevicePhase(int)

```java
public static String cmdToDevicePhase(int cmd)
```

**Parameters**

- `int cmd`

<a id="s-cmdToString"></a>
### cmdToString(int)

```java
public static String cmdToString(int cmd)
```

**Parameters**

- `int cmd`

<a id="s-getActionName"></a>
### getActionName()

```java
public String getActionName()
```

<a id="s-getAdditionalInfo"></a>
### getAdditionalInfo()

```java
public String getAdditionalInfo()
```

<a id="s-getAuthOrder"></a>
### getAuthOrder()

```java
public String[] getAuthOrder()
```

<a id="s-getCliConfigChars"></a>
### getCliConfigChars()

```java
public String getCliConfigChars()
```

<a id="s-getCmdPaths"></a>
### getCmdPaths()

```java
public String[] getCmdPaths()
```

<a id="s-getCommand"></a>
### getCommand()

```java
public int getCommand()
```

<a id="s-getComment"></a>
### getComment()

```java
public String getComment()
```

<a id="s-getConnectionId"></a>
### getConnectionId()

```java
public int getConnectionId()
```

<a id="s-getConnectTimeout"></a>
### getConnectTimeout()

```java
public int getConnectTimeout()
```

<a id="s-getDevice"></a>
### getDevice()

```java
public String getDevice()
```

<a id="s-getDevList"></a>
### getDevList()

```java
public java.util.Set<String> getDevList()
```

<a id="s-getFilter"></a>
### getFilter()

```java
public String getFilter()
```

<a id="s-getFilterIntent"></a>
### getFilterIntent()

```java
public com.tailf.ned.NedShowFilter[] getFilterIntent()
```

Types: [NedShowFilter](NedShowFilter.md#s-NedShowFilter)

<a id="s-getFilterType"></a>
### getFilterType()

```java
public int getFilterType()
```

<a id="s-getFilterTypeAsString"></a>
### getFilterTypeAsString()

```java
public String getFilterTypeAsString()
```

<a id="s-getFromTransactionId"></a>
### getFromTransactionId()

```java
public int getFromTransactionId()
```

<a id="s-getGenericConfigChars"></a>
### getGenericConfigChars()

```java
public String getGenericConfigChars()
```

<a id="s-getHostKeyAlgos"></a>
### getHostKeyAlgos()

```java
protected String[] getHostKeyAlgos()
```

<a id="s-getHostKeys"></a>
### getHostKeys()

```java
public com.tailf.ned.NedCmd.NedPublicKey[] getHostKeys()
```

Types: [NedPublicKey](NedCmd/NedPublicKey.md#s-NedPublicKey)

<a id="s-getHostKeyVerifAsString"></a>
### getHostKeyVerifAsString()

```java
public String getHostKeyVerifAsString()
```

<a id="s-getHostKeyVerifier"></a>
### getHostKeyVerifier()

```java
protected ch.ethz.ssh2.ServerHostKeyVerifier getHostKeyVerifier()
```

<a id="s-getHostKeyVerify"></a>
### getHostKeyVerify()

```java
public int getHostKeyVerify()
```

<a id="s-getId"></a>
### getId()

```java
public String getId()
```

<a id="s-getIdentities"></a>
### getIdentities(NedWorker)

```java
protected java.util.Collection<ch.ethz.ssh2.auth.AgentIdentity> getIdentities(
    com.tailf.ned.NedWorker worker
)
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="s-getIP"></a>
### getIP()

```java
public java.net.InetAddress getIP()
```

<a id="s-getKeyDir"></a>
### getKeyDir()

```java
public String getKeyDir()
```

<a id="s-getLabel"></a>
### getLabel()

```java
public String getLabel()
```

<a id="s-getLoadOp"></a>
### getLoadOp()

```java
public int getLoadOp()
```

<a id="s-getLocalUser"></a>
### getLocalUser()

```java
public String getLocalUser()
```

<a id="s-getMfaExecutable"></a>
### getMfaExecutable()

```java
public String getMfaExecutable()
```

<a id="s-getMfaOpaque"></a>
### getMfaOpaque()

```java
public String getMfaOpaque()
```

<a id="s-getOperations"></a>
### getOperations()

```java
public com.tailf.ned.NedEditOp[] getOperations()
```

Types: [NedEditOp](NedEditOp.md#s-NedEditOp)

<a id="s-getParams"></a>
### getParams()

```java
public com.tailf.conf.ConfXMLParam[] getParams()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam)

<a id="s-getPassword"></a>
### getPassword()

```java
public String getPassword()
```

<a id="s-getPath"></a>
### getPath()

```java
public com.tailf.conf.ConfPath getPath()
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

<a id="s-getPathIntent"></a>
### getPathIntent()

```java
public com.tailf.conf.ConfPath[] getPathIntent()
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

<a id="s-getPaths"></a>
### getPaths()

```java
public com.tailf.conf.ConfPath[] getPaths() throws com.tailf.conf.ConfException
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath), [ConfException](../conf/ConfException.md#s-ConfException)

<a id="s-getPort"></a>
### getPort()

```java
public int getPort()
```

<a id="s-getProtocol"></a>
### getProtocol()

```java
public String getProtocol()
```

<a id="s-getProvisionalTransId"></a>
### getProvisionalTransId()

```java
public String getProvisionalTransId()
```

<a id="s-getPublicKeys"></a>
### getPublicKeys()

```java
public com.tailf.ned.NedCmd.NedPublicKey[] getPublicKeys()
```

Types: [NedPublicKey](NedCmd/NedPublicKey.md#s-NedPublicKey)

<a id="s-getReadTimeout"></a>
### getReadTimeout()

```java
public int getReadTimeout()
```

<a id="s-getRemoteUser"></a>
### getRemoteUser()

```java
public String getRemoteUser()
```

<a id="s-getSecondaryPassword"></a>
### getSecondaryPassword()

```java
public String getSecondaryPassword()
```

<a id="s-getServerKeyMismatch"></a>
### getServerKeyMismatch()

```java
protected boolean getServerKeyMismatch()
```

<a id="s-getSourceAddress"></a>
### getSourceAddress()

```java
public java.net.InetSocketAddress getSourceAddress()
```

<a id="s-getSSHAlgorithms"></a>
### getSSHAlgorithms()

```java
public com.tailf.ned.NedCmd.NedSSHAlgorithms getSSHAlgorithms()
```

Types: [NedSSHAlgorithms](NedCmd/NedSSHAlgorithms.md#s-NedSSHAlgorithms)

<a id="s-getStartTime"></a>
### getStartTime()

```java
public String getStartTime()
```

<a id="s-getStream"></a>
### getStream()

```java
public String getStream()
```

<a id="s-getTelemetrySettings"></a>
### getTelemetrySettings()

```java
public java.util.Map<String,java.util.List<String>> getTelemetrySettings()
```

<a id="s-getTimeout"></a>
### getTimeout()

```java
public int getTimeout()
```

<a id="s-getTopTag"></a>
### getTopTag()

```java
public String getTopTag()
```

<a id="s-getToTransactionId"></a>
### getToTransactionId()

```java
public int getToTransactionId()
```

<a id="s-getTransaction"></a>
### getTransaction()

```java
public int getTransaction()
```

<a id="s-getUsid"></a>
### getUsid()

```java
public int getUsid()
```

<a id="s-getWorkerId"></a>
### getWorkerId()

```java
public int getWorkerId()
```

<a id="s-getWriteTimeout"></a>
### getWriteTimeout()

```java
public int getWriteTimeout()
```

<a id="s-getXPathIntent"></a>
### getXPathIntent()

```java
public String[] getXPathIntent()
```

<a id="s-isAll"></a>
### isAll()

```java
public boolean isAll()
```

<a id="s-isForce"></a>
### isForce()

```java
public boolean isForce()
```

<a id="s-isSuppressTransId"></a>
### isSuppressTransId()

```java
public boolean isSuppressTransId()
```

<a id="s-isTrace"></a>
### isTrace()

```java
public boolean isTrace()
```

<a id="s-isVerbose"></a>
### isVerbose()

```java
public boolean isVerbose()
```

<a id="s-parseOps"></a>
### parseOps(ConfEList)

```java
public final com.tailf.ned.NedEditOp[] parseOps(com.tailf.proto.ConfEList l)
```

Types: [NedEditOp](NedEditOp.md#s-NedEditOp), [ConfEList](../proto/ConfEList.md#s-ConfEList)

**Parameters**

- `com.tailf.proto.ConfEList l`

<a id="s-setAdditionalInfo"></a>
### setAdditionalInfo(String)

```java
public void setAdditionalInfo(String info)
```

**Parameters**

- `String info`

<a id="s-setProvisionalTransId"></a>
### setProvisionalTransId(String)

```java
protected void setProvisionalTransId(String id)
```

**Parameters**

- `String id`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-verifyServerHostKey"></a>
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

- [NedPublicKey](NedCmd/NedPublicKey.md)
- [NedSSHAlgorithms](NedCmd/NedSSHAlgorithms.md)
