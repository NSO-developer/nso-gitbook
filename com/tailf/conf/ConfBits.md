# ConfBits <a href="#cls-ConfBits" id="cls-ConfBits"></a>

```java
public abstract class com.tailf.conf.ConfBits
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfBits>
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfBits](ConfBits.md#cls-ConfBits)

DATA_CONTAINER - This is the superclass for all bits types i.e.
 ConfBit32, ConfBit64 and ConfBitBig.

**Related classes**

- [ConfBit32](ConfBit32.md#cls-ConfBit32)
- [ConfBit64](ConfBit64.md#cls-ConfBit64)
- [ConfBitBig](ConfBitBig.md#cls-ConfBitBig)

## Members

**Constructors**:

- [ConfBits()](#m-ConfBits-0be881152ad1)
- [ConfBits(byte[])](#m-ConfBits-94ed0a76778e)
- [ConfBits(String)](#m-ConfBits-0902dfad5c0c)

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

- [byteArrayValue()](#m-byteArrayValue-2e0fef980288)
- [clearBit(long)](#m-clearBit-5db4b507737e)
- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [compareTo(ConfBits)](#m-compareTo-66b77461fdc7)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](ConfValue.md#m-encode-fbae522bba37) from ConfValue
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getBitNamesByValue(ConfPath, ConfBits)](#m-getBitNamesByValue-3ba6b28839a1)
- [getBitNamesByValue(String, ConfBits)](#m-getBitNamesByValue-c649f67dc799)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getStringByValue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getStringByValue-8ed173dcf8dc) from ConfValue
- [getValueByBitNamesString(ConfPath, String)](#m-getValueByBitNamesString-12ca247b9d9d)
- [getValueByBitNamesString(String, String)](#m-getValueByBitNamesString-c0e8ef407b4c)
- [getValueByString(ConfPath, String)](ConfValue.md#m-getValueByString-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getValueByString-7804643cb027) from ConfValue
- [hashCode()](#m-hashCode-ef797a217903)
- [isBitSet(long)](#m-isBitSet-a18cae1da74b)
- [isBitSetSafe(long)](#m-isBitSetSafe-dbd99a7b4cbe)
- [setBit(long)](#m-setBit-ca27ab33dd5d)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfBits() <a href="#m-ConfBits-0be881152ad1" id="m-ConfBits-0be881152ad1"></a>

```java
protected ConfBits()
```

### ConfBits(byte[]) <a href="#m-ConfBits-94ed0a76778e" id="m-ConfBits-94ed0a76778e"></a>

```java
protected ConfBits(byte[] val)
```

Construct a bitset value from a byte array with the bytes in
 little endian order

**Parameters**

- `byte[] val`

### ConfBits(String) <a href="#m-ConfBits-0902dfad5c0c" id="m-ConfBits-0902dfad5c0c"></a>

```java
protected ConfBits(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

String constructor for ConfBitBig.
 The string representation is expected to be 'bin0x...>'
 with the hexadecimal representation of the bitset in little endian order.

**Parameters**

- `String str`

**Throws**

- `ConfException`


## Fields

### val <a href="#m-val" id="m-val"></a>

```java
protected byte[] val = null;
```


## Methods

### byteArrayValue() <a href="#m-byteArrayValue-2e0fef980288" id="m-byteArrayValue-2e0fef980288"></a>

```java
public byte[] byteArrayValue()
```

Get byte array representing this bitset in little endian order.

**Returns:** little endian byte array of this bitset

### clearBit(long) <a href="#m-clearBit-5db4b507737e" id="m-clearBit-5db4b507737e"></a>

```java
public void clearBit(long pos) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Clear bit at position pos in bitset. The bitset must initially been
 created with a maxposition higher or equal to pos or else
 an ConfException is thrown.

**Parameters**

- `long pos` - Bit position to clear.

**Throws**

- `ConfException`

### compareTo(ConfBits) <a href="#m-compareTo-66b77461fdc7" id="m-compareTo-66b77461fdc7"></a>

```java
public int compareTo(com.tailf.conf.ConfBits o)
```

Types: [ConfBits](ConfBits.md#cls-ConfBits)

CompareTo method

**Parameters**

- `com.tailf.conf.ConfBits o`

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Equals method

**Parameters**

- `Object o`

### getBitNamesByValue(ConfPath, ConfBits) <a href="#m-getBitNamesByValue-3ba6b28839a1" id="m-getBitNamesByValue-3ba6b28839a1"></a>

```java
public static String getBitNamesByValue(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.ConfBits bits
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfBits](ConfBits.md#cls-ConfBits), [ConfException](ConfException.md#cls-ConfException)

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

### getBitNamesByValue(String, ConfBits) <a href="#m-getBitNamesByValue-c649f67dc799" id="m-getBitNamesByValue-c649f67dc799"></a>

```java
public static String getBitNamesByValue(
    String path,
    com.tailf.conf.ConfBits bits
)
    throws com.tailf.conf.ConfException
```

Types: [ConfBits](ConfBits.md#cls-ConfBits), [ConfException](ConfException.md#cls-ConfException)

Like `getBitNamesByValue(ConfPath, ConfBits)` but takes a path
 string pointing to the bitset in the schema.

**Parameters**

- `String path` - String pointing to the position of a bitset in the schema.
- `com.tailf.conf.ConfBits bits` - ConfBits value

**Returns:** String of bitNames

**Throws**

- `ConfException`

### getValueByBitNamesString(ConfPath, String) <a href="#m-getValueByBitNamesString-12ca247b9d9d" id="m-getValueByBitNamesString-12ca247b9d9d"></a>

```java
public static com.tailf.conf.ConfBits getValueByBitNamesString(
    com.tailf.conf.ConfPath path,
    String bitNames
)
    throws com.tailf.conf.ConfException
```

Types: [ConfBits](ConfBits.md#cls-ConfBits), [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

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

### getValueByBitNamesString(String, String) <a href="#m-getValueByBitNamesString-c0e8ef407b4c" id="m-getValueByBitNamesString-c0e8ef407b4c"></a>

```java
public static com.tailf.conf.ConfBits getValueByBitNamesString(
    String path,
    String bitNames
)
    throws com.tailf.conf.ConfException
```

Types: [ConfBits](ConfBits.md#cls-ConfBits), [ConfException](ConfException.md#cls-ConfException)

Like `getValueByBitNamesString(ConfPath, String)` but takes a path
 string pointing to the bitset in the schema.

**Parameters**

- `String path` - String pointing to the position of a bitset in the schema.
- `String bitNames` - String of space separated bit names

**Returns:** ConfBits value

**Throws**

- `ConfException`

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

hashCode method

### isBitSet(long) <a href="#m-isBitSet-a18cae1da74b" id="m-isBitSet-a18cae1da74b"></a>

```java
public boolean isBitSet(long pos) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Check if bit is set at position pos in bitset.
 The bitset must initially been
 created with a maxposition higher or equal to pos or else
 an ConfException is thrown.

**Parameters**

- `long pos` - Bit position to check.

**Returns:** boolean true if bit is set.

**Throws**

- `ConfException` - Never, for API backwards compatibility.

### isBitSetSafe(long) <a href="#m-isBitSetSafe-dbd99a7b4cbe" id="m-isBitSetSafe-dbd99a7b4cbe"></a>

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

### setBit(long) <a href="#m-setBit-ca27ab33dd5d" id="m-setBit-ca27ab33dd5d"></a>

```java
public void setBit(long pos) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Set bit at position pos in bitset. The bitset must initially been
 created with a maxposition higher or equal to pos or else
 an ConfException is thrown.

**Parameters**

- `long pos` - Bit position to set.

**Throws**

- `ConfException`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

toString method. The string representation for bitset is
 'bin0x...' with hexadecimal representation in little endian order
