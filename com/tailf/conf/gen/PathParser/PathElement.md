<a id="s-PathElement"></a>
# PathElement

```java
public static class com.tailf.conf.gen.PathParser.PathElement
```

## Members

**Constructors**:

- [PathElement()](#s-PathElement-1)

**Fields**:

- [isDummy](#s-isDummy)
- [isRelative](#s-isRelative)
- [keys](#s-keys)
- [namespace](#s-namespace)
- [ordinal](#s-ordinal)
- [term](#s-term)

**Methods**:

- [equals(Object)](#s-equals)
- [hashCode()](#s-hashCode)

## Constructors

<a id="s-PathElement-1"></a>
### PathElement()

```java
public PathElement()
```


## Fields

<a id="s-isDummy"></a>
### isDummy

```java
public boolean isDummy = null;
```

<a id="s-isRelative"></a>
### isRelative

```java
public boolean isRelative = null;
```

<a id="s-keys"></a>
### keys

```java
public java.util.ArrayList<com.tailf.conf.gen.PathParser.PathKey> keys = null;
```

Types: [PathKey](PathKey.md#s-PathKey)

<a id="s-namespace"></a>
### namespace

```java
public Object namespace = null;
```

<a id="s-ordinal"></a>
### ordinal

```java
public Integer ordinal = null;
```

<a id="s-term"></a>
### term

```java
public com.tailf.conf.ConfObject term = null;
```

Types: [ConfObject](../../ConfObject.md#s-ConfObject)


## Methods

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object rhs)
```

**Parameters**

- `Object rhs`

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```
