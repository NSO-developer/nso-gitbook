# NedCliBaseTemplate <a href="#nedclibasetemplate-f082ac37583c" id="nedclibasetemplate-f082ac37583c"></a>

```java
public class com.tailf.ned.NedCliBaseTemplate
    extends com.tailf.ned.NedCliBase
```

Types: [NedCliBase](NedCliBase.md#nedclibase-cb59203c2e29)

This class implements NED CLI template

## Members

**Constructors**:

- [NedCliBaseTemplate\(\)](#nedclibasetemplate-e3cd7d53da2b)
- [NedCliBaseTemplate\(String, InetAddress, int, String, String, String, String, boolean, int, int, int, NedMux, NedWorker\)](#nedclibasetemplate-c183924d4e06)

**Fields**:

- [connection](#connection-10cb65e4a7bd)
- [connectTimeout](#connecttimeout-da6f2bf6befb)
- [device\_id](#device_id-b23d313b9b98)
- [ip](#ip-47c04d6ce4c0)
- [mux](#mux-bdb6413b8b1f)
- [pass](#pass-4fd8d65070e9)
- [port](#port-93a59be61bfd)
- [proto](#proto-c874ba0c5a00)
- [readTimeout](#readtimeout-0c3689315cf4)
- [ruser](#ruser-f88f1be99f7d)
- [secpass](#secpass-eef0de0e9549)
- [session](#session-19c952d171f3)
- [sshClient](NedConnectionBase.md#sshclient-f55984dcf633) from NedConnectionBase
- [trace](#trace-6a8edda0bb8c)
- [tracer](#tracer-4049ab34cc3a)
- [writeTimeout](#writetimeout-6a827dc49d49)

**Methods**:

- [abort\(NedWorker, String\)](#abort-e0e56f7ce202)
- [applyConfig\(NedWorker, int, String\)](#applyconfig-7b024768cd7e)
- [close\(\)](#close-8107c6dc012b)
- [close\(NedWorker\)](#close-30f80583fb17)
- [command\(NedWorker, String, ConfXMLParam\[\]\)](#command-e9b29b4222a3)
- [commit\(NedWorker, int\)](#commit-7dc36c07ab47)
- [createSubscription\(NedWorker, String, String, String, int\)](NedConnectionBase.md#createsubscription-79162376c959) from NedConnectionBase
- [createTelemetrySubscription\(NedWorker, Map\<String,List\<String\>\>\)](NedConnectionBase.md#createtelemetrysubscription-c3b822b943ab) from NedConnectionBase
- [device\_id\(\)](#device_id-f50bb7031536)
- [getCapas\(\)](NedConnectionBase.md#getcapas-7f9d1774e7a0) from NedConnectionBase
- [getConnectionId\(\)](NedConnectionBase.md#getconnectionid-600ebb3e7d7f) from NedConnectionBase
- [getPlatformData\(\)](NedConnectionBase.md#getplatformdata-aa820968b919) from NedConnectionBase
- [getStatsCapas\(\)](NedConnectionBase.md#getstatscapas-aa8dc0859e62) from NedConnectionBase
- [getTimeInPool\(\)](NedConnectionBase.md#gettimeinpool-df6d5c843d53) from NedConnectionBase
- [getTransactionIdMode\(\)](NedConnectionBase.md#gettransactionidmode-79b4efc0e31d) from NedConnectionBase
- [getTransId\(NedWorker\)](#gettransid-01de732a93e8)
- [getUseStoredCapas\(\)](NedConnectionBase.md#getusestoredcapas-77d5f5640e81) from NedConnectionBase
- [getWantRevertDiff\(\)](NedConnectionBase.md#getwantrevertdiff-ddea9ec7db21) from NedConnectionBase
- [handshake\(NedWorker\)](#handshake-602ba649a458)
- [identity\(\)](#identity-16b9d59e26e7)
- [initialize\(NedWorker\)](NedConnectionBase.md#initialize-b9daf0f9b461) from NedConnectionBase
- [initNoConnect\(String, NedMux, NedWorker\)](NedCliBase.md#initnoconnect-d8b0c37173df) from NedCliBase
- [isAlive\(NedWorker\)](#isalive-6915ae01ec8a)
- [isConnection\(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int\)](#isconnection-83e14a2692f7)
- [isSessionAlive\(NedWorker\)](NedConnectionBase.md#issessionalive-f0d233ff28c0) from NedConnectionBase
- [keepAlive\(NedWorker\)](NedConnectionBase.md#keepalive-92dcaaf81a7a) from NedConnectionBase
- [keepSessionAlive\(NedWorker\)](NedConnectionBase.md#keepsessionalive-f2332bacddd5) from NedConnectionBase
- [modules\(\)](#modules-15ef53dcaf36)
- [newConnection\(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int, NedMux, NedWorker\)](#newconnection-00bd117e5875)
- [persist\(NedWorker\)](#persist-a67bc9247622)
- [prepare\(NedWorker, String\)](#prepare-ed9e4d4b6a29)
- [prepareDry\(NedWorker, String\)](#preparedry-169e1f01784c)
- [quote\(String\)](#quote-5785a7e30ac4)
- [reconnect\(NedWorker\)](#reconnect-a7a5900d41d6)
- [retrieveIdentity\(NedConnectionBase\)](NedConnectionBase.md#retrieveidentity-910704c2eafa) from NedConnectionBase
- [revert\(NedWorker, String\)](#revert-5ad837ca98a4)
- [setCapabilities\(NedCapability\[\]\)](NedConnectionBase.md#setcapabilities-67ad7861715a) from NedConnectionBase
- [setConnectionData\(NedCapability\[\], NedCapability\[\], boolean, TransactionIdMode\)](NedConnectionBase.md#setconnectiondata-3c1697dcc350) from NedConnectionBase
- [setConnectionId\(int\)](NedConnectionBase.md#setconnectionid-7eea4fea28bf) from NedConnectionBase
- [setPlatformData\(ConfXMLParam\[\]\)](NedConnectionBase.md#setplatformdata-a069c83c8fde) from NedConnectionBase
- [setPoolTimestamp\(long\)](NedConnectionBase.md#setpooltimestamp-28239e3d2dc4) from NedConnectionBase
- [setupSSH\(NedWorker\)](#setupssh-e795823b6e87)
- [setupTelnet\(NedWorker\)](#setuptelnet-0c5e791a6b66)
- [show\(NedWorker, String\)](#show-5a497cd9b854)
- [showOffline\(NedWorker, String, String\)](NedCliBase.md#showoffline-4a83874bc32c) from NedCliBase
- [showPartial\(NedWorker, ConfPath\[\]\)](NedCliBase.md#showpartial-aa998f554abd) from NedCliBase
- [showPartial\(NedWorker, ConfPath\[\], String\[\]\)](NedCliBase.md#showpartial-d37a025ae7ee) from NedCliBase
- [showStatsFilter\(NedWorker, int, ConfPath\[\]\)](NedConnectionBase.md#showstatsfilter-f3bd9d17b71c) from NedConnectionBase
- [showStatsFilter\(NedWorker, int, NedShowFilter\[\]\)](NedConnectionBase.md#showstatsfilter-1410355f6f46) from NedConnectionBase
- [showStatsFilter\(NedWorker, int, String\[\]\)](NedConnectionBase.md#showstatsfilter-38409a8f79a0) from NedConnectionBase
- [showStatsPath\(NedWorker, int, ConfPath\)](NedConnectionBase.md#showstatspath-1704122a5ac4) from NedConnectionBase
- [string\_dequote\(String\)](#string_dequote-74ef73b493ff)
- [string\_quote\(String\)](#string_quote-3abeed221bc3)
- [toString\(\)](#tostring-e9d48c5503ef)
- [trace\(NedWorker, String, String\)](#trace-a95f19736f87)
- [type\(\)](#type-7a4a5f26039a)
- [uninitialize\(NedWorker\)](NedConnectionBase.md#uninitialize-bba07dcc2d37) from NedConnectionBase
- [unquote\(String\)](#unquote-bdee91b3a426)
- [useStoredCapabilities\(\)](NedConnectionBase.md#usestoredcapabilities-06864caacb8f) from NedConnectionBase

**Nested Types**:

- [ApplyException](NedCliBaseTemplate/ApplyException.md#applyexception-64694ca56419)

## Constructors

### NedCliBaseTemplate() <a href="#nedclibasetemplate-e3cd7d53da2b" id="nedclibasetemplate-e3cd7d53da2b"></a>

```java
public NedCliBaseTemplate()
```

### NedCliBaseTemplate(String, InetAddress, int, String, String, String, String, boolean, int, int, int, NedMux, NedWorker) <a href="#nedclibasetemplate-c183924d4e06" id="nedclibasetemplate-c183924d4e06"></a>

```java
public NedCliBaseTemplate(
    String deviceId,
    java.net.InetAddress ip,
    int port,
    String proto,
    String ruser,
    String pass,
    String secpass,
    boolean trace,
    int connectTimeout,
    int readTimeout,
    int writeTimeout,
    com.tailf.ned.NedMux mux,
    com.tailf.ned.NedWorker worker
)
```

Types: [NedMux](NedMux.md#nedmux-646886956a86), [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `String deviceId`
- `java.net.InetAddress ip`
- `int port`
- `String proto`
- `String ruser`
- `String pass`
- `String secpass`
- `boolean trace`
- `int connectTimeout`
- `int readTimeout`
- `int writeTimeout`
- `com.tailf.ned.NedMux mux`
- `com.tailf.ned.NedWorker worker`


## Fields

### connection <a href="#connection-10cb65e4a7bd" id="connection-10cb65e4a7bd"></a>

```java
public com.tailf.ned.SSHConnection connection;
```

Types: [SSHConnection](SSHConnection.md#sshconnection-b3d3a2094429)

### connectTimeout <a href="#connecttimeout-da6f2bf6befb" id="connecttimeout-da6f2bf6befb"></a>

```java
public int connectTimeout;
```

### device_id <a href="#device_id-b23d313b9b98" id="device_id-b23d313b9b98"></a>

```java
public String device_id;
```

### ip <a href="#ip-47c04d6ce4c0" id="ip-47c04d6ce4c0"></a>

```java
public java.net.InetAddress ip;
```

### mux <a href="#mux-bdb6413b8b1f" id="mux-bdb6413b8b1f"></a>

```java
public com.tailf.ned.NedMux mux;
```

Types: [NedMux](NedMux.md#nedmux-646886956a86)

### pass <a href="#pass-4fd8d65070e9" id="pass-4fd8d65070e9"></a>

```java
public String pass;
```

### port <a href="#port-93a59be61bfd" id="port-93a59be61bfd"></a>

```java
public int port;
```

### proto <a href="#proto-c874ba0c5a00" id="proto-c874ba0c5a00"></a>

```java
public String proto;
```

### readTimeout <a href="#readtimeout-0c3689315cf4" id="readtimeout-0c3689315cf4"></a>

```java
public int readTimeout;
```

### ruser <a href="#ruser-f88f1be99f7d" id="ruser-f88f1be99f7d"></a>

```java
public String ruser;
```

### secpass <a href="#secpass-eef0de0e9549" id="secpass-eef0de0e9549"></a>

```java
public String secpass;
```

### session <a href="#session-19c952d171f3" id="session-19c952d171f3"></a>

```java
public com.tailf.ned.CliSession session;
```

Types: [CliSession](CliSession.md#clisession-1e55c4457237)

### trace <a href="#trace-6a8edda0bb8c" id="trace-6a8edda0bb8c"></a>

```java
public boolean trace;
```

### tracer <a href="#tracer-4049ab34cc3a" id="tracer-4049ab34cc3a"></a>

```java
public com.tailf.ned.NedTracer tracer;
```

Types: [NedTracer](NedTracer.md#nedtracer-f8730263f5f2)

### writeTimeout <a href="#writetimeout-6a827dc49d49" id="writetimeout-6a827dc49d49"></a>

```java
public int writeTimeout;
```


## Methods

### abort(NedWorker, String) <a href="#abort-e0e56f7ce202" id="abort-e0e56f7ce202"></a>

```java
public void abort(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

*Description from* [`NedCliBase.abort(com.tailf.ned.NedWorker, String)`](NedCliBase.md#abort-e0e56f7ce202)

Is invoked by NCS to abort the configuration to the state before the
 previous prepare() invocation. The NCS has calculated the commands needed
 to reach that state from the current state. The instance may choose
 to use there commands, or use some other mechanism to reach the same
 state. When the operation is completed it should invoke the
 w.abortResponse() method in the NedWorker.

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication
between NCS and the device. This NedWorker instance should be
used when communicating with the NCS, ie for sending responses,
errors, and trace messages. It is also implements the NedTracer
API and can be used in, for example, the SSHSession as a tracer.
- `String data` - is the commands for taking the config back to the previous
state. The commands are generated using the YANG data
model in combination with the tailf: extensions to guide the
mapping.

### applyConfig(NedWorker, int, String) <a href="#applyconfig-7b024768cd7e" id="applyconfig-7b024768cd7e"></a>

```java
public void applyConfig(
    com.tailf.ned.NedWorker worker,
    int cmd,
    String data
)
    throws com.tailf.ned.NedException, java.io.IOException, com.tailf.ned.SSHSessionException, com.tailf.ned.NedCliBaseTemplate.ApplyException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [NedException](NedException.md#nedexception-9d3a19f3640e), [SSHSessionException](SSHSessionException.md#sshsessionexception-971db2359ab1), [ApplyException](NedCliBaseTemplate/ApplyException.md#applyexception-64694ca56419)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `int cmd`
- `String data`

### close() <a href="#close-8107c6dc012b" id="close-8107c6dc012b"></a>

```java
public void close()
```

*Description from* [`NedConnectionBase.close()`](NedConnectionBase.md#close-8107c6dc012b)

This method is invoked when a connection close is forced and no
 NedWorker is involved. This typically occurs when a connection
 is removed from the connection pool. No response or trace
 messages can be sent during the operation.

### close(NedWorker) <a href="#close-30f80583fb17" id="close-30f80583fb17"></a>

```java
public void close(
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.NedException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [NedException](NedException.md#nedexception-9d3a19f3640e)

*Description from* [`NedConnectionBase.close(com.tailf.ned.NedWorker)`](NedConnectionBase.md#close-30f80583fb17)

This method is invoked when the connection is terminated. It is
 not invoked when placing the connection in the connection pool.
 No response is required, but trace messages may be generated
 during the close down.

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication between NCS and the device. This NedWorker
instance should be used when communicating with NCS, i.e,
for sending responses, errors, and trace messages. It is also
implements the NedTracer API and can be used in, for example,
the SSHSession as a tracer.

### command(NedWorker, String, ConfXMLParam[]) <a href="#command-e9b29b4222a3" id="command-e9b29b4222a3"></a>

```java
public void command(
    com.tailf.ned.NedWorker worker,
    String cmdname,
    com.tailf.conf.ConfXMLParam[] p
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

*Description from* [`NedConnectionBase.command(com.tailf.ned.NedWorker, String, com.tailf.conf.ConfXMLParam[])`](NedConnectionBase.md#command-e9b29b4222a3)

This is for any optional commands on the device that are
 not part of the yang files config data, but is modeled as
 tailf:actions or rpcs in the device yang files.

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication between NCS and the device. This NedWorker
instance should be used when communicating with NCS, i.e,
for sending responses, errors, and trace messages. It is also
implements the NedTracer API and can be used in, for example,
the SSHSession as a tracer.
- `String cmdname` - Name of the command (path to action?)
- `com.tailf.conf.ConfXMLParam[] p`

### commit(NedWorker, int) <a href="#commit-7dc36c07ab47" id="commit-7dc36c07ab47"></a>

```java
public void commit(com.tailf.ned.NedWorker worker, int timeout) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

*Description from* [`NedConnectionBase.commit(com.tailf.ned.NedWorker, int)`](NedConnectionBase.md#commit-7dc36c07ab47)

This indicates that the current set of operations should be
 committed to the running configuration. When completed the
 w.commitResponse() method should be invoked. Devices that does
 not support commit() should invoke the w.commitResponse() method
 without delay. On error invoke the w.error(NedCmd.COMMIT,
 Error, Reason) method.

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication between NCS and the device. This NedWorker
instance should be used when communicating with NCS, i.e,
for sending responses, errors, and trace messages. It is also
implements the NedTracer API and can be used in, for example,
the SSHSession as a tracer.
- `int timeout` - If the commit operation does not complete within 'timeout' seconds
the operation should be aborted.

### device_id() <a href="#device_id-f50bb7031536" id="device_id-f50bb7031536"></a>

```java
public String device_id()
```

*Description from* [`NedConnectionBase.device_id()`](NedConnectionBase.md#device_id-f50bb7031536)

The device id is originally provided by NCS to properly identify
 the device. It is the name used for the device by NCS in the
 list of devices.

### getTransId(NedWorker) <a href="#gettransid-01de732a93e8" id="gettransid-01de732a93e8"></a>

```java
public void getTransId(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

*Description from* [`NedConnectionBase.getTransId(com.tailf.ned.NedWorker)`](NedConnectionBase.md#gettransid-01de732a93e8)

When this method is invoked the NED should produce a transaction
 id that must be changed if any changes has been made to the
 configuration since the last time the transaction id was requested.
 The transaction id can either be requested from the system,
 or calculated by the callback, for example by calculating an
 MD5 checksum of the configuration text.

The method should indicate its return status by invoking
the method w.error() or w.getTransIdResponse()

The method should be implemented if the NED claimed
a NedWorker.TransactionIdMode which is not NONE
in setConnectionData().

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication between NCS and the device. This NedWorker
instance should be used when communicating with NCS, i.e,
for sending responses, errors, and trace messages. It is also
implements the NedTracer API and can be used in, for example,
the SSHSession as a tracer.

### handshake(NedWorker) <a href="#handshake-602ba649a458" id="handshake-602ba649a458"></a>

```java
public void handshake(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### identity() <a href="#identity-16b9d59e26e7" id="identity-16b9d59e26e7"></a>

```java
public String identity()
```

*Description from* [`NedConnectionBase.identity()`](NedConnectionBase.md#identity-16b9d59e26e7)

This should return the a unique (among registered NedConnection classes)
 identity. It will be used by NCS when creating new connections to
 control which of the registered NedConnection classes to use.

### isAlive(NedWorker) <a href="#isalive-6915ae01ec8a" id="isalive-6915ae01ec8a"></a>

```java
public boolean isAlive(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

*Description from* [`NedConnectionBase.isAlive(com.tailf.ned.NedWorker)`](NedConnectionBase.md#isalive-6915ae01ec8a)

This method is invoked to check if a connection is still
 alive. When a connection is stored in the connection pool
 it will periodically be polled to see if it is alive. If
 false is returned the connection will be closed using the
 close() method invocation.

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication between NCS and the device. This NedWorker
instance should be used when communicating with NCS, i.e,
for sending responses, errors, and trace messages. It is also
implements the NedTracer API and can be used in, for example,
the SSHSession as a tracer.

### isConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int) <a href="#isconnection-83e14a2692f7" id="isconnection-83e14a2692f7"></a>

```java
public boolean isConnection(
    String deviceId,
    java.net.InetAddress ip,
    int port,
    String proto,
    String ruser,
    String pass,
    String secpass,
    String keydir,
    boolean trace,
    int connectTimeout,
    int readTimeout,
    int writeTimeout
)
```

*Description from* [`NedCliBase.isConnection(String, java.net.InetAddress, int, String, String, String, String, String, boolean, int, int, int)`](NedCliBase.md#isconnection-83e14a2692f7)

Used by the connection pool to find a matching connection. If
 the current connection is has the same parameters it should return
 true, otherwise false.

**Parameters**

- `String deviceId` - name of device
- `java.net.InetAddress ip` - address to connect to device
- `int port` - port to connect to
- `String proto` - ssh or telnet
- `String ruser` - name of user to connect as
- `String pass` - password to use when connecting
- `String secpass` - secondary password to use when entering config mode,
set to empty string if not configured in the authgroup
- `String keydir`
- `boolean trace` - indicates if raw trace messages should be generated or not
- `int connectTimeout` - in milliseconds
- `int readTimeout` - in milliseconds
- `int writeTimeout` - in milliseconds

### modules() <a href="#modules-15ef53dcaf36" id="modules-15ef53dcaf36"></a>

```java
public String[] modules()
```

*Description from* [`NedConnectionBase.modules()`](NedConnectionBase.md#modules-15ef53dcaf36)

Which YANG modules are covered by the class instance. This information
 is defined by the setConnectionData() call and is sent to NCS after
 initiating a new connection, or when re-establishing a connection.
 The modules() method is not actually used.

### newConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int, NedMux, NedWorker) <a href="#newconnection-00bd117e5875" id="newconnection-00bd117e5875"></a>

```java
public com.tailf.ned.NedCliBase newConnection(
    String deviceId,
    java.net.InetAddress ip,
    int port,
    String proto,
    String ruser,
    String pass,
    String secpass,
    String publicKeyDir,
    boolean trace,
    int connectTimeout,
    int readTimeout,
    int writeTimeout,
    com.tailf.ned.NedMux mux,
    com.tailf.ned.NedWorker worker
)
```

Types: [NedCliBase](NedCliBase.md#nedclibase-cb59203c2e29), [NedMux](NedMux.md#nedmux-646886956a86), [NedWorker](NedWorker.md#nedworker-b063de7c0998)

*Description from* [`NedCliBase.newConnection(String, java.net.InetAddress, int, String, String, String, String, String, boolean, int, int, int, com.tailf.ned.NedMux, com.tailf.ned.NedWorker)`](NedCliBase.md#newconnection-00bd117e5875)

Establish a new connection to a device and send response to
 NCS with information about the device. This information is set by
 using the setConnectionData() method.
 A new instance representing the new connection should
 be returned. That instance will then be used for further communication
 with the device. Different worker instances may be used for that
 communication and the instance cannot assume that the worker used in
 this invocation will be the same used for the invocations of the
 prepare, abort, revert, persist, show, etc methods.

**Parameters**

- `String deviceId` - name of device
- `java.net.InetAddress ip` - address to connect to device
- `int port` - port to connect to
- `String proto` - ssh or telnet
- `String ruser` - name of user to connect as
- `String pass` - password to use when connecting
- `String secpass` - secondary password to use when entering config mode,
set to empty string if not configured in the authgroup
- `String publicKeyDir` - directory to read public keys. null if password is
given
- `boolean trace` - indicates if raw trace messages should be generated or not
- `int connectTimeout` - in milliseconds
- `int readTimeout` - in milliseconds
- `int writeTimeout` - in milliseconds
- `com.tailf.ned.NedMux mux`
- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication
between NCS and the device. This NedWorker instance should be
used when communicating with the NCS, ie for sending responses,
errors, and trace messages. It is also implements the NedTracer
API and can be used in, for example, the SSHSession as a tracer.

**Returns:** the connection instance

### persist(NedWorker) <a href="#persist-a67bc9247622" id="persist-a67bc9247622"></a>

```java
public void persist(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

*Description from* [`NedConnectionBase.persist(com.tailf.ned.NedWorker)`](NedConnectionBase.md#persist-a67bc9247622)

This method is invoked when the currently committed change set
 should be made permanent. This corresponds to copying the
 running configuration to the startup configuration, on a
 running/startup device, or issuing the confirming commit operation
 on a device that supports that. When completed the
 w.persistResponse() should be invoked. On error invoke the
 w.error(NedCmd.PERSIST,Error, Reason) method.

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication between NCS and the device. This NedWorker
instance should be used when communicating with NCS, i.e,
for sending responses, errors, and trace messages. It is also
implements the NedTracer API and can be used in, for example,
the SSHSession as a tracer.

### prepare(NedWorker, String) <a href="#prepare-ed9e4d4b6a29" id="prepare-ed9e4d4b6a29"></a>

```java
public void prepare(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

*Description from* [`NedCliBase.prepare(com.tailf.ned.NedWorker, String)`](NedCliBase.md#prepare-ed9e4d4b6a29)

Is invoked by NCS to take the configuration to a new state. The Ned may
 choose to apply the changes directly to the device, preferably to a
 candidate
 configuration, but if the device lacks candidate support it may choose
 to apply the changes directly to the running config (typically the case
 on IOS like boxes). If the configuration changes are later aborted, or
 reverted, the NCS will provide the necessary commands for restoring the
 configuration to its previous state. The device should invoke the
 w.prepareResponse() when the operation is completed.

initialize (prepare transaction)
/ \\
/   uninitialize (undo preparations)
v
prepare (send data to device)
/   \\
v     v
abort | commit(send confirmed commit (ios would do noop))
/   \\
v     v
revert | persist (send confirming commit)

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication
between NCS and the device. This NedWorker instance should be
used when communicating with the NCS, ie for sending responses,
errors, and trace messages. It is also implements the NedTracer
API and can be used in, for example, the SSHSession as a tracer.
- `String data` - is the CLI commands for transforming the configuration to
a new state. The commands are generated using the YANG data
model in combination with the tailf: extensions to guide the
mapping.

### prepareDry(NedWorker, String) <a href="#preparedry-169e1f01784c" id="preparedry-169e1f01784c"></a>

```java
public void prepareDry(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

*Description from* [`NedCliBase.prepareDry(com.tailf.ned.NedWorker, String)`](NedCliBase.md#preparedry-169e1f01784c)

Is invoked by NCS to tell the NED what actions it should take towards
 the device if it should do a prepare.

 The NED should invoke the method
 [prepareDryResponse\(\)](NedWorker.md#preparedryresponse-4249bd793b22)
 when the operation is completed. If no changes needs to be done
 just answer `prepareDryResponse(data)`

 If an error is detected answer this through a call to
 [error\(\)](NedWorker.md#error-ef653fe52f55)
 in `NedWorker w`.

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication
between NCS and the device. This NedWorker instance should be
used when communicating with the NCS, ie for sending responses,
errors, and trace messages. It is also implements the
[`NedTracer`](NedTracer.md#nedtracer-f8730263f5f2)
API and can be used in, for example, the [`SSHSession`](SSHSession.md#sshsession-2d9642a66770)
as a tracer.
- `String data` - is the CLI commands for transforming the configuration to
a new state. The commands are generated using the YANG data
model in combination with the tailf: extensions to guide the
mapping.

### quote(String) <a href="#quote-5785a7e30ac4" id="quote-5785a7e30ac4"></a>

```java
public String quote(String aText)
```

**Parameters**

- `String aText`

### reconnect(NedWorker) <a href="#reconnect-a7a5900d41d6" id="reconnect-a7a5900d41d6"></a>

```java
public void reconnect(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

*Description from* [`NedConnectionBase.reconnect(com.tailf.ned.NedWorker)`](NedConnectionBase.md#reconnect-a7a5900d41d6)

Used for resuming a connection found in the connection pool.

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication between NCS and the device. This NedWorker
instance should be used when communicating with NCS, i.e,
for sending responses, errors, and trace messages. It is also
implements the NedTracer API and can be used in, for example,
the SSHSession as a tracer.

### revert(NedWorker, String) <a href="#revert-5ad837ca98a4" id="revert-5ad837ca98a4"></a>

```java
public void revert(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

*Description from* [`NedCliBase.revert(com.tailf.ned.NedWorker, String)`](NedCliBase.md#revert-5ad837ca98a4)

Is invoked by NCS to undo the changes introduced in the last commit
 operation (communicated to the NED in the prepare method invocation).
 The difference between abort() and revert() is that revert() is invoked
 after commit() (but before persist), whereas abort() is invoked before
 commit(). Once the configuration has been made persistent by persist()
 it can no longer be restored to any previous  (potentially saved) state.
 When the revert operation has been completed the w.revertResponse()
 method should be called.

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication
between NCS and the device. This NedWorker instance should be
used when communicating with the NCS, ie for sending responses,
errors, and trace messages. It is also implements the NedTracer
API and can be used in, for example, the SSHSession as a tracer.
- `String data` - is the commands for taking the config back to the previous
state.

### setupSSH(NedWorker) <a href="#setupssh-e795823b6e87" id="setupssh-e795823b6e87"></a>

```java
public void setupSSH(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### setupTelnet(NedWorker) <a href="#setuptelnet-0c5e791a6b66" id="setuptelnet-0c5e791a6b66"></a>

```java
public void setupTelnet(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### show(NedWorker, String) <a href="#show-5a497cd9b854" id="show-5a497cd9b854"></a>

```java
public void show(com.tailf.ned.NedWorker worker, String toptag) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

*Description from* [`NedCliBase.show(com.tailf.ned.NedWorker, String)`](NedCliBase.md#show-5a497cd9b854)

Extract parts of the configuration and send it to NCS. The response
 is sent by invoking the w.showCliResponse() method in the provided
 NedWorker.

**Parameters**

- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
communication
between NCS and the device. This NedWorker instance should be
used when communicating with the NCS, ie for sending responses,
errors, and trace messages. It is also implements the NedTracer
API and can be used in, for example, the SSHSession as a tracer.
- `String toptag` - is the top level tag indicating which part of the config
should be extracted.

### string_dequote(String) <a href="#string_dequote-74ef73b493ff" id="string_dequote-74ef73b493ff"></a>

```java
@Deprecated
public String string_dequote(String aText)
```

**Parameters**

- `String aText`

**Deprecated:** Use [`unquote(String)`](NedCliBaseTemplate.md#unquote-bdee91b3a426) instead.

### string_quote(String) <a href="#string_quote-3abeed221bc3" id="string_quote-3abeed221bc3"></a>

```java
@Deprecated
public String string_quote(String aText)
```

**Parameters**

- `String aText`

**Deprecated:** Use [`quote(String)`](NedCliBaseTemplate.md#quote-5785a7e30ac4) instead.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### trace(NedWorker, String, String) <a href="#trace-a95f19736f87" id="trace-a95f19736f87"></a>

```java
public void trace(com.tailf.ned.NedWorker worker, String msg, String direction)
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String msg`
- `String direction`

### type() <a href="#type-7a4a5f26039a" id="type-7a4a5f26039a"></a>

```java
public String type()
```

*Description from* [`NedConnectionBase.type()`](NedConnectionBase.md#type-7a4a5f26039a)

The type is one of "cli" and "generic". This information is sent to
 NCS when the NedMux is started to let NCS know how to communicate
 with each device.

### unquote(String) <a href="#unquote-bdee91b3a426" id="unquote-bdee91b3a426"></a>

```java
public String unquote(String aText)
```

**Parameters**

- `String aText`
