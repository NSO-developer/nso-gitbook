<a id="cls-MaapiIterate"></a>
# MaapiIterate

```java
public interface com.tailf.maapi.MaapiIterate
    extends com.tailf.conf.ConfIterate
```

Types: [ConfIterate](../conf/ConfIterate.md#cls-ConfIterate)

This interface is used with the Iterate method in Maapi. It allows a way
 to iterate through a set of data in a transaction and have a user provided
 method applied on each of the data elements.

**See also:** [`Maapi#iterate`](Maapi.md#m-iterate-f6278b19bafb)

## Members

**Methods**:

- [iterate(ConfObject[], ConfObject, ConfAttributeValue[], Object)](#m-iterate-638caa8f5a2f)

## Methods

<a id="m-iterate-638caa8f5a2f"></a>
### iterate(ConfObject[], ConfObject, ConfAttributeValue[], Object)

```java
public abstract com.tailf.conf.ConfIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfObject value,
    com.tailf.conf.ConfAttributeValue[] attrs,
    Object initstate
)
```

Types: [ConfIterateResultFlag](../conf/ConfIterateResultFlag.md#cls-ConfIterateResultFlag), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [ConfAttributeValue](../conf/ConfAttributeValue.md#cls-ConfAttributeValue)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfObject value`
- `com.tailf.conf.ConfAttributeValue[] attrs`
- `Object initstate`
