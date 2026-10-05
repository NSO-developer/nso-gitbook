# MaapiIterate <a href="#maapiiterate-7712a2112a17" id="maapiiterate-7712a2112a17"></a>

```java
public interface com.tailf.maapi.MaapiIterate
    extends com.tailf.conf.ConfIterate
```

Types: [ConfIterate](../conf/ConfIterate.md#confiterate-bf30f0c248a0)

This interface is used with the Iterate method in Maapi. It allows a way
 to iterate through a set of data in a transaction and have a user provided
 method applied on each of the data elements.

**See also:** [`Maapi#iterate`](Maapi.md#iterate-f6278b19bafb)

## Members

**Methods**:

- [iterate\(ConfObject\[\], ConfObject, ConfAttributeValue\[\], Object\)](#iterate-638caa8f5a2f)

## Methods

### iterate(ConfObject[], ConfObject, ConfAttributeValue[], Object) <a href="#iterate-638caa8f5a2f" id="iterate-638caa8f5a2f"></a>

```java
public abstract com.tailf.conf.ConfIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.ConfObject value,
    com.tailf.conf.ConfAttributeValue[] attrs,
    Object initstate
)
```

Types: [ConfIterateResultFlag](../conf/ConfIterateResultFlag.md#confiterateresultflag-47d57f8165d1), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [ConfAttributeValue](../conf/ConfAttributeValue.md#confattributevalue-d38e058ca48e)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.ConfObject value`
- `com.tailf.conf.ConfAttributeValue[] attrs`
- `Object initstate`
