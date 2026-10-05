<a id="cls-ConfXKey"></a>
# ConfXKey

```java
public class com.tailf.conf.ConfXKey
    extends com.tailf.conf.ConfKey
```

Types: [ConfKey](ConfKey.md#cls-ConfKey)

## Members

**Constructors**:

- [ConfXKey(ConfObject[], Map<CSNode,ConfValue>)](#m-confxkey-412c4b0647ab)

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

**Methods**:

- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [elementAt(int)](ConfKey.md#m-elementat-7ff98e6e0268) from ConfKey
- [elements()](ConfKey.md#m-elements-1ac1cabc0e96) from ConfKey
- [encode()](ConfKey.md#m-encode-fbae522bba37) from ConfKey
- [equals(Object)](ConfKey.md#m-equals-fcd6492e0d6c) from ConfKey
- [hashCode()](ConfKey.md#m-hashcode-ef797a217903) from ConfKey
- [length()](ConfKey.md#m-length-89e7822f25ca) from ConfKey
- [setPath(InstancePath)](ConfKey.md#m-setpath-ad9962db3cab) from ConfKey
- [toStrictlyQuotedString()](ConfKey.md#m-tostrictlyquotedstring-c10aef71d8ba) from ConfKey
- [toString()](#m-tostring-e9d48c5503ef)
- [toString(boolean)](ConfKey.md#m-tostring-b87d88746a2e) from ConfKey

## Constructors

<a id="m-confxkey-412c4b0647ab"></a>
### ConfXKey(ConfObject[], Map<CSNode,ConfValue>)

```java
public ConfXKey(
    com.tailf.conf.ConfObject[] vals,
    java.util.Map<com.tailf.maapi.MaapiSchemas.CSNode,com.tailf.conf.ConfValue> keyEntries
)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfValue](ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.conf.ConfObject[] vals`
- `java.util.Map<com.tailf.maapi.MaapiSchemas.CSNode,com.tailf.conf.ConfValue> keyEntries`


## Methods

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
