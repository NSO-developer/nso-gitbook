<a id="s-ConfAttributeValue"></a>
# ConfAttributeValue

```java
public class com.tailf.conf.ConfAttributeValue
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfAttributeValue>
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfAttributeValue](ConfAttributeValue.md#s-ConfAttributeValue)

Class that represents an attribute value for an element in a model.
 An attribute value consists of a type and a value.
 The type is defined by [`ConfAttributeType`](ConfAttributeType.md#s-ConfAttributeType) and the value by
 a subclass of [`ConfValue`](ConfValue.md#s-ConfValue)

## Members

**Constructors**:

- [ConfAttributeValue(ConfAttributeType, ConfValue)](#s-ConfAttributeValue-1)

**Fields**:

- [J_BINARY](ConfObject.md#s-J_BINARY) from ConfObject
- [J_BIT32](ConfObject.md#s-J_BIT32) from ConfObject
- [J_BIT64](ConfObject.md#s-J_BIT64) from ConfObject
- [J_BITBIG](ConfObject.md#s-J_BITBIG) from ConfObject
- [J_BOOL](ConfObject.md#s-J_BOOL) from ConfObject
- [J_BUF](ConfObject.md#s-J_BUF) from ConfObject
- [J_CDBBEGIN](ConfObject.md#s-J_CDBBEGIN) from ConfObject
- [J_DATE](ConfObject.md#s-J_DATE) from ConfObject
- [J_DATETIME](ConfObject.md#s-J_DATETIME) from ConfObject
- [J_DECIMAL64](ConfObject.md#s-J_DECIMAL64) from ConfObject
- [J_DEFAULT](ConfObject.md#s-J_DEFAULT) from ConfObject
- [J_DOUBLE](ConfObject.md#s-J_DOUBLE) from ConfObject
- [J_DQUAD](ConfObject.md#s-J_DQUAD) from ConfObject
- [J_DURATION](ConfObject.md#s-J_DURATION) from ConfObject
- [J_EMPTY](ConfObject.md#s-J_EMPTY) from ConfObject
- [J_ENUMERATION](ConfObject.md#s-J_ENUMERATION) from ConfObject
- [J_HEXSTR](ConfObject.md#s-J_HEXSTR) from ConfObject
- [J_IDENTITYREF](ConfObject.md#s-J_IDENTITYREF) from ConfObject
- [J_INSTANCE_IDENTIFIER](ConfObject.md#s-J_INSTANCE_IDENTIFIER) from ConfObject
- [J_INT16](ConfObject.md#s-J_INT16) from ConfObject
- [J_INT32](ConfObject.md#s-J_INT32) from ConfObject
- [J_INT64](ConfObject.md#s-J_INT64) from ConfObject
- [J_INT8](ConfObject.md#s-J_INT8) from ConfObject
- [J_IPV4](ConfObject.md#s-J_IPV4) from ConfObject
- [J_IPV4_AND_PLEN](ConfObject.md#s-J_IPV4_AND_PLEN) from ConfObject
- [J_IPV4PREFIX](ConfObject.md#s-J_IPV4PREFIX) from ConfObject
- [J_IPV6](ConfObject.md#s-J_IPV6) from ConfObject
- [J_IPV6_AND_PLEN](ConfObject.md#s-J_IPV6_AND_PLEN) from ConfObject
- [J_IPV6PREFIX](ConfObject.md#s-J_IPV6PREFIX) from ConfObject
- [J_LIST](ConfObject.md#s-J_LIST) from ConfObject
- [J_NOEXISTS](ConfObject.md#s-J_NOEXISTS) from ConfObject
- [J_OBJECTREF](ConfObject.md#s-J_OBJECTREF) from ConfObject
- [J_OID](ConfObject.md#s-J_OID) from ConfObject
- [J_PTR](ConfObject.md#s-J_PTR) from ConfObject
- [J_QNAME](ConfObject.md#s-J_QNAME) from ConfObject
- [J_STR](ConfObject.md#s-J_STR) from ConfObject
- [J_SYMBOL](ConfObject.md#s-J_SYMBOL) from ConfObject
- [J_TIME](ConfObject.md#s-J_TIME) from ConfObject
- [J_UINT16](ConfObject.md#s-J_UINT16) from ConfObject
- [J_UINT32](ConfObject.md#s-J_UINT32) from ConfObject
- [J_UINT64](ConfObject.md#s-J_UINT64) from ConfObject
- [J_UINT8](ConfObject.md#s-J_UINT8) from ConfObject
- [J_UNION](ConfObject.md#s-J_UNION) from ConfObject
- [J_XMLBEGIN](ConfObject.md#s-J_XMLBEGIN) from ConfObject
- [J_XMLBEGINDEL](ConfObject.md#s-J_XMLBEGINDEL) from ConfObject
- [J_XMLEND](ConfObject.md#s-J_XMLEND) from ConfObject
- [J_XMLMOVEAFTER](ConfObject.md#s-J_XMLMOVEAFTER) from ConfObject
- [J_XMLMOVEFIRST](ConfObject.md#s-J_XMLMOVEFIRST) from ConfObject
- [J_XMLTAG](ConfObject.md#s-J_XMLTAG) from ConfObject

**Methods**:

- [clone()](ConfObject.md#s-clone) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#s-compare) from ConfObject
- [compareTo(ConfAttributeValue)](#s-compareTo)
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [getAttributeType()](#s-getAttributeType)
- [getAttributeValue()](#s-getAttributeValue)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](ConfValue.md#s-getValueByString-1) from ConfValue
- [hashCode()](#s-hashCode)
- [isRemoveValue()](#s-isRemoveValue)
- [setAttributeType(ConfAttributeType)](#s-setAttributeType)
- [setAttributeValue(ConfValue)](#s-setAttributeValue)
- [setRemoveValue()](#s-setRemoveValue)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfAttributeValue-1"></a>
### ConfAttributeValue(ConfAttributeType, ConfValue)

```java
public ConfAttributeValue(com.tailf.conf.ConfAttributeType typ, com.tailf.conf.ConfValue val)
```

Types: [ConfAttributeType](ConfAttributeType.md#s-ConfAttributeType), [ConfValue](ConfValue.md#s-ConfValue)

Constructor of ConfAttributeValue
 Consists of a value and a type.
 The legal values for each type is defined in
 [`ConfAttributeType`](ConfAttributeType.md#s-ConfAttributeType)

**Parameters**

- `com.tailf.conf.ConfAttributeType typ` - ConfAttributeType
- `com.tailf.conf.ConfValue val` - subclass to ConfValue


## Methods

<a id="s-compareTo"></a>
### compareTo(ConfAttributeValue)

```java
public int compareTo(com.tailf.conf.ConfAttributeValue o)
```

Types: [ConfAttributeValue](ConfAttributeValue.md#s-ConfAttributeValue)

**Parameters**

- `com.tailf.conf.ConfAttributeValue o`

<a id="s-encode"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="s-getAttributeType"></a>
### getAttributeType()

```java
public com.tailf.conf.ConfAttributeType getAttributeType()
```

Types: [ConfAttributeType](ConfAttributeType.md#s-ConfAttributeType)

Get the Attribute type for this attribute value

**Returns:** ConfAttributeType the attribute type

<a id="s-getAttributeValue"></a>
### getAttributeValue()

```java
public com.tailf.conf.ConfValue getAttributeValue()
```

Types: [ConfValue](ConfValue.md#s-ConfValue)

Get the value of the attribute

**Returns:** ConfValue the value of the attribute

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-isRemoveValue"></a>
### isRemoveValue()

```java
public boolean isRemoveValue()
```

Check if the attribute is set to be removed

**Returns:** boolean true if set to be removed

<a id="s-setAttributeType"></a>
### setAttributeType(ConfAttributeType)

```java
public void setAttributeType(com.tailf.conf.ConfAttributeType attributeType)
```

Types: [ConfAttributeType](ConfAttributeType.md#s-ConfAttributeType)

Set the attribute type for this attribute value

**Parameters**

- `com.tailf.conf.ConfAttributeType attributeType` - ConfAttributeType

<a id="s-setAttributeValue"></a>
### setAttributeValue(ConfValue)

```java
public void setAttributeValue(com.tailf.conf.ConfValue attributeValue)
```

Types: [ConfValue](ConfValue.md#s-ConfValue)

Set the value for this attribute value

**Parameters**

- `com.tailf.conf.ConfValue attributeValue` - ConfValue

<a id="s-setRemoveValue"></a>
### setRemoveValue()

```java
public void setRemoveValue()
```

Mark this attribute value for removal.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
