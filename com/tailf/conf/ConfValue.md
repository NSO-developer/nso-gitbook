<a id="s-ConfValue"></a>
# ConfValue

```java
public abstract class com.tailf.conf.ConfValue
    extends com.tailf.conf.ConfObject
```

Types: [ConfObject](ConfObject.md#s-ConfObject)

Base class of the DATA_CONTAINER `Conf<datatype>` classes.
 This class is used to represent an arbitrary Conf value.

**Related classes**

- [ConfAttributeValue](ConfAttributeValue.md#s-ConfAttributeValue)
- [ConfBinary](ConfBinary.md#s-ConfBinary)
- [ConfBits](ConfBits.md#s-ConfBits)
- [ConfBool](ConfBool.md#s-ConfBool)
- [ConfBuf](ConfBuf.md#s-ConfBuf)
- [ConfDate](ConfDate.md#s-ConfDate)
- [ConfDatetime](ConfDatetime.md#s-ConfDatetime)
- [ConfDefault](ConfDefault.md#s-ConfDefault)
- [ConfDottedQuad](ConfDottedQuad.md#s-ConfDottedQuad)
- [ConfDouble](ConfDouble.md#s-ConfDouble)
- [ConfDuration](ConfDuration.md#s-ConfDuration)
- [ConfEmpty](ConfEmpty.md#s-ConfEmpty)
- [ConfEnumeration](ConfEnumeration.md#s-ConfEnumeration)
- [ConfFloat](ConfFloat.md#s-ConfFloat)
- [ConfHexString](ConfHexString.md#s-ConfHexString)
- [ConfIdentityRef](ConfIdentityRef.md#s-ConfIdentityRef)
- [ConfInt32](ConfInt32.md#s-ConfInt32)
- [ConfInt64](ConfInt64.md#s-ConfInt64)
- [ConfIP](ConfIP.md#s-ConfIP)
- [ConfIPAndPrefixLen](ConfIPAndPrefixLen.md#s-ConfIPAndPrefixLen)
- [ConfIPPrefix](ConfIPPrefix.md#s-ConfIPPrefix)
- [ConfList](ConfList.md#s-ConfList)
- [ConfNoExists](ConfNoExists.md#s-ConfNoExists)
- [ConfObjectRef](ConfObjectRef.md#s-ConfObjectRef)
- [ConfOID](ConfOID.md#s-ConfOID)
- [ConfQname](ConfQname.md#s-ConfQname)
- [ConfTime](ConfTime.md#s-ConfTime)
- [ConfUInt32](ConfUInt32.md#s-ConfUInt32)
- [ConfUInt64](ConfUInt64.md#s-ConfUInt64)
- [ConfXMLTagH](ConfXMLTagH.md#s-ConfXMLTagH)

## Members

**Constructors**:

- [ConfValue()](#s-ConfValue-1)

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
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [getStringByValue(ConfPath, ConfValue)](#s-getStringByValue)
- [getStringByValue(String, ConfValue)](#s-getStringByValue-1)
- [getValueByString(ConfPath, String)](#s-getValueByString)
- [getValueByString(String, String)](#s-getValueByString-1)
- [hashCode()](#s-hashCode)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfValue-1"></a>
### ConfValue()

```java
public ConfValue()
```


## Methods

<a id="s-encode"></a>
### encode()

```java
public abstract com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

encode value.

<a id="s-equals"></a>
### equals(Object)

```java
public abstract boolean equals(Object o)
```

Determine if two ConfValue are equal. In general, ConfObjects are
 equal if the components they consist of are equal.

**Parameters**

- `Object o` - The object to compare to.

**Returns:** true if the objects are identical.

<a id="s-getStringByValue"></a>
### getStringByValue(ConfPath, ConfValue)

```java
public static String getStringByValue(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.ConfValue val
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#s-ConfPath), [ConfValue](ConfValue.md#s-ConfValue), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-getStringByValue-1"></a>
### getStringByValue(String, ConfValue)

```java
public static String getStringByValue(
    String path,
    com.tailf.conf.ConfValue val
)
    throws com.tailf.conf.ConfException
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-getValueByString"></a>
### getValueByString(ConfPath, String)

```java
public static com.tailf.conf.ConfValue getValueByString(
    com.tailf.conf.ConfPath path,
    String str
)
    throws com.tailf.conf.ConfException
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfPath](ConfPath.md#s-ConfPath), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-getValueByString-1"></a>
### getValueByString(String, String)

```java
public static com.tailf.conf.ConfValue getValueByString(
    String path,
    String str
)
    throws com.tailf.conf.ConfException
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfException](ConfException.md#s-ConfException)

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
