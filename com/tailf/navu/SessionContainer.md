<a id="s-SessionContainer"></a>
# SessionContainer

```java
public class com.tailf.navu.SessionContainer
```

## Members

**Constructors**:

- [SessionContainer()](#s-SessionContainer-1)

**Methods**:

- [addCdbSession(CdbSession)](#s-addCdbSession)
- [addDbType(CdbDBType)](#s-addDbType)
- [addLocalCdb(Cdb)](#s-addLocalCdb)
- [addLocalSocket(Socket)](#s-addLocalSocket)
- [addLocks(EnumSet<CdbLockType>)](#s-addLocks)
- [addRootCdb(Cdb)](#s-addRootCdb)
- [getCdbSession()](#s-getCdbSession)
- [getDbType()](#s-getDbType)
- [getLocalCdb()](#s-getLocalCdb)
- [getLocalSocket()](#s-getLocalSocket)
- [getLocks()](#s-getLocks)
- [getRootCdb()](#s-getRootCdb)

## Constructors

<a id="s-SessionContainer-1"></a>
### SessionContainer()

```java
public SessionContainer()
```


## Methods

<a id="s-addCdbSession"></a>
### addCdbSession(CdbSession)

```java
public void addCdbSession(com.tailf.cdb.CdbSession cdbSession)
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession)

**Parameters**

- `com.tailf.cdb.CdbSession cdbSession`

<a id="s-addDbType"></a>
### addDbType(CdbDBType)

```java
public void addDbType(com.tailf.cdb.CdbDBType dbType)
```

Types: [CdbDBType](../cdb/CdbDBType.md#s-CdbDBType)

**Parameters**

- `com.tailf.cdb.CdbDBType dbType`

<a id="s-addLocalCdb"></a>
### addLocalCdb(Cdb)

```java
public void addLocalCdb(com.tailf.cdb.Cdb localCdb)
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb)

**Parameters**

- `com.tailf.cdb.Cdb localCdb`

<a id="s-addLocalSocket"></a>
### addLocalSocket(Socket)

```java
public void addLocalSocket(java.net.Socket localSocket)
```

**Parameters**

- `java.net.Socket localSocket`

<a id="s-addLocks"></a>
### addLocks(EnumSet<CdbLockType>)

```java
public void addLocks(java.util.EnumSet<com.tailf.cdb.CdbLockType> locks)
```

Types: [CdbLockType](../cdb/CdbLockType.md#s-CdbLockType)

**Parameters**

- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

<a id="s-addRootCdb"></a>
### addRootCdb(Cdb)

```java
public void addRootCdb(com.tailf.cdb.Cdb rootCdb)
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb)

**Parameters**

- `com.tailf.cdb.Cdb rootCdb`

<a id="s-getCdbSession"></a>
### getCdbSession()

```java
public com.tailf.cdb.CdbSession getCdbSession()
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession)

<a id="s-getDbType"></a>
### getDbType()

```java
public com.tailf.cdb.CdbDBType getDbType()
```

Types: [CdbDBType](../cdb/CdbDBType.md#s-CdbDBType)

<a id="s-getLocalCdb"></a>
### getLocalCdb()

```java
public com.tailf.cdb.Cdb getLocalCdb()
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb)

<a id="s-getLocalSocket"></a>
### getLocalSocket()

```java
public java.net.Socket getLocalSocket()
```

<a id="s-getLocks"></a>
### getLocks()

```java
public java.util.EnumSet<com.tailf.cdb.CdbLockType> getLocks()
```

Types: [CdbLockType](../cdb/CdbLockType.md#s-CdbLockType)

<a id="s-getRootCdb"></a>
### getRootCdb()

```java
public com.tailf.cdb.Cdb getRootCdb()
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb)
