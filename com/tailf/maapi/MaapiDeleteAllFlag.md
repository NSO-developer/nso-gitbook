# MaapiDeleteAllFlag <a href="#cls-MaapiDeleteAllFlag" id="cls-MaapiDeleteAllFlag"></a>

```java
public enum com.tailf.maapi.MaapiDeleteAllFlag
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#cls-MaapiDeleteAllFlag)

Flags for use in:
   [`Maapi#deleteAll(int, MaapiDeleteAllFlag)`](Maapi.md#m-deleteAll-b0d5e11220fb)

## Members

**Enum Constants**:

- [DEL_ALL](#m-DEL_ALL)
- [DEL_EXPORTED](#m-DEL_EXPORTED)
- [DEL_SAFE](#m-DEL_SAFE)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### DEL_ALL <a href="#m-DEL_ALL" id="m-DEL_ALL"></a>

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_ALL;
```

Delete everything. AAA rules are ignored.

### DEL_EXPORTED <a href="#m-DEL_EXPORTED" id="m-DEL_EXPORTED"></a>

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_EXPORTED;
```

Delete everything except namespaces that were exported to none
   (with tailf:export none). AAA rules are ignored, i.e. nodes are
   deleted even if the AAA rules don't allow it.

### DEL_SAFE <a href="#m-DEL_SAFE" id="m-DEL_SAFE"></a>

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_SAFE;
```

Delete everything except namespaces that were exported to none
   (with tailf:export none). Toplevel nodes that cannot be deleted due
   to AAA rules are silently left in place, but descendant nodes will
   still be deleted if the AAA rules allow it.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.maapi.MaapiDeleteAllFlag valueOf(int i)
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#cls-MaapiDeleteAllFlag)

**Parameters**

- `int i`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.maapi.MaapiDeleteAllFlag valueOf(String name)
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#cls-MaapiDeleteAllFlag)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.MaapiDeleteAllFlag[] values()
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#cls-MaapiDeleteAllFlag)
