# ConfBits <a href="#confbits-fa772b723e51" id="confbits-fa772b723e51"></a>

```java
public abstract class com.tailf.conf.ConfBits
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfBits>
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d), [ConfBits](ConfBits.md#confbits-fa772b723e51)

DATA_CONTAINER - This is the superclass for all bits types i.e.
 ConfBit32, ConfBit64 and ConfBitBig.

**Related classes**

- [ConfBit32](ConfBit32.md#confbit32-ce32a7d3e924)
- [ConfBit64](ConfBit64.md#confbit64-1837aeb3d331)
- [ConfBitBig](ConfBitBig.md#confbitbig-bae7e7d1d299)

## Members

**Constructors**:

- [ConfBits()](#confbits-0be881152ad1)
- [ConfBits(byte[])](#confbits-94ed0a76778e)
- [ConfBits(String)](#confbits-0902dfad5c0c)

**Fields**:

- [J_BINARY](ConfObject.md#j_binary-f4395337afc2) from ConfObject
- [J_BIT32](ConfObject.md#j_bit32-40251205e2bd) from ConfObject
- [J_BIT64](ConfObject.md#j_bit64-15d68e666b90) from ConfObject
- [J_BITBIG](ConfObject.md#j_bitbig-835affd18d2b) from ConfObject
- [J_BOOL](ConfObject.md#j_bool-fa62aa9e1544) from ConfObject
- [J_BUF](ConfObject.md#j_buf-d1b0b08b798f) from ConfObject
- [J_CDBBEGIN](ConfObject.md#j_cdbbegin-07a4f9eca5c4) from ConfObject
- [J_DATE](ConfObject.md#j_date-00cc8f6e70e6) from ConfObject
- [J_DATETIME](ConfObject.md#j_datetime-573fe6a9a577) from ConfObject
- [J_DECIMAL64](ConfObject.md#j_decimal64-ff02afe47ff7) from ConfObject
- [J_DEFAULT](ConfObject.md#j_default-54b54b027809) from ConfObject
- [J_DOUBLE](ConfObject.md#j_double-ade902bbb1aa) from ConfObject
- [J_DQUAD](ConfObject.md#j_dquad-852ab4ec2848) from ConfObject
- [J_DURATION](ConfObject.md#j_duration-98ef58bed1c0) from ConfObject
- [J_EMPTY](ConfObject.md#j_empty-cca63c6cd2c7) from ConfObject
- [J_ENUMERATION](ConfObject.md#j_enumeration-47c69754d29b) from ConfObject
- [J_HEXSTR](ConfObject.md#j_hexstr-90b6b86efe7b) from ConfObject
- [J_IDENTITYREF](ConfObject.md#j_identityref-977d471383c5) from ConfObject
- [J_INSTANCE_IDENTIFIER](ConfObject.md#j_instance_identifier-bbb4b8e5e954) from ConfObject
- [J_INT16](ConfObject.md#j_int16-4f9df234cba7) from ConfObject
- [J_INT32](ConfObject.md#j_int32-db4c66331284) from ConfObject
- [J_INT64](ConfObject.md#j_int64-c290a7cb2e11) from ConfObject
- [J_INT8](ConfObject.md#j_int8-8f73ffef0f12) from ConfObject
- [J_IPV4](ConfObject.md#j_ipv4-54fdc3efb49b) from ConfObject
- [J_IPV4_AND_PLEN](ConfObject.md#j_ipv4_and_plen-69b1e630ab12) from ConfObject
- [J_IPV4PREFIX](ConfObject.md#j_ipv4prefix-d36121ba89ca) from ConfObject
- [J_IPV6](ConfObject.md#j_ipv6-03903b354701) from ConfObject
- [J_IPV6_AND_PLEN](ConfObject.md#j_ipv6_and_plen-ac1054abbf31) from ConfObject
- [J_IPV6PREFIX](ConfObject.md#j_ipv6prefix-5e95c6e896d2) from ConfObject
- [J_LIST](ConfObject.md#j_list-d74b9f073fdc) from ConfObject
- [J_NOEXISTS](ConfObject.md#j_noexists-1f0f9b7a9591) from ConfObject
- [J_OBJECTREF](ConfObject.md#j_objectref-577d14956cc8) from ConfObject
- [J_OID](ConfObject.md#j_oid-2d504f7432b3) from ConfObject
- [J_PTR](ConfObject.md#j_ptr-ef54b9484cab) from ConfObject
- [J_QNAME](ConfObject.md#j_qname-0d2839adff4c) from ConfObject
- [J_STR](ConfObject.md#j_str-ae3bb3034983) from ConfObject
- [J_SYMBOL](ConfObject.md#j_symbol-25fd3742c374) from ConfObject
- [J_TIME](ConfObject.md#j_time-3ecdebfb0af5) from ConfObject
- [J_UINT16](ConfObject.md#j_uint16-1f95eafb4126) from ConfObject
- [J_UINT32](ConfObject.md#j_uint32-200f00c0ee05) from ConfObject
- [J_UINT64](ConfObject.md#j_uint64-6960c783d61f) from ConfObject
- [J_UINT8](ConfObject.md#j_uint8-ab0567c53d7f) from ConfObject
- [J_UNION](ConfObject.md#j_union-7c548945cda0) from ConfObject
- [J_XMLBEGIN](ConfObject.md#j_xmlbegin-6b887ec4c61b) from ConfObject
- [J_XMLBEGINDEL](ConfObject.md#j_xmlbegindel-6c4d37088d90) from ConfObject
- [J_XMLEND](ConfObject.md#j_xmlend-e2b443858058) from ConfObject
- [J_XMLMOVEAFTER](ConfObject.md#j_xmlmoveafter-e7f2fed6d94d) from ConfObject
- [J_XMLMOVEFIRST](ConfObject.md#j_xmlmovefirst-776c36719f23) from ConfObject
- [J_XMLTAG](ConfObject.md#j_xmltag-0a12f537271e) from ConfObject
- [val](#val-a02e160da60f)

**Methods**:

- [byteArrayValue()](#bytearrayvalue-2e0fef980288)
- [clearBit(long)](#clearbit-5db4b507737e)
- [clone()](ConfObject.md#clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#compare-e78552baa2bf) from ConfObject
- [compareTo(ConfBits)](#compareto-66b77461fdc7)
- [decode(ConfEObject)](ConfObject.md#decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#decode-9b92f1de40d8) from ConfObject
- [encode()](ConfValue.md#encode-fbae522bba37) from ConfValue
- [equals(Object)](#equals-fcd6492e0d6c)
- [getBitNamesByValue(ConfPath, ConfBits)](#getbitnamesbyvalue-3ba6b28839a1)
- [getBitNamesByValue(String, ConfBits)](#getbitnamesbyvalue-c649f67dc799)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getValueByBitNamesString(ConfPath, String)](#getvaluebybitnamesstring-12ca247b9d9d)
- [getValueByBitNamesString(String, String)](#getvaluebybitnamesstring-c0e8ef407b4c)
- [getValueByString(ConfPath, String)](ConfValue.md#getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#getvaluebystring-7804643cb027) from ConfValue
- [hashCode()](#hashcode-ef797a217903)
- [isBitSet(long)](#isbitset-a18cae1da74b)
- [isBitSetSafe(long)](#isbitsetsafe-dbd99a7b4cbe)
- [setBit(long)](#setbit-ca27ab33dd5d)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### ConfBits() <a href="#confbits-0be881152ad1" id="confbits-0be881152ad1"></a>

```java
protected ConfBits()
```

### ConfBits(byte[]) <a href="#confbits-94ed0a76778e" id="confbits-94ed0a76778e"></a>

```java
protected ConfBits(byte[] val)
```

Construct a bitset value from a byte array with the bytes in
 little endian order

**Parameters**

- `byte[] val`

### ConfBits(String) <a href="#confbits-0902dfad5c0c" id="confbits-0902dfad5c0c"></a>

```java
protected ConfBits(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

String constructor for ConfBitBig.
 The string representation is expected to be 'bin0x...>'
 with the hexadecimal representation of the bitset in little endian order.

**Parameters**

- `String str`

**Throws**

- `ConfException`


## Fields

### val <a href="#val-a02e160da60f" id="val-a02e160da60f"></a>

```java
protected byte[] val = null;
```


## Methods

### byteArrayValue() <a href="#bytearrayvalue-2e0fef980288" id="bytearrayvalue-2e0fef980288"></a>

```java
public byte[] byteArrayValue()
```

Get byte array representing this bitset in little endian order.

**Returns:** little endian byte array of this bitset

### clearBit(long) <a href="#clearbit-5db4b507737e" id="clearbit-5db4b507737e"></a>

```java
public void clearBit(long pos) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Clear bit at position pos in bitset. The bitset must initially been
 created with a maxposition higher or equal to pos or else
 an ConfException is thrown.

**Parameters**

- `long pos` - Bit position to clear.

**Throws**

- `ConfException`

### compareTo(ConfBits) <a href="#compareto-66b77461fdc7" id="compareto-66b77461fdc7"></a>

```java
public int compareTo(com.tailf.conf.ConfBits o)
```

Types: [ConfBits](ConfBits.md#confbits-fa772b723e51)

CompareTo method

**Parameters**

- `com.tailf.conf.ConfBits o`

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Equals method

**Parameters**

- `Object o`

### getBitNamesByValue(ConfPath, ConfBits) <a href="#getbitnamesbyvalue-3ba6b28839a1" id="getbitnamesbyvalue-3ba6b28839a1"></a>

```java
public static String getBitNamesByValue(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.ConfBits bits
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfBits](ConfBits.md#confbits-fa772b723e51), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### getBitNamesByValue(String, ConfBits) <a href="#getbitnamesbyvalue-c649f67dc799" id="getbitnamesbyvalue-c649f67dc799"></a>

```java
public static String getBitNamesByValue(
    String path,
    com.tailf.conf.ConfBits bits
)
    throws com.tailf.conf.ConfException
```

Types: [ConfBits](ConfBits.md#confbits-fa772b723e51), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Like `getBitNamesByValue(ConfPath, ConfBits)` but takes a path
 string pointing to the bitset in the schema.

**Parameters**

- `String path` - String pointing to the position of a bitset in the schema.
- `com.tailf.conf.ConfBits bits` - ConfBits value

**Returns:** String of bitNames

**Throws**

- `ConfException`

### getValueByBitNamesString(ConfPath, String) <a href="#getvaluebybitnamesstring-12ca247b9d9d" id="getvaluebybitnamesstring-12ca247b9d9d"></a>

```java
public static com.tailf.conf.ConfBits getValueByBitNamesString(
    com.tailf.conf.ConfPath path,
    String bitNames
)
    throws com.tailf.conf.ConfException
```

Types: [ConfBits](ConfBits.md#confbits-fa772b723e51), [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### getValueByBitNamesString(String, String) <a href="#getvaluebybitnamesstring-c0e8ef407b4c" id="getvaluebybitnamesstring-c0e8ef407b4c"></a>

```java
public static com.tailf.conf.ConfBits getValueByBitNamesString(
    String path,
    String bitNames
)
    throws com.tailf.conf.ConfException
```

Types: [ConfBits](ConfBits.md#confbits-fa772b723e51), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Like `getValueByBitNamesString(ConfPath, String)` but takes a path
 string pointing to the bitset in the schema.

**Parameters**

- `String path` - String pointing to the position of a bitset in the schema.
- `String bitNames` - String of space separated bit names

**Returns:** ConfBits value

**Throws**

- `ConfException`

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

hashCode method

### isBitSet(long) <a href="#isbitset-a18cae1da74b" id="isbitset-a18cae1da74b"></a>

```java
public boolean isBitSet(long pos) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Check if bit is set at position pos in bitset.
 The bitset must initially been
 created with a maxposition higher or equal to pos or else
 an ConfException is thrown.

**Parameters**

- `long pos` - Bit position to check.

**Returns:** boolean true if bit is set.

**Throws**

- `ConfException` - Never, for API backwards compatibility.

### isBitSetSafe(long) <a href="#isbitsetsafe-dbd99a7b4cbe" id="isbitsetsafe-dbd99a7b4cbe"></a>

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

### setBit(long) <a href="#setbit-ca27ab33dd5d" id="setbit-ca27ab33dd5d"></a>

```java
public void setBit(long pos) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Set bit at position pos in bitset. The bitset must initially been
 created with a maxposition higher or equal to pos or else
 an ConfException is thrown.

**Parameters**

- `long pos` - Bit position to set.

**Throws**

- `ConfException`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

toString method. The string representation for bitset is
 'bin0x...' with hexadecimal representation in little endian order
