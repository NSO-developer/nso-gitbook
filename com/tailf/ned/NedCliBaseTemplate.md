<a id="cls-NedCliBaseTemplate"></a>
# NedCliBaseTemplate

```java
public class com.tailf.ned.NedCliBaseTemplate
    extends com.tailf.ned.NedCliBase
```

Types: [NedCliBase](NedCliBase.md#cls-NedCliBase)

This class implements NED CLI template

## Members

**Constructors**:

- [NedCliBaseTemplate()](#m-nedclibasetemplate-e3cd7d53da2b)
- [NedCliBaseTemplate(String, InetAddress, int, String, String, String, String, boolean, int, int, int, NedMux, NedWorker)](#m-nedclibasetemplate-c183924d4e06)

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
- [applyConfig(NedWorker, int, String)](#m-applyconfig-7b024768cd7e)
- [close()](#m-close-8107c6dc012b)
- [close(NedWorker)](#m-close-30f80583fb17)
- [command(NedWorker, String, ConfXMLParam[])](#m-command-e9b29b4222a3)
- [commit(NedWorker, int)](#m-commit-7dc36c07ab47)
- [createSubscription(NedWorker, String, String, String, int)](NedConnectionBase.md#m-createsubscription-79162376c959) from NedConnectionBase
- [createTelemetrySubscription(NedWorker, Map<String,List<String>>)](NedConnectionBase.md#m-createtelemetrysubscription-c3b822b943ab) from NedConnectionBase
- [device_id()](#m-device_id-f50bb7031536)
- [getCapas()](NedConnectionBase.md#m-getcapas-7f9d1774e7a0) from NedConnectionBase
- [getConnectionId()](NedConnectionBase.md#m-getconnectionid-600ebb3e7d7f) from NedConnectionBase
- [getPlatformData()](NedConnectionBase.md#m-getplatformdata-aa820968b919) from NedConnectionBase
- [getStatsCapas()](NedConnectionBase.md#m-getstatscapas-aa8dc0859e62) from NedConnectionBase
- [getTimeInPool()](NedConnectionBase.md#m-gettimeinpool-df6d5c843d53) from NedConnectionBase
- [getTransactionIdMode()](NedConnectionBase.md#m-gettransactionidmode-79b4efc0e31d) from NedConnectionBase
- [getTransId(NedWorker)](#m-gettransid-01de732a93e8)
- [getUseStoredCapas()](NedConnectionBase.md#m-getusestoredcapas-77d5f5640e81) from NedConnectionBase
- [getWantRevertDiff()](NedConnectionBase.md#m-getwantrevertdiff-ddea9ec7db21) from NedConnectionBase
- [handshake(NedWorker)](#m-handshake-602ba649a458)
- [identity()](#m-identity-16b9d59e26e7)
- [initialize(NedWorker)](NedConnectionBase.md#m-initialize-b9daf0f9b461) from NedConnectionBase
- [initNoConnect(String, NedMux, NedWorker)](NedCliBase.md#m-initnoconnect-d8b0c37173df) from NedCliBase
- [isAlive(NedWorker)](#m-isalive-6915ae01ec8a)
- [isConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int)](#m-isconnection-83e14a2692f7)
- [isSessionAlive(NedWorker)](NedConnectionBase.md#m-issessionalive-f0d233ff28c0) from NedConnectionBase
- [keepAlive(NedWorker)](NedConnectionBase.md#m-keepalive-92dcaaf81a7a) from NedConnectionBase
- [keepSessionAlive(NedWorker)](NedConnectionBase.md#m-keepsessionalive-f2332bacddd5) from NedConnectionBase
- [modules()](#m-modules-15ef53dcaf36)
- [newConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int, NedMux, NedWorker)](#m-newconnection-00bd117e5875)
- [persist(NedWorker)](#m-persist-a67bc9247622)
- [prepare(NedWorker, String)](#m-prepare-ed9e4d4b6a29)
- [prepareDry(NedWorker, String)](#m-preparedry-169e1f01784c)
- [quote(String)](#m-quote-5785a7e30ac4)
- [reconnect(NedWorker)](#m-reconnect-a7a5900d41d6)
- [retrieveIdentity(NedConnectionBase)](NedConnectionBase.md#m-retrieveidentity-910704c2eafa) from NedConnectionBase
- [revert(NedWorker, String)](#m-revert-5ad837ca98a4)
- [setCapabilities(NedCapability[])](NedConnectionBase.md#m-setcapabilities-67ad7861715a) from NedConnectionBase
- [setConnectionData(NedCapability[], NedCapability[], boolean, TransactionIdMode)](NedConnectionBase.md#m-setconnectiondata-3c1697dcc350) from NedConnectionBase
- [setConnectionId(int)](NedConnectionBase.md#m-setconnectionid-7eea4fea28bf) from NedConnectionBase
- [setPlatformData(ConfXMLParam[])](NedConnectionBase.md#m-setplatformdata-a069c83c8fde) from NedConnectionBase
- [setPoolTimestamp(long)](NedConnectionBase.md#m-setpooltimestamp-28239e3d2dc4) from NedConnectionBase
- [setupSSH(NedWorker)](#m-setupssh-e795823b6e87)
- [setupTelnet(NedWorker)](#m-setuptelnet-0c5e791a6b66)
- [show(NedWorker, String)](#m-show-5a497cd9b854)
- [showOffline(NedWorker, String, String)](NedCliBase.md#m-showoffline-4a83874bc32c) from NedCliBase
- [showPartial(NedWorker, ConfPath[])](NedCliBase.md#m-showpartial-aa998f554abd) from NedCliBase
- [showPartial(NedWorker, ConfPath[], String[])](NedCliBase.md#m-showpartial-d37a025ae7ee) from NedCliBase
- [showStatsFilter(NedWorker, int, ConfPath[])](NedConnectionBase.md#m-showstatsfilter-f3bd9d17b71c) from NedConnectionBase
- [showStatsFilter(NedWorker, int, NedShowFilter[])](NedConnectionBase.md#m-showstatsfilter-1410355f6f46) from NedConnectionBase
- [showStatsFilter(NedWorker, int, String[])](NedConnectionBase.md#m-showstatsfilter-38409a8f79a0) from NedConnectionBase
- [showStatsPath(NedWorker, int, ConfPath)](NedConnectionBase.md#m-showstatspath-1704122a5ac4) from NedConnectionBase
- [string_dequote(String)](#m-string_dequote-74ef73b493ff)
- [string_quote(String)](#m-string_quote-3abeed221bc3)
- [toString()](#m-tostring-e9d48c5503ef)
- [trace(NedWorker, String, String)](#m-trace-a95f19736f87)
- [type()](#m-type-7a4a5f26039a)
- [uninitialize(NedWorker)](NedConnectionBase.md#m-uninitialize-bba07dcc2d37) from NedConnectionBase
- [unquote(String)](#m-unquote-bdee91b3a426)
- [useStoredCapabilities()](NedConnectionBase.md#m-usestoredcapabilities-06864caacb8f) from NedConnectionBase

**Nested Types**:

- [ApplyException](NedCliBaseTemplate/ApplyException.md#cls-ApplyException)

## Constructors

<a id="m-nedclibasetemplate-e3cd7d53da2b"></a>
### NedCliBaseTemplate()

```java
public NedCliBaseTemplate()
```

<a id="m-nedclibasetemplate-c183924d4e06"></a>
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

<a id="m-connection"></a>
### connection

```java
public com.tailf.ned.SSHConnection connection = null;
```

Types: [SSHConnection](SSHConnection.md#cls-SSHConnection)

<a id="m-connectTimeout"></a>
### connectTimeout

```java
public int connectTimeout = null;
```

<a id="m-device_id"></a>
### device_id

```java
public String device_id = null;
```

<a id="m-ip"></a>
### ip

```java
public java.net.InetAddress ip = null;
```

<a id="m-mux"></a>
### mux

```java
public com.tailf.ned.NedMux mux = null;
```

Types: [NedMux](NedMux.md#cls-NedMux)

<a id="m-pass"></a>
### pass

```java
public String pass = null;
```

<a id="m-port"></a>
### port

```java
public int port = null;
```

<a id="m-proto"></a>
### proto

```java
public String proto = null;
```

<a id="m-readTimeout"></a>
### readTimeout

```java
public int readTimeout = null;
```

<a id="m-ruser"></a>
### ruser

```java
public String ruser = null;
```

<a id="m-secpass"></a>
### secpass

```java
public String secpass = null;
```

<a id="m-session"></a>
### session

```java
public com.tailf.ned.CliSession session = null;
```

Types: [CliSession](CliSession.md#cls-CliSession)

<a id="m-trace"></a>
### trace

```java
public boolean trace = null;
```

<a id="m-tracer"></a>
### tracer

```java
public com.tailf.ned.NedTracer tracer = null;
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

<a id="m-writeTimeout"></a>
### writeTimeout

```java
public int writeTimeout = null;
```


## Methods

<a id="m-abort-e0e56f7ce202"></a>
### abort(NedWorker, String)

```java
public void abort(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

<a id="m-applyconfig-7b024768cd7e"></a>
### applyConfig(NedWorker, int, String)

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

<a id="m-close-8107c6dc012b"></a>
### close()

```java
public void close()
```

<a id="m-close-30f80583fb17"></a>
### close(NedWorker)

```java
public void close(
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.NedException, java.io.IOException
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="m-command-e9b29b4222a3"></a>
### command(NedWorker, String, ConfXMLParam[])

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

<a id="m-commit-7dc36c07ab47"></a>
### commit(NedWorker, int)

```java
public void commit(com.tailf.ned.NedWorker worker, int timeout) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `int timeout`

<a id="m-device_id-f50bb7031536"></a>
### device_id()

```java
public String device_id()
```

<a id="m-gettransid-01de732a93e8"></a>
### getTransId(NedWorker)

```java
public void getTransId(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="m-handshake-602ba649a458"></a>
### handshake(NedWorker)

```java
public void handshake(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="m-identity-16b9d59e26e7"></a>
### identity()

```java
public String identity()
```

<a id="m-isalive-6915ae01ec8a"></a>
### isAlive(NedWorker)

```java
public boolean isAlive(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="m-isconnection-83e14a2692f7"></a>
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

<a id="m-modules-15ef53dcaf36"></a>
### modules()

```java
public String[] modules()
```

<a id="m-newconnection-00bd117e5875"></a>
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

<a id="m-persist-a67bc9247622"></a>
### persist(NedWorker)

```java
public void persist(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="m-prepare-ed9e4d4b6a29"></a>
### prepare(NedWorker, String)

```java
public void prepare(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

<a id="m-preparedry-169e1f01784c"></a>
### prepareDry(NedWorker, String)

```java
public void prepareDry(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

<a id="m-quote-5785a7e30ac4"></a>
### quote(String)

```java
public String quote(String aText)
```

**Parameters**

- `String aText`

<a id="m-reconnect-a7a5900d41d6"></a>
### reconnect(NedWorker)

```java
public void reconnect(com.tailf.ned.NedWorker worker)
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="m-revert-5ad837ca98a4"></a>
### revert(NedWorker, String)

```java
public void revert(com.tailf.ned.NedWorker worker, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String data`

<a id="m-setupssh-e795823b6e87"></a>
### setupSSH(NedWorker)

```java
public void setupSSH(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="m-setuptelnet-0c5e791a6b66"></a>
### setupTelnet(NedWorker)

```java
public void setupTelnet(com.tailf.ned.NedWorker worker) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`

<a id="m-show-5a497cd9b854"></a>
### show(NedWorker, String)

```java
public void show(com.tailf.ned.NedWorker worker, String toptag) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String toptag`

<a id="m-string_dequote-74ef73b493ff"></a>
### string_dequote(String)

```java
public String string_dequote(String aText)
```

**Parameters**

- `String aText`

**Deprecated:** Use `#unquote(String)` instead.

<a id="m-string_quote-3abeed221bc3"></a>
### string_quote(String)

```java
public String string_quote(String aText)
```

**Parameters**

- `String aText`

**Deprecated:** Use `#quote(String)` instead.

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-trace-a95f19736f87"></a>
### trace(NedWorker, String, String)

```java
public void trace(com.tailf.ned.NedWorker worker, String msg, String direction)
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker worker`
- `String msg`
- `String direction`

<a id="m-type-7a4a5f26039a"></a>
### type()

```java
public String type()
```

<a id="m-unquote-bdee91b3a426"></a>
### unquote(String)

```java
public String unquote(String aText)
```

**Parameters**

- `String aText`


## Nested Types

- [ApplyException](NedCliBaseTemplate/ApplyException.md#cls-ApplyException)
