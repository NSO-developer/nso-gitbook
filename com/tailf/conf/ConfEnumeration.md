<a id="cls-ConfEnumeration"></a>
# ConfEnumeration

```java
public class com.tailf.conf.ConfEnumeration
    extends com.tailf.conf.ConfValue
    implements Cloneable, java.io.Serializable, Comparable<com.tailf.conf.ConfEnumeration>
```

Types: [ConfValue](ConfValue.md#cls-ConfValue), [ConfEnumeration](ConfEnumeration.md#cls-ConfEnumeration)

DATA_CONTAINER - Corresponds to the YANG Enumeration type.

## Members

**Constructors**:

- [ConfEnumeration(ConfEObject)](#m-confenumeration-0b36d185ab36)
- [ConfEnumeration(int)](#m-confenumeration-18cc3e275631)
- [ConfEnumeration(String)](#m-confenumeration-d75ad7199e37)

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
- [compareTo(ConfEnumeration)](#m-compareto-1d190ddeef7e)
- [decode(ConfEObject)](ConfObject.md#m-decode-609792d36602) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#m-decode-a814ebf64edc) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#m-decode-9b92f1de40d8) from ConfObject
- [encode()](#m-encode-fbae522bba37)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [getEnumByLabel(ConfPath, String)](#m-getenumbylabel-e5d8287d588c)
- [getEnumByLabel(String, String)](#m-getenumbylabel-a88365b46872)
- [getLabelByEnum(ConfPath, ConfEnumeration)](#m-getlabelbyenum-05e670d1aeff)
- [getLabelByEnum(String, ConfEnumeration)](#m-getlabelbyenum-b3622f0dc16e)
- [getOrdinalValue()](#m-getordinalvalue-8885c94e3344)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#m-getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#m-getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#m-getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString(String, String)](ConfValue.md#m-getvaluebystring-7804643cb027) from ConfValue
- [hashCode()](#m-hashcode-ef797a217903)
- [mk(int)](#m-mk-716c24a113ee)
- [setCSType(CSType)](#m-setcstype-1d9af222b932)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-confenumeration-0b36d185ab36"></a>
### ConfEnumeration(ConfEObject)

```java
public ConfEnumeration(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="m-confenumeration-18cc3e275631"></a>
### ConfEnumeration(int)

```java
public ConfEnumeration(int ordinalValue) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

Constructor for ConfEnumeration.

**Parameters**

- `int ordinalValue` - Ordinal value for ConfEnumeration.

**Throws**

- `ConfException` - Never, for API backwards compatibility.

<a id="m-confenumeration-d75ad7199e37"></a>
### ConfEnumeration(String)

```java
protected ConfEnumeration(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#cls-ConfException)

**Parameters**

- `String str`


## Methods

<a id="m-compareto-1d190ddeef7e"></a>
### compareTo(ConfEnumeration)

```java
public int compareTo(com.tailf.conf.ConfEnumeration o)
```

Types: [ConfEnumeration](ConfEnumeration.md#cls-ConfEnumeration)

**Parameters**

- `com.tailf.conf.ConfEnumeration o`

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

<a id="m-getenumbylabel-e5d8287d588c"></a>
### getEnumByLabel(ConfPath, String)

```java
public static com.tailf.conf.ConfEnumeration getEnumByLabel(
    com.tailf.conf.ConfPath path,
    String label
)
    throws com.tailf.conf.ConfException
```

Types: [ConfEnumeration](ConfEnumeration.md#cls-ConfEnumeration), [ConfPath](ConfPath.md#cls-ConfPath), [ConfException](ConfException.md#cls-ConfException)

Get an ConfEnumeration from the string label at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath pointing to the position of Enumeration
 in the schema.
- `String label` - String label for enum value

**Returns:** ConfEnumeration for the label

**Throws**

- `ConfException`

<a id="m-getenumbylabel-a88365b46872"></a>
### getEnumByLabel(String, String)

```java
public static com.tailf.conf.ConfEnumeration getEnumByLabel(
    String path,
    String label
)
    throws com.tailf.conf.ConfException
```

Types: [ConfEnumeration](ConfEnumeration.md#cls-ConfEnumeration), [ConfException](ConfException.md#cls-ConfException)

Get an ConfEnumeration from the string label at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `String path` - String pointing to the position of Enumeration
 in the schema.
- `String label` - String label for enum value

**Returns:** ConfEnumeration for the label

**Throws**

- `ConfException`

<a id="m-getlabelbyenum-05e670d1aeff"></a>
### getLabelByEnum(ConfPath, ConfEnumeration)

```java
public static String getLabelByEnum(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.ConfEnumeration e
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#cls-ConfPath), [ConfEnumeration](ConfEnumeration.md#cls-ConfEnumeration), [ConfException](ConfException.md#cls-ConfException)

Get the string label of an enumeration at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `com.tailf.conf.ConfPath path` - ConfPath pointing to the position of Enumeration
 in the schema.
- `com.tailf.conf.ConfEnumeration e` - ConfEnumeration containing ordinal value

**Returns:** String label for the ordinal value

**Throws**

- `ConfException`

<a id="m-getlabelbyenum-b3622f0dc16e"></a>
### getLabelByEnum(String, ConfEnumeration)

```java
public static String getLabelByEnum(
    String path,
    com.tailf.conf.ConfEnumeration e
)
    throws com.tailf.conf.ConfException
```

Types: [ConfEnumeration](ConfEnumeration.md#cls-ConfEnumeration), [ConfException](ConfException.md#cls-ConfException)

Get the string label of an enumeration at a given
 position in the schema.
 The given path must be absolute and fully qualified with
 schema prefixes.
 Note, this method relies on Maapi.loadSchemas() being
 called prior to this call.

**Parameters**

- `String path` - String path
- `com.tailf.conf.ConfEnumeration e` - ConfEnumeration containing ordinal value

**Returns:** String label for the ordinal value

**Throws**

- `ConfException`

<a id="m-getordinalvalue-8885c94e3344"></a>
### getOrdinalValue()

```java
public int getOrdinalValue()
```

Get the ordinal value (integer value) for this enumeration.

**Returns:** the ordinalValue

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

Java object hash code for this object instance

<a id="m-mk-716c24a113ee"></a>
### mk(int)

```java
public static com.tailf.conf.ConfEnumeration mk(int ordinalValue)
```

Types: [ConfEnumeration](ConfEnumeration.md#cls-ConfEnumeration)

Construct a ConfEnumeration from the given ordinalValue, provided as
 an alternative to ConfEnumeration(int ordinalValue), not throwing any
 exception.

**Parameters**

- `int ordinalValue` - Ordinal value for ConfEnumeration.

**Returns:** New ConfEnumeration object.

<a id="m-setcstype-1d9af222b932"></a>
### setCSType(CSType)

```java
public void setCSType(com.tailf.maapi.MaapiSchemas.CSType csType)
```

Types: [CSType](../maapi/MaapiSchemas/CSType.md#cls-CSType)

The MaapiSchemas type for this enum.
 The Schema type is used to be able to get the correct label for a
 specific ordinal value.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType csType` - MaapiSchemas.CsType

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Get the string value for this enumeration.
 This is the string label of the enumeration if and only if the
 MaapiSchemas type for this enumeration is know i.e. set using the
 setCSType() method.

 Otherwise it will be a representation of the
 ordinal value e.g "Enum(0)".
