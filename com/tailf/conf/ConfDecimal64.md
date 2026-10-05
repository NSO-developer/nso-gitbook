<a id="cls-ConfDecimal64"></a>
# ConfDecimal64

```java
public class com.tailf.conf.ConfDecimal64
    extends com.tailf.conf.ConfInt64
```

Types: [ConfInt64](ConfInt64.md#cls-ConfInt64)

DATA_CONTAINER - Corresponds to the YANG decimal64 type.

## Members

**Constructors**:

- [ConfDecimal64(BigInteger, int)](#m-confdecimal64-a91060f8ec9e)
- [ConfDecimal64(ConfEObject)](#m-confdecimal64-83ea193341e4)
- [ConfDecimal64(long, int)](#m-confdecimal64-3eba51d88b6b)
- [ConfDecimal64(String)](#m-confdecimal64-f1993d5ec278)

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
- [val](ConfInt64.md#m-val) from ConfInt64

**Methods**:

- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [compareTo(ConfInt64)](ConfInt64.md#m-compareto-41b235eb3af1) from ConfInt64
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [doubleValue()](#m-doublevalue-aea67f67de5a)
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getFractionDigits()](#m-getfractiondigits-57dce19c4ffe)
- [getLongDataBackstore()](#m-getlongdatabackstore-c6f76b0fb2d0)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#m-getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getvaluebystring-7804643cb027) from ConfValue
- [hashCode()](#m-hashcode-ef797a217903)
- [intValue()](#m-intvalue-2f745d025d8e)
- [longValue()](ConfInt64.md#m-longvalue-636bfe2d6862) from ConfInt64
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confdecimal64-a91060f8ec9e"></a>
### ConfDecimal64(BigInteger, int)

```java
public ConfDecimal64(java.math.BigInteger b, int fractionDigits)
```

**Parameters**

- `java.math.BigInteger b`
- `int fractionDigits`

<a id="m-confdecimal64-83ea193341e4"></a>
### ConfDecimal64(ConfEObject)

```java
public ConfDecimal64(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="m-confdecimal64-3eba51d88b6b"></a>
### ConfDecimal64(long, int)

```java
public ConfDecimal64(long l, int fractionDigits)
```

**Parameters**

- `long l`
- `int fractionDigits`

<a id="m-confdecimal64-f1993d5ec278"></a>
### ConfDecimal64(String)

```java
public ConfDecimal64(String str)
```

**Parameters**

- `String str`


## Methods

<a id="m-doublevalue-aea67f67de5a"></a>
### doubleValue()

```java
public double doubleValue()
```

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="m-getfractiondigits-57dce19c4ffe"></a>
### getFractionDigits()

```java
public int getFractionDigits()
```

<a id="m-getlongdatabackstore-c6f76b0fb2d0"></a>
### getLongDataBackstore()

```java
public long getLongDataBackstore()
```

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-intvalue-2f745d025d8e"></a>
### intValue()

```java
public long intValue()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
