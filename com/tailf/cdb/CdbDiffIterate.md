# CdbDiffIterate <a href="#cdbdiffiterate-ab6fafeeb31e" id="cdbdiffiterate-ab6fafeeb31e"></a>

```java
public interface com.tailf.cdb.CdbDiffIterate
    extends com.tailf.conf.ConfIterate
```

Types: [ConfIterate](../conf/ConfIterate.md#confiterate-bf30f0c248a0)

The `CdbDiffIterate` interface should be implemented
 by any class whose instances are intended to process or iterate
 through a set of changes.

 A particular instance of the implemented class
 should be provided to call to
 `CdbSubscription#diffIterate(int,CdbDiffIterate,EnumSet,Object)`.

 The `iterate` method will be called  for each element
 that has been modified and matches the subscription.

 The `iterate` callback receives the
 [`ConfObject`](../conf/ConfObject.md#confobject-5433616953b2) array `kp` which uniquely identifies which
 node in the data tree that is affected, the operation, and optionally the
 values it has before and after the
 transaction. The `op` parameter gives the modification as:



- [`DiffIterateOperFlag#MOP_CREATED`](../conf/DiffIterateOperFlag.md#mop_created-1b4baba0a9b5)
   The list entry, presence container, or leaf of type empty given by
    `kp` has been created.
- [`DiffIterateOperFlag#MOP_DELETED`](../conf/DiffIterateOperFlag.md#mop_deleted-bfb313272589)
    The list entry, presence container, or optional leaf given by
    `kp` has been deleted.

     If the subscription was triggered because an ancestor was deleted,
    the `iterate` method will not called at all if the delete
    was above the subscription point.
    However if the flag
    [`DiffIterateFlags#ITER_WANT_ANCESTOR_DELETE`](../conf/DiffIterateFlags.md#iter_want_ancestor_delete-8aeb50c9a808)
    is passed to `diffIterate`then deletes that trigger a
    descendant subscription will also generate a call to
    `iterate`, and in this case `kp` will be the
    path that was actually deleted.
- [`DiffIterateOperFlag#MOP_MODIFIED`](../conf/DiffIterateOperFlag.md#mop_modified-04604a9e1f38)
     A descendant of the list entry given by `kp` has been
     modified.
- [`DiffIterateOperFlag#MOP_VALUE_SET`](../conf/DiffIterateOperFlag.md#mop_value_set-785b954bac72)
     The value of the leaf given by `kp` has been set to
     `new_value`.
- [`DiffIterateOperFlag#MOP_MOVED_AFTER`](../conf/DiffIterateOperFlag.md#mop_moved_after-a0be8ecb4c10)
     The list entry given by `kp`, in an ordered\-by user
     list, has been moved. If `new_value` is null, the entry has
     been moved first in the list, otherwise it has been
     moved after the entry given by `new`. In this case
     `new_value`  identifying an entry in the list.



  If `iterate` returns [`DiffIterateResultFlag#ITER_STOP`](../conf/DiffIterateResultFlag.md#iter_stop-1b807e9343da),
  no more iteration is done. If `iterate` returns
  [`DiffIterateResultFlag#ITER_RECURSE`](../conf/DiffIterateResultFlag.md#iter_recurse-691241795ec1) iteration continues with all
  children to the node. If `iterate` returns
  [`DiffIterateResultFlag#ITER_CONTINUE`](../conf/DiffIterateResultFlag.md#iter_continue-987b3f3577df) iteration ignores the
  children to the node (if any), and continues with the node's sibling.

## Members

**Methods**:

- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#iterate-d80a566b7e0a)

## Methods

### iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object) <a href="#iterate-d80a566b7e0a" id="iterate-d80a566b7e0a"></a>

```java
public abstract com.tailf.conf.DiffIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfObject oldValue,
    com.tailf.conf.ConfObject newValue,
    Object initstate
)
```

Types: [DiffIterateResultFlag](../conf/DiffIterateResultFlag.md#diffiterateresultflag-3bcd05ed3269), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

Iterate through a set of changes

**Parameters**

- `com.tailf.conf.ConfObject[] kp` - A keypath identifies which node in the data tree that was
            affected
- `com.tailf.conf.DiffIterateOperFlag op` - Operation code (`MOP_CREATED`,
            `MOP_DELETED`, `MOP_VALUE_SET`,
            MOP_MOVED_AFTER)
- `com.tailf.conf.ConfObject oldValue` - The old value is set to a subtype of
            [`ConfValue`](../conf/ConfValue.md#confvalue-769292781c7d) when leaf value has been
            changed (`MOP_VALUE_SET`)
- `com.tailf.conf.ConfObject newValue` - The new value is set to a subtype of
            [`ConfValue`](../conf/ConfValue.md#confvalue-769292781c7d)
            when a leaf have been set,`MOP_VALUE_SET`.

            When the `op` is `MOP_MOVED_AFTER`
            the `newValue` type is
            [`ConfKey`](../conf/ConfKey.md#confkey-e4e1ca98e867).
- `Object initstate` - An arbitrary object passed to
             `diffIterate` method.
