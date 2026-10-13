# ConfEnumeration <a href="#confenumeration-c8557b4aeb53" id="confenumeration-c8557b4aeb53"></a>

```java
public class com.tailf.conf.ConfEnumeration
    extends com.tailf.conf.ConfValue
    implements Cloneable, java.io.Serializable, Comparable<com.tailf.conf.ConfEnumeration>
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d), [ConfEnumeration](ConfEnumeration.md#confenumeration-c8557b4aeb53)

DATA_CONTAINER - Corresponds to the YANG Enumeration type.

## Members

**Constructors**:

- [ConfEnumeration\(ConfEObject\)](#confenumeration-0b36d185ab36)
- [ConfEnumeration\(int\)](#confenumeration-18cc3e275631)
- [ConfEnumeration\(String\)](#confenumeration-d75ad7199e37)

**Fields**:

- [J\_BINARY](ConfObject.md#j_binary-f4395337afc2) from ConfObject
- [J\_BIT32](ConfObject.md#j_bit32-40251205e2bd) from ConfObject
- [J\_BIT64](ConfObject.md#j_bit64-15d68e666b90) from ConfObject
- [J\_BITBIG](ConfObject.md#j_bitbig-835affd18d2b) from ConfObject
- [J\_BOOL](ConfObject.md#j_bool-fa62aa9e1544) from ConfObject
- [J\_BUF](ConfObject.md#j_buf-d1b0b08b798f) from ConfObject
- [J\_CDBBEGIN](ConfObject.md#j_cdbbegin-07a4f9eca5c4) from ConfObject
- [J\_DATE](ConfObject.md#j_date-00cc8f6e70e6) from ConfObject
- [J\_DATETIME](ConfObject.md#j_datetime-573fe6a9a577) from ConfObject
- [J\_DECIMAL64](ConfObject.md#j_decimal64-ff02afe47ff7) from ConfObject
- [J\_DEFAULT](ConfObject.md#j_default-54b54b027809) from ConfObject
- [J\_DOUBLE](ConfObject.md#j_double-ade902bbb1aa) from ConfObject
- [J\_DQUAD](ConfObject.md#j_dquad-852ab4ec2848) from ConfObject
- [J\_DURATION](ConfObject.md#j_duration-98ef58bed1c0) from ConfObject
- [J\_EMPTY](ConfObject.md#j_empty-cca63c6cd2c7) from ConfObject
- [J\_ENUMERATION](ConfObject.md#j_enumeration-47c69754d29b) from ConfObject
- [J\_HEXSTR](ConfObject.md#j_hexstr-90b6b86efe7b) from ConfObject
- [J\_IDENTITYREF](ConfObject.md#j_identityref-977d471383c5) from ConfObject
- [J\_INSTANCE\_IDENTIFIER](ConfObject.md#j_instance_identifier-bbb4b8e5e954) from ConfObject
- [J\_INT16](ConfObject.md#j_int16-4f9df234cba7) from ConfObject
- [J\_INT32](ConfObject.md#j_int32-db4c66331284) from ConfObject
- [J\_INT64](ConfObject.md#j_int64-c290a7cb2e11) from ConfObject
- [J\_INT8](ConfObject.md#j_int8-8f73ffef0f12) from ConfObject
- [J\_IPV4](ConfObject.md#j_ipv4-54fdc3efb49b) from ConfObject
- [J\_IPV4\_AND\_PLEN](ConfObject.md#j_ipv4_and_plen-69b1e630ab12) from ConfObject
- [J\_IPV4PREFIX](ConfObject.md#j_ipv4prefix-d36121ba89ca) from ConfObject
- [J\_IPV6](ConfObject.md#j_ipv6-03903b354701) from ConfObject
- [J\_IPV6\_AND\_PLEN](ConfObject.md#j_ipv6_and_plen-ac1054abbf31) from ConfObject
- [J\_IPV6PREFIX](ConfObject.md#j_ipv6prefix-5e95c6e896d2) from ConfObject
- [J\_LIST](ConfObject.md#j_list-d74b9f073fdc) from ConfObject
- [J\_NOEXISTS](ConfObject.md#j_noexists-1f0f9b7a9591) from ConfObject
- [J\_OBJECTREF](ConfObject.md#j_objectref-577d14956cc8) from ConfObject
- [J\_OID](ConfObject.md#j_oid-2d504f7432b3) from ConfObject
- [J\_PTR](ConfObject.md#j_ptr-ef54b9484cab) from ConfObject
- [J\_QNAME](ConfObject.md#j_qname-0d2839adff4c) from ConfObject
- [J\_STR](ConfObject.md#j_str-ae3bb3034983) from ConfObject
- [J\_SYMBOL](ConfObject.md#j_symbol-25fd3742c374) from ConfObject
- [J\_TIME](ConfObject.md#j_time-3ecdebfb0af5) from ConfObject
- [J\_UINT16](ConfObject.md#j_uint16-1f95eafb4126) from ConfObject
- [J\_UINT32](ConfObject.md#j_uint32-200f00c0ee05) from ConfObject
- [J\_UINT64](ConfObject.md#j_uint64-6960c783d61f) from ConfObject
- [J\_UINT8](ConfObject.md#j_uint8-ab0567c53d7f) from ConfObject
- [J\_UNION](ConfObject.md#j_union-7c548945cda0) from ConfObject
- [J\_XMLBEGIN](ConfObject.md#j_xmlbegin-6b887ec4c61b) from ConfObject
- [J\_XMLBEGINDEL](ConfObject.md#j_xmlbegindel-6c4d37088d90) from ConfObject
- [J\_XMLEND](ConfObject.md#j_xmlend-e2b443858058) from ConfObject
- [J\_XMLMOVEAFTER](ConfObject.md#j_xmlmoveafter-e7f2fed6d94d) from ConfObject
- [J\_XMLMOVEFIRST](ConfObject.md#j_xmlmovefirst-776c36719f23) from ConfObject
- [J\_XMLTAG](ConfObject.md#j_xmltag-0a12f537271e) from ConfObject

**Methods**:

- [clone\(\)](ConfObject.md#clone-164c86c45e9b) from ConfObject
- [compare\(ConfObject, ConfObject\)](ConfObject.md#compare-e78552baa2bf) from ConfObject
- [compareTo\(ConfEnumeration\)](#compareto-1d190ddeef7e)
- [decode\(ConfEObject\)](ConfObject.md#decode-609792d36602) from ConfObject
- [decode\(ConfEObject, ConfPath\)](ConfObject.md#decode-a814ebf64edc) from ConfObject
- [decode\(ConfEObject, String\)](ConfObject.md#decode-9b92f1de40d8) from ConfObject
- [encode\(\)](#encode-fbae522bba37)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [getEnumByLabel\(ConfPath, String\)](#getenumbylabel-e5d8287d588c)
- [getEnumByLabel\(String, String\)](#getenumbylabel-a88365b46872)
- [getLabelByEnum\(ConfPath, ConfEnumeration\)](#getlabelbyenum-05e670d1aeff)
- [getLabelByEnum\(String, ConfEnumeration\)](#getlabelbyenum-b3622f0dc16e)
- [getOrdinalValue\(\)](#getordinalvalue-8885c94e3344)
- [getStringByValue\(ConfPath, ConfValue\)](ConfValue.md#getstringbyvalue-841fa68ad0f9) from ConfValue
- [getStringByValue\(String, ConfValue\)](ConfValue.md#getstringbyvalue-8ed173dcf8dc) from ConfValue
- [getValueByString\(ConfPath, String\)](ConfValue.md#getvaluebystring-e75fd0337a87) from ConfValue
- [getValueByString\(String, String\)](ConfValue.md#getvaluebystring-7804643cb027) from ConfValue
- [hashCode\(\)](#hashcode-ef797a217903)
- [mk\(int\)](#mk-716c24a113ee)
- [setCSType\(CSType\)](#setcstype-1d9af222b932)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### ConfEnumeration(ConfEObject) <a href="#confenumeration-0b36d185ab36" id="confenumeration-0b36d185ab36"></a>

```java
public ConfEnumeration(com.tailf.proto.ConfEObject o) throws com.tailf.conf.ConfException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.proto.ConfEObject o`

### ConfEnumeration(int) <a href="#confenumeration-18cc3e275631" id="confenumeration-18cc3e275631"></a>

```java
public ConfEnumeration(int ordinalValue) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

