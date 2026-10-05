<a id="cls-ConfTag"></a>
# ConfTag

```java
public class com.tailf.conf.ConfTag
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Class representing an element in a model. This class is used e.g
 when an instance path is represented as an array of ConfTag/ConfKey
 values.

**Related classes**

- [ConfTagDefault](ConfTagDefault.md#cls-ConfTagDefault)

## Members

**Constructors**:

- [ConfTag()](#m-conftag-0c8367dd87ad)
- [ConfTag(ConfEObject)](#m-conftag-44bc0ef54539)
- [ConfTag(ConfNamespace, int)](#m-conftag-44aa39640f34)
- [ConfTag(ConfNamespace, String)](#m-conftag-ea99fbb70c5a)
- [ConfTag(int, int)](#m-conftag-5f08034f3cee)
- [ConfTag(int, String)](#m-conftag-2ad0f6760145)
- [ConfTag(String)](#m-conftag-0f38a2807b74)
- [ConfTag(String, int)](#m-conftag-a8f827e1ffad)
- [ConfTag(String, String)](#m-conftag-aee19ff3488f)

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
- [encode()](#m-encode-fbae522bba37)
- [encodeIKP()](#m-encodeikp-b160b87f6433)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getConfNamespace()](#m-getconfnamespace-87556caf3223)
- [getNSHash()](#m-getnshash-2129fb8b3cfe)
- [getPrefix()](#m-getprefix-9268091e0223)
- [getTag()](#m-gettag-315f45956d6f)
- [getTagHash()](#m-gettaghash-8f057919039c)
- [getURI()](#m-geturi-7ec1ffd8cd93)
- [hashCode()](#m-hashcode-ef797a217903)
- [isLenient()](#m-islenient-47b594aa27c3)
- [setConfNamespace(ConfNamespace)](#m-setconfnamespace-7fef1b53f52c)
- [setLenient(boolean)](#m-setlenient-7cd970533a41)
- [toString()](#m-tostring-e9d48c5503ef)
- [toString(ConfNamespace)](#m-tostring-97a6a914714f)
- [toString(int)](#m-tostring-477fa787d7c7)

## Constructors

<a id="m-conftag-0c8367dd87ad"></a>
### ConfTag()

```java
protected ConfTag()
```

<a id="m-conftag-44bc0ef54539"></a>
### ConfTag(ConfEObject)

```java
public ConfTag(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="m-conftag-44aa39640f34"></a>
### ConfTag(ConfNamespace, int)

```java
public ConfTag(com.tailf.conf.ConfNamespace nsObj, int tag)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`
- `int tag`

<a id="m-conftag-ea99fbb70c5a"></a>
### ConfTag(ConfNamespace, String)

```java
public ConfTag(com.tailf.conf.ConfNamespace nsObj, String tagName)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`
- `String tagName`

<a id="m-conftag-5f08034f3cee"></a>
### ConfTag(int, int)

```java
public ConfTag(int ns, int tag)
```

**Parameters**

- `int ns`
- `int tag`

<a id="m-conftag-2ad0f6760145"></a>
### ConfTag(int, String)

```java
public ConfTag(int ns, String tagname)
```

**Parameters**

- `int ns`
- `String tagname`

<a id="m-conftag-0f38a2807b74"></a>
### ConfTag(String)

```java
public ConfTag(String tagName)
```

**Parameters**

- `String tagName`

<a id="m-conftag-a8f827e1ffad"></a>
### ConfTag(String, int)

```java
public ConfTag(String nsURI, int tag)
```

**Parameters**

- `String nsURI`
- `int tag`

<a id="m-conftag-aee19ff3488f"></a>
### ConfTag(String, String)

```java
public ConfTag(String nsPrefix, String tagName)
```

**Parameters**

- `String nsPrefix`
- `String tagName`


## Methods

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

<a id="m-encodeikp-b160b87f6433"></a>
### encodeIKP()

```java
public com.tailf.proto.ConfEObject encodeIKP()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Determine if two ConfTags are equal.
 Two ConfTag are equals if their tagname and nsUri are equals.
 or if tag values and ns values are the same.

**Parameters**

- `Object o` - ConfObjectRef that is to be compared to.

**Returns:** true if the objects are identical.

<a id="m-getconfnamespace-87556caf3223"></a>
### getConfNamespace()

```java
public com.tailf.conf.ConfNamespace getConfNamespace()
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

<a id="m-getnshash-2129fb8b3cfe"></a>
### getNSHash()

```java
public int getNSHash()
```

<a id="m-getprefix-9268091e0223"></a>
### getPrefix()

```java
public String getPrefix()
```

<a id="m-gettag-315f45956d6f"></a>
### getTag()

```java
public String getTag()
```

<a id="m-gettaghash-8f057919039c"></a>
### getTagHash()

```java
public int getTagHash()
```

<a id="m-geturi-7ec1ffd8cd93"></a>
### getURI()

```java
public String getURI()
```

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-islenient-47b594aa27c3"></a>
### isLenient()

```java
public boolean isLenient()
```

<a id="m-setconfnamespace-7fef1b53f52c"></a>
### setConfNamespace(ConfNamespace)

```java
public void setConfNamespace(com.tailf.conf.ConfNamespace nsObj)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`

<a id="m-setlenient-7cd970533a41"></a>
### setLenient(boolean)

```java
public void setLenient(boolean lenient)
```

**Parameters**

- `boolean lenient`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-tostring-97a6a914714f"></a>
### toString(ConfNamespace)

**Package-private**

```java
String toString(com.tailf.conf.ConfNamespace prevNsObj)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace prevNsObj`

<a id="m-tostring-477fa787d7c7"></a>
### toString(int)

**Package-private**

```java
String toString(int prevNs)
```

package-private version for printing list of keypaths (prefix not shown
 more than once in the beginning or when namespace is changed in middle of
 path)

**Parameters**

- `int prevNs`
