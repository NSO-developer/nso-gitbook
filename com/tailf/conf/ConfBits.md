<a id="s-ConfBits"></a>
# ConfBits

```java
public abstract class com.tailf.conf.ConfBits
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfBits>
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfBits](ConfBits.md#s-ConfBits)

DATA_CONTAINER - This is the superclass for all bits types i.e.
 ConfBit32, ConfBit64 and ConfBitBig.

**Related classes**

- [ConfBit32](ConfBit32.md#s-ConfBit32)
- [ConfBit64](ConfBit64.md#s-ConfBit64)
- [ConfBitBig](ConfBitBig.md#s-ConfBitBig)

## Members

**Constructors**:

- [ConfBits()](#s-ConfBits-1)
- [ConfBits(byte[])](#s-ConfBits-2)
- [ConfBits(String)](#s-ConfBits-3)

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

- [bigEndianByteArray()](#s-bigEndianByteArray)
- [byteArrayValue()](#s-byteArrayValue)
- [clearBit(long)](#s-clearBit)
- [clone()](ConfObject.md#s-clone) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#s-compare) from ConfObject
- [compareTo(ConfBits)](#s-compareTo)
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [getBigInt()](#s-getBigInt)
- [getBitNamesByValue(ConfPath, ConfBits)](#s-getBitNamesByValue)
- [getBitNamesByValue(String, ConfBits)](#s-getBitNamesByValue-1)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByBitNamesString(ConfPath, String)](#s-getValueByBitNamesString)
- [getValueByBitNamesString(String, String)](#s-getValueByBitNamesString-1)
- [getValueByString(ConfPath, String)](ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](ConfValue.md#s-getValueByString-1) from ConfValue
- [hashCode()](#s-hashCode)
- [isBitSet(long)](#s-isBitSet)
- [isBitSetSafe(long)](#s-isBitSetSafe)
- [reverseByteArray(byte[], boolean)](#s-reverseByteArray)
- [setBit(long)](#s-setBit)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfBits-1"></a>
### ConfBits()

```java
protected ConfBits()
```

<a id="s-ConfBits-2"></a>
### ConfBits(byte[])

```java
protected ConfBits(byte[] val)
```

Construct a bitset value from a byte array with the bytes in
 little endian order

**Parameters**

- `byte[] val`

<a id="s-ConfBits-3"></a>
### ConfBits(String)

```java
protected ConfBits(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

String constructor for ConfBitBig.
 The string representation is expected to be 'bin0x...>'
 with the hexadecimal representation of the bitset in little endian order.

**Parameters**

- `String str`

**Throws**

- `ConfException`


## Fields

<a id="s-val"></a>
### val

```java
protected byte[] val = null;
```


## Methods

<a id="s-bigEndianByteArray"></a>
### bigEndianByteArray()

```java
protected byte[] bigEndianByteArray()
```

**Returns:** big endian byte array of this bitset

<a id="s-byteArrayValue"></a>
### byteArrayValue()

```java
public byte[] byteArrayValue()
```

Get byte array representing this bitset in little endian order.

**Returns:** little endian byte array of this bitset

<a id="s-clearBit"></a>
### clearBit(long)

```java
public void clearBit(long pos) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Clear bit at position pos in bitset. The bitset must initially been
 created with a maxposition higher or equal to pos or else
 an ConfException is thrown.

**Parameters**

- `long pos` - Bit position to clear.

**Throws**

- `ConfException`

<a id="s-compareTo"></a>
### compareTo(ConfBits)

```java
public int compareTo(com.tailf.conf.ConfBits o)
```

Types: [ConfBits](ConfBits.md#s-ConfBits)

CompareTo method

**Parameters**

- `com.tailf.conf.ConfBits o`

<a id="s-encode"></a>
### encode()

```java
public abstract com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Equals method

**Parameters**

- `Object o`

<a id="s-getBigInt"></a>
### getBigInt()

```java
protected java.math.BigInteger getBigInt()
```

**Returns:** BigInteger representing this bitset

<a id="s-getBitNamesByValue"></a>
### getBitNamesByValue(ConfPath, ConfBits)

```java
public static String getBitNamesByValue(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.ConfBits bits
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#s-ConfPath), [ConfBits](ConfBits.md#s-ConfBits), [ConfException](ConfException.md#s-ConfException)

Get a string of bitnames like  bitnames like "bit1 bit2 ...", i.e
 a space separated list of bitnames from a ConfBits value.
 The value needs to adhering to a specific position in
 the schema.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath pointing to the position of a bitset in the schema.
- `com.tailf.conf.ConfBits bits` - ConfBits value

**Returns:** String of bitNames

**Throws**

- `ConfException`

<a id="s-getBitNamesByValue-1"></a>
### getBitNamesByValue(String, ConfBits)

```java
public static String getBitNamesByValue(
    String path,
    com.tailf.conf.ConfBits bits
)
    throws com.tailf.conf.ConfException
```

Types: [ConfBits](ConfBits.md#s-ConfBits), [ConfException](ConfException.md#s-ConfException)

Like [`ConfPath`](ConfPath.md#s-ConfPath) but takes a path
 string pointing to the bitset in the schema.

**Parameters**

- `String path` - String pointing to the position of a bitset in the schema.
- `com.tailf.conf.ConfBits bits` - ConfBits value

**Returns:** String of bitNames

**Throws**

- `ConfException`

<a id="s-getValueByBitNamesString"></a>
### getValueByBitNamesString(ConfPath, String)

```java
public static com.tailf.conf.ConfBits getValueByBitNamesString(
    com.tailf.conf.ConfPath path,
    String bitNames
)
    throws com.tailf.conf.ConfException
```

Types: [ConfBits](ConfBits.md#s-ConfBits), [ConfPath](ConfPath.md#s-ConfPath), [ConfException](ConfException.md#s-ConfException)

Get an ConfBits from the string of bitnames like "bit1 bit2 ...", i.e
 a space separated list of bitnames adhering to a specific position in
 the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath pointing to the position of a bitset in the schema.
- `String bitNames` - String of space separated bit names

**Returns:** ConfBits value

**Throws**

- `ConfException`

<a id="s-getValueByBitNamesString-1"></a>
### getValueByBitNamesString(String, String)

```java
public static com.tailf.conf.ConfBits getValueByBitNamesString(
    String path,
    String bitNames
)
    throws com.tailf.conf.ConfException
```

Types: [ConfBits](ConfBits.md#s-ConfBits), [ConfException](ConfException.md#s-ConfException)

Like [`ConfPath`](ConfPath.md#s-ConfPath) but takes a path
 string pointing to the bitset in the schema.

**Parameters**

- `String path` - String pointing to the position of a bitset in the schema.
- `String bitNames` - String of space separated bit names

**Returns:** ConfBits value

**Throws**

- `ConfException`

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

hashCode method

<a id="s-isBitSet"></a>
### isBitSet(long)

```java
public boolean isBitSet(long pos) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Check if bit is set at position pos in bitset.
 The bitset must initially been
 created with a maxposition higher or equal to pos or else
 an ConfException is thrown.

**Parameters**

- `long pos` - Bit position to check.

**Returns:** boolean true if bit is set.

**Throws**

- `ConfException` - Never, for API backwards compatibility.

<a id="s-isBitSetSafe"></a>
### isBitSetSafe(long)

```java
public boolean isBitSetSafe(long pos)
```

Check if bit is set at position pos in bitset.
 The bitset must initially been
 created with a maxposition higher or equal to pos or else
 an ConfException is thrown.

**Parameters**

- `long pos` - Bit position to check.

**Returns:** boolean true if bit is set.

<a id="s-reverseByteArray"></a>
### reverseByteArray(byte[], boolean)

```java
protected static final byte[] reverseByteArray(byte[] b, boolean trim)
```

**Parameters**

- `byte[] b`
- `boolean trim`

**Returns:** reverse of `a`

<a id="s-setBit"></a>
### setBit(long)

```java
public void setBit(long pos) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Set bit at position pos in bitset. The bitset must initially been
 created with a maxposition higher or equal to pos or else
 an ConfException is thrown.

**Parameters**

- `long pos` - Bit position to set.

**Throws**

- `ConfException`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

toString method. The string representation for bitset is
 'bin0x...' with hexadecimal representation in little endian order
