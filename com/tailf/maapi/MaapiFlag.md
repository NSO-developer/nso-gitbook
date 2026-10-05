# MaapiFlag <a href="#maapiflag-6e6635db8a9f" id="maapiflag-6e6635db8a9f"></a>

```java
public enum com.tailf.maapi.MaapiFlag
```

Flags used by `Maapi#setFlags(int,EnumSet)` method to control
 read/write sessions.

## Members

**Enum Constants**:

- [CONFIG\_ONLY](#config_only-c29f84f4db03)
- [DELAYED\_WHEN](#delayed_when-6f2d6f397786)
- [HIDE\_ALL\_HIDEGROUPS](#hide_all_hidegroups-27fac18f1f9d)
- [HIDE\_INACTIVE](#hide_inactive-c1ab6b970578)
- [HINT\_BULK](#hint_bulk-2513a5e315c2)
- [NO\_DEFAULTS](#no_defaults-60bc0f0feb09)
- [SKIP\_SUBSCRIBERS](#skip_subscribers-b6bf396f1398)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CONFIG_ONLY <a href="#config_only-c29f84f4db03" id="config_only-c29f84f4db03"></a>

```java
public static final com.tailf.maapi.MaapiFlag CONFIG_ONLY;
```

This flag will make the `Maapi.getXxx()` method return
 config nodes only.

 if we attempt to read operational data, it will be treated as if the
 nodes did not exist. This is mainly useful in conjunction with
 [`Maapi#getObject(int,String,Object...)`](Maapi.md#getobject-8f535bb4e0e8) and list entries or
 containers that have both config
 and operational data (the operational data nodes in the returned array
 will be of class [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9) (type J_NOEXISTS),
 but the other functions also obey the flag.

### DELAYED_WHEN <a href="#delayed_when-6f2d6f397786" id="delayed_when-6f2d6f397786"></a>

```java
public static final com.tailf.maapi.MaapiFlag DELAYED_WHEN;
```

This flag only takes effect when used in
 `Maapi#startTransFlags(int,int,int,EnumSet)` calls
 and is only meaningful when applied to an read-write transaction.

 It will cause "delayed when" mode to be enabled from the beginning of
 the transaction.
 See [`Maapi#setDelayedWhen(int, boolean)`](Maapi.md#setdelayedwhen-38f32854fd19) for
 more information about the "delayed when" mode

### HIDE_ALL_HIDEGROUPS <a href="#hide_all_hidegroups-27fac18f1f9d" id="hide_all_hidegroups-27fac18f1f9d"></a>

```java
public static final com.tailf.maapi.MaapiFlag HIDE_ALL_HIDEGROUPS;
```

This flag only takes effect when used in
 `Maapi#startTransFlags(int,int,int,EnumSet)` calls.

 It will hide all nodes with `tailf:hidden` statement from the
 dry-run result.
 See [`Maapi#applyTransParams(int, boolean, CommitParams)`](Maapi.md#applytransparams-6c20b7896663) for more
 information about the dry-run.

### HIDE_INACTIVE <a href="#hide_inactive-c1ab6b970578" id="hide_inactive-c1ab6b970578"></a>

```java
public static final com.tailf.maapi.MaapiFlag HIDE_INACTIVE;
```

This flag only takes effect when used in
 `Maapi#startTransFlags(int,int,int,EnumSet)` calls
 and only when starting a read-only transaction.

 It will hide configuration data that has the
 [`ConfAttributeType#INACTIVE`](../conf/ConfAttributeType.md#inactive-e05983904557) attribute set, i.e.
 it will appear as if that data does not exist.

### HINT_BULK <a href="#hint_bulk-2513a5e315c2" id="hint_bulk-2513a5e315c2"></a>

```java
public static final com.tailf.maapi.MaapiFlag HINT_BULK;
```

This flag tells the server that we will be reading substantial amounts
 of data.

 The affect of setting this has the effect that the
 [`DpDataCallback#getObject( DpTrans,ConfObject[])`](../dp/DpDataCallback.md#getobject-b2d87f9b9270) and
 [`DpDataCallback#iterator(DpTrans,ConfObject[])`](../dp/DpDataCallback.md#iterator-89c62926f3e8),
 [`DpDataCallback#getIteratorKey(
  DpTrans,ConfObject[],Object)`](../dp/DpDataCallback.md#getiteratorkey-6df7c38f65f8)
 callbacks (if available) are used towards external data providers
 when we call [`Maapi#getElem(int,String,Object...)`](Maapi.md#getelem-1415a215bb24) etc and
 [`Maapi#getNext(MaapiCursor)`](Maapi.md#getnext-94186d85d070).

 The [`Maapi#getObject(int,String,Object...)`](Maapi.md#getobject-8f535bb4e0e8)
 method always operates as if this flag was set.

### NO_DEFAULTS <a href="#no_defaults-60bc0f0feb09" id="no_defaults-60bc0f0feb09"></a>

```java
public static final com.tailf.maapi.MaapiFlag NO_DEFAULTS;
```

This flag specifies that we want to be informed when we read leafs with
 default values that have not had a value set.

 This is indicated by the returned value being of class
 [`ConfDefault`](../conf/ConfDefault.md#confdefault-2e2c2aa1733d) (type J_DEFAULT) instead of the
 actual value. The default value for such leafs can be obtained from the
 [`Maapi#loadSchemas()`](Maapi.md#loadschemas-84ad3496a6f3) tree provided by the library.

### SKIP_SUBSCRIBERS <a href="#skip_subscribers-b6bf396f1398" id="skip_subscribers-b6bf396f1398"></a>

```java
public static final com.tailf.maapi.MaapiFlag SKIP_SUBSCRIBERS;
```

This flag only takes effect when used in
 `Maapi#startTransFlags(int,int,int,EnumSet)` calls.

 It will disable subscribers for the given transaction, use with caution.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.maapi.MaapiFlag valueOf(String name)
```

Types: [MaapiFlag](MaapiFlag.md#maapiflag-6e6635db8a9f)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.MaapiFlag[] values()
```

Types: [MaapiFlag](MaapiFlag.md#maapiflag-6e6635db8a9f)
