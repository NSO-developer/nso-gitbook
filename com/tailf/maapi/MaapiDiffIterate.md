<a id="cls-MaapiDiffIterate"></a>
# MaapiDiffIterate

```java
public interface com.tailf.maapi.MaapiDiffIterate
    extends com.tailf.conf.ConfIterate
```

Types: [ConfIterate](../conf/ConfIterate.md#cls-ConfIterate)

This interface is used with the diffIterate method in Maapi. It allows a way
 to iterate through a set of changes and have a user provided method applied
 on each of them.

**See also:** [`Maapi#diffIterate(int,MaapiDiffIterate)`](Maapi.md#m-diffiterate-8d4d9d07b552)

## Members

**Methods**:

- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#m-iterate-d80a566b7e0a)

## Methods

<a id="m-iterate-d80a566b7e0a"></a>
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

Types: [DiffIterateResultFlag](../conf/DiffIterateResultFlag.md#cls-DiffIterateResultFlag), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
