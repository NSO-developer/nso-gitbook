# MaapiFlag <a href="#cls-MaapiFlag" id="cls-MaapiFlag"></a>

```java
public enum com.tailf.maapi.MaapiFlag
```

Types: [MaapiFlag](MaapiFlag.md#cls-MaapiFlag)

Flags used by `Maapi#setFlags(int,EnumSet)` method to control
 read/write sessions.

## Members

**Enum Constants**:

- [CONFIG_ONLY](#m-CONFIG_ONLY)
- [DELAYED_WHEN](#m-DELAYED_WHEN)
- [HIDE_ALL_HIDEGROUPS](#m-HIDE_ALL_HIDEGROUPS)
- [HIDE_INACTIVE](#m-HIDE_INACTIVE)
- [HINT_BULK](#m-HINT_BULK)
- [NO_DEFAULTS](#m-NO_DEFAULTS)
- [SKIP_SUBSCRIBERS](#m-SKIP_SUBSCRIBERS)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CONFIG_ONLY <a href="#m-CONFIG_ONLY" id="m-CONFIG_ONLY"></a>

```java
public static final com.tailf.maapi.MaapiFlag CONFIG_ONLY;
```

This flag will make the `Maapi.getXxx()` method return
 config nodes only.

 if we attempt to read operational data, it will be treated as if the
 nodes did not exist. This is mainly useful in conjunction with
 [`Maapi#getObject(int,String,Object...)`](Maapi.md#m-getObject-8f535bb4e0e8) and list entries or
 containers that have both config
 and operational data (the operational data nodes in the returned array
 will be of class [`ConfNoExists`](../conf/ConfNoExists.md#cls-ConfNoExists) (type J_NOEXISTS),
 but the other functions also obey the flag.

### DELAYED_WHEN <a href="#m-DELAYED_WHEN" id="m-DELAYED_WHEN"></a>

```java
public static final com.tailf.maapi.MaapiFlag DELAYED_WHEN;
```

This flag only takes effect when used in
 `Maapi#startTransFlags(int,int,int,EnumSet)` calls
 and is only meaningful when applied to an read-write transaction.

 It will cause "delayed when" mode to be enabled from the beginning of
 the transaction.
 See [`Maapi#setDelayedWhen(int, boolean)`](Maapi.md#m-setDelayedWhen-38f32854fd19) for
 more information about the "delayed when" mode

### HIDE_ALL_HIDEGROUPS <a href="#m-HIDE_ALL_HIDEGROUPS" id="m-HIDE_ALL_HIDEGROUPS"></a>

```java
public static final com.tailf.maapi.MaapiFlag HIDE_ALL_HIDEGROUPS;
```

This flag only takes effect when used in
 `Maapi#startTransFlags(int,int,int,EnumSet)` calls.

 It will hide all nodes with `tailf:hidden` statement from the
 dry-run result.
 See [`Maapi#applyTransParams(int, boolean, CommitParams)`](Maapi.md#m-applyTransParams-6c20b7896663) for more
 information about the dry-run.

### HIDE_INACTIVE <a href="#m-HIDE_INACTIVE" id="m-HIDE_INACTIVE"></a>

```java
public static final com.tailf.maapi.MaapiFlag HIDE_INACTIVE;
```

This flag only takes effect when used in
 `Maapi#startTransFlags(int,int,int,EnumSet)` calls
 and only when starting a read-only transaction.

 It will hide configuration data that has the
 [`ConfAttributeType#INACTIVE`](../conf/ConfAttributeType.md#m-INACTIVE) attribute set, i.e.
 it will appear as if that data does not exist.

### HINT_BULK <a href="#m-HINT_BULK" id="m-HINT_BULK"></a>

```java
public static final com.tailf.maapi.MaapiFlag HINT_BULK;
```

This flag tells the server that we will be reading substantial amounts
 of data.

 The affect of setting this has the effect that the
 [`DpDataCallback#getObject( DpTrans,ConfObject[])`](../dp/DpDataCallback.md#m-getObject-b2d87f9b9270) and
 [`DpDataCallback#iterator(DpTrans,ConfObject[])`](../dp/DpDataCallback.md#m-iterator-89c62926f3e8),
 [`DpDataCallback#getIteratorKey(
  DpTrans,ConfObject[],Object)`](../dp/DpDataCallback.md#m-getIteratorKey-6df7c38f65f8)
 callbacks (if available) are used towards external data providers
 when we call [`Maapi#getElem(int,String,Object...)`](Maapi.md#m-getElem-1415a215bb24) etc and
 [`Maapi#getNext(MaapiCursor)`](Maapi.md#m-getNext-94186d85d070).

 The [`Maapi#getObject(int,String,Object...)`](Maapi.md#m-getObject-8f535bb4e0e8)
 method always operates as if this flag was set.

### NO_DEFAULTS <a href="#m-NO_DEFAULTS" id="m-NO_DEFAULTS"></a>

```java
public static final com.tailf.maapi.MaapiFlag NO_DEFAULTS;
```

This flag specifies that we want to be informed when we read leafs with
 default values that have not had a value set.

 This is indicated by the returned value being of class
 [`ConfDefault`](../conf/ConfDefault.md#cls-ConfDefault) (type J_DEFAULT) instead of the
 actual value. The default value for such leafs can be obtained from the
 [`Maapi#loadSchemas()`](Maapi.md#m-loadSchemas-84ad3496a6f3) tree provided by the library.

### SKIP_SUBSCRIBERS <a href="#m-SKIP_SUBSCRIBERS" id="m-SKIP_SUBSCRIBERS"></a>

```java
public static final com.tailf.maapi.MaapiFlag SKIP_SUBSCRIBERS;
```

This flag only takes effect when used in
 `Maapi#startTransFlags(int,int,int,EnumSet)` calls.

 It will disable subscribers for the given transaction, use with caution.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.maapi.MaapiFlag valueOf(String name)
```

Types: [MaapiFlag](MaapiFlag.md#cls-MaapiFlag)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.MaapiFlag[] values()
```

Types: [MaapiFlag](MaapiFlag.md#cls-MaapiFlag)
