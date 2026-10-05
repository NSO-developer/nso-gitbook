# ConfTag <a href="#cls-ConfTag" id="cls-ConfTag"></a>

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

- [ConfTag()](#m-ConfTag-0c8367dd87ad)
- [ConfTag(ConfEObject)](#m-ConfTag-44bc0ef54539)
- [ConfTag(ConfNamespace, int)](#m-ConfTag-44aa39640f34)
- [ConfTag(ConfNamespace, String)](#m-ConfTag-ea99fbb70c5a)
- [ConfTag(int, int)](#m-ConfTag-5f08034f3cee)
- [ConfTag(int, String)](#m-ConfTag-2ad0f6760145)
- [ConfTag(String)](#m-ConfTag-0f38a2807b74)
- [ConfTag(String, int)](#m-ConfTag-a8f827e1ffad)
- [ConfTag(String, String)](#m-ConfTag-aee19ff3488f)

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
- [encodeIKP()](#m-encodeIKP-b160b87f6433)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getConfNamespace()](#m-getConfNamespace-87556caf3223)
- [getNSHash()](#m-getNSHash-2129fb8b3cfe)
- [getPrefix()](#m-getPrefix-9268091e0223)
- [getTag()](#m-getTag-315f45956d6f)
- [getTagHash()](#m-getTagHash-8f057919039c)
- [getURI()](#m-getURI-7ec1ffd8cd93)
- [hashCode()](#m-hashCode-ef797a217903)
- [isLenient()](#m-isLenient-47b594aa27c3)
- [setConfNamespace(ConfNamespace)](#m-setConfNamespace-7fef1b53f52c)
- [setLenient(boolean)](#m-setLenient-7cd970533a41)
- [toString()](#m-toString-e9d48c5503ef)
- [toString(ConfNamespace)](#m-toString-97a6a914714f)
- [toString(int)](#m-toString-477fa787d7c7)

## Constructors

### ConfTag() <a href="#m-ConfTag-0c8367dd87ad" id="m-ConfTag-0c8367dd87ad"></a>

```java
protected ConfTag()
```

### ConfTag(ConfEObject) <a href="#m-ConfTag-44bc0ef54539" id="m-ConfTag-44bc0ef54539"></a>

```java
public ConfTag(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfTag(ConfNamespace, int) <a href="#m-ConfTag-44aa39640f34" id="m-ConfTag-44aa39640f34"></a>

```java
public ConfTag(com.tailf.conf.ConfNamespace nsObj, int tag)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`
- `int tag`

### ConfTag(ConfNamespace, String) <a href="#m-ConfTag-ea99fbb70c5a" id="m-ConfTag-ea99fbb70c5a"></a>

```java
public ConfTag(com.tailf.conf.ConfNamespace nsObj, String tagName)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`
- `String tagName`

### ConfTag(int, int) <a href="#m-ConfTag-5f08034f3cee" id="m-ConfTag-5f08034f3cee"></a>

```java
public ConfTag(int ns, int tag)
```

**Parameters**

- `int ns`
- `int tag`

### ConfTag(int, String) <a href="#m-ConfTag-2ad0f6760145" id="m-ConfTag-2ad0f6760145"></a>

```java
public ConfTag(int ns, String tagname)
```

**Parameters**

- `int ns`
- `String tagname`

### ConfTag(String) <a href="#m-ConfTag-0f38a2807b74" id="m-ConfTag-0f38a2807b74"></a>

```java
public ConfTag(String tagName)
```

**Parameters**

- `String tagName`

### ConfTag(String, int) <a href="#m-ConfTag-a8f827e1ffad" id="m-ConfTag-a8f827e1ffad"></a>

```java
public ConfTag(String nsURI, int tag)
```

**Parameters**

- `String nsURI`
- `int tag`

### ConfTag(String, String) <a href="#m-ConfTag-aee19ff3488f" id="m-ConfTag-aee19ff3488f"></a>

```java
public ConfTag(String nsPrefix, String tagName)
```

**Parameters**

- `String nsPrefix`
- `String tagName`


## Methods

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

### encodeIKP() <a href="#m-encodeIKP-b160b87f6433" id="m-encodeIKP-b160b87f6433"></a>

```java
public com.tailf.proto.ConfEObject encodeIKP()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Determine if two ConfTags are equal.
 Two ConfTag are equals if their tagname and nsUri are equals.
 or if tag values and ns values are the same.

**Parameters**

- `Object o` - ConfObjectRef that is to be compared to.

**Returns:** true if the objects are identical.

### getConfNamespace() <a href="#m-getConfNamespace-87556caf3223" id="m-getConfNamespace-87556caf3223"></a>

```java
public com.tailf.conf.ConfNamespace getConfNamespace()
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

### getNSHash() <a href="#m-getNSHash-2129fb8b3cfe" id="m-getNSHash-2129fb8b3cfe"></a>

```java
public int getNSHash()
```

### getPrefix() <a href="#m-getPrefix-9268091e0223" id="m-getPrefix-9268091e0223"></a>

```java
public String getPrefix()
```

### getTag() <a href="#m-getTag-315f45956d6f" id="m-getTag-315f45956d6f"></a>

```java
public String getTag()
```

### getTagHash() <a href="#m-getTagHash-8f057919039c" id="m-getTagHash-8f057919039c"></a>

```java
public int getTagHash()
```

### getURI() <a href="#m-getURI-7ec1ffd8cd93" id="m-getURI-7ec1ffd8cd93"></a>

```java
public String getURI()
```

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### isLenient() <a href="#m-isLenient-47b594aa27c3" id="m-isLenient-47b594aa27c3"></a>

```java
public boolean isLenient()
```

### setConfNamespace(ConfNamespace) <a href="#m-setConfNamespace-7fef1b53f52c" id="m-setConfNamespace-7fef1b53f52c"></a>

```java
public void setConfNamespace(com.tailf.conf.ConfNamespace nsObj)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`

### setLenient(boolean) <a href="#m-setLenient-7cd970533a41" id="m-setLenient-7cd970533a41"></a>

```java
public void setLenient(boolean lenient)
```

**Parameters**

- `boolean lenient`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### toString(ConfNamespace) <a href="#m-toString-97a6a914714f" id="m-toString-97a6a914714f"></a>

**Package-private**

```java
String toString(com.tailf.conf.ConfNamespace prevNsObj)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace prevNsObj`

### toString(int) <a href="#m-toString-477fa787d7c7" id="m-toString-477fa787d7c7"></a>

**Package-private**

```java
String toString(int prevNs)
```

package-private version for printing list of keypaths (prefix not shown
 more than once in the beginning or when namespace is changed in middle of
 path)

**Parameters**

- `int prevNs`
