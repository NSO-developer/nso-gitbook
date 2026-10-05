# CSType <a href="#cls-CSType" id="cls-CSType"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSType
```

Class representing a type

## Members

**Constructors**:

- [CSType()](#m-CSType-ff40cc45b1b6)
- [CSType(CSType)](#m-CSType-c38ba137bef9)
- [CSType(CSType, int, CSTypeMethods, Object)](#m-CSType-0f57d2bd64a8)
- [CSType(int)](#m-CSType-5117a061d665)

**Methods**:

- [getDefval()](#m-getDefval-561ad5494c47)
- [getListType()](#m-getListType-ca1da952d2ff)
- [getNativeType()](#m-getNativeType-5e881dc4a7e8)
- [getOpaque()](#m-getOpaque-92e4945ec92d)
- [getParentType()](#m-getParentType-859131debbf6)
- [getSuperType()](#m-getSuperType-268c4b34af41)
- [setOpaque(Object)](#m-setOpaque-2578a6a555bb)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### CSType() <a href="#m-CSType-ff40cc45b1b6" id="m-CSType-ff40cc45b1b6"></a>

```java
public CSType()
```

### CSType(CSType) <a href="#m-CSType-c38ba137bef9" id="m-CSType-c38ba137bef9"></a>

```java
public CSType(com.tailf.maapi.MaapiSchemas.CSType type)
```

Types: [CSType](CSType.md#cls-CSType)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`

### CSType(CSType, int, CSTypeMethods, Object) <a href="#m-CSType-0f57d2bd64a8" id="m-CSType-0f57d2bd64a8"></a>

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

### CSType(int) <a href="#m-CSType-5117a061d665" id="m-CSType-5117a061d665"></a>

```java
protected CSType(int nativeType)
```

**Parameters**

- `int nativeType`


## Methods

### getDefval() <a href="#m-getDefval-561ad5494c47" id="m-getDefval-561ad5494c47"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getDefval()
```

Types: [CSType](CSType.md#cls-CSType)

get default value

**Returns:** CSType

### getListType() <a href="#m-getListType-ca1da952d2ff" id="m-getListType-ca1da952d2ff"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getListType()
```

Types: [CSType](CSType.md#cls-CSType)

Get base type for a leaf-list.

**Returns:** CSType

### getNativeType() <a href="#m-getNativeType-5e881dc4a7e8" id="m-getNativeType-5e881dc4a7e8"></a>

```java
public int getNativeType()
```

get native type represented by integer defined as static final int in
 [`ConfObject`](../../conf/ConfObject.md#cls-ConfObject)

**Returns:** int or 0 if this is not an native type

### getOpaque() <a href="#m-getOpaque-92e4945ec92d" id="m-getOpaque-92e4945ec92d"></a>

```java
public <T> T getOpaque()
```

Get Opaque object used internally by validation methods

**Returns:** Object

### getParentType() <a href="#m-getParentType-859131debbf6" id="m-getParentType-859131debbf6"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getParentType()
```

Types: [CSType](CSType.md#cls-CSType)

get parent type if this is not an native type

**Returns:** CSType parent type

### getSuperType() <a href="#m-getSuperType-268c4b34af41" id="m-getSuperType-268c4b34af41"></a>

```java
public int getSuperType()
```

### setOpaque(Object) <a href="#m-setOpaque-2578a6a555bb" id="m-setOpaque-2578a6a555bb"></a>

```java
protected void setOpaque(Object opaque)
```

**Parameters**

- `Object opaque`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSType instance

**Returns:** String
