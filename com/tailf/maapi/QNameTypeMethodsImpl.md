# QNameTypeMethodsImpl <a href="#cls-QNameTypeMethodsImpl" id="cls-QNameTypeMethodsImpl"></a>

```java
public class com.tailf.maapi.QNameTypeMethodsImpl
    extends com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Types: [CSTypeMethods](MaapiSchemas/CSTypeMethods.md#cls-CSTypeMethods)

xs:QName type methods

## Members

**Constructors**:

- [QNameTypeMethodsImpl()](#m-QNameTypeMethodsImpl-694f709231cf)

**Methods**:

- [stringToValue(CSType, String)](#m-stringToValue-9fef98be9bb2)
- [validate(CSType, ConfValue)](MaapiSchemas/CSTypeMethods.md#m-validate-d2696432436e) from CSTypeMethods
- [valueToString(CSType, ConfValue)](#m-valueToString-f281f6b6d7d7)

## Constructors

### QNameTypeMethodsImpl() <a href="#m-QNameTypeMethodsImpl-694f709231cf" id="m-QNameTypeMethodsImpl-694f709231cf"></a>

```java
public QNameTypeMethodsImpl()
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

Types: [ConfValue](../conf/ConfValue.md#cls-ConfValue), [CSType](MaapiSchemas/CSType.md#cls-CSType), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `String str`

### valueToString(CSType, ConfValue) <a href="#m-valueToString-f281f6b6d7d7" id="m-valueToString-f281f6b6d7d7"></a>

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](MaapiSchemas/CSType.md#cls-CSType), [ConfValue](../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`
