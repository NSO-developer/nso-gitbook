<a id="cls-ConfDottedQuad"></a>
# ConfDottedQuad

```java
public class com.tailf.conf.ConfDottedQuad
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfDottedQuad>
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfDottedQuad](ConfDottedQuad.md#cls-ConfDottedQuad)

DATA_CONTAINER - Corresponds to the YANG dotted-quad type.



```
    type string {
      pattern
          '(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}'
        + '([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])';
      }
    }
```



 An unsigned 32-bit number expressed in the dotted-quad
 notation, i.e., four octets written as decimal numbers
 and separated with the '.' (full stop) character.";

## Members

**Constructors**:

- [ConfDottedQuad(byte, byte, byte, byte)](#m-confdottedquad-7085f8929488)
- [ConfDottedQuad(byte[])](#m-confdottedquad-017a6bea9459)
- [ConfDottedQuad(ConfBinary)](#m-confdottedquad-fe6154ba2b45)
- [ConfDottedQuad(ConfEObject)](#m-confdottedquad-e4b7f68b0f26)
- [ConfDottedQuad(String)](#m-confdottedquad-9b0ee627e80f)

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
- [compareTo(ConfDottedQuad)](#m-compareto-f6d41d0130e5)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#m-getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getvaluebystring-7804643cb027) from ConfValue
- [hashCode()](#m-hashcode-ef797a217903)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confdottedquad-7085f8929488"></a>
### ConfDottedQuad(byte, byte, byte, byte)

```java
public ConfDottedQuad(byte q1, byte q2, byte q3, byte q4)
```

Constructs a ConfdDottedQuad from 4 bytes.

**Parameters**

- `byte q1` - First byte of quad.
- `byte q2` - Second byte of quad.
- `byte q3` - Third byte of quad.
- `byte q4` - Fourth byte of quad.

<a id="m-confdottedquad-017a6bea9459"></a>
### ConfDottedQuad(byte[])

```java
public ConfDottedQuad(byte[] val) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `byte[] val`

<a id="m-confdottedquad-fe6154ba2b45"></a>
### ConfDottedQuad(ConfBinary)

```java
public ConfDottedQuad(com.tailf.conf.ConfBinary obj) throws com.tailf.conf.ConfException
```

Types: [ConfBinary](ConfBinary.md#cls-ConfBinary), [ConfException](ConfException.md#cls-ConfException)

Constructs a ConfDottedQuad from a ConfBinary object.

**Parameters**

- `com.tailf.conf.ConfBinary obj`

<a id="m-confdottedquad-e4b7f68b0f26"></a>
### ConfDottedQuad(ConfEObject)

```java
public ConfDottedQuad(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="m-confdottedquad-9b0ee627e80f"></a>
### ConfDottedQuad(String)

```java
public ConfDottedQuad(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Construct a ConfDottedQuad from a string of bytes in the format of octets
 (decimal values) separated with dots.

**Parameters**

- `String str`


## Methods

<a id="m-compareto-f6d41d0130e5"></a>
### compareTo(ConfDottedQuad)

```java
public int compareTo(com.tailf.conf.ConfDottedQuad o)
```

Types: [ConfDottedQuad](ConfDottedQuad.md#cls-ConfDottedQuad)

**Parameters**

- `com.tailf.conf.ConfDottedQuad o`

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

Format a dottedQuad as octets separated with dots, as for example:
 "1.2.4.192"
