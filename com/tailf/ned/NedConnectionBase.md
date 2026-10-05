# NedConnectionBase <a href="#cls-NedConnectionBase" id="cls-NedConnectionBase"></a>

```java
public abstract class com.tailf.ned.NedConnectionBase
```

A NedConnection is the interface used by the NedMux for keeping
 track of connections to different devices. One instance of each
 type should be registered with the NedMux before the NedMux is
 started. Specific sub-classes are defined for cli and generic
 neds, see NedCli and NedGeneric.

 The life of a specific connection to a backend device is as
 follows.

 1 Initially an instance is created through the invocation of
   the create method, and a connection to the backend
   device is set up.
 2 a mix of prepare/abort/revert/commit/persist/show/getTransId/
   showStatsPath, etc
 3 possibly get invocations to the isAlive() method. This method
   is involved when the connection is pooled.
 4 possibly get an invocation to the reconnect method, and start
   over at 2
 5 finally one of the close() methods will be involved. The
   connection should close the connection to the device and
   release all resources.

 If the connection is poolable then it may live in the connection
 pool. The state of the connection is polled by the connection
 pool manager using the isAlive() method.

**Related classes**

- [NedCliBase](NedCliBase.md#cls-NedCliBase)
- [NedGenericBase](NedGenericBase.md#cls-NedGenericBase)

## Members

**Constructors**:

- [NedConnectionBase()](#m-NedConnectionBase-158486610d1d)

**Fields**:

- [sshClient](#m-sshClient)

**Methods**:

- [close()](#m-close-8107c6dc012b)
- [close(NedWorker)](#m-close-30f80583fb17)
- [command(NedWorker, String, ConfXMLParam[])](#m-command-e9b29b4222a3)
- [commit(NedWorker, int)](#m-commit-7dc36c07ab47)
- [createSubscription(NedWorker, String, String, String, int)](#m-createSubscription-79162376c959)
- [createTelemetrySubscription(NedWorker, Map<String,List<String>>)](#m-createTelemetrySubscription-c3b822b943ab)
- [device_id()](#m-device_id-f50bb7031536)
- [getCapas()](#m-getCapas-7f9d1774e7a0)
- [getConnectionId()](#m-getConnectionId-600ebb3e7d7f)
- [getPlatformData()](#m-getPlatformData-aa820968b919)
- [getStatsCapas()](#m-getStatsCapas-aa8dc0859e62)
- [getTimeInPool()](#m-getTimeInPool-df6d5c843d53)
- [getTransactionIdMode()](#m-getTransactionIdMode-79b4efc0e31d)
- [getTransId(NedWorker)](#m-getTransId-01de732a93e8)
- [getUseStoredCapas()](#m-getUseStoredCapas-77d5f5640e81)
- [getWantRevertDiff()](#m-getWantRevertDiff-ddea9ec7db21)
- [identity()](#m-identity-16b9d59e26e7)
- [initialize(NedWorker)](#m-initialize-b9daf0f9b461)
- [isAlive(NedWorker)](#m-isAlive-6915ae01ec8a)
- [isSessionAlive(NedWorker)](#m-isSessionAlive-f0d233ff28c0)
- [keepAlive(NedWorker)](#m-keepAlive-92dcaaf81a7a)
- [keepSessionAlive(NedWorker)](#m-keepSessionAlive-f2332bacddd5)
- [modules()](#m-modules-15ef53dcaf36)
- [persist(NedWorker)](#m-persist-a67bc9247622)
- [reconnect(NedWorker)](#m-reconnect-a7a5900d41d6)
- [retrieveIdentity(NedConnectionBase)](#m-retrieveIdentity-910704c2eafa)
- [setCapabilities(NedCapability[])](#m-setCapabilities-67ad7861715a)
- [setConnectionData(NedCapability[], NedCapability[], boolean, TransactionIdMode)](#m-setConnectionData-3c1697dcc350)
- [setConnectionId(int)](#m-setConnectionId-7eea4fea28bf)
- [setPlatformData(ConfXMLParam[])](#m-setPlatformData-a069c83c8fde)
- [setPoolTimestamp(long)](#m-setPoolTimestamp-28239e3d2dc4)
- [showStatsFilter(NedWorker, int, ConfPath[])](#m-showStatsFilter-f3bd9d17b71c)
- [showStatsFilter(NedWorker, int, NedShowFilter[])](#m-showStatsFilter-1410355f6f46)
- [showStatsFilter(NedWorker, int, String[])](#m-showStatsFilter-38409a8f79a0)
- [showStatsPath(NedWorker, int, ConfPath)](#m-showStatsPath-1704122a5ac4)
- [type()](#m-type-7a4a5f26039a)
- [uninitialize(NedWorker)](#m-uninitialize-bba07dcc2d37)
- [useStoredCapabilities()](#m-useStoredCapabilities-06864caacb8f)

## Constructors

### NedConnectionBase() <a href="#m-NedConnectionBase-158486610d1d" id="m-NedConnectionBase-158486610d1d"></a>

```java
public NedConnectionBase()
```


## Fields

### sshClient <a href="#m-sshClient" id="m-sshClient"></a>

```java
protected com.tailf.ned.SSHClient sshClient = null;
```

Types: [SSHClient](SSHClient.md#cls-SSHClient)


## Methods

### close() <a href="#m-close-8107c6dc012b" id="m-close-8107c6dc012b"></a>

```java
public abstract void close()
```

This method is invoked when a connection close is forced and no
 NedWorker is involved. This typically occurs when a connection
 is removed from the connection pool. No response or trace
 messages can be sent during the operation.

### close(NedWorker) <a href="#m-close-30f80583fb17" id="m-close-30f80583fb17"></a>

```java
public abstract void close(com.tailf.ned.NedWorker w) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

This method is invoked when the connection is terminated. It is
 not invoked when placing the connection in the connection pool.
 No response is required, but trace messages may be generated
 during the close down.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.

### command(NedWorker, String, ConfXMLParam[]) <a href="#m-command-e9b29b4222a3" id="m-command-e9b29b4222a3"></a>

```java
public abstract void command(
    com.tailf.ned.NedWorker w,
    String cmdName,
    com.tailf.conf.ConfXMLParam[] params
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

This is for any optional commands on the device that are
 not part of the yang files config data, but is modeled as
 tailf:actions or rpcs in the device yang files.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.
- `String cmdName` - Name of the command (path to action?)
- `com.tailf.conf.ConfXMLParam[] params`

### commit(NedWorker, int) <a href="#m-commit-7dc36c07ab47" id="m-commit-7dc36c07ab47"></a>

```java
public abstract void commit(com.tailf.ned.NedWorker w, int timeout) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

This indicates that the current set of operations should be
 committed to the running configuration. When completed the
 w.commitResponse() method should be invoked. Devices that does
 not support commit() should invoke the w.commitResponse() method
 without delay. On error invoke the w.error(NedCmd.COMMIT,
 Error, Reason) method.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.
- `int timeout` - If the commit operation does not complete within 'timeout' seconds
    the operation should be aborted.

### createSubscription(NedWorker, String, String, String, int) <a href="#m-createSubscription-79162376c959" id="m-createSubscription-79162376c959"></a>

```java
public void createSubscription(
    com.tailf.ned.NedWorker w,
    String stream,
    String startTime,
    String filter,
    int filterType
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

This method is invoked to create a notification subscription.
 After the subscription has been created the NedWorker can
 send notifiction messages, in the NETCONF notification format,
 with the w.notification() method.

    The method should indicate its return status by invoking
    the method w.error() or w.createSubscriptionResponse()

    Errors like these are non-recoverable, meaning NCS will not attempt to
    re-establish the notification stream:

    w.error(NedCmd.CREATE_SUBSCRIPTION,
        NedErrorCode.NED_EXTERNAL_ERROR,  "...");

    When NedErrorCode.CONNECT_CONNECTION_REFUSED error code is provided
    NCS will try to re-establish the notification stream every
    /devices/device/notifications/subscription/reconnect-interval seconds.

    w.error(NedCmd.CREATE_SUBSCRIPTION,
        NedErrorCode.CONNECT_CONNECTION_REFUSED, "");

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.
- `String stream` - The notification stream to establish the subscription on.
- `String startTime` - Trigger the replay feature and indicate that the replay should
    start at the time specified. If null, this is not a replay
    subscription. It is not valid to specify start times that are
    later than the current time. If the time specified is
    earlier than the log can support, the replay will begin with
    the earliest available notification. This parameter is of
    dateTime XML schema type and compliant to RFC 3339.
    Implementations must support time zones.
- `String filter` - Indicates which subset of all possible events is of interest.
    The format of this parameter is the same as that of the filter
    parameter in the NETCONF protocol operations. If not present,
    all events not precluded by other parameters will be sent.
- `int filterType` - Indicates the type of filter if it is used:


- [`NedCmd#FILTER_NONE`](NedCmd.md#m-FILTER_NONE)
      - [`NedCmd#FILTER_XPATH`](NedCmd.md#m-FILTER_XPATH)
        - [`NedCmd#FILTER_SUBTREE`](NedCmd.md#m-FILTER_SUBTREE)

**See also:** [RFC 3339](https://tools.ietf.org/html/rfc3339), [RFC 5277](https://tools.ietf.org/html/rfc5277), [XSD\-TYPES: XML Schema Part 2: Datatypes Second Edition](https://www.w3.org/TR/xmlschema-2/)

### createTelemetrySubscription(NedWorker, Map<String,List<String>>) <a href="#m-createTelemetrySubscription-c3b822b943ab" id="m-createTelemetrySubscription-c3b822b943ab"></a>

```java
public void createTelemetrySubscription(
    com.tailf.ned.NedWorker w,
    java.util.Map<String,java.util.List<String>> settings
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

This method is invoked to create a telemetry subscription.
 After the subscription has been created the NedWorker can
 send telemetry messages with the w.telemetry(type, format, data) method.

    The method should indicate its return status by invoking
    the method w.error() or w.createTelemetrySubscriptionResponse()

    Errors like these are non-recoverable, meaning NCS will not attempt to
    re-establish the telemetry subscription:

    w.error(NedCmd.CREATE_TELEMETRY_SUBSCRIPTION,
        NedErrorCode.NED_EXTERNAL_ERROR,  "...");

    When NedErrorCode.CONNECT_CONNECTION_REFUSED error code is provided
    NCS will try to re-establish the telemetry subscription every
    /devices/device/telemetry/subscription/reconnect-interval seconds.

    w.error(NedCmd.CREATE_TELEMETRY_SUBSCRIPTION,
        NedErrorCode.CONNECT_CONNECTION_REFUSED, "");

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.
- `java.util.Map<String,java.util.List<String>> settings` - The settings to use for setting up the telemetry subscription.

**See also:** [RFC 8641](https://tools.ietf.org/html/rfc8641)

### device_id() <a href="#m-device_id-f50bb7031536" id="m-device_id-f50bb7031536"></a>

```java
public abstract String device_id()
```

The device id is originally provided by NCS to properly identify
 the device. It is the name used for the device by NCS in the
 list of devices.

### getCapas() <a href="#m-getCapas-7f9d1774e7a0" id="m-getCapas-7f9d1774e7a0"></a>

```java
public com.tailf.ned.NedCapability[] getCapas()
```

Types: [NedCapability](NedCapability.md#cls-NedCapability)

### getConnectionId() <a href="#m-getConnectionId-600ebb3e7d7f" id="m-getConnectionId-600ebb3e7d7f"></a>

```java
public int getConnectionId()
```

### getPlatformData() <a href="#m-getPlatformData-aa820968b919" id="m-getPlatformData-aa820968b919"></a>

```java
public com.tailf.conf.ConfXMLParam[] getPlatformData()
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

### getStatsCapas() <a href="#m-getStatsCapas-aa8dc0859e62" id="m-getStatsCapas-aa8dc0859e62"></a>

```java
public com.tailf.ned.NedCapability[] getStatsCapas()
```

Types: [NedCapability](NedCapability.md#cls-NedCapability)

### getTimeInPool() <a href="#m-getTimeInPool-df6d5c843d53" id="m-getTimeInPool-df6d5c843d53"></a>

```java
public long getTimeInPool()
```

### getTransactionIdMode() <a href="#m-getTransactionIdMode-79b4efc0e31d" id="m-getTransactionIdMode-79b4efc0e31d"></a>

```java
public com.tailf.ned.NedWorker.TransactionIdMode getTransactionIdMode()
```

Types: [TransactionIdMode](NedWorker/TransactionIdMode.md#cls-TransactionIdMode)

### getTransId(NedWorker) <a href="#m-getTransId-01de732a93e8" id="m-getTransId-01de732a93e8"></a>

```java
public abstract void getTransId(com.tailf.ned.NedWorker w) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

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

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.

### getUseStoredCapas() <a href="#m-getUseStoredCapas-77d5f5640e81" id="m-getUseStoredCapas-77d5f5640e81"></a>

```java
public boolean getUseStoredCapas()
```

### getWantRevertDiff() <a href="#m-getWantRevertDiff-ddea9ec7db21" id="m-getWantRevertDiff-ddea9ec7db21"></a>

```java
public boolean getWantRevertDiff()
```

### identity() <a href="#m-identity-16b9d59e26e7" id="m-identity-16b9d59e26e7"></a>

```java
public String identity()
```

This should return the a unique (among registered NedConnection classes)
 identity. It will be used by NCS when creating new connections to
 control which of the registered NedConnection classes to use.

### initialize(NedWorker) <a href="#m-initialize-b9daf0f9b461" id="m-initialize-b9daf0f9b461"></a>

```java
public void initialize(com.tailf.ned.NedWorker w) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

Used for initializing an transaction. For instance if locking
 or other transaction preparations are necessary,
 they should be performed here.
 Note, that this method has a proper implementation in the base class
 and is therefore not necessary to override if no NED specific
 transaction preparations are needed.

    The method should indicate its return status by invoking
    the method w.error() or w.initializeResponse()

    If the NED has claimed a NedWorker.TransactionIdMode other than
    not NONE a transaction id must be produced in the response same
    as for the getTransId() call.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication
    between NCS and the device. This NedWorker instance should be
    used when communicating with NCS, ie for sending responses,
    errors, and trace messages. It is also implements the NedTracer
    API and can be used in, for example, the SSHSession as a tracer.

### isAlive(NedWorker) <a href="#m-isAlive-6915ae01ec8a" id="m-isAlive-6915ae01ec8a"></a>

```java
public boolean isAlive(com.tailf.ned.NedWorker w)
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

This method is invoked to check if a connection is still
 alive. When a connection is stored in the connection pool
 it will periodically be polled to see if it is alive. If
 false is returned the connection will be closed using the
 close() method invocation.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.

### isSessionAlive(NedWorker) <a href="#m-isSessionAlive-f0d233ff28c0" id="m-isSessionAlive-f0d233ff28c0"></a>

```java
protected void isSessionAlive(com.tailf.ned.NedWorker w) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker w`

### keepAlive(NedWorker) <a href="#m-keepAlive-92dcaaf81a7a" id="m-keepAlive-92dcaaf81a7a"></a>

```java
public boolean keepAlive(com.tailf.ned.NedWorker w)
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

This method is invoked periodically to keep an connection
 alive. If false is returned the connection will be closed using the
 close() method invocation.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.

### keepSessionAlive(NedWorker) <a href="#m-keepSessionAlive-f2332bacddd5" id="m-keepSessionAlive-f2332bacddd5"></a>

```java
protected void keepSessionAlive(com.tailf.ned.NedWorker w) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

**Parameters**

- `com.tailf.ned.NedWorker w`

### modules() <a href="#m-modules-15ef53dcaf36" id="m-modules-15ef53dcaf36"></a>

```java
public abstract String[] modules()
```

Which YANG modules are covered by the class instance. This information
 is defined by the setConnectionData() call and is sent to NCS after
 initiating a new connection, or when re-establishing a connection.
 The modules() method is not actually used.

### persist(NedWorker) <a href="#m-persist-a67bc9247622" id="m-persist-a67bc9247622"></a>

```java
public abstract void persist(com.tailf.ned.NedWorker w) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

This method is invoked when the currently committed change set
 should be made permanent. This corresponds to copying the
 running configuration to the startup configuration, on a
 running/startup device, or issuing the confirming commit operation
 on a device that supports that. When completed the
 w.persistResponse() should be invoked. On error invoke the
 w.error(NedCmd.PERSIST,Error, Reason) method.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.

### reconnect(NedWorker) <a href="#m-reconnect-a7a5900d41d6" id="m-reconnect-a7a5900d41d6"></a>

```java
public abstract void reconnect(com.tailf.ned.NedWorker w) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

Used for resuming a connection found in the connection pool.

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.

### retrieveIdentity(NedConnectionBase) <a href="#m-retrieveIdentity-910704c2eafa" id="m-retrieveIdentity-910704c2eafa"></a>

```java
protected static String retrieveIdentity(
    com.tailf.ned.NedConnectionBase ned
)
    throws com.tailf.ned.NedException
```

Types: [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase), [NedException](NedException.md#cls-NedException)

**Parameters**

- `com.tailf.ned.NedConnectionBase ned`

### setCapabilities(NedCapability[]) <a href="#m-setCapabilities-67ad7861715a" id="m-setCapabilities-67ad7861715a"></a>

```java
public void setCapabilities(com.tailf.ned.NedCapability[] capas)
```

Types: [NedCapability](NedCapability.md#cls-NedCapability)

This function is used to set the capabilities for a specific NED.
 It has the same functionality as setConnectionData, but only for
 config capabilities. This is useful when initializing a NED instance
 without establishing connection to the device because other connection
 parameters such as stats capabilities, reverse diff and
 transaction id mode are irrelevant in this case

**Parameters**

- `com.tailf.ned.NedCapability[] capas` - an array of capabilities for config data

### setConnectionData(NedCapability[], NedCapability[], boolean, TransactionIdMode) <a href="#m-setConnectionData-3c1697dcc350" id="m-setConnectionData-3c1697dcc350"></a>

```java
public void setConnectionData(
    com.tailf.ned.NedCapability[] capas,
    com.tailf.ned.NedCapability[] statscapas,
    boolean wantRevertDiff,
    com.tailf.ned.NedWorker.TransactionIdMode transMode
)
```

Types: [NedCapability](NedCapability.md#cls-NedCapability), [TransactionIdMode](NedWorker/TransactionIdMode.md#cls-TransactionIdMode)

This function is used to set the parameters of NedConnection for
 a specific NED.

**Parameters**

- `com.tailf.ned.NedCapability[] capas` - an array of capabilities for config data
- `com.tailf.ned.NedCapability[] statscapas` - an array of capabilities for stats data
- `boolean wantRevertDiff` - Indicates if the NED should be provided with the edit operations
    needed to undo the configuration changes done in
    the prepare method when a transaction is aborted.
- `com.tailf.ned.NedWorker.TransactionIdMode transMode` - Indicates the mode of Transaction ID supported by the NED.
    NONE if not supported. If supported, then getTransId()
    should be implemented. Support for Transaction IDs is required
    for check-sync action.

### setConnectionId(int) <a href="#m-setConnectionId-7eea4fea28bf" id="m-setConnectionId-7eea4fea28bf"></a>

```java
protected void setConnectionId(int connectionId)
```

**Parameters**

- `int connectionId`

### setPlatformData(ConfXMLParam[]) <a href="#m-setPlatformData-a069c83c8fde" id="m-setPlatformData-a069c83c8fde"></a>

```java
public void setPlatformData(com.tailf.conf.ConfXMLParam[] platformData)
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam)

This function is used to set the platform operational data for
 a specific NED. This is optional data that can be retrieved and
 used for instance in service code.

 It is possible to augment NED specific data into the platform container
 in the NCS device model. This method is then used to set both standard
 and augmented data.

 The ConfXMLParam[] array is expected to start with the platform tag:

 The following is an example of how the platformData array would
 be structured in an example with both the NCS standard name,
 model and version leaves as well as a augmented inventory list
 with three list elements:


```
 ConfXMLParam[] platformData =
     new ConfXMLParam[] {
         new ConfXMLParamStart("ncs", "platform"),
         new ConfXMLParamValue("ncs", "name",
                               new ConfBuf("ios")),
         new ConfXMLParamValue("ncs", "version",
                               new ConfBuf("15.0M")),
         new ConfXMLParamValue("ncs", "model",
                               new ConfBuf("7200")),

         new ConfXMLParamStart("ginv", "inventory"),
         new ConfXMLParamValue("ginv", "name",
                               new ConfBuf("lx-345")),
         new ConfXMLParamValue("ginv", "value",
                               new ConfBuf("line-card")),
         new ConfXMLParamStop("ginv", "inventory"),
         new ConfXMLParamStart("ginv", "inventory"),
         new ConfXMLParamValue("ginv", nameStr,
                               new ConfBuf("lx-1001")),
         new ConfXMLParamValue("ginv", "value",
                               new ConfBuf("line-card")),
         new ConfXMLParamStop("ginv", "inventory"),
         new ConfXMLParamStart("ginv", "inventory"),
         new ConfXMLParamValue("ginv", "name",
                               new ConfBuf("FA1209A4E389")),
         new ConfXMLParamValue("ginv", "value",
                               new ConfBuf("licence")),
         new ConfXMLParamStop("ginv", "inventory"),

         new ConfXMLParamStop("ncs", "platform")
     };

      setPlatformData(platformData);
```

**Parameters**

- `com.tailf.conf.ConfXMLParam[] platformData` - An ConfXMLParam array containing operational data to be set under
  the platform container in the device model. Expected to start with
  the platform tag. If the platform container is augmented with some user
  specific model such data should also be part of this array to be set at
  connection time.

### setPoolTimestamp(long) <a href="#m-setPoolTimestamp-28239e3d2dc4" id="m-setPoolTimestamp-28239e3d2dc4"></a>

```java
protected void setPoolTimestamp(long timestamp)
```

**Parameters**

- `long timestamp`

### showStatsFilter(NedWorker, int, ConfPath[]) <a href="#m-showStatsFilter-f3bd9d17b71c" id="m-showStatsFilter-f3bd9d17b71c"></a>

```java
public void showStatsFilter(
    com.tailf.ned.NedWorker w,
    int th,
    com.tailf.conf.ConfPath[] paths
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [ConfPath](../conf/ConfPath.md#cls-ConfPath)

When this method is invoked the NED should populate the provided
 transaction th with the data corresponding to the filter.

 This method will be invoked if the NED announces the
 http://tail-f.com/ns/ncs-ned/show-stats?format=path capability.

 The method should indicate its return status by invoking
 the method w.error() or w.showStatsFilterResponse()

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.
- `int th` - a transaction handler that can be used in Maapi
- `com.tailf.conf.ConfPath[] paths` - an array of ConfPath objects indicating what is requested

### showStatsFilter(NedWorker, int, NedShowFilter[]) <a href="#m-showStatsFilter-1410355f6f46" id="m-showStatsFilter-1410355f6f46"></a>

```java
public void showStatsFilter(
    com.tailf.ned.NedWorker w,
    int th,
    com.tailf.ned.NedShowFilter[] filters
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [NedShowFilter](NedShowFilter.md#cls-NedShowFilter)

When this method is invoked the NED should populate the provided
 transaction th with the data corresponding to the filter.

 This method will be invoked if the NED announces the
 http://tail-f.com/ns/ncs-ned/show-stats?format=filter capability.

 The method should indicate its return status by invoking
 the method w.error() or w.showStatsFilterResponse()

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.
- `int th` - a transaction handler that can be used in Maapi
- `com.tailf.ned.NedShowFilter[] filters` - an array of NedShowFilter indicating what is requested

### showStatsFilter(NedWorker, int, String[]) <a href="#m-showStatsFilter-38409a8f79a0" id="m-showStatsFilter-38409a8f79a0"></a>

```java
public void showStatsFilter(com.tailf.ned.NedWorker w, int th, String[] xpaths) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

When this method is invoked the NED should populate the provided
 transaction th with the data corresponding to the filter.

 This method will be invoked if the NED announces the
 http://tail-f.com/ns/ncs-ned/show-stats?format=xpath capability.

 The method should indicate its return status by invoking
 the method w.error() or w.showStatsFilterResponse()

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.
- `int th` - a transaction handler that can be used in Maapi
- `String[] xpaths` - an array of xpath strings indicating what is requested

### showStatsPath(NedWorker, int, ConfPath) <a href="#m-showStatsPath-1704122a5ac4" id="m-showStatsPath-1704122a5ac4"></a>

```java
public void showStatsPath(
    com.tailf.ned.NedWorker w,
    int th,
    com.tailf.conf.ConfPath path
)
    throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker), [ConfPath](../conf/ConfPath.md#cls-ConfPath)

When this method is invoked depending on the node type the NED should:
  * If the path points to the list node or leaf-list node without
    specifying the key, then the NED should populate the list keys.
    The NED should also set the TTL on the list node or individual list
    instances. It may choose to write more data into the list instances
    in which case it may populate TTL values for this data as well.
  * If the path indicates a list entry, presence container, empty leaf or
    a leaf-list instance, then the NED should indicate the existence of
    this node in the data tree and return the corresponding TTL value. It
    may populate more data into the list instance or presence container in
    which case it may populate TTL values for this data as well.
  * If the path points to a leaf, then the NED should write the value of
    the leaf and indicate its TTL.
  * If the NED chooses to populate the entire subtree below the path and
    has nothing more to fetch, it should indicate so in the TTL value.
    The TTL value for this path will act as the default TTL.

 The abovementioned operations should be performed on the provided
 transaction th.

 The method should indicate its return status by invoking
 the method w.error() or w.showStatsPathResponse()

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.
- `int th` - a transaction handler that can be used in Maapi
- `com.tailf.conf.ConfPath path` - a ConfPath indication which list is requested

### type() <a href="#m-type-7a4a5f26039a" id="m-type-7a4a5f26039a"></a>

```java
public abstract String type()
```

The type is one of "cli" and "generic". This information is sent to
 NCS when the NedMux is started to let NCS know how to communicate
 with each device.

### uninitialize(NedWorker) <a href="#m-uninitialize-bba07dcc2d37" id="m-uninitialize-bba07dcc2d37"></a>

```java
public void uninitialize(com.tailf.ned.NedWorker w) throws Exception
```

Types: [NedWorker](NedWorker.md#cls-NedWorker)

If the transaction is not completed and the NED has done initialize
 this method is called to undo the transaction preparations.
 That is restoring the NED to the state before initialize.
 Note, that this method has a proper implementation in the base class
 and is therefore not necessary to override if no NED specific operations
 was performed in initialize.

    The method should indicate its return status by invoking
    the method w.error() or w.uninitializeResponse()

**Parameters**

- `com.tailf.ned.NedWorker w` - The NedWorker instance currently responsible for driving the
    communication between NCS and the device. This NedWorker
    instance should be used when communicating with NCS, i.e,
    for sending responses, errors, and trace messages. It is also
    implements the NedTracer API and can be used in, for example,
    the SSHSession as a tracer.

### useStoredCapabilities() <a href="#m-useStoredCapabilities-06864caacb8f" id="m-useStoredCapabilities-06864caacb8f"></a>

```java
public void useStoredCapabilities()
```

This function is used to set the same capabilities as stored in
 CDB for a particular device. This method can only be used when
 initializing a NED instance without establishing connection to
 the device.
