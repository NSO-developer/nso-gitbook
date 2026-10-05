<a id="s-CSNamedType"></a>
# CSNamedType

```java
public static class com.tailf.maapi.MaapiSchemas.CSNamedType
```

Class representing a named type. A named type is represented as a
 name, type pair, where the name is a string and the type an
 instance of CSType.

## Members

**Constructors**:

- [CSNamedType()](#s-CSNamedType-1)
- [CSNamedType(String, CSType)](#s-CSNamedType-2)

**Methods**:

- [getName()](#s-getName)
- [getType()](#s-getType)
- [toString()](#s-toString)

## Constructors

<a id="s-CSNamedType-1"></a>
### CSNamedType()

```java
protected CSNamedType()
```

Constructor for CSNamedType class

<a id="s-CSNamedType-2"></a>
### CSNamedType(String, CSType)

```java
public CSNamedType(String name, com.tailf.maapi.MaapiSchemas.CSType type)
```

Types: [CSType](CSType.md#s-CSType)

**Parameters**

- `String name`
- `com.tailf.maapi.MaapiSchemas.CSType type`


## Methods

<a id="s-getName"></a>
### getName()

```java
public String getName()
```

get the type name

**Returns:** String name

<a id="s-getType"></a>
### getType()

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#s-CSType)

get the type represented by an instance of CSType

**Returns:** CSType

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSNamedType instance

**Returns:** String
