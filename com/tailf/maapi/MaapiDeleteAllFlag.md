<a id="s-MaapiDeleteAllFlag"></a>
# MaapiDeleteAllFlag

```java
public enum com.tailf.maapi.MaapiDeleteAllFlag
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#s-MaapiDeleteAllFlag)

Flags for use in:
   [`Maapi`](Maapi.md#s-Maapi)

**Related classes**

- [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#s-MaapiDeleteAllFlag)

## Members

**Enum Constants**:

- [DEL_ALL](#s-DEL_ALL)
- [DEL_EXPORTED](#s-DEL_EXPORTED)
- [DEL_SAFE](#s-DEL_SAFE)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-DEL_ALL"></a>
### DEL_ALL

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_ALL;
```

Delete everything. AAA rules are ignored.

<a id="s-DEL_EXPORTED"></a>
### DEL_EXPORTED

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_EXPORTED;
```

Delete everything except namespaces that were exported to none
   (with tailf:export none). AAA rules are ignored, i.e. nodes are
   deleted even if the AAA rules don't allow it.

<a id="s-DEL_SAFE"></a>
### DEL_SAFE

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_SAFE;
```

Delete everything except namespaces that were exported to none
   (with tailf:export none). Toplevel nodes that cannot be deleted due
   to AAA rules are silently left in place, but descendant nodes will
   still be deleted if the AAA rules allow it.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.maapi.MaapiDeleteAllFlag valueOf(int i)
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#s-MaapiDeleteAllFlag)

**Parameters**

- `int i`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.maapi.MaapiDeleteAllFlag valueOf(String name)
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#s-MaapiDeleteAllFlag)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.maapi.MaapiDeleteAllFlag[] values()
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#s-MaapiDeleteAllFlag)
