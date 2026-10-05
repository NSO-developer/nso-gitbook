# ConfXMLParamStop <a href="#confxmlparamstop-d1e86c4fdecc" id="confxmlparamstop-d1e86c4fdecc"></a>

```java
public class com.tailf.conf.ConfXMLParamStop
    extends com.tailf.conf.ConfXMLParam
```

Types: [ConfXMLParam](ConfXMLParam.md#confxmlparam-f5f4394b46a7)

Identifies the end point for parameter definitions. See [`ConfXMLParam`](ConfXMLParam.md#confxmlparam-f5f4394b46a7)

## Members

**Constructors**:

- [ConfXMLParamStop\(ConfEObject\)](#confxmlparamstop-b28af694b057)
- [ConfXMLParamStop\(ConfNamespace, String\)](#confxmlparamstop-331a10db9539)
- [ConfXMLParamStop\(ConfPath, MountIdInterface, String, String\)](#confxmlparamstop-1fccc4f103fd)
- [ConfXMLParamStop\(int, int\)](#confxmlparamstop-e1d5029c5a3a)
- [ConfXMLParamStop\(String, String\)](#confxmlparamstop-1fa6ef4e1e5a)

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
- [namespace](ConfXMLParam.md#namespace-9b66d2318bf6) from ConfXMLParam
- [ns](ConfXMLParam.md#ns-8a46ea397979) from ConfXMLParam
- [prefix](ConfXMLParam.md#prefix-f4cd8051dc9a) from ConfXMLParam
- [tag](ConfXMLParam.md#tag-4c1656782674) from ConfXMLParam
- [tagString](ConfXMLParam.md#tagstring-998457362c04) from ConfXMLParam
- [val](ConfXMLParam.md#val-a02e160da60f) from ConfXMLParam

**Methods**:

- [clone\(\)](ConfObject.md#clone-164c86c45e9b) from ConfObject
- [compare\(ConfObject, ConfObject\)](ConfObject.md#compare-e78552baa2bf) from ConfObject
- [decode\(ConfEObject\)](ConfObject.md#decode-609792d36602) from ConfObject
- [decode\(ConfEObject, ConfPath\)](ConfObject.md#decode-a814ebf64edc) from ConfObject
- [decode\(ConfEObject, String\)](ConfObject.md#decode-9b92f1de40d8) from ConfObject
- [decodeParam\(ConfEObject\)](ConfXMLParam.md#decodeparam-6799ac4705bb) from ConfXMLParam
- [decodeParams\(ConfEObject\)](ConfXMLParam.md#decodeparams-5a1c83464ae4) from ConfXMLParam
- [encode\(\)](ConfXMLParam.md#encode-fbae522bba37) from ConfXMLParam
- [encode\(ConfXMLParam\[\]\)](ConfXMLParam.md#encode-7356521b6411) from ConfXMLParam
- [encode\(List\<String\>\)](ConfXMLParam.md#encode-da878ca7b20d) from ConfXMLParam
- [encode\(List\<String\>, ConfXMLParam\[\]\)](ConfXMLParam.md#encode-e9fa5532e6d5) from ConfXMLParam
- [encodeHKP\(\)](ConfXMLParam.md#encodehkp-50d4bf8d0256) from ConfXMLParam
- [encodeHKP\(ConfXMLParam\[\]\)](ConfXMLParam.md#encodehkp-ebc927cd1ccf) from ConfXMLParam
- [encodeHKP\(List\<String\>\)](ConfXMLParam.md#encodehkp-2ff023418b43) from ConfXMLParam
- [encodeHKP\(List\<String\>, ConfXMLParam\[\]\)](ConfXMLParam.md#encodehkp-6bc3df5e84cb) from ConfXMLParam
- [encodeIKP\(\)](ConfXMLParam.md#encodeikp-b160b87f6433) from ConfXMLParam
- [encodeIKP\(ConfXMLParam\[\]\)](ConfXMLParam.md#encodeikp-ab4320a110c6) from ConfXMLParam
- [encodeIKP\(List\<String\>\)](ConfXMLParam.md#encodeikp-6f358b789ce0) from ConfXMLParam
- [encodeIKP\(List\<String\>, ConfXMLParam\[\]\)](ConfXMLParam.md#encodeikp-c0a89dd54349) from ConfXMLParam
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [getConfNamespace\(\)](ConfXMLParam.md#getconfnamespace-87556caf3223) from ConfXMLParam
- [getNSHash\(\)](ConfXMLParam.md#getnshash-2129fb8b3cfe) from ConfXMLParam
- [getTag\(\)](ConfXMLParam.md#gettag-315f45956d6f) from ConfXMLParam
- [getTagHash\(\)](ConfXMLParam.md#gettaghash-8f057919039c) from ConfXMLParam
- [getValue\(\)](ConfXMLParam.md#getvalue-d93864668c40) from ConfXMLParam
- [hashCode\(\)](#hashcode-ef797a217903)
- [setCdbInstanceInteger\(int\)](ConfXMLParam.md#setcdbinstanceinteger-f7ee747b0f20) from ConfXMLParam
- [setNamespace\(ConfNamespace\)](ConfXMLParam.md#setnamespace-30316a480cfa) from ConfXMLParam
- [setNamespaceFromMountId\(List\<String\>\)](ConfXMLParam.md#setnamespacefrommountid-1aa3f67eb493) from ConfXMLParam
- [toDOM\(ConfXMLParam\[\]\)](ConfXMLParam.md#todom-13fd8f87f1a2) from ConfXMLParam
- [toDOM\(ConfXMLParam\[\], String, String\)](ConfXMLParam.md#todom-a2de025173ef) from ConfXMLParam
- [toString\(\)](ConfXMLParam.md#tostring-e9d48c5503ef) from ConfXMLParam
- [toXML\(ConfXMLParam\[\]\)](ConfXMLParam.md#toxml-122580fde7a8) from ConfXMLParam
- [toXML\(ConfXMLParam\[\], String, String\)](ConfXMLParam.md#toxml-e7cef9be4b1e) from ConfXMLParam
- [toXMLParams\(String, ConfPath\)](ConfXMLParam.md#toxmlparams-bec6ecc54070) from ConfXMLParam
- [toXMLParams\(String, ConfPath, int\)](ConfXMLParam.md#toxmlparams-61a6fdf75a13) from ConfXMLParam

## Constructors

### ConfXMLParamStop(ConfEObject) <a href="#confxmlparamstop-b28af694b057" id="confxmlparamstop-b28af694b057"></a>

```java
public ConfXMLParamStop(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfXMLParamStop(ConfNamespace, String) <a href="#confxmlparamstop-331a10db9539" id="confxmlparamstop-331a10db9539"></a>

```java
public ConfXMLParamStop(com.tailf.conf.ConfNamespace namespace, String tagString)
```

Types: [ConfNamespace](ConfNamespace.md#confnamespace-51b928e168d1)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`
- `String tagString`

### ConfXMLParamStop(ConfPath, MountIdInterface, String, String) <a href="#confxmlparamstop-1fccc4f103fd" id="confxmlparamstop-1fccc4f103fd"></a>

```java
public ConfXMLParamStop(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.MountIdInterface mountIdGetter,
    String prefix,
    String tagString
)
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [MountIdInterface](MountIdInterface.md#mountidinterface-113d1b54dae0)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.conf.MountIdInterface mountIdGetter`
- `String prefix`
- `String tagString`

### ConfXMLParamStop(int, int) <a href="#confxmlparamstop-e1d5029c5a3a" id="confxmlparamstop-e1d5029c5a3a"></a>

```java
public ConfXMLParamStop(int ns, int tag)
```

**Parameters**

- `int ns`
- `int tag`

### ConfXMLParamStop(String, String) <a href="#confxmlparamstop-1fa6ef4e1e5a" id="confxmlparamstop-1fa6ef4e1e5a"></a>

```java
public ConfXMLParamStop(String prefix, String tagString)
```

**Parameters**

- `String prefix`
- `String tagString`


## Methods

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```
