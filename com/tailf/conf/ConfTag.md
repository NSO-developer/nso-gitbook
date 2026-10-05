# ConfTag <a href="#conftag-73757b87bc93" id="conftag-73757b87bc93"></a>

```java
public class com.tailf.conf.ConfTag
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

Class representing an element in a model. This class is used e.g
 when an instance path is represented as an array of ConfTag/ConfKey
 values.

**Related classes**

- [ConfTagDefault](ConfTagDefault.md#conftagdefault-00d683b9bd42)

## Members

**Constructors**:

- [ConfTag()](#conftag-0c8367dd87ad)
- [ConfTag(ConfEObject)](#conftag-44bc0ef54539)
- [ConfTag(ConfNamespace, int)](#conftag-44aa39640f34)
- [ConfTag(ConfNamespace, String)](#conftag-ea99fbb70c5a)
- [ConfTag(int, int)](#conftag-5f08034f3cee)
- [ConfTag(int, String)](#conftag-2ad0f6760145)
- [ConfTag(String)](#conftag-0f38a2807b74)
- [ConfTag(String, int)](#conftag-a8f827e1ffad)
- [ConfTag(String, String)](#conftag-aee19ff3488f)

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
- [encodeIKP()](#encodeikp-b160b87f6433)
- [equals(Object)](#equals-fcd6492e0d6c)
- [getConfNamespace()](#getconfnamespace-87556caf3223)
- [getNSHash()](#getnshash-2129fb8b3cfe)
- [getPrefix()](#getprefix-9268091e0223)
- [getTag()](#gettag-315f45956d6f)
- [getTagHash()](#gettaghash-8f057919039c)
- [getURI()](#geturi-7ec1ffd8cd93)
- [hashCode()](#hashcode-ef797a217903)
- [isLenient()](#islenient-47b594aa27c3)
- [setConfNamespace(ConfNamespace)](#setconfnamespace-7fef1b53f52c)
- [setLenient(boolean)](#setlenient-7cd970533a41)
- [toString()](#tostring-e9d48c5503ef)
- [toString(ConfNamespace)](#tostring-97a6a914714f)
- [toString(int)](#tostring-477fa787d7c7)

## Constructors

### ConfTag() <a href="#conftag-0c8367dd87ad" id="conftag-0c8367dd87ad"></a>

```java
protected ConfTag()
```

### ConfTag(ConfEObject) <a href="#conftag-44bc0ef54539" id="conftag-44bc0ef54539"></a>

```java
public ConfTag(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfTag(ConfNamespace, int) <a href="#conftag-44aa39640f34" id="conftag-44aa39640f34"></a>

```java
public ConfTag(com.tailf.conf.ConfNamespace nsObj, int tag)
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`
- `int tag`

### ConfTag(ConfNamespace, String) <a href="#conftag-ea99fbb70c5a" id="conftag-ea99fbb70c5a"></a>

```java
public ConfTag(com.tailf.conf.ConfNamespace nsObj, String tagName)
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`
- `String tagName`

### ConfTag(int, int) <a href="#conftag-5f08034f3cee" id="conftag-5f08034f3cee"></a>

```java
public ConfTag(int ns, int tag)
```

**Parameters**

- `int ns`
- `int tag`

### ConfTag(int, String) <a href="#conftag-2ad0f6760145" id="conftag-2ad0f6760145"></a>

```java
public ConfTag(int ns, String tagname)
```

**Parameters**

- `int ns`
- `String tagname`

### ConfTag(String) <a href="#conftag-0f38a2807b74" id="conftag-0f38a2807b74"></a>

```java
public ConfTag(String tagName)
```

**Parameters**

- `String tagName`

### ConfTag(String, int) <a href="#conftag-a8f827e1ffad" id="conftag-a8f827e1ffad"></a>

```java
public ConfTag(String nsURI, int tag)
```

**Parameters**

- `String nsURI`
- `int tag`

### ConfTag(String, String) <a href="#conftag-aee19ff3488f" id="conftag-aee19ff3488f"></a>

```java
public ConfTag(String nsPrefix, String tagName)
```

**Parameters**

- `String nsPrefix`
- `String tagName`


## Methods

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

### encodeIKP() <a href="#encodeikp-b160b87f6433" id="encodeikp-b160b87f6433"></a>

```java
public com.tailf.proto.ConfEObject encodeIKP()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two ConfTags are equal.
 Two ConfTag are equals if their tagname and nsUri are equals.
 or if tag values and ns values are the same.

**Parameters**

- `Object o` - ConfObjectRef that is to be compared to.

**Returns:** true if the objects are identical.

### getConfNamespace() <a href="#getconfnamespace-87556caf3223" id="getconfnamespace-87556caf3223"></a>

```java
public com.tailf.conf.ConfNamespace getConfNamespace()
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)

### getNSHash() <a href="#getnshash-2129fb8b3cfe" id="getnshash-2129fb8b3cfe"></a>

```java
public int getNSHash()
```

### getPrefix() <a href="#getprefix-9268091e0223" id="getprefix-9268091e0223"></a>

```java
public String getPrefix()
```

### getTag() <a href="#gettag-315f45956d6f" id="gettag-315f45956d6f"></a>

```java
public String getTag()
```

### getTagHash() <a href="#gettaghash-8f057919039c" id="gettaghash-8f057919039c"></a>

```java
public int getTagHash()
```

### getURI() <a href="#geturi-7ec1ffd8cd93" id="geturi-7ec1ffd8cd93"></a>

```java
public String getURI()
```

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### isLenient() <a href="#islenient-47b594aa27c3" id="islenient-47b594aa27c3"></a>

```java
public boolean isLenient()
```

### setConfNamespace(ConfNamespace) <a href="#setconfnamespace-7fef1b53f52c" id="setconfnamespace-7fef1b53f52c"></a>

```java
public void setConfNamespace(com.tailf.conf.ConfNamespace nsObj)
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`

### setLenient(boolean) <a href="#setlenient-7cd970533a41" id="setlenient-7cd970533a41"></a>

```java
public void setLenient(boolean lenient)
```

**Parameters**

- `boolean lenient`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### toString(ConfNamespace) <a href="#tostring-97a6a914714f" id="tostring-97a6a914714f"></a>

**Package-private**

```java
String toString(com.tailf.conf.ConfNamespace prevNsObj)
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)

**Parameters**

- `com.tailf.conf.ConfNamespace prevNsObj`

### toString(int) <a href="#tostring-477fa787d7c7" id="tostring-477fa787d7c7"></a>

**Package-private**

```java
String toString(int prevNs)
```

package-private version for printing list of keypaths (prefix not shown
 more than once in the beginning or when namespace is changed in middle of
 path)

**Parameters**

- `int prevNs`
