# CSNamedType <a href="#cls-CSNamedType" id="cls-CSNamedType"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSNamedType
```

Class representing a named type. A named type is represented as a
 name, type pair, where the name is a string and the type an
 instance of CSType.

## Members

**Constructors**:

- [CSNamedType()](#m-CSNamedType-f49a833ba022)
- [CSNamedType(String, CSType)](#m-CSNamedType-456f42d9d5af)

**Methods**:

- [getName()](#m-getName-2634b18b4a25)
- [getType()](#m-getType-5a52f6f0d4c1)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CSNamedType() <a href="#m-CSNamedType-f49a833ba022" id="m-CSNamedType-f49a833ba022"></a>

```java
protected CSNamedType()
```

Constructor for CSNamedType class

### CSNamedType(String, CSType) <a href="#m-CSNamedType-456f42d9d5af" id="m-CSNamedType-456f42d9d5af"></a>

```java
public CSNamedType(String name, com.tailf.maapi.MaapiSchemas.CSType type)
```

Types: [CSType](CSType.md#cls-CSType)

**Parameters**

- `String name`
- `com.tailf.maapi.MaapiSchemas.CSType type`


## Methods

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public String getName()
```

get the type name

**Returns:** String name

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#cls-CSType)

get the type represented by an instance of CSType

**Returns:** CSType

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSNamedType instance

**Returns:** String
