# CSType <a href="#cstype-8bf086cc0595" id="cstype-8bf086cc0595"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSType
```

Class representing a type

## Members

**Constructors**:

- [CSType\(\)](#cstype-ff40cc45b1b6)
- [CSType\(CSType\)](#cstype-c38ba137bef9)
- [CSType\(CSType, int, CSTypeMethods, Object\)](#cstype-0f57d2bd64a8)
- [CSType\(int\)](#cstype-5117a061d665)

**Methods**:

- [getDefval\(\)](#getdefval-561ad5494c47)
- [getListType\(\)](#getlisttype-ca1da952d2ff)
- [getNativeType\(\)](#getnativetype-5e881dc4a7e8)
- [getOpaque\(\)](#getopaque-92e4945ec92d)
- [getParentType\(\)](#getparenttype-859131debbf6)
- [getSuperType\(\)](#getsupertype-268c4b34af41)
- [setOpaque\(Object\)](#setopaque-2578a6a555bb)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### CSType() <a href="#cstype-ff40cc45b1b6" id="cstype-ff40cc45b1b6"></a>

```java
public CSType()
```

### CSType(CSType) <a href="#cstype-c38ba137bef9" id="cstype-c38ba137bef9"></a>

```java
public CSType(com.tailf.maapi.MaapiSchemas.CSType type)
```

Types: [CSType](CSType.md#cstype-8bf086cc0595)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType type`

### CSType(CSType, int, CSTypeMethods, Object) <a href="#cstype-0f57d2bd64a8" id="cstype-0f57d2bd64a8"></a>

```java
public CSType(
    com.tailf.maapi.MaapiSchemas.CSType parentType,
    int nativeType,
    com.tailf.maapi.MaapiSchemas.CSTypeMethods typeMethodsImpl,
    Object opaque
)
```

Types: [CSType](CSType.md#cstype-8bf086cc0595), [CSTypeMethods](CSTypeMethods.md#cstypemethods-41a37625616b)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSType parentType`
- `int nativeType`
- `com.tailf.maapi.MaapiSchemas.CSTypeMethods typeMethodsImpl`
- `Object opaque`

### CSType(int) <a href="#cstype-5117a061d665" id="cstype-5117a061d665"></a>

```java
protected CSType(int nativeType)
```

**Parameters**

- `int nativeType`


## Methods

### getDefval() <a href="#getdefval-561ad5494c47" id="getdefval-561ad5494c47"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getDefval()
```

Types: [CSType](CSType.md#cstype-8bf086cc0595)

get default value

**Returns:** CSType

### getListType() <a href="#getlisttype-ca1da952d2ff" id="getlisttype-ca1da952d2ff"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getListType()
```

Types: [CSType](CSType.md#cstype-8bf086cc0595)

Get base type for a leaf-list.

**Returns:** CSType

### getNativeType() <a href="#getnativetype-5e881dc4a7e8" id="getnativetype-5e881dc4a7e8"></a>

```java
public int getNativeType()
```

get native type represented by integer defined as static final int in
 [`ConfObject`](../../conf/ConfObject.md#confobject-5433616953b2)

**Returns:** int or 0 if this is not an native type

### getOpaque() <a href="#getopaque-92e4945ec92d" id="getopaque-92e4945ec92d"></a>

```java
public <T> T getOpaque()
```

Get Opaque object used internally by validation methods

**Returns:** Object

### getParentType() <a href="#getparenttype-859131debbf6" id="getparenttype-859131debbf6"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSType getParentType()
```

Types: [CSType](CSType.md#cstype-8bf086cc0595)

get parent type if this is not an native type

**Returns:** CSType parent type

### getSuperType() <a href="#getsupertype-268c4b34af41" id="getsupertype-268c4b34af41"></a>

```java
public int getSuperType()
```

### setOpaque(Object) <a href="#setopaque-2578a6a555bb" id="setopaque-2578a6a555bb"></a>

```java
protected void setOpaque(Object opaque)
```

**Parameters**

- `Object opaque`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

Informative string representation of a CSType instance

**Returns:** String
