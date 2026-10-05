# NedGenericBase <a href="#cls-NedGenericBase" id="cls-NedGenericBase"></a>

```java
public abstract class com.tailf.ned.NedGenericBase
    extends com.tailf.ned.NedConnectionBase
```

Types: [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

This interface must be adhered to by code that talks to
 a generic device that is modeled in YANG. The configuration is
 sent to the Ned as a set of create/delete/set operations that has
 to be mapped to configuration operation on the actual device by
 the NedGeneric code.

## Members

**Constructors**:

- [NedGenericBase()](#m-NedGenericBase-541e27deb596)

**Fields**:

- [sshClient](NedConnectionBase.md#m-sshClient) from NedConnectionBase

**Methods**:

- [abort(NedWorker, NedEditOp[])](#m-abort-dc5cf5855d78)
- [close()](NedConnectionBase.md#m-close-8107c6dc012b) from NedConnectionBase
- [close(NedWorker)](NedConnectionBase.md#m-close-30f80583fb17) from NedConnectionBase
- [command(NedWorker, String, ConfXMLParam[])](NedConnectionBase.md#m-command-e9b29b4222a3) from NedConnectionBase
- [commit(NedWorker, int)](NedConnectionBase.md#m-commit-7dc36c07ab47) from NedConnectionBase
- [createSubscription(NedWorker, String, String, String, int)](NedConnectionBase.md#m-createSubscription-79162376c959) from NedConnectionBase
- [createTelemetrySubscription(NedWorker, Map<String,List<String>>)](NedConnectionBase.md#m-createTelemetrySubscription-c3b822b943ab) from NedConnectionBase
- [device_id()](NedConnectionBase.md#m-device_id-f50bb7031536) from NedConnectionBase
- [getCapas()](NedConnectionBase.md#m-getCapas-7f9d1774e7a0) from NedConnectionBase
- [getConnectionId()](NedConnectionBase.md#m-getConnectionId-600ebb3e7d7f) from NedConnectionBase
- [getPlatformData()](NedConnectionBase.md#m-getPlatformData-aa820968b919) from NedConnectionBase
- [getStatsCapas()](NedConnectionBase.md#m-getStatsCapas-aa8dc0859e62) from NedConnectionBase
- [getTimeInPool()](NedConnectionBase.md#m-getTimeInPool-df6d5c843d53) from NedConnectionBase
- [getTransactionIdMode()](NedConnectionBase.md#m-getTransactionIdMode-79b4efc0e31d) from NedConnectionBase
- [getTransId(NedWorker)](NedConnectionBase.md#m-getTransId-01de732a93e8) from NedConnectionBase
- [getUseStoredCapas()](NedConnectionBase.md#m-getUseStoredCapas-77d5f5640e81) from NedConnectionBase
- [getWantRevertDiff()](NedConnectionBase.md#m-getWantRevertDiff-ddea9ec7db21) from NedConnectionBase
- [identity()](NedConnectionBase.md#m-identity-16b9d59e26e7) from NedConnectionBase
- [initialize(NedWorker)](NedConnectionBase.md#m-initialize-b9daf0f9b461) from NedConnectionBase
- [initNoConnect(String, NedMux, NedWorker)](#m-initNoConnect-d8b0c37173df)
- [isAlive(NedWorker)](NedConnectionBase.md#m-isAlive-6915ae01ec8a) from NedConnectionBase
- [isConnection(String, InetAddress, int, String, boolean, int, int, int)](#m-isConnection-f6b7fa94dbc9)
- [isSessionAlive(NedWorker)](NedConnectionBase.md#m-isSessionAlive-f0d233ff28c0) from NedConnectionBase
- [keepAlive(NedWorker)](NedConnectionBase.md#m-keepAlive-92dcaaf81a7a) from NedConnectionBase
- [keepSessionAlive(NedWorker)](NedConnectionBase.md#m-keepSessionAlive-f2332bacddd5) from NedConnectionBase
- [modules()](NedConnectionBase.md#m-modules-15ef53dcaf36) from NedConnectionBase
- [newConnection(String, InetAddress, int, String, boolean, int, int, int, NedMux, NedWorker)](#m-newConnection-81f20620b2fb)
- [persist(NedWorker)](NedConnectionBase.md#m-persist-a67bc9247622) from NedConnectionBase
- [prepare(NedWorker, NedEditOp[])](#m-prepare-8183aeaecd08)
- [prepareDry(NedWorker, NedEditOp[])](#m-prepareDry-30cbc3061895)
- [reconnect(NedWorker)](NedConnectionBase.md#m-reconnect-a7a5900d41d6) from NedConnectionBase
- [retrieveIdentity(NedConnectionBase)](NedConnectionBase.md#m-retrieveIdentity-910704c2eafa) from NedConnectionBase
- [revert(NedWorker, NedEditOp[])](#m-revert-1495750cd3ae)
- [setCapabilities(NedCapability[])](NedConnectionBase.md#m-setCapabilities-67ad7861715a) from NedConnectionBase
- [setConnectionData(NedCapability[], NedCapability[], boolean, TransactionIdMode)](NedConnectionBase.md#m-setConnectionData-3c1697dcc350) from NedConnectionBase
- [setConnectionId(int)](NedConnectionBase.md#m-setConnectionId-7eea4fea28bf) from NedConnectionBase
- [setPlatformData(ConfXMLParam[])](NedConnectionBase.md#m-setPlatformData-a069c83c8fde) from NedConnectionBase
- [setPoolTimestamp(long)](NedConnectionBase.md#m-setPoolTimestamp-28239e3d2dc4) from NedConnectionBase
- [show(NedWorker, int)](#m-show-1eadf587f1ff)
- [showOffline(NedWorker, int, String)](#m-showOffline-b72264b54a34)
- [showPartial(NedWorker, int, ConfPath[])](#m-showPartial-550edaaf3468)
- [showStatsFilter(NedWorker, int, ConfPath[])](NedConnectionBase.md#m-showStatsFilter-f3bd9d17b71c) from NedConnectionBase
- [showStatsFilter(NedWorker, int, NedShowFilter[])](NedConnectionBase.md#m-showStatsFilter-1410355f6f46) from NedConnectionBase
- [showStatsFilter(NedWorker, int, String[])](NedConnectionBase.md#m-showStatsFilter-38409a8f79a0) from NedConnectionBase
- [showStatsPath(NedWorker, int, ConfPath)](NedConnectionBase.md#m-showStatsPath-1704122a5ac4) from NedConnectionBase
- [type()](NedConnectionBase.md#m-type-7a4a5f26039a) from NedConnectionBase
- [uninitialize(NedWorker)](NedConnectionBase.md#m-uninitialize-bba07dcc2d37) from NedConnectionBase
- [useStoredCapabilities()](NedConnectionBase.md#m-useStoredCapabilities-06864caacb8f) from NedConnectionBase

## Constructors

### NedGenericBase() <a href="#m-NedGenericBase-541e27deb596" id="m-NedGenericBase-541e27deb596"></a>

```java
public NedGenericBase()
```


## Methods

### abort(NedWorker, NedEditOp[]) <a href="#m-abort-dc5cf5855d78" id="m-abort-dc5cf5855d78"></a>

```java
public abstract void abort(
    com.tailf.ned.NedWorker w,
    com.tailf.ned.NedEditOp[] ops
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedEditOp](NedEditOp.md#cls-NedEditOp)

Is invoked by NCS to abort the current transaction and
 bring the configuration back to the state before the
 previous prepare()
 invocation. The NCS has calculated the changes needed
 to reach that state from the current state. The instance may choose
 to use these commands, or use some other mechanism to reach the same
 state. When the operation is completed it should invoke the method
 [abortResponse()](NedWorker.md#m-abortResponse-57f9d5e240e8) in
 in `NedWorker w`.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#cls-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#cls-SSHSession) as a tracer.
- `com.tailf.ned.NedEditOp[] ops` - is the edit operations needed for taking the config back to the
    previous state.

### initNoConnect(String, NedMux, NedWorker) <a href="#m-initNoConnect-d8b0c37173df" id="m-initNoConnect-d8b0c37173df"></a>

```java
public com.tailf.ned.NedGenericBase initNoConnect(
    String deviceId,
    com.tailf.ned.NedMux mux,
    com.tailf.ned.NedWorker w
)
    throws com.tailf.ned.NedWorker.NotEnoughDataException
```

Types: [NedGenericBase](NedGenericBase.md#cls-NedGenericBase), [NedMux](NedMux.md#cls-NedMux), [NedWorker](NedWorker.md#cls-NedWorker), [NotEnoughDataException](NedWorker/NotEnoughDataException.md#cls-NotEnoughDataException)

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

### isConnection(String, InetAddress, int, String, boolean, int, int, int) <a href="#m-isConnection-f6b7fa94dbc9" id="m-isConnection-f6b7fa94dbc9"></a>

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

### newConnection(String, InetAddress, int, String, boolean, int, int, int, NedMux, NedWorker) <a href="#m-newConnection-81f20620b2fb" id="m-newConnection-81f20620b2fb"></a>

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

Types: [NedGenericBase](NedGenericBase.md#cls-NedGenericBase), [NedMux](NedMux.md#cls-NedMux), [NedWorker](NedWorker.md#cls-NedWorker)

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
    [`NedTracer`](NedTracer.md#cls-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#cls-SSHSession) as a tracer.

**Returns:** the connection instance

### prepare(NedWorker, NedEditOp[]) <a href="#m-prepare-8183aeaecd08" id="m-prepare-8183aeaecd08"></a>

```java
public abstract void prepare(
    com.tailf.ned.NedWorker w,
    com.tailf.ned.NedEditOp[] ops
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedEditOp](NedEditOp.md#cls-NedEditOp)

Is invoked by NCS to take the configuration to a new state. The Ned may
 choose to apply the changes directly to the device, preferably to a
 candidate
 configuration, but if the device lacks candidate support it may choose
 to apply the changes directly to the running config. If the configuration
 changes are later aborted, or
 reverted, the NCS will provide the necessary changes for restoring the
 configuration to its previous state. The Ned should invoke the
 method [prepareResponse()](NedWorker.md#m-prepareResponse-7eadf3b8db0f) in `NedWorker w`
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
    [`NedTracer`](NedTracer.md#cls-NedTracer)
    API and can be used in, for example, the [`SSHSession`](SSHSession.md#cls-SSHSession)
    as a tracer.
- `com.tailf.ned.NedEditOp[] ops` - Edit operations representing the changes to the configuration.

### prepareDry(NedWorker, NedEditOp[]) <a href="#m-prepareDry-30cbc3061895" id="m-prepareDry-30cbc3061895"></a>

```java
public void prepareDry(com.tailf.ned.NedWorker w, com.tailf.ned.NedEditOp[] ops) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedEditOp](NedEditOp.md#cls-NedEditOp)

Is invoked by NCS to ask the NED what actions it would take towards
 the device if it would do a prepare.

 The NED can send the preformatted output back to NCS through the
 call to  [prepareDryResponse()](NedWorker.md#m-prepareDryResponse-4249bd793b22)

 The Ned should invoke the method
 [prepareDryResponse()](NedWorker.md#m-prepareDryResponse-4249bd793b22) in `NedWorker w`
 when the operation is completed.

 If the functionality is not supported this method need not be
 implemented. Alternatively the NED can respond with a
 [`NedWorker#prepareDryUnsupportedResponse()`](NedWorker.md#m-prepareDryUnsupportedResponse-79bc01c84b05).

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#cls-NedTracer)
    API and can be used in, for example, the [`SSHSession`](SSHSession.md#cls-SSHSession)
    as a tracer.
- `com.tailf.ned.NedEditOp[] ops` - Edit operations representing the changes to the configuration.

### revert(NedWorker, NedEditOp[]) <a href="#m-revert-1495750cd3ae" id="m-revert-1495750cd3ae"></a>

```java
public abstract void revert(
    com.tailf.ned.NedWorker w,
    com.tailf.ned.NedEditOp[] ops
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedEditOp](NedEditOp.md#cls-NedEditOp)

Is invoked by NCS to undo the changes introduced in the last commit
 operation (communicated to the NED in the prepare method invocation).
 The difference between
 abort()
 and revert() is that revert() is invoked after
 [commit()](NedConnectionBase.md#m-commit-7dc36c07ab47)
 (but before persist), whereas abort() is invoked before
 the commit(). Once the configuration has been made persistent by
 [persist()](NedConnectionBase.md#m-persist-a67bc9247622)
 it can no longer be restored to any previous  (potentially saved) state.
 When the revert operation has been completed the method
 [revertResponse](NedWorker.md#m-revertResponse-a85f70d26645)
 in `NedWorker w` should be called.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#cls-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#cls-SSHSession) as a tracer.
- `com.tailf.ned.NedEditOp[] ops` - is the edit operations for taking the config back to the previous
    state.

### show(NedWorker, int) <a href="#m-show-1eadf587f1ff" id="m-show-1eadf587f1ff"></a>

```java
public abstract void show(com.tailf.ned.NedWorker w, int th) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

Read parts of the configuration and applies it to the transaction
 provided in
 the method invocation. It may choose to write more into the transaction
 than is actually requested. The response
 is sent by invoking the method
 [showGenericResponse()](NedWorker.md#m-showGenericResponse-be3696329498) in
 in the `NedWorker w`.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#cls-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#cls-SSHSession) as a tracer.
- `int th` - is a transaction id that can be used with the Maapi library for
    accessing a transaction.

### showOffline(NedWorker, int, String) <a href="#m-showOffline-b72264b54a34" id="m-showOffline-b72264b54a34"></a>

```java
public void showOffline(com.tailf.ned.NedWorker w, int th, String data) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

Read parts of the configuration and applies it to the
 transaction, both provided in the method invocation.
 It may choose to write more into the transaction
 than is actually requested. The response
 is sent by invoking the method
 [showGenericResponse()](NedWorker.md#m-showGenericResponse-be3696329498) in
 in the `NedWorker w`.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#cls-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#cls-SSHSession) as a tracer.
- `int th` - is a transaction id that can be used with the Maapi library for
    accessing a transaction.
- `String data` - are the configuration in native format.

### showPartial(NedWorker, int, ConfPath[]) <a href="#m-showPartial-550edaaf3468" id="m-showPartial-550edaaf3468"></a>

```java
public void showPartial(
    com.tailf.ned.NedWorker w,
    int th,
    com.tailf.conf.ConfPath[] paths
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [ConfPath](../conf/ConfPath.md#cls-ConfPath)

Read parts of the configuration and applies it to the transaction
 provided in
 the method invocation. It may choose to write more into the transaction
 than is actually requested. The response
 is sent by invoking the method
 [showGenericResponse()](NedWorker.md#m-showGenericResponse-be3696329498) in
 in the `NedWorker w`.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with the NCS, ie for sending responses,
    errors, and trace messages. It is also implements the
    [`NedTracer`](NedTracer.md#cls-NedTracer)
    API and can be used in, for example, the
    [`SSHSession`](SSHSession.md#cls-SSHSession) as a tracer.
- `int th` - is a transaction id that can be used with the Maapi library for
    accessing a transaction.
- `com.tailf.conf.ConfPath[] paths` - are paths to filter the various parts of the configuration tree
    that are relevant to write into the transaction.
