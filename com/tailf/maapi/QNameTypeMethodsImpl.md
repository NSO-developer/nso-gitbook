<a id="s-QNameTypeMethodsImpl"></a>
# QNameTypeMethodsImpl

```java
public class com.tailf.maapi.QNameTypeMethodsImpl
    extends com.tailf.maapi.MaapiSchemas.CSTypeMethods
```

Types: [CSTypeMethods](MaapiSchemas/CSTypeMethods.md#s-CSTypeMethods)

xs:QName type methods

## Members

**Constructors**:

- [QNameTypeMethodsImpl()](#s-QNameTypeMethodsImpl-1)

**Methods**:

- [stringToValue(CSType, String)](#s-stringToValue)
- [validate(CSType, ConfValue)](MaapiSchemas/CSTypeMethods.md#s-validate) from CSTypeMethods
- [valueToString(CSType, ConfValue)](#s-valueToString)

## Constructors

<a id="s-QNameTypeMethodsImpl-1"></a>
### QNameTypeMethodsImpl()

```java
public QNameTypeMethodsImpl()
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

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue), [CSType](MaapiSchemas/CSType.md#s-CSType), [MaapiException](MaapiException.md#s-MaapiException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `String str`

<a id="s-valueToString"></a>
### valueToString(CSType, ConfValue)

```java
public String valueToString(com.tailf.maapi.MaapiSchemas.CSType type, com.tailf.conf.ConfValue val)
```

Types: [CSType](MaapiSchemas/CSType.md#s-CSType), [ConfValue](../conf/ConfValue.md#s-ConfValue)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`
- `com.tailf.conf.ConfValue val`
