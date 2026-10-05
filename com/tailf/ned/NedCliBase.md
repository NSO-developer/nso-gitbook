<a id="s-NedCliBase"></a>
# NedCliBase

```java
public abstract class com.tailf.ned.NedCliBase
    extends com.tailf.ned.NedConnectionBase
```

Types: [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

This class is used for connections between the NCS and CLI based
 NEDs. A NedCli instance must be combined with a YANG data model
 that models the data and CLI commands used for talking to the device.

**Related classes**

- [NedCliBaseTemplate](NedCliBaseTemplate.md#s-NedCliBaseTemplate)

## Members

**Constructors**:

- [NedCliBase()](#s-NedCliBase-1)

**Fields**:

- [sshClient](NedConnectionBase.md#s-sshClient) from NedConnectionBase

**Methods**:

- [abort(NedWorker, String)](#s-abort)
- [close()](NedConnectionBase.md#s-close) from NedConnectionBase
- [close(NedWorker)](NedConnectionBase.md#s-close-1) from NedConnectionBase
- [command(NedWorker, String, ConfXMLParam[])](NedConnectionBase.md#s-command) from NedConnectionBase
- [commit(NedWorker, int)](NedConnectionBase.md#s-commit) from NedConnectionBase
- [createSubscription(NedWorker, String, String, String, int)](NedConnectionBase.md#s-createSubscription) from NedConnectionBase
- [createTelemetrySubscription(NedWorker, Map<String,List<String>>)](NedConnectionBase.md#s-createTelemetrySubscription) from NedConnectionBase
- [device_id()](NedConnectionBase.md#s-device_id) from NedConnectionBase
- [getCapas()](NedConnectionBase.md#s-getCapas) from NedConnectionBase
- [getConnectionId()](NedConnectionBase.md#s-getConnectionId) from NedConnectionBase
- [getPlatformData()](NedConnectionBase.md#s-getPlatformData) from NedConnectionBase
- [getStatsCapas()](NedConnectionBase.md#s-getStatsCapas) from NedConnectionBase
- [getTimeInPool()](NedConnectionBase.md#s-getTimeInPool) from NedConnectionBase
- [getTransactionIdMode()](NedConnectionBase.md#s-getTransactionIdMode) from NedConnectionBase
- [getTransId(NedWorker)](NedConnectionBase.md#s-getTransId) from NedConnectionBase
- [getUseStoredCapas()](NedConnectionBase.md#s-getUseStoredCapas) from NedConnectionBase
- [getWantRevertDiff()](NedConnectionBase.md#s-getWantRevertDiff) from NedConnectionBase
- [identity()](NedConnectionBase.md#s-identity) from NedConnectionBase
- [initialize(NedWorker)](NedConnectionBase.md#s-initialize) from NedConnectionBase
- [initNoConnect(String, NedMux, NedWorker)](#s-initNoConnect)
- [isAlive(NedWorker)](NedConnectionBase.md#s-isAlive) from NedConnectionBase
- [isConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int)](#s-isConnection)
- [isSessionAlive(NedWorker)](NedConnectionBase.md#s-isSessionAlive) from NedConnectionBase
- [keepAlive(NedWorker)](NedConnectionBase.md#s-keepAlive) from NedConnectionBase
- [keepSessionAlive(NedWorker)](NedConnectionBase.md#s-keepSessionAlive) from NedConnectionBase
- [modules()](NedConnectionBase.md#s-modules) from NedConnectionBase
- [newConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int, NedMux, NedWorker)](#s-newConnection)
- [persist(NedWorker)](NedConnectionBase.md#s-persist) from NedConnectionBase
- [prepare(NedWorker, String)](#s-prepare)
- [prepareDry(NedWorker, String)](#s-prepareDry)
- [reconnect(NedWorker)](NedConnectionBase.md#s-reconnect) from NedConnectionBase
- [retrieveIdentity(NedConnectionBase)](NedConnectionBase.md#s-retrieveIdentity) from NedConnectionBase
- [revert(NedWorker, String)](#s-revert)
- [setCapabilities(NedCapability[])](NedConnectionBase.md#s-setCapabilities) from NedConnectionBase
- [setConnectionData(NedCapability[], NedCapability[], boolean, TransactionIdMode)](NedConnectionBase.md#s-setConnectionData) from NedConnectionBase
- [setConnectionId(int)](NedConnectionBase.md#s-setConnectionId) from NedConnectionBase
- [setPlatformData(ConfXMLParam[])](NedConnectionBase.md#s-setPlatformData) from NedConnectionBase
- [setPoolTimestamp(long)](NedConnectionBase.md#s-setPoolTimestamp) from NedConnectionBase
- [show(NedWorker, String)](#s-show)
- [showOffline(NedWorker, String, String)](#s-showOffline)
- [showPartial(NedWorker, ConfPath[])](#s-showPartial)
- [showPartial(NedWorker, ConfPath[], String[])](#s-showPartial-1)
- [showStatsFilter(NedWorker, int, ConfPath[])](NedConnectionBase.md#s-showStatsFilter) from NedConnectionBase
- [showStatsFilter(NedWorker, int, NedShowFilter[])](NedConnectionBase.md#s-showStatsFilter-1) from NedConnectionBase
- [showStatsFilter(NedWorker, int, String[])](NedConnectionBase.md#s-showStatsFilter-2) from NedConnectionBase
- [showStatsPath(NedWorker, int, ConfPath)](NedConnectionBase.md#s-showStatsPath) from NedConnectionBase
- [type()](NedConnectionBase.md#s-type) from NedConnectionBase
- [uninitialize(NedWorker)](NedConnectionBase.md#s-uninitialize) from NedConnectionBase
- [useStoredCapabilities()](NedConnectionBase.md#s-useStoredCapabilities) from NedConnectionBase

## Constructors

<a id="s-NedCliBase-1"></a>
### NedCliBase()

```java
public NedCliBase()
```


## Methods

<a id="s-abort"></a>
### abort(NedWorker, String)

```java
public abstract void abort(com.tailf.ned.NedWorker w, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

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

<a id="s-initNoConnect"></a>
### initNoConnect(String, NedMux, NedWorker)

```java
public com.tailf.ned.NedCliBase initNoConnect(
    String deviceId,
    com.tailf.ned.NedMux mux,
    com.tailf.ned.NedWorker worker
)
    throws com.tailf.ned.NedWorker.NotEnoughDataException
```

Types: [NedCliBase](NedCliBase.md#s-NedCliBase), [NedMux](NedMux.md#s-NedMux), [NedWorker](NedWorker.md#s-NedWorker), [NotEnoughDataException](NedWorker/NotEnoughDataException.md#s-NotEnoughDataException)

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

<a id="s-isConnection"></a>
### isConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int)

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

<a id="s-newConnection"></a>
### newConnection(String, InetAddress, int, String, String, String, String, String, boolean, int, int, int, NedMux, NedWorker)

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

Types: [NedCliBase](NedCliBase.md#s-NedCliBase), [NedMux](NedMux.md#s-NedMux), [NedWorker](NedWorker.md#s-NedWorker)

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

<a id="s-prepare"></a>
### prepare(NedWorker, String)

```java
public abstract void prepare(com.tailf.ned.NedWorker w, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

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

<a id="s-prepareDry"></a>
### prepareDry(NedWorker, String)

```java
public abstract void prepareDry(com.tailf.ned.NedWorker w, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

Is invoked by NCS to tell the NED what actions it should take towards
 the device if it should do a prepare.

 The NED should invoke the method
 [prepareDryResponse()](NedWorker.md#s-NedWorker)
 when the operation is completed. If no changes needs to be done
 just answer `prepareDryResponse(data)`

 If an error is detected answer this through a call to
 [error()](NedWorker.md#s-NedWorker)
 in `NedWorker w`.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#s-NedTracer)
    API and can be used in, for example, the [`SSHSession`](SSHSession.md#s-SSHSession)
    as a tracer.
- `String data` - is the CLI commands for transforming the configuration to
    a new state. The commands are generated using the YANG data
    model in combination with the tailf: extensions to guide the
    mapping.

<a id="s-revert"></a>
### revert(NedWorker, String)

```java
public abstract void revert(com.tailf.ned.NedWorker w, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

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

<a id="s-show"></a>
### show(NedWorker, String)

```java
public abstract void show(com.tailf.ned.NedWorker w, String toptag) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

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

<a id="s-showOffline"></a>
### showOffline(NedWorker, String, String)

```java
public void showOffline(com.tailf.ned.NedWorker w, String toptag, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

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

<a id="s-showPartial"></a>
### showPartial(NedWorker, ConfPath[])

```java
public void showPartial(com.tailf.ned.NedWorker w, com.tailf.conf.ConfPath[] paths) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [ConfPath](../conf/ConfPath.md#s-ConfPath)

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

<a id="s-showPartial-1"></a>
### showPartial(NedWorker, ConfPath[], String[])

```java
public void showPartial(
    com.tailf.ned.NedWorker w,
    com.tailf.conf.ConfPath[] paths,
    String[] cmdpaths
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [ConfPath](../conf/ConfPath.md#s-ConfPath)

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
