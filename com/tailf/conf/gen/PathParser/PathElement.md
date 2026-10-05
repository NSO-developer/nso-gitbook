# PathElement <a href="#cls-PathElement" id="cls-PathElement"></a>

```java
public static class com.tailf.conf.gen.PathParser.PathElement
```

## Members

**Constructors**:

- [PathElement()](#m-PathElement-f49964060be9)

**Fields**:

- [isDummy](#m-isDummy)
- [isRelative](#m-isRelative)
- [keys](#m-keys)
- [namespace](#m-namespace)
- [ordinal](#m-ordinal)
- [term](#m-term)

**Methods**:

- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashCode-ef797a217903)

## Constructors

### PathElement() <a href="#m-PathElement-f49964060be9" id="m-PathElement-f49964060be9"></a>

```java
public PathElement()
```


## Fields

### isDummy <a href="#m-isDummy" id="m-isDummy"></a>

```java
public boolean isDummy = null;
```

### isRelative <a href="#m-isRelative" id="m-isRelative"></a>

```java
public boolean isRelative = null;
```

### keys <a href="#m-keys" id="m-keys"></a>

```java
public java.util.ArrayList<com.tailf.conf.gen.PathParser.PathKey> keys = null;
```

Types: [PathKey](PathKey.md#cls-PathKey)

### namespace <a href="#m-namespace" id="m-namespace"></a>

```java
public Object namespace = null;
```

### ordinal <a href="#m-ordinal" id="m-ordinal"></a>

```java
public Integer ordinal = null;
```

### term <a href="#m-term" id="m-term"></a>

```java
public com.tailf.conf.ConfObject term = null;
```

Types: [ConfObject](../../ConfObject.md#cls-ConfObject)


## Methods

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object rhs)
```

**Parameters**

- `Object rhs`

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```
