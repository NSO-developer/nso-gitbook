<a id="s-ConfHexString"></a>
# ConfHexString

```java
public class com.tailf.conf.ConfHexString
    extends com.tailf.conf.ConfValue
    implements Comparable<com.tailf.conf.ConfHexString>
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfHexString](ConfHexString.md#s-ConfHexString)

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

- [ConfHexString(byte[])](#s-ConfHexString-1)
- [ConfHexString(ConfBinary)](#s-ConfHexString-2)
- [ConfHexString(ConfEObject)](#s-ConfHexString-3)
- [ConfHexString(String)](#s-ConfHexString-4)

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
- [compareTo(ConfHexString)](#s-compareTo)
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](ConfValue.md#s-getValueByString-1) from ConfValue
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfHexString-1"></a>
### ConfHexString(byte[])

```java
public ConfHexString(byte[] val)
```

Construct a `ConfHexString` from a byte array.

**Parameters**

- `byte[] val` - byte array representation of the `ConfHexString`

<a id="s-ConfHexString-2"></a>
### ConfHexString(ConfBinary)

```java
public ConfHexString(com.tailf.conf.ConfBinary obj)
```

Types: [ConfBinary](ConfBinary.md#s-ConfBinary)

Constructs a `ConfHexString` from a `ConfBinary`
 object.

**Parameters**

- `com.tailf.conf.ConfBinary obj` - a `ConfBinary` object

<a id="s-ConfHexString-3"></a>
### ConfHexString(ConfEObject)

```java
public ConfHexString(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-ConfHexString-4"></a>
### ConfHexString(String)

```java
public ConfHexString(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Construct a `ConfHexString` from a string  of bytes in the
 format of hexadecimal values separated with colons.

**Parameters**

- `String str` - string representation of the `ConfHexString`


## Methods

<a id="s-compareTo"></a>
### compareTo(ConfHexString)

```java
public int compareTo(com.tailf.conf.ConfHexString o)
```

Types: [ConfHexString](ConfHexString.md#s-ConfHexString)

**Parameters**

- `com.tailf.conf.ConfHexString o`

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

**Parameters**

- `Object o`

<a id="s-hashCode"></a>
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

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Returns string representation of a `ConfHexString`.

 Format a HexString as hexadecimal values separated with colons, as for
 example: "00:4f:4c:41:ff".

**Returns:** a string representation of this `ConfHexString`
