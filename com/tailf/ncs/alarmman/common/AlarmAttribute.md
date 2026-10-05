<a id="s-AlarmAttribute"></a>
# AlarmAttribute

```java
public class com.tailf.ncs.alarmman.common.AlarmAttribute
    extends com.tailf.ncs.alarmman.common.Attribute
```

Types: [Attribute](Attribute.md#s-Attribute)

This class represents an alarm attribute.

## Members

**Constructors**:

- [AlarmAttribute(ConfNamespace, String, ConfValue)](#s-AlarmAttribute-1)

**Fields**:

- [node](Attribute.md#s-node) from Attribute

**Methods**:

- [getId()](Attribute.md#s-getId) from Attribute
- [getNameSpace()](Attribute.md#s-getNameSpace) from Attribute
- [getValue()](Attribute.md#s-getValue) from Attribute
- [toString()](Attribute.md#s-toString) from Attribute

## Constructors

<a id="s-AlarmAttribute-1"></a>
### AlarmAttribute(ConfNamespace, String, ConfValue)

```java
public AlarmAttribute(
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

**Throws**

- `ConfException`
