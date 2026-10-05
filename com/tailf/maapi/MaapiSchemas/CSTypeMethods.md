<a id="s-CSTypeMethods"></a>
# CSTypeMethods

```java
public static class com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Class which contains type specific conversion and validation
 methods Has
 to be extended for aggregated and user types.

 When extended normally only the validation method has to be overridden

**Related classes**

- [BitsTypeMethodsImpl](BitsTypeMethodsImpl.md#s-BitsTypeMethodsImpl)
- [Decimal64TypeMethodsImpl](Decimal64TypeMethodsImpl.md#s-Decimal64TypeMethodsImpl)
- [DisplayHintTypeMethodsImpl](DisplayHintTypeMethodsImpl.md#s-DisplayHintTypeMethodsImpl)
- [EnumTypeMethodsImpl](EnumTypeMethodsImpl.md#s-EnumTypeMethodsImpl)
- [IdentityTypeMethodsImpl](IdentityTypeMethodsImpl.md#s-IdentityTypeMethodsImpl)
- [ListRestrictionTypeMethodsImpl](ListRestrictionTypeMethodsImpl.md#s-ListRestrictionTypeMethodsImpl)
- [ListTypeMethodsImpl](ListTypeMethodsImpl.md#s-ListTypeMethodsImpl)
- [QNameTypeMethodsImpl](../QNameTypeMethodsImpl.md#s-QNameTypeMethodsImpl)
- [RetrictedNumberTypeMethodsImpl](RetrictedNumberTypeMethodsImpl.md#s-RetrictedNumberTypeMethodsImpl)
- [StringTypeMethodsImpl](StringTypeMethodsImpl.md#s-StringTypeMethodsImpl)
- [UnionTypeMethodsImpl](UnionTypeMethodsImpl.md#s-UnionTypeMethodsImpl)

## Members

**Constructors**:

- [CSTypeMethods()](#s-CSTypeMethods-1)

**Methods**:

- [stringToValue(CSType, String)](#s-stringToValue)
- [validate(CSType, ConfValue)](#s-validate)
- [valueToString(CSType, ConfValue)](#s-valueToString)

## Constructors

<a id="s-CSTypeMethods-1"></a>
### CSTypeMethods()

```java
public CSTypeMethods()
```


## Methods

<a id="s-stringToValue"></a>
### stringToValue(CSType, String)

```java
public com.tailf.conf.ConfValue stringToValue(
    com.tailf.maapi.MaapiSchemas.CSType type,
    String str
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfValue](../../conf/ConfValue.md#s-ConfValue), [CSType](CSType.md#s-CSType), [MaapiException](../MaapiException.md#s-MaapiException)

parse value located in str and convert to ConfValue, the value is
 validated.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `String str` - - string representation of the value

**Returns:** ConfValue for the corresponding type

**Throws**

- `MaapiException`

<a id="s-validate"></a>
### validate(CSType, ConfValue)

```java
public boolean validate(
    com.tailf.maapi.MaapiSchemas.CSType type,
    com.tailf.conf.ConfValue val
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSType](CSType.md#s-CSType), [ConfValue](../../conf/ConfValue.md#s-ConfValue), [MaapiException](../MaapiException.md#s-MaapiException)

Validates ConfValue of with rules from CSType

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`

**Returns:** boolean true if valid

**Throws**

- `MaapiException`

<a id="s-valueToString"></a>
### valueToString(CSType, ConfValue)

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](CSType.md#s-CSType), [ConfValue](../../conf/ConfValue.md#s-ConfValue)

convert to string representation for the corresponding Confvalue

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `com.tailf.conf.ConfValue val` - - ConfValue

**Returns:** String representation of the value
