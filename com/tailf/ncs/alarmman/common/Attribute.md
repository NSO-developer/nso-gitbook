<a id="cls-Attribute"></a>
# Attribute

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

- [Attribute(ConfNamespace, String, ConfValue)](#m-attribute-8450316471c9)

**Fields**:

- [node](#m-node)

**Methods**:

- [getId()](#m-getid-199a349c70ef)
- [getNameSpace()](#m-getnamespace-e413af21e168)
- [getValue()](#m-getvalue-d93864668c40)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-attribute-8450316471c9"></a>
### Attribute(ConfNamespace, String, ConfValue)

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

<a id="m-node"></a>
### node

```java
protected com.tailf.maapi.MaapiSchemas.CSNode node = null;
```

Types: [CSNode](../../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)


## Methods

<a id="m-getid-199a349c70ef"></a>
### getId()

```java
public String getId()
```

**Returns:** String

<a id="m-getnamespace-e413af21e168"></a>
### getNameSpace()

```java
public com.tailf.conf.ConfNamespace getNameSpace()
```

Types: [ConfNamespace](../../../conf/ConfNamespace.md#cls-ConfNamespace)

**Returns:** ConfNamespace

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../../../conf/ConfValue.md#cls-ConfValue)

**Returns:** ConfValue

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
