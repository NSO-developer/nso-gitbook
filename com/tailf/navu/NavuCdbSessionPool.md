<a id="s-NavuCdbSessionPool"></a>
# NavuCdbSessionPool

**Package-private**

```java
class com.tailf.navu.NavuCdbSessionPool
```

## Members

**Constructors**:

- [NavuCdbSessionPool()](#s-NavuCdbSessionPool-1)

**Methods**:

- [getCdbSession(Cdb, CdbDBType)](#s-getCdbSession)
- [getCdbSession(Cdb, CdbDBType, EnumSet<CdbLockType>)](#s-getCdbSession-1)
- [removeAllSessions()](#s-removeAllSessions)
- [removeCdbSessions(Cdb)](#s-removeCdbSessions)
- [setImpl(NavuCdbSessionPoolable)](#s-setImpl)

## Constructors

<a id="s-NavuCdbSessionPool-1"></a>
### NavuCdbSessionPool()

**Package-private**

```java
NavuCdbSessionPool()
```


## Methods

<a id="s-getCdbSession"></a>
### getCdbSession(Cdb, CdbDBType)

```java
public static com.tailf.cdb.CdbSession getCdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbType
)
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession), [Cdb](../cdb/Cdb.md#s-Cdb), [CdbDBType](../cdb/CdbDBType.md#s-CdbDBType)

Return a CdbSession towards the dbType with no locks.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - root CDB to identify owner
- `com.tailf.cdb.CdbDBType dbType` - one of [`Conf`](../conf/Conf.md#s-Conf) or
              [`Conf`](../conf/Conf.md#s-Conf)

**Returns:** CdbSession

<a id="s-getCdbSession-1"></a>
### getCdbSession(Cdb, CdbDBType, EnumSet<CdbLockType>)

```java
public static com.tailf.cdb.CdbSession getCdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbType,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> locks
)
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession), [Cdb](../cdb/Cdb.md#s-Cdb), [CdbDBType](../cdb/CdbDBType.md#s-CdbDBType), [CdbLockType](../cdb/CdbLockType.md#s-CdbLockType)

Return a CdbSession towards the dbType with specified locks.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - root CDB to identify owner
- `com.tailf.cdb.CdbDBType dbType` - one of [`Conf`](../conf/Conf.md#s-Conf) or
              [`Conf`](../conf/Conf.md#s-Conf)
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks` - EnumSet of [`CdbLockType`](../cdb/CdbLockType.md#s-CdbLockType)

**Returns:** CdbSession

<a id="s-removeAllSessions"></a>
### removeAllSessions()

```java
public static void removeAllSessions() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

Removes all CdbSession in the session pool

**Throws**

- `IOException`
- `ConfException`

<a id="s-removeCdbSessions"></a>
### removeCdbSessions(Cdb)

```java
public static void removeCdbSessions(com.tailf.cdb.Cdb cdb)
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb)

Removes all CdbSessions associated with a root Cdb

**Parameters**

- `com.tailf.cdb.Cdb cdb` - root Cdb to identify owner

<a id="s-setImpl"></a>
### setImpl(NavuCdbSessionPoolable)

```java
public static void setImpl(
    com.tailf.navu.NavuCdbSessionPoolable pool
)
    throws com.tailf.navu.NavuException
```

Types: [NavuCdbSessionPoolable](NavuCdbSessionPoolable.md#s-NavuCdbSessionPoolable), [NavuException](NavuException.md#s-NavuException)

Convenience method for set a new implementation works only if the
 previous pool is not in use. Throws NavuException if it is.

**Parameters**

- `com.tailf.navu.NavuCdbSessionPoolable pool` - NavuCdbSessionPoolable pool implementation

**Throws**

- `NavuException`
