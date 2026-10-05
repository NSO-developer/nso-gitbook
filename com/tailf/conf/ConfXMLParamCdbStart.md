<a id="cls-ConfXMLParamCdbStart"></a>
# ConfXMLParamCdbStart

```java
public class com.tailf.conf.ConfXMLParamCdbStart
    extends com.tailf.conf.ConfXMLParamStart
```

Types: [ConfXMLParamStart](ConfXMLParamStart.md#cls-ConfXMLParamStart)

Identifies a starting point in the model from which other parameters are
 relatively defined (used in CDB). This parameter is used
 in CDB methods when where list
 instances need to using index instead of key/value. See [`ConfXMLParam`](ConfXMLParam.md#cls-ConfXMLParam)

## Members

**Constructors**:

- [ConfXMLParamCdbStart(ConfEObject, int)](#m-confxmlparamcdbstart-b25f0c47bc70)
- [ConfXMLParamCdbStart(ConfNamespace, String, int)](#m-confxmlparamcdbstart-7aa55a02dbb6)
- [ConfXMLParamCdbStart(ConfPath, MountIdInterface, String, String, int)](#m-confxmlparamcdbstart-f36a79ec601c)
- [ConfXMLParamCdbStart(int, int, int)](#m-confxmlparamcdbstart-ec48ce632f09)
- [ConfXMLParamCdbStart(String, String, int)](#m-confxmlparamcdbstart-5de48b21ff23)

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
- [namespace](ConfXMLParam.md#m-namespace) from ConfXMLParam
- [ns](ConfXMLParam.md#m-ns) from ConfXMLParam
- [prefix](ConfXMLParam.md#m-prefix) from ConfXMLParam
- [tag](ConfXMLParam.md#m-tag) from ConfXMLParam
- [tagString](ConfXMLParam.md#m-tagString) from ConfXMLParam
- [val](ConfXMLParam.md#m-val) from ConfXMLParam

**Methods**:

- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [decodeParam(ConfEObject)](ConfXMLParam.md#m-decodeparam-6799ac4705bb) from ConfXMLParam
- [decodeParams(ConfEObject)](ConfXMLParam.md#m-decodeparams-5a1c83464ae4) from ConfXMLParam
- [encode()](ConfXMLParam.md#m-encode-fbae522bba37) from ConfXMLParam
- [encode(ConfXMLParam[])](ConfXMLParam.md#m-encode-7356521b6411) from ConfXMLParam
- [encode(List<String>)](ConfXMLParam.md#m-encode-da878ca7b20d) from ConfXMLParam
- [encode(List<String>, ConfXMLParam[])](ConfXMLParam.md#m-encode-e9fa5532e6d5) from ConfXMLParam
- [encodeHKP()](ConfXMLParam.md#m-encodehkp-50d4bf8d0256) from ConfXMLParam
- [encodeHKP(ConfXMLParam[])](ConfXMLParam.md#m-encodehkp-ebc927cd1ccf) from ConfXMLParam
- [encodeHKP(List<String>)](ConfXMLParam.md#m-encodehkp-2ff023418b43) from ConfXMLParam
- [encodeHKP(List<String>, ConfXMLParam[])](ConfXMLParam.md#m-encodehkp-6bc3df5e84cb) from ConfXMLParam
- [encodeIKP()](ConfXMLParam.md#m-encodeikp-b160b87f6433) from ConfXMLParam
- [encodeIKP(ConfXMLParam[])](ConfXMLParam.md#m-encodeikp-ab4320a110c6) from ConfXMLParam
- [encodeIKP(List<String>)](ConfXMLParam.md#m-encodeikp-6f358b789ce0) from ConfXMLParam
- [encodeIKP(List<String>, ConfXMLParam[])](ConfXMLParam.md#m-encodeikp-c0a89dd54349) from ConfXMLParam
- [equals(Object)](ConfXMLParamStart.md#m-equals-fcd6492e0d6c) from ConfXMLParamStart
- [getConfNamespace()](ConfXMLParam.md#m-getconfnamespace-87556caf3223) from ConfXMLParam
- [getNSHash()](ConfXMLParam.md#m-getnshash-2129fb8b3cfe) from ConfXMLParam
- [getTag()](ConfXMLParam.md#m-gettag-315f45956d6f) from ConfXMLParam
- [getTagHash()](ConfXMLParam.md#m-gettaghash-8f057919039c) from ConfXMLParam
- [getValue()](ConfXMLParam.md#m-getvalue-d93864668c40) from ConfXMLParam
- [hashCode()](ConfXMLParamStart.md#m-hashcode-ef797a217903) from ConfXMLParamStart
- [setCdbInstanceInteger(int)](ConfXMLParam.md#m-setcdbinstanceinteger-f7ee747b0f20) from ConfXMLParam
- [setNamespace(ConfNamespace)](ConfXMLParam.md#m-setnamespace-30316a480cfa) from ConfXMLParam
- [setNamespaceFromMountId(List<String>)](ConfXMLParam.md#m-setnamespacefrommountid-1aa3f67eb493) from ConfXMLParam
- [toDOM(ConfXMLParam[])](ConfXMLParam.md#m-todom-13fd8f87f1a2) from ConfXMLParam
- [toDOM(ConfXMLParam[], String, String)](ConfXMLParam.md#m-todom-a2de025173ef) from ConfXMLParam
- [toString()](ConfXMLParam.md#m-tostring-e9d48c5503ef) from ConfXMLParam
- [toXML(ConfXMLParam[])](ConfXMLParam.md#m-toxml-122580fde7a8) from ConfXMLParam
- [toXML(ConfXMLParam[], String, String)](ConfXMLParam.md#m-toxml-e7cef9be4b1e) from ConfXMLParam
- [toXMLParams(String, ConfPath)](ConfXMLParam.md#m-toxmlparams-bec6ecc54070) from ConfXMLParam
- [toXMLParams(String, ConfPath, int)](ConfXMLParam.md#m-toxmlparams-61a6fdf75a13) from ConfXMLParam

## Constructors

<a id="m-confxmlparamcdbstart-b25f0c47bc70"></a>
### ConfXMLParamCdbStart(ConfEObject, int)

```java
public ConfXMLParamCdbStart(
    com.tailf.proto.ConfEObject o,
    int cdbInstanceInteger
)
    throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`
- `int cdbInstanceInteger`

<a id="m-confxmlparamcdbstart-7aa55a02dbb6"></a>
### ConfXMLParamCdbStart(ConfNamespace, String, int)

```java
public ConfXMLParamCdbStart(
    com.tailf.conf.ConfNamespace namespace,
    String tagString,
    int cdbInstanceInteger
)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`
- `String tagString`
- `int cdbInstanceInteger`

<a id="m-confxmlparamcdbstart-f36a79ec601c"></a>
### ConfXMLParamCdbStart(ConfPath, MountIdInterface, String, String, int)

```java
public ConfXMLParamCdbStart(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.MountIdInterface mountIdGetter,
    String prefix,
    String tagString,
    int cdbInstanceInteger
)
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [MountIdInterface](MountIdInterface.md#cls-MountIdInterface)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.conf.MountIdInterface mountIdGetter`
- `String prefix`
- `String tagString`
- `int cdbInstanceInteger`

<a id="m-confxmlparamcdbstart-ec48ce632f09"></a>
### ConfXMLParamCdbStart(int, int, int)

```java
public ConfXMLParamCdbStart(int ns, int tag, int cdbInstanceInteger)
```

**Parameters**

- `int ns`
- `int tag`
- `int cdbInstanceInteger`

<a id="m-confxmlparamcdbstart-5de48b21ff23"></a>
### ConfXMLParamCdbStart(String, String, int)

```java
public ConfXMLParamCdbStart(String prefix, String tagString, int cdbInstanceInteger)
```

**Parameters**

- `String prefix`
- `String tagString`
- `int cdbInstanceInteger`
