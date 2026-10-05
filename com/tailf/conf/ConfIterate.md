# ConfIterate <a href="#confiterate-bf30f0c248a0" id="confiterate-bf30f0c248a0"></a>

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
 [`Maapi#diffIterate(
 int,MaapiDiffIterate,Object,String,Object...)`](../maapi/Maapi.md#diffiterate-08cf0eebfc90)



 The implementation of this interface is passed to the above various methods
 and that will go through the set of changes and call the
 the implementation method for each change.


 The implementation methods of have
 the common parameters:


- *Keypath* - uniquely identifies which element that
 is affected and is a reverted array of [`ConfObject`](ConfObject.md#confobject-5433616953b2) whit each
 element as [`ConfTag`](ConfTag.md#conftag-73757b87bc93) or [`ConfKey`](ConfKey.md#confkey-e4e1ca98e867).
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
