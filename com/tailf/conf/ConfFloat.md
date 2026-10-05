# ConfFloat <a href="#conffloat-ad1957df90a2" id="conffloat-ad1957df90a2"></a>

```java
public class com.tailf.conf.ConfFloat
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfFloat>
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d), [ConfFloat](ConfFloat.md#conffloat-ad1957df90a2)

DATA_CONTAINER - Corresponds to the confspec xs:float type.

## Members

**Constructors**:

- [ConfFloat(ConfEObject)](#conffloat-9698cc9b2da5)
- [ConfFloat(float)](#conffloat-c746c357dcee)

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
- [compareTo(ConfFloat)](#compareto-08b770a7c5e6)
- [decode(ConfEObject)](ConfObject.md#decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#decode-9b92f1de40d8) from ConfObject
- [encode()](#encode-fbae522bba37)
- [equals(Object)](#equals-fcd6492e0d6c)
- [floatValue()](#floatvalue-6e7c2cd63bb9)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#getvaluebystring-7804643cb027) from ConfValue
- [hashCode()](#hashcode-ef797a217903)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### ConfFloat(ConfEObject) <a href="#conffloat-9698cc9b2da5" id="conffloat-9698cc9b2da5"></a>

```java
public ConfFloat(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfFloat(float) <a href="#conffloat-c746c357dcee" id="conffloat-c746c357dcee"></a>

```java
public ConfFloat(float f)
```

**Parameters**

- `float f`


## Methods

### compareTo(ConfFloat) <a href="#compareto-08b770a7c5e6" id="compareto-08b770a7c5e6"></a>

```java
public int compareTo(com.tailf.conf.ConfFloat o)
```

Types: [ConfFloat](ConfFloat.md#conffloat-ad1957df90a2)

**Parameters**

- `com.tailf.conf.ConfFloat o`

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### floatValue() <a href="#floatvalue-6e7c2cd63bb9" id="floatvalue-6e7c2cd63bb9"></a>

```java
public float floatValue()
```

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
