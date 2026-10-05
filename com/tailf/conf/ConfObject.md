<a id="s-ConfObject"></a>
# ConfObject

```java
public abstract class com.tailf.conf.ConfObject
    implements Cloneable, java.io.Serializable
```

Base class of the Conf data type classes. This class is used to represent an
 arbitrary Conf term.

**Related classes**

- [ConfKey](ConfKey.md#s-ConfKey)
- [ConfTag](ConfTag.md#s-ConfTag)
- [ConfTypeDescriptor](ConfTypeDescriptor.md#s-ConfTypeDescriptor)
- [ConfValue](ConfValue.md#s-ConfValue)
- [ConfXMLParam](ConfXMLParam.md#s-ConfXMLParam)

## Members

**Constructors**:

- [ConfObject()](#s-ConfObject-1)

**Fields**:

- [J_BINARY](#s-J_BINARY)
- [J_BIT32](#s-J_BIT32)
- [J_BIT64](#s-J_BIT64)
- [J_BITBIG](#s-J_BITBIG)
- [J_BOOL](#s-J_BOOL)
- [J_BUF](#s-J_BUF)
- [J_CDBBEGIN](#s-J_CDBBEGIN)
- [J_DATE](#s-J_DATE)
- [J_DATETIME](#s-J_DATETIME)
- [J_DECIMAL64](#s-J_DECIMAL64)
- [J_DEFAULT](#s-J_DEFAULT)
- [J_DOUBLE](#s-J_DOUBLE)
- [J_DQUAD](#s-J_DQUAD)
- [J_DURATION](#s-J_DURATION)
- [J_EMPTY](#s-J_EMPTY)
- [J_ENUMERATION](#s-J_ENUMERATION)
- [J_HEXSTR](#s-J_HEXSTR)
- [J_IDENTITYREF](#s-J_IDENTITYREF)
- [J_INSTANCE_IDENTIFIER](#s-J_INSTANCE_IDENTIFIER)
- [J_INT16](#s-J_INT16)
- [J_INT32](#s-J_INT32)
- [J_INT64](#s-J_INT64)
- [J_INT8](#s-J_INT8)
- [J_IPV4](#s-J_IPV4)
- [J_IPV4_AND_PLEN](#s-J_IPV4_AND_PLEN)
- [J_IPV4PREFIX](#s-J_IPV4PREFIX)
- [J_IPV6](#s-J_IPV6)
- [J_IPV6_AND_PLEN](#s-J_IPV6_AND_PLEN)
- [J_IPV6PREFIX](#s-J_IPV6PREFIX)
- [J_LIST](#s-J_LIST)
- [J_NOEXISTS](#s-J_NOEXISTS)
- [J_OBJECTREF](#s-J_OBJECTREF)
- [J_OID](#s-J_OID)
- [J_PTR](#s-J_PTR)
- [J_QNAME](#s-J_QNAME)
- [J_STR](#s-J_STR)
- [J_SYMBOL](#s-J_SYMBOL)
- [J_TIME](#s-J_TIME)
- [J_UINT16](#s-J_UINT16)
- [J_UINT32](#s-J_UINT32)
- [J_UINT64](#s-J_UINT64)
- [J_UINT8](#s-J_UINT8)
- [J_UNION](#s-J_UNION)
- [J_XMLBEGIN](#s-J_XMLBEGIN)
- [J_XMLBEGINDEL](#s-J_XMLBEGINDEL)
- [J_XMLEND](#s-J_XMLEND)
- [J_XMLMOVEAFTER](#s-J_XMLMOVEAFTER)
- [J_XMLMOVEFIRST](#s-J_XMLMOVEFIRST)
- [J_XMLTAG](#s-J_XMLTAG)

**Methods**:

- [clone()](#s-clone)
- [compare(ConfObject, ConfObject)](#s-compare)
- [decode(ConfEObject)](#s-decode)
- [decode(ConfEObject, ConfPath)](#s-decode-1)
- [decode(ConfEObject, String)](#s-decode-2)
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfObject-1"></a>
### ConfObject()

```java
public ConfObject()
```


## Fields

<a id="s-J_BINARY"></a>
### J_BINARY

```java
public static final int J_BINARY = 39;
```

<a id="s-J_BIT32"></a>
### J_BIT32

```java
public static final int J_BIT32 = 29;
```

<a id="s-J_BIT64"></a>
### J_BIT64

```java
public static final int J_BIT64 = 30;
```

<a id="s-J_BITBIG"></a>
### J_BITBIG

```java
public static final int J_BITBIG = 50;
```

<a id="s-J_BOOL"></a>
### J_BOOL

```java
public static final int J_BOOL = 17;
```

<a id="s-J_BUF"></a>
### J_BUF

```java
public static final int J_BUF = 5;
```

<a id="s-J_CDBBEGIN"></a>
### J_CDBBEGIN

```java
public static final int J_CDBBEGIN = 37;
```

<a id="s-J_DATE"></a>
### J_DATE

```java
public static final int J_DATE = 20;
```

<a id="s-J_DATETIME"></a>
### J_DATETIME

```java
public static final int J_DATETIME = 19;
```

<a id="s-J_DECIMAL64"></a>
### J_DECIMAL64

```java
public static final int J_DECIMAL64 = 43;
```

<a id="s-J_DEFAULT"></a>
### J_DEFAULT

```java
public static final int J_DEFAULT = 42;
```

<a id="s-J_DOUBLE"></a>
### J_DOUBLE

```java
public static final int J_DOUBLE = 14;
```

<a id="s-J_DQUAD"></a>
### J_DQUAD

```java
public static final int J_DQUAD = 46;
```

<a id="s-J_DURATION"></a>
### J_DURATION

```java
public static final int J_DURATION = 27;
```

<a id="s-J_EMPTY"></a>
### J_EMPTY

```java
public static final int J_EMPTY = 53;
```

<a id="s-J_ENUMERATION"></a>
### J_ENUMERATION

```java
public static final int J_ENUMERATION = 28;
```

<a id="s-J_HEXSTR"></a>
### J_HEXSTR

```java
public static final int J_HEXSTR = 47;
```

<a id="s-J_IDENTITYREF"></a>
### J_IDENTITYREF

```java
public static final int J_IDENTITYREF = 44;
```

<a id="s-J_INSTANCE_IDENTIFIER"></a>
### J_INSTANCE_IDENTIFIER

```java
public static final int J_INSTANCE_IDENTIFIER = 34;
```

<a id="s-J_INT16"></a>
### J_INT16

```java
public static final int J_INT16 = 7;
```

<a id="s-J_INT32"></a>
### J_INT32

```java
public static final int J_INT32 = 8;
```

<a id="s-J_INT64"></a>
### J_INT64

```java
public static final int J_INT64 = 9;
```

<a id="s-J_INT8"></a>
### J_INT8

```java
public static final int J_INT8 = 6;
```

<a id="s-J_IPV4"></a>
### J_IPV4

```java
public static final int J_IPV4 = 15;
```

<a id="s-J_IPV4_AND_PLEN"></a>
### J_IPV4_AND_PLEN

```java
public static final int J_IPV4_AND_PLEN = 48;
```

<a id="s-J_IPV4PREFIX"></a>
### J_IPV4PREFIX

```java
public static final int J_IPV4PREFIX = 40;
```

<a id="s-J_IPV6"></a>
### J_IPV6

```java
public static final int J_IPV6 = 16;
```

<a id="s-J_IPV6_AND_PLEN"></a>
### J_IPV6_AND_PLEN

```java
public static final int J_IPV6_AND_PLEN = 49;
```

<a id="s-J_IPV6PREFIX"></a>
### J_IPV6PREFIX

```java
public static final int J_IPV6PREFIX = 41;
```

<a id="s-J_LIST"></a>
### J_LIST

```java
public static final int J_LIST = 31;
```

<a id="s-J_NOEXISTS"></a>
### J_NOEXISTS

```java
public static final int J_NOEXISTS = 1;
```

<a id="s-J_OBJECTREF"></a>
### J_OBJECTREF

```java
public static final int J_OBJECTREF = 34;
```

<a id="s-J_OID"></a>
### J_OID

```java
public static final int J_OID = 38;
```

<a id="s-J_PTR"></a>
### J_PTR

```java
public static final int J_PTR = 36;
```

<a id="s-J_QNAME"></a>
### J_QNAME

```java
public static final int J_QNAME = 18;
```

<a id="s-J_STR"></a>
### J_STR

```java
public static final int J_STR = 4;
```

<a id="s-J_SYMBOL"></a>
### J_SYMBOL

```java
public static final int J_SYMBOL = 3;
```

<a id="s-J_TIME"></a>
### J_TIME

```java
public static final int J_TIME = 23;
```

<a id="s-J_UINT16"></a>
### J_UINT16

```java
public static final int J_UINT16 = 11;
```

<a id="s-J_UINT32"></a>
### J_UINT32

```java
public static final int J_UINT32 = 12;
```

<a id="s-J_UINT64"></a>
### J_UINT64

```java
public static final int J_UINT64 = 13;
```

<a id="s-J_UINT8"></a>
### J_UINT8

```java
public static final int J_UINT8 = 10;
```

<a id="s-J_UNION"></a>
### J_UNION

```java
public static final int J_UNION = 35;
```

<a id="s-J_XMLBEGIN"></a>
### J_XMLBEGIN

```java
public static final int J_XMLBEGIN = 32;
```

<a id="s-J_XMLBEGINDEL"></a>
### J_XMLBEGINDEL

```java
public static final int J_XMLBEGINDEL = 45;
```

<a id="s-J_XMLEND"></a>
### J_XMLEND

```java
public static final int J_XMLEND = 33;
```

<a id="s-J_XMLMOVEAFTER"></a>
### J_XMLMOVEAFTER

```java
public static final int J_XMLMOVEAFTER = 52;
```

<a id="s-J_XMLMOVEFIRST"></a>
### J_XMLMOVEFIRST

```java
public static final int J_XMLMOVEFIRST = 51;
```

<a id="s-J_XMLTAG"></a>
### J_XMLTAG

```java
public static final int J_XMLTAG = 2;
```


## Methods

<a id="s-clone"></a>
### clone()

```java
public Object clone()
```

<a id="s-compare"></a>
### compare(ConfObject, ConfObject)

**Package-private**

```java
static int compare(com.tailf.conf.ConfObject val1, com.tailf.conf.ConfObject val2)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject val1`
- `com.tailf.conf.ConfObject val2`

<a id="s-decode"></a>
### decode(ConfEObject)

```java
public static com.tailf.conf.ConfObject decode(
    com.tailf.proto.ConfEObject o
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#s-ConfObject), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-decode-1"></a>
### decode(ConfEObject, ConfPath)

```java
public static com.tailf.conf.ConfObject decode(
    com.tailf.proto.ConfEObject o,
    com.tailf.conf.ConfPath path
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#s-ConfObject), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfPath](ConfPath.md#s-ConfPath), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`
- `com.tailf.conf.ConfPath path`

<a id="s-decode-2"></a>
### decode(ConfEObject, String)

```java
public static com.tailf.conf.ConfObject decode(
    com.tailf.proto.ConfEObject o,
    String tag
)
    throws com.tailf.conf.ConfException
```

Types: [ConfObject](ConfObject.md#s-ConfObject), [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`
- `String tag`

<a id="s-encode"></a>
### encode()

```java
public abstract com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-equals"></a>
### equals(Object)

```java
public abstract boolean equals(Object o)
```

Determine if two Conf objects are equal. In general, Conf objects are
 equal if the components they consist of are equal.

**Parameters**

- `Object o` - the object to compare to.

**Returns:** true if the objects are identical.

<a id="s-hashCode"></a>
### hashCode()

```java
public abstract int hashCode()
```

<a id="s-toString"></a>
### toString()

```java
public abstract String toString()
```

**Returns:** the printable representation of the object.
