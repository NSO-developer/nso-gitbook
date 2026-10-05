# ConfHexList <a href="#cls-ConfHexList" id="cls-ConfHexList"></a>

```java
public class com.tailf.conf.ConfHexList
    extends com.tailf.conf.ConfBinary
```

Types: [ConfBinary](ConfBinary.md#cls-ConfBinary)

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
 [`Maapi#setElem(int,com.tailf.conf.ConfObject,
 com.tailf.conf.ConfPath)`](../maapi/Maapi.md#m-setElem-cec1d194abc2),
 [`CdbSession#setElem(com.tailf.conf.ConfValue,
 com.tailf.conf.ConfPath)`](../cdb/CdbSession.md#m-setElem-356e5e479e47) method
 it will encode this value as a `ConfBinary` which has the
 effect that the corresponding `getElem` from MAAPI and CDB
 will return a `ConfBinary` instead of a `ConfHexList`.

**See also:** [`ConfBinary`](ConfBinary.md#cls-ConfBinary)

## Members

**Constructors**:

- [ConfHexList(byte[])](#m-ConfHexList-dd16916d2eda)
- [ConfHexList(ConfBinary)](#m-ConfHexList-192c83339be5)
- [ConfHexList(String)](#m-ConfHexList-e50d3dafa0ee)

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
- [val](ConfBinary.md#m-val) from ConfBinary

**Methods**:

- [bytesValue()](ConfBinary.md#m-bytesValue-5430ca82d2de) from ConfBinary
- [clone()](ConfObject.md#m-clone-164c86c45e9b) from ConfObject
- [compare(ConfObject, ConfObject)](ConfObject.md#m-compare-e78552baa2bf) from ConfObject
- [compareTo(ConfBinary)](ConfBinary.md#m-compareTo-58d210e19aa1) from ConfBinary
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](ConfBinary.md#m-encode-fbae522bba37) from ConfBinary
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getStringByValue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getStringByValue-8ed173dcf8dc) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#m-getValueByString-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getValueByString-7804643cb027) from ConfValue
- [hashCode()](#m-hashCode-ef797a217903)
- [setCSType(CSType)](ConfBinary.md#m-setCSType-1d9af222b932) from ConfBinary
- [toHexListString()](ConfBinary.md#m-toHexListString-b8ab9a901cf8) from ConfBinary
- [toOctetListString()](ConfBinary.md#m-toOctetListString-4e8899a4fa5c) from ConfBinary
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### ConfHexList(byte[]) <a href="#m-ConfHexList-dd16916d2eda" id="m-ConfHexList-dd16916d2eda"></a>

```java
public ConfHexList(byte[] val)
```

Construct a `ConfHexList` from a byte array.

**Parameters**

- `byte[] val` - byte array representation of the `ConfHexList`

### ConfHexList(ConfBinary) <a href="#m-ConfHexList-192c83339be5" id="m-ConfHexList-192c83339be5"></a>

```java
public ConfHexList(com.tailf.conf.ConfBinary obj)
```

Types: [ConfBinary](ConfBinary.md#cls-ConfBinary)

Constructs a `ConfHexList` from a `ConfBinary`
 object.

**Parameters**

- `com.tailf.conf.ConfBinary obj` - a `ConfBinary` object

### ConfHexList(String) <a href="#m-ConfHexList-e50d3dafa0ee" id="m-ConfHexList-e50d3dafa0ee"></a>

```java
public ConfHexList(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Construct a `ConfHexList` from a string  of bytes in the
 format of hexadecimal values separated with colons.

**Parameters**

- `String str` - string representation of the `ConfHexList`


## Methods

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

Returns a hash code value for the object. This method is
 supported for the benefit of hash tables such as those provided by
 `java.util.Hashtable`.

 The hash code is calculated through the list of bytes that this
 `ConfHexList` holds.

**Returns:** a hash code value for this object.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Returns string representation of a `ConfHexList`.

 Format a hexList as hexadecimal values separated with colons, as for
 example: "00:4f:4c:41:ff".

**Returns:** a string representation of this `ConfHexList`
