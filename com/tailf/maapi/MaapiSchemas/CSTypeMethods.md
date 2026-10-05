# CSTypeMethods <a href="#cstypemethods-41a37625616b" id="cstypemethods-41a37625616b"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Class which contains type specific conversion and validation
 methods Has
 to be extended for aggregated and user types.

 When extended normally only the validation method has to be overridden

**Related classes**

- [BitsTypeMethodsImpl](BitsTypeMethodsImpl.md#bitstypemethodsimpl-ab532a8104f1)
- [Decimal64TypeMethodsImpl](Decimal64TypeMethodsImpl.md#decimal64typemethodsimpl-e475a1fe77d6)
- [DisplayHintTypeMethodsImpl](DisplayHintTypeMethodsImpl.md#displayhinttypemethodsimpl-4e5e33460120)
- [EnumTypeMethodsImpl](EnumTypeMethodsImpl.md#enumtypemethodsimpl-ec9eb997f38a)
- [IdentityTypeMethodsImpl](IdentityTypeMethodsImpl.md#identitytypemethodsimpl-de3e83445476)
- [ListRestrictionTypeMethodsImpl](ListRestrictionTypeMethodsImpl.md#listrestrictiontypemethodsimpl-e62d7f553207)
- [ListTypeMethodsImpl](ListTypeMethodsImpl.md#listtypemethodsimpl-5d3c814cc49d)
- [QNameTypeMethodsImpl](../QNameTypeMethodsImpl.md#qnametypemethodsimpl-7cc2db36e342)
- [RetrictedNumberTypeMethodsImpl](RetrictedNumberTypeMethodsImpl.md#retrictednumbertypemethodsimpl-b401efda450f)
- [StringTypeMethodsImpl](StringTypeMethodsImpl.md#stringtypemethodsimpl-68d35cd5ffbc)
- [UnionTypeMethodsImpl](UnionTypeMethodsImpl.md#uniontypemethodsimpl-0df74c7efe0e)

## Members

**Constructors**:

- [CSTypeMethods\(\)](#cstypemethods-d8284784290b)

**Methods**:

- [stringToValue\(CSType, String\)](#stringtovalue-9fef98be9bb2)
- [validate\(CSType, ConfValue\)](#validate-d2696432436e)
- [valueToString\(CSType, ConfValue\)](#valuetostring-f281f6b6d7d7)

## Constructors

### CSTypeMethods() <a href="#cstypemethods-d8284784290b" id="cstypemethods-d8284784290b"></a>

```java
public CSTypeMethods()
```


## Methods

### stringToValue(CSType, String) <a href="#stringtovalue-9fef98be9bb2" id="stringtovalue-9fef98be9bb2"></a>

```java
public com.tailf.conf.ConfValue stringToValue(
    com.tailf.maapi.MaapiSchemas.CSType type,
    String str
)
    throws com.tailf.maapi.MaapiException
```

Types: [ConfValue](../../conf/ConfValue.md#confvalue-769292781c7d), [CSType](CSType.md#cstype-8bf086cc0595), [MaapiException](../MaapiException.md#maapiexception-af58eb4e109e)

parse value located in str and convert to ConfValue, the value is
 validated.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `String str` - - string representation of the value

**Returns:** ConfValue for the corresponding type

**Throws**

- `MaapiException`

### validate(CSType, ConfValue) <a href="#validate-d2696432436e" id="validate-d2696432436e"></a>

```java
public boolean validate(
    com.tailf.maapi.MaapiSchemas.CSType type,
    com.tailf.conf.ConfValue val
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSType](CSType.md#cstype-8bf086cc0595), [ConfValue](../../conf/ConfValue.md#confvalue-769292781c7d), [MaapiException](../MaapiException.md#maapiexception-af58eb4e109e)

Validates ConfValue of with rules from CSType

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`

**Returns:** boolean true if valid

**Throws**

- `MaapiException`

### valueToString(CSType, ConfValue) <a href="#valuetostring-f281f6b6d7d7" id="valuetostring-f281f6b6d7d7"></a>

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](CSType.md#cstype-8bf086cc0595), [ConfValue](../../conf/ConfValue.md#confvalue-769292781c7d)

convert to string representation for the corresponding Confvalue

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - - type for the converted value
- `com.tailf.conf.ConfValue val` - - ConfValue

**Returns:** String representation of the value
