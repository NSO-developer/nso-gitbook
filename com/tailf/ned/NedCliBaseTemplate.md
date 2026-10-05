# NedCliBaseTemplate <a href="#cls-NedCliBaseTemplate" id="cls-NedCliBaseTemplate"></a>

```java
public class com.tailf.ned.NedCliBaseTemplate
    extends com.tailf.ned.NedCliBase
```

Types: [NedCliBase](NedCliBase.md#cls-NedCliBase)

This class implements NED CLI template

## Members

**Constructors**:

- [NedCliBaseTemplate()](#m-NedCliBaseTemplate-e3cd7d53da2b)
- [NedCliBaseTemplate(String, InetAddress, int, String, String, String, String, boolean, int, int, int, NedMux, NedWorker)](#m-NedCliBaseTemplate-c183924d4e06)

**Fields**:

- [connection](#m-connection)
- [connectTimeout](#m-connectTimeout)
- [device_id](#m-device_id)
- [ip](#m-ip)
- [mux](#m-mux)
- [pass](#m-pass)
- [port](#m-port)
- [proto](#m-proto)
- [readTimeout](#m-readTimeout)
- [ruser](#m-ruser)
- [secpass](#m-secpass)
- [session](#m-session)
- [sshClient](NedConnectionBase.md#m-sshClient) from NedConnectionBase
- [trace](#m-trace)
- [tracer](#m-tracer)
- [writeTimeout](#m-writeTimeout)

**Methods**:

- [abort(NedWorker, String)](#m-abort-e0e56f7ce202)
- [applyConfig(NedWorker, int, String)](#m-applyConfig-7b024768cd7e)
- [close()](#m-close-8107c6dc012b)
- [close(NedWorker)](#m-close-30f80583fb17)
- [command(NedWorker, String, ConfXMLParam[])](#m-command-e9b29b4222a3)
- [commit(NedWorker, int)](#m-commit-7dc36c07ab47)
- [createSubscription(NedWorker, String, String, String, int)](NedConnectionBase.md#m-createSubscription-79162376c959) from NedConnectionBase
- [createTelemetrySubscription(NedWorker, Map<String,List<String>>)](NedConnectionBase.md#m-createTelemetrySubscription-c3b822b943ab) from NedConnectionBase
- [device_id()](#m-device_id-f50bb7031536)
- [getCapas()](NedConnectionBase.md#m-getCapas-7f9d1774e7a0) from NedConnectionBase
- [getConnectionId()](NedConnectionBase.md#m-getConnectionId-600ebb3e7d7f) from NedConnectionBase
- [getPlatformData()](NedConnectionBase.md#m-getPlatformData-aa820968b919) from NedConnectionBase
- [getStatsCapas()](NedConnectionBase.md#m-getStatsCapas-aa8dc0859e62) from NedConnectionBase
- [getTimeInPool()](NedConnectionBase.md#m-getTimeInPool-df6d5c843d53) from NedConnectionBase
- [getTransactionIdMode()](NedConnectionBase.md#m-getTransactionIdMode-79b4efc0e31d) from NedConnectionBase
- [getTransId(NedWorker)](#m-getTransId-01de732a93e8)
- [getUseStoredCapas()](NedConnectionBase.md#m-getUseStoredCapas-77d5f5640e81) from NedConnectionBase
- [getWantRevertDiff()](NedConnectionBase.md#m-getWantRevertDiff-ddea9ec7db21) from NedConnectionBase
- [handshake(NedWorker)](#m-handshake-602ba649a458)
- [identity()](#m-identity-16b9d59e26e7)
- [initialize(NedWorker)](NedConnectionBase.md#m-initialize-b9daf0f9b461) from NedConnectionBase
- [initNoConnect(String, NedMux, NedWorker)](NedCliBase.md#m-initNoConnect-d8b0c37173df) from NedCliBase
- [isAlive(NedWorker)](#m-isAlive-6915ae01ec8a)
- [isConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int)](#m-isConnection-83e14a2692f7)
- [isSessionAlive(NedWorker)](NedConnectionBase.md#m-isSessionAlive-f0d233ff28c0) from NedConnectionBase
- [keepAlive(NedWorker)](NedConnectionBase.md#m-keepAlive-92dcaaf81a7a) from NedConnectionBase
- [keepSessionAlive(NedWorker)](NedConnectionBase.md#m-keepSessionAlive-f2332bacddd5) from NedConnectionBase
- [modules()](#m-modules-15ef53dcaf36)
- [newConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int, NedMux, NedWorker)](#m-newConnection-00bd117e5875)
- [persist(NedWorker)](#m-persist-a67bc9247622)
- [prepare(NedWorker, String)](#m-prepare-ed9e4d4b6a29)
- [prepareDry(NedWorker, String)](#m-prepareDry-169e1f01784c)
- [quote(String)](#m-quote-5785a7e30ac4)
- [reconnect(NedWorker)](#m-reconnect-a7a5900d41d6)
- [retrieveIdentity(NedConnectionBase)](NedConnectionBase.md#m-retrieveIdentity-910704c2eafa) from NedConnectionBase
- [revert(NedWorker, String)](#m-revert-5ad837ca98a4)
- [setCapabilities(NedCapability[])](NedConnectionBase.md#m-setCapabilities-67ad7861715a) from NedConnectionBase
- [setConnectionData(NedCapability[], NedCapability[], boolean, TransactionIdMode)](NedConnectionBase.md#m-setConnectionData-3c1697dcc350) from NedConnectionBase
- [setConnectionId(int)](NedConnectionBase.md#m-setConnectionId-7eea4fea28bf) from NedConnectionBase
- [setPlatformData(ConfXMLParam[])](NedConnectionBase.md#m-setPlatformData-a069c83c8fde) from NedConnectionBase
- [setPoolTimestamp(long)](NedConnectionBase.md#m-setPoolTimestamp-28239e3d2dc4) from NedConnectionBase
- [setupSSH(NedWorker)](#m-setupSSH-e795823b6e87)
- [setupTelnet(NedWorker)](#m-setupTelnet-0c5e791a6b66)
- [show(NedWorker, String)](#m-show-5a497cd9b854)
- [showOffline(NedWorker, String, String)](NedCliBase.md#m-showOffline-4a83874bc32c) from NedCliBase
- [showPartial(NedWorker, ConfPath[])](NedCliBase.md#m-showPartial-aa998f554abd) from NedCliBase
- [showPartial(NedWorker, ConfPath[], String[])](NedCliBase.md#m-showPartial-d37a025ae7ee) from NedCliBase
- [showStatsFilter(NedWorker, int, ConfPath[])](NedConnectionBase.md#m-showStatsFilter-f3bd9d17b71c) from NedConnectionBase
- [showStatsFilter(NedWorker, int, NedShowFilter[])](NedConnectionBase.md#m-showStatsFilter-1410355f6f46) from NedConnectionBase
- [showStatsFilter(NedWorker, int, String[])](NedConnectionBase.md#m-showStatsFilter-38409a8f79a0) from NedConnectionBase
- [showStatsPath(NedWorker, int, ConfPath)](NedConnectionBase.md#m-showStatsPath-1704122a5ac4) from NedConnectionBase
- [string_dequote(String)](#m-string_dequote-74ef73b493ff)
- [string_quote(String)](#m-string_quote-3abeed221bc3)
- [toString()](#m-toString-e9d48c5503ef)
- [trace(NedWorker, String, String)](#m-trace-a95f19736f87)
- [type()](#m-type-7a4a5f26039a)
- [uninitialize(NedWorker)](NedConnectionBase.md#m-uninitialize-bba07dcc2d37) from NedConnectionBase
- [unquote(String)](#m-unquote-bdee91b3a426)
- [useStoredCapabilities()](NedConnectionBase.md#m-useStoredCapabilities-06864caacb8f) from NedConnectionBase

**Nested Types**:

- [ApplyException](NedCliBaseTemplate/ApplyException.md#cls-ApplyException)

## Constructors

### NedCliBaseTemplate() <a href="#m-NedCliBaseTemplate-e3cd7d53da2b" id="m-NedCliBaseTemplate-e3cd7d53da2b"></a>

```java
public NedCliBaseTemplate()
```

### NedCliBaseTemplate(String, InetAddress, int, String, String, String, String, boolean, int, int, int, NedMux, NedWorker) <a href="#m-NedCliBaseTemplate-c183924d4e06" id="m-NedCliBaseTemplate-c183924d4e06"></a>

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

Types: [NedMux](NedMux.md#cls-NedMux), [NedWorker](NedWorker.md#cls-NedWorker)

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

### connection <a href="#m-connection" id="m-connection"></a>

```java
public com.tailf.ned.SSHConnection connection = null;
```

Types: [SSHConnection](SSHConnection.md#cls-SSHConnection)

### connectTimeout <a href="#m-connectTimeout" id="m-connectTimeout"></a>

```java
public int connectTimeout = null;
```

### device_id <a href="#m-device_id" id="m-device_id"></a>

```java
public String device_id = null;
```

### ip <a href="#m-ip" id="m-ip"></a>

```java
public java.net.InetAddress ip = null;
```

### mux <a href="#m-mux" id="m-mux"></a>

```java
public com.tailf.ned.NedMux mux = null;
```

Types: [NedMux](NedMux.md#cls-NedMux)

### pass <a href="#m-pass" id="m-pass"></a>

```java
public String pass = null;
```

### port <a href="#m-port" id="m-port"></a>

```java
public int port = null;
```

### proto <a href="#m-proto" id="m-proto"></a>

```java
public String proto = null;
```

### readTimeout <a href="#m-readTimeout" id="m-readTimeout"></a>

```java
public int readTimeout = null;
```

### ruser <a href="#m-ruser" id="m-ruser"></a>

```java
public String ruser = null;
```

### secpass <a href="#m-secpass" id="m-secpass"></a>

```java
public String secpass = null;
```

### session <a href="#m-session" id="m-session"></a>

```java
public com.tailf.ned.CliSession session = null;
```

Types: [CliSession](CliSession.md#cls-CliSession)

### trace <a href="#m-trace" id="m-trace"></a>

```java
public boolean trace = null;
```

### tracer <a href="#m-tracer" id="m-tracer"></a>

```java
public com.tailf.ned.NedTracer tracer = null;
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

### writeTimeout <a href="#m-writeTimeout" id="m-writeTimeout"></a>

```java
public int writeTimeout = null;
```


## Methods

### abort(NedWorker, String) <a href="#m-abort-e0e56f7ce202" id="m-abort-e0e56f7ce202"></a>

```java
public void abort(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

### applyConfig(NedWorker, int, String) <a href="#m-applyConfig-7b024768cd7e" id="m-applyConfig-7b024768cd7e"></a>

```java
public void applyConfig(
    com.tailf.ned.NedWorker worker,
    int cmd,
    String data
)
    throws com.tailf.ned.NedException, java.io.IOException, com.tailf.ned.SSHSessionException, com.tailf.ned.NedCliBaseTemplate.ApplyException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedException](NedException.md#cls-NedException), [SSHSessionException](SSHSessionException.md#cls-SSHSessionException), [ApplyException](NedCliBaseTemplate/ApplyException.md#cls-ApplyException)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `int cmd`
- `String data`

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public void close()
```

### close(NedWorker) <a href="#m-close-30f80583fb17" id="m-close-30f80583fb17"></a>

```java
public void close(
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.NedException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### command(NedWorker, String, ConfXMLParam[]) <a href="#m-command-e9b29b4222a3" id="m-command-e9b29b4222a3"></a>

```java
public void command(
    com.tailf.ned.NedWorker worker,
    String cmdname,
    com.tailf.conf.ConfXMLParam[] p
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String cmdname`
- `com.tailf.conf.ConfXMLParam[] p`

### commit(NedWorker, int) <a href="#m-commit-7dc36c07ab47" id="m-commit-7dc36c07ab47"></a>

```java
public void commit(com.tailf.ned.NedWorker worker, int timeout) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `int timeout`

### device_id() <a href="#m-device_id-f50bb7031536" id="m-device_id-f50bb7031536"></a>

```java
public String device_id()
```

### getTransId(NedWorker) <a href="#m-getTransId-01de732a93e8" id="m-getTransId-01de732a93e8"></a>

```java
public void getTransId(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### handshake(NedWorker) <a href="#m-handshake-602ba649a458" id="m-handshake-602ba649a458"></a>

```java
public void handshake(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### identity() <a href="#m-identity-16b9d59e26e7" id="m-identity-16b9d59e26e7"></a>

```java
public String identity()
```

### isAlive(NedWorker) <a href="#m-isAlive-6915ae01ec8a" id="m-isAlive-6915ae01ec8a"></a>

```java
public boolean isAlive(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### isConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int) <a href="#m-isConnection-83e14a2692f7" id="m-isConnection-83e14a2692f7"></a>

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

**Parameters**

- `String deviceId`
- `java.net.InetAddress ip`
- `int port`
- `String proto`
- `String ruser`
- `String pass`
- `String secpass`
- `String keydir`
- `boolean trace`
- `int connectTimeout`
- `int readTimeout`
- `int writeTimeout`

### modules() <a href="#m-modules-15ef53dcaf36" id="m-modules-15ef53dcaf36"></a>

```java
public String[] modules()
```

### newConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int, NedMux, NedWorker) <a href="#m-newConnection-00bd117e5875" id="m-newConnection-00bd117e5875"></a>

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

Types: [NedCliBase](NedCliBase.md#cls-NedCliBase), [NedMux](NedMux.md#cls-NedMux), [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `String deviceId`
- `java.net.InetAddress ip`
- `int port`
- `String proto`
- `String ruser`
- `String pass`
- `String secpass`
- `String publicKeyDir`
- `boolean trace`
- `int connectTimeout`
- `int readTimeout`
- `int writeTimeout`
- `com.tailf.ned.NedMux mux`
- `com.tailf.ned.NedWorker worker`

### persist(NedWorker) <a href="#m-persist-a67bc9247622" id="m-persist-a67bc9247622"></a>

```java
public void persist(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### prepare(NedWorker, String) <a href="#m-prepare-ed9e4d4b6a29" id="m-prepare-ed9e4d4b6a29"></a>

```java
public void prepare(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

### prepareDry(NedWorker, String) <a href="#m-prepareDry-169e1f01784c" id="m-prepareDry-169e1f01784c"></a>

```java
public void prepareDry(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

### quote(String) <a href="#m-quote-5785a7e30ac4" id="m-quote-5785a7e30ac4"></a>

```java
public String quote(String aText)
```

**Parameters**

- `String aText`

### reconnect(NedWorker) <a href="#m-reconnect-a7a5900d41d6" id="m-reconnect-a7a5900d41d6"></a>

```java
public void reconnect(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### revert(NedWorker, String) <a href="#m-revert-5ad837ca98a4" id="m-revert-5ad837ca98a4"></a>

```java
public void revert(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

### setupSSH(NedWorker) <a href="#m-setupSSH-e795823b6e87" id="m-setupSSH-e795823b6e87"></a>

```java
public void setupSSH(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### setupTelnet(NedWorker) <a href="#m-setupTelnet-0c5e791a6b66" id="m-setupTelnet-0c5e791a6b66"></a>

```java
public void setupTelnet(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

### show(NedWorker, String) <a href="#m-show-5a497cd9b854" id="m-show-5a497cd9b854"></a>

```java
public void show(com.tailf.ned.NedWorker worker, String toptag) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String toptag`

### string_dequote(String) <a href="#m-string_dequote-74ef73b493ff" id="m-string_dequote-74ef73b493ff"></a>

```java
public String string_dequote(String aText)
```

**Parameters**

- `String aText`

**Deprecated:** Use [`unquote(String)`](NedCliBaseTemplate.md#m-unquote-bdee91b3a426) instead.

### string_quote(String) <a href="#m-string_quote-3abeed221bc3" id="m-string_quote-3abeed221bc3"></a>

```java
public String string_quote(String aText)
```

**Parameters**

- `String aText`

**Deprecated:** Use [`quote(String)`](NedCliBaseTemplate.md#m-quote-5785a7e30ac4) instead.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### trace(NedWorker, String, String) <a href="#m-trace-a95f19736f87" id="m-trace-a95f19736f87"></a>

```java
public void trace(com.tailf.ned.NedWorker worker, String msg, String direction)
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String msg`
- `String direction`

### type() <a href="#m-type-7a4a5f26039a" id="m-type-7a4a5f26039a"></a>

```java
public String type()
```

### unquote(String) <a href="#m-unquote-bdee91b3a426" id="m-unquote-bdee91b3a426"></a>

```java
public String unquote(String aText)
```

**Parameters**

- `String aText`


## Nested Types

- [ApplyException](NedCliBaseTemplate/ApplyException.md#cls-ApplyException)
