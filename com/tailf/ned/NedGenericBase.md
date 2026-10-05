<a id="s-NedGenericBase"></a>
# NedGenericBase

```java
public abstract class com.tailf.ned.NedGenericBase
    extends com.tailf.ned.NedConnectionBase
```

Types: [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

This interface must be adhered to by code that talks to
 a generic device that is modeled in YANG. The configuration is
 sent to the Ned as a set of create/delete/set operations that has
 to be mapped to configuration operation on the actual device by
 the NedGeneric code.

## Members

**Constructors**:

- [NedGenericBase()](#s-NedGenericBase-1)

**Fields**:

- [sshClient](NedConnectionBase.md#s-sshClient) from NedConnectionBase

**Methods**:

- [abort(NedWorker, NedEditOp[])](#s-abort)
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
- [isConnection(String, InetAddress, int, String, boolean, int, int, int)](#s-isConnection)
- [isSessionAlive(NedWorker)](NedConnectionBase.md#s-isSessionAlive) from NedConnectionBase
- [keepAlive(NedWorker)](NedConnectionBase.md#s-keepAlive) from NedConnectionBase
- [keepSessionAlive(NedWorker)](NedConnectionBase.md#s-keepSessionAlive) from NedConnectionBase
- [modules()](NedConnectionBase.md#s-modules) from NedConnectionBase
- [newConnection(String, InetAddress, int, String, boolean, int, int, int, NedMux, NedWorker)](#s-newConnection)
- [persist(NedWorker)](NedConnectionBase.md#s-persist) from NedConnectionBase
- [prepare(NedWorker, NedEditOp[])](#s-prepare)
- [prepareDry(NedWorker, NedEditOp[])](#s-prepareDry)
- [reconnect(NedWorker)](NedConnectionBase.md#s-reconnect) from NedConnectionBase
- [retrieveIdentity(NedConnectionBase)](NedConnectionBase.md#s-retrieveIdentity) from NedConnectionBase
- [revert(NedWorker, NedEditOp[])](#s-revert)
- [setCapabilities(NedCapability[])](NedConnectionBase.md#s-setCapabilities) from NedConnectionBase
- [setConnectionData(NedCapability[], NedCapability[], boolean, TransactionIdMode)](NedConnectionBase.md#s-setConnectionData) from NedConnectionBase
- [setConnectionId(int)](NedConnectionBase.md#s-setConnectionId) from NedConnectionBase
- [setPlatformData(ConfXMLParam[])](NedConnectionBase.md#s-setPlatformData) from NedConnectionBase
- [setPoolTimestamp(long)](NedConnectionBase.md#s-setPoolTimestamp) from NedConnectionBase
- [show(NedWorker, int)](#s-show)
- [showOffline(NedWorker, int, String)](#s-showOffline)
- [showPartial(NedWorker, int, ConfPath[])](#s-showPartial)
- [showStatsFilter(NedWorker, int, ConfPath[])](NedConnectionBase.md#s-showStatsFilter) from NedConnectionBase
- [showStatsFilter(NedWorker, int, NedShowFilter[])](NedConnectionBase.md#s-showStatsFilter-1) from NedConnectionBase
- [showStatsFilter(NedWorker, int, String[])](NedConnectionBase.md#s-showStatsFilter-2) from NedConnectionBase
- [showStatsPath(NedWorker, int, ConfPath)](NedConnectionBase.md#s-showStatsPath) from NedConnectionBase
- [type()](NedConnectionBase.md#s-type) from NedConnectionBase
- [uninitialize(NedWorker)](NedConnectionBase.md#s-uninitialize) from NedConnectionBase
- [useStoredCapabilities()](NedConnectionBase.md#s-useStoredCapabilities) from NedConnectionBase

## Constructors

<a id="s-NedGenericBase-1"></a>
### NedGenericBase()

```java
public NedGenericBase()
```


## Methods

<a id="s-abort"></a>
### abort(NedWorker, NedEditOp[])

```java
public abstract void abort(
    com.tailf.ned.NedWorker w,
    com.tailf.ned.NedEditOp[] ops
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [NedEditOp](NedEditOp.md#s-NedEditOp)

Is invoked by NCS to abort the current transaction and
 bring the configuration back to the state before the
 previous [prepare()](NedWorker.md#s-NedWorker)
 invocation. The NCS has calculated the changes needed
 to reach that state from the current state. The instance may choose
 to use these commands, or use some other mechanism to reach the same
 state. When the operation is completed it should invoke the method
 [abortResponse()](NedWorker.md#s-NedWorker) in
 in `NedWorker w`.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#s-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#s-SSHSession) as a tracer.
- `com.tailf.ned.NedEditOp[] ops` - is the edit operations needed for taking the config back to the
    previous state.

<a id="s-initNoConnect"></a>
### initNoConnect(String, NedMux, NedWorker)

```java
public com.tailf.ned.NedGenericBase initNoConnect(
    String deviceId,
    com.tailf.ned.NedMux mux,
    com.tailf.ned.NedWorker w
)
    throws com.tailf.ned.NedWorker.NotEnoughDataException
```

Types: [NedGenericBase](NedGenericBase.md#s-NedGenericBase), [NedMux](NedMux.md#s-NedMux), [NedWorker](NedWorker.md#s-NedWorker), [NotEnoughDataException](NedWorker/NotEnoughDataException.md#s-NotEnoughDataException)

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
- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker instance
    should be used when communicating with the NCS, ie for sending
    responses, errors, and trace messages.

**Returns:** the NED instance

<a id="s-isConnection"></a>
### isConnection(String, InetAddress, int, String, boolean, int, int, int)

```java
public abstract boolean isConnection(
    String deviceId,
    java.net.InetAddress ip,
    int port,
    String luser,
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
- `String luser` - name of user to connect as
- `boolean trace` - indicates if raw trace messages should be generated or not
- `int connectTimeout` - in milliseconds
- `int readTimeout` - in milliseconds
- `int writeTimeout` - in milliseconds

<a id="s-newConnection"></a>
### newConnection(String, InetAddress, int, String, boolean, int, int, int, NedMux, NedWorker)

```java
public abstract com.tailf.ned.NedGenericBase newConnection(
    String deviceId,
    java.net.InetAddress ip,
    int port,
    String luser,
    boolean trace,
    int connectTimeout,
    int readTimeout,
    int writeTimeout,
    com.tailf.ned.NedMux mux,
    com.tailf.ned.NedWorker worker
)
```

Types: [NedGenericBase](NedGenericBase.md#s-NedGenericBase), [NedMux](NedMux.md#s-NedMux), [NedWorker](NedWorker.md#s-NedWorker)

Establish a new connection to a device and send response to
 NCS with information about the device using the method
 setConnectionData()
 A new instance representing the new connection should
 be returned. The returned instance will be used for further communication
 with the device. Different worker instances may be used for the
 communication and the instance cannot assume the worker used in
 this invocation will be the same used in the future invocations of
 the prepare(), abort(), revert(), persist(), show(), etc methods.

**Parameters**

- `String deviceId` - name of device
- `java.net.InetAddress ip` - address to connect to device
- `int port` - port to connect to
- `String luser` - name of user to connect as
- `boolean trace` - indicates if raw trace messages should be generated or not
- `int connectTimeout` - in milliseconds
- `int readTimeout` - in milliseconds
- `int writeTimeout` - in milliseconds
- `com.tailf.ned.NedMux mux`
- `com.tailf.ned.NedWorker worker` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#s-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#s-SSHSession) as a tracer.

**Returns:** the connection instance

<a id="s-prepare"></a>
### prepare(NedWorker, NedEditOp[])

```java
public abstract void prepare(
    com.tailf.ned.NedWorker w,
    com.tailf.ned.NedEditOp[] ops
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [NedEditOp](NedEditOp.md#s-NedEditOp)

Is invoked by NCS to take the configuration to a new state. The Ned may
 choose to apply the changes directly to the device, preferably to a
 candidate
 configuration, but if the device lacks candidate support it may choose
 to apply the changes directly to the running config. If the configuration
 changes are later aborted, or
 reverted, the NCS will provide the necessary changes for restoring the
 configuration to its previous state. The Ned should invoke the
 method [prepareResponse()](NedWorker.md#s-NedWorker) in `NedWorker w`
 when the operation is completed.

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
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#s-NedTracer)
    API and can be used in, for example, the [`SSHSession`](SSHSession.md#s-SSHSession)
    as a tracer.
- `com.tailf.ned.NedEditOp[] ops` - Edit operations representing the changes to the configuration.

<a id="s-prepareDry"></a>
### prepareDry(NedWorker, NedEditOp[])

```java
public void prepareDry(com.tailf.ned.NedWorker w, com.tailf.ned.NedEditOp[] ops) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [NedEditOp](NedEditOp.md#s-NedEditOp)

Is invoked by NCS to ask the NED what actions it would take towards
 the device if it would do a prepare.

 The NED can send the preformatted output back to NCS through the
 call to  [prepareDryResponse()](NedWorker.md#s-NedWorker)

 The Ned should invoke the method
 [prepareDryResponse()](NedWorker.md#s-NedWorker) in `NedWorker w`
 when the operation is completed.

 If the functionality is not supported this method need not be
 implemented. Alternatively the NED can respond with a
 [`NedWorker`](NedWorker.md#s-NedWorker).

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#s-NedTracer)
    API and can be used in, for example, the [`SSHSession`](SSHSession.md#s-SSHSession)
    as a tracer.
- `com.tailf.ned.NedEditOp[] ops` - Edit operations representing the changes to the configuration.

<a id="s-revert"></a>
### revert(NedWorker, NedEditOp[])

```java
public abstract void revert(
    com.tailf.ned.NedWorker w,
    com.tailf.ned.NedEditOp[] ops
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [NedEditOp](NedEditOp.md#s-NedEditOp)

Is invoked by NCS to undo the changes introduced in the last commit
 operation (communicated to the NED in the prepare method invocation).
 The difference between
 [abort()](NedWorker.md#s-NedWorker)
 and revert() is that revert() is invoked after
 [commit()](NedConnectionBase.md#s-NedConnectionBase)
 (but before persist), whereas abort() is invoked before
 the commit(). Once the configuration has been made persistent by
 [persist()](NedConnectionBase.md#s-NedConnectionBase)
 it can no longer be restored to any previous  (potentially saved) state.
 When the revert operation has been completed the method
 [revertResponse](NedWorker.md#s-NedWorker)
 in `NedWorker w` should be called.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#s-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#s-SSHSession) as a tracer.
- `com.tailf.ned.NedEditOp[] ops` - is the edit operations for taking the config back to the previous
    state.

<a id="s-show"></a>
### show(NedWorker, int)

```java
public abstract void show(com.tailf.ned.NedWorker w, int th) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

Read parts of the configuration and applies it to the transaction
 provided in
 the method invocation. It may choose to write more into the transaction
 than is actually requested. The response
 is sent by invoking the method
 [showGenericResponse()](NedWorker.md#s-NedWorker) in
 in the `NedWorker w`.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#s-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#s-SSHSession) as a tracer.
- `int th` - is a transaction id that can be used with the Maapi library for
    accessing a transaction.

<a id="s-showOffline"></a>
### showOffline(NedWorker, int, String)

```java
public void showOffline(com.tailf.ned.NedWorker w, int th, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker)

Read parts of the configuration and applies it to the
 transaction, both provided in the method invocation.
 It may choose to write more into the transaction
 than is actually requested. The response
 is sent by invoking the method
 [showGenericResponse()](NedWorker.md#s-NedWorker) in
 in the `NedWorker w`.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#s-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#s-SSHSession) as a tracer.
- `int th` - is a transaction id that can be used with the Maapi library for
    accessing a transaction.
- `String data` - are the configuration in native format.

<a id="s-showPartial"></a>
### showPartial(NedWorker, int, ConfPath[])

```java
public void showPartial(
    com.tailf.ned.NedWorker w,
    int th,
    com.tailf.conf.ConfPath[] paths
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#s-NedWorker), [ConfPath](../conf/ConfPath.md#s-ConfPath)

Read parts of the configuration and applies it to the transaction
 provided in
 the method invocation. It may choose to write more into the transaction
 than is actually requested. The response
 is sent by invoking the method
 [showGenericResponse()](NedWorker.md#s-NedWorker) in
 in the `NedWorker w`.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#s-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#s-SSHSession) as a tracer.
- `int th` - is a transaction id that can be used with the Maapi library for
    accessing a transaction.
- `com.tailf.conf.ConfPath[] paths` - are paths to filter the various parts of the configuration tree
    that are relevant to write into the transaction.
