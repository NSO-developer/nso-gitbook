<a id="cls-ConfHexString"></a>
# ConfHexString

```java
public class com.tailf.conf.ConfHexString
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfHexString>
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfHexString](ConfHexString.md#cls-ConfHexString)

DATA_CONTAINER - Corresponds to the YANG `hex-string` type.

 A string of colon-separated hexa-decimal octets e.g. '4F:4C:41:71'.

 A hex-list is defined as:


```
  hex-string {
     type string {
      pattern '([0-9a-fA-F]{2}(:[0-9a-fA-F]{2})*)?';
    }
  }
```



 A hexadecimal string with octets represented as hex digits
 separated by colons.  The canonical representation uses
 lowercase characters.

## Members

**Constructors**:

- [ConfHexString(byte[])](#m-confhexstring-246cb45bff66)
- [ConfHexString(ConfBinary)](#m-confhexstring-92ef6019285c)
- [ConfHexString(ConfEObject)](#m-confhexstring-975d2e82f5eb)
- [ConfHexString(String)](#m-confhexstring-ad80b3ba974a)

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
- [compareTo(ConfHexString)](#m-compareto-105080d2b2e1)
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

<a id="m-confhexstring-246cb45bff66"></a>
### ConfHexString(byte[])

```java
public ConfHexString(byte[] val)
```

Construct a `ConfHexString` from a byte array.

**Parameters**

- `byte[] val` - byte array representation of the `ConfHexString`

<a id="m-confhexstring-92ef6019285c"></a>
### ConfHexString(ConfBinary)

```java
public ConfHexString(com.tailf.conf.ConfBinary obj)
```

Types: [ConfBinary](ConfBinary.md#cls-ConfBinary)

Constructs a `ConfHexString` from a `ConfBinary`
 object.

**Parameters**

- `com.tailf.conf.ConfBinary obj` - a `ConfBinary` object

<a id="m-confhexstring-975d2e82f5eb"></a>
### ConfHexString(ConfEObject)

```java
public ConfHexString(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="m-confhexstring-ad80b3ba974a"></a>
### ConfHexString(String)

```java
public ConfHexString(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Construct a `ConfHexString` from a string  of bytes in the
 format of hexadecimal values separated with colons.

**Parameters**

- `String str` - string representation of the `ConfHexString`


## Methods

<a id="m-compareto-105080d2b2e1"></a>
### compareTo(ConfHexString)

```java
public int compareTo(com.tailf.conf.ConfHexString o)
```

Types: [ConfHexString](ConfHexString.md#cls-ConfHexString)

**Parameters**

- `com.tailf.conf.ConfHexString o`

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

Returns a hash code value for the object. This method is
 supported for the benefit of hash tables such as those provided by
 `java.util.Hashtable`.

 The hash code is calculated through the list of bytes that this
 `ConfHexString` holds.

**Returns:** a hash code value for this object.

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Returns string representation of a `ConfHexString`.

 Format a HexString as hexadecimal values separated with colons, as for
 example: "00:4f:4c:41:ff".

**Returns:** a string representation of this `ConfHexString`
