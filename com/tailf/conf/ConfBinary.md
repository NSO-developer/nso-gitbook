<a id="s-ConfBinary"></a>
# ConfBinary

```java
public class com.tailf.conf.ConfBinary
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfBinary>
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfBinary](ConfBinary.md#s-ConfBinary)

DATA_CONTAINER - Corresponds to the YANG tailf:hex-list and tailf:octet-list.

**Related classes**

- [ConfHexList](ConfHexList.md#s-ConfHexList)
- [ConfOctetList](ConfOctetList.md#s-ConfOctetList)
- [PathConfBinary](gen/PathParser/PathConfBinary.md#s-PathConfBinary)

## Members

**Constructors**:

- [ConfBinary()](#s-ConfBinary-1)
- [ConfBinary(byte[])](#s-ConfBinary-2)
- [ConfBinary(ConfEObject)](#s-ConfBinary-3)
- [ConfBinary(String)](#s-ConfBinary-4)

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
- [val](#s-val)

**Methods**:

- [bytesValue()](#s-bytesValue)
- [clone()](ConfObject.md#s-clone) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#s-compare) from ConfObject
- [compareTo(ConfBinary)](#s-compareTo)
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](ConfValue.md#s-getValueByString-1) from ConfValue
- [hashCode()](#s-hashCode)
- [setCSType(CSType)](#s-setCSType)
- [toHexListString()](#s-toHexListString)
- [toOctetListString()](#s-toOctetListString)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfBinary-1"></a>
### ConfBinary()

```java
protected ConfBinary()
```

<a id="s-ConfBinary-2"></a>
### ConfBinary(byte[])

```java
public ConfBinary(byte[] bytes)
```

**Parameters**

- `byte[] bytes`

<a id="s-ConfBinary-3"></a>
### ConfBinary(ConfEObject)

```java
public ConfBinary(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-ConfBinary-4"></a>
### ConfBinary(String)

```java
public ConfBinary(String str)
```

**Parameters**

- `String str`


## Fields

<a id="s-val"></a>
### val

```java
protected byte[] val = null;
```


## Methods

<a id="s-bytesValue"></a>
### bytesValue()

```java
public byte[] bytesValue()
```

<a id="s-compareTo"></a>
### compareTo(ConfBinary)

```java
public int compareTo(com.tailf.conf.ConfBinary o)
```

Types: [ConfBinary](ConfBinary.md#s-ConfBinary)

**Parameters**

- `com.tailf.conf.ConfBinary o`

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

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-setCSType"></a>
### setCSType(CSType)

```java
public void setCSType(com.tailf.maapi.MaapiSchemas.CSType csType)
```

Types: [CSType](../maapi/MaapiSchemas/CSType.md#s-CSType)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType csType`

<a id="s-toHexListString"></a>
### toHexListString()

```java
public String toHexListString()
```

Formats the Binary as a tailf:hex-list string.

<a id="s-toOctetListString"></a>
### toOctetListString()

```java
public String toOctetListString()
```

Formats the Binary as a tailf::octet-list string.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
