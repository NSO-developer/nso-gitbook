<a id="cls-CdbDBType"></a>
# CdbDBType

```java
public enum com.tailf.cdb.CdbDBType
```

Types: [CdbDBType](CdbDBType.md#cls-CdbDBType)

Database types specified when setting up CDB sessions

## Members

**Enum Constants**:

- [CDB_OPERATIONAL](#m-CDB_OPERATIONAL)
- [CDB_PRE_COMMIT_RUNNING](#m-CDB_PRE_COMMIT_RUNNING)
- [CDB_RUNNING](#m-CDB_RUNNING)
- [CDB_STARTUP](#m-CDB_STARTUP)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CDB_OPERATIONAL"></a>
### CDB_OPERATIONAL

```java
public static final com.tailf.cdb.CdbDBType CDB_OPERATIONAL;
```

create a read/write session towards the operational db

<a id="m-CDB_PRE_COMMIT_RUNNING"></a>
### CDB_PRE_COMMIT_RUNNING

```java
public static final com.tailf.cdb.CdbDBType CDB_PRE_COMMIT_RUNNING;
```

create a read session toward the running database as it was before the
 current transaction was committed. This is only possible between a
 notification read by CdbSubscription.read() and the final call of
 CdbSubscription.sync()

<a id="m-CDB_RUNNING"></a>
### CDB_RUNNING

```java
public static final com.tailf.cdb.CdbDBType CDB_RUNNING;
```

create a session towards the running db

<a id="m-CDB_STARTUP"></a>
### CDB_STARTUP

```java
public static final com.tailf.cdb.CdbDBType CDB_STARTUP;
```

create a session towards the startup db


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbDBType valueOf(String name)
```

Types: [CdbDBType](CdbDBType.md#cls-CdbDBType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.cdb.CdbDBType[] values()
```

Types: [CdbDBType](CdbDBType.md#cls-CdbDBType)
