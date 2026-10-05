# NedCliBase <a href="#nedclibase-cb59203c2e29" id="nedclibase-cb59203c2e29"></a>

```java
public abstract class com.tailf.ned.NedCliBase
    extends com.tailf.ned.NedConnectionBase
```

Types: [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

This class is used for connections between the NCS and CLI based
 NEDs. A NedCli instance must be combined with a YANG data model
 that models the data and CLI commands used for talking to the device.

**Related classes**

- [NedCliBaseTemplate](NedCliBaseTemplate.md#nedclibasetemplate-f082ac37583c)

## Members

**Constructors**:

- [NedCliBase()](#nedclibase-a467d8c254db)

**Fields**:

- [sshClient](NedConnectionBase.md#sshclient-f55984dcf633) from NedConnectionBase

**Methods**:

- [abort(NedWorker, String)](#abort-e0e56f7ce202)
- [close()](NedConnectionBase.md#close-8107c6dc012b) from NedConnectionBase
- [close(NedWorker)](NedConnectionBase.md#close-30f80583fb17) from NedConnectionBase
- [command(NedWorker, String, ConfXMLParam[])](NedConnectionBase.md#command-e9b29b4222a3) from NedConnectionBase
- [commit(NedWorker, int)](NedConnectionBase.md#commit-7dc36c07ab47) from NedConnectionBase
- [createSubscription(NedWorker, String, String, String, int)](NedConnectionBase.md#createsubscription-79162376c959) from NedConnectionBase
- [createTelemetrySubscription(NedWorker, Map<String,List<String>>)](NedConnectionBase.md#createtelemetrysubscription-c3b822b943ab) from NedConnectionBase
- [device_id()](NedConnectionBase.md#device_id-f50bb7031536) from NedConnectionBase
- [getCapas()](NedConnectionBase.md#getcapas-7f9d1774e7a0) from NedConnectionBase
- [getConnectionId()](NedConnectionBase.md#getconnectionid-600ebb3e7d7f) from NedConnectionBase
- [getPlatformData()](NedConnectionBase.md#getplatformdata-aa820968b919) from NedConnectionBase
- [getStatsCapas()](NedConnectionBase.md#getstatscapas-aa8dc0859e62) from NedConnectionBase
- [getTimeInPool()](NedConnectionBase.md#gettimeinpool-df6d5c843d53) from NedConnectionBase
- [getTransactionIdMode()](NedConnectionBase.md#gettransactionidmode-79b4efc0e31d) from NedConnectionBase
- [getTransId(NedWorker)](NedConnectionBase.md#gettransid-01de732a93e8) from NedConnectionBase
- [getUseStoredCapas()](NedConnectionBase.md#getusestoredcapas-77d5f5640e81) from NedConnectionBase
- [getWantRevertDiff()](NedConnectionBase.md#getwantrevertdiff-ddea9ec7db21) from NedConnectionBase
- [identity()](NedConnectionBase.md#identity-16b9d59e26e7) from NedConnectionBase
- [initialize(NedWorker)](NedConnectionBase.md#initialize-b9daf0f9b461) from NedConnectionBase
- [initNoConnect(String, NedMux, NedWorker)](#initnoconnect-d8b0c37173df)
- [isAlive(NedWorker)](NedConnectionBase.md#isalive-6915ae01ec8a) from NedConnectionBase
- [isConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int)](#isconnection-83e14a2692f7)
- [isSessionAlive(NedWorker)](NedConnectionBase.md#issessionalive-f0d233ff28c0) from NedConnectionBase
- [keepAlive(NedWorker)](NedConnectionBase.md#keepalive-92dcaaf81a7a) from NedConnectionBase
- [keepSessionAlive(NedWorker)](NedConnectionBase.md#keepsessionalive-f2332bacddd5) from NedConnectionBase
- [modules()](NedConnectionBase.md#modules-15ef53dcaf36) from NedConnectionBase
- [newConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int, NedMux, NedWorker)](#newconnection-00bd117e5875)
- [persist(NedWorker)](NedConnectionBase.md#persist-a67bc9247622) from NedConnectionBase
- [prepare(NedWorker, String)](#prepare-ed9e4d4b6a29)
- [prepareDry(NedWorker, String)](#preparedry-169e1f01784c)
- [reconnect(NedWorker)](NedConnectionBase.md#reconnect-a7a5900d41d6) from NedConnectionBase
- [retrieveIdentity(NedConnectionBase)](NedConnectionBase.md#retrieveidentity-910704c2eafa) from NedConnectionBase
- [revert(NedWorker, String)](#revert-5ad837ca98a4)
- [setCapabilities(NedCapability[])](NedConnectionBase.md#setcapabilities-67ad7861715a) from NedConnectionBase
- [setConnectionData(NedCapability[], NedCapability[], boolean, TransactionIdMode)](NedConnectionBase.md#setconnectiondata-3c1697dcc350) from NedConnectionBase
- [setConnectionId(int)](NedConnectionBase.md#setconnectionid-7eea4fea28bf) from NedConnectionBase
- [setPlatformData(ConfXMLParam[])](NedConnectionBase.md#setplatformdata-a069c83c8fde) from NedConnectionBase
- [setPoolTimestamp(long)](NedConnectionBase.md#setpooltimestamp-28239e3d2dc4) from NedConnectionBase
- [show(NedWorker, String)](#show-5a497cd9b854)
- [showOffline(NedWorker, String, String)](#showoffline-4a83874bc32c)
- [showPartial(NedWorker, ConfPath[])](#showpartial-aa998f554abd)
- [showPartial(NedWorker, ConfPath[], String[])](#showpartial-d37a025ae7ee)
- [showStatsFilter(NedWorker, int, ConfPath[])](NedConnectionBase.md#showstatsfilter-f3bd9d17b71c) from NedConnectionBase
- [showStatsFilter(NedWorker, int, NedShowFilter[])](NedConnectionBase.md#showstatsfilter-1410355f6f46) from NedConnectionBase
- [showStatsFilter(NedWorker, int, String[])](NedConnectionBase.md#showstatsfilter-38409a8f79a0) from NedConnectionBase
- [showStatsPath(NedWorker, int, ConfPath)](NedConnectionBase.md#showstatspath-1704122a5ac4) from NedConnectionBase
- [type()](NedConnectionBase.md#type-7a4a5f26039a) from NedConnectionBase
- [uninitialize(NedWorker)](NedConnectionBase.md#uninitialize-bba07dcc2d37) from NedConnectionBase
- [useStoredCapabilities()](NedConnectionBase.md#usestoredcapabilities-06864caacb8f) from NedConnectionBase

## Constructors

### NedCliBase() <a href="#nedclibase-a467d8c254db" id="nedclibase-a467d8c254db"></a>

```java
public NedCliBase()
```


## Methods

### abort(NedWorker, String) <a href="#abort-e0e56f7ce202" id="abort-e0e56f7ce202"></a>

```java
public abstract void abort(com.tailf.ned.NedWorker w, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

Is invoked by NCS to abort the configuration to the state before the
 previous prepare() invocation. The NCS has calculated the commands needed
 to reach that state from the current state. The instance may choose
 to use there commands, or use some other mechanism to reach the same
 state. When the operation is completed it should invoke the
 w.abortResponse() method in the NedWorker.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the NedTracer
    API and can be used in, for example, the SSHSession as a tracer.
- `String data` - is the commands for taking the config back to the previous
    state. The commands are generated using the YANG data
    model in combination with the tailf: extensions to guide the
    mapping.

### initNoConnect(String, NedMux, NedWorker) <a href="#initnoconnect-d8b0c37173df" id="initnoconnect-d8b0c37173df"></a>

```java
public com.tailf.ned.NedCliBase initNoConnect(
    String deviceId,
    com.tailf.ned.NedMux mux,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.NedWorker.NotEnoughDataException
```

Types: [NedCliBase](NedCliBase.md#nedclibase-cb59203c2e29), [NedMux](NedMux.md#nedmux-646886956a86), [NedWorker](NedWorker.md#nedworker-b063de7c0998), [NotEnoughDataException](NedWorker/NotEnoughDataException.md#notenoughdataexception-0a1dcfccde5c)

Make a new instance of Ned object without establishing a connection
 towards the device. The NED should use previously stored information
 about the device to initialize its state if needed or throw
 NedWorker.NotEnoughDataException. It should then send the information
 about the device using the setConnectionData() method.  A new instance
 representing the new connection should be returned. That instance can
 only be used for invoking prepareDry() callback and not for actual
 communication with the device. close() callback will be invoked
 before destroying the NED instance, so the implementation of the close()
 callback should handle cleanup both for instances created with
 newConnection() and instanced created with initNoConnect()

**Parameters**

- `String deviceId` - name of device
- `com.tailf.ned.NedMux mux`
- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker instance
    should be used when communicating with the NCS, ie for sending
    responses, errors, and trace messages.

**Returns:** the NED instance

### isConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int) <a href="#isconnection-83e14a2692f7" id="isconnection-83e14a2692f7"></a>

```java
public abstract boolean isConnection(
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

### newConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int, NedMux, NedWorker) <a href="#newconnection-00bd117e5875" id="newconnection-00bd117e5875"></a>

```java
public abstract com.tailf.ned.NedCliBase newConnection(
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
    com.tailf.ned.NedWorker w
)
```

Types: [NedCliBase](NedCliBase.md#nedclibase-cb59203c2e29), [NedMux](NedMux.md#nedmux-646886956a86), [NedWorker](NedWorker.md#nedworker-b063de7c0998)

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
- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the NedTracer
    API and can be used in, for example, the SSHSession as a tracer.

**Returns:** the connection instance

### prepare(NedWorker, String) <a href="#prepare-ed9e4d4b6a29" id="prepare-ed9e4d4b6a29"></a>

```java
public abstract void prepare(com.tailf.ned.NedWorker w, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

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
              / \
             /   uninitialize (undo preparations)
            v
        prepare (send data to device)
            /   \
           v     v
        abort | commit(send confirmed commit (ios would do noop))
                 /   \
                v     v
            revert | persist (send confirming commit)

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
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
public abstract void prepareDry(com.tailf.ned.NedWorker w, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

Is invoked by NCS to tell the NED what actions it should take towards
 the device if it should do a prepare.

 The NED should invoke the method
 [prepareDryResponse()](NedWorker.md#preparedryresponse-4249bd793b22)
 when the operation is completed. If no changes needs to be done
 just answer `prepareDryResponse(data)`

 If an error is detected answer this through a call to
 [error()](NedWorker.md#error-ef653fe52f55)
 in `NedWorker w`.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
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

### revert(NedWorker, String) <a href="#revert-5ad837ca98a4" id="revert-5ad837ca98a4"></a>

```java
public abstract void revert(com.tailf.ned.NedWorker w, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

Is invoked by NCS to undo the changes introduced in the last commit
 operation (communicated to the NED in the prepare method invocation).
 The difference between abort() and revert() is that revert() is invoked
 after commit() (but before persist), whereas abort() is invoked before
 commit(). Once the configuration has been made persistent by persist()
 it can no longer be restored to any previous  (potentially saved) state.
 When the revert operation has been completed the w.revertResponse()
 method should be called.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the NedTracer
    API and can be used in, for example, the SSHSession as a tracer.
- `String data` - is the commands for taking the config back to the previous
    state.

### show(NedWorker, String) <a href="#show-5a497cd9b854" id="show-5a497cd9b854"></a>

```java
public abstract void show(com.tailf.ned.NedWorker w, String toptag) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

Extract parts of the configuration and send it to NCS. The response
 is sent by invoking the w.showCliResponse() method in the provided
 NedWorker.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the NedTracer
    API and can be used in, for example, the SSHSession as a tracer.
- `String toptag` - is the top level tag indicating which part of the config
    should be extracted.

### showOffline(NedWorker, String, String) <a href="#showoffline-4a83874bc32c" id="showoffline-4a83874bc32c"></a>

```java
public void showOffline(com.tailf.ned.NedWorker w, String toptag, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998)

Extract parts of the configuration and send it to NCS. The response
 is sent by invoking the w.showCliResponse() method in the provided
 NedWorker.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the NedTracer
    API and can be used in, for example, the SSHSession as a tracer.
- `String toptag` - is the top level tag indicating which part of the config
    should be extracted.
- `String data` - is the CLI commands in native format.

### showPartial(NedWorker, ConfPath[]) <a href="#showpartial-aa998f554abd" id="showpartial-aa998f554abd"></a>

```java
public void showPartial(com.tailf.ned.NedWorker w, com.tailf.conf.ConfPath[] paths) throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

Extract parts of the configuration and send it to NCS. The response
 is sent by invoking the w.showCliResponse() method in the provided
 NedWorker.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the NedTracer
    API and can be used in, for example, the SSHSession as a tracer.
- `com.tailf.conf.ConfPath[] paths` - are paths to filter the various parts of the configuration tree
    that should be extracted.

### showPartial(NedWorker, ConfPath[], String[]) <a href="#showpartial-d37a025ae7ee" id="showpartial-d37a025ae7ee"></a>

```java
public void showPartial(
    com.tailf.ned.NedWorker w,
    com.tailf.conf.ConfPath[] paths,
    String[] cmdpaths
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#nedworker-b063de7c0998), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

Extract parts of the configuration and send it to NCS. The response
 is sent by invoking the w.showCliResponse() method in the provided
 NedWorker.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the NedTracer
    API and can be used in, for example, the SSHSession as a tracer.
- `com.tailf.conf.ConfPath[] paths` - are paths to filter the various parts of the configuration tree
    that should be extracted.
- `String[] cmdpaths` - are cmd paths to filter the various parts of the configuration tree
    that should be extracted.
