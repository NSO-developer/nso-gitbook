<a id="cls-AlarmAttribute"></a>
# AlarmAttribute

```java
public class com.tailf.ncs.alarmman.common.AlarmAttribute
    extends com.tailf.ncs.alarmman.common.Attribute
```

Types: [Attribute](Attribute.md#cls-Attribute)

This class represents an alarm attribute.

## Members

**Constructors**:

- [AlarmAttribute(ConfNamespace, String, ConfValue)](#m-alarmattribute-2a564e1a8b6f)

**Fields**:

- [node](Attribute.md#m-node) from Attribute

**Methods**:

- [getId()](Attribute.md#m-getid-199a349c70ef) from Attribute
- [getNameSpace()](Attribute.md#m-getnamespace-e413af21e168) from Attribute
- [getValue()](Attribute.md#m-getvalue-d93864668c40) from Attribute
- [toString()](Attribute.md#m-tostring-e9d48c5503ef) from Attribute

## Constructors

<a id="m-alarmattribute-2a564e1a8b6f"></a>
### AlarmAttribute(ConfNamespace, String, ConfValue)

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
