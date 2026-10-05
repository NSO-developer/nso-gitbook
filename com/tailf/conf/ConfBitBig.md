# ConfBitBig <a href="#cls-ConfBitBig" id="cls-ConfBitBig"></a>

```java
public class com.tailf.conf.ConfBitBig
    extends com.tailf.conf.ConfBits
```

Types: [ConfBits](ConfBits.md#cls-ConfBits)

DATA_CONTAINER - Corresponds to the YANG bits type, where bit position
 exceed 63.

## Members

**Constructors**:

- [ConfBitBig(byte[])](#m-ConfBitBig-4a7d08fe4b8e)
- [ConfBitBig(String)](#m-ConfBitBig-91d856be8c05)

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
- [val](ConfBits.md#m-val) from ConfBits

**Methods**:

- [byteArrayValue()](ConfBits.md#m-byteArrayValue-2e0fef980288) from ConfBits
- [clearBit(long)](ConfBits.md#m-clearBit-5db4b507737e) from ConfBits
- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [compareTo(ConfBits)](ConfBits.md#m-compareTo-66b77461fdc7) from ConfBits
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](ConfValue.md#m-encode-fbae522bba37) from ConfValue
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getBitNamesByValue(ConfPath, ConfBits)](ConfBits.md#m-getBitNamesByValue-3ba6b28839a1) from ConfBits
- [getBitNamesByValue(String, ConfBits)](ConfBits.md#m-getBitNamesByValue-c649f67dc799) from ConfBits
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getStringByValue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getStringByValue-8ed173dcf8dc) from ConfValue
- [getValueByBitNamesString(ConfPath, String)](ConfBits.md#m-getValueByBitNamesString-12ca247b9d9d) from ConfBits
- [getValueByBitNamesString(String, String)](ConfBits.md#m-getValueByBitNamesString-c0e8ef407b4c) from ConfBits
- [getValueByString(ConfPath, String)](ConfValue.md#m-getValueByString-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getValueByString-7804643cb027) from ConfValue
- [hashCode()](#m-hashCode-ef797a217903)
- [isBitSet(long)](ConfBits.md#m-isBitSet-a18cae1da74b) from ConfBits
- [isBitSetSafe(long)](ConfBits.md#m-isBitSetSafe-dbd99a7b4cbe) from ConfBits
- [setBit(long)](ConfBits.md#m-setBit-ca27ab33dd5d) from ConfBits
- [toString()](ConfBits.md#m-toString-e9d48c5503ef) from ConfBits

## Constructors

### ConfBitBig(byte[]) <a href="#m-ConfBitBig-4a7d08fe4b8e" id="m-ConfBitBig-4a7d08fe4b8e"></a>

```java
public ConfBitBig(byte[] val)
```

Construct a ConfBitBig value from a byte array with the bytes in
 little endian order

**Parameters**

- `byte[] val`

### ConfBitBig(String) <a href="#m-ConfBitBig-91d856be8c05" id="m-ConfBitBig-91d856be8c05"></a>

```java
public ConfBitBig(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

String constructor for ConfBitBig.
 The string representation is expected to be 'bin0x...'
 with the hexadecimal representation of the bitset in little endian order.

**Parameters**

- `String str`

**Throws**

- `ConfException`


## Methods

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Equals method for ConfBitBig

**Parameters**

- `Object o`

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

hashCode method for ConfBitBig
