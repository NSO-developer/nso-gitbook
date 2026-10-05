<a id="cls-ConfTagDefault"></a>
# ConfTagDefault

```java
public class com.tailf.conf.ConfTagDefault
    extends com.tailf.conf.ConfTag
```

Types: [ConfTag](ConfTag.md#cls-ConfTag)

Class representing an element in a model. This class is used to indicate
 that a default case is set in the call to Maapi.getCase() when NO_DEFAULTS
 flag is in use.

## Members

**Constructors**:

- [ConfTagDefault()](#m-conftagdefault-2837c3747bb4)

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
- [compareTo(ConfTagDefault)](#m-compareto-faec48f817d8)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](#m-encode-fbae522bba37)
- [encodeIKP()](ConfTag.md#m-encodeikp-b160b87f6433) from ConfTag
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getConfNamespace()](ConfTag.md#m-getconfnamespace-87556caf3223) from ConfTag
- [getNSHash()](ConfTag.md#m-getnshash-2129fb8b3cfe) from ConfTag
- [getPrefix()](ConfTag.md#m-getprefix-9268091e0223) from ConfTag
- [getTag()](ConfTag.md#m-gettag-315f45956d6f) from ConfTag
- [getTagHash()](ConfTag.md#m-gettaghash-8f057919039c) from ConfTag
- [getURI()](ConfTag.md#m-geturi-7ec1ffd8cd93) from ConfTag
- [hashCode()](#m-hashcode-ef797a217903)
- [isLenient()](ConfTag.md#m-islenient-47b594aa27c3) from ConfTag
- [setConfNamespace(ConfNamespace)](ConfTag.md#m-setconfnamespace-7fef1b53f52c) from ConfTag
- [setLenient(boolean)](ConfTag.md#m-setlenient-7cd970533a41) from ConfTag
- [toString()](#m-tostring-e9d48c5503ef)
- [toString(ConfNamespace)](ConfTag.md#m-tostring-97a6a914714f) from ConfTag
- [toString(int)](ConfTag.md#m-tostring-477fa787d7c7) from ConfTag

## Constructors

<a id="m-conftagdefault-2837c3747bb4"></a>
### ConfTagDefault()

```java
public ConfTagDefault()
```


## Methods

<a id="m-compareto-faec48f817d8"></a>
### compareTo(ConfTagDefault)

```java
public int compareTo(com.tailf.conf.ConfTagDefault o)
```

Types: [ConfTagDefault](ConfTagDefault.md#cls-ConfTagDefault)

**Parameters**

- `com.tailf.conf.ConfTagDefault o`

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
