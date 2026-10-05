<a id="s-ConfXMLParamCdbStart"></a>
# ConfXMLParamCdbStart

```java
public class com.tailf.conf.ConfXMLParamCdbStart
    extends com.tailf.conf.ConfXMLParamStart
```

Types: [ConfXMLParamStart](ConfXMLParamStart.md#s-ConfXMLParamStart)

Identifies a starting point in the model from which other parameters are
 relatively defined (used in CDB). This parameter is used
 in CDB methods when where list
 instances need to using index instead of key/value. See [`ConfXMLParam`](ConfXMLParam.md#s-ConfXMLParam)

## Members

**Constructors**:

- [ConfXMLParamCdbStart(ConfEObject, int)](#s-ConfXMLParamCdbStart-1)
- [ConfXMLParamCdbStart(ConfNamespace, String, int)](#s-ConfXMLParamCdbStart-2)
- [ConfXMLParamCdbStart(ConfPath, MountIdInterface, String, String, int)](#s-ConfXMLParamCdbStart-3)
- [ConfXMLParamCdbStart(int, int, int)](#s-ConfXMLParamCdbStart-4)
- [ConfXMLParamCdbStart(String, String, int)](#s-ConfXMLParamCdbStart-5)

**Fields**:

- [J_BINARY](ConfObject.md#s-J_BINARY) from ConfObject
- [J_BIT32](ConfObject.md#s-J_BIT32) from ConfObject
- [J_BIT64](ConfObject.md#s-J_BIT64) from ConfObject
- [J_BITBIG](ConfObject.md#s-J_BITBIG) from ConfObject
- [J_BOOL](ConfObject.md#s-J_BOOL) from ConfObject
- [J_BUF](ConfObject.md#s-J_BUF) from ConfObject
- [J_CDBBEGIN](ConfObject.md#s-J_CDBBEGIN) from ConfObject
- [J_DATE](ConfObject.md#s-J_DATE) from ConfObject
- [J_DATETIME](ConfObject.md#s-J_DATETIME) from ConfObject
- [J_DECIMAL64](ConfObject.md#s-J_DECIMAL64) from ConfObject
- [J_DEFAULT](ConfObject.md#s-J_DEFAULT) from ConfObject
- [J_DOUBLE](ConfObject.md#s-J_DOUBLE) from ConfObject
- [J_DQUAD](ConfObject.md#s-J_DQUAD) from ConfObject
- [J_DURATION](ConfObject.md#s-J_DURATION) from ConfObject
- [J_EMPTY](ConfObject.md#s-J_EMPTY) from ConfObject
- [J_ENUMERATION](ConfObject.md#s-J_ENUMERATION) from ConfObject
- [J_HEXSTR](ConfObject.md#s-J_HEXSTR) from ConfObject
- [J_IDENTITYREF](ConfObject.md#s-J_IDENTITYREF) from ConfObject
- [J_INSTANCE_IDENTIFIER](ConfObject.md#s-J_INSTANCE_IDENTIFIER) from ConfObject
- [J_INT16](ConfObject.md#s-J_INT16) from ConfObject
- [J_INT32](ConfObject.md#s-J_INT32) from ConfObject
- [J_INT64](ConfObject.md#s-J_INT64) from ConfObject
- [J_INT8](ConfObject.md#s-J_INT8) from ConfObject
- [J_IPV4](ConfObject.md#s-J_IPV4) from ConfObject
- [J_IPV4_AND_PLEN](ConfObject.md#s-J_IPV4_AND_PLEN) from ConfObject
- [J_IPV4PREFIX](ConfObject.md#s-J_IPV4PREFIX) from ConfObject
- [J_IPV6](ConfObject.md#s-J_IPV6) from ConfObject
- [J_IPV6_AND_PLEN](ConfObject.md#s-J_IPV6_AND_PLEN) from ConfObject
- [J_IPV6PREFIX](ConfObject.md#s-J_IPV6PREFIX) from ConfObject
- [J_LIST](ConfObject.md#s-J_LIST) from ConfObject
- [J_NOEXISTS](ConfObject.md#s-J_NOEXISTS) from ConfObject
- [J_OBJECTREF](ConfObject.md#s-J_OBJECTREF) from ConfObject
- [J_OID](ConfObject.md#s-J_OID) from ConfObject
- [J_PTR](ConfObject.md#s-J_PTR) from ConfObject
- [J_QNAME](ConfObject.md#s-J_QNAME) from ConfObject
- [J_STR](ConfObject.md#s-J_STR) from ConfObject
- [J_SYMBOL](ConfObject.md#s-J_SYMBOL) from ConfObject
- [J_TIME](ConfObject.md#s-J_TIME) from ConfObject
- [J_UINT16](ConfObject.md#s-J_UINT16) from ConfObject
- [J_UINT32](ConfObject.md#s-J_UINT32) from ConfObject
- [J_UINT64](ConfObject.md#s-J_UINT64) from ConfObject
- [J_UINT8](ConfObject.md#s-J_UINT8) from ConfObject
- [J_UNION](ConfObject.md#s-J_UNION) from ConfObject
- [J_XMLBEGIN](ConfObject.md#s-J_XMLBEGIN) from ConfObject
- [J_XMLBEGINDEL](ConfObject.md#s-J_XMLBEGINDEL) from ConfObject
- [J_XMLEND](ConfObject.md#s-J_XMLEND) from ConfObject
- [J_XMLMOVEAFTER](ConfObject.md#s-J_XMLMOVEAFTER) from ConfObject
- [J_XMLMOVEFIRST](ConfObject.md#s-J_XMLMOVEFIRST) from ConfObject
- [J_XMLTAG](ConfObject.md#s-J_XMLTAG) from ConfObject
- [namespace](ConfXMLParam.md#s-namespace) from ConfXMLParam
- [ns](ConfXMLParam.md#s-ns) from ConfXMLParam
- [prefix](ConfXMLParam.md#s-prefix) from ConfXMLParam
- [tag](ConfXMLParam.md#s-tag) from ConfXMLParam
- [tagString](ConfXMLParam.md#s-tagString) from ConfXMLParam
- [val](ConfXMLParam.md#s-val) from ConfXMLParam

**Methods**:

- [clone()](ConfObject.md#s-clone) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#s-compare) from ConfObject
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [decodeParam(ConfEObject)](ConfXMLParam.md#s-decodeParam) from ConfXMLParam
- [decodeParams(ConfEObject)](ConfXMLParam.md#s-decodeParams) from ConfXMLParam
- [encode()](ConfXMLParam.md#s-encode) from ConfXMLParam
- [encode(ConfXMLParam[])](ConfXMLParam.md#s-encode-1) from ConfXMLParam
- [encode(List<String>)](ConfXMLParam.md#s-encode-2) from ConfXMLParam
- [encode(List<String>, ConfXMLParam[])](ConfXMLParam.md#s-encode-3) from ConfXMLParam
- [encodeHKP()](ConfXMLParam.md#s-encodeHKP) from ConfXMLParam
- [encodeHKP(ConfXMLParam[])](ConfXMLParam.md#s-encodeHKP-1) from ConfXMLParam
- [encodeHKP(List<String>)](ConfXMLParam.md#s-encodeHKP-2) from ConfXMLParam
- [encodeHKP(List<String>, ConfXMLParam[])](ConfXMLParam.md#s-encodeHKP-3) from ConfXMLParam
- [encodeIKP()](ConfXMLParam.md#s-encodeIKP) from ConfXMLParam
- [encodeIKP(ConfXMLParam[])](ConfXMLParam.md#s-encodeIKP-1) from ConfXMLParam
- [encodeIKP(List<String>)](ConfXMLParam.md#s-encodeIKP-2) from ConfXMLParam
- [encodeIKP(List<String>, ConfXMLParam[])](ConfXMLParam.md#s-encodeIKP-3) from ConfXMLParam
- [equals(Object)](ConfXMLParamStart.md#s-equals) from ConfXMLParamStart
- [getConfNamespace()](ConfXMLParam.md#s-getConfNamespace) from ConfXMLParam
- [getNSHash()](ConfXMLParam.md#s-getNSHash) from ConfXMLParam
- [getTag()](ConfXMLParam.md#s-getTag) from ConfXMLParam
- [getTagHash()](ConfXMLParam.md#s-getTagHash) from ConfXMLParam
- [getValue()](ConfXMLParam.md#s-getValue) from ConfXMLParam
- [hashCode()](ConfXMLParamStart.md#s-hashCode) from ConfXMLParamStart
- [setCdbInstanceInteger(int)](ConfXMLParam.md#s-setCdbInstanceInteger) from ConfXMLParam
- [setNamespace(ConfNamespace)](ConfXMLParam.md#s-setNamespace) from ConfXMLParam
- [setNamespaceFromMountId(List<String>)](ConfXMLParam.md#s-setNamespaceFromMountId) from ConfXMLParam
- [toDOM(ConfXMLParam[])](ConfXMLParam.md#s-toDOM) from ConfXMLParam
- [toDOM(ConfXMLParam[], String, String)](ConfXMLParam.md#s-toDOM-1) from ConfXMLParam
- [toString()](ConfXMLParam.md#s-toString) from ConfXMLParam
- [toXML(ConfXMLParam[])](ConfXMLParam.md#s-toXML) from ConfXMLParam
- [toXML(ConfXMLParam[], String, String)](ConfXMLParam.md#s-toXML-1) from ConfXMLParam
- [toXMLParams(String, ConfPath)](ConfXMLParam.md#s-toXMLParams) from ConfXMLParam
- [toXMLParams(String, ConfPath, int)](ConfXMLParam.md#s-toXMLParams-1) from ConfXMLParam

## Constructors

<a id="s-ConfXMLParamCdbStart-1"></a>
### ConfXMLParamCdbStart(ConfEObject, int)

```java
public ConfXMLParamCdbStart(
    com.tailf.proto.ConfEObject o,
    int cdbInstanceInteger
)
    throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`
- `int cdbInstanceInteger`

<a id="s-ConfXMLParamCdbStart-2"></a>
### ConfXMLParamCdbStart(ConfNamespace, String, int)

```java
public ConfXMLParamCdbStart(
    com.tailf.conf.ConfNamespace namespace,
    String tagString,
    int cdbInstanceInteger
)
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace namespace`
- `String tagString`
- `int cdbInstanceInteger`

<a id="s-ConfXMLParamCdbStart-3"></a>
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

Types: [ConfPath](ConfPath.md#s-ConfPath), [MountIdInterface](MountIdInterface.md#s-MountIdInterface)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.conf.MountIdInterface mountIdGetter`
- `String prefix`
- `String tagString`
- `int cdbInstanceInteger`

<a id="s-ConfXMLParamCdbStart-4"></a>
### ConfXMLParamCdbStart(int, int, int)

```java
public ConfXMLParamCdbStart(int ns, int tag, int cdbInstanceInteger)
```

**Parameters**

- `int ns`
- `int tag`
- `int cdbInstanceInteger`

<a id="s-ConfXMLParamCdbStart-5"></a>
### ConfXMLParamCdbStart(String, String, int)

```java
public ConfXMLParamCdbStart(String prefix, String tagString, int cdbInstanceInteger)
```

**Parameters**

- `String prefix`
- `String tagString`
- `int cdbInstanceInteger`
