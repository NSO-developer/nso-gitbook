<a id="cls-SessionContainer"></a>
# SessionContainer

```java
public class com.tailf.navu.SessionContainer
```

## Members

**Constructors**:

- [SessionContainer()](#m-sessioncontainer-5722e7c9e0a4)

**Methods**:

- [addCdbSession(CdbSession)](#m-addcdbsession-f7ca9b94278a)
- [addDbType(CdbDBType)](#m-adddbtype-2ce0fb5bdde5)
- [addLocalCdb(Cdb)](#m-addlocalcdb-96c2b7d1d52f)
- [addLocalSocket(Socket)](#m-addlocalsocket-b8f21bb4cf13)
- [addLocks(EnumSet<CdbLockType>)](#m-addlocks-cd86e43787ca)
- [addRootCdb(Cdb)](#m-addrootcdb-667684e02a6f)
- [getCdbSession()](#m-getcdbsession-8bef8e62ac12)
- [getDbType()](#m-getdbtype-9503dd2b103d)
- [getLocalCdb()](#m-getlocalcdb-c973782f43e5)
- [getLocalSocket()](#m-getlocalsocket-d59b3f74caea)
- [getLocks()](#m-getlocks-252721701f90)
- [getRootCdb()](#m-getrootcdb-5b1594e46589)

## Constructors

<a id="m-sessioncontainer-5722e7c9e0a4"></a>
### SessionContainer()

```java
public SessionContainer()
```


## Methods

<a id="m-addcdbsession-f7ca9b94278a"></a>
### addCdbSession(CdbSession)

```java
public void addCdbSession(com.tailf.cdb.CdbSession cdbSession)
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

**Parameters**

- `com.tailf.cdb.CdbSession cdbSession`

<a id="m-adddbtype-2ce0fb5bdde5"></a>
### addDbType(CdbDBType)

```java
public void addDbType(com.tailf.cdb.CdbDBType dbType)
```

Types: [CdbDBType](../cdb/CdbDBType.md#cls-CdbDBType)

**Parameters**

- `com.tailf.cdb.CdbDBType dbType`

<a id="m-addlocalcdb-96c2b7d1d52f"></a>
### addLocalCdb(Cdb)

```java
public void addLocalCdb(com.tailf.cdb.Cdb localCdb)
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb)

**Parameters**

- `com.tailf.cdb.Cdb localCdb`

<a id="m-addlocalsocket-b8f21bb4cf13"></a>
### addLocalSocket(Socket)

```java
public void addLocalSocket(java.net.Socket localSocket)
```

**Parameters**

- `java.net.Socket localSocket`

<a id="m-addlocks-cd86e43787ca"></a>
### addLocks(EnumSet<CdbLockType>)

```java
public void addLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType)

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

<a id="m-addrootcdb-667684e02a6f"></a>
### addRootCdb(Cdb)

```java
public void addRootCdb(com.tailf.cdb.Cdb rootCdb)
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb)

**Parameters**

- `com.tailf.cdb.Cdb rootCdb`

<a id="m-getcdbsession-8bef8e62ac12"></a>
### getCdbSession()

```java
public com.tailf.cdb.CdbSession getCdbSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

<a id="m-getdbtype-9503dd2b103d"></a>
### getDbType()

```java
public com.tailf.cdb.CdbDBType getDbType()
```

Types: [CdbDBType](../cdb/CdbDBType.md#cls-CdbDBType)

<a id="m-getlocalcdb-c973782f43e5"></a>
### getLocalCdb()

```java
public com.tailf.cdb.Cdb getLocalCdb()
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb)

<a id="m-getlocalsocket-d59b3f74caea"></a>
### getLocalSocket()

```java
public java.net.Socket getLocalSocket()
```

<a id="m-getlocks-252721701f90"></a>
### getLocks()

```java
public java.util.EnumSet<com.tailf.cdb.CdbLockType> getLocks()
```

Types: [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType)

<a id="m-getrootcdb-5b1594e46589"></a>
### getRootCdb()

```java
public com.tailf.cdb.Cdb getRootCdb()
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb)
