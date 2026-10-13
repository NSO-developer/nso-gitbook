# NedWorker <a href="#nedworker-b063de7c0998" id="nedworker-b063de7c0998"></a>

```java
public class com.tailf.ned.NedWorker
    extends Thread
    implements com.tailf.ned.NedTracer, ch.ethz.ssh2.auth.AgentProxy
```

Types: [NedTracer](NedTracer.md#nedtracer-f8730263f5f2)

The NedWorker is used by the NedMux for running a worker thread
 for executing NedConnection tasks.

## Members

**Constructors**:

- [NedWorker\(int, NedMux, SocketAddress, String\)](#nedworker-4e2ecdbb9653)

**Methods**:

- [abortResponse\(\)](#abortresponse-57f9d5e240e8)
- [commandResponse\(\)](#commandresponse-136a56ef82b3)
- [commandResponse\(ConfXMLParam\[\]\)](#commandresponse-60289df4d880)
- [commitResponse\(\)](#commitresponse-89759cfebfe4)
- [connectError\(NedErrorCode\)](#connecterror-2a5e6621485f)
- [connectError\(NedErrorCode, String\)](#connecterror-68192226b176)
- [createSubscriptionResponse\(\)](#createsubscriptionresponse-bf0d6f96b6a0)
- [createTelemetrySubscriptionResponse\(\)](#createtelemetrysubscriptionresponse-1ac60d98dad0)
- [currentCommand\(\)](#currentcommand-070f1f079135)
- [dorun\(\)](#dorun-4965d2173fd3)
- [error\(int, NedErrorCode, String\)](#error-4da190fc7a8c)
- [error\(int, String\)](#error-453b6a3b8f77)
- [error\(int, String, String\)](#error-ef653fe52f55)
- [getComment\(\)](#getcomment-a5625f95afef)
- [getCurrentPath\(\)](#getcurrentpath-698747d0fbeb)
- [getDevicePhase\(\)](#getdevicephase-8b082012881e)
- [getFromTransactionId\(\)](#getfromtransactionid-c49683f287a8)
- [getKeyDir\(\)](#getkeydir-07c13308c833)
- [getLabel\(\)](#getlabel-72bf899bf6f1)
- [getLoadOp\(\)](#getloadop-ab5127869701)
- [getNedId\(\)](#getnedid-74e70b4078d8)
- [getPassword\(\)](#getpassword-003001cc6c91)
- [getRemoteUser\(\)](#getremoteuser-bdfb4a23b5ff)
- [getSecondaryPassword\(\)](#getsecondarypassword-34fb12bcee21)
- [getSourceAddress\(\)](#getsourceaddress-873953ea3b38)
- [getToTransactionId\(\)](#gettotransactionid-3beba3c28e0e)
- [getTransIdResponse\(String\)](#gettransidresponse-5f28e5978df8)
- [getUsid\(\)](#getusid-62d0ecfd68fd)
- [initializeResponse\(String\)](#initializeresponse-af0fdce0a5bb)
- [isAliveResponse\(boolean\)](#isaliveresponse-e9b3b03792f5)
- [isSuppressTransId\(\)](#issuppresstransid-ea2b7aa87e80)
- [isVerbose\(\)](#isverbose-224af8693204)
- [log\(String\)](#log-3f94043670a3)
- [notification\(String\)](#notification-fc6c29ffd2b3)
- [persistResponse\(\)](#persistresponse-e5069f9de1a7)
- [prepareDryResponse\(String\)](#preparedryresponse-4249bd793b22)
- [prepareDryUnsupportedResponse\(\)](#preparedryunsupportedresponse-79bc01c84b05)
- [prepareResponse\(\)](#prepareresponse-7eadf3b8db0f)
- [revertResponse\(\)](#revertresponse-a85f70d26645)
- [run\(\)](#run-b6dbda048863)
- [sendHandshake\(\)](#sendhandshake-63d3ff7f1ea0)
- [setAdditionalInfo\(String\)](#setadditionalinfo-b262ce567572)
- [setProvisionalTransId\(String\)](#setprovisionaltransid-e17c71c7b76d)
- [setTimeout\(int\)](#settimeout-cbe758ecb5d8)
- [showCliResponse\(ArrayList\<String\>\)](#showcliresponse-3a741bb014b0)
- [showCliResponse\(String\)](#showcliresponse-948708ab930c)
- [showGenericResponse\(\)](#showgenericresponse-be3696329498)
- [showStatsFilterResponse\(\)](#showstatsfilterresponse-d3516e0db02c)
- [showStatsPathResponse\(NedTTL\[\]\)](#showstatspathresponse-95090ea9fbc3)
- [telemetry\(TelemetryType, TelemetryFormat, String\)](#telemetry-23bbdd9142b8)
- [trace\(String, String, String\)](#trace-4c88f986a203)
- [trySendResponse\(Socket, ConfEObject\)](#trysendresponse-e175f3a65374)
- [uninitializeResponse\(\)](#uninitializeresponse-2fcb472eb32a)

**Nested Types**:

- [NotEnoughDataException](NedWorker/NotEnoughDataException.md#notenoughdataexception-0a1dcfccde5c)
- [NotImplementedException](NedWorker/NotImplementedException.md#notimplementedexception-b79d241299d5)
- [TransactionIdMode](NedWorker/TransactionIdMode.md#transactionidmode-469080668075)

## Constructors

### NedWorker(int, NedMux, SocketAddress, String) <a href="#nedworker-4e2ecdbb9653" id="nedworker-4e2ecdbb9653"></a>

```java
public NedWorker(int wid, com.tailf.ned.NedMux mux, java.net.SocketAddress address, String id)
```

Types: [NedMux](NedMux.md#nedmux-646886956a86)

**Parameters**

- `int wid`
- `com.tailf.ned.NedMux mux`
- `java.net.SocketAddress address`
- `String id`


## Methods

### abortResponse() <a href="#abortresponse-57f9d5e240e8" id="abortresponse-57f9d5e240e8"></a>

```java
public void abortResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is called by the NED to indicate that the
 abort method has been successfully completed. If the NED
 is unable to complete the abort the error method should
 be invoked instead.

### commandResponse() <a href="#commandresponse-136a56ef82b3" id="commandresponse-136a56ef82b3"></a>

```java
public void commandResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is called by the NED to indicate that the
 command method has been successfully completed. If the NED
 is unable to complete the command the error method should
 be invoked instead.

### commandResponse(ConfXMLParam[]) <a href="#commandresponse-60289df4d880" id="commandresponse-60289df4d880"></a>

```java
public void commandResponse(
    com.tailf.conf.ConfXMLParam[] reply
)
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is called by the NED to indicate that the
 command method has been successfully completed when the NED
 also has a reply. If the NED
 is unable to complete the command the error method should
 be invoked instead.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] reply` - is the return value from executing the command

### commitResponse() <a href="#commitresponse-89759cfebfe4" id="commitresponse-89759cfebfe4"></a>

```java
public void commitResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method should be invoked by a NedConnection instance when it has
 completed a commit operation to indicate a successful completion
 of the commit.

### connectError(NedErrorCode) <a href="#connecterror-2a5e6621485f" id="connecterror-2a5e6621485f"></a>

```java
public void connectError(com.tailf.ned.NedErrorCode code) throws com.tailf.ned.NedException
```

Types: [NedErrorCode](NedErrorCode.md#nederrorcode-e5f6e08a55a2), [NedException](NedException.md#nedexception-9d3a19f3640e)

See [`NedWorker#connectError(NedErrorCode, String)`](NedWorker.md#connecterror-68192226b176)

**Parameters**

- `com.tailf.ned.NedErrorCode code`

### connectError(NedErrorCode, String) <a href="#connecterror-68192226b176" id="connecterror-68192226b176"></a>

```java
public void connectError(
    com.tailf.ned.NedErrorCode code,
    String info
)
    throws com.tailf.ned.NedException
```

Types: [NedErrorCode](NedErrorCode.md#nederrorcode-e5f6e08a55a2), [NedException](NedException.md#nedexception-9d3a19f3640e)

This method should be invoked if the NED fails to perform the
 connect() operation.

**Parameters**

- `com.tailf.ned.NedErrorCode code` - is the reason for the connect to fail. See
    [`NedErrorCode#CONNECT_CONNECTION_REFUSED`](NedErrorCode.md#connect_connection_refused-2749682d78b8),
    [`NedErrorCode#CONNECT_TIMEOUT`](NedErrorCode.md#connect_timeout-38526d2fcecb),
    etc.
- `String info` - is a string describing the connect error. Normally this parameter
    is not needed. If it is given, it will be appended to the
    error message all the way to the northbound agent invoking
    the NED connect call

### createSubscriptionResponse() <a href="#createsubscriptionresponse-bf0d6f96b6a0" id="createsubscriptionresponse-bf0d6f96b6a0"></a>

```java
public void createSubscriptionResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is invoked by a NedConnection instance when it has
 completed to create a notification subscription. If the NED
 is unable to create the subscription the error method should
 be invoked instead.

### createTelemetrySubscriptionResponse() <a href="#createtelemetrysubscriptionresponse-1ac60d98dad0" id="createtelemetrysubscriptionresponse-1ac60d98dad0"></a>

```java
public void createTelemetrySubscriptionResponse() throws java.io.IOException, com.tailf.ned.NedException
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is invoked by a NedConnection instance when it has
 completed to create a telemetry subscription. If the NED
 is unable to create the subscription the error method should
 be invoked instead.

### currentCommand() <a href="#currentcommand-070f1f079135" id="currentcommand-070f1f079135"></a>

```java
public com.tailf.ned.NedCmd currentCommand()
```

Types: [NedCmd](NedCmd.md#nedcmd-52f884d2629b)

### dorun() <a href="#dorun-4965d2173fd3" id="dorun-4965d2173fd3"></a>

**Package-private**

```java
void dorun() throws Exception
```

### error(int, NedErrorCode, String) <a href="#error-4da190fc7a8c" id="error-4da190fc7a8c"></a>

```java
public void error(int op, com.tailf.ned.NedErrorCode errCode, String reason)
```

Types: [NedErrorCode](NedErrorCode.md#nederrorcode-e5f6e08a55a2)

This function should be called when a callback like abort,persist,
 etc cannot be completed.

**Parameters**

- `int op` - is the command originally issued from NCS, ie a NedCmd.getCommand()
    integer like NedCmd.CONNECT_CLI, NedCmd.CONNECT_GENERIC,
    NedCmd.PREPARE_CLI, ...
- `com.tailf.ned.NedErrorCode errCode` - NedErrorCode for the error
- `String reason` - textual description of the reason for the error

### error(int, String) <a href="#error-453b6a3b8f77" id="error-453b6a3b8f77"></a>

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

### error(int, String, String) <a href="#error-ef653fe52f55" id="error-ef653fe52f55"></a>

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

### getComment() <a href="#getcomment-a5625f95afef" id="getcomment-a5625f95afef"></a>

```java
public String getComment()
```

This method returns the commit comment.

**Returns:** null or a comment describing the commit

### getCurrentPath() <a href="#getcurrentpath-698747d0fbeb" id="getcurrentpath-698747d0fbeb"></a>

```java
public com.tailf.conf.ConfPath getCurrentPath()
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

This method returns the current path associated with the
 action being processed. This method only returns valid
 data when called during an action invokation.

**Returns:** a ConfPath to the node which contains the action.

### getDevicePhase() <a href="#getdevicephase-8b082012881e" id="getdevicephase-8b082012881e"></a>

```java
public String getDevicePhase()
```

Get the phase of the device.

### getFromTransactionId() <a href="#getfromtransactionid-c49683f287a8" id="getfromtransactionid-c49683f287a8"></a>

```java
public int getFromTransactionId()
```

This method returns an integer that represents the transaction
 we are going from. In the normal case this is normally just
 'running', but not always.
 It's possible to use Maapi.attach() on this transaction Id.
 [`Maapi#attach(int,int,int)`](../maapi/Maapi.md#attach-59771e44614d)
 Some complicated NEDs may require to read data from the system
 the way it looked like before the current transaction arrived.

**Returns:** a transaction integer.

### getKeyDir() <a href="#getkeydir-07c13308c833" id="getkeydir-07c13308c833"></a>

```java
public String getKeyDir()
```

This method returns the ssh public key directory as defined in the
 auth map.

**Returns:** null or a directory containing ssh public keys

### getLabel() <a href="#getlabel-72bf899bf6f1" id="getlabel-72bf899bf6f1"></a>

```java
public String getLabel()
```

This method returns the commit label.

**Returns:** null or the commit label

### getLoadOp() <a href="#getloadop-ab5127869701" id="getloadop-ab5127869701"></a>

```java
public int getLoadOp()
```

This method returns the load operation that should
 be used when populating the transaction in any of
 the show methods.

### getNedId() <a href="#getnedid-74e70b4078d8" id="getnedid-74e70b4078d8"></a>

```java
public String getNedId()
```

This method returns the ned-id for the ned associated with this worker.

**Returns:** the ned-id of the ned associated with this worker

### getPassword() <a href="#getpassword-003001cc6c91" id="getpassword-003001cc6c91"></a>

```java
public String getPassword()
```

This method returns the backend password as defined in the
 auth map.

**Returns:** password to connect to backend with

### getRemoteUser() <a href="#getremoteuser-bdfb4a23b5ff" id="getremoteuser-bdfb4a23b5ff"></a>

```java
public String getRemoteUser()
```

This method returns the backend user name as defined in the
 auth map.

**Returns:** name of user to connect to backend as

### getSecondaryPassword() <a href="#getsecondarypassword-34fb12bcee21" id="getsecondarypassword-34fb12bcee21"></a>

```java
public String getSecondaryPassword()
```

This method returns the backend secondary password as defined in the
 auth map.

**Returns:** secondary password to connect to backend with

### getSourceAddress() <a href="#getsourceaddress-873953ea3b38" id="getsourceaddress-873953ea3b38"></a>

```java
public java.net.InetSocketAddress getSourceAddress()
```

This method returns the source IP address if such an address
 is configured in the ncs configuration.
 If not configured this method returns null.

**Returns:** the source IP address or null if not configured

### getToTransactionId() <a href="#gettotransactionid-3beba3c28e0e" id="gettotransactionid-3beba3c28e0e"></a>

```java
public int getToTransactionId()
```

This method returns an integer that represents the transaction
 we are going to, i.e the proposed new system state.
 It's possible to use Maapi.attach() on this transaction Id.
 [`Maapi#attach(int,int,int)`](../maapi/Maapi.md#attach-59771e44614d)
 Some complicated NEDs may require to read data from the system
 the way it is going to look like once the current transaction is
 committed.

**Returns:** a transaction integer.

### getTransIdResponse(String) <a href="#gettransidresponse-5f28e5978df8" id="gettransidresponse-5f28e5978df8"></a>

```java
public void getTransIdResponse(String id) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is called by the NED to send a response to the
 getTransId request. If the NED
 is unable to complete the command the error method should
 be invoked instead.

**Parameters**

- `String id` - is a string representing a transaction id

### getUsid() <a href="#getusid-62d0ecfd68fd" id="getusid-62d0ecfd68fd"></a>

```java
public int getUsid()
```

This method returns an integer that represents the user session
 that initiated this NedWorker. If we wish to do
 Maapi.attach() to any of the from/to transactions we need the
 user session id

**Returns:** a user session id

### initializeResponse(String) <a href="#initializeresponse-af0fdce0a5bb" id="initializeresponse-af0fdce0a5bb"></a>

```java
public void initializeResponse(String id) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is called by the NED to send a response to the
 initialize request. If the NED
 is unable to complete the command the error method should
 be invoked instead.

**Parameters**

- `String id` - is a string representing a transaction id

### isAliveResponse(boolean) <a href="#isaliveresponse-e9b3b03792f5" id="isaliveresponse-e9b3b03792f5"></a>

```java
public void isAliveResponse(boolean alive) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

**Parameters**

- `boolean alive`

### isSuppressTransId() <a href="#issuppresstransid-ea2b7aa87e80" id="issuppresstransid-ea2b7aa87e80"></a>

```java
public boolean isSuppressTransId()
```

The initialize call can request the trans_id response to be suppressed.
 This method must be called to check if that is the case.

### isVerbose() <a href="#isverbose-224af8693204" id="isverbose-224af8693204"></a>

```java
public boolean isVerbose()
```

This method helps the NED determine whether an action has been invoked
 with the verbose parameter.
 If an action has been invoked with the verbose parameter, then the NED
 may choose to report additional information using
 [`setAdditionalInfo(String)`](NedWorker.md#setadditionalinfo-b262ce567572).

### log(String) <a href="#log-3f94043670a3" id="log-3f94043670a3"></a>

```java
public void log(String msg) throws Exception
```

Send log messages to NCS. The log messages will end up at... FIXME

**Parameters**

- `String msg`

### notification(String) <a href="#notification-fc6c29ffd2b3" id="notification-fc6c29ffd2b3"></a>

```java
public void notification(String data)
```

Send notification to NCS once subsciption has been created.

**Parameters**

- `String data`

### persistResponse() <a href="#persistresponse-e5069f9de1a7" id="persistresponse-e5069f9de1a7"></a>

```java
public void persistResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is called by the NED to indicate that the
 persist method has been successfully completed. If the NED
 is unable to complete the persist the error method should
 be invoked instead.

### prepareDryResponse(String) <a href="#preparedryresponse-4249bd793b22" id="preparedryresponse-4249bd793b22"></a>

```java
public void prepareDryResponse(String output) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method should be invoked by a NedConnection instance when it has
 completed a prepare dry operation to indicate a successful completion
 of and the result of the dry run.

**Parameters**

- `String output`

### prepareDryUnsupportedResponse() <a href="#preparedryunsupportedresponse-79bc01c84b05" id="preparedryunsupportedresponse-79bc01c84b05"></a>

```java
public void prepareDryUnsupportedResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method should be invoked by a NedConnection instance when a
 prepare dry operation is invoked and the NED is not able to support
 such an operation.

### prepareResponse() <a href="#prepareresponse-7eadf3b8db0f" id="prepareresponse-7eadf3b8db0f"></a>

```java
public void prepareResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method should be invoked by a NedConnection instance when it has
 completed a prepare operation to indicate a successful completion
 of the prepare.

### revertResponse() <a href="#revertresponse-a85f70d26645" id="revertresponse-a85f70d26645"></a>

```java
public void revertResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method should be invoked by a NedConnection instance when it has
 completed a revert operation to indicate a successful completion
 of the revert.

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

### sendHandshake() <a href="#sendhandshake-63d3ff7f1ea0" id="sendhandshake-63d3ff7f1ea0"></a>

```java
protected void sendHandshake() throws java.io.IOException
```

### setAdditionalInfo(String) <a href="#setadditionalinfo-b262ce567572" id="setadditionalinfo-b262ce567572"></a>

```java
public void setAdditionalInfo(String info)
```

Set information to be passed back to the caller, typically
 parse information if the user invokes a show action with
 the verbose parameter.

**Parameters**

- `String info`

### setProvisionalTransId(String) <a href="#setprovisionaltransid-e17c71c7b76d" id="setprovisionaltransid-e17c71c7b76d"></a>

```java
public void setProvisionalTransId(String id)
```

This method allows the NED to set transaction ID provisionally from
 [`NedCliBase#show(NedWorker, String)`](NedCliBase.md#show-5a497cd9b854) or
 [`NedGenericBase#show(NedWorker, int)`](NedGenericBase.md#show-1eadf587f1ff) NED callback.
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

### setTimeout(int) <a href="#settimeout-cbe758ecb5d8" id="settimeout-cbe758ecb5d8"></a>

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

### showCliResponse(ArrayList&lt;String&gt;) <a href="#showcliresponse-3a741bb014b0" id="showcliresponse-3a741bb014b0"></a>

```java
public void showCliResponse(
    java.util.ArrayList<String> l
)
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

**Parameters**

- `java.util.ArrayList<String> l`

### showCliResponse(String) <a href="#showcliresponse-948708ab930c" id="showcliresponse-948708ab930c"></a>

```java
public void showCliResponse(String config) throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is invoked by a NedCli instance in response to a show
 method invocation. The config string should consist the relevant
 parts of the output from issuing the equivalent of 'show
 running-config'
 in a Cisco like CLI. The output must correspond to the data model
 provided in the capabilities sent as a response to the (re)connect
 request.

**Parameters**

- `String config`

### showGenericResponse() <a href="#showgenericresponse-be3696329498" id="showgenericresponse-be3696329498"></a>

```java
public void showGenericResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is invoked by a NedGeneric when it has completed
 populating the transaction with the requested configuration
 sub-tree. It indicates that the operation was successful.

### showStatsFilterResponse() <a href="#showstatsfilterresponse-d3516e0db02c" id="showstatsfilterresponse-d3516e0db02c"></a>

```java
public void showStatsFilterResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is invoked during the showStatsFilter() request
 to indicate that the NED has successfully populated the requested
 transaction.

### showStatsPathResponse(NedTTL[]) <a href="#showstatspathresponse-95090ea9fbc3" id="showstatspathresponse-95090ea9fbc3"></a>

```java
public void showStatsPathResponse(
    com.tailf.ned.NedTTL[] ttls
)
    throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedTTL](NedTTL.md#nedttl-1e58c228ec0f), [NedException](NedException.md#nedexception-9d3a19f3640e)

This method is invoked during the showStatsPath() request
 to indicate that the NED has successfully populated the requested
 subtree.

**Parameters**

- `com.tailf.ned.NedTTL[] ttls` - an array of ttls for different paths. The NED may optionally provide
    different cache timeouts for different paths.

### telemetry(TelemetryType, TelemetryFormat, String) <a href="#telemetry-23bbdd9142b8" id="telemetry-23bbdd9142b8"></a>

```java
public void telemetry(
    com.tailf.ned.TelemetryType type,
    com.tailf.ned.TelemetryFormat format,
    String data
)
```

Types: [TelemetryType](TelemetryType.md#telemetrytype-817e3224204d), [TelemetryFormat](TelemetryFormat.md#telemetryformat-e367fbe44067)

Send telemetry to NCS once a subscription has been created.

**Parameters**

- `com.tailf.ned.TelemetryType type` - Type of the telemetry data.
- `com.tailf.ned.TelemetryFormat format` - Format of the telemetry data.
- `String data` - A telemetry notification (as defined in RFC8641), the
               push-update/datastore-contents or
               push-change-update/datastore-changes data.

### trace(String, String, String) <a href="#trace-4c88f986a203" id="trace-4c88f986a203"></a>

```java
public void trace(String msg, String direction, String deviceId)
```

Send trace message to the NCS. The message will end up at... FIXME

**Parameters**

- `String msg`
- `String direction`
- `String deviceId`

### trySendResponse(Socket, ConfEObject) <a href="#trysendresponse-e175f3a65374" id="trysendresponse-e175f3a65374"></a>

**Package-private**

```java
void trySendResponse(java.net.Socket sock, com.tailf.proto.ConfEObject t) throws java.io.IOException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

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

### uninitializeResponse() <a href="#uninitializeresponse-2fcb472eb32a" id="uninitializeresponse-2fcb472eb32a"></a>

```java
public void uninitializeResponse() throws java.io.IOException, com.tailf.ned.NedException
```

Types: [NedException](NedException.md#nedexception-9d3a19f3640e)

This method should be invoked by a NedConnection instance when it has
 completed a uninitialize operation to indicate a successful
 uninitialization


## Nested Types

- [NotEnoughDataException](NedWorker/NotEnoughDataException.md#notenoughdataexception-0a1dcfccde5c)
- [NotImplementedException](NedWorker/NotImplementedException.md#notimplementedexception-b79d241299d5)
- [TransactionIdMode](NedWorker/TransactionIdMode.md#transactionidmode-469080668075)
