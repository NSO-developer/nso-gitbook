# DiffIterateFlags <a href="#diffiterateflags-79473c9fdab6" id="diffiterateflags-79473c9fdab6"></a>

```java
public enum com.tailf.conf.DiffIterateFlags
```

Types: [DiffIterateFlags](DiffIterateFlags.md#diffiterateflags-79473c9fdab6)

Enumeration flags us by
 `CdbSubscription#diffIterate(
  int,CdbDiffIterate,EnumSet,Object)` to control the behavior of iterate
 over changes made in CDB data.

## Members

**Enum Constants**:

- [ITER\_WANT\_ANCESTOR\_DELETE](#iter_want_ancestor_delete-8aeb50c9a808)
- [ITER\_WANT\_ATTR](#iter_want_attr-946a41e3cb08)
- [ITER\_WANT\_CLI\_STR](#iter_want_cli_str-439533dcd1aa)
- [ITER\_WANT\_LEAF\_FIRST\_ORDER](#iter_want_leaf_first_order-1ef3029f141f)
- [ITER\_WANT\_LEAF\_LAST\_ORDER](#iter_want_leaf_last_order-90156295eb70)
- [ITER\_WANT\_PREV](#iter_want_prev-20404d5d1d20)
- [ITER\_WANT\_REVERSE](#iter_want_reverse-584e3ca20d2a)
- [ITER\_WANT\_SCHEMA\_ORDER](#iter_want_schema_order-81f758c281ea)
- [ITER\_WANT\_SUPPRESS\_CONF\_DEFAULTS](#iter_want_suppress_conf_defaults-deb131f01638)
- [ITER\_WANT\_SUPPRESS\_OPER\_DEFAULTS](#iter_want_suppress_oper_defaults-695be9e11ea4)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### ITER_WANT_ANCESTOR_DELETE <a href="#iter_want_ancestor_delete-8aeb50c9a808" id="iter_want_ancestor_delete-8aeb50c9a808"></a>

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_ANCESTOR_DELETE;
```

Control if the deleted of a ancestor will trigger a subscription
 iteration.

 The flag `ITER_WANT_ANCESTOR_DELETE` is passed to
 `diffIterate` method which specifies that a subscription should
 be triggered because an ancestor was deleted subscription will also
 generate a call to `iterate`, and in this case `kp`
 will be the path that was actually deleted.

 This option is not default in
 [`CdbSubscription#diffIterate(int, CdbDiffIterate)`](../cdb/CdbSubscription.md#diffiterate-89b9ae6f39bb)
 which means that the flag needs to be passed explicitly.

### ITER_WANT_ATTR <a href="#iter_want_attr-946a41e3cb08" id="iter_want_attr-946a41e3cb08"></a>

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_ATTR;
```

This is flag that only has meaning in the maapi case.
 If set, the iteration will also go over attribute values. In such cases
 the DiffIterateOperFlag will be set to
 [`DiffIterateOperFlag#MOP_ATTR_SET`](DiffIterateOperFlag.md#mop_attr_set-93d0727524e3) in the iterator and the new
 and old values will be of type [`ConfAttributeValue`](ConfAttributeValue.md#confattributevalue-d38e058ca48e)

### ITER_WANT_CLI_STR <a href="#iter_want_cli_str-439533dcd1aa" id="iter_want_cli_str-439533dcd1aa"></a>

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_CLI_STR;
```

### ITER_WANT_LEAF_FIRST_ORDER <a href="#iter_want_leaf_first_order-1ef3029f141f" id="iter_want_leaf_first_order-1ef3029f141f"></a>

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_LEAF_FIRST_ORDER;
```

### ITER_WANT_LEAF_LAST_ORDER <a href="#iter_want_leaf_last_order-90156295eb70" id="iter_want_leaf_last_order-90156295eb70"></a>

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_LEAF_LAST_ORDER;
```

### ITER_WANT_PREV <a href="#iter_want_prev-20404d5d1d20" id="iter_want_prev-20404d5d1d20"></a>

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_PREV;
```

Include the previous value for modification of a leaf/leaf-list
 value.

 If the flags is provided to
 `CdbSubscription#diffIterate(
  int ,CdbDiffIterate,EnumSet,Object)`
 The old value is supplied to the call to
 [`CdbDiffIterate#iterate(ConfObject[],
  DiffIterateOperFlag, ConfObject,ConfObject,Object)`](../cdb/CdbDiffIterate.md#iterate-d80a566b7e0a)
 if a value have changed.

 For operational data subscriptions, the `ITER_WANT_PREV` flag
 is ignored, and old value is always null - there is no equivalent
 to [`CdbDBType#CDB_PRE_COMMIT_RUNNING`](../cdb/CdbDBType.md#cdb_pre_commit_running-68ec740136a8) that holds
 "old" operational data method.

 This option is default in
 [`CdbSubscription#diffIterate(int, CdbDiffIterate)`](../cdb/CdbSubscription.md#diffiterate-89b9ae6f39bb)
 which means that the flag needs not to be passed explicitly.

### ITER_WANT_REVERSE <a href="#iter_want_reverse-584e3ca20d2a" id="iter_want_reverse-584e3ca20d2a"></a>

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_REVERSE;
```

### ITER_WANT_SCHEMA_ORDER <a href="#iter_want_schema_order-81f758c281ea" id="iter_want_schema_order-81f758c281ea"></a>

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_SCHEMA_ORDER;
```

### ITER_WANT_SUPPRESS_CONF_DEFAULTS <a href="#iter_want_suppress_conf_defaults-deb131f01638" id="iter_want_suppress_conf_defaults-deb131f01638"></a>

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_SUPPRESS_CONF_DEFAULTS;
```

### ITER_WANT_SUPPRESS_OPER_DEFAULTS <a href="#iter_want_suppress_oper_defaults-695be9e11ea4" id="iter_want_suppress_oper_defaults-695be9e11ea4"></a>

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_SUPPRESS_OPER_DEFAULTS;
```


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.conf.DiffIterateFlags valueOf(int i)
```

Types: [DiffIterateFlags](DiffIterateFlags.md#diffiterateflags-79473c9fdab6)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.conf.DiffIterateFlags valueOf(String name)
```

Types: [DiffIterateFlags](DiffIterateFlags.md#diffiterateflags-79473c9fdab6)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.conf.DiffIterateFlags[] values()
```

Types: [DiffIterateFlags](DiffIterateFlags.md#diffiterateflags-79473c9fdab6)
