# CdbDBType <a href="#cls-CdbDBType" id="cls-CdbDBType"></a>

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

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CDB_OPERATIONAL <a href="#m-CDB_OPERATIONAL" id="m-CDB_OPERATIONAL"></a>

```java
public static final com.tailf.cdb.CdbDBType CDB_OPERATIONAL;
```

create a read/write session towards the operational db

### CDB_PRE_COMMIT_RUNNING <a href="#m-CDB_PRE_COMMIT_RUNNING" id="m-CDB_PRE_COMMIT_RUNNING"></a>

```java
public static final com.tailf.cdb.CdbDBType CDB_PRE_COMMIT_RUNNING;
```

create a read session toward the running database as it was before the
 current transaction was committed. This is only possible between a
 notification read by CdbSubscription.read() and the final call of
 CdbSubscription.sync()

### CDB_RUNNING <a href="#m-CDB_RUNNING" id="m-CDB_RUNNING"></a>

```java
public static final com.tailf.cdb.CdbDBType CDB_RUNNING;
```

create a session towards the running db

### CDB_STARTUP <a href="#m-CDB_STARTUP" id="m-CDB_STARTUP"></a>

```java
public static final com.tailf.cdb.CdbDBType CDB_STARTUP;
```

create a session towards the startup db


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbDBType valueOf(String name)
```

Types: [CdbDBType](CdbDBType.md#cls-CdbDBType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbDBType[] values()
```

Types: [CdbDBType](CdbDBType.md#cls-CdbDBType)
