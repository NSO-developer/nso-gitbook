# ConfKey <a href="#cls-ConfKey" id="cls-ConfKey"></a>

```java
public class com.tailf.conf.ConfKey
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

This class represents a list key or a leaf-list element.
 A list key can consist of one or more values.

**Related classes**

- [ConfXKey](ConfXKey.md#cls-ConfXKey)
- [OrdinalKey](InstancePath/OrdinalKey.md#cls-OrdinalKey)

## Members

**Constructors**:

- [ConfKey(ConfEObject)](#m-ConfKey-31b01a854469)
- [ConfKey(ConfEObject, String[])](#m-ConfKey-7e685c765cdb)
- [ConfKey(ConfObject)](#m-ConfKey-3fd8f1232248)
- [ConfKey(ConfObject[])](#m-ConfKey-b3ccb143be2d)

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
- [elementAt(int)](#m-elementAt-7ff98e6e0268)
- [elements()](#m-elements-1ac1cabc0e96)
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashCode-ef797a217903)
- [length()](#m-length-89e7822f25ca)
- [setPath(InstancePath)](#m-setPath-ad9962db3cab)
- [toStrictlyQuotedString()](#m-toStrictlyQuotedString-c10aef71d8ba)
- [toString()](#m-toString-e9d48c5503ef)
- [toString(boolean)](#m-toString-b87d88746a2e)

## Constructors

### ConfKey(ConfEObject) <a href="#m-ConfKey-31b01a854469" id="m-ConfKey-31b01a854469"></a>

```java
public ConfKey(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfKey(ConfEObject, String[]) <a href="#m-ConfKey-7e685c765cdb" id="m-ConfKey-7e685c765cdb"></a>

```java
public ConfKey(com.tailf.proto.ConfEObject o, String[] tags) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`
- `String[] tags`

### ConfKey(ConfObject) <a href="#m-ConfKey-3fd8f1232248" id="m-ConfKey-3fd8f1232248"></a>

```java
public ConfKey(com.tailf.conf.ConfObject o)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject o`

### ConfKey(ConfObject[]) <a href="#m-ConfKey-b3ccb143be2d" id="m-ConfKey-b3ccb143be2d"></a>

```java
public ConfKey(com.tailf.conf.ConfObject[] l)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject[] l`


## Methods

### elementAt(int) <a href="#m-elementAt-7ff98e6e0268" id="m-elementAt-7ff98e6e0268"></a>

```java
public com.tailf.conf.ConfObject elementAt(int i)
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

**Parameters**

- `int i`

### elements() <a href="#m-elements-1ac1cabc0e96" id="m-elements-1ac1cabc0e96"></a>

```java
public com.tailf.conf.ConfObject[] elements()
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

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

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### length() <a href="#m-length-89e7822f25ca" id="m-length-89e7822f25ca"></a>

```java
public int length()
```

### setPath(InstancePath) <a href="#m-setPath-ad9962db3cab" id="m-setPath-ad9962db3cab"></a>

```java
public void setPath(com.tailf.conf.InstancePath path)
```

Types: [InstancePath](InstancePath.md#cls-InstancePath)

This method is only useful if at least one of the key elements is an
 enumeration.
 In such case this method will assign the MaapiSchemas type to all such
 elements to be able to get a correct label when converting the key into
 its String representation. The path provided as an argument needs to
 point to the list node in the data model.

**Parameters**

- `com.tailf.conf.InstancePath path`

### toStrictlyQuotedString() <a href="#m-toStrictlyQuotedString-c10aef71d8ba" id="m-toStrictlyQuotedString-c10aef71d8ba"></a>

```java
public String toStrictlyQuotedString()
```

Returns a string representation of the ConfKey. The key elements will
 be quoted if necessary.

**Returns:** String representation of the key

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Returns a string representation of the ConfKey. The key elements will
 be quoted if necessary. Note however that this string representation is
 available for backward compatibility and is unsuitable for use in
 keypaths. Instead use [`toStrictlyQuotedString()`](ConfKey.md#m-toStrictlyQuotedString-c10aef71d8ba).

**Returns:** String representation of the key

### toString(boolean) <a href="#m-toString-b87d88746a2e" id="m-toString-b87d88746a2e"></a>

```java
protected String toString(boolean strictQuotation)
```

**Parameters**

- `boolean strictQuotation`
