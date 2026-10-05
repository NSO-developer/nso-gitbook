<a id="s-NedCliBaseTemplate"></a>
# NedCliBaseTemplate

```java
public class com.tailf.ned.NedCliBaseTemplate
    extends com.tailf.ned.NedCliBase
```

Types: [NedCliBase](NedCliBase.md#s-NedCliBase)

This class implements NED CLI template

## Members

**Constructors**:

- [NedCliBaseTemplate()](#s-NedCliBaseTemplate-1)
- [NedCliBaseTemplate(String, InetAddress, int, String, String, String, String, boolean, int, int, int, NedMux, NedWorker)](#s-NedCliBaseTemplate-2)

**Fields**:

- [connection](#s-connection)
- [connectTimeout](#s-connectTimeout)
- [device_id](#s-device_id)
- [ip](#s-ip)
- [mux](#s-mux)
- [pass](#s-pass)
- [port](#s-port)
- [proto](#s-proto)
- [readTimeout](#s-readTimeout)
- [ruser](#s-ruser)
- [secpass](#s-secpass)
- [session](#s-session)
- [sshClient](NedConnectionBase.md#s-sshClient) from NedConnectionBase
- [trace](#s-trace)
- [tracer](#s-tracer)
- [writeTimeout](#s-writeTimeout)

**Methods**:

- [abort(NedWorker, String)](#s-abort)
- [applyConfig(NedWorker, int, String)](#s-applyConfig)
- [close()](#s-close)
- [close(NedWorker)](#s-close-1)
- [command(NedWorker, String, ConfXMLParam[])](#s-command)
- [commit(NedWorker, int)](#s-commit)
- [createSubscription(NedWorker, String, String, String, int)](NedConnectionBase.md#s-createSubscription) from NedConnectionBase
- [createTelemetrySubscription(NedWorker, Map<String,List<String>>)](NedConnectionBase.md#s-createTelemetrySubscription) from NedConnectionBase
- [device_id()](#s-device_id-1)
- [getCapas()](NedConnectionBase.md#s-getCapas) from NedConnectionBase
- [getConnectionId()](NedConnectionBase.md#s-getConnectionId) from NedConnectionBase
- [getPlatformData()](NedConnectionBase.md#s-getPlatformData) from NedConnectionBase
- [getStatsCapas()](NedConnectionBase.md#s-getStatsCapas) from NedConnectionBase
- [getTimeInPool()](NedConnectionBase.md#s-getTimeInPool) from NedConnectionBase
- [getTransactionIdMode()](NedConnectionBase.md#s-getTransactionIdMode) from NedConnectionBase
- [getTransId(NedWorker)](#s-getTransId)
- [getUseStoredCapas()](NedConnectionBase.md#s-getUseStoredCapas) from NedConnectionBase
- [getWantRevertDiff()](NedConnectionBase.md#s-getWantRevertDiff) from NedConnectionBase
- [handshake(NedWorker)](#s-handshake)
- [identity()](#s-identity)
- [initialize(NedWorker)](NedConnectionBase.md#s-initialize) from NedConnectionBase
- [initNoConnect(String, NedMux, NedWorker)](NedCliBase.md#s-initNoConnect) from NedCliBase
- [isAlive(NedWorker)](#s-isAlive)
- [isConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int)](#s-isConnection)
- [isSessionAlive(NedWorker)](NedConnectionBase.md#s-isSessionAlive) from NedConnectionBase
- [keepAlive(NedWorker)](NedConnectionBase.md#s-keepAlive) from NedConnectionBase
- [keepSessionAlive(NedWorker)](NedConnectionBase.md#s-keepSessionAlive) from NedConnectionBase
- [modules()](#s-modules)
- [newConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int, NedMux, NedWorker)](#s-newConnection)
- [persist(NedWorker)](#s-persist)
- [prepare(NedWorker, String)](#s-prepare)
- [prepareDry(NedWorker, String)](#s-prepareDry)
- [quote(String)](#s-quote)
- [reconnect(NedWorker)](#s-reconnect)
- [retrieveIdentity(NedConnectionBase)](NedConnectionBase.md#s-retrieveIdentity) from NedConnectionBase
- [revert(NedWorker, String)](#s-revert)
- [setCapabilities(NedCapability[])](NedConnectionBase.md#s-setCapabilities) from NedConnectionBase
- [setConnectionData(NedCapability[], NedCapability[], boolean, TransactionIdMode)](NedConnectionBase.md#s-setConnectionData) from NedConnectionBase
- [setConnectionId(int)](NedConnectionBase.md#s-setConnectionId) from NedConnectionBase
- [setPlatformData(ConfXMLParam[])](NedConnectionBase.md#s-setPlatformData) from NedConnectionBase
- [setPoolTimestamp(long)](NedConnectionBase.md#s-setPoolTimestamp) from NedConnectionBase
- [setupSSH(NedWorker)](#s-setupSSH)
- [setupTelnet(NedWorker)](#s-setupTelnet)
- [show(NedWorker, String)](#s-show)
- [showOffline(NedWorker, String, String)](NedCliBase.md#s-showOffline) from NedCliBase
- [showPartial(NedWorker, ConfPath[])](NedCliBase.md#s-showPartial) from NedCliBase
- [showPartial(NedWorker, ConfPath[], String[])](NedCliBase.md#s-showPartial-1) from NedCliBase
- [showStatsFilter(NedWorker, int, ConfPath[])](NedConnectionBase.md#s-showStatsFilter) from NedConnectionBase
- [showStatsFilter(NedWorker, int, NedShowFilter[])](NedConnectionBase.md#s-showStatsFilter-1) from NedConnectionBase
- [showStatsFilter(NedWorker, int, String[])](NedConnectionBase.md#s-showStatsFilter-2) from NedConnectionBase
- [showStatsPath(NedWorker, int, ConfPath)](NedConnectionBase.md#s-showStatsPath) from NedConnectionBase
- [string_dequote(String)](#s-string_dequote)
- [string_quote(String)](#s-string_quote)
- [toString()](#s-toString)
- [trace(NedWorker, String, String)](#s-trace-1)
- [type()](#s-type)
- [uninitialize(NedWorker)](NedConnectionBase.md#s-uninitialize) from NedConnectionBase
- [unquote(String)](#s-unquote)
- [useStoredCapabilities()](NedConnectionBase.md#s-useStoredCapabilities) from NedConnectionBase

**Nested Types**:

- [ApplyException](NedCliBaseTemplate/ApplyException.md#s-ApplyException)

## Constructors

<a id="s-NedCliBaseTemplate-1"></a>
### NedCliBaseTemplate()

```java
public NedCliBaseTemplate()
```

<a id="s-NedCliBaseTemplate-2"></a>
### NedCliBaseTemplate(String, InetAddress, int, String, String, String, String, boolean, int, int, int, NedMux, NedWorker)

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

Types: [NedMux](NedMux.md#s-NedMux), [NedWorker](NedWorker.md#s-NedWorker)

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

<a id="s-connection"></a>
### connection

```java
public com.tailf.ned.SSHConnection connection = null;
```

Types: [SSHConnection](SSHConnection.md#s-SSHConnection)

<a id="s-connectTimeout"></a>
### connectTimeout

```java
public int connectTimeout = null;
```

<a id="s-device_id"></a>
### device_id

```java
public String device_id = null;
```

<a id="s-ip"></a>
### ip

```java
public java.net.InetAddress ip = null;
```

<a id="s-mux"></a>
### mux

```java
public com.tailf.ned.NedMux mux = null;
```

Types: [NedMux](NedMux.md#s-NedMux)

<a id="s-pass"></a>
### pass

```java
public String pass = null;
```

<a id="s-port"></a>
### port

```java
public int port = null;
```

<a id="s-proto"></a>
### proto

```java
public String proto = null;
```

<a id="s-readTimeout"></a>
### readTimeout

```java
public int readTimeout = null;
```

<a id="s-ruser"></a>
### ruser

```java
public String ruser = null;
```

<a id="s-secpass"></a>
### secpass

```java
public String secpass = null;
```

<a id="s-session"></a>
### session

```java
public com.tailf.ned.CliSession session = null;
```

Types: [CliSession](CliSession.md#s-CliSession)

<a id="s-trace"></a>
### trace

```java
public boolean trace = null;
```

<a id="s-tracer"></a>
### tracer

```java
public com.tailf.ned.NedTracer tracer = null;
```

Types: [NedTracer](NedTracer.md#s-NedTracer)

<a id="s-writeTimeout"></a>
### writeTimeout

```java
public int writeTimeout = null;
```


## Methods

<a id="s-abort"></a>
### abort(NedWorker, String)

```java
public void abort(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

<a id="s-applyConfig"></a>
### applyConfig(NedWorker, int, String)

```java
public void applyConfig(
    com.tailf.ned.NedWorker worker,
    int cmd,
    String data
)
    throws com.tailf.ned.NedException, java.io.IOException, com.tailf.ned.SSHSessionException, com.tailf.ned.NedCliBaseTemplate.ApplyException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [NedException](NedException.md#s-NedException), [SSHSessionException](SSHSessionException.md#s-SSHSessionException), [ApplyException](NedCliBaseTemplate/ApplyException.md#s-ApplyException)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `int cmd`
- `String data`

<a id="s-close"></a>
### close()

```java
public void close()
```

<a id="s-close-1"></a>
### close(NedWorker)

```java
public void close(
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.NedException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [NedException](NedException.md#s-NedException)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="s-command"></a>
### command(NedWorker, String, ConfXMLParam[])

```java
public void command(
    com.tailf.ned.NedWorker worker,
    String cmdname,
    com.tailf.conf.ConfXMLParam[] p
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String cmdname`
- `com.tailf.conf.ConfXMLParam[] p`

<a id="s-commit"></a>
### commit(NedWorker, int)

```java
public void commit(com.tailf.ned.NedWorker worker, int timeout) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `int timeout`

<a id="s-device_id-1"></a>
### device_id()

```java
public String device_id()
```

<a id="s-getTransId"></a>
### getTransId(NedWorker)

```java
public void getTransId(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="s-handshake"></a>
### handshake(NedWorker)

```java
public void handshake(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="s-identity"></a>
### identity()

```java
public String identity()
```

<a id="s-isAlive"></a>
### isAlive(NedWorker)

```java
public boolean isAlive(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="s-isConnection"></a>
### isConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int)

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

<a id="s-modules"></a>
### modules()

```java
public String[] modules()
```

<a id="s-newConnection"></a>
### newConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int, NedMux, NedWorker)

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

Types: [NedCliBase](NedCliBase.md#s-NedCliBase), [NedMux](NedMux.md#s-NedMux), [NedWorker](NedWorker.md#s-NedWorker)

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

<a id="s-persist"></a>
### persist(NedWorker)

```java
public void persist(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="s-prepare"></a>
### prepare(NedWorker, String)

```java
public void prepare(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

<a id="s-prepareDry"></a>
### prepareDry(NedWorker, String)

```java
public void prepareDry(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

<a id="s-quote"></a>
### quote(String)

```java
public String quote(String aText)
```

**Parameters**

- `String aText`

<a id="s-reconnect"></a>
### reconnect(NedWorker)

```java
public void reconnect(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="s-revert"></a>
### revert(NedWorker, String)

```java
public void revert(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

<a id="s-setupSSH"></a>
### setupSSH(NedWorker)

```java
public void setupSSH(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="s-setupTelnet"></a>
### setupTelnet(NedWorker)

```java
public void setupTelnet(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="s-show"></a>
### show(NedWorker, String)

```java
public void show(com.tailf.ned.NedWorker worker, String toptag) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String toptag`

<a id="s-string_dequote"></a>
### string_dequote(String)

```java
public String string_dequote(String aText)
```

**Parameters**

- `String aText`

**Deprecated:** Use `#unquote(String)` instead.

<a id="s-string_quote"></a>
### string_quote(String)

```java
public String string_quote(String aText)
```

**Parameters**

- `String aText`

**Deprecated:** Use `#quote(String)` instead.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-trace-1"></a>
### trace(NedWorker, String, String)

```java
public void trace(com.tailf.ned.NedWorker worker, String msg, String direction)
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String msg`
- `String direction`

<a id="s-type"></a>
### type()

```java
public String type()
```

<a id="s-unquote"></a>
### unquote(String)

```java
public String unquote(String aText)
```

**Parameters**

- `String aText`


## Nested Types

- [ApplyException](NedCliBaseTemplate/ApplyException.md)
