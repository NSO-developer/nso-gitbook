<a id="cls-ListRestrictionTypeMethodsImpl"></a>
# ListRestrictionTypeMethodsImpl

```java
public static class com.tailf.maapi.MaapiSchemas.ListRestrictionTypeMethodsImpl
    extends com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Types: [CSTypeMethods](CSTypeMethods.md#cls-CSTypeMethods)

## Members

**Constructors**:

- [ListRestrictionTypeMethodsImpl()](#m-listrestrictiontypemethodsimpl-01f04b462a16)

**Methods**:

- [stringToValue(CSType, String)](#m-stringtovalue-9fef98be9bb2)
- [validate(CSType, ConfValue)](#m-validate-d2696432436e)
- [valueToString(CSType, ConfValue)](#m-valuetostring-f281f6b6d7d7)

## Constructors

<a id="m-listrestrictiontypemethodsimpl-01f04b462a16"></a>
### ListRestrictionTypeMethodsImpl()

```java
public ListRestrictionTypeMethodsImpl()
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

Types: [ConfValue](../../conf/ConfValue.md#cls-ConfValue), [CSType](CSType.md#cls-CSType), [MaapiException](../MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `String str`

<a id="m-validate-d2696432436e"></a>
### validate(CSType, ConfValue)

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

<a id="m-valuetostring-f281f6b6d7d7"></a>
### valueToString(CSType, ConfValue)

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](CSType.md#cls-CSType), [ConfValue](../../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`
