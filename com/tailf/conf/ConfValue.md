<a id="cls-ConfValue"></a>
# ConfValue

```java
public abstract class com.tailf.conf.ConfValue
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#cls-ConfObject)

Base class of the DATA_CONTAINER `Conf<datatype>` classes.
 This class is used to represent an arbitrary Conf value.

**Related classes**

- [ConfAttributeValue](ConfAttributeValue.md#cls-ConfAttributeValue)
- [ConfBinary](ConfBinary.md#cls-ConfBinary)
- [ConfBits](ConfBits.md#cls-ConfBits)
- [ConfBool](ConfBool.md#cls-ConfBool)
- [ConfBuf](ConfBuf.md#cls-ConfBuf)
- [ConfDate](ConfDate.md#cls-ConfDate)
- [ConfDatetime](ConfDatetime.md#cls-ConfDatetime)
- [ConfDefault](ConfDefault.md#cls-ConfDefault)
- [ConfDottedQuad](ConfDottedQuad.md#cls-ConfDottedQuad)
- [ConfDouble](ConfDouble.md#cls-ConfDouble)
- [ConfDuration](ConfDuration.md#cls-ConfDuration)
- [ConfEmpty](ConfEmpty.md#cls-ConfEmpty)
- [ConfEnumeration](ConfEnumeration.md#cls-ConfEnumeration)
- [ConfFloat](ConfFloat.md#cls-ConfFloat)
- [ConfHexString](ConfHexString.md#cls-ConfHexString)
- [ConfIdentityRef](ConfIdentityRef.md#cls-ConfIdentityRef)
- [ConfInt32](ConfInt32.md#cls-ConfInt32)
- [ConfInt64](ConfInt64.md#cls-ConfInt64)
- [ConfIP](ConfIP.md#cls-ConfIP)
- [ConfIPAndPrefixLen](ConfIPAndPrefixLen.md#cls-ConfIPAndPrefixLen)
- [ConfIPPrefix](ConfIPPrefix.md#cls-ConfIPPrefix)
- [ConfList](ConfList.md#cls-ConfList)
- [ConfNoExists](ConfNoExists.md#cls-ConfNoExists)
- [ConfObjectRef](ConfObjectRef.md#cls-ConfObjectRef)
- [ConfOID](ConfOID.md#cls-ConfOID)
- [ConfQname](ConfQname.md#cls-ConfQname)
- [ConfTime](ConfTime.md#cls-ConfTime)
- [ConfUInt32](ConfUInt32.md#cls-ConfUInt32)
- [ConfUInt64](ConfUInt64.md#cls-ConfUInt64)
- [ConfXMLTagH](ConfXMLTagH.md#cls-ConfXMLTagH)

## Members

**Constructors**:

- [ConfValue()](#m-confvalue-25fd581e3655)

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
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getStringByValue(ConfPath, ConfValue)](#m-getstringbyvalue-841fa68ad0f9)
- [getStringByValue(String, ConfValue)](#m-getstringbyvalue-8ed173dcf8dc)
- [getValueByString(ConfPath, String)](#m-getvaluebystring-e75fd0337a87)
- [getValueByString(String, String)](#m-getvaluebystring-7804643cb027)
- [hashCode()](#m-hashcode-ef797a217903)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confvalue-25fd581e3655"></a>
### ConfValue()

```java
public ConfValue()
```


## Methods

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
public abstract com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

encode value.

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public abstract boolean equals(Object o)
```

Determine if two ConfValue are equal. In general, ConfObjects are
 equal if the components they consist of are equal.

**Parameters**

- `Object o` - The object to compare to.

**Returns:** true if the objects are identical.

<a id="m-getstringbyvalue-841fa68ad0f9"></a>
### getStringByValue(ConfPath, ConfValue)

```java
public static String getStringByValue(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.ConfValue val
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfValue](ConfValue.md#cls-ConfValue), [ConfException](ConfException.md#cls-ConfException)

Get the string representation of a ConfValue at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath representing the absolute
             schema path to the element
- `com.tailf.conf.ConfValue val` - ConfValue subclass representing the value

**Returns:** String representation of the value

**Throws**

- `ConfException`

<a id="m-getstringbyvalue-8ed173dcf8dc"></a>
### getStringByValue(String, ConfValue)

```java
public static String getStringByValue(
    String path,
    com.tailf.conf.ConfValue val
)
    throws com.tailf.conf.ConfException
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfException](ConfException.md#cls-ConfException)

Get the string representation of a ConfValue at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `String path` - String representing the absolute
             schema path to the element
- `com.tailf.conf.ConfValue val` - ConfValue subclass representing the value

**Returns:** String representation of the value

**Throws**

- `ConfException`

<a id="m-getvaluebystring-e75fd0337a87"></a>
### getValueByString(ConfPath, String)

```java
public static com.tailf.conf.ConfValue getValueByString(
    com.tailf.conf.ConfPath path,
    String str
)
    throws com.tailf.conf.ConfException
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

Get a ConfValue representation a string at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath representing the absolute
             schema path to the element
- `String str` - String representation of the value

**Returns:** ConfValue the value for the element

**Throws**

- `ConfException`

<a id="m-getvaluebystring-7804643cb027"></a>
### getValueByString(String, String)

```java
public static com.tailf.conf.ConfValue getValueByString(
    String path,
    String str
)
    throws com.tailf.conf.ConfException
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfException](ConfException.md#cls-ConfException)

Get a ConfValue representation a string at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `String path` - String representing the absolute
             schema path to the element
- `String str` - String representation of the value

**Returns:** String representation of the value

**Throws**

- `ConfException`

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
