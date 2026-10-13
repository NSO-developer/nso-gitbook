# NavuCdbSessionPool <a href="#navucdbsessionpool-34864381adf5" id="navucdbsessionpool-34864381adf5"></a>

**Package-private**

```java
class com.tailf.navu.NavuCdbSessionPool
```

## Members

**Constructors**:

- [NavuCdbSessionPool\(\)](#navucdbsessionpool-d5eff8a65c40)

**Methods**:

- [getCdbSession\(Cdb, CdbDBType\)](#getcdbsession-d341a676ff83)
- [getCdbSession\(Cdb, CdbDBType, EnumSet\<CdbLockType\>\)](#getcdbsession-1e3bd33ef562)
- [removeAllSessions\(\)](#removeallsessions-211f72fa9478)
- [removeCdbSessions\(Cdb\)](#removecdbsessions-5b75ba1be78f)
- [setImpl\(NavuCdbSessionPoolable\)](#setimpl-fa30123ffe55)

## Constructors

### NavuCdbSessionPool() <a href="#navucdbsessionpool-d5eff8a65c40" id="navucdbsessionpool-d5eff8a65c40"></a>

**Package-private**

```java
NavuCdbSessionPool()
```


## Methods

### getCdbSession(Cdb, CdbDBType) <a href="#getcdbsession-d341a676ff83" id="getcdbsession-d341a676ff83"></a>

```java
public static com.tailf.cdb.CdbSession getCdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbType
)
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283), [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9), [CdbDBType](../cdb/CdbDBType.md#cdbdbtype-5ae1aed3f97a)

Return a CdbSession towards the dbType with no locks.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - root CDB to identify owner
- `com.tailf.cdb.CdbDBType dbType` - one of [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28) or
              [`Conf#DB_OPERATIONAL`](../conf/Conf.md#db_operational-0d12377eea71)

**Returns:** CdbSession

### getCdbSession(Cdb, CdbDBType, EnumSet&lt;CdbLockType&gt;) <a href="#getcdbsession-1e3bd33ef562" id="getcdbsession-1e3bd33ef562"></a>

```java
public static com.tailf.cdb.CdbSession getCdbSession(
    com.tailf.cdb.Cdb cdb,
    com.tailf.cdb.CdbDBType dbType,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> locks
)
```

Types: [CdbSession](../cdb/CdbSession.md#cdbsession-9ffa54666283), [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9), [CdbDBType](../cdb/CdbDBType.md#cdbdbtype-5ae1aed3f97a), [CdbLockType](../cdb/CdbLockType.md#cdblocktype-1d165621c0a3)

Return a CdbSession towards the dbType with specified locks.

**Parameters**

- `com.tailf.cdb.Cdb cdb` - root CDB to identify owner
- `com.tailf.cdb.CdbDBType dbType` - one of [`Conf#DB_RUNNING`](../conf/Conf.md#db_running-c391f371da28) or
              [`Conf#DB_OPERATIONAL`](../conf/Conf.md#db_operational-0d12377eea71)
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks` - EnumSet of [`CdbLockType`](../cdb/CdbLockType.md#cdblocktype-1d165621c0a3)

**Returns:** CdbSession

### removeAllSessions() <a href="#removeallsessions-211f72fa9478" id="removeallsessions-211f72fa9478"></a>

```java
public static void removeAllSessions() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

Removes all CdbSession in the session pool

**Throws**

- `IOException`
- `ConfException`

### removeCdbSessions(Cdb) <a href="#removecdbsessions-5b75ba1be78f" id="removecdbsessions-5b75ba1be78f"></a>

```java
public static void removeCdbSessions(com.tailf.cdb.Cdb cdb)
```

Types: [Cdb](../cdb/Cdb.md#cdb-cb7fc41768c9)

Removes all CdbSessions associated with a root Cdb

**Parameters**

- `com.tailf.cdb.Cdb cdb` - root Cdb to identify owner

### setImpl(NavuCdbSessionPoolable) <a href="#setimpl-fa30123ffe55" id="setimpl-fa30123ffe55"></a>

```java
public static void setImpl(
    com.tailf.navu.NavuCdbSessionPoolable pool
)
    throws com.tailf.navu.NavuException
```

Types: [NavuCdbSessionPoolable](NavuCdbSessionPoolable.md#navucdbsessionpoolable-eedc8a7da633), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Convenience method for set a new implementation works only if the
 previous pool is not in use. Throws NavuException if it is.

**Parameters**

- `com.tailf.navu.NavuCdbSessionPoolable pool` - NavuCdbSessionPoolable pool implementation

**Throws**

- `NavuException`
