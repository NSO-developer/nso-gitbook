# BitsTypeMethodsImpl <a href="#bitstypemethodsimpl-ab532a8104f1" id="bitstypemethodsimpl-ab532a8104f1"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.BitsTypeMethodsImpl
    extends com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Types: [CSTypeMethods](CSTypeMethods.md#cstypemethods-41a37625616b)

## Members

**Constructors**:

- [BitsTypeMethodsImpl\(\)](#bitstypemethodsimpl-67c8ac9d3d79)

**Methods**:

- [stringToValue\(CSType, String\)](#stringtovalue-9fef98be9bb2)
- [validate\(CSType, ConfValue\)](#validate-d2696432436e)
- [valueToString\(CSType, ConfValue\)](#valuetostring-f281f6b6d7d7)

## Constructors

### BitsTypeMethodsImpl() <a href="#bitstypemethodsimpl-67c8ac9d3d79" id="bitstypemethodsimpl-67c8ac9d3d79"></a>

```java
public BitsTypeMethodsImpl()
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

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `String str`

### validate(CSType, ConfValue) <a href="#validate-d2696432436e" id="validate-d2696432436e"></a>

```java
public boolean validate(
    com.tailf.maapi.MaapiSchemas.CSType type,
    com.tailf.conf.ConfValue val
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSType](CSType.md#cstype-8bf086cc0595), [ConfValue](../../conf/ConfValue.md#confvalue-769292781c7d), [MaapiException](../MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`

### valueToString(CSType, ConfValue) <a href="#valuetostring-f281f6b6d7d7" id="valuetostring-f281f6b6d7d7"></a>

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](CSType.md#cstype-8bf086cc0595), [ConfValue](../../conf/ConfValue.md#confvalue-769292781c7d)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`
