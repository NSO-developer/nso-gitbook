<a id="s-DiffIterateOperFlag"></a>
# DiffIterateOperFlag

```java
public enum com.tailf.conf.DiffIterateOperFlag
```

Types: [DiffIterateOperFlag](DiffIterateOperFlag.md#s-DiffIterateOperFlag)

The modification flags supplied by the library to
 [`CdbDiffIterate`](../cdb/CdbDiffIterate.md#s-CdbDiffIterate),
 [`MaapiDiffIterate`](../maapi/MaapiDiffIterate.md#s-MaapiDiffIterate) user implementation of the
 [`CdbDiffIterate`](../cdb/CdbDiffIterate.md#s-CdbDiffIterate) and
 [`MaapiDiffIterate`](../maapi/MaapiDiffIterate.md#s-MaapiDiffIterate).

 The current modification applies to the supplied path
 `ConfObject[]`.

**Related classes**

- [DiffIterateOperFlag](DiffIterateOperFlag.md#s-DiffIterateOperFlag)

## Members

**Enum Constants**:

- [MOP_ATTR_SET](#s-MOP_ATTR_SET)
- [MOP_CREATED](#s-MOP_CREATED)
- [MOP_DELETED](#s-MOP_DELETED)
- [MOP_MODIFIED](#s-MOP_MODIFIED)
- [MOP_MOVED_AFTER](#s-MOP_MOVED_AFTER)
- [MOP_VALUE_SET](#s-MOP_VALUE_SET)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-MOP_ATTR_SET"></a>
### MOP_ATTR_SET

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_ATTR_SET;
```

MaapiDiffIterate only

<a id="s-MOP_CREATED"></a>
### MOP_CREATED

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_CREATED;
```

Specifies that list entry, presence container, or leaf of type empty
 given has been created.

<a id="s-MOP_DELETED"></a>
### MOP_DELETED

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_DELETED;
```

The list entry, presence container, or optional leaf has been deleted.

  If the subscription was triggered because an ancestor was deleted,
  the `iterate` method will not called at all if the delete
  was above the subscription point. However if the flag
  [`DiffIterateFlags`](DiffIterateFlags.md#s-DiffIterateFlags) is passed to
  [`CdbSubscription`](../cdb/CdbSubscription.md#s-CdbSubscription)
  then deletes that trigger a descendant subscription will also
  generate a call to `iterate`.

<a id="s-MOP_MODIFIED"></a>
### MOP_MODIFIED

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_MODIFIED;
```

A descendant of the list entry has been modified.

<a id="s-MOP_MOVED_AFTER"></a>
### MOP_MOVED_AFTER

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

<a id="s-MOP_VALUE_SET"></a>
### MOP_VALUE_SET

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_VALUE_SET;
```

The value of the leaf given by the path has been set to a new value.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.conf.DiffIterateOperFlag valueOf(int i)
```

Types: [DiffIterateOperFlag](DiffIterateOperFlag.md#s-DiffIterateOperFlag)

**Parameters**

- `int i`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.conf.DiffIterateOperFlag valueOf(String name)
```

Types: [DiffIterateOperFlag](DiffIterateOperFlag.md#s-DiffIterateOperFlag)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.conf.DiffIterateOperFlag[] values()
```

Types: [DiffIterateOperFlag](DiffIterateOperFlag.md#s-DiffIterateOperFlag)
