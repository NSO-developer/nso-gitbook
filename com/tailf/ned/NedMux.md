# NedMux <a href="#cls-NedMux" id="cls-NedMux"></a>

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

- [NedMux(NcsMain)](#m-NedMux-5d47e1091ec5)

**Methods**:

- [addToConnectionList(NedConnectionBase)](#m-addToConnectionList-0d53d864a35a)
- [dorun()](#m-dorun-4965d2173fd3)
- [getConnection(int)](#m-getConnection-a8fbfff22e02)
- [getErrorMessageFormatter()](#m-getErrorMessageFormatter-8c75ba6f07e5)
- [getErrorVerbosity()](#m-getErrorVerbosity-defe49ca237d)
- [getNewNeds()](#m-getNewNeds-1ea8feed407d)
- [listOpenConnections()](#m-listOpenConnections-28eee6f299b2)
- [register(NedConnectionBase)](#m-register-86d55bf880b4)
- [removeFromConnectionList(int)](#m-removeFromConnectionList-2e9ec1695419)
- [reRegister(NedConnectionBase)](#m-reRegister-69b675594a1f)
- [resetNewNeds()](#m-resetNewNeds-8a4fddc81846)
- [run()](#m-run-b6dbda048863)
- [setErrorVerbosity(ErrorVerbosity)](#m-setErrorVerbosity-bab7950e55c8)
- [start()](#m-start-79e12dafe9f8)
- [stopRequest()](#m-stopRequest-5e6b3185772c)
- [termRead(Socket)](#m-termRead-a6eabc408efc)

## Constructors

### NedMux(NcsMain) <a href="#m-NedMux-5d47e1091ec5" id="m-NedMux-5d47e1091ec5"></a>

```java
public NedMux(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](../ncs/NcsMain.md#cls-NcsMain)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

### addToConnectionList(NedConnectionBase) <a href="#m-addToConnectionList-0d53d864a35a" id="m-addToConnectionList-0d53d864a35a"></a>

```java
protected int addToConnectionList(
    com.tailf.ned.NedConnectionBase con
)
    throws com.tailf.ned.NedException
```

Types: [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase), [NedException](NedException.md#cls-NedException)

This makes the mux aware of a new connection and returns
 a unique connection_id.

**Parameters**

- `com.tailf.ned.NedConnectionBase con`

### dorun() <a href="#m-dorun-4965d2173fd3" id="m-dorun-4965d2173fd3"></a>

**Package-private**

```java
void dorun() throws Exception
```

### getConnection(int) <a href="#m-getConnection-a8fbfff22e02" id="m-getConnection-a8fbfff22e02"></a>

```java
public com.tailf.ned.NedConnectionBase getConnection(int id)
```

Types: [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

**Parameters**

- `int id`

### getErrorMessageFormatter() <a href="#m-getErrorMessageFormatter-8c75ba6f07e5" id="m-getErrorMessageFormatter-8c75ba6f07e5"></a>

```java
public com.tailf.conf.ErrorMessageFormatter getErrorMessageFormatter()
```

Types: [ErrorMessageFormatter](../conf/ErrorMessageFormatter.md#cls-ErrorMessageFormatter)

Return the errorMessageFormatter for this NedMux.

**Returns:** ErrorMessageFormatter for this NedMux

### getErrorVerbosity() <a href="#m-getErrorVerbosity-defe49ca237d" id="m-getErrorVerbosity-defe49ca237d"></a>

```java
public com.tailf.conf.ErrorVerbosity getErrorVerbosity()
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#cls-ErrorVerbosity)

Get the local verbosity level for reported errors
 If this verbosity is null the the default level governs the error
 verbosity of this NedMux

**Returns:** current errorVerbosity

### getNewNeds() <a href="#m-getNewNeds-1ea8feed407d" id="m-getNewNeds-1ea8feed407d"></a>

```java
public com.tailf.proto.ConfEList getNewNeds() throws Exception
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

### listOpenConnections() <a href="#m-listOpenConnections-28eee6f299b2" id="m-listOpenConnections-28eee6f299b2"></a>

```java
public String[] listOpenConnections()
```

### register(NedConnectionBase) <a href="#m-register-86d55bf880b4" id="m-register-86d55bf880b4"></a>

```java
public void register(com.tailf.ned.NedConnectionBase userMod)
```

Types: [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

Register a new NedConnection with the mux. It will be reported
 to NCS when the NedMux connects to NCS and the NCS can request
 new connections to be established using the NedConnection
 object.

**Parameters**

- `com.tailf.ned.NedConnectionBase userMod`

### removeFromConnectionList(int) <a href="#m-removeFromConnectionList-2e9ec1695419" id="m-removeFromConnectionList-2e9ec1695419"></a>

```java
protected void removeFromConnectionList(int id)
```

Removes the connection from the mux, indicating that it has
 been closed. It will be removed from the internal connection
 table and its connection id can be reused.

**Parameters**

- `int id` - is the connection_id of the terminated connection

### reRegister(NedConnectionBase) <a href="#m-reRegister-69b675594a1f" id="m-reRegister-69b675594a1f"></a>

```java
public boolean reRegister(com.tailf.ned.NedConnectionBase userMod)
```

Types: [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

The reRegister method will, NCS unknowingly, exchange the
 ned implementation on the fly. Since no communication with NCS is
 performed, only exchanged of already registered neds are allowed.
 The method returns true if an exchange was performed.

**Parameters**

- `com.tailf.ned.NedConnectionBase userMod`

### resetNewNeds() <a href="#m-resetNewNeds-8a4fddc81846" id="m-resetNewNeds-8a4fddc81846"></a>

```java
public void resetNewNeds()
```

### run() <a href="#m-run-b6dbda048863" id="m-run-b6dbda048863"></a>

```java
public void run()
```

### setErrorVerbosity(ErrorVerbosity) <a href="#m-setErrorVerbosity-bab7950e55c8" id="m-setErrorVerbosity-bab7950e55c8"></a>

```java
public void setErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#cls-ErrorVerbosity)

set the local verbosity level for reported errors
 If this verbosity is set to null the the default level governs the error
 verbosity of this NedMux

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity`

### start() <a href="#m-start-79e12dafe9f8" id="m-start-79e12dafe9f8"></a>

```java
public void start()
```

### stopRequest() <a href="#m-stopRequest-5e6b3185772c" id="m-stopRequest-5e6b3185772c"></a>

```java
public void stopRequest()
```

### termRead(Socket) <a href="#m-termRead-a6eabc408efc" id="m-termRead-a6eabc408efc"></a>

```java
protected com.tailf.proto.ConfEObject termRead(
    java.net.Socket sock
)
    throws com.tailf.proto.ConfEDecodeException, java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfEDecodeException](../proto/ConfEDecodeException.md#cls-ConfEDecodeException), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `java.net.Socket sock`
