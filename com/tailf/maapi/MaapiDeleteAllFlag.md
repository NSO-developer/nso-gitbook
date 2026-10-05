# MaapiDeleteAllFlag <a href="#maapideleteallflag-ab18714d13ee" id="maapideleteallflag-ab18714d13ee"></a>

```java
public enum com.tailf.maapi.MaapiDeleteAllFlag
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#maapideleteallflag-ab18714d13ee)

Flags for use in:
   [`Maapi#deleteAll(int, MaapiDeleteAllFlag)`](Maapi.md#deleteall-b0d5e11220fb)

## Members

**Enum Constants**:

- [DEL_ALL](#del_all-6da46022ffb7)
- [DEL_EXPORTED](#del_exported-c1133a0a2e13)
- [DEL_SAFE](#del_safe-d3fc545efed9)

**Methods**:

- [getValue()](#getvalue-d93864668c40)
- [valueOf(int)](#valueof-c0d46d25fc67)
- [valueOf(String)](#valueof-ac61b3547613)
- [values()](#values-406dfe3ca270)

## Enum Constants

### DEL_ALL <a href="#del_all-6da46022ffb7" id="del_all-6da46022ffb7"></a>

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_ALL;
```

Delete everything. AAA rules are ignored.

### DEL_EXPORTED <a href="#del_exported-c1133a0a2e13" id="del_exported-c1133a0a2e13"></a>

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_EXPORTED;
```

Delete everything except namespaces that were exported to none
   (with tailf:export none). AAA rules are ignored, i.e. nodes are
   deleted even if the AAA rules don't allow it.

### DEL_SAFE <a href="#del_safe-d3fc545efed9" id="del_safe-d3fc545efed9"></a>

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_SAFE;
```

Delete everything except namespaces that were exported to none
   (with tailf:export none). Toplevel nodes that cannot be deleted due
   to AAA rules are silently left in place, but descendant nodes will
   still be deleted if the AAA rules allow it.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.maapi.MaapiDeleteAllFlag valueOf(int i)
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#maapideleteallflag-ab18714d13ee)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.maapi.MaapiDeleteAllFlag valueOf(String name)
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#maapideleteallflag-ab18714d13ee)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.MaapiDeleteAllFlag[] values()
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#maapideleteallflag-ab18714d13ee)
