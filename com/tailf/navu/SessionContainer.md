# SessionContainer <a href="#sessioncontainer-a2e0f5259245" id="sessioncontainer-a2e0f5259245"></a>

```java
public class com.tailf.navu.SessionContainer
```

## Members

**Constructors**:

- [SessionContainer()](#sessioncontainer-5722e7c9e0a4)

**Methods**:

- [addCdbSession(CdbSession)](#addcdbsession-f7ca9b94278a)
- [addDbType(CdbDBType)](#adddbtype-2ce0fb5bdde5)
- [addLocalCdb(Cdb)](#addlocalcdb-96c2b7d1d52f)
- [addLocalSocket(Socket)](#addlocalsocket-b8f21bb4cf13)
- [addLocks(EnumSet<CdbLockType>)](#addlocks-cd86e43787ca)
- [addRootCdb(Cdb)](#addrootcdb-667684e02a6f)
- [getCdbSession()](#getcdbsession-8bef8e62ac12)
- [getDbType()](#getdbtype-9503dd2b103d)
- [getLocalCdb()](#getlocalcdb-c973782f43e5)
- [getLocalSocket()](#getlocalsocket-d59b3f74caea)
- [getLocks()](#getlocks-252721701f90)
- [getRootCdb()](#getrootcdb-5b1594e46589)

## Constructors

### SessionContainer() <a href="#sessioncontainer-5722e7c9e0a4" id="sessioncontainer-5722e7c9e0a4"></a>

```java
public SessionContainer()
```


## Methods

### addCdbSession(CdbSession) <a href="#addcdbsession-f7ca9b94278a" id="addcdbsession-f7ca9b94278a"></a>

```java
public void addCdbSession(com.tailf.cdb.CdbSession cdbSession)
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283)

**Parameters**

- `com.tailf.cdb.CdbSession cdbSession`

### addDbType(CdbDBType) <a href="#adddbtype-2ce0fb5bdde5" id="adddbtype-2ce0fb5bdde5"></a>

```java
public void addDbType(com.tailf.cdb.CdbDBType dbType)
```

Types: [CdbDBType](../cdb/CdbDBType.md#cdbdbtype-5ae1aed3f97a)

**Parameters**

- `com.tailf.cdb.CdbDBType dbType`

### addLocalCdb(Cdb) <a href="#addlocalcdb-96c2b7d1d52f" id="addlocalcdb-96c2b7d1d52f"></a>

```java
public void addLocalCdb(com.tailf.cdb.Cdb localCdb)
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9)

**Parameters**

- `com.tailf.cdb.Cdb localCdb`

### addLocalSocket(Socket) <a href="#addlocalsocket-b8f21bb4cf13" id="addlocalsocket-b8f21bb4cf13"></a>

```java
public void addLocalSocket(java.net.Socket localSocket)
```

**Parameters**

- `java.net.Socket localSocket`

### addLocks(EnumSet&lt;CdbLockType&gt;) <a href="#addlocks-cd86e43787ca" id="addlocks-cd86e43787ca"></a>

```java
public void addLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cdblocktype-1d165621c0a3)

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

### addRootCdb(Cdb) <a href="#addrootcdb-667684e02a6f" id="addrootcdb-667684e02a6f"></a>

```java
public void addRootCdb(com.tailf.cdb.Cdb rootCdb)
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9)

**Parameters**

- `com.tailf.cdb.Cdb rootCdb`

### getCdbSession() <a href="#getcdbsession-8bef8e62ac12" id="getcdbsession-8bef8e62ac12"></a>

```java
public com.tailf.cdb.CdbSession getCdbSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283)

### getDbType() <a href="#getdbtype-9503dd2b103d" id="getdbtype-9503dd2b103d"></a>

```java
public com.tailf.cdb.CdbDBType getDbType()
```

Types: [CdbDBType](../cdb/CdbDBType.md#cdbdbtype-5ae1aed3f97a)

### getLocalCdb() <a href="#getlocalcdb-c973782f43e5" id="getlocalcdb-c973782f43e5"></a>

```java
public com.tailf.cdb.Cdb getLocalCdb()
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9)

### getLocalSocket() <a href="#getlocalsocket-d59b3f74caea" id="getlocalsocket-d59b3f74caea"></a>

```java
public java.net.Socket getLocalSocket()
```

### getLocks() <a href="#getlocks-252721701f90" id="getlocks-252721701f90"></a>

```java
public java.util.EnumSet<com.tailf.cdb.CdbLockType> getLocks()
```

Types: [CdbLockType](../cdb/CdbLockType.md#cdblocktype-1d165621c0a3)

### getRootCdb() <a href="#getrootcdb-5b1594e46589" id="getrootcdb-5b1594e46589"></a>

```java
public com.tailf.cdb.Cdb getRootCdb()
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9)
