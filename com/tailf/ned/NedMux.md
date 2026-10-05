# NedMux <a href="#nedmux-646886956a86" id="nedmux-646886956a86"></a>

```java
public class com.tailf.ned.NedMux
    implements Runnable
```

The NedMux is used as the interface between NCS and the NedConnections.
 It will receive requests from the NCS, assign them to different
 connections and workers, as well as initiating new connections, and
 to keep track of the connection pool.

## Members

**Constructors**:

- [NedMux\(NcsMain\)](#nedmux-5d47e1091ec5)

**Methods**:

- [addToConnectionList\(NedConnectionBase\)](#addtoconnectionlist-0d53d864a35a)
- [dorun\(\)](#dorun-4965d2173fd3)
- [getConnection\(int\)](#getconnection-a8fbfff22e02)
- [getErrorMessageFormatter\(\)](#geterrormessageformatter-8c75ba6f07e5)
- [getErrorVerbosity\(\)](#geterrorverbosity-defe49ca237d)
- [getNewNeds\(\)](#getnewneds-1ea8feed407d)
- [listOpenConnections\(\)](#listopenconnections-28eee6f299b2)
- [register\(NedConnectionBase\)](#register-86d55bf880b4)
- [removeFromConnectionList\(int\)](#removefromconnectionlist-2e9ec1695419)
- [reRegister\(NedConnectionBase\)](#reregister-69b675594a1f)
- [resetNewNeds\(\)](#resetnewneds-8a4fddc81846)
- [run\(\)](#run-b6dbda048863)
- [setErrorVerbosity\(ErrorVerbosity\)](#seterrorverbosity-bab7950e55c8)
- [start\(\)](#start-79e12dafe9f8)
- [stopRequest\(\)](#stoprequest-5e6b3185772c)
- [termRead\(Socket\)](#termread-a6eabc408efc)

## Constructors

### NedMux(NcsMain) <a href="#nedmux-5d47e1091ec5" id="nedmux-5d47e1091ec5"></a>

```java
public NedMux(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](../ncs/NcsMain.md#ncsmain-eb814813aed4)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

### addToConnectionList(NedConnectionBase) <a href="#addtoconnectionlist-0d53d864a35a" id="addtoconnectionlist-0d53d864a35a"></a>

```java
protected int addToConnectionList(
    com.tailf.ned.NedConnectionBase con
)
    throws com.tailf.ned.NedException
```

Types: [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf), [NedException](NedException.md#nedexception-9d3a19f3640e)

This makes the mux aware of a new connection and returns
 a unique connection_id.

**Parameters**

- `com.tailf.ned.NedConnectionBase con`

### dorun() <a href="#dorun-4965d2173fd3" id="dorun-4965d2173fd3"></a>

**Package-private**

```java
void dorun() throws Exception
```

### getConnection(int) <a href="#getconnection-a8fbfff22e02" id="getconnection-a8fbfff22e02"></a>

```java
public com.tailf.ned.NedConnectionBase getConnection(int id)
```

Types: [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

**Parameters**

- `int id`

### getErrorMessageFormatter() <a href="#geterrormessageformatter-8c75ba6f07e5" id="geterrormessageformatter-8c75ba6f07e5"></a>

```java
public com.tailf.conf.ErrorMessageFormatter getErrorMessageFormatter()
```

Types: [ErrorMessageFormatter](../conf/ErrorMessageFormatter.md#errormessageformatter-ac64ccc06c80)

Return the errorMessageFormatter for this NedMux.

**Returns:** ErrorMessageFormatter for this NedMux

### getErrorVerbosity() <a href="#geterrorverbosity-defe49ca237d" id="geterrorverbosity-defe49ca237d"></a>

```java
public com.tailf.conf.ErrorVerbosity getErrorVerbosity()
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#errorverbosity-7dabb9fc7bcd)

Get the local verbosity level for reported errors
 If this verbosity is null the the default level governs the error
 verbosity of this NedMux

**Returns:** current errorVerbosity

### getNewNeds() <a href="#getnewneds-1ea8feed407d" id="getnewneds-1ea8feed407d"></a>

```java
public com.tailf.proto.ConfEList getNewNeds() throws Exception
```

Types: [ConfEList](../proto/ConfEList.md#confelist-78fa4ba3b3a8)

### listOpenConnections() <a href="#listopenconnections-28eee6f299b2" id="listopenconnections-28eee6f299b2"></a>

```java
public String[] listOpenConnections()
```

### register(NedConnectionBase) <a href="#register-86d55bf880b4" id="register-86d55bf880b4"></a>

```java
public void register(com.tailf.ned.NedConnectionBase userMod)
```

Types: [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

Register a new NedConnection with the mux. It will be reported
 to NCS when the NedMux connects to NCS and the NCS can request
 new connections to be established using the NedConnection
 object.

**Parameters**

- `com.tailf.ned.NedConnectionBase userMod`

### removeFromConnectionList(int) <a href="#removefromconnectionlist-2e9ec1695419" id="removefromconnectionlist-2e9ec1695419"></a>

```java
protected void removeFromConnectionList(int id)
```

Removes the connection from the mux, indicating that it has
 been closed. It will be removed from the internal connection
 table and its connection id can be reused.

**Parameters**

- `int id` - is the connection_id of the terminated connection

### reRegister(NedConnectionBase) <a href="#reregister-69b675594a1f" id="reregister-69b675594a1f"></a>

```java
public boolean reRegister(com.tailf.ned.NedConnectionBase userMod)
```

Types: [NedConnectionBase](NedConnectionBase.md#nedconnectionbase-3139efb66faf)

The reRegister method will, NCS unknowingly, exchange the
 ned implementation on the fly. Since no communication with NCS is
 performed, only exchanged of already registered neds are allowed.
 The method returns true if an exchange was performed.

**Parameters**

- `com.tailf.ned.NedConnectionBase userMod`

### resetNewNeds() <a href="#resetnewneds-8a4fddc81846" id="resetnewneds-8a4fddc81846"></a>

```java
public void resetNewNeds()
```

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

### setErrorVerbosity(ErrorVerbosity) <a href="#seterrorverbosity-bab7950e55c8" id="seterrorverbosity-bab7950e55c8"></a>

```java
public void setErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#errorverbosity-7dabb9fc7bcd)

set the local verbosity level for reported errors
 If this verbosity is set to null the the default level governs the error
 verbosity of this NedMux

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity`

### start() <a href="#start-79e12dafe9f8" id="start-79e12dafe9f8"></a>

```java
public void start()
```

### stopRequest() <a href="#stoprequest-5e6b3185772c" id="stoprequest-5e6b3185772c"></a>

```java
public void stopRequest()
```

### termRead(Socket) <a href="#termread-a6eabc408efc" id="termread-a6eabc408efc"></a>

```java
protected com.tailf.proto.ConfEObject termRead(
    java.net.Socket sock
)
    throws com.tailf.proto.ConfEDecodeException, java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfEDecodeException](../proto/ConfEDecodeException.md#confedecodeexception-3e50145f8aae), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `java.net.Socket sock`
