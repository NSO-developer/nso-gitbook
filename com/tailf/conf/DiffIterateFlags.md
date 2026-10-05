<a id="cls-DiffIterateFlags"></a>
# DiffIterateFlags

```java
public enum com.tailf.conf.DiffIterateFlags
```

Types: [DiffIterateFlags](DiffIterateFlags.md#cls-DiffIterateFlags)

Enumeration flags us by
 `CdbSubscription#diffIterate(
  int,CdbDiffIterate,EnumSet,Object)` to control the behavior of iterate
 over changes made in CDB data.

## Members

**Enum Constants**:

- [ITER_WANT_ANCESTOR_DELETE](#m-ITER_WANT_ANCESTOR_DELETE)
- [ITER_WANT_ATTR](#m-ITER_WANT_ATTR)
- [ITER_WANT_CLI_STR](#m-ITER_WANT_CLI_STR)
- [ITER_WANT_LEAF_FIRST_ORDER](#m-ITER_WANT_LEAF_FIRST_ORDER)
- [ITER_WANT_LEAF_LAST_ORDER](#m-ITER_WANT_LEAF_LAST_ORDER)
- [ITER_WANT_PREV](#m-ITER_WANT_PREV)
- [ITER_WANT_REVERSE](#m-ITER_WANT_REVERSE)
- [ITER_WANT_SCHEMA_ORDER](#m-ITER_WANT_SCHEMA_ORDER)
- [ITER_WANT_SUPPRESS_CONF_DEFAULTS](#m-ITER_WANT_SUPPRESS_CONF_DEFAULTS)
- [ITER_WANT_SUPPRESS_OPER_DEFAULTS](#m-ITER_WANT_SUPPRESS_OPER_DEFAULTS)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-ITER_WANT_ANCESTOR_DELETE"></a>
### ITER_WANT_ANCESTOR_DELETE

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
 [`CdbSubscription#diffIterate(int, CdbDiffIterate)`](../cdb/CdbSubscription.md#m-diffiterate-89b9ae6f39bb)
 which means that the flag needs to be passed explicitly.

<a id="m-ITER_WANT_ATTR"></a>
### ITER_WANT_ATTR

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_ATTR;
```

This is flag that only has meaning in the maapi case.
 If set, the iteration will also go over attribute values. In such cases
 the DiffIterateOperFlag will be set to
 [`DiffIterateOperFlag#MOP_ATTR_SET`](DiffIterateOperFlag.md#m-MOP_ATTR_SET) in the iterator and the new
 and old values will be of type [`ConfAttributeValue`](ConfAttributeValue.md#cls-ConfAttributeValue)

<a id="m-ITER_WANT_CLI_STR"></a>
### ITER_WANT_CLI_STR

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_CLI_STR;
```

<a id="m-ITER_WANT_LEAF_FIRST_ORDER"></a>
### ITER_WANT_LEAF_FIRST_ORDER

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_LEAF_FIRST_ORDER;
```

<a id="m-ITER_WANT_LEAF_LAST_ORDER"></a>
### ITER_WANT_LEAF_LAST_ORDER

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_LEAF_LAST_ORDER;
```

<a id="m-ITER_WANT_PREV"></a>
### ITER_WANT_PREV

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
  DiffIterateOperFlag, ConfObject,ConfObject,Object)`](../cdb/CdbDiffIterate.md#m-iterate-d80a566b7e0a)
 if a value have changed.

 For operational data subscriptions, the `ITER_WANT_PREV` flag
 is ignored, and old value is always null - there is no equivalent
 to [`CdbDBType#CDB_PRE_COMMIT_RUNNING`](../cdb/CdbDBType.md#m-CDB_PRE_COMMIT_RUNNING) that holds
 "old" operational data method.

 This option is default in
 [`CdbSubscription#diffIterate(int, CdbDiffIterate)`](../cdb/CdbSubscription.md#m-diffiterate-89b9ae6f39bb)
 which means that the flag needs not to be passed explicitly.

<a id="m-ITER_WANT_REVERSE"></a>
### ITER_WANT_REVERSE

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_REVERSE;
```

<a id="m-ITER_WANT_SCHEMA_ORDER"></a>
### ITER_WANT_SCHEMA_ORDER

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_SCHEMA_ORDER;
```

<a id="m-ITER_WANT_SUPPRESS_CONF_DEFAULTS"></a>
### ITER_WANT_SUPPRESS_CONF_DEFAULTS

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_SUPPRESS_CONF_DEFAULTS;
```

<a id="m-ITER_WANT_SUPPRESS_OPER_DEFAULTS"></a>
### ITER_WANT_SUPPRESS_OPER_DEFAULTS

```java
public static final com.tailf.conf.DiffIterateFlags ITER_WANT_SUPPRESS_OPER_DEFAULTS;
```


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.conf.DiffIterateFlags valueOf(int i)
```

Types: [DiffIterateFlags](DiffIterateFlags.md#cls-DiffIterateFlags)

**Parameters**

- `int i`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.conf.DiffIterateFlags valueOf(String name)
```

Types: [DiffIterateFlags](DiffIterateFlags.md#cls-DiffIterateFlags)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.conf.DiffIterateFlags[] values()
```

Types: [DiffIterateFlags](DiffIterateFlags.md#cls-DiffIterateFlags)
