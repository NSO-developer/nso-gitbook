<a id="s-CSType"></a>
# CSType

```java
public static class com.tailf.maapi.MaapiSchemas.CSType
```

Class representing a type

## Members

**Constructors**:

- [CSType()](#s-CSType-1)
- [CSType(CSType)](#s-CSType-2)
- [CSType(CSType, int, CSTypeMethods, Object)](#s-CSType-3)
- [CSType(int)](#s-CSType-4)

**Methods**:

- [getDefval()](#s-getDefval)
- [getListType()](#s-getListType)
- [getNativeType()](#s-getNativeType)
- [getOpaque()](#s-getOpaque)
- [getParentType()](#s-getParentType)
- [getSuperType()](#s-getSuperType)
- [setOpaque(Object)](#s-setOpaque)
- [toString()](#s-toString)

## Constructors

<a id="s-CSType-1"></a>
### CSType()

```java
public CSType()
```

<a id="s-CSType-2"></a>
### CSType(CSType)

```java
public CSType(com.tailf.maapi.MaapiSchemas.CSType type)
```

Types: [CSType](CSType.md#s-CSType)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`

<a id="s-CSType-3"></a>
### CSType(CSType, int, CSTypeMethods, Object)

```java
public CSType(
    com.tailf.maapi.MaapiSchemas.CSType parentType,
    int nativeType,
    com.tailf.maapi.MaapiSchemas.CSTypeMethods typeMethodsImpl,
    Object opaque
)
```

Types: [CSType](CSType.md#s-CSType), [CSTypeMethods](CSTypeMethods.md#s-CSTypeMethods)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType parentType`
- `int nativeType`
- `com.tailf.maapi.MaapiSchemas.CSTypeMethods typeMethodsImpl`
- `Object opaque`

<a id="s-CSType-4"></a>
### CSType(int)

```java
protected CSType(int nativeType)
```

**Parameters**

- `int nativeType`


## Methods

<a id="s-getDefval"></a>
### getDefval()

```java
public com.tailf.maapi.MaapiSchemas.CSType getDefval()
```

Types: [CSType](CSType.md#s-CSType)

get default value

**Returns:** CSType

<a id="s-getListType"></a>
### getListType()

```java
public com.tailf.maapi.MaapiSchemas.CSType getListType()
```

Types: [CSType](CSType.md#s-CSType)

Get base type for a leaf-list.

**Returns:** CSType

<a id="s-getNativeType"></a>
### getNativeType()

```java
public int getNativeType()
```

get native type represented by integer defined as static final int in
 [`ConfObject`](../../conf/ConfObject.md#s-ConfObject)

**Returns:** int or 0 if this is not an native type

<a id="s-getOpaque"></a>
### getOpaque()

```java
public <T> T getOpaque()
```

Get Opaque object used internally by validation methods

**Returns:** Object

<a id="s-getParentType"></a>
### getParentType()

```java
public com.tailf.maapi.MaapiSchemas.CSType getParentType()
```

Types: [CSType](CSType.md#s-CSType)

get parent type if this is not an native type

**Returns:** CSType parent type

<a id="s-getSuperType"></a>
### getSuperType()

```java
public int getSuperType()
```

<a id="s-setOpaque"></a>
### setOpaque(Object)

```java
protected void setOpaque(Object opaque)
```

**Parameters**

- `Object opaque`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSType instance

**Returns:** String
