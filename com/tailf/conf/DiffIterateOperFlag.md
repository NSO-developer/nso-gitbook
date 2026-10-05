# DiffIterateOperFlag <a href="#cls-DiffIterateOperFlag" id="cls-DiffIterateOperFlag"></a>

```java
public enum com.tailf.conf.DiffIterateOperFlag
```

Types: [DiffIterateOperFlag](DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

The modification flags supplied by the library to
 [`CdbDiffIterate`](../cdb/CdbDiffIterate.md#cls-CdbDiffIterate),
 [`MaapiDiffIterate`](../maapi/MaapiDiffIterate.md#cls-MaapiDiffIterate) user implementation of the
 [`CdbDiffIterate#iterate(com.tailf.conf.ConfObject[],
 DiffIterateOperFlag,com.tailf.conf.ConfObject,com.tailf.conf.ConfObject,
 Object)`](../cdb/CdbDiffIterate.md#m-iterate-d80a566b7e0a) and
 [`MaapiDiffIterate#iterate(com.tailf.conf.ConfObject[],
 DiffIterateOperFlag,com.tailf.conf.ConfObject,
 com.tailf.conf.ConfObject,Object)`](../maapi/MaapiDiffIterate.md#m-iterate-d80a566b7e0a).

 The current modification applies to the supplied path
 `ConfObject[]`.

## Members

**Enum Constants**:

- [MOP_ATTR_SET](#m-MOP_ATTR_SET)
- [MOP_CREATED](#m-MOP_CREATED)
- [MOP_DELETED](#m-MOP_DELETED)
- [MOP_MODIFIED](#m-MOP_MODIFIED)
- [MOP_MOVED_AFTER](#m-MOP_MOVED_AFTER)
- [MOP_VALUE_SET](#m-MOP_VALUE_SET)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### MOP_ATTR_SET <a href="#m-MOP_ATTR_SET" id="m-MOP_ATTR_SET"></a>

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_ATTR_SET;
```

MaapiDiffIterate only

### MOP_CREATED <a href="#m-MOP_CREATED" id="m-MOP_CREATED"></a>

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_CREATED;
```

Specifies that list entry, presence container, or leaf of type empty
 given has been created.

### MOP_DELETED <a href="#m-MOP_DELETED" id="m-MOP_DELETED"></a>

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_DELETED;
```

The list entry, presence container, or optional leaf has been deleted.

  If the subscription was triggered because an ancestor was deleted,
  the `iterate` method will not called at all if the delete
  was above the subscription point. However if the flag
  [`DiffIterateFlags#ITER_WANT_ANCESTOR_DELETE`](DiffIterateFlags.md#m-ITER_WANT_ANCESTOR_DELETE) is passed to
  `CdbSubscription#diffIterate(
  int,CdbDiffIterate,EnumSet,Object)`
  then deletes that trigger a descendant subscription will also
  generate a call to `iterate`.

### MOP_MODIFIED <a href="#m-MOP_MODIFIED" id="m-MOP_MODIFIED"></a>

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_MODIFIED;
```

A descendant of the list entry has been modified.

### MOP_MOVED_AFTER <a href="#m-MOP_MOVED_AFTER" id="m-MOP_MOVED_AFTER"></a>

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_MOVED_AFTER;
```

The list entry given by path, in an ordered-by user list,
  has been moved. If the new value is null, the entry has been moved
  first in the list, otherwise it has been
   moved after the entry given by new value. In this case new is
  a pointer to an array of key values identifying an entry in the list.
 The array is terminated with
   an element that has type C_NOEXISTS.

### MOP_VALUE_SET <a href="#m-MOP_VALUE_SET" id="m-MOP_VALUE_SET"></a>

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_VALUE_SET;
```

The value of the leaf given by the path has been set to a new value.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.conf.DiffIterateOperFlag valueOf(int i)
```

Types: [DiffIterateOperFlag](DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Parameters**

- `int i`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.conf.DiffIterateOperFlag valueOf(String name)
```

Types: [DiffIterateOperFlag](DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.conf.DiffIterateOperFlag[] values()
```

Types: [DiffIterateOperFlag](DiffIterateOperFlag.md#cls-DiffIterateOperFlag)
