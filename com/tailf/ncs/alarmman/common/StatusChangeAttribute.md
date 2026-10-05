# StatusChangeAttribute <a href="#statuschangeattribute-53548dbb7d69" id="statuschangeattribute-53548dbb7d69"></a>

```java
public class com.tailf.ncs.alarmman.common.StatusChangeAttribute
    extends com.tailf.ncs.alarmman.common.Attribute
```

Types: [Attribute](Attribute.md#attribute-cb42ffd9bcdd)

Class representing a status change attribute.

## Members

**Constructors**:

- [StatusChangeAttribute(ConfNamespace, String, ConfValue)](#statuschangeattribute-31509a8e3de7)

**Fields**:

- [node](Attribute.md#node-ff68e6a3ebc6) from Attribute

**Methods**:

- [getId()](Attribute.md#getid-199a349c70ef) from Attribute
- [getNameSpace()](Attribute.md#getnamespace-e413af21e168) from Attribute
- [getValue()](Attribute.md#getvalue-d93864668c40) from Attribute
- [toString()](Attribute.md#tostring-e9d48c5503ef) from Attribute

## Constructors

### StatusChangeAttribute(ConfNamespace, String, ConfValue) <a href="#statuschangeattribute-31509a8e3de7" id="statuschangeattribute-31509a8e3de7"></a>

```java
public StatusChangeAttribute(
    com.tailf.conf.ConfNamespace ns,
    String attributeId,
    com.tailf.conf.ConfValue value
)
    throws com.tailf.conf.ConfException
```

Types: [ConfNamespace](../../../conf/ConfNamespace.md#confnamespace-51b928e168d1), [ConfValue](../../../conf/ConfValue.md#confvalue-769292781c7d), [ConfException](../../../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfNamespace ns`
- `String attributeId`
- `com.tailf.conf.ConfValue value`
