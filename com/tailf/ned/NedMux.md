<a id="cls-NedMux"></a>
# NedMux

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

- [NedMux(NcsMain)](#m-nedmux-5d47e1091ec5)

**Methods**:

- [addToConnectionList(NedConnectionBase)](#m-addtoconnectionlist-0d53d864a35a)
- [dorun()](#m-dorun-4965d2173fd3)
- [getConnection(int)](#m-getconnection-a8fbfff22e02)
- [getErrorMessageFormatter()](#m-geterrormessageformatter-8c75ba6f07e5)
- [getErrorVerbosity()](#m-geterrorverbosity-defe49ca237d)
- [getNewNeds()](#m-getnewneds-1ea8feed407d)
- [listOpenConnections()](#m-listopenconnections-28eee6f299b2)
- [register(NedConnectionBase)](#m-register-86d55bf880b4)
- [removeFromConnectionList(int)](#m-removefromconnectionlist-2e9ec1695419)
- [reRegister(NedConnectionBase)](#m-reregister-69b675594a1f)
- [resetNewNeds()](#m-resetnewneds-8a4fddc81846)
- [run()](#m-run-b6dbda048863)
- [setErrorVerbosity(ErrorVerbosity)](#m-seterrorverbosity-bab7950e55c8)
- [start()](#m-start-79e12dafe9f8)
- [stopRequest()](#m-stoprequest-5e6b3185772c)
- [termRead(Socket)](#m-termread-a6eabc408efc)

## Constructors

<a id="m-nedmux-5d47e1091ec5"></a>
### NedMux(NcsMain)

```java
public NedMux(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](../ncs/NcsMain.md#cls-NcsMain)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

<a id="m-addtoconnectionlist-0d53d864a35a"></a>
### addToConnectionList(NedConnectionBase)

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

<a id="m-dorun-4965d2173fd3"></a>
### dorun()

**Package-private**

```java
void dorun() throws Exception
```

<a id="m-getconnection-a8fbfff22e02"></a>
### getConnection(int)

```java
public com.tailf.ned.NedConnectionBase getConnection(int id)
```

Types: [NedConnectionBase](NedConnectionBase.md#cls-NedConnectionBase)

**Parameters**

- `int id`

<a id="m-geterrormessageformatter-8c75ba6f07e5"></a>
### getErrorMessageFormatter()

```java
public com.tailf.conf.ErrorMessageFormatter getErrorMessageFormatter()
```

Types: [ErrorMessageFormatter](../conf/ErrorMessageFormatter.md#cls-ErrorMessageFormatter)

Return the errorMessageFormatter for this NedMux.

**Returns:** ErrorMessageFormatter for this NedMux

<a id="m-geterrorverbosity-defe49ca237d"></a>
### getErrorVerbosity()

```java
public com.tailf.conf.ErrorVerbosity getErrorVerbosity()
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#cls-ErrorVerbosity)

Get the local verbosity level for reported errors
 If this verbosity is null the the default level governs the error
 verbosity of this NedMux

**Returns:** current errorVerbosity

<a id="m-getnewneds-1ea8feed407d"></a>
### getNewNeds()

```java
public com.tailf.proto.ConfEList getNewNeds() throws Exception
```

Types: [ConfEList](../proto/ConfEList.md#cls-ConfEList)

<a id="m-listopenconnections-28eee6f299b2"></a>
### listOpenConnections()

```java
public String[] listOpenConnections()
```

<a id="m-register-86d55bf880b4"></a>
### register(NedConnectionBase)

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

<a id="m-removefromconnectionlist-2e9ec1695419"></a>
### removeFromConnectionList(int)

```java
protected void removeFromConnectionList(int id)
```

Removes the connection from the mux, indicating that it has
 been closed. It will be removed from the internal connection
 table and its connection id can be reused.

**Parameters**

- `int id` - is the connection_id of the terminated connection

<a id="m-reregister-69b675594a1f"></a>
### reRegister(NedConnectionBase)

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

<a id="m-resetnewneds-8a4fddc81846"></a>
### resetNewNeds()

```java
public void resetNewNeds()
```

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

<a id="m-seterrorverbosity-bab7950e55c8"></a>
### setErrorVerbosity(ErrorVerbosity)

```java
public void setErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#cls-ErrorVerbosity)

set the local verbosity level for reported errors
 If this verbosity is set to null the the default level governs the error
 verbosity of this NedMux

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity`

<a id="m-start-79e12dafe9f8"></a>
### start()

```java
public void start()
```

<a id="m-stoprequest-5e6b3185772c"></a>
### stopRequest()

```java
public void stopRequest()
```

<a id="m-termread-a6eabc408efc"></a>
### termRead(Socket)

```java
protected com.tailf.proto.ConfEObject termRead(
    java.net.Socket sock
)
    throws com.tailf.proto.ConfEDecodeException, java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfEDecodeException](../proto/ConfEDecodeException.md#cls-ConfEDecodeException), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `java.net.Socket sock`
