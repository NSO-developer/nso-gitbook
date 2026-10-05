<a id="cls-CdbDbfileType"></a>
# CdbDbfileType

```java
public enum com.tailf.cdb.CdbDbfileType
```

Types: [CdbDbfileType](CdbDbfileType.md#cls-CdbDbfileType)

Database file types specified when initiating compaction
 or retrieving compaction info

## Members

**Enum Constants**:

- [CDB_A_CDB](#m-CDB_A_CDB)
- [CDB_O_CDB](#m-CDB_O_CDB)
- [CDB_S_CDB](#m-CDB_S_CDB)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-CDB_A_CDB"></a>
### CDB_A_CDB

```java
public static final com.tailf.cdb.CdbDbfileType CDB_A_CDB;
```

cdb file for configuration DB

<a id="m-CDB_O_CDB"></a>
### CDB_O_CDB

```java
public static final com.tailf.cdb.CdbDbfileType CDB_O_CDB;
```

cdb file for operational DB

<a id="m-CDB_S_CDB"></a>
### CDB_S_CDB

```java
public static final com.tailf.cdb.CdbDbfileType CDB_S_CDB;
```

cdb file for snapshot DB


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbDbfileType valueOf(String name)
```

Types: [CdbDbfileType](CdbDbfileType.md#cls-CdbDbfileType)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.cdb.CdbDbfileType[] values()
```

Types: [CdbDbfileType](CdbDbfileType.md#cls-CdbDbfileType)
