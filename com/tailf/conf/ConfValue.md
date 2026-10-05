# ConfValue <a href="#confvalue-769292781c7d" id="confvalue-769292781c7d"></a>

```java
public abstract class com.tailf.conf.ConfValue
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

Base class of the DATA_CONTAINER `Conf<datatype>` classes.
 This class is used to represent an arbitrary Conf value.

**Related classes**

- [ConfAttributeValue](ConfAttributeValue.md#confattributevalue-d38e058ca48e)
- [ConfBinary](ConfBinary.md#confbinary-ae691d2ce296)
- [ConfBits](ConfBits.md#confbits-fa772b723e51)
- [ConfBool](ConfBool.md#confbool-0916eaf5ea31)
- [ConfBuf](ConfBuf.md#confbuf-c460585d9115)
- [ConfDate](ConfDate.md#confdate-ffbd0843ec7e)
- [ConfDatetime](ConfDatetime.md#confdatetime-8f67d7ff6ae8)
- [ConfDefault](ConfDefault.md#confdefault-2e2c2aa1733d)
- [ConfDottedQuad](ConfDottedQuad.md#confdottedquad-2ac2afbc6e7a)
- [ConfDouble](ConfDouble.md#confdouble-667ec1a19411)
- [ConfDuration](ConfDuration.md#confduration-ccb0a76da9ec)
- [ConfEmpty](ConfEmpty.md#confempty-ddfbcdb54c9c)
- [ConfEnumeration](ConfEnumeration.md#confenumeration-c8557b4aeb53)
- [ConfFloat](ConfFloat.md#conffloat-ad1957df90a2)
- [ConfHexString](ConfHexString.md#confhexstring-548f8b3261aa)
- [ConfIdentityRef](ConfIdentityRef.md#confidentityref-1a367056e764)
- [ConfInt32](ConfInt32.md#confint32-581d5d0c6b8b)
- [ConfInt64](ConfInt64.md#confint64-0d4ed81a2e2f)
- [ConfIP](ConfIP.md#confip-c1dfd6ba577e)
- [ConfIPAndPrefixLen](ConfIPAndPrefixLen.md#confipandprefixlen-dbeb26ceb9c7)
- [ConfIPPrefix](ConfIPPrefix.md#confipprefix-f03d2a982755)
- [ConfList](ConfList.md#conflist-a9c192ad3c99)
- [ConfNoExists](ConfNoExists.md#confnoexists-bdcf8f2c7ab9)
- [ConfObjectRef](ConfObjectRef.md#confobjectref-6b7c225d0d3d)
- [ConfOID](ConfOID.md#confoid-11dc95a517d2)
- [ConfQname](ConfQname.md#confqname-32a7566f68b5)
- [ConfTime](ConfTime.md#conftime-ba056a3a6559)
- [ConfUInt32](ConfUInt32.md#confuint32-e9d053dbaab3)
- [ConfUInt64](ConfUInt64.md#confuint64-c6c48fa366b2)
- [ConfXMLTagH](ConfXMLTagH.md#confxmltagh-212ec0c58c51)

## Members

**Constructors**:

- [ConfValue()](#confvalue-25fd581e3655)

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

**Methods**:

- [clone()](ConfObject.md#clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#compare-e78552baa2bf) from ConfObject
- [decode(ConfEObject)](ConfObject.md#decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#decode-9b92f1de40d8) from ConfObject
- [encode()](#encode-fbae522bba37)
- [equals(Object)](#equals-fcd6492e0d6c)
- [getStringByValue(ConfPath, ConfValue)](#getstringbyvalue-841fa68ad0f9)
- [getStringByValue(String, ConfValue)](#getstringbyvalue-8ed173dcf8dc)
- [getValueByString(ConfPath, String)](#getvaluebystring-e75fd0337a87)
- [getValueByString(String, String)](#getvaluebystring-7804643cb027)
- [hashCode()](#hashcode-ef797a217903)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### ConfValue() <a href="#confvalue-25fd581e3655" id="confvalue-25fd581e3655"></a>

```java
public ConfValue()
```


## Methods

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
public abstract com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

encode value.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public abstract boolean equals(Object o)
```

Determine if two ConfValue are equal. In general, ConfObjects are
 equal if the components they consist of are equal.

**Parameters**

- `Object o` - The object to compare to.

**Returns:** true if the objects are identical.

### getStringByValue(ConfPath, ConfValue) <a href="#getstringbyvalue-841fa68ad0f9" id="getstringbyvalue-841fa68ad0f9"></a>

```java
public static String getStringByValue(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.ConfValue val
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfValue](ConfValue.md#confvalue-769292781c7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Get the string representation of a ConfValue at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath representing the absolute
             schema path to the element
- `com.tailf.conf.ConfValue val` - ConfValue subclass representing the value

**Returns:** String representation of the value

**Throws**

- `ConfException`

### getStringByValue(String, ConfValue) <a href="#getstringbyvalue-8ed173dcf8dc" id="getstringbyvalue-8ed173dcf8dc"></a>

```java
public static String getStringByValue(
    String path,
    com.tailf.conf.ConfValue val
)
    throws com.tailf.conf.ConfException
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Get the string representation of a ConfValue at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `String path` - String representing the absolute
             schema path to the element
- `com.tailf.conf.ConfValue val` - ConfValue subclass representing the value

**Returns:** String representation of the value

**Throws**

- `ConfException`

### getValueByString(ConfPath, String) <a href="#getvaluebystring-e75fd0337a87" id="getvaluebystring-e75fd0337a87"></a>

```java
public static com.tailf.conf.ConfValue getValueByString(
    com.tailf.conf.ConfPath path,
    String str
)
    throws com.tailf.conf.ConfException
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d), [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Get a ConfValue representation a string at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath representing the absolute
             schema path to the element
- `String str` - String representation of the value

**Returns:** ConfValue the value for the element

**Throws**

- `ConfException`

### getValueByString(String, String) <a href="#getvaluebystring-7804643cb027" id="getvaluebystring-7804643cb027"></a>

```java
public static com.tailf.conf.ConfValue getValueByString(
    String path,
    String str
)
    throws com.tailf.conf.ConfException
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Get a ConfValue representation a string at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `String path` - String representing the absolute
             schema path to the element
- `String str` - String representation of the value

**Returns:** String representation of the value

**Throws**

- `ConfException`

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public abstract int hashCode()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public abstract String toString()
```

**Returns:** the printable representation of the object.
