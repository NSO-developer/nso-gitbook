# CdbDbfileType <a href="#cdbdbfiletype-a0872754369c" id="cdbdbfiletype-a0872754369c"></a>

```java
public enum com.tailf.cdb.CdbDbfileType
```

Types: [CdbDbfileType](CdbDbfileType.md#cdbdbfiletype-a0872754369c)

Database file types specified when initiating compaction
 or retrieving compaction info

## Members

**Enum Constants**:

- [CDB\_A\_CDB](#cdb_a_cdb-b16407b4afb8)
- [CDB\_O\_CDB](#cdb_o_cdb-7744e7292c9e)
- [CDB\_S\_CDB](#cdb_s_cdb-1139e1b3fa0a)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CDB_A_CDB <a href="#cdb_a_cdb-b16407b4afb8" id="cdb_a_cdb-b16407b4afb8"></a>

```java
public static final com.tailf.cdb.CdbDbfileType CDB_A_CDB;
```

cdb file for configuration DB

### CDB_O_CDB <a href="#cdb_o_cdb-7744e7292c9e" id="cdb_o_cdb-7744e7292c9e"></a>

```java
public static final com.tailf.cdb.CdbDbfileType CDB_O_CDB;
```

cdb file for operational DB

### CDB_S_CDB <a href="#cdb_s_cdb-1139e1b3fa0a" id="cdb_s_cdb-1139e1b3fa0a"></a>

```java
public static final com.tailf.cdb.CdbDbfileType CDB_S_CDB;
```

cdb file for snapshot DB


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbDbfileType valueOf(String name)
```

Types: [CdbDbfileType](CdbDbfileType.md#cdbdbfiletype-a0872754369c)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbDbfileType[] values()
```

Types: [CdbDbfileType](CdbDbfileType.md#cdbdbfiletype-a0872754369c)
