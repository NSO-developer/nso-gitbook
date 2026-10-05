# ConfObjectRef <a href="#confobjectref-6b7c225d0d3d" id="confobjectref-6b7c225d0d3d"></a>

```java
public class com.tailf.conf.ConfObjectRef
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfObjectRef>
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d), [ConfObjectRef](ConfObjectRef.md#confobjectref-6b7c225d0d3d)

DATA_CONTAINER - Corresponds to the YANG instance-identifier type.

 Corresponds to the YANG instance-identifier type


```


    The following are examples of instance identifiers:

        // instance-identifier for a container
         /ex:system/ex:services/ex:ssh

        // instance-identifier for a leaf
         /ex:system/ex:services/ex:ssh/ex:port

       // instance-identifier for a list entry
        /ex:system/ex:user[ex:name='fred']

        // instance-identifier for a leaf in a list entry
     /ex:system/ex:user[ex:name='fred']/ex:type

        // instance-identifier for a list entry with two keys
     /ex:system/server[ip='192.0.2.1'][port='80']/system/
       server[ip='192.0.2.1' ex:port='80']

   // instance-identifier for a leaf-list entry
      /ex:system/ex:services/ex:ssh/ex:cipher[.='blowfish-cbc']

      // instance-identifier for a list entry without keys
       /ex:stats/ex:port[3]

       // instance-identifier for a leaf-list entry
      /ex:system/ex:services/ex:ssh/ex:cipher[.='blowfish-cbc']
