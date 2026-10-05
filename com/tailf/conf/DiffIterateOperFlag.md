# DiffIterateOperFlag <a href="#diffiterateoperflag-d1cd8560c2ec" id="diffiterateoperflag-d1cd8560c2ec"></a>

```java
public enum com.tailf.conf.DiffIterateOperFlag
```

The modification flags supplied by the library to
 [`CdbDiffIterate`](../cdb/CdbDiffIterate.md#cdbdiffiterate-ab6fafeeb31e),
 [`MaapiDiffIterate`](../maapi/MaapiDiffIterate.md#maapidiffiterate-199d02e1da37) user implementation of the
 [`CdbDiffIterate#iterate(com.tailf.conf.ConfObject[],
 DiffIterateOperFlag,com.tailf.conf.ConfObject,com.tailf.conf.ConfObject,
 Object)`](../cdb/CdbDiffIterate.md#iterate-d80a566b7e0a) and
 [`MaapiDiffIterate#iterate(com.tailf.conf.ConfObject[],
 DiffIterateOperFlag,com.tailf.conf.ConfObject,
 com.tailf.conf.ConfObject,Object)`](../maapi/MaapiDiffIterate.md#iterate-d80a566b7e0a).

 The current modification applies to the supplied path
 `ConfObject[]`.

## Members

**Enum Constants**:

- [MOP\_ATTR\_SET](#mop_attr_set-93d0727524e3)
- [MOP\_CREATED](#mop_created-1b4baba0a9b5)
- [MOP\_DELETED](#mop_deleted-bfb313272589)
- [MOP\_MODIFIED](#mop_modified-04604a9e1f38)
- [MOP\_MOVED\_AFTER](#mop_moved_after-a0be8ecb4c10)
- [MOP\_VALUE\_SET](#mop_value_set-785b954bac72)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### MOP_ATTR_SET <a href="#mop_attr_set-93d0727524e3" id="mop_attr_set-93d0727524e3"></a>

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_ATTR_SET;
```

MaapiDiffIterate only

### MOP_CREATED <a href="#mop_created-1b4baba0a9b5" id="mop_created-1b4baba0a9b5"></a>

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_CREATED;
```

Specifies that list entry, presence container, or leaf of type empty
 given has been created.

### MOP_DELETED <a href="#mop_deleted-bfb313272589" id="mop_deleted-bfb313272589"></a>

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_DELETED;
```

The list entry, presence container, or optional leaf has been deleted.

  If the subscription was triggered because an ancestor was deleted,
  the `iterate` method will not called at all if the delete
  was above the subscription point. However if the flag
  [`DiffIterateFlags#ITER_WANT_ANCESTOR_DELETE`](DiffIterateFlags.md#iter_want_ancestor_delete-8aeb50c9a808) is passed to
  `CdbSubscription#diffIterate(
  int,CdbDiffIterate,EnumSet,Object)`
  then deletes that trigger a descendant subscription will also
  generate a call to `iterate`.

### MOP_MODIFIED <a href="#mop_modified-04604a9e1f38" id="mop_modified-04604a9e1f38"></a>

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_MODIFIED;
```

A descendant of the list entry has been modified.

### MOP_MOVED_AFTER <a href="#mop_moved_after-a0be8ecb4c10" id="mop_moved_after-a0be8ecb4c10"></a>

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

### MOP_VALUE_SET <a href="#mop_value_set-785b954bac72" id="mop_value_set-785b954bac72"></a>

```java
public static final com.tailf.conf.DiffIterateOperFlag MOP_VALUE_SET;
```

The value of the leaf given by the path has been set to a new value.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.conf.DiffIterateOperFlag valueOf(int i)
```

Types: [DiffIterateOperFlag](DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.conf.DiffIterateOperFlag valueOf(String name)
```

Types: [DiffIterateOperFlag](DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.conf.DiffIterateOperFlag[] values()
```

Types: [DiffIterateOperFlag](DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)
