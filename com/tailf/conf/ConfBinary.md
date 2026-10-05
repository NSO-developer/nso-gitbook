# ConfBinary <a href="#cls-ConfBinary" id="cls-ConfBinary"></a>

```java
public class com.tailf.conf.ConfBinary
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfBinary>
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfBinary](ConfBinary.md#cls-ConfBinary)

DATA_CONTAINER - Corresponds to the YANG tailf:hex-list and tailf:octet-list.

**Related classes**

- [ConfHexList](ConfHexList.md#cls-ConfHexList)
- [ConfOctetList](ConfOctetList.md#cls-ConfOctetList)
- [PathConfBinary](gen/PathParser/PathConfBinary.md#cls-PathConfBinary)

## Members

**Constructors**:

- [ConfBinary()](#m-ConfBinary-d2daaf68204b)
- [ConfBinary(byte[])](#m-ConfBinary-ce545a4e4b60)
- [ConfBinary(ConfEObject)](#m-ConfBinary-f164ddf2674a)
- [ConfBinary(String)](#m-ConfBinary-30e96d078ce3)

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
- [val](#m-val)

**Methods**:

- [bytesValue()](#m-bytesValue-5430ca82d2de)
- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [compareTo(ConfBinary)](#m-compareTo-58d210e19aa1)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getStringByValue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getStringByValue-8ed173dcf8dc) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#m-getValueByString-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getValueByString-7804643cb027) from ConfValue
- [hashCode()](#m-hashCode-ef797a217903)
- [setCSType(CSType)](#m-setCSType-1d9af222b932)
- [toHexListString()](#m-toHexListString-b8ab9a901cf8)
- [toOctetListString()](#m-toOctetListString-4e8899a4fa5c)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfBinary() <a href="#m-ConfBinary-d2daaf68204b" id="m-ConfBinary-d2daaf68204b"></a>

```java
protected ConfBinary()
```

### ConfBinary(byte[]) <a href="#m-ConfBinary-ce545a4e4b60" id="m-ConfBinary-ce545a4e4b60"></a>

```java
public ConfBinary(byte[] bytes)
```

**Parameters**

- `byte[] bytes`

### ConfBinary(ConfEObject) <a href="#m-ConfBinary-f164ddf2674a" id="m-ConfBinary-f164ddf2674a"></a>

```java
public ConfBinary(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfBinary(String) <a href="#m-ConfBinary-30e96d078ce3" id="m-ConfBinary-30e96d078ce3"></a>

```java
public ConfBinary(String str)
```

**Parameters**

- `String str`


## Fields

### val <a href="#m-val" id="m-val"></a>

```java
protected byte[] val = null;
```


## Methods

### bytesValue() <a href="#m-bytesValue-5430ca82d2de" id="m-bytesValue-5430ca82d2de"></a>

```java
public byte[] bytesValue()
```

### compareTo(ConfBinary) <a href="#m-compareTo-58d210e19aa1" id="m-compareTo-58d210e19aa1"></a>

```java
public int compareTo(com.tailf.conf.ConfBinary o)
```

Types: [ConfBinary](ConfBinary.md#cls-ConfBinary)

**Parameters**

- `com.tailf.conf.ConfBinary o`

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

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### setCSType(CSType) <a href="#m-setCSType-1d9af222b932" id="m-setCSType-1d9af222b932"></a>

```java
public void setCSType(com.tailf.maapi.MaapiSchemas.CSType csType)
```

Types: [CSType](../maapi/MaapiSchemas/CSType.md#cls-CSType)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType csType`

### toHexListString() <a href="#m-toHexListString-b8ab9a901cf8" id="m-toHexListString-b8ab9a901cf8"></a>

```java
public String toHexListString()
```

Formats the Binary as a tailf:hex-list string.

### toOctetListString() <a href="#m-toOctetListString-4e8899a4fa5c" id="m-toOctetListString-4e8899a4fa5c"></a>

```java
public String toOctetListString()
```

Formats the Binary as a tailf::octet-list string.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
