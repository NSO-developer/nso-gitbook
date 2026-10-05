<a id="cls-NavuCdbSessionPool"></a>
# NavuCdbSessionPool

**Package-private**

```java
class com.tailf.navu.NavuCdbSessionPool
```

## Members

**Constructors**:

- [NavuCdbSessionPool()](#m-navucdbsessionpool-d5eff8a65c40)

**Methods**:

- [getCdbSession(Cdb, CdbDBType)](#m-getcdbsession-d341a676ff83)
- [getCdbSession(Cdb, CdbDBType, EnumSet<CdbLockType>)](#m-getcdbsession-1e3bd33ef562)
- [removeAllSessions()](#m-removeallsessions-211f72fa9478)
- [removeCdbSessions(Cdb)](#m-removecdbsessions-5b75ba1be78f)
- [setImpl(NavuCdbSessionPoolable)](#m-setimpl-fa30123ffe55)

## Constructors

<a id="m-navucdbsessionpool-d5eff8a65c40"></a>
### NavuCdbSessionPool()

**Package-private**

```java
NavuCdbSessionPool()
```


## Methods

<a id="m-getcdbsession-d341a676ff83"></a>
### getCdbSession(Cdb, CdbDBType)

```java
public static com.tailf.cdb.CdbSession getCdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbType
)
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession), [Cdb](../cdb/Cdb.md#cls-Cdb), [CdbDBType](../cdb/CdbDBType.md#cls-CdbDBType)

Return a CdbSession towards the dbType with no locks.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - root CDB to identify owner
- `com.tailf.cdb.CdbDBType dbType` - one of [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING) or
              [`Conf#DB_OPERATIONAL`](../conf/Conf.md#m-DB_OPERATIONAL)

**Returns:** CdbSession

<a id="m-getcdbsession-1e3bd33ef562"></a>
### getCdbSession(Cdb, CdbDBType, EnumSet<CdbLockType>)

```java
public static com.tailf.cdb.CdbSession getCdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbType,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> locks
)
```

Types: [CdbSession](../cdb/CdbSession.md#cls-CdbSession), [Cdb](../cdb/Cdb.md#cls-Cdb), [CdbDBType](../cdb/CdbDBType.md#cls-CdbDBType), [CdbLockType](../cdb/CdbLockType.md#cls-CdbLockType)

Return a CdbSession towards the dbType with specified locks.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - root CDB to identify owner
- `com.tailf.cdb.CdbDBType dbType` - one of [`Conf#DB_RUNNING`](../conf/Conf.md#m-DB_RUNNING) or
              [`Conf#DB_OPERATIONAL`](../conf/Conf.md#m-DB_OPERATIONAL)
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks` - EnumSet of [`CdbLockType`](../cdb/CdbLockType.md#cls-CdbLockType)

**Returns:** CdbSession

<a id="m-removeallsessions-211f72fa9478"></a>
### removeAllSessions()

```java
public static void removeAllSessions() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Removes all CdbSession in the session pool

**Throws**

- `IOException`
- `ConfException`

<a id="m-removecdbsessions-5b75ba1be78f"></a>
### removeCdbSessions(Cdb)

```java
public static void removeCdbSessions(com.tailf.cdb.Cdb cdb)
```

Types: [Cdb](../cdb/Cdb.md#cls-Cdb)

Removes all CdbSessions associated with a root Cdb

**Parameters**

- `com.tailf.cdb.Cdb cdb` - root Cdb to identify owner

<a id="m-setimpl-fa30123ffe55"></a>
### setImpl(NavuCdbSessionPoolable)

```java
public static void setImpl(
    com.tailf.navu.NavuCdbSessionPoolable pool
)
    throws com.tailf.navu.NavuException
```

Types: [NavuCdbSessionPoolable](NavuCdbSessionPoolable.md#cls-NavuCdbSessionPoolable), [NavuException](NavuException.md#cls-NavuException)

Convenience method for set a new implementation works only if the
 previous pool is not in use. Throws NavuException if it is.

**Parameters**

- `com.tailf.navu.NavuCdbSessionPoolable pool` - NavuCdbSessionPoolable pool implementation

**Throws**

- `NavuException`
