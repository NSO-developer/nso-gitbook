# AlarmAttribute <a href="#cls-AlarmAttribute" id="cls-AlarmAttribute"></a>

```java
public class com.tailf.ncs.alarmman.common.AlarmAttribute
    extends com.tailf.ncs.alarmman.common.Attribute
```

Types: [Attribute](Attribute.md#cls-Attribute)

This class represents an alarm attribute.

## Members

**Constructors**:

- [AlarmAttribute(ConfNamespace, String, ConfValue)](#m-AlarmAttribute-2a564e1a8b6f)

**Fields**:

- [node](Attribute.md#m-node) from Attribute

**Methods**:

- [getId()](Attribute.md#m-getId-199a349c70ef) from Attribute
- [getNameSpace()](Attribute.md#m-getNameSpace-e413af21e168) from Attribute
- [getValue()](Attribute.md#m-getValue-d93864668c40) from Attribute
- [toString()](Attribute.md#m-toString-e9d48c5503ef) from Attribute

## Constructors

### AlarmAttribute(ConfNamespace, String, ConfValue) <a href="#m-AlarmAttribute-2a564e1a8b6f" id="m-AlarmAttribute-2a564e1a8b6f"></a>

```java
public AlarmAttribute(
    com.tailf.conf.ConfNamespace ns,
    String attributeId,
    com.tailf.conf.ConfValue value
)
    throws com.tailf.conf.ConfException
```

Types: [ConfNamespace](../../../conf/ConfNamespace.md#cls-ConfNamespace), [ConfValue](../../../conf/ConfValue.md#cls-ConfValue), [ConfException](../../../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfNamespace ns`
- `String attributeId`
- `com.tailf.conf.ConfValue value`

**Throws**

- `ConfException`
