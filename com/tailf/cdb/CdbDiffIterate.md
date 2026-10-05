<a id="s-CdbDiffIterate"></a>
# CdbDiffIterate

```java
public interface com.tailf.cdb.CdbDiffIterate
    extends com.tailf.conf.ConfIterate
```

Types: [ConfIterate](../conf/ConfIterate.md#s-ConfIterate)

The `CdbDiffIterate` interface should be implemented
 by any class whose instances are intended to process or iterate
 through a set of changes.

 A particular instance of the implemented class
 should be provided to call to
 [`CdbSubscription`](CdbSubscription.md#s-CdbSubscription).

 The `iterate` method will be called  for each element
 that has been modified and matches the subscription.

 The `iterate` callback receives the
 [`ConfObject`](../conf/ConfObject.md#s-ConfObject) array `kp` which uniquely identifies which
 node in the data tree that is affected, the operation, and optionally the
 values it has before and after the
 transaction. The `op` parameter gives the modification as:



- [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)
   The list entry, presence container, or leaf of type empty given by
    `kp` has been created.
- [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)
    The list entry, presence container, or optional leaf given by
    `kp` has been deleted.

     If the subscription was triggered because an ancestor was deleted,
    the `iterate` method will not called at all if the delete
    was above the subscription point.
    However if the flag
    [`DiffIterateFlags`](../conf/DiffIterateFlags.md#s-DiffIterateFlags)
    is passed to `diffIterate`then deletes that trigger a
    descendant subscription will also generate a call to
    `iterate`, and in this case `kp` will be the
    path that was actually deleted.
- [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)
     A descendant of the list entry given by `kp` has been
     modified.
- [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)
     The value of the leaf given by `kp` has been set to
     `new_value`.
- [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)
     The list entry given by `kp`, in an ordered\-by user
     list, has been moved. If `new_value` is null, the entry has
     been moved first in the list, otherwise it has been
     moved after the entry given by `new`. In this case
     `new_value`  identifying an entry in the list.



  If `iterate` returns [`DiffIterateResultFlag`](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag),
  no more iteration is done. If `iterate` returns
  [`DiffIterateResultFlag`](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag) iteration continues with all
  children to the node. If `iterate` returns
  [`DiffIterateResultFlag`](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag) iteration ignores the
  children to the node (if any), and continues with the node's sibling.

## Members

**Methods**:

- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#s-iterate)

## Methods

<a id="s-iterate"></a>
### iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)

```java
public abstract com.tailf.conf.DiffIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfObject oldValue,
    com.tailf.conf.ConfObject newValue,
    Object initstate
)
```

Types: [DiffIterateResultFlag](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag), [ConfObject](../conf/ConfObject.md#s-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

Iterate through a set of changes

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - A keypath identifies which node in the data tree that was
            affected
- `com.tailf.conf.DiffIterateOperFlag op` - Operation code (`MOP_CREATED`,
            `MOP_DELETED`, `MOP_VALUE_SET`,
            MOP_MOVED_AFTER)
- `com.tailf.conf.ConfObject oldValue` - The old value is set to a subtype of
            [`ConfValue`](../conf/ConfValue.md#s-ConfValue) when leaf value has been
            changed (`MOP_VALUE_SET`)
- `com.tailf.conf.ConfObject newValue` - The new value is set to a subtype of
            [`ConfValue`](../conf/ConfValue.md#s-ConfValue)
            when a leaf have been set,`MOP_VALUE_SET`.

            When the `op` is `MOP_MOVED_AFTER`
            the `newValue` type is
            [`ConfKey`](../conf/ConfKey.md#s-ConfKey).
- `Object initstate` - An arbitrary object passed to
             `diffIterate` method.
