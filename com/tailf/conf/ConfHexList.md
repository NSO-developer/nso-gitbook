<a id="s-ConfHexList"></a>
# ConfHexList

```java
public class com.tailf.conf.ConfHexList
    extends com.tailf.conf.ConfBinary
```

Types: [ConfBinary](ConfBinary.md#s-ConfBinary)

DATA_CONTAINER - Corresponds to the YANG `tailf:hex-list` type.

 A list of colon-separated hexa-decimal octets e.g. '4F:4C:41:71'.

 A hex-list is defined as:


```
  typedef hex-list {
    type string {
      pattern '(([0-9a-fA-F]){2}(:([0-9a-fA-F]){2})*)?';
    }
   }
```



 When a instance of this type is encoded and send over the
 socket through MAAPI or CDB with the
 [`Maapi`](../maapi/Maapi.md#s-Maapi),
 [`CdbSession`](../cdb/CdbSession.md#s-CdbSession) method
 it will encode this value as a `ConfBinary` which has the
 effect that the corresponding `getElem` from MAAPI and CDB
 will return a `ConfBinary` instead of a `ConfHexList`.

**See also:** [`ConfBinary`](ConfBinary.md#s-ConfBinary)

## Members

**Constructors**:

- [ConfHexList(byte[])](#s-ConfHexList-1)
- [ConfHexList(ConfBinary)](#s-ConfHexList-2)
- [ConfHexList(String)](#s-ConfHexList-3)

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
- [val](ConfBinary.md#s-val) from ConfBinary

**Methods**:

- [bytesValue()](ConfBinary.md#s-bytesValue) from ConfBinary
- [clone()](ConfObject.md#s-clone) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#s-compare) from ConfObject
- [compareTo(ConfBinary)](ConfBinary.md#s-compareTo) from ConfBinary
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](ConfBinary.md#s-encode) from ConfBinary
- [equals(Object)](#s-equals)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](ConfValue.md#s-getValueByString-1) from ConfValue
- [hashCode()](#s-hashCode)
- [setCSType(CSType)](ConfBinary.md#s-setCSType) from ConfBinary
- [toHexListString()](ConfBinary.md#s-toHexListString) from ConfBinary
- [toOctetListString()](ConfBinary.md#s-toOctetListString) from ConfBinary
- [toString()](#s-toString)

## Constructors

<a id="s-ConfHexList-1"></a>
### ConfHexList(byte[])

```java
public ConfHexList(byte[] val)
```

Construct a `ConfHexList` from a byte array.

**Parameters**

- `byte[] val` - byte array representation of the `ConfHexList`

<a id="s-ConfHexList-2"></a>
### ConfHexList(ConfBinary)

```java
public ConfHexList(com.tailf.conf.ConfBinary obj)
```

Types: [ConfBinary](ConfBinary.md#s-ConfBinary)

Constructs a `ConfHexList` from a `ConfBinary`
 object.

**Parameters**

- `com.tailf.conf.ConfBinary obj` - a `ConfBinary` object

<a id="s-ConfHexList-3"></a>
### ConfHexList(String)

```java
public ConfHexList(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Construct a `ConfHexList` from a string  of bytes in the
 format of hexadecimal values separated with colons.

**Parameters**

- `String str` - string representation of the `ConfHexList`


## Methods

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
 `ConfHexList` holds.

**Returns:** a hash code value for this object.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Returns string representation of a `ConfHexList`.

 Format a hexList as hexadecimal values separated with colons, as for
 example: "00:4f:4c:41:ff".

**Returns:** a string representation of this `ConfHexList`
