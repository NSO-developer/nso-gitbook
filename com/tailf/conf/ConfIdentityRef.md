# ConfIdentityRef <a href="#cls-ConfIdentityRef" id="cls-ConfIdentityRef"></a>

```java
public class com.tailf.conf.ConfIdentityRef
    extends com.tailf.conf.ConfValue
    implements Cloneable, java.io.Serializable
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

DATA_CONTAINER - Corresponds to the YANG identityRef type.

## Members

**Constructors**:

- [ConfIdentityRef(ConfEObject)](#m-ConfIdentityRef-606d2de13588)
- [ConfIdentityRef(ConfPath, MountIdInterface, String, String)](#m-ConfIdentityRef-2b17c0a14ff7)
- [ConfIdentityRef(int, int)](#m-ConfIdentityRef-efe3515a94c1)
- [ConfIdentityRef(String)](#m-ConfIdentityRef-a0450624b169)
- [ConfIdentityRef(String, String)](#m-ConfIdentityRef-bc8f9fb1df3d)

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
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getConfNamespace()](#m-getConfNamespace-87556caf3223)
- [getNSHash()](#m-getNSHash-2129fb8b3cfe)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getStringByValue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getStringByValue-8ed173dcf8dc) from ConfValue
- [getTag()](#m-getTag-315f45956d6f)
- [getTagHash()](#m-getTagHash-8f057919039c)
- [getUri()](#m-getUri-e839fdd3e24c)
- [getValueByString(ConfPath, String)](ConfValue.md#m-getValueByString-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getValueByString-7804643cb027) from ConfValue
- [hashCode()](#m-hashCode-ef797a217903)
- [setConfNamespace(ConfNamespace)](#m-setConfNamespace-7fef1b53f52c)
- [toString()](#m-toString-e9d48c5503ef)
- [toString(int)](#m-toString-477fa787d7c7)

## Constructors

### ConfIdentityRef(ConfEObject) <a href="#m-ConfIdentityRef-606d2de13588" id="m-ConfIdentityRef-606d2de13588"></a>

```java
public ConfIdentityRef(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfIdentityRef(ConfPath, MountIdInterface, String, String) <a href="#m-ConfIdentityRef-2b17c0a14ff7" id="m-ConfIdentityRef-2b17c0a14ff7"></a>

```java
public ConfIdentityRef(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.MountIdInterface mountIdGetter,
    String prefix,
    String tagname
)
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [MountIdInterface](MountIdInterface.md#cls-MountIdInterface)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.conf.MountIdInterface mountIdGetter`
- `String prefix`
- `String tagname`

### ConfIdentityRef(int, int) <a href="#m-ConfIdentityRef-efe3515a94c1" id="m-ConfIdentityRef-efe3515a94c1"></a>

```java
public ConfIdentityRef(int ns, int tag)
```

**Parameters**

- `int ns` - Namespace hash
- `int tag` - tagHash

### ConfIdentityRef(String) <a href="#m-ConfIdentityRef-a0450624b169" id="m-ConfIdentityRef-a0450624b169"></a>

```java
public ConfIdentityRef(String tagname)
```

**Parameters**

- `String tagname`

### ConfIdentityRef(String, String) <a href="#m-ConfIdentityRef-bc8f9fb1df3d" id="m-ConfIdentityRef-bc8f9fb1df3d"></a>

```java
public ConfIdentityRef(String nsURI, String tagname)
```

**Parameters**

- `String nsURI`
- `String tagname`


## Methods

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getConfNamespace() <a href="#m-getConfNamespace-87556caf3223" id="m-getConfNamespace-87556caf3223"></a>

```java
public com.tailf.conf.ConfNamespace getConfNamespace()
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

### getNSHash() <a href="#m-getNSHash-2129fb8b3cfe" id="m-getNSHash-2129fb8b3cfe"></a>

```java
public int getNSHash()
```

### getTag() <a href="#m-getTag-315f45956d6f" id="m-getTag-315f45956d6f"></a>

```java
public String getTag()
```

### getTagHash() <a href="#m-getTagHash-8f057919039c" id="m-getTagHash-8f057919039c"></a>

```java
public int getTagHash()
```

### getUri() <a href="#m-getUri-e839fdd3e24c" id="m-getUri-e839fdd3e24c"></a>

```java
public String getUri()
```

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### setConfNamespace(ConfNamespace) <a href="#m-setConfNamespace-7fef1b53f52c" id="m-setConfNamespace-7fef1b53f52c"></a>

```java
public void setConfNamespace(com.tailf.conf.ConfNamespace nsObj)
```

Types: [ConfNamespace](ConfNamespace.md#cls-ConfNamespace)

**Parameters**

- `com.tailf.conf.ConfNamespace nsObj`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

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
