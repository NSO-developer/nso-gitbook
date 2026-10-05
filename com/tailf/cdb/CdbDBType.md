<a id="s-CdbDBType"></a>
# CdbDBType

```java
public enum com.tailf.cdb.CdbDBType
```

Types: [CdbDBType](CdbDBType.md#s-CdbDBType)

Database types specified when setting up CDB sessions

**Related classes**

- [CdbDBType](CdbDBType.md#s-CdbDBType)

## Members

**Enum Constants**:

- [CDB_OPERATIONAL](#s-CDB_OPERATIONAL)
- [CDB_PRE_COMMIT_RUNNING](#s-CDB_PRE_COMMIT_RUNNING)
- [CDB_RUNNING](#s-CDB_RUNNING)
- [CDB_STARTUP](#s-CDB_STARTUP)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-CDB_OPERATIONAL"></a>
### CDB_OPERATIONAL

```java
public static final com.tailf.cdb.CdbDBType CDB_OPERATIONAL;
```

create a read/write session towards the operational db

<a id="s-CDB_PRE_COMMIT_RUNNING"></a>
### CDB_PRE_COMMIT_RUNNING

```java
public static final com.tailf.cdb.CdbDBType CDB_PRE_COMMIT_RUNNING;
```

create a read session toward the running database as it was before the
 current transaction was committed. This is only possible between a
 notification read by CdbSubscription.read() and the final call of
 CdbSubscription.sync()

<a id="s-CDB_RUNNING"></a>
### CDB_RUNNING

```java
public static final com.tailf.cdb.CdbDBType CDB_RUNNING;
```

create a session towards the running db

<a id="s-CDB_STARTUP"></a>
### CDB_STARTUP

```java
public static final com.tailf.cdb.CdbDBType CDB_STARTUP;
```

create a session towards the startup db


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbDBType valueOf(String name)
```

Types: [CdbDBType](CdbDBType.md#s-CdbDBType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.cdb.CdbDBType[] values()
```

Types: [CdbDBType](CdbDBType.md#s-CdbDBType)
