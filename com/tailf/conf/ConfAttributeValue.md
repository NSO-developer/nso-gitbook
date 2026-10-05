# ConfAttributeValue <a href="#cls-ConfAttributeValue" id="cls-ConfAttributeValue"></a>

```java
public class com.tailf.conf.ConfAttributeValue
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfAttributeValue>
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfAttributeValue](ConfAttributeValue.md#cls-ConfAttributeValue)

Class that represents an attribute value for an element in a model.
 An attribute value consists of a type and a value.
 The type is defined by [`ConfAttributeType`](ConfAttributeType.md#cls-ConfAttributeType) and the value by
 a subclass of [`ConfValue`](ConfValue.md#cls-ConfValue)

## Members

**Constructors**:

- [ConfAttributeValue(ConfAttributeType, ConfValue)](#m-ConfAttributeValue-a940824befe4)

**Fields**:

- [J_BINARY](ConfObject.md#m-J_BINARY) from ConfObject
- [J_BIT32](ConfObject.md#m-J_BIT32) from ConfObject
- [J_BIT64](ConfObject.md#m-J_BIT64) from ConfObject
- [J_BITBIG](ConfObject.md#m-J_BITBIG) from ConfObject
- [J_BOOL](ConfObject.md#m-J_BOOL) from ConfObject
- [J_BUF](ConfObject.md#m-J_BUF) from ConfObject
- [J_CDBBEGIN](ConfObject.md#m-J_CDBBEGIN) from ConfObject
- [J_DATE](ConfObject.md#m-J_DATE) from ConfObject
- [J_DATETIME](ConfObject.md#m-J_DATETIME) from ConfObject
- [J_DECIMAL64](ConfObject.md#m-J_DECIMAL64) from ConfObject
- [J_DEFAULT](ConfObject.md#m-J_DEFAULT) from ConfObject
- [J_DOUBLE](ConfObject.md#m-J_DOUBLE) from ConfObject
- [J_DQUAD](ConfObject.md#m-J_DQUAD) from ConfObject
- [J_DURATION](ConfObject.md#m-J_DURATION) from ConfObject
- [J_EMPTY](ConfObject.md#m-J_EMPTY) from ConfObject
- [J_ENUMERATION](ConfObject.md#m-J_ENUMERATION) from ConfObject
- [J_HEXSTR](ConfObject.md#m-J_HEXSTR) from ConfObject
- [J_IDENTITYREF](ConfObject.md#m-J_IDENTITYREF) from ConfObject
- [J_INSTANCE_IDENTIFIER](ConfObject.md#m-J_INSTANCE_IDENTIFIER) from ConfObject
- [J_INT16](ConfObject.md#m-J_INT16) from ConfObject
- [J_INT32](ConfObject.md#m-J_INT32) from ConfObject
- [J_INT64](ConfObject.md#m-J_INT64) from ConfObject
- [J_INT8](ConfObject.md#m-J_INT8) from ConfObject
- [J_IPV4](ConfObject.md#m-J_IPV4) from ConfObject
- [J_IPV4_AND_PLEN](ConfObject.md#m-J_IPV4_AND_PLEN) from ConfObject
- [J_IPV4PREFIX](ConfObject.md#m-J_IPV4PREFIX) from ConfObject
- [J_IPV6](ConfObject.md#m-J_IPV6) from ConfObject
- [J_IPV6_AND_PLEN](ConfObject.md#m-J_IPV6_AND_PLEN) from ConfObject
- [J_IPV6PREFIX](ConfObject.md#m-J_IPV6PREFIX) from ConfObject
- [J_LIST](ConfObject.md#m-J_LIST) from ConfObject
- [J_NOEXISTS](ConfObject.md#m-J_NOEXISTS) from ConfObject
- [J_OBJECTREF](ConfObject.md#m-J_OBJECTREF) from ConfObject
- [J_OID](ConfObject.md#m-J_OID) from ConfObject
- [J_PTR](ConfObject.md#m-J_PTR) from ConfObject
- [J_QNAME](ConfObject.md#m-J_QNAME) from ConfObject
- [J_STR](ConfObject.md#m-J_STR) from ConfObject
- [J_SYMBOL](ConfObject.md#m-J_SYMBOL) from ConfObject
- [J_TIME](ConfObject.md#m-J_TIME) from ConfObject
- [J_UINT16](ConfObject.md#m-J_UINT16) from ConfObject
- [J_UINT32](ConfObject.md#m-J_UINT32) from ConfObject
- [J_UINT64](ConfObject.md#m-J_UINT64) from ConfObject
- [J_UINT8](ConfObject.md#m-J_UINT8) from ConfObject
- [J_UNION](ConfObject.md#m-J_UNION) from ConfObject
- [J_XMLBEGIN](ConfObject.md#m-J_XMLBEGIN) from ConfObject
- [J_XMLBEGINDEL](ConfObject.md#m-J_XMLBEGINDEL) from ConfObject
- [J_XMLEND](ConfObject.md#m-J_XMLEND) from ConfObject
- [J_XMLMOVEAFTER](ConfObject.md#m-J_XMLMOVEAFTER) from ConfObject
- [J_XMLMOVEFIRST](ConfObject.md#m-J_XMLMOVEFIRST) from ConfObject
- [J_XMLTAG](ConfObject.md#m-J_XMLTAG) from ConfObject

**Methods**:

- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [compareTo(ConfAttributeValue)](#m-compareTo-a9ebafb7dd06)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getAttributeType()](#m-getAttributeType-ded421773bde)
- [getAttributeValue()](#m-getAttributeValue-4f670a5f6256)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getStringByValue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getStringByValue-8ed173dcf8dc) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#m-getValueByString-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getValueByString-7804643cb027) from ConfValue
- [hashCode()](#m-hashCode-ef797a217903)
- [isRemoveValue()](#m-isRemoveValue-194c934cfcb9)
- [setAttributeType(ConfAttributeType)](#m-setAttributeType-4d8a1817b957)
- [setAttributeValue(ConfValue)](#m-setAttributeValue-788a6cd6f4d3)
- [setRemoveValue()](#m-setRemoveValue-dfa345a6af6d)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfAttributeValue(ConfAttributeType, ConfValue) <a href="#m-ConfAttributeValue-a940824befe4" id="m-ConfAttributeValue-a940824befe4"></a>

```java
public ConfAttributeValue(com.tailf.conf.ConfAttributeType typ, com.tailf.conf.ConfValue val)
```

Types: [ConfAttributeType](ConfAttributeType.md#cls-ConfAttributeType), [ConfValue](ConfValue.md#cls-ConfValue)

Constructor of ConfAttributeValue
 Consists of a value and a type.
 The legal values for each type is defined in
 [`ConfAttributeType`](ConfAttributeType.md#cls-ConfAttributeType)

**Parameters**

- `com.tailf.conf.ConfAttributeType typ` - ConfAttributeType
- `com.tailf.conf.ConfValue val` - subclass to ConfValue


## Methods

### compareTo(ConfAttributeValue) <a href="#m-compareTo-a9ebafb7dd06" id="m-compareTo-a9ebafb7dd06"></a>

```java
public int compareTo(com.tailf.conf.ConfAttributeValue o)
```

Types: [ConfAttributeValue](ConfAttributeValue.md#cls-ConfAttributeValue)

**Parameters**

- `com.tailf.conf.ConfAttributeValue o`

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getAttributeType() <a href="#m-getAttributeType-ded421773bde" id="m-getAttributeType-ded421773bde"></a>

```java
public com.tailf.conf.ConfAttributeType getAttributeType()
```

Types: [ConfAttributeType](ConfAttributeType.md#cls-ConfAttributeType)

Get the Attribute type for this attribute value

**Returns:** ConfAttributeType the attribute type

### getAttributeValue() <a href="#m-getAttributeValue-4f670a5f6256" id="m-getAttributeValue-4f670a5f6256"></a>

```java
public com.tailf.conf.ConfValue getAttributeValue()
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Get the value of the attribute

