<a id="cls-ConfBits"></a>
# ConfBits

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

- [ConfBits()](#m-confbits-0be881152ad1)
- [ConfBits(byte[])](#m-confbits-94ed0a76778e)
- [ConfBits(String)](#m-confbits-0902dfad5c0c)

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

- [byteArrayValue()](#m-bytearrayvalue-2e0fef980288)
- [clearBit(long)](#m-clearbit-5db4b507737e)
- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [compareTo(ConfBits)](#m-compareto-66b77461fdc7)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](ConfValue.md#m-encode-fbae522bba37) from ConfValue
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getBitNamesByValue(ConfPath, ConfBits)](#m-getbitnamesbyvalue-3ba6b28839a1)
- [getBitNamesByValue(String, ConfBits)](#m-getbitnamesbyvalue-c649f67dc799)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getValueByBitNamesString(ConfPath, String)](#m-getvaluebybitnamesstring-12ca247b9d9d)
- [getValueByBitNamesString(String, String)](#m-getvaluebybitnamesstring-c0e8ef407b4c)
- [getValueByString(ConfPath, String)](ConfValue.md#m-getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getvaluebystring-7804643cb027) from ConfValue
- [hashCode()](#m-hashcode-ef797a217903)
- [isBitSet(long)](#m-isbitset-a18cae1da74b)
- [isBitSetSafe(long)](#m-isbitsetsafe-dbd99a7b4cbe)
- [setBit(long)](#m-setbit-ca27ab33dd5d)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confbits-0be881152ad1"></a>
### ConfBits()

```java
protected ConfBits()
```

<a id="m-confbits-94ed0a76778e"></a>
### ConfBits(byte[])

```java
protected ConfBits(byte[] val)
```

Construct a bitset value from a byte array with the bytes in
 little endian order

**Parameters**

- `byte[] val`

<a id="m-confbits-0902dfad5c0c"></a>
### ConfBits(String)

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

<a id="m-val"></a>
### val

```java
protected byte[] val = null;
```


## Methods

<a id="m-bytearrayvalue-2e0fef980288"></a>
### byteArrayValue()

```java
public byte[] byteArrayValue()
```

Get byte array representing this bitset in little endian order.

**Returns:** little endian byte array of this bitset

<a id="m-clearbit-5db4b507737e"></a>
### clearBit(long)

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

<a id="m-compareto-66b77461fdc7"></a>
### compareTo(ConfBits)

```java
public int compareTo(com.tailf.conf.ConfBits o)
```

Types: [ConfBits](ConfBits.md#cls-ConfBits)

CompareTo method

**Parameters**

- `com.tailf.conf.ConfBits o`

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Equals method

**Parameters**

- `Object o`

<a id="m-getbitnamesbyvalue-3ba6b28839a1"></a>
### getBitNamesByValue(ConfPath, ConfBits)

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

<a id="m-getbitnamesbyvalue-c649f67dc799"></a>
### getBitNamesByValue(String, ConfBits)

```java
public static String getBitNamesByValue(
    String path,
    com.tailf.conf.ConfBits bits
)
    throws com.tailf.conf.ConfException
```

Types: [ConfBits](ConfBits.md#cls-ConfBits), [ConfException](ConfException.md#cls-ConfException)

Like `ConfPath#getBitNamesByValue(ConfPath, ConfBits)` but takes a path
 string pointing to the bitset in the schema.

**Parameters**

- `String path` - String pointing to the position of a bitset in the schema.
- `com.tailf.conf.ConfBits bits` - ConfBits value

**Returns:** String of bitNames

**Throws**

- `ConfException`

<a id="m-getvaluebybitnamesstring-12ca247b9d9d"></a>
### getValueByBitNamesString(ConfPath, String)

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

<a id="m-getvaluebybitnamesstring-c0e8ef407b4c"></a>
### getValueByBitNamesString(String, String)

```java
public static com.tailf.conf.ConfBits getValueByBitNamesString(
    String path,
    String bitNames
)
    throws com.tailf.conf.ConfException
```

Types: [ConfBits](ConfBits.md#cls-ConfBits), [ConfException](ConfException.md#cls-ConfException)

Like `ConfPath#getValueByBitNamesString(ConfPath, String)` but takes a path
 string pointing to the bitset in the schema.

**Parameters**

- `String path` - String pointing to the position of a bitset in the schema.
- `String bitNames` - String of space separated bit names

**Returns:** ConfBits value

**Throws**

- `ConfException`

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

hashCode method

<a id="m-isbitset-a18cae1da74b"></a>
### isBitSet(long)

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

<a id="m-isbitsetsafe-dbd99a7b4cbe"></a>
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

<a id="m-setbit-ca27ab33dd5d"></a>
### setBit(long)

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

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

toString method. The string representation for bitset is
 'bin0x...' with hexadecimal representation in little endian order
