<a id="s-ConfTag"></a>
# ConfTag

```java
public class com.tailf.conf.ConfTag
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Class representing an element in a model. This class is used e.g
 when an instance path is represented as an array of ConfTag/ConfKey
 values.

**Related classes**

- [ConfTagDefault](ConfTagDefault.md#s-ConfTagDefault)

## Members

**Constructors**:

- [ConfTag()](#s-ConfTag-1)
- [ConfTag(ConfEObject)](#s-ConfTag-2)
- [ConfTag(ConfNamespace, int)](#s-ConfTag-3)
- [ConfTag(ConfNamespace, String)](#s-ConfTag-4)
- [ConfTag(int, int)](#s-ConfTag-5)
- [ConfTag(int, String)](#s-ConfTag-6)
- [ConfTag(String)](#s-ConfTag-7)
- [ConfTag(String, int)](#s-ConfTag-8)
- [ConfTag(String, String)](#s-ConfTag-9)

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

**Methods**:

- [clone()](ConfObject.md#s-clone) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#s-compare) from ConfObject
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](#s-encode)
- [encodeIKP()](#s-encodeIKP)
- [equals(Object)](#s-equals)
- [getConfNamespace()](#s-getConfNamespace)
- [getNSHash()](#s-getNSHash)
- [getPrefix()](#s-getPrefix)
- [getTag()](#s-getTag)
- [getTagHash()](#s-getTagHash)
- [getURI()](#s-getURI)
- [hashCode()](#s-hashCode)
- [hashToInt(ConfELong)](#s-hashToInt)
- [hashToInt(long)](#s-hashToInt-1)
- [hashToLong(int)](#s-hashToLong)
- [isLenient()](#s-isLenient)
- [setConfNamespace(ConfNamespace)](#s-setConfNamespace)
- [setLenient(boolean)](#s-setLenient)
- [toString()](#s-toString)
- [toString(ConfNamespace)](#s-toString-1)
- [toString(int)](#s-toString-2)

## Constructors

<a id="s-ConfTag-1"></a>
### ConfTag()

```java
protected ConfTag()
```

<a id="s-ConfTag-2"></a>
### ConfTag(ConfEObject)

```java
public ConfTag(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-ConfTag-3"></a>
### ConfTag(ConfNamespace, int)

```java
public ConfTag(com.tailf.conf.ConfNamespace nsObj, int tag)
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`
- `int tag`

<a id="s-ConfTag-4"></a>
### ConfTag(ConfNamespace, String)

```java
public ConfTag(com.tailf.conf.ConfNamespace nsObj, String tagName)
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`
- `String tagName`

<a id="s-ConfTag-5"></a>
### ConfTag(int, int)

```java
public ConfTag(int ns, int tag)
```

**Parameters**

- `int ns`
- `int tag`

<a id="s-ConfTag-6"></a>
### ConfTag(int, String)

```java
public ConfTag(int ns, String tagname)
```

**Parameters**

- `int ns`
- `String tagname`

<a id="s-ConfTag-7"></a>
### ConfTag(String)

```java
public ConfTag(String tagName)
```

**Parameters**

- `String tagName`

<a id="s-ConfTag-8"></a>
### ConfTag(String, int)

```java
public ConfTag(String nsURI, int tag)
```

**Parameters**

- `String nsURI`
- `int tag`

<a id="s-ConfTag-9"></a>
### ConfTag(String, String)

```java
public ConfTag(String nsPrefix, String tagName)
```

**Parameters**

- `String nsPrefix`
- `String tagName`


## Methods

<a id="s-encode"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-encodeIKP"></a>
### encodeIKP()

```java
public com.tailf.proto.ConfEObject encodeIKP()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-equals"></a>
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

<a id="s-getConfNamespace"></a>
### getConfNamespace()

```java
public com.tailf.conf.ConfNamespace getConfNamespace()
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace)

<a id="s-getNSHash"></a>
### getNSHash()

```java
public int getNSHash()
```

<a id="s-getPrefix"></a>
### getPrefix()

```java
public String getPrefix()
```

<a id="s-getTag"></a>
### getTag()

```java
public String getTag()
```

<a id="s-getTagHash"></a>
### getTagHash()

```java
public int getTagHash()
```

<a id="s-getURI"></a>
### getURI()

```java
public String getURI()
```

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-hashToInt"></a>
### hashToInt(ConfELong)

```java
public static int hashToInt(com.tailf.proto.ConfELong hash)
```

Types: [ConfELong](../proto/ConfELong.md#s-ConfELong)

**Parameters**

- `com.tailf.proto.ConfELong hash`

<a id="s-hashToInt-1"></a>
### hashToInt(long)

```java
public static int hashToInt(long hash)
```

**Parameters**

- `long hash`

<a id="s-hashToLong"></a>
### hashToLong(int)

```java
public static long hashToLong(int hash)
```

**Parameters**

- `int hash`

<a id="s-isLenient"></a>
### isLenient()

```java
public boolean isLenient()
```

<a id="s-setConfNamespace"></a>
### setConfNamespace(ConfNamespace)

```java
public void setConfNamespace(com.tailf.conf.ConfNamespace nsObj)
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`

<a id="s-setLenient"></a>
### setLenient(boolean)

```java
public void setLenient(boolean lenient)
```

**Parameters**

- `boolean lenient`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-toString-1"></a>
### toString(ConfNamespace)

**Package-private**

```java
String toString(com.tailf.conf.ConfNamespace prevNsObj)
```

Types: [ConfNamespace](ConfNamespace.md#s-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace prevNsObj`

<a id="s-toString-2"></a>
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
