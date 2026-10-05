# ListTypeMethodsImpl <a href="#cls-ListTypeMethodsImpl" id="cls-ListTypeMethodsImpl"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.ListTypeMethodsImpl
    extends com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Types: [CSTypeMethods](CSTypeMethods.md#cls-CSTypeMethods)

## Members

**Constructors**:

- [ListTypeMethodsImpl()](#m-ListTypeMethodsImpl-30eb179e90b8)

**Methods**:

- [stringToValue(CSType, String)](#m-stringToValue-9fef98be9bb2)
- [validate(CSType, ConfValue)](#m-validate-d2696432436e)
- [valueToString(CSType, ConfValue)](#m-valueToString-f281f6b6d7d7)

## Constructors

### ListTypeMethodsImpl() <a href="#m-ListTypeMethodsImpl-30eb179e90b8" id="m-ListTypeMethodsImpl-30eb179e90b8"></a>

```java
public ListTypeMethodsImpl()
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

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `String str`

### validate(CSType, ConfValue) <a href="#m-validate-d2696432436e" id="m-validate-d2696432436e"></a>

```java
public boolean validate(
    com.tailf.maapi.MaapiSchemas.CSType type,
    com.tailf.conf.ConfValue val
)
    throws com.tailf.maapi.MaapiException
```

Types: [CSType](CSType.md#cls-CSType), [ConfValue](../../conf/ConfValue.md#cls-ConfValue), [MaapiException](../MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`

### valueToString(CSType, ConfValue) <a href="#m-valueToString-f281f6b6d7d7" id="m-valueToString-f281f6b6d7d7"></a>

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](CSType.md#cls-CSType), [ConfValue](../../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`
