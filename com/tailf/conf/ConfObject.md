# ConfObject <a href="#confobject-5433616953b2" id="confobject-5433616953b2"></a>

```java
public abstract class com.tailf.conf.ConfObject
    implements Cloneable, java.io.Serializable
```

Base class of the Conf data type classes. This class is used to represent an
 arbitrary Conf term.

**Related classes**

- [ConfKey](ConfKey.md#confkey-e4e1ca98e867)
- [ConfTag](ConfTag.md#conftag-73757b87bc93)
- [ConfTypeDescriptor](ConfTypeDescriptor.md#conftypedescriptor-54bbccc6dd79)
- [ConfValue](ConfValue.md#confvalue-769292781c7d)
- [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7)

## Members

**Constructors**:

- [ConfObject()](#confobject-bbefd68dfb09)

**Fields**:

- [J_BINARY](#j_binary-f4395337afc2)
- [J_BIT32](#j_bit32-40251205e2bd)
- [J_BIT64](#j_bit64-15d68e666b90)
- [J_BITBIG](#j_bitbig-835affd18d2b)
- [J_BOOL](#j_bool-fa62aa9e1544)
- [J_BUF](#j_buf-d1b0b08b798f)
- [J_CDBBEGIN](#j_cdbbegin-07a4f9eca5c4)
- [J_DATE](#j_date-00cc8f6e70e6)
- [J_DATETIME](#j_datetime-573fe6a9a577)
- [J_DECIMAL64](#j_decimal64-ff02afe47ff7)
- [J_DEFAULT](#j_default-54b54b027809)
- [J_DOUBLE](#j_double-ade902bbb1aa)
- [J_DQUAD](#j_dquad-852ab4ec2848)
- [J_DURATION](#j_duration-98ef58bed1c0)
- [J_EMPTY](#j_empty-cca63c6cd2c7)
- [J_ENUMERATION](#j_enumeration-47c69754d29b)
- [J_HEXSTR](#j_hexstr-90b6b86efe7b)
- [J_IDENTITYREF](#j_identityref-977d471383c5)
- [J_INSTANCE_IDENTIFIER](#j_instance_identifier-bbb4b8e5e954)
- [J_INT16](#j_int16-4f9df234cba7)
- [J_INT32](#j_int32-db4c66331284)
- [J_INT64](#j_int64-c290a7cb2e11)
- [J_INT8](#j_int8-8f73ffef0f12)
- [J_IPV4](#j_ipv4-54fdc3efb49b)
- [J_IPV4_AND_PLEN](#j_ipv4_and_plen-69b1e630ab12)
- [J_IPV4PREFIX](#j_ipv4prefix-d36121ba89ca)
- [J_IPV6](#j_ipv6-03903b354701)
- [J_IPV6_AND_PLEN](#j_ipv6_and_plen-ac1054abbf31)
- [J_IPV6PREFIX](#j_ipv6prefix-5e95c6e896d2)
- [J_LIST](#j_list-d74b9f073fdc)
- [J_NOEXISTS](#j_noexists-1f0f9b7a9591)
- [J_OBJECTREF](#j_objectref-577d14956cc8)
- [J_OID](#j_oid-2d504f7432b3)
- [J_PTR](#j_ptr-ef54b9484cab)
- [J_QNAME](#j_qname-0d2839adff4c)
- [J_STR](#j_str-ae3bb3034983)
- [J_SYMBOL](#j_symbol-25fd3742c374)
- [J_TIME](#j_time-3ecdebfb0af5)
- [J_UINT16](#j_uint16-1f95eafb4126)
- [J_UINT32](#j_uint32-200f00c0ee05)
- [J_UINT64](#j_uint64-6960c783d61f)
- [J_UINT8](#j_uint8-ab0567c53d7f)
- [J_UNION](#j_union-7c548945cda0)
- [J_XMLBEGIN](#j_xmlbegin-6b887ec4c61b)
- [J_XMLBEGINDEL](#j_xmlbegindel-6c4d37088d90)
- [J_XMLEND](#j_xmlend-e2b443858058)
- [J_XMLMOVEAFTER](#j_xmlmoveafter-e7f2fed6d94d)
- [J_XMLMOVEFIRST](#j_xmlmovefirst-776c36719f23)
- [J_XMLTAG](#j_xmltag-0a12f537271e)

**Methods**:

- [clone()](#clone-164c86c45e9b)
- [compare(ConfObject, ConfObject)](#compare-e78552baa2bf)
- [decode(ConfEObject)](#decode-609792d36602)
- [decode(ConfEObject, ConfPath)](#decode-a814ebf64edc)
- [decode(ConfEObject, String)](#decode-9b92f1de40d8)
- [encode()](#encode-fbae522bba37)
- [equals(Object)](#equals-fcd6492e0d6c)
- [hashCode()](#hashcode-ef797a217903)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### ConfObject() <a href="#confobject-bbefd68dfb09" id="confobject-bbefd68dfb09"></a>

```java
public ConfObject()
```


## Fields

### J_BINARY <a href="#j_binary-f4395337afc2" id="j_binary-f4395337afc2"></a>

```java
public static final int J_BINARY = 39;
```

### J_BIT32 <a href="#j_bit32-40251205e2bd" id="j_bit32-40251205e2bd"></a>

```java
public static final int J_BIT32 = 29;
```

### J_BIT64 <a href="#j_bit64-15d68e666b90" id="j_bit64-15d68e666b90"></a>

```java
public static final int J_BIT64 = 30;
```

### J_BITBIG <a href="#j_bitbig-835affd18d2b" id="j_bitbig-835affd18d2b"></a>

```java
public static final int J_BITBIG = 50;
```

### J_BOOL <a href="#j_bool-fa62aa9e1544" id="j_bool-fa62aa9e1544"></a>

```java
public static final int J_BOOL = 17;
```

### J_BUF <a href="#j_buf-d1b0b08b798f" id="j_buf-d1b0b08b798f"></a>

```java
public static final int J_BUF = 5;
```

### J_CDBBEGIN <a href="#j_cdbbegin-07a4f9eca5c4" id="j_cdbbegin-07a4f9eca5c4"></a>

```java
public static final int J_CDBBEGIN = 37;
```

### J_DATE <a href="#j_date-00cc8f6e70e6" id="j_date-00cc8f6e70e6"></a>

```java
public static final int J_DATE = 20;
```

### J_DATETIME <a href="#j_datetime-573fe6a9a577" id="j_datetime-573fe6a9a577"></a>

```java
public static final int J_DATETIME = 19;
```

### J_DECIMAL64 <a href="#j_decimal64-ff02afe47ff7" id="j_decimal64-ff02afe47ff7"></a>

```java
public static final int J_DECIMAL64 = 43;
```

### J_DEFAULT <a href="#j_default-54b54b027809" id="j_default-54b54b027809"></a>

```java
public static final int J_DEFAULT = 42;
```

### J_DOUBLE <a href="#j_double-ade902bbb1aa" id="j_double-ade902bbb1aa"></a>

```java
public static final int J_DOUBLE = 14;
```

### J_DQUAD <a href="#j_dquad-852ab4ec2848" id="j_dquad-852ab4ec2848"></a>

```java
public static final int J_DQUAD = 46;
```

### J_DURATION <a href="#j_duration-98ef58bed1c0" id="j_duration-98ef58bed1c0"></a>

```java
public static final int J_DURATION = 27;
```

### J_EMPTY <a href="#j_empty-cca63c6cd2c7" id="j_empty-cca63c6cd2c7"></a>

```java
public static final int J_EMPTY = 53;
```

### J_ENUMERATION <a href="#j_enumeration-47c69754d29b" id="j_enumeration-47c69754d29b"></a>

```java
public static final int J_ENUMERATION = 28;
```

### J_HEXSTR <a href="#j_hexstr-90b6b86efe7b" id="j_hexstr-90b6b86efe7b"></a>

```java
public static final int J_HEXSTR = 47;
```

### J_IDENTITYREF <a href="#j_identityref-977d471383c5" id="j_identityref-977d471383c5"></a>

```java
public static final int J_IDENTITYREF = 44;
```

### J_INSTANCE_IDENTIFIER <a href="#j_instance_identifier-bbb4b8e5e954" id="j_instance_identifier-bbb4b8e5e954"></a>

```java
public static final int J_INSTANCE_IDENTIFIER = 34;
```

### J_INT16 <a href="#j_int16-4f9df234cba7" id="j_int16-4f9df234cba7"></a>

```java
public static final int J_INT16 = 7;
```

### J_INT32 <a href="#j_int32-db4c66331284" id="j_int32-db4c66331284"></a>

```java
public static final int J_INT32 = 8;
```

### J_INT64 <a href="#j_int64-c290a7cb2e11" id="j_int64-c290a7cb2e11"></a>

```java
public static final int J_INT64 = 9;
```

### J_INT8 <a href="#j_int8-8f73ffef0f12" id="j_int8-8f73ffef0f12"></a>

```java
public static final int J_INT8 = 6;
```

### J_IPV4 <a href="#j_ipv4-54fdc3efb49b" id="j_ipv4-54fdc3efb49b"></a>

```java
public static final int J_IPV4 = 15;
```

### J_IPV4_AND_PLEN <a href="#j_ipv4_and_plen-69b1e630ab12" id="j_ipv4_and_plen-69b1e630ab12"></a>

```java
public static final int J_IPV4_AND_PLEN = 48;
```

### J_IPV4PREFIX <a href="#j_ipv4prefix-d36121ba89ca" id="j_ipv4prefix-d36121ba89ca"></a>

```java
public static final int J_IPV4PREFIX = 40;
```

### J_IPV6 <a href="#j_ipv6-03903b354701" id="j_ipv6-03903b354701"></a>

```java
public static final int J_IPV6 = 16;
```

### J_IPV6_AND_PLEN <a href="#j_ipv6_and_plen-ac1054abbf31" id="j_ipv6_and_plen-ac1054abbf31"></a>

```java
public static final int J_IPV6_AND_PLEN = 49;
```

### J_IPV6PREFIX <a href="#j_ipv6prefix-5e95c6e896d2" id="j_ipv6prefix-5e95c6e896d2"></a>

```java
public static final int J_IPV6PREFIX = 41;
```

### J_LIST <a href="#j_list-d74b9f073fdc" id="j_list-d74b9f073fdc"></a>

```java
public static final int J_LIST = 31;
```

### J_NOEXISTS <a href="#j_noexists-1f0f9b7a9591" id="j_noexists-1f0f9b7a9591"></a>

```java
public static final int J_NOEXISTS = 1;
```

### J_OBJECTREF <a href="#j_objectref-577d14956cc8" id="j_objectref-577d14956cc8"></a>

```java
public static final int J_OBJECTREF = 34;
```

### J_OID <a href="#j_oid-2d504f7432b3" id="j_oid-2d504f7432b3"></a>

```java
public static final int J_OID = 38;
```

### J_PTR <a href="#j_ptr-ef54b9484cab" id="j_ptr-ef54b9484cab"></a>

```java
public static final int J_PTR = 36;
```

### J_QNAME <a href="#j_qname-0d2839adff4c" id="j_qname-0d2839adff4c"></a>

```java
public static final int J_QNAME = 18;
```

### J_STR <a href="#j_str-ae3bb3034983" id="j_str-ae3bb3034983"></a>

```java
public static final int J_STR = 4;
```

### J_SYMBOL <a href="#j_symbol-25fd3742c374" id="j_symbol-25fd3742c374"></a>

```java
public static final int J_SYMBOL = 3;
```

### J_TIME <a href="#j_time-3ecdebfb0af5" id="j_time-3ecdebfb0af5"></a>

```java
public static final int J_TIME = 23;
```

### J_UINT16 <a href="#j_uint16-1f95eafb4126" id="j_uint16-1f95eafb4126"></a>

```java
public static final int J_UINT16 = 11;
```

### J_UINT32 <a href="#j_uint32-200f00c0ee05" id="j_uint32-200f00c0ee05"></a>

```java
public static final int J_UINT32 = 12;
```

### J_UINT64 <a href="#j_uint64-6960c783d61f" id="j_uint64-6960c783d61f"></a>

```java
public static final int J_UINT64 = 13;
```

### J_UINT8 <a href="#j_uint8-ab0567c53d7f" id="j_uint8-ab0567c53d7f"></a>

```java
public static final int J_UINT8 = 10;
```

### J_UNION <a href="#j_union-7c548945cda0" id="j_union-7c548945cda0"></a>

```java
public static final int J_UNION = 35;
```

### J_XMLBEGIN <a href="#j_xmlbegin-6b887ec4c61b" id="j_xmlbegin-6b887ec4c61b"></a>

```java
public static final int J_XMLBEGIN = 32;
```

### J_XMLBEGINDEL <a href="#j_xmlbegindel-6c4d37088d90" id="j_xmlbegindel-6c4d37088d90"></a>

```java
public static final int J_XMLBEGINDEL = 45;
```

### J_XMLEND <a href="#j_xmlend-e2b443858058" id="j_xmlend-e2b443858058"></a>

```java
public static final int J_XMLEND = 33;
```

### J_XMLMOVEAFTER <a href="#j_xmlmoveafter-e7f2fed6d94d" id="j_xmlmoveafter-e7f2fed6d94d"></a>

```java
public static final int J_XMLMOVEAFTER = 52;
```

### J_XMLMOVEFIRST <a href="#j_xmlmovefirst-776c36719f23" id="j_xmlmovefirst-776c36719f23"></a>

```java
public static final int J_XMLMOVEFIRST = 51;
```

### J_XMLTAG <a href="#j_xmltag-0a12f537271e" id="j_xmltag-0a12f537271e"></a>

```java
public static final int J_XMLTAG = 2;
```


## Methods

### clone() <a href="#clone-164c86c45e9b" id="clone-164c86c45e9b"></a>

```java
public Object clone()
```

### compare(ConfObject, ConfObject) <a href="#compare-e78552baa2bf" id="compare-e78552baa2bf"></a>

**Package-private**

```java
static int compare(com.tailf.conf.ConfObject val1, com.tailf.conf.ConfObject val2)
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

**Parameters**

- `com.tailf.conf.ConfObject val1`
- `com.tailf.conf.ConfObject val2`

### decode(ConfEObject) <a href="#decode-609792d36602" id="decode-609792d36602"></a>

```java
public static com.tailf.conf.ConfObject decode(
    com.tailf.proto.ConfEObject o
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### decode(ConfEObject, ConfPath) <a href="#decode-a814ebf64edc" id="decode-a814ebf64edc"></a>

```java
public static com.tailf.conf.ConfObject decode(
    com.tailf.proto.ConfEObject o,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.proto.ConfEObject o`
- `com.tailf.conf.ConfPath path`

### decode(ConfEObject, String) <a href="#decode-9b92f1de40d8" id="decode-9b92f1de40d8"></a>

```java
public static com.tailf.conf.ConfObject decode(
    com.tailf.proto.ConfEObject o,
    String tag
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.proto.ConfEObject o`
- `String tag`

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
public abstract com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public abstract boolean equals(Object o)
```

Determine if two Conf objects are equal. In general, Conf objects are
 equal if the components they consist of are equal.

**Parameters**

- `Object o` - the object to compare to.

**Returns:** true if the objects are identical.

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public abstract int hashCode()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public abstract String toString()
```

**Returns:** the printable representation of the object.
