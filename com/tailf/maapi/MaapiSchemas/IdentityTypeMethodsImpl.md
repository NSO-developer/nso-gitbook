<a id="s-IdentityTypeMethodsImpl"></a>
# IdentityTypeMethodsImpl

```java
public static class com.tailf.maapi.MaapiSchemas.IdentityTypeMethodsImpl
    extends com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Types: [CSTypeMethods](CSTypeMethods.md#s-CSTypeMethods)

## Members

**Constructors**:

- [IdentityTypeMethodsImpl()](#s-IdentityTypeMethodsImpl-1)

**Methods**:

- [stringToValue(CSType, String)](#s-stringToValue)
- [validate(CSType, ConfValue)](#s-validate)
- [valueToString(CSType, ConfValue)](#s-valueToString)

## Constructors

<a id="s-IdentityTypeMethodsImpl-1"></a>
### IdentityTypeMethodsImpl()

```java
public IdentityTypeMethodsImpl()
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

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `String str`

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

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`

<a id="s-valueToString"></a>
### valueToString(CSType, ConfValue)

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](CSType.md#s-CSType), [ConfValue](../../conf/ConfValue.md#s-ConfValue)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`
