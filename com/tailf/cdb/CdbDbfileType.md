# CdbDbfileType <a href="#cls-CdbDbfileType" id="cls-CdbDbfileType"></a>

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

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CDB_A_CDB <a href="#m-CDB_A_CDB" id="m-CDB_A_CDB"></a>

```java
public static final com.tailf.cdb.CdbDbfileType CDB_A_CDB;
```

cdb file for configuration DB

### CDB_O_CDB <a href="#m-CDB_O_CDB" id="m-CDB_O_CDB"></a>

```java
public static final com.tailf.cdb.CdbDbfileType CDB_O_CDB;
```

cdb file for operational DB

### CDB_S_CDB <a href="#m-CDB_S_CDB" id="m-CDB_S_CDB"></a>

```java
public static final com.tailf.cdb.CdbDbfileType CDB_S_CDB;
```

cdb file for snapshot DB


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbDbfileType valueOf(String name)
```

Types: [CdbDbfileType](CdbDbfileType.md#cls-CdbDbfileType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbDbfileType[] values()
```

Types: [CdbDbfileType](CdbDbfileType.md#cls-CdbDbfileType)
