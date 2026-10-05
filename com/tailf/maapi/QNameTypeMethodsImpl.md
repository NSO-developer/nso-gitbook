<a id="cls-QNameTypeMethodsImpl"></a>
# QNameTypeMethodsImpl

```java
public class com.tailf.maapi.QNameTypeMethodsImpl
    extends com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Types: [CSTypeMethods](MaapiSchemas/CSTypeMethods.md#cls-CSTypeMethods)

xs:QName type methods

## Members

**Constructors**:

- [QNameTypeMethodsImpl()](#m-qnametypemethodsimpl-694f709231cf)

**Methods**:

- [stringToValue(CSType, String)](#m-stringtovalue-9fef98be9bb2)
- [validate(CSType, ConfValue)](MaapiSchemas/CSTypeMethods.md#m-validate-d2696432436e) from CSTypeMethods
- [valueToString(CSType, ConfValue)](#m-valuetostring-f281f6b6d7d7)

## Constructors

<a id="m-qnametypemethodsimpl-694f709231cf"></a>
### QNameTypeMethodsImpl()

```java
public QNameTypeMethodsImpl()
```


## Methods

<a id="m-stringtovalue-9fef98be9bb2"></a>
### stringToValue(CSType, String)

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

<a id="m-valuetostring-f281f6b6d7d7"></a>
### valueToString(CSType, ConfValue)

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](MaapiSchemas/CSType.md#cls-CSType), [ConfValue](../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`
