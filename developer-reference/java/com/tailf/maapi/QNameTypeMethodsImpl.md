# QNameTypeMethodsImpl <a href="#qnametypemethodsimpl-7cc2db36e342" id="qnametypemethodsimpl-7cc2db36e342"></a>

```java
public class com.tailf.maapi.QNameTypeMethodsImpl
    extends com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Types: [CSTypeMethods](MaapiSchemas/CSTypeMethods.md#cstypemethods-41a37625616b)

xs:QName type methods

## Members

**Constructors**:

- [QNameTypeMethodsImpl\(\)](#qnametypemethodsimpl-694f709231cf)

**Methods**:

- [stringToValue\(CSType, String\)](#stringtovalue-9fef98be9bb2)
- [validate\(CSType, ConfValue\)](MaapiSchemas/CSTypeMethods.md#validate-d2696432436e) from CSTypeMethods
- [valueToString\(CSType, ConfValue\)](#valuetostring-f281f6b6d7d7)

## Constructors

### QNameTypeMethodsImpl() <a href="#qnametypemethodsimpl-694f709231cf" id="qnametypemethodsimpl-694f709231cf"></a>

```java
public QNameTypeMethodsImpl()
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

Types: [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [CSType](MaapiSchemas/CSType.md#cstype-8bf086cc0595), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

*Description from* [`CSTypeMethods.stringToValue(com.tailf.maapi.MaapiSchemas.CSType, String)`](MaapiSchemas/CSTypeMethods.md#stringtovalue-9fef98be9bb2)

parse value located in str and convert to ConfValue, the value is
 validated.

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - \- type for the converted value
- `String str` - \- string representation of the value

**Returns:** ConfValue for the corresponding type

### valueToString(CSType, ConfValue) <a href="#valuetostring-f281f6b6d7d7" id="valuetostring-f281f6b6d7d7"></a>

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](MaapiSchemas/CSType.md#cstype-8bf086cc0595), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d)

*Description from* [`CSTypeMethods.valueToString(com.tailf.maapi.MaapiSchemas.CSType, com.tailf.conf.ConfValue)`](MaapiSchemas/CSTypeMethods.md#valuetostring-f281f6b6d7d7)

convert to string representation for the corresponding Confvalue

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type` - \- type for the converted value
- `com.tailf.conf.ConfValue val` - \- ConfValue

**Returns:** String representation of the value
