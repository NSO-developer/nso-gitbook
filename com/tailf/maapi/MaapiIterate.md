<a id="s-MaapiIterate"></a>
# MaapiIterate

```java
public interface com.tailf.maapi.MaapiIterate
    extends com.tailf.conf.ConfIterate
```

Types: [ConfIterate](../conf/ConfIterate.md#s-ConfIterate)

This interface is used with the Iterate method in Maapi. It allows a way
 to iterate through a set of data in a transaction and have a user provided
 method applied on each of the data elements.

**See also:** [`Maapi#iterate`](Maapi.md#s-iterate)

## Members

**Methods**:

- [iterate(ConfObject[], ConfObject, ConfAttributeValue[], Object)](#s-iterate)

## Methods

<a id="s-iterate"></a>
### iterate(ConfObject[], ConfObject, ConfAttributeValue[], Object)

```java
public abstract com.tailf.conf.ConfIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfObject value,
    com.tailf.conf.ConfAttributeValue[] attrs,
    Object initstate
)
```

Types: [ConfIterateResultFlag](../conf/ConfIterateResultFlag.md#s-ConfIterateResultFlag), [ConfObject](../conf/ConfObject.md#s-ConfObject), [ConfAttributeValue](../conf/ConfAttributeValue.md#s-ConfAttributeValue)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfObject value`
- `com.tailf.conf.ConfAttributeValue[] attrs`
- `Object initstate`
