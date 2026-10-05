<a id="s-ConfKey"></a>
# ConfKey

```java
public class com.tailf.conf.ConfKey
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

This class represents a list key or a leaf-list element.
 A list key can consist of one or more values.

**Related classes**

- [ConfXKey](ConfXKey.md#s-ConfXKey)
- [OrdinalKey](InstancePath/OrdinalKey.md#s-OrdinalKey)

## Members

**Constructors**:

- [ConfKey(ConfEObject)](#s-ConfKey-1)
- [ConfKey(ConfEObject, String[])](#s-ConfKey-2)
- [ConfKey(ConfObject)](#s-ConfKey-3)
- [ConfKey(ConfObject[])](#s-ConfKey-4)

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
- [elementAt(int)](#s-elementAt)
- [elements()](#s-elements)
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [hashCode()](#s-hashCode)
- [length()](#s-length)
- [setPath(InstancePath)](#s-setPath)
- [toStrictlyQuotedString()](#s-toStrictlyQuotedString)
- [toString()](#s-toString)
- [toString(boolean)](#s-toString-1)

## Constructors

<a id="s-ConfKey-1"></a>
### ConfKey(ConfEObject)

```java
public ConfKey(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-ConfKey-2"></a>
### ConfKey(ConfEObject, String[])

```java
public ConfKey(com.tailf.proto.ConfEObject o, String[] tags) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`
- `String[] tags`

<a id="s-ConfKey-3"></a>
### ConfKey(ConfObject)

```java
public ConfKey(com.tailf.conf.ConfObject o)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject o`

<a id="s-ConfKey-4"></a>
### ConfKey(ConfObject[])

```java
public ConfKey(com.tailf.conf.ConfObject[] l)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] l`


## Methods

<a id="s-elementAt"></a>
### elementAt(int)

```java
public com.tailf.conf.ConfObject elementAt(int i)
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

**Parameters**

- `int i`

<a id="s-elements"></a>
### elements()

```java
public com.tailf.conf.ConfObject[] elements()
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

<a id="s-encode"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Indicates whether a `ConfKey` is "equal to" this.

 A `ConfKey` is equals this if its components
 are equals.

**Parameters**

- `Object o` - the reference `ConfKey` with which to compare.

**Returns:** `true` if this `ConfKey` is the same as
 the o argument; `false` otherwise.

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-length"></a>
### length()

```java
public int length()
```

<a id="s-setPath"></a>
### setPath(InstancePath)

```java
public void setPath(com.tailf.conf.InstancePath path)
```

Types: [InstancePath](InstancePath.md#s-InstancePath)

This method is only useful if at least one of the key elements is an
 enumeration.
 In such case this method will assign the MaapiSchemas type to all such
 elements to be able to get a correct label when converting the key into
 its String representation. The path provided as an argument needs to
 point to the list node in the data model.

**Parameters**

- `com.tailf.conf.InstancePath path`

<a id="s-toStrictlyQuotedString"></a>
### toStrictlyQuotedString()

```java
public String toStrictlyQuotedString()
```

Returns a string representation of the ConfKey. The key elements will
 be quoted if necessary.

**Returns:** String representation of the key

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Returns a string representation of the ConfKey. The key elements will
 be quoted if necessary. Note however that this string representation is
 available for backward compatibility and is unsuitable for use in
 keypaths. Instead use `#toStrictlyQuotedString()`.

**Returns:** String representation of the key

<a id="s-toString-1"></a>
### toString(boolean)

```java
protected String toString(boolean strictQuotation)
```

**Parameters**

- `boolean strictQuotation`
