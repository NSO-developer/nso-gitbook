<a id="s-NavuCdbSessionPoolImpl"></a>
# NavuCdbSessionPoolImpl

**Package-private**

```java
class com.tailf.navu.NavuCdbSessionPoolImpl
    implements com.tailf.navu.NavuCdbSessionPoolable
```

Types: [NavuCdbSessionPoolable](NavuCdbSessionPoolable.md#s-NavuCdbSessionPoolable)

## Members

**Constructors**:

- [NavuCdbSessionPoolImpl()](#s-NavuCdbSessionPoolImpl-1)

**Methods**:

- [getSession(Cdb, CdbDBType, EnumSet<CdbLockType>)](#s-getSession)
- [poolInUse()](#s-poolInUse)
- [removeAllForCdb(Cdb)](#s-removeAllForCdb)
- [removeAllSessions()](#s-removeAllSessions)

## Constructors

<a id="s-NavuCdbSessionPoolImpl-1"></a>
### NavuCdbSessionPoolImpl()

**Package-private**

```java
NavuCdbSessionPoolImpl()
```


## Methods

<a id="s-getSession"></a>
### getSession(Cdb, CdbDBType, EnumSet<CdbLockType>)

```java
public com.tailf.cdb.CdbSession getSession(
    com.tailf.cdb.Cdb rootCdb,
    com.tailf.cdb.CdbDBType dbType,
    java.util.EnumSet<com.tailf.cdb.CdbLockType> locks
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CdbSession](../cdb/CdbSession.md#s-CdbSession), [Cdb](../cdb/Cdb.md#s-Cdb), [CdbDBType](../cdb/CdbDBType.md#s-CdbDBType), [CdbLockType](../cdb/CdbLockType.md#s-CdbLockType), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.cdb.Cdb rootCdb`
- `com.tailf.cdb.CdbDBType dbType`
- `java.util.EnumSet<com.tailf.cdb.CdbLockType> locks`

<a id="s-poolInUse"></a>
### poolInUse()

```java
public boolean poolInUse()
```

<a id="s-removeAllForCdb"></a>
### removeAllForCdb(Cdb)

```java
public void removeAllForCdb(
    com.tailf.cdb.Cdb rootCdb
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [Cdb](../cdb/Cdb.md#s-Cdb), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.cdb.Cdb rootCdb`

<a id="s-removeAllSessions"></a>
### removeAllSessions()

```java
public void removeAllSessions() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)
