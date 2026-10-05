<a id="s-NedWorker"></a>
# NedWorker

```java
public class com.tailf.ned.NedWorker
    extends Thread
    implements com.tailf.ned.NedTracer, ch.ethz.ssh2.auth.AgentProxy
```

Types: [NedTracer](NedTracer.md#s-NedTracer)

The NedWorker is used by the NedMux for running a worker thread
 for executing NedConnection tasks.

## Members

**Constructors**:

- [NedWorker(int, NedMux, SocketAddress, String)](#s-NedWorker-1)

**Methods**:

- [abortResponse()](#s-abortResponse)
- [abortSubscription()](#s-abortSubscription)
- [addWork(NedCmd)](#s-addWork)
- [commandResponse()](#s-commandResponse)
- [commandResponse(ConfXMLParam[])](#s-commandResponse-1)
- [commitResponse()](#s-commitResponse)
- [connectError(NedErrorCode)](#s-connectError)
- [connectError(NedErrorCode, String)](#s-connectError-1)
- [createSubscriptionResponse()](#s-createSubscriptionResponse)
- [createTelemetrySubscriptionResponse()](#s-createTelemetrySubscriptionResponse)
- [currentCommand()](#s-currentCommand)
- [dorun()](#s-dorun)
- [error(int, NedErrorCode, String)](#s-error)
- [error(int, String)](#s-error-1)
- [error(int, String, String)](#s-error-2)
- [getAuthenticationAgent()](#s-getAuthenticationAgent)
- [getComment()](#s-getComment)
- [getCurrentPath()](#s-getCurrentPath)
- [getDevicePhase()](#s-getDevicePhase)
- [getFromTransactionId()](#s-getFromTransactionId)
- [getHostKeyVerifier()](#s-getHostKeyVerifier)
- [getIdentities()](#s-getIdentities)
- [getKeyDir()](#s-getKeyDir)
- [getLabel()](#s-getLabel)
- [getLoadOp()](#s-getLoadOp)
- [getNedId()](#s-getNedId)
- [getPassword()](#s-getPassword)
- [getRemoteUser()](#s-getRemoteUser)
- [getSecondaryPassword()](#s-getSecondaryPassword)
- [getSignature(int, byte[])](#s-getSignature)
- [getSourceAddress()](#s-getSourceAddress)
- [getToTransactionId()](#s-getToTransactionId)
- [getTransIdResponse(String)](#s-getTransIdResponse)
- [getUsid()](#s-getUsid)
- [initializeResponse(String)](#s-initializeResponse)
- [isAliveResponse(boolean)](#s-isAliveResponse)
- [isSuppressTransId()](#s-isSuppressTransId)
- [isVerbose()](#s-isVerbose)
- [log(String)](#s-log)
- [notification(String)](#s-notification)
- [persistResponse()](#s-persistResponse)
- [prepareDryResponse(String)](#s-prepareDryResponse)
- [prepareDryUnsupportedResponse()](#s-prepareDryUnsupportedResponse)
- [prepareResponse()](#s-prepareResponse)
- [revertResponse()](#s-revertResponse)
- [run()](#s-run)
- [sendHandshake()](#s-sendHandshake)
- [setAdditionalInfo(String)](#s-setAdditionalInfo)
- [setProvisionalTransId(String)](#s-setProvisionalTransId)
- [setTimeout(int)](#s-setTimeout)
- [showCliResponse(ArrayList<String>)](#s-showCliResponse)
- [showCliResponse(String)](#s-showCliResponse-1)
- [showGenericResponse()](#s-showGenericResponse)
- [showStatsFilterResponse()](#s-showStatsFilterResponse)
- [showStatsPathResponse(NedTTL[])](#s-showStatsPathResponse)
- [shutdown()](#s-shutdown)
- [telemetry(TelemetryType, TelemetryFormat, String)](#s-telemetry)
- [trace(String, String, String)](#s-trace)
- [trySendResponse(Socket, ConfEObject)](#s-trySendResponse)
- [uninitializeResponse()](#s-uninitializeResponse)

**Nested Types**:

- [NotEnoughDataException](NedWorker/NotEnoughDataException.md#s-NotEnoughDataException)
- [NotImplementedException](NedWorker/NotImplementedException.md#s-NotImplementedException)
- [TransactionIdMode](NedWorker/TransactionIdMode.md#s-TransactionIdMode)

## Constructors

<a id="s-NedWorker-1"></a>
### NedWorker(int, NedMux, SocketAddress, String)

```java
public NedWorker(int wid, com.tailf.ned.NedMux mux, java.net.SocketAddress address, String id)
```

Types: [NedMux](NedMux.md#s-NedMux)

**Parameters**

- `int wid`
- `com.tailf.ned.NedMux mux`
- `java.net.SocketAddress address`
- `String id`


## Methods

<a id="s-abortResponse"></a>
### abortResponse()

```java
public void abortResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method is called by the NED to indicate that the
 abort method has been successfully completed. If the NED
 is unable to complete the abort the error method should
 be invoked instead.

<a id="s-abortSubscription"></a>
### abortSubscription()

```java
protected void abortSubscription()
```

<a id="s-addWork"></a>
### addWork(NedCmd)

```java
public void addWork(com.tailf.ned.NedCmd work)
```

Types: [NedCmd](NedCmd.md#s-NedCmd)

**Parameters**

- `com.tailf.ned.NedCmd work`

<a id="s-commandResponse"></a>
### commandResponse()

```java
public void commandResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method is called by the NED to indicate that the
 command method has been successfully completed. If the NED
 is unable to complete the command the error method should
 be invoked instead.

<a id="s-commandResponse-1"></a>
### commandResponse(ConfXMLParam[])

```java
public void commandResponse(
    com.tailf.conf.ConfXMLParam[] reply
)
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NedException](NedException.md#s-NedException)

This method is called by the NED to indicate that the
 command method has been successfully completed when the NED
 also has a reply. If the NED
 is unable to complete the command the error method should
 be invoked instead.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] reply` - is the return value from executing the command

<a id="s-commitResponse"></a>
### commitResponse()

```java
public void commitResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method should be invoked by a NedConnection instance when it has
 completed a commit operation to indicate a successful completion
 of the commit.

<a id="s-connectError"></a>
### connectError(NedErrorCode)

```java
public void connectError(com.tailf.ned.NedErrorCode code) throws com.tailf.ned.NedException
```

Types: [NedErrorCode](NedErrorCode.md#s-NedErrorCode), [NedException](NedException.md#s-NedException)

See [`NedWorker`](NedWorker.md#s-NedWorker)

**Parameters**

- `com.tailf.ned.NedErrorCode code`

<a id="s-connectError-1"></a>
### connectError(NedErrorCode, String)

```java
public void connectError(
    com.tailf.ned.NedErrorCode code,
    String info
)
    throws com.tailf.ned.NedException
```

Types: [NedErrorCode](NedErrorCode.md#s-NedErrorCode), [NedException](NedException.md#s-NedException)

This method should be invoked if the NED fails to perform the
 connect() operation.

**Parameters**

- `com.tailf.ned.NedErrorCode code` - is the reason for the connect to fail. See
    [`NedErrorCode`](NedErrorCode.md#s-NedErrorCode),
    [`NedErrorCode`](NedErrorCode.md#s-NedErrorCode),
    etc.
- `String info` - is a string describing the connect error. Normally this parameter
    is not needed. If it is given, it will be appended to the
    error message all the way to the northbound agent invoking
    the NED connect call

<a id="s-createSubscriptionResponse"></a>
### createSubscriptionResponse()

```java
public void createSubscriptionResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method is invoked by a NedConnection instance when it has
 completed to create a notification subscription. If the NED
 is unable to create the subscription the error method should
 be invoked instead.

<a id="s-createTelemetrySubscriptionResponse"></a>
### createTelemetrySubscriptionResponse()

```java
public void createTelemetrySubscriptionResponse() throws java.io.IOException, com.tailf.ned.NedException
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method is invoked by a NedConnection instance when it has
 completed to create a telemetry subscription. If the NED
 is unable to create the subscription the error method should
 be invoked instead.

<a id="s-currentCommand"></a>
### currentCommand()

```java
public com.tailf.ned.NedCmd currentCommand()
```

Types: [NedCmd](NedCmd.md#s-NedCmd)

<a id="s-dorun"></a>
### dorun()

**Package-private**

```java
void dorun() throws Exception
```

<a id="s-error"></a>
### error(int, NedErrorCode, String)

```java
public void error(int op, com.tailf.ned.NedErrorCode errCode, String reason)
```

Types: [NedErrorCode](NedErrorCode.md#s-NedErrorCode)

This function should be called when a callback like abort,persist,
 etc cannot be completed.

**Parameters**

- `int op` - is the command originally issued from NCS, ie a NedCmd.getCommand()
    integer like NedCmd.CONNECT_CLI, NedCmd.CONNECT_GENERIC,
    NedCmd.PREPARE_CLI, ...
- `com.tailf.ned.NedErrorCode errCode` - NedErrorCode for the error
- `String reason` - textual description of the reason for the error

<a id="s-error-1"></a>
### error(int, String)

```java
public void error(int op, String reason)
```

This function should be called when a callback like abort,persist,
 etc cannot be completed.

**Parameters**

- `int op` - is the command originally issued from NCS, ie a NedCmd.getCommand()
    integer like NedCmd.CONNECT_CLI, NedCmd.CONNECT_GENERIC,
    NedCmd.PREPARE_CLI, ...
- `String reason` - is the reason for the error

<a id="s-error-2"></a>
### error(int, String, String)

```java
public void error(int op, String error, String reason)
```

This error report function is kept for backward compatible reasons and
 should if possible be avoided.

 The "error" string parameter is expected to be the string representation
 of on of the NedErrorCode values. If this is not the case this function
 will fallback to NED_EXTERNAL_ERROR code and concatenate the original
 error string together with the reason.

**Parameters**

- `int op` - is the command originally issued from NCS, ie a NedCmd.getCommand()
    integer like NedCmd.CONNECT_CLI, NedCmd.CONNECT_GENERIC,
    NedCmd.PREPARE_CLI, ...
- `String error` - string representation of a NedErrorCode
- `String reason` - textual description of the reason for the error

<a id="s-getAuthenticationAgent"></a>
### getAuthenticationAgent()

```java
protected ch.ethz.ssh2.auth.AgentProxy getAuthenticationAgent()
```

<a id="s-getComment"></a>
### getComment()

```java
public String getComment()
```

This method returns the commit comment.

**Returns:** null or a comment describing the commit

<a id="s-getCurrentPath"></a>
### getCurrentPath()

```java
public com.tailf.conf.ConfPath getCurrentPath()
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

This method returns the current path associated with the
 action being processed. This method only returns valid
 data when called during an action invokation.

**Returns:** a ConfPath to the node which contains the action.

<a id="s-getDevicePhase"></a>
### getDevicePhase()

```java
public String getDevicePhase()
```

Get the phase of the device.

<a id="s-getFromTransactionId"></a>
### getFromTransactionId()

```java
public int getFromTransactionId()
```

This method returns an integer that represents the transaction
 we are going from. In the normal case this is normally just
 'running', but not always.
 It's possible to use Maapi.attach() on this transaction Id.
 [`Maapi`](../maapi/Maapi.md#s-Maapi)
 Some complicated NEDs may require to read data from the system
 the way it looked like before the current transaction arrived.

**Returns:** a transaction integer.

<a id="s-getHostKeyVerifier"></a>
### getHostKeyVerifier()

```java
protected ch.ethz.ssh2.ServerHostKeyVerifier getHostKeyVerifier()
```

<a id="s-getIdentities"></a>
### getIdentities()

```java
public java.util.Collection<ch.ethz.ssh2.auth.AgentIdentity> getIdentities()
```

<a id="s-getKeyDir"></a>
### getKeyDir()

```java
public String getKeyDir()
```

This method returns the ssh public key directory as defined in the
 auth map.

**Returns:** null or a directory containing ssh public keys

<a id="s-getLabel"></a>
### getLabel()

```java
public String getLabel()
```

This method returns the commit label.

**Returns:** null or the commit label

<a id="s-getLoadOp"></a>
### getLoadOp()

```java
public int getLoadOp()
```

This method returns the load operation that should
 be used when populating the transaction in any of
 the show methods.

<a id="s-getNedId"></a>
### getNedId()

```java
public String getNedId()
```

This method returns the ned-id for the ned associated with this worker.

**Returns:** the ned-id of the ned associated with this worker

<a id="s-getPassword"></a>
### getPassword()

```java
public String getPassword()
```

This method returns the backend password as defined in the
 auth map.

**Returns:** password to connect to backend with

<a id="s-getRemoteUser"></a>
### getRemoteUser()

```java
public String getRemoteUser()
```

This method returns the backend user name as defined in the
 auth map.

**Returns:** name of user to connect to backend as

<a id="s-getSecondaryPassword"></a>
### getSecondaryPassword()

```java
public String getSecondaryPassword()
```

This method returns the backend secondary password as defined in the
 auth map.

**Returns:** secondary password to connect to backend with

<a id="s-getSignature"></a>
### getSignature(int, byte[])

```java
public byte[] getSignature(int keyId, byte[] data) throws Exception
```

**Parameters**

- `int keyId`
- `byte[] data`

<a id="s-getSourceAddress"></a>
### getSourceAddress()

```java
public java.net.InetSocketAddress getSourceAddress()
```

This method returns the source IP address if such an address
 is configured in the ncs configuration.
 If not configured this method returns null.

**Returns:** the source IP address or null if not configured

<a id="s-getToTransactionId"></a>
### getToTransactionId()

```java
public int getToTransactionId()
```

This method returns an integer that represents the transaction
 we are going to, i.e the proposed new system state.
 It's possible to use Maapi.attach() on this transaction Id.
 [`Maapi`](../maapi/Maapi.md#s-Maapi)
 Some complicated NEDs may require to read data from the system
 the way it is going to look like once the current transaction is
 committed.

**Returns:** a transaction integer.

<a id="s-getTransIdResponse"></a>
### getTransIdResponse(String)

```java
public void getTransIdResponse(String id) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method is called by the NED to send a response to the
 getTransId request. If the NED
 is unable to complete the command the error method should
 be invoked instead.

**Parameters**

- `String id` - is a string representing a transaction id

<a id="s-getUsid"></a>
### getUsid()

```java
public int getUsid()
```

This method returns an integer that represents the user session
 that initiated this NedWorker. If we wish to do
 Maapi.attach() to any of the from/to transactions we need the
 user session id

**Returns:** a user session id

<a id="s-initializeResponse"></a>
### initializeResponse(String)

```java
public void initializeResponse(String id) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method is called by the NED to send a response to the
 initialize request. If the NED
 is unable to complete the command the error method should
 be invoked instead.

**Parameters**

- `String id` - is a string representing a transaction id

<a id="s-isAliveResponse"></a>
### isAliveResponse(boolean)

```java
public void isAliveResponse(boolean alive) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

**Parameters**

- `boolean alive`

<a id="s-isSuppressTransId"></a>
### isSuppressTransId()

```java
public boolean isSuppressTransId()
```

The initialize call can request the trans_id response to be suppressed.
 This method must be called to check if that is the case.

<a id="s-isVerbose"></a>
### isVerbose()

```java
public boolean isVerbose()
```

This method helps the NED determine whether an action has been invoked
 with the verbose parameter.
 If an action has been invoked with the verbose parameter, then the NED
 may choose to report additional information using
 `#setAdditionalInfo(String)`.

<a id="s-log"></a>
### log(String)

```java
public void log(String msg) throws Exception
```

Send log messages to NCS. The log messages will end up at... FIXME

**Parameters**

- `String msg`

<a id="s-notification"></a>
### notification(String)

```java
public void notification(String data)
```

Send notification to NCS once subsciption has been created.

**Parameters**

- `String data`

<a id="s-persistResponse"></a>
### persistResponse()

```java
public void persistResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method is called by the NED to indicate that the
 persist method has been successfully completed. If the NED
 is unable to complete the persist the error method should
 be invoked instead.

<a id="s-prepareDryResponse"></a>
### prepareDryResponse(String)

```java
public void prepareDryResponse(String output) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method should be invoked by a NedConnection instance when it has
 completed a prepare dry operation to indicate a successful completion
 of and the result of the dry run.

**Parameters**

- `String output`

<a id="s-prepareDryUnsupportedResponse"></a>
### prepareDryUnsupportedResponse()

```java
public void prepareDryUnsupportedResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method should be invoked by a NedConnection instance when a
 prepare dry operation is invoked and the NED is not able to support
 such an operation.

<a id="s-prepareResponse"></a>
### prepareResponse()

```java
public void prepareResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method should be invoked by a NedConnection instance when it has
 completed a prepare operation to indicate a successful completion
 of the prepare.

<a id="s-revertResponse"></a>
### revertResponse()

```java
public void revertResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method should be invoked by a NedConnection instance when it has
 completed a revert operation to indicate a successful completion
 of the revert.

<a id="s-run"></a>
### run()

```java
public void run()
```

<a id="s-sendHandshake"></a>
### sendHandshake()

```java
protected void sendHandshake() throws java.io.IOException
```

<a id="s-setAdditionalInfo"></a>
### setAdditionalInfo(String)

```java
public void setAdditionalInfo(String info)
```

Set information to be passed back to the caller, typically
 parse information if the user invokes a show action with
 the verbose parameter.

**Parameters**

- `String info`

<a id="s-setProvisionalTransId"></a>
### setProvisionalTransId(String)

```java
public void setProvisionalTransId(String id)
```

This method allows the NED to set transaction ID provisionally from
 [`NedCliBase`](NedCliBase.md#s-NedCliBase) or
 [`NedGenericBase`](NedGenericBase.md#s-NedGenericBase) NED callback.
 If NSO needs to fetch the transaction ID immediately after the show()
 callback, it will first check whether the show() callback has indicated
 any provisional transaction ID and in such case use this value. If no
 provisional transaction ID has been supplied, then NSO will call
 getTransId() as needed.

 If a CLI NED has multiple top tags, then show() callback may be called
 multiple times as a part of single operation. In such case the NSO will
 only use the provisional transaction ID if show() has been called on all
 top tags as a part of such logical operation, and the last provisional
 transaction ID set by the NED will be used.

**Parameters**

- `String id`

<a id="s-setTimeout"></a>
### setTimeout(int)

```java
public void setTimeout(int ms)
```

When the NED worker gets invoked, it gets passed three timeout
 values, connect/read/write timeouts. The NED code shall try to honor
 these timeouts. However, if the NED code fails to do that, the
 NCS itself has a timeout. The timeouts are config parameters
 under /devices/device/connect-timeout,
 /devices/device/read-timeout, and
 /devices/device/write-timeout.
 NCS will add 3 seconds to that timeout, and if the NED doesn't
 honor the timeouts, NCS will internally timeout the request.
 This method can be used to increase the timeout. I.e a NED that knows
 it is doing useful work, can prolong the configured timeouts.

**Parameters**

- `int ms` - the number of milliseconds to set the new timeout to.

<a id="s-showCliResponse"></a>
### showCliResponse(ArrayList<String>)

```java
public void showCliResponse(
    java.util.ArrayList<String> l
)
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

**Parameters**

- `java.util.ArrayList<String> l`

<a id="s-showCliResponse-1"></a>
### showCliResponse(String)

```java
public void showCliResponse(String config) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method is invoked by a NedCli instance in response to a show
 method invocation. The config string should consist the relevant
 parts of the output from issuing the equivalent of 'show
 running-config'
 in a Cisco like CLI. The output must correspond to the data model
 provided in the capabilities sent as a response to the (re)connect
 request.

**Parameters**

- `String config`

<a id="s-showGenericResponse"></a>
### showGenericResponse()

```java
public void showGenericResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method is invoked by a NedGeneric when it has completed
 populating the transaction with the requested configuration
 sub-tree. It indicates that the operation was successful.

<a id="s-showStatsFilterResponse"></a>
### showStatsFilterResponse()

```java
public void showStatsFilterResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method is invoked during the showStatsFilter() request
 to indicate that the NED has successfully populated the requested
 transaction.

<a id="s-showStatsPathResponse"></a>
### showStatsPathResponse(NedTTL[])

```java
public void showStatsPathResponse(
    com.tailf.ned.NedTTL[] ttls
)
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedTTL](NedTTL.md#s-NedTTL), [NedException](NedException.md#s-NedException)

This method is invoked during the showStatsPath() request
 to indicate that the NED has successfully populated the requested
 subtree.

**Parameters**

- `com.tailf.ned.NedTTL[] ttls` - an array of ttls for different paths. The NED may optionally provide
    different cache timeouts for different paths.

<a id="s-shutdown"></a>
### shutdown()

```java
protected void shutdown()
```

<a id="s-telemetry"></a>
### telemetry(TelemetryType, TelemetryFormat, String)

```java
public void telemetry(
    com.tailf.ned.TelemetryType type,
    com.tailf.ned.TelemetryFormat format,
    String data
)
```

Types: [TelemetryType](TelemetryType.md#s-TelemetryType), [TelemetryFormat](TelemetryFormat.md#s-TelemetryFormat)

Send telemetry to NCS once a subscription has been created.

**Parameters**

- `com.tailf.ned.TelemetryType type` - Type of the telemetry data.
- `com.tailf.ned.TelemetryFormat format` - Format of the telemetry data.
- `String data` - A telemetry notification (as defined in RFC8641), the
               push-update/datastore-contents or
               push-change-update/datastore-changes data.

<a id="s-trace"></a>
### trace(String, String, String)

```java
public void trace(String msg, String direction, String deviceId)
```

Send trace message to the NCS. The message will end up at... FIXME

**Parameters**

- `String msg`
- `String direction`
- `String deviceId`

<a id="s-trySendResponse"></a>
### trySendResponse(Socket, ConfEObject)

**Package-private**

```java
void trySendResponse(java.net.Socket sock, com.tailf.proto.ConfEObject t) throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

Check that the thread could actually send back the response
 `t` back to NCS. If this thread was interrupted by the
 NedMux which happend when NedMux recieve RESTART request from NCS
 through the control socket or the NedMux.stopRequest() was issued.

 In case assume that the socket was closed by the other end.
 This will prevent a "Broken pipe" IOException to occure.

 The intterupted thread would die short after it will call
 `getWork` method where it will throw the
  `InterruptedException`
 and return null from the `getWork` method.

**Parameters**

- `java.net.Socket sock` - the worker socket for sending back the response
- `com.tailf.proto.ConfEObject t` - the term to send to the worker socket

**Throws**

- `IOException` - if in case of failure to write back the request
 on the socket outputstream.

<a id="s-uninitializeResponse"></a>
### uninitializeResponse()

```java
public void uninitializeResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#s-NedException)

This method should be invoked by a NedConnection instance when it has
 completed a uninitialize operation to indicate a successful
 uninitialization


## Nested Types

- [NotEnoughDataException](NedWorker/NotEnoughDataException.md)
- [NotImplementedException](NedWorker/NotImplementedException.md)
- [TransactionIdMode](NedWorker/TransactionIdMode.md)
