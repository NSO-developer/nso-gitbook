<a id="s-ConfIterate"></a>
# ConfIterate

```java
public interface com.tailf.conf.ConfIterate
```

The subinterfaces to this interfaces is used as parameter to various
 `diffIterate` methods.



 *CDB API:*
 CdbSubscription.diffIterate(int,CdbDiffIterate),
 CdbSubscription#diffIterate(int,CdbDiffIterate, EnumSet,Object),
 CdbSubscription#CLIdiffIterate(int,CdbCLIDiffIterate),
 CdbSubscription#CLIdiffIterate(int,CdbCLIDiffIterate,
  DiffIterateFlags,Object}


 *MAAPI*:
 [`Maapi`](../maapi/Maapi.md#s-Maapi)



 The implementation of this interface is passed to the above various methods
 and that will go through the set of changes and call the
 the implementation method for each change.


 The implementation methods of have
 the common parameters:


- *Keypath* - uniquely identifies which element that
 is affected and is a reverted array of [`ConfObject`](ConfObject.md#s-ConfObject) whit each
 element as [`ConfTag`](ConfTag.md#s-ConfTag) or [`ConfKey`](ConfKey.md#s-ConfKey).
- *Operation flag* - uniquely indicates the type of change,
 `MOP_CREATED`, `MOP_DELETED` or
 `MOP_MODIFIED`. If the node is a leaf node, operation flag
 is one of `MOP_DELETED` or `MOP_VALUE_SET`
- *New value* - newly set value for a leaf nodes
- *Old value* - old value if available



 The implementation methods of have the common return values:


- *Stop* - `ITER_STOP` no more iteration is done.
- *Recursive* - `ITER_RECURSE` iteration continues
 with all children to the node.
   - *Continue* - `ITER_CONTINUE` iteration ignores the
 children to the node (if any), and continues with the node's sibling
