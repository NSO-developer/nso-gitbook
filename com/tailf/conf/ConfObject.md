# ConfObject <a href="#cls-ConfObject" id="cls-ConfObject"></a>

```java
public abstract class com.tailf.conf.ConfObject
    implements Cloneable, java.io.Serializable
```

Base class of the Conf data type classes. This class is used to represent an
 arbitrary Conf term.

**Related classes**

- [ConfKey](ConfKey.md#cls-ConfKey)
- [ConfTag](ConfTag.md#cls-ConfTag)
- [ConfTypeDescriptor](ConfTypeDescriptor.md#cls-ConfTypeDescriptor)
- [ConfValue](ConfValue.md#cls-ConfValue)
- [ConfXMLParam](ConfXMLParam.md#cls-ConfXMLParam)

## Members

**Constructors**:

- [ConfObject()](#m-ConfObject-bbefd68dfb09)

**Fields**:

- [J_BINARY](#m-J_BINARY)
- [J_BIT32](#m-J_BIT32)
- [J_BIT64](#m-J_BIT64)
- [J_BITBIG](#m-J_BITBIG)
- [J_BOOL](#m-J_BOOL)
- [J_BUF](#m-J_BUF)
- [J_CDBBEGIN](#m-J_CDBBEGIN)
- [J_DATE](#m-J_DATE)
- [J_DATETIME](#m-J_DATETIME)
- [J_DECIMAL64](#m-J_DECIMAL64)
- [J_DEFAULT](#m-J_DEFAULT)
- [J_DOUBLE](#m-J_DOUBLE)
- [J_DQUAD](#m-J_DQUAD)
- [J_DURATION](#m-J_DURATION)
- [J_EMPTY](#m-J_EMPTY)
- [J_ENUMERATION](#m-J_ENUMERATION)
- [J_HEXSTR](#m-J_HEXSTR)
- [J_IDENTITYREF](#m-J_IDENTITYREF)
- [J_INSTANCE_IDENTIFIER](#m-J_INSTANCE_IDENTIFIER)
- [J_INT16](#m-J_INT16)
- [J_INT32](#m-J_INT32)
- [J_INT64](#m-J_INT64)
- [J_INT8](#m-J_INT8)
- [J_IPV4](#m-J_IPV4)
- [J_IPV4_AND_PLEN](#m-J_IPV4_AND_PLEN)
- [J_IPV4PREFIX](#m-J_IPV4PREFIX)
- [J_IPV6](#m-J_IPV6)
- [J_IPV6_AND_PLEN](#m-J_IPV6_AND_PLEN)
- [J_IPV6PREFIX](#m-J_IPV6PREFIX)
- [J_LIST](#m-J_LIST)
- [J_NOEXISTS](#m-J_NOEXISTS)
- [J_OBJECTREF](#m-J_OBJECTREF)
- [J_OID](#m-J_OID)
- [J_PTR](#m-J_PTR)
- [J_QNAME](#m-J_QNAME)
- [J_STR](#m-J_STR)
- [J_SYMBOL](#m-J_SYMBOL)
- [J_TIME](#m-J_TIME)
- [J_UINT16](#m-J_UINT16)
- [J_UINT32](#m-J_UINT32)
- [J_UINT64](#m-J_UINT64)
- [J_UINT8](#m-J_UINT8)
- [J_UNION](#m-J_UNION)
- [J_XMLBEGIN](#m-J_XMLBEGIN)
- [J_XMLBEGINDEL](#m-J_XMLBEGINDEL)
- [J_XMLEND](#m-J_XMLEND)
- [J_XMLMOVEAFTER](#m-J_XMLMOVEAFTER)
- [J_XMLMOVEFIRST](#m-J_XMLMOVEFIRST)
- [J_XMLTAG](#m-J_XMLTAG)

**Methods**:

- [clone()](#m-clone-164c86c45e9b)
- [compare(ConfObject, ConfObject)](#m-compare-e78552baa2bf)
- [decode(ConfEObject)](#m-decode-609792d36602)
- [decode(ConfEObject, ConfPath)](#m-decode-a814ebf64edc)
- [decode(ConfEObject, String)](#m-decode-9b92f1de40d8)
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashCode-ef797a217903)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfObject() <a href="#m-ConfObject-bbefd68dfb09" id="m-ConfObject-bbefd68dfb09"></a>

```java
public ConfObject()
```


## Fields

### J_BINARY <a href="#m-J_BINARY" id="m-J_BINARY"></a>

```java
public static final int J_BINARY = 39;
```

### J_BIT32 <a href="#m-J_BIT32" id="m-J_BIT32"></a>

```java
public static final int J_BIT32 = 29;
```

### J_BIT64 <a href="#m-J_BIT64" id="m-J_BIT64"></a>

```java
public static final int J_BIT64 = 30;
```

### J_BITBIG <a href="#m-J_BITBIG" id="m-J_BITBIG"></a>

```java
public static final int J_BITBIG = 50;
```

### J_BOOL <a href="#m-J_BOOL" id="m-J_BOOL"></a>

```java
public static final int J_BOOL = 17;
```

### J_BUF <a href="#m-J_BUF" id="m-J_BUF"></a>

```java
public static final int J_BUF = 5;
```

### J_CDBBEGIN <a href="#m-J_CDBBEGIN" id="m-J_CDBBEGIN"></a>

```java
public static final int J_CDBBEGIN = 37;
```

### J_DATE <a href="#m-J_DATE" id="m-J_DATE"></a>

```java
public static final int J_DATE = 20;
```

### J_DATETIME <a href="#m-J_DATETIME" id="m-J_DATETIME"></a>

```java
public static final int J_DATETIME = 19;
```

### J_DECIMAL64 <a href="#m-J_DECIMAL64" id="m-J_DECIMAL64"></a>

```java
public static final int J_DECIMAL64 = 43;
```

### J_DEFAULT <a href="#m-J_DEFAULT" id="m-J_DEFAULT"></a>

```java
public static final int J_DEFAULT = 42;
```

### J_DOUBLE <a href="#m-J_DOUBLE" id="m-J_DOUBLE"></a>

```java
public static final int J_DOUBLE = 14;
```

### J_DQUAD <a href="#m-J_DQUAD" id="m-J_DQUAD"></a>

```java
public static final int J_DQUAD = 46;
```

### J_DURATION <a href="#m-J_DURATION" id="m-J_DURATION"></a>

```java
public static final int J_DURATION = 27;
```

### J_EMPTY <a href="#m-J_EMPTY" id="m-J_EMPTY"></a>

```java
public static final int J_EMPTY = 53;
```

### J_ENUMERATION <a href="#m-J_ENUMERATION" id="m-J_ENUMERATION"></a>

```java
public static final int J_ENUMERATION = 28;
```

### J_HEXSTR <a href="#m-J_HEXSTR" id="m-J_HEXSTR"></a>

```java
public static final int J_HEXSTR = 47;
```

### J_IDENTITYREF <a href="#m-J_IDENTITYREF" id="m-J_IDENTITYREF"></a>

```java
public static final int J_IDENTITYREF = 44;
```

### J_INSTANCE_IDENTIFIER <a href="#m-J_INSTANCE_IDENTIFIER" id="m-J_INSTANCE_IDENTIFIER"></a>

```java
public static final int J_INSTANCE_IDENTIFIER = 34;
```

### J_INT16 <a href="#m-J_INT16" id="m-J_INT16"></a>

```java
public static final int J_INT16 = 7;
```

### J_INT32 <a href="#m-J_INT32" id="m-J_INT32"></a>

```java
public static final int J_INT32 = 8;
```

### J_INT64 <a href="#m-J_INT64" id="m-J_INT64"></a>

```java
public static final int J_INT64 = 9;
```

### J_INT8 <a href="#m-J_INT8" id="m-J_INT8"></a>

```java
public static final int J_INT8 = 6;
```

### J_IPV4 <a href="#m-J_IPV4" id="m-J_IPV4"></a>

```java
public static final int J_IPV4 = 15;
```

### J_IPV4_AND_PLEN <a href="#m-J_IPV4_AND_PLEN" id="m-J_IPV4_AND_PLEN"></a>

```java
public static final int J_IPV4_AND_PLEN = 48;
```

### J_IPV4PREFIX <a href="#m-J_IPV4PREFIX" id="m-J_IPV4PREFIX"></a>

```java
public static final int J_IPV4PREFIX = 40;
```

### J_IPV6 <a href="#m-J_IPV6" id="m-J_IPV6"></a>

```java
public static final int J_IPV6 = 16;
```

### J_IPV6_AND_PLEN <a href="#m-J_IPV6_AND_PLEN" id="m-J_IPV6_AND_PLEN"></a>

```java
public static final int J_IPV6_AND_PLEN = 49;
```

### J_IPV6PREFIX <a href="#m-J_IPV6PREFIX" id="m-J_IPV6PREFIX"></a>

```java
public static final int J_IPV6PREFIX = 41;
```

### J_LIST <a href="#m-J_LIST" id="m-J_LIST"></a>

```java
public static final int J_LIST = 31;
```

### J_NOEXISTS <a href="#m-J_NOEXISTS" id="m-J_NOEXISTS"></a>

```java
public static final int J_NOEXISTS = 1;
```

### J_OBJECTREF <a href="#m-J_OBJECTREF" id="m-J_OBJECTREF"></a>

```java
public static final int J_OBJECTREF = 34;
```

### J_OID <a href="#m-J_OID" id="m-J_OID"></a>

```java
public static final int J_OID = 38;
```

### J_PTR <a href="#m-J_PTR" id="m-J_PTR"></a>

```java
public static final int J_PTR = 36;
```

### J_QNAME <a href="#m-J_QNAME" id="m-J_QNAME"></a>

```java
public static final int J_QNAME = 18;
```

### J_STR <a href="#m-J_STR" id="m-J_STR"></a>

```java
public static final int J_STR = 4;
```

### J_SYMBOL <a href="#m-J_SYMBOL" id="m-J_SYMBOL"></a>

```java
public static final int J_SYMBOL = 3;
```

### J_TIME <a href="#m-J_TIME" id="m-J_TIME"></a>

```java
public static final int J_TIME = 23;
```

### J_UINT16 <a href="#m-J_UINT16" id="m-J_UINT16"></a>

```java
public static final int J_UINT16 = 11;
```

### J_UINT32 <a href="#m-J_UINT32" id="m-J_UINT32"></a>

```java
public static final int J_UINT32 = 12;
```

### J_UINT64 <a href="#m-J_UINT64" id="m-J_UINT64"></a>

```java
public static final int J_UINT64 = 13;
```

### J_UINT8 <a href="#m-J_UINT8" id="m-J_UINT8"></a>

```java
public static final int J_UINT8 = 10;
```

### J_UNION <a href="#m-J_UNION" id="m-J_UNION"></a>

```java
public static final int J_UNION = 35;
```

### J_XMLBEGIN <a href="#m-J_XMLBEGIN" id="m-J_XMLBEGIN"></a>

```java
public static final int J_XMLBEGIN = 32;
```

### J_XMLBEGINDEL <a href="#m-J_XMLBEGINDEL" id="m-J_XMLBEGINDEL"></a>

```java
public static final int J_XMLBEGINDEL = 45;
```

### J_XMLEND <a href="#m-J_XMLEND" id="m-J_XMLEND"></a>

```java
public static final int J_XMLEND = 33;
```

### J_XMLMOVEAFTER <a href="#m-J_XMLMOVEAFTER" id="m-J_XMLMOVEAFTER"></a>

```java
public static final int J_XMLMOVEAFTER = 52;
```

### J_XMLMOVEFIRST <a href="#m-J_XMLMOVEFIRST" id="m-J_XMLMOVEFIRST"></a>

```java
public static final int J_XMLMOVEFIRST = 51;
```

### J_XMLTAG <a href="#m-J_XMLTAG" id="m-J_XMLTAG"></a>

```java
public static final int J_XMLTAG = 2;
```


## Methods

### clone() <a href="#m-clone-164c86c45e9b" id="m-clone-164c86c45e9b"></a>

```java
public Object clone()
```

### compare(ConfObject, ConfObject) <a href="#m-compare-e78552baa2bf" id="m-compare-e78552baa2bf"></a>

**Package-private**

```java
static int compare(com.tailf.conf.ConfObject val1, com.tailf.conf.ConfObject val2)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject val1`
- `com.tailf.conf.ConfObject val2`

### decode(ConfEObject) <a href="#m-decode-609792d36602" id="m-decode-609792d36602"></a>

```java
public static com.tailf.conf.ConfObject decode(
    com.tailf.proto.ConfEObject o
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### decode(ConfEObject, ConfPath) <a href="#m-decode-a814ebf64edc" id="m-decode-a814ebf64edc"></a>

```java
public static com.tailf.conf.ConfObject decode(
    com.tailf.proto.ConfEObject o,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`
- `com.tailf.conf.ConfPath path`

### decode(ConfEObject, String) <a href="#m-decode-9b92f1de40d8" id="m-decode-9b92f1de40d8"></a>

```java
public static com.tailf.conf.ConfObject decode(
    com.tailf.proto.ConfEObject o,
    String tag
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`
- `String tag`

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
public abstract com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public abstract boolean equals(Object o)
```

Determine if two Conf objects are equal. In general, Conf objects are
 equal if the components they consist of are equal.

**Parameters**

- `Object o` - the object to compare to.

**Returns:** true if the objects are identical.

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public abstract int hashCode()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public abstract String toString()
```

**Returns:** the printable representation of the object.
