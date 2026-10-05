<a id="cls-NedWorker"></a>
# NedWorker

```java
public class com.tailf.ned.NedWorker
    extends Thread
    implements com.tailf.ned.NedTracer, ch.ethz.ssh2.auth.AgentProxy
```

Types: [NedTracer](NedTracer.md#cls-NedTracer)

The NedWorker is used by the NedMux for running a worker thread
 for executing NedConnection tasks.

## Members

**Constructors**:

- [NedWorker(int, NedMux, SocketAddress, String)](#m-nedworker-4e2ecdbb9653)

**Methods**:

- [abortResponse()](#m-abortresponse-57f9d5e240e8)
- [commandResponse()](#m-commandresponse-136a56ef82b3)
- [commandResponse(ConfXMLParam[])](#m-commandresponse-60289df4d880)
- [commitResponse()](#m-commitresponse-89759cfebfe4)
- [connectError(NedErrorCode)](#m-connecterror-2a5e6621485f)
- [connectError(NedErrorCode, String)](#m-connecterror-68192226b176)
- [createSubscriptionResponse()](#m-createsubscriptionresponse-bf0d6f96b6a0)
- [createTelemetrySubscriptionResponse()](#m-createtelemetrysubscriptionresponse-1ac60d98dad0)
- [currentCommand()](#m-currentcommand-070f1f079135)
- [dorun()](#m-dorun-4965d2173fd3)
- [error(int, NedErrorCode, String)](#m-error-4da190fc7a8c)
- [error(int, String)](#m-error-453b6a3b8f77)
- [error(int, String, String)](#m-error-ef653fe52f55)
- [getComment()](#m-getcomment-a5625f95afef)
- [getCurrentPath()](#m-getcurrentpath-698747d0fbeb)
- [getDevicePhase()](#m-getdevicephase-8b082012881e)
- [getFromTransactionId()](#m-getfromtransactionid-c49683f287a8)
- [getKeyDir()](#m-getkeydir-07c13308c833)
- [getLabel()](#m-getlabel-72bf899bf6f1)
- [getLoadOp()](#m-getloadop-ab5127869701)
- [getNedId()](#m-getnedid-74e70b4078d8)
- [getPassword()](#m-getpassword-003001cc6c91)
- [getRemoteUser()](#m-getremoteuser-bdfb4a23b5ff)
- [getSecondaryPassword()](#m-getsecondarypassword-34fb12bcee21)
- [getSourceAddress()](#m-getsourceaddress-873953ea3b38)
- [getToTransactionId()](#m-gettotransactionid-3beba3c28e0e)
- [getTransIdResponse(String)](#m-gettransidresponse-5f28e5978df8)
- [getUsid()](#m-getusid-62d0ecfd68fd)
- [initializeResponse(String)](#m-initializeresponse-af0fdce0a5bb)
- [isAliveResponse(boolean)](#m-isaliveresponse-e9b3b03792f5)
- [isSuppressTransId()](#m-issuppresstransid-ea2b7aa87e80)
- [isVerbose()](#m-isverbose-224af8693204)
- [log(String)](#m-log-3f94043670a3)
- [notification(String)](#m-notification-fc6c29ffd2b3)
- [persistResponse()](#m-persistresponse-e5069f9de1a7)
- [prepareDryResponse(String)](#m-preparedryresponse-4249bd793b22)
- [prepareDryUnsupportedResponse()](#m-preparedryunsupportedresponse-79bc01c84b05)
- [prepareResponse()](#m-prepareresponse-7eadf3b8db0f)
- [revertResponse()](#m-revertresponse-a85f70d26645)
- [run()](#m-run-b6dbda048863)
- [sendHandshake()](#m-sendhandshake-63d3ff7f1ea0)
- [setAdditionalInfo(String)](#m-setadditionalinfo-b262ce567572)
- [setProvisionalTransId(String)](#m-setprovisionaltransid-e17c71c7b76d)
- [setTimeout(int)](#m-settimeout-cbe758ecb5d8)
- [showCliResponse(ArrayList<String>)](#m-showcliresponse-3a741bb014b0)
- [showCliResponse(String)](#m-showcliresponse-948708ab930c)
- [showGenericResponse()](#m-showgenericresponse-be3696329498)
- [showStatsFilterResponse()](#m-showstatsfilterresponse-d3516e0db02c)
- [showStatsPathResponse(NedTTL[])](#m-showstatspathresponse-95090ea9fbc3)
- [telemetry(TelemetryType, TelemetryFormat, String)](#m-telemetry-23bbdd9142b8)
- [trace(String, String, String)](#m-trace-4c88f986a203)
- [trySendResponse(Socket, ConfEObject)](#m-trysendresponse-e175f3a65374)
- [uninitializeResponse()](#m-uninitializeresponse-2fcb472eb32a)

**Nested Types**:

- [NotEnoughDataException](NedWorker/NotEnoughDataException.md#cls-NotEnoughDataException)
- [NotImplementedException](NedWorker/NotImplementedException.md#cls-NotImplementedException)
- [TransactionIdMode](NedWorker/TransactionIdMode.md#cls-TransactionIdMode)

## Constructors

<a id="m-nedworker-4e2ecdbb9653"></a>
### NedWorker(int, NedMux, SocketAddress, String)

```java
public NedWorker(int wid, com.tailf.ned.NedMux mux, java.net.SocketAddress address, String id)
```

Types: [NedMux](NedMux.md#cls-NedMux)

**Parameters**

- `int wid`
- `com.tailf.ned.NedMux mux`
- `java.net.SocketAddress address`
- `String id`


## Methods

<a id="m-abortresponse-57f9d5e240e8"></a>
### abortResponse()

```java
public void abortResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method is called by the NED to indicate that the
 abort method has been successfully completed. If the NED
 is unable to complete the abort the error method should
 be invoked instead.

<a id="m-commandresponse-136a56ef82b3"></a>
### commandResponse()

```java
public void commandResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method is called by the NED to indicate that the
 command method has been successfully completed. If the NED
 is unable to complete the command the error method should
 be invoked instead.

<a id="m-commandresponse-60289df4d880"></a>
### commandResponse(ConfXMLParam[])

```java
public void commandResponse(
    com.tailf.conf.ConfXMLParam[] reply
)
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NedException](NedException.md#cls-NedException)

This method is called by the NED to indicate that the
 command method has been successfully completed when the NED
 also has a reply. If the NED
 is unable to complete the command the error method should
 be invoked instead.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] reply` - is the return value from executing the command

<a id="m-commitresponse-89759cfebfe4"></a>
### commitResponse()

```java
public void commitResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method should be invoked by a NedConnection instance when it has
 completed a commit operation to indicate a successful completion
 of the commit.

<a id="m-connecterror-2a5e6621485f"></a>
### connectError(NedErrorCode)

```java
public void connectError(com.tailf.ned.NedErrorCode code) throws com.tailf.ned.NedException
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode), [NedException](NedException.md#cls-NedException)

See [`NedWorker#connectError(NedErrorCode, String)`](NedWorker.md#m-connecterror-68192226b176)

**Parameters**

- `com.tailf.ned.NedErrorCode code`

<a id="m-connecterror-68192226b176"></a>
### connectError(NedErrorCode, String)

```java
public void connectError(
    com.tailf.ned.NedErrorCode code,
    String info
)
    throws com.tailf.ned.NedException
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode), [NedException](NedException.md#cls-NedException)

This method should be invoked if the NED fails to perform the
 connect() operation.

**Parameters**

- `com.tailf.ned.NedErrorCode code` - is the reason for the connect to fail. See
    [`NedErrorCode#CONNECT_CONNECTION_REFUSED`](NedErrorCode.md#m-CONNECT_CONNECTION_REFUSED),
    [`NedErrorCode#CONNECT_TIMEOUT`](NedErrorCode.md#m-CONNECT_TIMEOUT),
    etc.
- `String info` - is a string describing the connect error. Normally this parameter
    is not needed. If it is given, it will be appended to the
    error message all the way to the northbound agent invoking
    the NED connect call

<a id="m-createsubscriptionresponse-bf0d6f96b6a0"></a>
### createSubscriptionResponse()

```java
public void createSubscriptionResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method is invoked by a NedConnection instance when it has
 completed to create a notification subscription. If the NED
 is unable to create the subscription the error method should
 be invoked instead.

<a id="m-createtelemetrysubscriptionresponse-1ac60d98dad0"></a>
### createTelemetrySubscriptionResponse()

```java
public void createTelemetrySubscriptionResponse() throws java.io.IOException, com.tailf.ned.NedException
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method is invoked by a NedConnection instance when it has
 completed to create a telemetry subscription. If the NED
 is unable to create the subscription the error method should
 be invoked instead.

<a id="m-currentcommand-070f1f079135"></a>
### currentCommand()

```java
public com.tailf.ned.NedCmd currentCommand()
```

Types: [NedCmd](NedCmd.md#cls-NedCmd)

<a id="m-dorun-4965d2173fd3"></a>
### dorun()

**Package-private**

```java
void dorun() throws Exception
```

<a id="m-error-4da190fc7a8c"></a>
### error(int, NedErrorCode, String)

```java
public void error(int op, com.tailf.ned.NedErrorCode errCode, String reason)
```

Types: [NedErrorCode](NedErrorCode.md#cls-NedErrorCode)

This function should be called when a callback like abort,persist,
 etc cannot be completed.

**Parameters**

- `int op` - is the command originally issued from NCS, ie a NedCmd.getCommand()
    integer like NedCmd.CONNECT_CLI, NedCmd.CONNECT_GENERIC,
    NedCmd.PREPARE_CLI, ...
- `com.tailf.ned.NedErrorCode errCode` - NedErrorCode for the error
- `String reason` - textual description of the reason for the error

<a id="m-error-453b6a3b8f77"></a>
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

<a id="m-error-ef653fe52f55"></a>
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

<a id="m-getcomment-a5625f95afef"></a>
### getComment()

```java
public String getComment()
```

This method returns the commit comment.

**Returns:** null or a comment describing the commit

<a id="m-getcurrentpath-698747d0fbeb"></a>
### getCurrentPath()

```java
public com.tailf.conf.ConfPath getCurrentPath()
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

This method returns the current path associated with the
 action being processed. This method only returns valid
 data when called during an action invokation.

**Returns:** a ConfPath to the node which contains the action.

<a id="m-getdevicephase-8b082012881e"></a>
### getDevicePhase()

```java
public String getDevicePhase()
```

Get the phase of the device.

<a id="m-getfromtransactionid-c49683f287a8"></a>
### getFromTransactionId()

```java
public int getFromTransactionId()
```

This method returns an integer that represents the transaction
 we are going from. In the normal case this is normally just
 'running', but not always.
 It's possible to use Maapi.attach() on this transaction Id.
 [`Maapi#attach(int,int,int)`](../maapi/Maapi.md#m-attach-59771e44614d)
 Some complicated NEDs may require to read data from the system
 the way it looked like before the current transaction arrived.

**Returns:** a transaction integer.

<a id="m-getkeydir-07c13308c833"></a>
### getKeyDir()

```java
public String getKeyDir()
```

This method returns the ssh public key directory as defined in the
 auth map.

**Returns:** null or a directory containing ssh public keys

<a id="m-getlabel-72bf899bf6f1"></a>
### getLabel()

```java
public String getLabel()
```

This method returns the commit label.

**Returns:** null or the commit label

<a id="m-getloadop-ab5127869701"></a>
### getLoadOp()

```java
public int getLoadOp()
```

This method returns the load operation that should
 be used when populating the transaction in any of
 the show methods.

<a id="m-getnedid-74e70b4078d8"></a>
### getNedId()

```java
public String getNedId()
```

This method returns the ned-id for the ned associated with this worker.

**Returns:** the ned-id of the ned associated with this worker

<a id="m-getpassword-003001cc6c91"></a>
### getPassword()

```java
public String getPassword()
```

This method returns the backend password as defined in the
 auth map.

**Returns:** password to connect to backend with

<a id="m-getremoteuser-bdfb4a23b5ff"></a>
### getRemoteUser()

```java
public String getRemoteUser()
```

This method returns the backend user name as defined in the
 auth map.

**Returns:** name of user to connect to backend as

<a id="m-getsecondarypassword-34fb12bcee21"></a>
### getSecondaryPassword()

```java
public String getSecondaryPassword()
```

This method returns the backend secondary password as defined in the
 auth map.

**Returns:** secondary password to connect to backend with

<a id="m-getsourceaddress-873953ea3b38"></a>
### getSourceAddress()

```java
public java.net.InetSocketAddress getSourceAddress()
```

This method returns the source IP address if such an address
 is configured in the ncs configuration.
 If not configured this method returns null.

**Returns:** the source IP address or null if not configured

<a id="m-gettotransactionid-3beba3c28e0e"></a>
### getToTransactionId()

```java
public int getToTransactionId()
```

This method returns an integer that represents the transaction
 we are going to, i.e the proposed new system state.
 It's possible to use Maapi.attach() on this transaction Id.
 [`Maapi#attach(int,int,int)`](../maapi/Maapi.md#m-attach-59771e44614d)
 Some complicated NEDs may require to read data from the system
 the way it is going to look like once the current transaction is
 committed.

**Returns:** a transaction integer.

<a id="m-gettransidresponse-5f28e5978df8"></a>
### getTransIdResponse(String)

```java
public void getTransIdResponse(String id) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method is called by the NED to send a response to the
 getTransId request. If the NED
 is unable to complete the command the error method should
 be invoked instead.

**Parameters**

- `String id` - is a string representing a transaction id

<a id="m-getusid-62d0ecfd68fd"></a>
### getUsid()

```java
public int getUsid()
```

This method returns an integer that represents the user session
 that initiated this NedWorker. If we wish to do
 Maapi.attach() to any of the from/to transactions we need the
 user session id

**Returns:** a user session id

<a id="m-initializeresponse-af0fdce0a5bb"></a>
### initializeResponse(String)

```java
public void initializeResponse(String id) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method is called by the NED to send a response to the
 initialize request. If the NED
 is unable to complete the command the error method should
 be invoked instead.

**Parameters**

- `String id` - is a string representing a transaction id

<a id="m-isaliveresponse-e9b3b03792f5"></a>
### isAliveResponse(boolean)

```java
public void isAliveResponse(boolean alive) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

**Parameters**

- `boolean alive`

<a id="m-issuppresstransid-ea2b7aa87e80"></a>
### isSuppressTransId()

```java
public boolean isSuppressTransId()
```

The initialize call can request the trans_id response to be suppressed.
 This method must be called to check if that is the case.

<a id="m-isverbose-224af8693204"></a>
### isVerbose()

```java
public boolean isVerbose()
```

This method helps the NED determine whether an action has been invoked
 with the verbose parameter.
 If an action has been invoked with the verbose parameter, then the NED
 may choose to report additional information using
 `#setAdditionalInfo(String)`.

<a id="m-log-3f94043670a3"></a>
### log(String)

```java
public void log(String msg) throws Exception
```

Send log messages to NCS. The log messages will end up at... FIXME

**Parameters**

- `String msg`

<a id="m-notification-fc6c29ffd2b3"></a>
### notification(String)

```java
public void notification(String data)
```

Send notification to NCS once subsciption has been created.

**Parameters**

- `String data`

<a id="m-persistresponse-e5069f9de1a7"></a>
### persistResponse()

```java
public void persistResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method is called by the NED to indicate that the
 persist method has been successfully completed. If the NED
 is unable to complete the persist the error method should
 be invoked instead.

<a id="m-preparedryresponse-4249bd793b22"></a>
### prepareDryResponse(String)

```java
public void prepareDryResponse(String output) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method should be invoked by a NedConnection instance when it has
 completed a prepare dry operation to indicate a successful completion
 of and the result of the dry run.

**Parameters**

- `String output`

<a id="m-preparedryunsupportedresponse-79bc01c84b05"></a>
### prepareDryUnsupportedResponse()

```java
public void prepareDryUnsupportedResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method should be invoked by a NedConnection instance when a
 prepare dry operation is invoked and the NED is not able to support
 such an operation.

<a id="m-prepareresponse-7eadf3b8db0f"></a>
### prepareResponse()

```java
public void prepareResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method should be invoked by a NedConnection instance when it has
 completed a prepare operation to indicate a successful completion
 of the prepare.

<a id="m-revertresponse-a85f70d26645"></a>
### revertResponse()

```java
public void revertResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method should be invoked by a NedConnection instance when it has
 completed a revert operation to indicate a successful completion
 of the revert.

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

<a id="m-sendhandshake-63d3ff7f1ea0"></a>
### sendHandshake()

```java
protected void sendHandshake() throws java.io.IOException
```

<a id="m-setadditionalinfo-b262ce567572"></a>
### setAdditionalInfo(String)

```java
public void setAdditionalInfo(String info)
```

Set information to be passed back to the caller, typically
 parse information if the user invokes a show action with
 the verbose parameter.

**Parameters**

- `String info`

<a id="m-setprovisionaltransid-e17c71c7b76d"></a>
### setProvisionalTransId(String)

```java
public void setProvisionalTransId(String id)
```

This method allows the NED to set transaction ID provisionally from
 [`NedCliBase#show(NedWorker, String)`](NedCliBase.md#m-show-5a497cd9b854) or
 [`NedGenericBase#show(NedWorker, int)`](NedGenericBase.md#m-show-1eadf587f1ff) NED callback.
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

<a id="m-settimeout-cbe758ecb5d8"></a>
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

<a id="m-showcliresponse-3a741bb014b0"></a>
### showCliResponse(ArrayList<String>)

```java
public void showCliResponse(
    java.util.ArrayList<String> l
)
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

**Parameters**

- `java.util.ArrayList<String> l`

<a id="m-showcliresponse-948708ab930c"></a>
### showCliResponse(String)

```java
public void showCliResponse(String config) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method is invoked by a NedCli instance in response to a show
 method invocation. The config string should consist the relevant
 parts of the output from issuing the equivalent of 'show
 running-config'
 in a Cisco like CLI. The output must correspond to the data model
 provided in the capabilities sent as a response to the (re)connect
 request.

**Parameters**

- `String config`

<a id="m-showgenericresponse-be3696329498"></a>
### showGenericResponse()

```java
public void showGenericResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method is invoked by a NedGeneric when it has completed
 populating the transaction with the requested configuration
 sub-tree. It indicates that the operation was successful.

<a id="m-showstatsfilterresponse-d3516e0db02c"></a>
### showStatsFilterResponse()

```java
public void showStatsFilterResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method is invoked during the showStatsFilter() request
 to indicate that the NED has successfully populated the requested
 transaction.

<a id="m-showstatspathresponse-95090ea9fbc3"></a>
### showStatsPathResponse(NedTTL[])

```java
public void showStatsPathResponse(
    com.tailf.ned.NedTTL[] ttls
)
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedTTL](NedTTL.md#cls-NedTTL), [NedException](NedException.md#cls-NedException)

This method is invoked during the showStatsPath() request
 to indicate that the NED has successfully populated the requested
 subtree.

**Parameters**

- `com.tailf.ned.NedTTL[] ttls` - an array of ttls for different paths. The NED may optionally provide
    different cache timeouts for different paths.

<a id="m-telemetry-23bbdd9142b8"></a>
### telemetry(TelemetryType, TelemetryFormat, String)

```java
public void telemetry(
    com.tailf.ned.TelemetryType type,
    com.tailf.ned.TelemetryFormat format,
    String data
)
```

Types: [TelemetryType](TelemetryType.md#cls-TelemetryType), [TelemetryFormat](TelemetryFormat.md#cls-TelemetryFormat)

Send telemetry to NCS once a subscription has been created.

**Parameters**

- `com.tailf.ned.TelemetryType type` - Type of the telemetry data.
- `com.tailf.ned.TelemetryFormat format` - Format of the telemetry data.
- `String data` - A telemetry notification (as defined in RFC8641), the
               push-update/datastore-contents or
               push-change-update/datastore-changes data.

<a id="m-trace-4c88f986a203"></a>
### trace(String, String, String)

```java
public void trace(String msg, String direction, String deviceId)
```

Send trace message to the NCS. The message will end up at... FIXME

**Parameters**

- `String msg`
- `String direction`
- `String deviceId`

<a id="m-trysendresponse-e175f3a65374"></a>
### trySendResponse(Socket, ConfEObject)

**Package-private**

```java
void trySendResponse(java.net.Socket sock, com.tailf.proto.ConfEObject t) throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

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

<a id="m-uninitializeresponse-2fcb472eb32a"></a>
### uninitializeResponse()

```java
public void uninitializeResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#cls-NedException)

This method should be invoked by a NedConnection instance when it has
 completed a uninitialize operation to indicate a successful
 uninitialization


## Nested Types

- [NotEnoughDataException](NedWorker/NotEnoughDataException.md#cls-NotEnoughDataException)
- [NotImplementedException](NedWorker/NotImplementedException.md#cls-NotImplementedException)
- [TransactionIdMode](NedWorker/TransactionIdMode.md#cls-TransactionIdMode)
