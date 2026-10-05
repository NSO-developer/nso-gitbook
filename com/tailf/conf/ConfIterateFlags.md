<a id="s-ConfIterateFlags"></a>
# ConfIterateFlags

```java
public enum com.tailf.conf.ConfIterateFlags
```

Types: [ConfIterateFlags](ConfIterateFlags.md#s-ConfIterateFlags)

Enumeration flags us by
 [`CdbSubscription`](../cdb/CdbSubscription.md#s-CdbSubscription) to
 control the behavior of iterate over changes made in CDB data.

**Related classes**

- [ConfIterateFlags](ConfIterateFlags.md#s-ConfIterateFlags)

## Members

**Enum Constants**:

- [ITER_WANT_ANCESTOR_DELETE](#s-ITER_WANT_ANCESTOR_DELETE)
- [ITER_WANT_ATTR](#s-ITER_WANT_ATTR)
- [ITER_WANT_CLI_STR](#s-ITER_WANT_CLI_STR)
- [ITER_WANT_LEAF_FIRST_ORDER](#s-ITER_WANT_LEAF_FIRST_ORDER)
- [ITER_WANT_LEAF_LAST_ORDER](#s-ITER_WANT_LEAF_LAST_ORDER)
- [ITER_WANT_PREV](#s-ITER_WANT_PREV)
- [ITER_WANT_REVERSE](#s-ITER_WANT_REVERSE)
- [ITER_WANT_SCHEMA_ORDER](#s-ITER_WANT_SCHEMA_ORDER)
- [ITER_WANT_SUPPRESS_CONF_DEFAULTS](#s-ITER_WANT_SUPPRESS_CONF_DEFAULTS)
- [ITER_WANT_SUPPRESS_OPER_DEFAULTS](#s-ITER_WANT_SUPPRESS_OPER_DEFAULTS)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-ITER_WANT_ANCESTOR_DELETE"></a>
### ITER_WANT_ANCESTOR_DELETE

```java
public static final com.tailf.conf.ConfIterateFlags ITER_WANT_ANCESTOR_DELETE;
```

Control if the deleted of a ancestor will trigger a subscription
 iteration.

 The flag `ITER_WANT_ANCESTOR_DELETE` is passed to
 `diffIterate` method which specifies that a subscription should
 be triggered because an ancestor was deleted subscription will also
 generate a call to `iterate`, and in this case `kp`
 will be the path that was actually deleted.

 This option is not default in
 [`CdbSubscription`](../cdb/CdbSubscription.md#s-CdbSubscription)
 which means that the flag needs to be passed explicitly.

<a id="s-ITER_WANT_ATTR"></a>
### ITER_WANT_ATTR

```java
public static final com.tailf.conf.ConfIterateFlags ITER_WANT_ATTR;
```

This is flag that only has meaning in the maapi case.
 If set, the iteration will also go over attribute values. In such cases
 the DiffIterateOperFlag will be set to
 [`DiffIterateOperFlag`](DiffIterateOperFlag.md#s-DiffIterateOperFlag) in the iterator and the new
 and old values will be of type [`ConfAttributeValue`](ConfAttributeValue.md#s-ConfAttributeValue)

<a id="s-ITER_WANT_CLI_STR"></a>
### ITER_WANT_CLI_STR

```java
public static final com.tailf.conf.ConfIterateFlags ITER_WANT_CLI_STR;
```

<a id="s-ITER_WANT_LEAF_FIRST_ORDER"></a>
### ITER_WANT_LEAF_FIRST_ORDER

```java
public static final com.tailf.conf.ConfIterateFlags ITER_WANT_LEAF_FIRST_ORDER;
```

<a id="s-ITER_WANT_LEAF_LAST_ORDER"></a>
### ITER_WANT_LEAF_LAST_ORDER

```java
public static final com.tailf.conf.ConfIterateFlags ITER_WANT_LEAF_LAST_ORDER;
```

<a id="s-ITER_WANT_PREV"></a>
### ITER_WANT_PREV

```java
public static final com.tailf.conf.ConfIterateFlags ITER_WANT_PREV;
```

Include the previous value for modification of a leaf/leaf-list
 value.

 If the flags is provided to
 [`CdbSubscription`](../cdb/CdbSubscription.md#s-CdbSubscription)
 The old value is supplied to the call to
 [`CdbDiffIterate`](../cdb/CdbDiffIterate.md#s-CdbDiffIterate)
 if a value have changed.

 For operational data subscriptions, the `ITER_WANT_PREV` flag
 is ignored, and old value is always null - there is no equivalent
 to [`CdbDBType`](../cdb/CdbDBType.md#s-CdbDBType) that holds
 "old" operational data method.

 This option is default in
 [`CdbSubscription`](../cdb/CdbSubscription.md#s-CdbSubscription)
 which means that the flag needs not to be passed explicitly.

<a id="s-ITER_WANT_REVERSE"></a>
### ITER_WANT_REVERSE

```java
public static final com.tailf.conf.ConfIterateFlags ITER_WANT_REVERSE;
```

<a id="s-ITER_WANT_SCHEMA_ORDER"></a>
### ITER_WANT_SCHEMA_ORDER

```java
public static final com.tailf.conf.ConfIterateFlags ITER_WANT_SCHEMA_ORDER;
```

<a id="s-ITER_WANT_SUPPRESS_CONF_DEFAULTS"></a>
### ITER_WANT_SUPPRESS_CONF_DEFAULTS

```java
public static final com.tailf.conf.ConfIterateFlags ITER_WANT_SUPPRESS_CONF_DEFAULTS;
```

<a id="s-ITER_WANT_SUPPRESS_OPER_DEFAULTS"></a>
### ITER_WANT_SUPPRESS_OPER_DEFAULTS

```java
public static final com.tailf.conf.ConfIterateFlags ITER_WANT_SUPPRESS_OPER_DEFAULTS;
```


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.conf.ConfIterateFlags valueOf(int i)
```

Types: [ConfIterateFlags](ConfIterateFlags.md#s-ConfIterateFlags)

**Parameters**

- `int i`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.conf.ConfIterateFlags valueOf(String name)
```

Types: [ConfIterateFlags](ConfIterateFlags.md#s-ConfIterateFlags)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.conf.ConfIterateFlags[] values()
```

Types: [ConfIterateFlags](ConfIterateFlags.md#s-ConfIterateFlags)
