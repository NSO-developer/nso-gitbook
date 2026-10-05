<a id="s-ConfBit64"></a>
# ConfBit64

```java
public class com.tailf.conf.ConfBit64
    extends com.tailf.conf.ConfBits
```

Types: [ConfBits](ConfBits.md#s-ConfBits)

DATA_CONTAINER - Corresponds to the YANG bit64 type. A bitset with no bit
 position higher that 63

## Members

**Constructors**:

- [ConfBit64(BigInteger)](#s-ConfBit64-1)
- [ConfBit64(byte[])](#s-ConfBit64-2)
- [ConfBit64(ConfEObject)](#s-ConfBit64-3)
- [ConfBit64(long)](#s-ConfBit64-4)
- [ConfBit64(String)](#s-ConfBit64-5)

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
- [val](ConfBits.md#s-val) from ConfBits

**Methods**:

- [bigEndianByteArray()](ConfBits.md#s-bigEndianByteArray) from ConfBits
- [bigValue()](#s-bigValue)
- [byteArrayValue()](ConfBits.md#s-byteArrayValue) from ConfBits
- [clearBit(long)](ConfBits.md#s-clearBit) from ConfBits
- [clone()](ConfObject.md#s-clone) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#s-compare) from ConfObject
- [compareTo(ConfBits)](ConfBits.md#s-compareTo) from ConfBits
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [getBigInt()](ConfBits.md#s-getBigInt) from ConfBits
- [getBitNamesByValue(ConfPath, ConfBits)](ConfBits.md#s-getBitNamesByValue) from ConfBits
- [getBitNamesByValue(String, ConfBits)](ConfBits.md#s-getBitNamesByValue-1) from ConfBits
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByBitNamesString(ConfPath, String)](ConfBits.md#s-getValueByBitNamesString) from ConfBits
- [getValueByBitNamesString(String, String)](ConfBits.md#s-getValueByBitNamesString-1) from ConfBits
- [getValueByString(ConfPath, String)](ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](ConfValue.md#s-getValueByString-1) from ConfValue
- [hashCode()](#s-hashCode)
- [isBitSet(long)](ConfBits.md#s-isBitSet) from ConfBits
- [isBitSetSafe(long)](ConfBits.md#s-isBitSetSafe) from ConfBits
- [reverseByteArray(byte[], boolean)](ConfBits.md#s-reverseByteArray) from ConfBits
- [setBit(long)](ConfBits.md#s-setBit) from ConfBits
- [toString()](ConfBits.md#s-toString) from ConfBits

## Constructors

<a id="s-ConfBit64-1"></a>
### ConfBit64(BigInteger)

```java
public ConfBit64(java.math.BigInteger bigint)
```

Construct a ConfBit64 value from a BigInteger representing the bits

**Parameters**

- `java.math.BigInteger bigint`

<a id="s-ConfBit64-2"></a>
### ConfBit64(byte[])

```java
public ConfBit64(byte[] val)
```

Construct a ConfBit64 value from a byte array with the bytes in
 little endian order

**Parameters**

- `byte[] val`

<a id="s-ConfBit64-3"></a>
### ConfBit64(ConfEObject)

```java
public ConfBit64(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

**Throws**

- `ConfException`

<a id="s-ConfBit64-4"></a>
### ConfBit64(long)

```java
public ConfBit64(long l)
```

Construct a Confbit64 value from a long representing the bits

**Parameters**

- `long l`

<a id="s-ConfBit64-5"></a>
### ConfBit64(String)

```java
public ConfBit64(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

String constructor for ConfBit64.
 The string representation is expected to be 'bin0x...'
 with the hexadecimal representation of the bitset in little endian order.

**Parameters**

- `String str`

**Throws**

- `ConfException`


## Methods

<a id="s-bigValue"></a>
### bigValue()

```java
public java.math.BigInteger bigValue()
```

Return a BigInteger representing this bitset.

**Returns:** BigInteger

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

Equals method for ConfBit64

**Parameters**

- `Object o`

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

hashCode method for ConfBit64
