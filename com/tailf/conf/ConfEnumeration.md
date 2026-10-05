<a id="s-ConfEnumeration"></a>
# ConfEnumeration

```java
public class com.tailf.conf.ConfEnumeration
    extends com.tailf.conf.ConfValue
    implements Cloneable, java.io.Serializable, Comparable<com.tailf.conf.ConfEnumeration>
```

Types: [ConfValue](ConfValue.md#s-ConfValue), [ConfEnumeration](ConfEnumeration.md#s-ConfEnumeration)

DATA_CONTAINER - Corresponds to the YANG Enumeration type.

## Members

**Constructors**:

- [ConfEnumeration(ConfEObject)](#s-ConfEnumeration-1)
- [ConfEnumeration(int)](#s-ConfEnumeration-2)
- [ConfEnumeration(String)](#s-ConfEnumeration-3)

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
- [compareTo(ConfEnumeration)](#s-compareTo)
- [decode(ConfEObject)](ConfObject.md#s-decode) from ConfObject
- [decode(ConfEObject, ConfPath)](ConfObject.md#s-decode-1) from ConfObject
- [decode(ConfEObject, String)](ConfObject.md#s-decode-2) from ConfObject
- [encode()](#s-encode)
- [equals(Object)](#s-equals)
- [getEnumByLabel(ConfPath, String)](#s-getEnumByLabel)
- [getEnumByLabel(String, String)](#s-getEnumByLabel-1)
- [getLabelByEnum(ConfPath, ConfEnumeration)](#s-getLabelByEnum)
- [getLabelByEnum(String, ConfEnumeration)](#s-getLabelByEnum-1)
- [getOrdinalValue()](#s-getOrdinalValue)
- [getStringByValue(ConfPath, ConfValue)](ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByString(ConfPath, String)](ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](ConfValue.md#s-getValueByString-1) from ConfValue
- [hashCode()](#s-hashCode)
- [mk(int)](#s-mk)
- [setCSType(CSType)](#s-setCSType)
- [toString()](#s-toString)

## Constructors

<a id="s-ConfEnumeration-1"></a>
### ConfEnumeration(ConfEObject)

```java
public ConfEnumeration(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.proto.ConfEObject o`

<a id="s-ConfEnumeration-2"></a>
### ConfEnumeration(int)

```java
public ConfEnumeration(int ordinalValue) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

Constructor for ConfEnumeration.

**Parameters**

- `int ordinalValue` - Ordinal value for ConfEnumeration.

**Throws**

- `ConfException` - Never, for API backwards compatibility.

<a id="s-ConfEnumeration-3"></a>
### ConfEnumeration(String)

```java
protected ConfEnumeration(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#s-ConfException)

**Parameters**

- `String str`


## Methods

<a id="s-compareTo"></a>
### compareTo(ConfEnumeration)

```java
public int compareTo(com.tailf.conf.ConfEnumeration o)
```

Types: [ConfEnumeration](ConfEnumeration.md#s-ConfEnumeration)

**Parameters**

- `com.tailf.conf.ConfEnumeration o`

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

<a id="s-getEnumByLabel"></a>
### getEnumByLabel(ConfPath, String)

```java
public static com.tailf.conf.ConfEnumeration getEnumByLabel(
    com.tailf.conf.ConfPath path,
    String label
)
    throws com.tailf.conf.ConfException
```

Types: [ConfEnumeration](ConfEnumeration.md#s-ConfEnumeration), [ConfPath](ConfPath.md#s-ConfPath), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-getEnumByLabel-1"></a>
### getEnumByLabel(String, String)

```java
public static com.tailf.conf.ConfEnumeration getEnumByLabel(
    String path,
    String label
)
    throws com.tailf.conf.ConfException
```

Types: [ConfEnumeration](ConfEnumeration.md#s-ConfEnumeration), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-getLabelByEnum"></a>
### getLabelByEnum(ConfPath, ConfEnumeration)

```java
public static String getLabelByEnum(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.ConfEnumeration e
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#s-ConfPath), [ConfEnumeration](ConfEnumeration.md#s-ConfEnumeration), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-getLabelByEnum-1"></a>
### getLabelByEnum(String, ConfEnumeration)

```java
public static String getLabelByEnum(
    String path,
    com.tailf.conf.ConfEnumeration e
)
    throws com.tailf.conf.ConfException
```

Types: [ConfEnumeration](ConfEnumeration.md#s-ConfEnumeration), [ConfException](ConfException.md#s-ConfException)

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

<a id="s-getOrdinalValue"></a>
### getOrdinalValue()

```java
public int getOrdinalValue()
```

Get the ordinal value (integer value) for this enumeration.

**Returns:** the ordinalValue

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

Java object hash code for this object instance

<a id="s-mk"></a>
### mk(int)

```java
public static com.tailf.conf.ConfEnumeration mk(int ordinalValue)
```

Types: [ConfEnumeration](ConfEnumeration.md#s-ConfEnumeration)

Construct a ConfEnumeration from the given ordinalValue, provided as
 an alternative to ConfEnumeration(int ordinalValue), not throwing any
 exception.

**Parameters**

- `int ordinalValue` - Ordinal value for ConfEnumeration.

**Returns:** New ConfEnumeration object.

<a id="s-setCSType"></a>
### setCSType(CSType)

```java
public void setCSType(com.tailf.maapi.MaapiSchemas.CSType csType)
```

Types: [CSType](../maapi/MaapiSchemas/CSType.md#s-CSType)

The MaapiSchemas type for this enum.
 The Schema type is used to be able to get the correct label for a
 specific ordinal value.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType csType` - MaapiSchemas.CsType

<a id="s-toString"></a>
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
