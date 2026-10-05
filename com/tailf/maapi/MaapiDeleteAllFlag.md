<a id="cls-MaapiDeleteAllFlag"></a>
# MaapiDeleteAllFlag

```java
public enum com.tailf.maapi.MaapiDeleteAllFlag
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#cls-MaapiDeleteAllFlag)

Flags for use in:
   [`Maapi#deleteAll(int, MaapiDeleteAllFlag)`](Maapi.md#m-deleteall-b0d5e11220fb)

## Members

**Enum Constants**:

- [DEL_ALL](#m-DEL_ALL)
- [DEL_EXPORTED](#m-DEL_EXPORTED)
- [DEL_SAFE](#m-DEL_SAFE)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-DEL_ALL"></a>
### DEL_ALL

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_ALL;
```

Delete everything. AAA rules are ignored.

<a id="m-DEL_EXPORTED"></a>
### DEL_EXPORTED

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_EXPORTED;
```

Delete everything except namespaces that were exported to none
   (with tailf:export none). AAA rules are ignored, i.e. nodes are
   deleted even if the AAA rules don't allow it.

<a id="m-DEL_SAFE"></a>
### DEL_SAFE

```java
public static final com.tailf.maapi.MaapiDeleteAllFlag DEL_SAFE;
```

Delete everything except namespaces that were exported to none
   (with tailf:export none). Toplevel nodes that cannot be deleted due
   to AAA rules are silently left in place, but descendant nodes will
   still be deleted if the AAA rules allow it.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.maapi.MaapiDeleteAllFlag valueOf(int i)
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#cls-MaapiDeleteAllFlag)

**Parameters**

- `int i`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.maapi.MaapiDeleteAllFlag valueOf(String name)
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#cls-MaapiDeleteAllFlag)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.maapi.MaapiDeleteAllFlag[] values()
```

Types: [MaapiDeleteAllFlag](MaapiDeleteAllFlag.md#cls-MaapiDeleteAllFlag)
