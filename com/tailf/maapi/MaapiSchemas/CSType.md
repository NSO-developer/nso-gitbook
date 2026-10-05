<a id="cls-CSType"></a>
# CSType

```java
public static class com.tailf.maapi.MaapiSchemas.CSType
```

Class representing a type

## Members

**Constructors**:

- [CSType()](#m-cstype-ff40cc45b1b6)
- [CSType(CSType)](#m-cstype-c38ba137bef9)
- [CSType(CSType, int, CSTypeMethods, Object)](#m-cstype-0f57d2bd64a8)
- [CSType(int)](#m-cstype-5117a061d665)

**Methods**:

- [getDefval()](#m-getdefval-561ad5494c47)
- [getListType()](#m-getlisttype-ca1da952d2ff)
- [getNativeType()](#m-getnativetype-5e881dc4a7e8)
- [getOpaque()](#m-getopaque-92e4945ec92d)
- [getParentType()](#m-getparenttype-859131debbf6)
- [getSuperType()](#m-getsupertype-268c4b34af41)
- [setOpaque(Object)](#m-setopaque-2578a6a555bb)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-cstype-ff40cc45b1b6"></a>
### CSType()

```java
public CSType()
```

<a id="m-cstype-c38ba137bef9"></a>
### CSType(CSType)

```java
public CSType(com.tailf.maapi.MaapiSchemas.CSType type)
```

Types: [CSType](CSType.md#cls-CSType)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`

<a id="m-cstype-0f57d2bd64a8"></a>
### CSType(CSType, int, CSTypeMethods, Object)

```java
public CSType(
    com.tailf.maapi.MaapiSchemas.CSType parentType,
    int nativeType,
    com.tailf.maapi.MaapiSchemas.CSTypeMethods typeMethodsImpl,
    Object opaque
)
```

Types: [CSType](CSType.md#cls-CSType), [CSTypeMethods](CSTypeMethods.md#cls-CSTypeMethods)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType parentType`
- `int nativeType`
- `com.tailf.maapi.MaapiSchemas.CSTypeMethods typeMethodsImpl`
- `Object opaque`

<a id="m-cstype-5117a061d665"></a>
### CSType(int)

```java
protected CSType(int nativeType)
```

**Parameters**

- `int nativeType`


## Methods

<a id="m-getdefval-561ad5494c47"></a>
### getDefval()

```java
public com.tailf.maapi.MaapiSchemas.CSType getDefval()
```

Types: [CSType](CSType.md#cls-CSType)

get default value

**Returns:** CSType

<a id="m-getlisttype-ca1da952d2ff"></a>
### getListType()

```java
public com.tailf.maapi.MaapiSchemas.CSType getListType()
```

Types: [CSType](CSType.md#cls-CSType)

Get base type for a leaf-list.

**Returns:** CSType

<a id="m-getnativetype-5e881dc4a7e8"></a>
### getNativeType()

```java
public int getNativeType()
```

get native type represented by integer defined as static final int in
 [`ConfObject`](../../conf/ConfObject.md#cls-ConfObject)

**Returns:** int or 0 if this is not an native type

<a id="m-getopaque-92e4945ec92d"></a>
### getOpaque()

```java
public <T> T getOpaque()
```

Get Opaque object used internally by validation methods

**Returns:** Object

<a id="m-getparenttype-859131debbf6"></a>
### getParentType()

```java
public com.tailf.maapi.MaapiSchemas.CSType getParentType()
```

Types: [CSType](CSType.md#cls-CSType)

get parent type if this is not an native type

**Returns:** CSType parent type

<a id="m-getsupertype-268c4b34af41"></a>
### getSuperType()

```java
public int getSuperType()
```

<a id="m-setopaque-2578a6a555bb"></a>
### setOpaque(Object)

```java
protected void setOpaque(Object opaque)
```

**Parameters**

- `Object opaque`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSType instance

**Returns:** String
