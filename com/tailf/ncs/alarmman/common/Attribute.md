<a id="s-Attribute"></a>
# Attribute

```java
public class com.tailf.ncs.alarmman.common.Attribute
```

Base class for attributes. Use [`AlarmAttribute`](AlarmAttribute.md#s-AlarmAttribute) or
 [`StatusChangeAttribute`](StatusChangeAttribute.md#s-StatusChangeAttribute) instead.

**Related classes**

- [AlarmAttribute](AlarmAttribute.md#s-AlarmAttribute)
- [StatusChangeAttribute](StatusChangeAttribute.md#s-StatusChangeAttribute)

## Members

**Constructors**:

- [Attribute(ConfNamespace, String, ConfValue)](#s-Attribute-1)

**Fields**:

- [node](#s-node)

**Methods**:

- [getId()](#s-getId)
- [getNameSpace()](#s-getNameSpace)
- [getValue()](#s-getValue)
- [toString()](#s-toString)

## Constructors

<a id="s-Attribute-1"></a>
### Attribute(ConfNamespace, String, ConfValue)

```java
protected Attribute(
    com.tailf.conf.ConfNamespace ns,
    String attributeId,
    com.tailf.conf.ConfValue value
)
```

Types: [ConfNamespace](../../../conf/ConfNamespace.md#s-ConfNamespace), [ConfValue](../../../conf/ConfValue.md#s-ConfValue)

**Parameters**

- `com.tailf.conf.ConfNamespace ns`
- `String attributeId` - the hash of the alarm attribute.
- `com.tailf.conf.ConfValue value` - the value of the alarm attribute.

**Throws**

- `ConfException`


## Fields

<a id="s-node"></a>
### node

```java
protected com.tailf.maapi.MaapiSchemas.CSNode node = null;
```

Types: [CSNode](../../../maapi/MaapiSchemas/CSNode.md#s-CSNode)


## Methods

<a id="s-getId"></a>
### getId()

```java
public String getId()
```

**Returns:** String

<a id="s-getNameSpace"></a>
### getNameSpace()

```java
public com.tailf.conf.ConfNamespace getNameSpace()
```

Types: [ConfNamespace](../../../conf/ConfNamespace.md#s-ConfNamespace)

**Returns:** ConfNamespace

<a id="s-getValue"></a>
### getValue()

```java
public com.tailf.conf.ConfValue getValue()
```

Types: [ConfValue](../../../conf/ConfValue.md#s-ConfValue)

**Returns:** ConfValue

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
