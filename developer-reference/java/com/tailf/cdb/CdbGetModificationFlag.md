# CdbGetModificationFlag <a href="#cdbgetmodificationflag-5905bbf36241" id="cdbgetmodificationflag-5905bbf36241"></a>

```java
public enum com.tailf.cdb.CdbGetModificationFlag
```

## Members

**Enum Constants**:

- [CDB\_GET\_MODS\_CLI\_NO\_BACKQUOTES](#cdb_get_mods_cli_no_backquotes-f77ecdcb82aa)
- [CDB\_GET\_MODS\_CLI\_SUPPRESS\_QUOTING](#cdb_get_mods_cli_suppress_quoting-2e253ea6db62)
- [CDB\_GET\_MODS\_INCLUDE\_LISTS](#cdb_get_mods_include_lists-0911f0c4b5f1)
- [CDB\_GET\_MODS\_INCLUDE\_MOVES](#cdb_get_mods_include_moves-02241f608c8e)
- [CDB\_GET\_MODS\_REVERSE](#cdb_get_mods_reverse-ad28ccaadd8f)
- [CDB\_GET\_MODS\_SUPPRESS\_DEFAULTS](#cdb_get_mods_suppress_defaults-da168d5178bc)
- [CDB\_GET\_MODS\_WANT\_ANCESTOR\_DELETE](#cdb_get_mods_want_ancestor_delete-01b2af02cfb1)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CDB_GET_MODS_CLI_NO_BACKQUOTES <a href="#cdb_get_mods_cli_no_backquotes-f77ecdcb82aa" id="cdb_get_mods_cli_no_backquotes-f77ecdcb82aa"></a>

```java
CDB_GET_MODS_CLI_NO_BACKQUOTES(1 << 3);
```

### CDB_GET_MODS_CLI_SUPPRESS_QUOTING <a href="#cdb_get_mods_cli_suppress_quoting-2e253ea6db62" id="cdb_get_mods_cli_suppress_quoting-2e253ea6db62"></a>

```java
CDB_GET_MODS_CLI_SUPPRESS_QUOTING(1 << 6);
```

### CDB_GET_MODS_INCLUDE_LISTS <a href="#cdb_get_mods_include_lists-0911f0c4b5f1" id="cdb_get_mods_include_lists-0911f0c4b5f1"></a>

```java
CDB_GET_MODS_INCLUDE_LISTS(1 << 0);
```

### CDB_GET_MODS_INCLUDE_MOVES <a href="#cdb_get_mods_include_moves-02241f608c8e" id="cdb_get_mods_include_moves-02241f608c8e"></a>

```java
CDB_GET_MODS_INCLUDE_MOVES(1 << 4);
```

### CDB_GET_MODS_REVERSE <a href="#cdb_get_mods_reverse-ad28ccaadd8f" id="cdb_get_mods_reverse-ad28ccaadd8f"></a>

```java
CDB_GET_MODS_REVERSE(1 << 1);
```

### CDB_GET_MODS_SUPPRESS_DEFAULTS <a href="#cdb_get_mods_suppress_defaults-da168d5178bc" id="cdb_get_mods_suppress_defaults-da168d5178bc"></a>

```java
CDB_GET_MODS_SUPPRESS_DEFAULTS(1 << 2);
```

### CDB_GET_MODS_WANT_ANCESTOR_DELETE <a href="#cdb_get_mods_want_ancestor_delete-01b2af02cfb1" id="cdb_get_mods_want_ancestor_delete-01b2af02cfb1"></a>

```java
CDB_GET_MODS_WANT_ANCESTOR_DELETE(1 << 5);
```


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.cdb.CdbGetModificationFlag valueOf(int i)
```

Types: [CdbGetModificationFlag](CdbGetModificationFlag.md#cdbgetmodificationflag-5905bbf36241)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.cdb.CdbGetModificationFlag valueOf(String name)
```

Types: [CdbGetModificationFlag](CdbGetModificationFlag.md#cdbgetmodificationflag-5905bbf36241)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.cdb.CdbGetModificationFlag[] values()
```

Types: [CdbGetModificationFlag](CdbGetModificationFlag.md#cdbgetmodificationflag-5905bbf36241)
