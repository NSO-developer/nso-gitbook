# PathElement <a href="#pathelement-30082145995b" id="pathelement-30082145995b"></a>

```java
public static class com.tailf.conf.gen.PathParser.PathElement
```

## Members

**Constructors**:

- [PathElement()](#pathelement-f49964060be9)

**Fields**:

- [isDummy](#isdummy-073c64dd7cce)
- [isRelative](#isrelative-dffcfd7a3563)
- [keys](#keys-b408c92f97e4)
- [namespace](#namespace-9b66d2318bf6)
- [ordinal](#ordinal-f51afe442d63)
- [term](#term-06e3a07b3287)

**Methods**:

- [equals(Object)](#equals-fcd6492e0d6c)
- [hashCode()](#hashcode-ef797a217903)

## Constructors

### PathElement() <a href="#pathelement-f49964060be9" id="pathelement-f49964060be9"></a>

```java
public PathElement()
```


## Fields

### isDummy <a href="#isdummy-073c64dd7cce" id="isdummy-073c64dd7cce"></a>

```java
public boolean isDummy = null;
```

### isRelative <a href="#isrelative-dffcfd7a3563" id="isrelative-dffcfd7a3563"></a>

```java
public boolean isRelative = null;
```

### keys <a href="#keys-b408c92f97e4" id="keys-b408c92f97e4"></a>

```java
public java.util.ArrayList<com.tailf.conf.gen.PathParser.PathKey> keys = null;
```

Types: [PathKey](PathKey.md#pathkey-a9b70d1850aa)

### namespace <a href="#namespace-9b66d2318bf6" id="namespace-9b66d2318bf6"></a>

```java
public Object namespace = null;
```

### ordinal <a href="#ordinal-f51afe442d63" id="ordinal-f51afe442d63"></a>

```java
public Integer ordinal = null;
```

### term <a href="#term-06e3a07b3287" id="term-06e3a07b3287"></a>

```java
public com.tailf.conf.ConfObject term = null;
```

Types: [ConfObject](../../ConfObject.md#confobject-5433616953b2)


## Methods

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object rhs)
```

**Parameters**

- `Object rhs`

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```
