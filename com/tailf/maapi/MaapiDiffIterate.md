<a id="s-MaapiDiffIterate"></a>
# MaapiDiffIterate

```java
public interface com.tailf.maapi.MaapiDiffIterate
    extends com.tailf.conf.ConfIterate
```

Types: [ConfIterate](../conf/ConfIterate.md#s-ConfIterate)

This interface is used with the diffIterate method in Maapi. It allows a way
 to iterate through a set of changes and have a user provided method applied
 on each of them.

**See also:** [`Maapi#diffIterate(int,MaapiDiffIterate)`](Maapi.md#s-diffIterate)

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

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
