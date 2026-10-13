# MaapiDiffIterate <a href="#maapidiffiterate-199d02e1da37" id="maapidiffiterate-199d02e1da37"></a>

```java
public interface com.tailf.maapi.MaapiDiffIterate
    extends com.tailf.conf.ConfIterate
```

Types: [ConfIterate](../conf/ConfIterate.md#confiterate-bf30f0c248a0)

This interface is used with the diffIterate method in Maapi. It allows a way
 to iterate through a set of changes and have a user provided method applied
 on each of them.

**See also:** [`Maapi#diffIterate(int,MaapiDiffIterate)`](Maapi.md#diffiterate-8d4d9d07b552)

## Members

**Methods**:

- [iterate\(ConfObject\[\], DiffIterateOperFlag, ConfObject, ConfObject, Object\)](#iterate-d80a566b7e0a)

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

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object initstate`
