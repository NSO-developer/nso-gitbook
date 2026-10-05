<a id="s-CdbDbfileType"></a>
# CdbDbfileType

```java
public enum com.tailf.cdb.CdbDbfileType
```

Types: [CdbDbfileType](CdbDbfileType.md#s-CdbDbfileType)

Database file types specified when initiating compaction
 or retrieving compaction info

**Related classes**

- [CdbDbfileType](CdbDbfileType.md#s-CdbDbfileType)

## Members

**Enum Constants**:

- [CDB_A_CDB](#s-CDB_A_CDB)
- [CDB_O_CDB](#s-CDB_O_CDB)
- [CDB_S_CDB](#s-CDB_S_CDB)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-CDB_A_CDB"></a>
### CDB_A_CDB

```java
public static final com.tailf.cdb.CdbDbfileType CDB_A_CDB;
```

cdb file for configuration DB

<a id="s-CDB_O_CDB"></a>
### CDB_O_CDB

```java
public static final com.tailf.cdb.CdbDbfileType CDB_O_CDB;
```

cdb file for operational DB

<a id="s-CDB_S_CDB"></a>
### CDB_S_CDB

```java
public static final com.tailf.cdb.CdbDbfileType CDB_S_CDB;
```

cdb file for snapshot DB


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.cdb.CdbDbfileType valueOf(String name)
```

Types: [CdbDbfileType](CdbDbfileType.md#s-CdbDbfileType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.cdb.CdbDbfileType[] values()
```

Types: [CdbDbfileType](CdbDbfileType.md#s-CdbDbfileType)
