# CSTypeMethods <a href="#cls-CSTypeMethods" id="cls-CSTypeMethods"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Class which contains type specific conversion and validation
 methods Has
 to be extended for aggregated and user types.

 When extended normally only the validation method has to be overridden

**Related classes**

- [BitsTypeMethodsImpl](BitsTypeMethodsImpl.md#cls-BitsTypeMethodsImpl)
- [Decimal64TypeMethodsImpl](Decimal64TypeMethodsImpl.md#cls-Decimal64TypeMethodsImpl)
- [DisplayHintTypeMethodsImpl](DisplayHintTypeMethodsImpl.md#cls-DisplayHintTypeMethodsImpl)
- [EnumTypeMethodsImpl](EnumTypeMethodsImpl.md#cls-EnumTypeMethodsImpl)
- [IdentityTypeMethodsImpl](IdentityTypeMethodsImpl.md#cls-IdentityTypeMethodsImpl)
- [ListRestrictionTypeMethodsImpl](ListRestrictionTypeMethodsImpl.md#cls-ListRestrictionTypeMethodsImpl)
- [ListTypeMethodsImpl](ListTypeMethodsImpl.md#cls-ListTypeMethodsImpl)
- [QNameTypeMethodsImpl](../QNameTypeMethodsImpl.md#cls-QNameTypeMethodsImpl)
- [RetrictedNumberTypeMethodsImpl](RetrictedNumberTypeMethodsImpl.md#cls-RetrictedNumberTypeMethodsImpl)
- [StringTypeMethodsImpl](StringTypeMethodsImpl.md#cls-StringTypeMethodsImpl)
- [UnionTypeMethodsImpl](UnionTypeMethodsImpl.md#cls-UnionTypeMethodsImpl)

## Members

**Constructors**:

- [CSTypeMethods()](#m-CSTypeMethods-d8284784290b)

**Methods**:

- [stringToValue(CSType, String)](#m-stringToValue-9fef98be9bb2)
- [validate(CSType, ConfValue)](#m-validate-d2696432436e)
- [valueToString(CSType, ConfValue)](#m-valueToString-f281f6b6d7d7)

## Constructors

### CSTypeMethods() <a href="#m-CSTypeMethods-d8284784290b" id="m-CSTypeMethods-d8284784290b"></a>

```java
public CSTypeMethods()
```


## Methods

### stringToValue(CSType, String) <a href="#m-stringToValue-9fef98be9bb2" id="m-stringToValue-9fef98be9bb2"></a>

```java
public com.tailf.conf.ConfValue stringToValue(
    com.tailf.maapi.MaapiSchemas.CSType type,
    String str
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfValue](../../conf/ConfValue.md#cls-ConfValue), [CSType](CSType.md#cls-CSType), [MaapiException](../MaapiException.md#cls-MaapiException)

parse value located in str and convert to ConfValue, the value is
 validated.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `String str` - - string representation of the value

**Returns:** ConfValue for the corresponding type

**Throws**

- `MaapiException`

### validate(CSType, ConfValue) <a href="#m-validate-d2696432436e" id="m-validate-d2696432436e"></a>

```java
public boolean validate(
    com.tailf.maapi.MaapiSchemas.CSType type,
    com.tailf.conf.ConfValue val
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSType](CSType.md#cls-CSType), [ConfValue](../../conf/ConfValue.md#cls-ConfValue), [MaapiException](../MaapiException.md#cls-MaapiException)

Validates ConfValue of with rules from CSType

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`

**Returns:** boolean true if valid

**Throws**

- `MaapiException`

### valueToString(CSType, ConfValue) <a href="#m-valueToString-f281f6b6d7d7" id="m-valueToString-f281f6b6d7d7"></a>

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](CSType.md#cls-CSType), [ConfValue](../../conf/ConfValue.md#cls-ConfValue)

convert to string representation for the corresponding Confvalue

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `com.tailf.conf.ConfValue val` - - ConfValue

**Returns:** String representation of the value
