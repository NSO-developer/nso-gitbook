<a id="cls-CSNamedType"></a>
# CSNamedType

```java
public static class com.tailf.maapi.MaapiSchemas.CSNamedType
```

Class representing a named type. A named type is represented as a
 name, type pair, where the name is a string and the type an
 instance of CSType.

## Members

**Constructors**:

- [CSNamedType()](#m-csnamedtype-f49a833ba022)
- [CSNamedType(String, CSType)](#m-csnamedtype-456f42d9d5af)

**Methods**:

- [getName()](#m-getname-2634b18b4a25)
- [getType()](#m-gettype-5a52f6f0d4c1)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-csnamedtype-f49a833ba022"></a>
### CSNamedType()

```java
protected CSNamedType()
```

Constructor for CSNamedType class

<a id="m-csnamedtype-456f42d9d5af"></a>
### CSNamedType(String, CSType)

```java
public CSNamedType(String name, com.tailf.maapi.MaapiSchemas.CSType type)
```

Types: [CSType](CSType.md#cls-CSType)

**Parameters**

- `String name`
- `com.tailf.maapi.MaapiSchemas.CSType type`


## Methods

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public String getName()
```

get the type name

**Returns:** String name

<a id="m-gettype-5a52f6f0d4c1"></a>
### getType()

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#cls-CSType)

get the type represented by an instance of CSType

**Returns:** CSType

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSNamedType instance

**Returns:** String
