# SessionContainer <a href="#cls-SessionContainer" id="cls-SessionContainer"></a>

```java
public class com.tailf.navu.SessionContainer
```

## Members

**Constructors**:

- [SessionContainer()](#m-SessionContainer-5722e7c9e0a4)

**Methods**:

- [addCdbSession(CdbSession)](#m-addCdbSession-f7ca9b94278a)
- [addDbType(CdbDBType)](#m-addDbType-2ce0fb5bdde5)
- [addLocalCdb(Cdb)](#m-addLocalCdb-96c2b7d1d52f)
- [addLocalSocket(Socket)](#m-addLocalSocket-b8f21bb4cf13)
- [addLocks(EnumSet<CdbLockType>)](#m-addLocks-cd86e43787ca)
- [addRootCdb(Cdb)](#m-addRootCdb-667684e02a6f)
- [getCdbSession()](#m-getCdbSession-8bef8e62ac12)
- [getDbType()](#m-getDbType-9503dd2b103d)
- [getLocalCdb()](#m-getLocalCdb-c973782f43e5)
- [getLocalSocket()](#m-getLocalSocket-d59b3f74caea)
- [getLocks()](#m-getLocks-252721701f90)
- [getRootCdb()](#m-getRootCdb-5b1594e46589)

## Constructors

### SessionContainer() <a href="#m-SessionContainer-5722e7c9e0a4" id="m-SessionContainer-5722e7c9e0a4"></a>

```java
public SessionContainer()
```


## Methods

### addCdbSession(CdbSession) <a href="#m-addCdbSession-f7ca9b94278a" id="m-addCdbSession-f7ca9b94278a"></a>

```java
public void addCdbSession(com.tailf.cdb.CdbSession cdbSession)
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

**Parameters**

- `com.tailf.cdb.CdbSession cdbSession`

### addDbType(CdbDBType) <a href="#m-addDbType-2ce0fb5bdde5" id="m-addDbType-2ce0fb5bdde5"></a>

```java
public void addDbType(com.tailf.cdb.CdbDBType dbType)
```

Types: [CdbDBType](../cdb/CdbDBType.md#cls-CdbDBType)

**Parameters**

- `com.tailf.cdb.CdbDBType dbType`

### addLocalCdb(Cdb) <a href="#m-addLocalCdb-96c2b7d1d52f" id="m-addLocalCdb-96c2b7d1d52f"></a>

```java
public void addLocalCdb(com.tailf.cdb.Cdb localCdb)
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb)

**Parameters**

- `com.tailf.cdb.Cdb localCdb`

### addLocalSocket(Socket) <a href="#m-addLocalSocket-b8f21bb4cf13" id="m-addLocalSocket-b8f21bb4cf13"></a>

```java
public void addLocalSocket(java.net.Socket localSocket)
```

**Parameters**

- `java.net.Socket localSocket`

### addLocks(EnumSet<CdbLockType>) <a href="#m-addLocks-cd86e43787ca" id="m-addLocks-cd86e43787ca"></a>

```java
public void addLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType)

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

### addRootCdb(Cdb) <a href="#m-addRootCdb-667684e02a6f" id="m-addRootCdb-667684e02a6f"></a>

```java
public void addRootCdb(com.tailf.cdb.Cdb rootCdb)
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb)

**Parameters**

- `com.tailf.cdb.Cdb rootCdb`

### getCdbSession() <a href="#m-getCdbSession-8bef8e62ac12" id="m-getCdbSession-8bef8e62ac12"></a>

```java
public com.tailf.cdb.CdbSession getCdbSession()
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession)

### getDbType() <a href="#m-getDbType-9503dd2b103d" id="m-getDbType-9503dd2b103d"></a>

```java
public com.tailf.cdb.CdbDBType getDbType()
```

Types: [CdbDBType](../cdb/CdbDBType.md#cls-CdbDBType)

### getLocalCdb() <a href="#m-getLocalCdb-c973782f43e5" id="m-getLocalCdb-c973782f43e5"></a>

```java
public com.tailf.cdb.Cdb getLocalCdb()
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb)

### getLocalSocket() <a href="#m-getLocalSocket-d59b3f74caea" id="m-getLocalSocket-d59b3f74caea"></a>

```java
public java.net.Socket getLocalSocket()
```

### getLocks() <a href="#m-getLocks-252721701f90" id="m-getLocks-252721701f90"></a>

```java
public java.util.EnumSet<com.tailf.cdb.CdbLockType> getLocks()
```

Types: [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType)

### getRootCdb() <a href="#m-getRootCdb-5b1594e46589" id="m-getRootCdb-5b1594e46589"></a>

```java
public com.tailf.cdb.Cdb getRootCdb()
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb)
