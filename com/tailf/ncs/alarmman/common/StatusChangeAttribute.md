<a id="s-StatusChangeAttribute"></a>
# StatusChangeAttribute

```java
public class com.tailf.ncs.alarmman.common.StatusChangeAttribute
    extends com.tailf.ncs.alarmman.common.Attribute
```

Types: [Attribute](Attribute.md#s-Attribute)

Class representing a status change attribute.

## Members

**Constructors**:

- [StatusChangeAttribute(ConfNamespace, String, ConfValue)](#s-StatusChangeAttribute-1)

**Fields**:

- [node](Attribute.md#s-node) from Attribute

**Methods**:

- [getId()](Attribute.md#s-getId) from Attribute
- [getNameSpace()](Attribute.md#s-getNameSpace) from Attribute
- [getValue()](Attribute.md#s-getValue) from Attribute
- [toString()](Attribute.md#s-toString) from Attribute

## Constructors

<a id="s-StatusChangeAttribute-1"></a>
### StatusChangeAttribute(ConfNamespace, String, ConfValue)

```java
public StatusChangeAttribute(
    com.tailf.conf.ConfNamespace ns,
    String attributeId,
    com.tailf.conf.ConfValue value
)
    throws com.tailf.conf.ConfException
```

Types: [ConfNamespace](../../../conf/ConfNamespace.md#s-ConfNamespace), [ConfValue](../../../conf/ConfValue.md#s-ConfValue), [ConfException](../../../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfNamespace ns`
- `String attributeId`
- `com.tailf.conf.ConfValue value`
