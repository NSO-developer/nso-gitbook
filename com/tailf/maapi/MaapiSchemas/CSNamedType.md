# CSNamedType <a href="#csnamedtype-6305f923b0f3" id="csnamedtype-6305f923b0f3"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSNamedType
```

Class representing a named type. A named type is represented as a
 name, type pair, where the name is a string and the type an
 instance of CSType.

## Members

**Constructors**:

- [CSNamedType()](#csnamedtype-f49a833ba022)
- [CSNamedType(String, CSType)](#csnamedtype-456f42d9d5af)

**Methods**:

- [getName()](#getname-2634b18b4a25)
- [getType()](#gettype-5a52f6f0d4c1)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### CSNamedType() <a href="#csnamedtype-f49a833ba022" id="csnamedtype-f49a833ba022"></a>

```java
protected CSNamedType()
```

Constructor for CSNamedType class

### CSNamedType(String, CSType) <a href="#csnamedtype-456f42d9d5af" id="csnamedtype-456f42d9d5af"></a>

```java
public CSNamedType(String name, com.tailf.maapi.MaapiSchemas.CSType type)
```

Types: [CSType](CSType.md#cstype-8bf086cc0595)

**Parameters**

- `String name`
- `com.tailf.maapi.MaapiSchemas.CSType type`


## Methods

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public String getName()
```

get the type name

**Returns:** String name

### getType() <a href="#gettype-5a52f6f0d4c1" id="gettype-5a52f6f0d4c1"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#cstype-8bf086cc0595)

get the type represented by an instance of CSType

**Returns:** CSType

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSNamedType instance

**Returns:** String
