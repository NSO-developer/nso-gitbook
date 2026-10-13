# UnionTypeMethodsImpl <a href="#uniontypemethodsimpl-0df74c7efe0e" id="uniontypemethodsimpl-0df74c7efe0e"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.UnionTypeMethodsImpl
    extends com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Types: [CSTypeMethods](CSTypeMethods.md#cstypemethods-41a37625616b)

## Members

**Constructors**:

- [UnionTypeMethodsImpl\(\)](#uniontypemethodsimpl-0f3920ef5a19)

**Methods**:

- [stringToValue\(CSType, String\)](#stringtovalue-9fef98be9bb2)
- [validate\(CSType, ConfValue\)](#validate-d2696432436e)
- [valueToString\(CSType, ConfValue\)](#valuetostring-f281f6b6d7d7)

## Constructors

### UnionTypeMethodsImpl() <a href="#uniontypemethodsimpl-0f3920ef5a19" id="uniontypemethodsimpl-0f3920ef5a19"></a>

```java
public UnionTypeMethodsImpl()
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