**Returns:** ConfValue the value of the attribute

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### isRemoveValue() <a href="#m-isRemoveValue-194c934cfcb9" id="m-isRemoveValue-194c934cfcb9"></a>

```java
public boolean isRemoveValue()
```

Check if the attribute is set to be removed

**Returns:** boolean true if set to be removed

### setAttributeType(ConfAttributeType) <a href="#m-setAttributeType-4d8a1817b957" id="m-setAttributeType-4d8a1817b957"></a>

```java
public void setAttributeType(com.tailf.conf.ConfAttributeType attributeType)
```

Types: [ConfAttributeType](ConfAttributeType.md#cls-ConfAttributeType)

Set the attribute type for this attribute value

**Parameters**

- `com.tailf.conf.ConfAttributeType attributeType` - ConfAttributeType

### setAttributeValue(ConfValue) <a href="#m-setAttributeValue-788a6cd6f4d3" id="m-setAttributeValue-788a6cd6f4d3"></a>

```java
public void setAttributeValue(com.tailf.conf.ConfValue attributeValue)
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Set the value for this attribute value

**Parameters**

- `com.tailf.conf.ConfValue attributeValue` - ConfValue

### setRemoveValue() <a href="#m-setRemoveValue-dfa345a6af6d" id="m-setRemoveValue-dfa345a6af6d"></a>

```java
public void setRemoveValue()
```

Mark this attribute value for removal.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
