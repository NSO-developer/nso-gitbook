<a id="cls-PathElement"></a>
# PathElement

```java
public static class com.tailf.conf.gen.PathParser.PathElement
```

## Members

**Constructors**:

- [PathElement()](#m-pathelement-f49964060be9)

**Fields**:

- [isDummy](#m-isDummy)
- [isRelative](#m-isRelative)
- [keys](#m-keys)
- [namespace](#m-namespace)
- [ordinal](#m-ordinal)
- [term](#m-term)

**Methods**:

- [equals(Object)](#m-equals-fcd6492e0d6c)
- [hashCode()](#m-hashcode-ef797a217903)

## Constructors

<a id="m-pathelement-f49964060be9"></a>
### PathElement()

```java
public PathElement()
```


## Fields

<a id="m-isDummy"></a>
### isDummy

```java
public boolean isDummy = null;
```

<a id="m-isRelative"></a>
### isRelative

```java
public boolean isRelative = null;
```

<a id="m-keys"></a>
### keys

```java
public java.util.ArrayList<com.tailf.conf.gen.PathParser.PathKey> keys = null;
```

Types: [PathKey](PathKey.md#cls-PathKey)

<a id="m-namespace"></a>
### namespace

```java
public Object namespace = null;
```

<a id="m-ordinal"></a>
### ordinal

```java
public Integer ordinal = null;
```

<a id="m-term"></a>
### term

```java
public com.tailf.conf.ConfObject term = null;
```

Types: [ConfObject](../../ConfObject.md#cls-ConfObject)


## Methods

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

```java
public boolean equals(Object rhs)
```

**Parameters**

- `Object rhs`

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```
