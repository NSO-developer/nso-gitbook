<a id="cls-ConfObject"></a>
# ConfObject

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

- [ConfObject()](#m-confobject-bbefd68dfb09)

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
- [hashCode()](#m-hashcode-ef797a217903)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confobject-bbefd68dfb09"></a>
### ConfObject()

```java
public ConfObject()
```


## Fields

<a id="m-J_BINARY"></a>
### J_BINARY

```java
public static final int J_BINARY = 39;
```

<a id="m-J_BIT32"></a>
### J_BIT32

```java
public static final int J_BIT32 = 29;
```

<a id="m-J_BIT64"></a>
### J_BIT64

```java
public static final int J_BIT64 = 30;
```

<a id="m-J_BITBIG"></a>
### J_BITBIG

```java
public static final int J_BITBIG = 50;
```

<a id="m-J_BOOL"></a>
### J_BOOL

```java
public static final int J_BOOL = 17;
```

<a id="m-J_BUF"></a>
### J_BUF

```java
public static final int J_BUF = 5;
```

<a id="m-J_CDBBEGIN"></a>
### J_CDBBEGIN

```java
public static final int J_CDBBEGIN = 37;
```

<a id="m-J_DATE"></a>
### J_DATE

```java
public static final int J_DATE = 20;
```

<a id="m-J_DATETIME"></a>
### J_DATETIME

```java
public static final int J_DATETIME = 19;
```

<a id="m-J_DECIMAL64"></a>
### J_DECIMAL64

```java
public static final int J_DECIMAL64 = 43;
```

<a id="m-J_DEFAULT"></a>
### J_DEFAULT

```java
public static final int J_DEFAULT = 42;
```

<a id="m-J_DOUBLE"></a>
### J_DOUBLE

```java
public static final int J_DOUBLE = 14;
```

<a id="m-J_DQUAD"></a>
### J_DQUAD

```java
public static final int J_DQUAD = 46;
```

<a id="m-J_DURATION"></a>
### J_DURATION

```java
public static final int J_DURATION = 27;
```

<a id="m-J_EMPTY"></a>
### J_EMPTY

```java
public static final int J_EMPTY = 53;
```

<a id="m-J_ENUMERATION"></a>
### J_ENUMERATION

```java
public static final int J_ENUMERATION = 28;
```

<a id="m-J_HEXSTR"></a>
### J_HEXSTR

```java
public static final int J_HEXSTR = 47;
```

<a id="m-J_IDENTITYREF"></a>
### J_IDENTITYREF

```java
public static final int J_IDENTITYREF = 44;
```

<a id="m-J_INSTANCE_IDENTIFIER"></a>
### J_INSTANCE_IDENTIFIER

```java
public static final int J_INSTANCE_IDENTIFIER = 34;
```

<a id="m-J_INT16"></a>
### J_INT16

```java
public static final int J_INT16 = 7;
```

<a id="m-J_INT32"></a>
### J_INT32

```java
public static final int J_INT32 = 8;
```

<a id="m-J_INT64"></a>
### J_INT64

```java
public static final int J_INT64 = 9;
```

<a id="m-J_INT8"></a>
### J_INT8

```java
public static final int J_INT8 = 6;
```

<a id="m-J_IPV4"></a>
### J_IPV4

```java
public static final int J_IPV4 = 15;
```

<a id="m-J_IPV4_AND_PLEN"></a>
### J_IPV4_AND_PLEN

```java
public static final int J_IPV4_AND_PLEN = 48;
```

<a id="m-J_IPV4PREFIX"></a>
### J_IPV4PREFIX

```java
public static final int J_IPV4PREFIX = 40;
```

<a id="m-J_IPV6"></a>
### J_IPV6

```java
public static final int J_IPV6 = 16;
```

<a id="m-J_IPV6_AND_PLEN"></a>
### J_IPV6_AND_PLEN

```java
public static final int J_IPV6_AND_PLEN = 49;
```

<a id="m-J_IPV6PREFIX"></a>
### J_IPV6PREFIX

```java
public static final int J_IPV6PREFIX = 41;
```

<a id="m-J_LIST"></a>
### J_LIST

```java
public static final int J_LIST = 31;
```

<a id="m-J_NOEXISTS"></a>
### J_NOEXISTS

```java
public static final int J_NOEXISTS = 1;
```

<a id="m-J_OBJECTREF"></a>
### J_OBJECTREF

```java
public static final int J_OBJECTREF = 34;
```

<a id="m-J_OID"></a>
### J_OID

```java
public static final int J_OID = 38;
```

<a id="m-J_PTR"></a>
### J_PTR

```java
public static final int J_PTR = 36;
```

<a id="m-J_QNAME"></a>
### J_QNAME

```java
public static final int J_QNAME = 18;
```

<a id="m-J_STR"></a>
### J_STR

```java
public static final int J_STR = 4;
```

<a id="m-J_SYMBOL"></a>
### J_SYMBOL

```java
public static final int J_SYMBOL = 3;
```

<a id="m-J_TIME"></a>
### J_TIME

```java
public static final int J_TIME = 23;
```

<a id="m-J_UINT16"></a>
### J_UINT16

```java
public static final int J_UINT16 = 11;
```

<a id="m-J_UINT32"></a>
### J_UINT32

```java
public static final int J_UINT32 = 12;
```

<a id="m-J_UINT64"></a>
### J_UINT64

```java
public static final int J_UINT64 = 13;
```

<a id="m-J_UINT8"></a>
### J_UINT8

```java
public static final int J_UINT8 = 10;
```

<a id="m-J_UNION"></a>
### J_UNION

```java
public static final int J_UNION = 35;
```

<a id="m-J_XMLBEGIN"></a>
### J_XMLBEGIN

```java
public static final int J_XMLBEGIN = 32;
```

<a id="m-J_XMLBEGINDEL"></a>
### J_XMLBEGINDEL

```java
public static final int J_XMLBEGINDEL = 45;
```

<a id="m-J_XMLEND"></a>
### J_XMLEND

```java
public static final int J_XMLEND = 33;
```

<a id="m-J_XMLMOVEAFTER"></a>
### J_XMLMOVEAFTER

```java
public static final int J_XMLMOVEAFTER = 52;
```

<a id="m-J_XMLMOVEFIRST"></a>
### J_XMLMOVEFIRST

```java
public static final int J_XMLMOVEFIRST = 51;
```

<a id="m-J_XMLTAG"></a>
### J_XMLTAG

```java
public static final int J_XMLTAG = 2;
```


## Methods

<a id="m-clone-164c86c45e9b"></a>
### clone()

```java
public Object clone()
```

<a id="m-compare-e78552baa2bf"></a>
### compare(ConfObject, ConfObject)

**Package-private**

```java
static int compare(com.tailf.conf.ConfObject val1, com.tailf.conf.ConfObject val2)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject val1`
- `com.tailf.conf.ConfObject val2`

<a id="m-decode-609792d36602"></a>
### decode(ConfEObject)

```java
public static com.tailf.conf.ConfObject decode(
    com.tailf.proto.ConfEObject o
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#cls-ConfObject), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="m-decode-a814ebf64edc"></a>
### decode(ConfEObject, ConfPath)

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

<a id="m-decode-9b92f1de40d8"></a>
### decode(ConfEObject, String)

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

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
public abstract com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public abstract boolean equals(Object o)
```

Determine if two Conf objects are equal. In general, Conf objects are
 equal if the components they consist of are equal.

**Parameters**

- `Object o` - the object to compare to.

**Returns:** true if the objects are identical.

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public abstract int hashCode()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public abstract String toString()
```

**Returns:** the printable representation of the object.
