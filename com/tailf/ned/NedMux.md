<a id="s-NedMux"></a>
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

- [NedMux(NcsMain)](#s-NedMux-1)

**Methods**:

- [addToConnectionList(NedConnectionBase)](#s-addToConnectionList)
- [dorun()](#s-dorun)
- [getConnection(int)](#s-getConnection)
- [getErrorMessageFormatter()](#s-getErrorMessageFormatter)
- [getErrorVerbosity()](#s-getErrorVerbosity)
- [getNed(String)](#s-getNed)
- [getNewNeds()](#s-getNewNeds)
- [initWait()](#s-initWait)
- [listOpenConnections()](#s-listOpenConnections)
- [register(NedConnectionBase)](#s-register)
- [removeFromConnectionList(int)](#s-removeFromConnectionList)
- [reRegister(NedConnectionBase)](#s-reRegister)
- [resetNewNeds()](#s-resetNewNeds)
- [run()](#s-run)
- [setErrorVerbosity(ErrorVerbosity)](#s-setErrorVerbosity)
- [start()](#s-start)
- [stopRequest()](#s-stopRequest)
- [termRead(Socket)](#s-termRead)

## Constructors

<a id="s-NedMux-1"></a>
### NedMux(NcsMain)

```java
public NedMux(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](../ncs/NcsMain.md#s-NcsMain)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

<a id="s-addToConnectionList"></a>
### addToConnectionList(NedConnectionBase)

```java
protected int addToConnectionList(
    com.tailf.ned.NedConnectionBase con
)
    throws com.tailf.ned.NedException
```

Types: [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase), [NedException](NedException.md#s-NedException)

This makes the mux aware of a new connection and returns
 a unique connection_id.

**Parameters**

- `com.tailf.ned.NedConnectionBase con`

<a id="s-dorun"></a>
### dorun()

**Package-private**

```java
void dorun() throws Exception
```

<a id="s-getConnection"></a>
### getConnection(int)

```java
public com.tailf.ned.NedConnectionBase getConnection(int id)
```

Types: [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

**Parameters**

- `int id`

<a id="s-getErrorMessageFormatter"></a>
### getErrorMessageFormatter()

```java
public com.tailf.conf.ErrorMessageFormatter getErrorMessageFormatter()
```

Types: [ErrorMessageFormatter](../conf/ErrorMessageFormatter.md#s-ErrorMessageFormatter)

Return the errorMessageFormatter for this NedMux.

**Returns:** ErrorMessageFormatter for this NedMux

<a id="s-getErrorVerbosity"></a>
### getErrorVerbosity()

```java
public com.tailf.conf.ErrorVerbosity getErrorVerbosity()
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#s-ErrorVerbosity)

Get the local verbosity level for reported errors
 If this verbosity is null the the default level governs the error
 verbosity of this NedMux

**Returns:** current errorVerbosity

<a id="s-getNed"></a>
### getNed(String)

```java
protected com.tailf.ned.NedConnectionBase getNed(String id)
```

Types: [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

**Parameters**

- `String id`

<a id="s-getNewNeds"></a>
### getNewNeds()

```java
public com.tailf.proto.ConfEList getNewNeds() throws Exception
```

Types: [ConfEList](../proto/ConfEList.md#s-ConfEList)

<a id="s-initWait"></a>
### initWait()

```java
public void initWait()
```

<a id="s-listOpenConnections"></a>
### listOpenConnections()

```java
public String[] listOpenConnections()
```

<a id="s-register"></a>
### register(NedConnectionBase)

```java
public void register(com.tailf.ned.NedConnectionBase userMod)
```

Types: [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

Register a new NedConnection with the mux. It will be reported
 to NCS when the NedMux connects to NCS and the NCS can request
 new connections to be established using the NedConnection
 object.

**Parameters**

- `com.tailf.ned.NedConnectionBase userMod`

<a id="s-removeFromConnectionList"></a>
### removeFromConnectionList(int)

```java
protected void removeFromConnectionList(int id)
```

Removes the connection from the mux, indicating that it has
 been closed. It will be removed from the internal connection
 table and its connection id can be reused.

**Parameters**

- `int id` - is the connection_id of the terminated connection

<a id="s-reRegister"></a>
### reRegister(NedConnectionBase)

```java
public boolean reRegister(com.tailf.ned.NedConnectionBase userMod)
```

Types: [NedConnectionBase](NedConnectionBase.md#s-NedConnectionBase)

The reRegister method will, NCS unknowingly, exchange the
 ned implementation on the fly. Since no communication with NCS is
 performed, only exchanged of already registered neds are allowed.
 The method returns true if an exchange was performed.

**Parameters**

- `com.tailf.ned.NedConnectionBase userMod`

<a id="s-resetNewNeds"></a>
### resetNewNeds()

```java
public void resetNewNeds()
```

<a id="s-run"></a>
### run()

```java
public void run()
```

<a id="s-setErrorVerbosity"></a>
### setErrorVerbosity(ErrorVerbosity)

```java
public void setErrorVerbosity(com.tailf.conf.ErrorVerbosity verbosity)
```

Types: [ErrorVerbosity](../conf/ErrorVerbosity.md#s-ErrorVerbosity)

set the local verbosity level for reported errors
 If this verbosity is set to null the the default level governs the error
 verbosity of this NedMux

**Parameters**

- `com.tailf.conf.ErrorVerbosity verbosity`

<a id="s-start"></a>
### start()

```java
public void start()
```

<a id="s-stopRequest"></a>
### stopRequest()

```java
public void stopRequest()
```

<a id="s-termRead"></a>
### termRead(Socket)

```java
protected com.tailf.proto.ConfEObject termRead(
    java.net.Socket sock
)
    throws com.tailf.proto.ConfEDecodeException, java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfEDecodeException](../proto/ConfEDecodeException.md#s-ConfEDecodeException), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `java.net.Socket sock`