Constructor for ConfEnumeration.

**Parameters**

- `int ordinalValue` - Ordinal value for ConfEnumeration.

**Throws**

- `ConfException` - Never, for API backwards compatibility.

### ConfEnumeration(String) <a href="#confenumeration-d75ad7199e37" id="confenumeration-d75ad7199e37"></a>

```java
protected ConfEnumeration(String str) throws com.tailf.conf.ConfException
```

Types: [ConfException](ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `String str`


## Methods

### compareTo(ConfEnumeration) <a href="#compareto-1d190ddeef7e" id="compareto-1d190ddeef7e"></a>

```java
public int compareTo(com.tailf.conf.ConfEnumeration o)
```

Types: [ConfEnumeration](ConfEnumeration.md#confenumeration-c8557b4aeb53)

**Parameters**

- `com.tailf.conf.ConfEnumeration o`

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

**Parameters**

- `Object o`

### getEnumByLabel(ConfPath, String) <a href="#getenumbylabel-e5d8287d588c" id="getenumbylabel-e5d8287d588c"></a>

```java
public static com.tailf.conf.ConfEnumeration getEnumByLabel(
    com.tailf.conf.ConfPath path,
    String label
)
    throws com.tailf.conf.ConfException
```

Types: [ConfEnumeration](ConfEnumeration.md#confenumeration-c8557b4aeb53), [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### getEnumByLabel(String, String) <a href="#getenumbylabel-a88365b46872" id="getenumbylabel-a88365b46872"></a>

```java
public static com.tailf.conf.ConfEnumeration getEnumByLabel(
    String path,
    String label
)
    throws com.tailf.conf.ConfException
```

Types: [ConfEnumeration](ConfEnumeration.md#confenumeration-c8557b4aeb53), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### getLabelByEnum(ConfPath, ConfEnumeration) <a href="#getlabelbyenum-05e670d1aeff" id="getlabelbyenum-05e670d1aeff"></a>

```java
public static String getLabelByEnum(
    com.tailf.conf.ConfPath path,
    com.tailf.conf.ConfEnumeration e
)
    throws com.tailf.conf.ConfException
```

Types: [ConfPath](ConfPath.md#confpath-327831c6fc7d), [ConfEnumeration](ConfEnumeration.md#confenumeration-c8557b4aeb53), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### getLabelByEnum(String, ConfEnumeration) <a href="#getlabelbyenum-b3622f0dc16e" id="getlabelbyenum-b3622f0dc16e"></a>

```java
public static String getLabelByEnum(
    String path,
    com.tailf.conf.ConfEnumeration e
)
    throws com.tailf.conf.ConfException
```

Types: [ConfEnumeration](ConfEnumeration.md#confenumeration-c8557b4aeb53), [ConfException](ConfException.md#confexception-baeaab99f7f9)

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

### getOrdinalValue() <a href="#getordinalvalue-8885c94e3344" id="getordinalvalue-8885c94e3344"></a>

```java
public int getOrdinalValue()
```

Get the ordinal value (integer value) for this enumeration.

**Returns:** the ordinalValue

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

Java object hash code for this object instance

### mk(int) <a href="#mk-716c24a113ee" id="mk-716c24a113ee"></a>

```java
public static com.tailf.conf.ConfEnumeration mk(int ordinalValue)
```

Types: [ConfEnumeration](ConfEnumeration.md#confenumeration-c8557b4aeb53)

Construct a ConfEnumeration from the given ordinalValue, provided as
 an alternative to ConfEnumeration(int ordinalValue), not throwing any
 exception.

**Parameters**

- `int ordinalValue` - Ordinal value for ConfEnumeration.

**Returns:** New ConfEnumeration object.

### setCSType(CSType) <a href="#setcstype-1d9af222b932" id="setcstype-1d9af222b932"></a>

```java
public void setCSType(com.tailf.maapi.MaapiSchemas.CSType csType)
```

Types: [CSType](../maapi/MaapiSchemas/CSType.md#cstype-8bf086cc0595)

The MaapiSchemas type for this enum.
 The Schema type is used to be able to get the correct label for a
 specific ordinal value.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType csType` - MaapiSchemas.CsType

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Get the string value for this enumeration.
 This is the string label of the enumeration if and only if the
 MaapiSchemas type for this enumeration is know i.e. set using the
 setCSType() method.

 Otherwise it will be a representation of the
 ordinal value e.g "Enum(0)".
