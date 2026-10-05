# Attribute <a href="#cls-Attribute" id="cls-Attribute"></a>

```java
public class com.tailf.ncs.alarmman.common.Attribute
```

Base class for attributes. Use [`AlarmAttribute`](AlarmAttribute.md#cls-AlarmAttribute) or
 [`StatusChangeAttribute`](StatusChangeAttribute.md#cls-StatusChangeAttribute) instead.

**Related classes**

- [AlarmAttribute](AlarmAttribute.md#cls-AlarmAttribute)
- [StatusChangeAttribute](StatusChangeAttribute.md#cls-StatusChangeAttribute)

## Members

**Constructors**:

- [Attribute(ConfNamespace, String, ConfValue)](#m-Attribute-8450316471c9)

**Fields**:

- [node](#m-node)

**Methods**:

- [getId()](#m-getId-199a349c70ef)
- [getNameSpace()](#m-getNameSpace-e413af21e168)
- [getValue()](#m-getValue-d93864668c40)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### Attribute(ConfNamespace, String, ConfValue) <a href="#m-Attribute-8450316471c9" id="m-Attribute-8450316471c9"></a>

```java
protected Attribute(
    com.tailf.conf.ConfNamespace ns,
    String attributeId,
    com.tailf.conf.ConfValue value
)
```

Types: [ConfNamespace](../../../conf/ConfNamespace.md#cls-ConfNamespace), [ConfValue](../../../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.conf.ConfNamespace ns`
- `String attributeId` - the hash of the alarm attribute.
- `com.tailf.conf.ConfValue value` - the value of the alarm attribute.

**Throws**

- `ConfException`


## Fields

### node <a href="#m-node" id="m-node"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode node = null;
```

Types: [CSNode](../../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)


## Methods

### getId() <a href="#m-getId-199a349c70ef" id="m-getId-199a349c70ef"></a>

```java
public String getId()
```

**Returns:** String

### getNameSpace() <a href="#m-getNameSpace-e413af21e168" id="m-getNameSpace-e413af21e168"></a>

```java
public com.tailf.conf.ConfNamespace getNameSpace()
```

Types: [ConfNamespace](../../../conf/ConfNamespace.md#cls-ConfNamespace)

**Returns:** ConfNamespace

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../../../conf/ConfValue.md#cls-ConfValue)

**Returns:** ConfValue

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
