<a id="s-MaapiFlag"></a>
# MaapiFlag

```java
public enum com.tailf.maapi.MaapiFlag
```

Types: [MaapiFlag](MaapiFlag.md#s-MaapiFlag)

Flags used by [`Maapi`](Maapi.md#s-Maapi) method to control
 read/write sessions.

**Related classes**

- [MaapiFlag](MaapiFlag.md#s-MaapiFlag)

## Members

**Enum Constants**:

- [CONFIG_ONLY](#s-CONFIG_ONLY)
- [DELAYED_WHEN](#s-DELAYED_WHEN)
- [HIDE_ALL_HIDEGROUPS](#s-HIDE_ALL_HIDEGROUPS)
- [HIDE_INACTIVE](#s-HIDE_INACTIVE)
- [HINT_BULK](#s-HINT_BULK)
- [NO_DEFAULTS](#s-NO_DEFAULTS)
- [SKIP_SUBSCRIBERS](#s-SKIP_SUBSCRIBERS)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-CONFIG_ONLY"></a>
### CONFIG_ONLY

```java
public static final com.tailf.maapi.MaapiFlag CONFIG_ONLY;
```

This flag will make the `Maapi.getXxx()` method return
 config nodes only.

 if we attempt to read operational data, it will be treated as if the
 nodes did not exist. This is mainly useful in conjunction with
 [`Maapi`](Maapi.md#s-Maapi) and list entries or
 containers that have both config
 and operational data (the operational data nodes in the returned array
 will be of class [`ConfNoExists`](../conf/ConfNoExists.md#s-ConfNoExists) (type J_NOEXISTS),
 but the other functions also obey the flag.

<a id="s-DELAYED_WHEN"></a>
### DELAYED_WHEN

```java
public static final com.tailf.maapi.MaapiFlag DELAYED_WHEN;
```

This flag only takes effect when used in
 [`Maapi`](Maapi.md#s-Maapi) calls
 and is only meaningful when applied to an read-write transaction.

 It will cause "delayed when" mode to be enabled from the beginning of
 the transaction.
 See [`Maapi`](Maapi.md#s-Maapi) for
 more information about the "delayed when" mode

<a id="s-HIDE_ALL_HIDEGROUPS"></a>
### HIDE_ALL_HIDEGROUPS

```java
public static final com.tailf.maapi.MaapiFlag HIDE_ALL_HIDEGROUPS;
```

This flag only takes effect when used in
 [`Maapi`](Maapi.md#s-Maapi) calls.

 It will hide all nodes with `tailf:hidden` statement from the
 dry-run result.
 See [`Maapi`](Maapi.md#s-Maapi) for more
 information about the dry-run.

<a id="s-HIDE_INACTIVE"></a>
### HIDE_INACTIVE

```java
public static final com.tailf.maapi.MaapiFlag HIDE_INACTIVE;
```

This flag only takes effect when used in
 [`Maapi`](Maapi.md#s-Maapi) calls
 and only when starting a read-only transaction.

 It will hide configuration data that has the
 [`ConfAttributeType`](../conf/ConfAttributeType.md#s-ConfAttributeType) attribute set, i.e.
 it will appear as if that data does not exist.

<a id="s-HINT_BULK"></a>
### HINT_BULK

```java
public static final com.tailf.maapi.MaapiFlag HINT_BULK;
```

This flag tells the server that we will be reading substantial amounts
 of data.

 The affect of setting this has the effect that the
 [`DpDataCallback`](../dp/DpDataCallback.md#s-DpDataCallback) and
 [`DpDataCallback`](../dp/DpDataCallback.md#s-DpDataCallback),
 [`DpDataCallback`](../dp/DpDataCallback.md#s-DpDataCallback)
 callbacks (if available) are used towards external data providers
 when we call [`Maapi`](Maapi.md#s-Maapi) etc and
 [`Maapi`](Maapi.md#s-Maapi).

 The [`Maapi`](Maapi.md#s-Maapi)
 method always operates as if this flag was set.

<a id="s-NO_DEFAULTS"></a>
### NO_DEFAULTS

```java
public static final com.tailf.maapi.MaapiFlag NO_DEFAULTS;
```

This flag specifies that we want to be informed when we read leafs with
 default values that have not had a value set.

 This is indicated by the returned value being of class
 [`ConfDefault`](../conf/ConfDefault.md#s-ConfDefault) (type J_DEFAULT) instead of the
 actual value. The default value for such leafs can be obtained from the
 [`Maapi`](Maapi.md#s-Maapi) tree provided by the library.

<a id="s-SKIP_SUBSCRIBERS"></a>
### SKIP_SUBSCRIBERS

```java
public static final com.tailf.maapi.MaapiFlag SKIP_SUBSCRIBERS;
```

This flag only takes effect when used in
 [`Maapi`](Maapi.md#s-Maapi) calls.

 It will disable subscribers for the given transaction, use with caution.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.maapi.MaapiFlag valueOf(String name)
```

Types: [MaapiFlag](MaapiFlag.md#s-MaapiFlag)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.maapi.MaapiFlag[] values()
```

Types: [MaapiFlag](MaapiFlag.md#s-MaapiFlag)
