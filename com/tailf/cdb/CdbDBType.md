# CdbDBType <a href="#cdbdbtype-5ae1aed3f97a" id="cdbdbtype-5ae1aed3f97a"></a>

```java
public enum com.tailf.cdb.CdbDBType
```

Database types specified when setting up CDB sessions

## Members

**Enum Constants**:

- [CDB\_OPERATIONAL](#cdb_operational-502b916801c6)
- [CDB\_PRE\_COMMIT\_RUNNING](#cdb_pre_commit_running-68ec740136a8)
- [CDB\_RUNNING](#cdb_running-a1f43295f116)
- [CDB\_STARTUP](#cdb_startup-4e1e423a32bb)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CDB_OPERATIONAL <a href="#cdb_operational-502b916801c6" id="cdb_operational-502b916801c6"></a>

```java
public static final com.tailf.cdb.CdbDBType CDB_OPERATIONAL;
```

create a read/write session towards the operational db

### CDB_PRE_COMMIT_RUNNING <a href="#cdb_pre_commit_running-68ec740136a8" id="cdb_pre_commit_running-68ec740136a8"></a>

```java
public static final com.tailf.cdb.CdbDBType CDB_PRE_COMMIT_RUNNING;
```

create a read session toward the running database as it was before the
 current transaction was committed. This is only possible between a
 notification read by CdbSubscription.read() and the final call of
 CdbSubscription.sync()

### CDB_RUNNING <a href="#cdb_running-a1f43295f116" id="cdb_running-a1f43295f116"></a>

```java
public static final com.tailf.cdb.CdbDBType CDB_RUNNING;
```

create a session towards the running db

### CDB_STARTUP <a href="#cdb_startup-4e1e423a32bb" id="cdb_startup-4e1e423a32bb"></a>

```java
public static final com.tailf.cdb.CdbDBType CDB_STARTUP;
```

create a session towards the startup db


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbDBType valueOf(String name)
```

Types: [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbDBType[] values()
```

Types: [CdbDBType](CdbDBType.md#cdbdbtype-5ae1aed3f97a)