```

## Members

**Constructors**:

- [ConfObjectRef\(ConfEObject\)](#confobjectref-869a91fa17a4)
- [ConfObjectRef\(ConfObject\[\]\)](#confobjectref-97c85f2135c4)
- [ConfObjectRef\(ConfPath\)](#confobjectref-77a7177f0a69)
- [ConfObjectRef\(String\)](#confobjectref-74fd21358172)
- [ConfObjectRef\(String, MountIdInterface\)](#confobjectref-965cdc7987b6)

**Fields**:

- [J\_BINARY](ConfObject.md#j_binary-f4395337afc2) from ConfObject
- [J\_BIT32](ConfObject.md#j_bit32-40251205e2bd) from ConfObject
- [J\_BIT64](ConfObject.md#j_bit64-15d68e666b90) from ConfObject
- [J\_BITBIG](ConfObject.md#j_bitbig-835affd18d2b) from ConfObject
- [J\_BOOL](ConfObject.md#j_bool-fa62aa9e1544) from ConfObject
- [J\_BUF](ConfObject.md#j_buf-d1b0b08b798f) from ConfObject
- [J\_CDBBEGIN](ConfObject.md#j_cdbbegin-07a4f9eca5c4) from ConfObject
- [J\_DATE](ConfObject.md#j_date-00cc8f6e70e6) from ConfObject
- [J\_DATETIME](ConfObject.md#j_datetime-573fe6a9a577) from ConfObject
- [J\_DECIMAL64](ConfObject.md#j_decimal64-ff02afe47ff7) from ConfObject
- [J\_DEFAULT](ConfObject.md#j_default-54b54b027809) from ConfObject
- [J\_DOUBLE](ConfObject.md#j_double-ade902bbb1aa) from ConfObject
- [J\_DQUAD](ConfObject.md#j_dquad-852ab4ec2848) from ConfObject
- [J\_DURATION](ConfObject.md#j_duration-98ef58bed1c0) from ConfObject
- [J\_EMPTY](ConfObject.md#j_empty-cca63c6cd2c7) from ConfObject
- [J\_ENUMERATION](ConfObject.md#j_enumeration-47c69754d29b) from ConfObject
- [J\_HEXSTR](ConfObject.md#j_hexstr-90b6b86efe7b) from ConfObject
- [J\_IDENTITYREF](ConfObject.md#j_identityref-977d471383c5) from ConfObject
- [J\_INSTANCE\_IDENTIFIER](ConfObject.md#j_instance_identifier-bbb4b8e5e954) from ConfObject
- [J\_INT16](ConfObject.md#j_int16-4f9df234cba7) from ConfObject
- [J\_INT32](ConfObject.md#j_int32-db4c66331284) from ConfObject
- [J\_INT64](ConfObject.md#j_int64-c290a7cb2e11) from ConfObject
- [J\_INT8](ConfObject.md#j_int8-8f73ffef0f12) from ConfObject
- [J\_IPV4](ConfObject.md#j_ipv4-54fdc3efb49b) from ConfObject
- [J\_IPV4\_AND\_PLEN](ConfObject.md#j_ipv4_and_plen-69b1e630ab12) from ConfObject
- [J\_IPV4PREFIX](ConfObject.md#j_ipv4prefix-d36121ba89ca) from ConfObject
- [J\_IPV6](ConfObject.md#j_ipv6-03903b354701) from ConfObject
- [J\_IPV6\_AND\_PLEN](ConfObject.md#j_ipv6_and_plen-ac1054abbf31) from ConfObject
- [J\_IPV6PREFIX](ConfObject.md#j_ipv6prefix-5e95c6e896d2) from ConfObject
- [J\_LIST](ConfObject.md#j_list-d74b9f073fdc) from ConfObject
- [J\_NOEXISTS](ConfObject.md#j_noexists-1f0f9b7a9591) from ConfObject
- [J\_OBJECTREF](ConfObject.md#j_objectref-577d14956cc8) from ConfObject
- [J\_OID](ConfObject.md#j_oid-2d504f7432b3) from ConfObject
- [J\_PTR](ConfObject.md#j_ptr-ef54b9484cab) from ConfObject
- [J\_QNAME](ConfObject.md#j_qname-0d2839adff4c) from ConfObject
- [J\_STR](ConfObject.md#j_str-ae3bb3034983) from ConfObject
- [J\_SYMBOL](ConfObject.md#j_symbol-25fd3742c374) from ConfObject
- [J\_TIME](ConfObject.md#j_time-3ecdebfb0af5) from ConfObject
- [J\_UINT16](ConfObject.md#j_uint16-1f95eafb4126) from ConfObject
- [J\_UINT32](ConfObject.md#j_uint32-200f00c0ee05) from ConfObject
- [J\_UINT64](ConfObject.md#j_uint64-6960c783d61f) from ConfObject
- [J\_UINT8](ConfObject.md#j_uint8-ab0567c53d7f) from ConfObject
- [J\_UNION](ConfObject.md#j_union-7c548945cda0) from ConfObject
- [J\_XMLBEGIN](ConfObject.md#j_xmlbegin-6b887ec4c61b) from ConfObject
- [J\_XMLBEGINDEL](ConfObject.md#j_xmlbegindel-6c4d37088d90) from ConfObject
- [J\_XMLEND](ConfObject.md#j_xmlend-e2b443858058) from ConfObject
- [J\_XMLMOVEAFTER](ConfObject.md#j_xmlmoveafter-e7f2fed6d94d) from ConfObject
- [J\_XMLMOVEFIRST](ConfObject.md#j_xmlmovefirst-776c36719f23) from ConfObject
- [J\_XMLTAG](ConfObject.md#j_xmltag-0a12f537271e) from ConfObject

**Methods**:

- [clone\(\)](ConfObject.md#clone-164c86c45e9b) from ConfObject
- [compare\(ConfObject, ConfObject\)](ConfObject.md#compare-e78552baa2bf) from ConfObject
- [compareTo\(ConfObjectRef\)](#compareto-c2036e4c3394)
- [decode\(ConfEObject\)](ConfObject.md#decode-609792d36602) from ConfObject
- [decode\(ConfEObject, ConfPath\)](ConfObject.md#decode-a814ebf64edc) from ConfObject
- [decode\(ConfEObject, String\)](ConfObject.md#decode-9b92f1de40d8) from ConfObject
- [encode\(\)](#encode-fbae522bba37)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [getElems\(\)](#getelems-030df7d28888)
- [getStringByValue\(ConfPath, ConfValue\)](ConfValue.md#getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue\(String, ConfValue\)](ConfValue.md#getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getValueByString\(ConfPath, String\)](ConfValue.md#getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString\(String, String\)](ConfValue.md#getvaluebystring-7804643cb027) from ConfValue
- [hashCode\(\)](#hashcode-ef797a217903)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### ConfObjectRef(ConfEObject) <a href="#confobjectref-869a91fa17a4" id="confobjectref-869a91fa17a4"></a>

```java
public ConfObjectRef(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

It assumes that param is of type ConfEList.

**Parameters**

- `com.tailf.proto.ConfEObject o` - is a ConfEList

### ConfObjectRef(ConfObject[]) <a href="#confobjectref-97c85f2135c4" id="confobjectref-97c85f2135c4"></a>

```java
public ConfObjectRef(com.tailf.conf.ConfObject[] elems)
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

Constructor using the autoloaded namespaces.
 It assumes that schemas have been loaded
 using Maapi.loadschermas().

**Parameters**

- `com.tailf.conf.ConfObject[] elems`

### ConfObjectRef(ConfPath) <a href="#confobjectref-77a7177f0a69" id="confobjectref-77a7177f0a69"></a>

```java
public ConfObjectRef(com.tailf.conf.ConfPath path) throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Construct a ConfObjectRef from a given Absolute ConfPath.

**Parameters**

- `com.tailf.conf.ConfPath path`

**Throws**

- `ConfException` - if the given path is relative.

### ConfObjectRef(String) <a href="#confobjectref-74fd21358172" id="confobjectref-74fd21358172"></a>

```java
public ConfObjectRef(String xpath) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String xpath`

### ConfObjectRef(String, MountIdInterface) <a href="#confobjectref-965cdc7987b6" id="confobjectref-965cdc7987b6"></a>

```java
public ConfObjectRef(
    String xpath,
    com.tailf.conf.MountIdInterface mountGetter
)
    throws com.tailf.conf.ConfException
```

Types: [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String xpath`
- `com.tailf.conf.MountIdInterface mountGetter`


## Methods

### compareTo(ConfObjectRef) <a href="#compareto-c2036e4c3394" id="compareto-c2036e4c3394"></a>

```java
public int compareTo(com.tailf.conf.ConfObjectRef o)
```

Types: [ConfObjectRef](ConfObjectRef.md#confobjectref-6b7c225d0d3d)

**Parameters**

- `com.tailf.conf.ConfObjectRef o`

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

### getElems() <a href="#getelems-030df7d28888" id="getelems-030df7d28888"></a>

```java
public com.tailf.conf.ConfObject[] getElems()
```

Types: [ConfObject](ConfObject.md#confobject-5433616953b2)

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
