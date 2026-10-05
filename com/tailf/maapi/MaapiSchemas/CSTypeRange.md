<a id="s-CSTypeRange"></a>
# CSTypeRange

```java
public static class com.tailf.maapi.MaapiSchemas.CSTypeRange
```

## Members

**Constructors**:

- [CSTypeRange(ConfObject, ConfObject, int)](#s-CSTypeRange-1)

**Fields**:

- [CONFD_RANGE_MAX_EXCLUSIVE](#s-CONFD_RANGE_MAX_EXCLUSIVE)
- [CONFD_RANGE_MAX_INCLUSIVE](#s-CONFD_RANGE_MAX_INCLUSIVE)
- [CONFD_RANGE_MIN_EXCLUSIVE](#s-CONFD_RANGE_MIN_EXCLUSIVE)
- [CONFD_RANGE_MIN_INCLUSIVE](#s-CONFD_RANGE_MIN_INCLUSIVE)

**Methods**:

- [getFlags()](#s-getFlags)
- [getHigh()](#s-getHigh)
- [getLow()](#s-getLow)

## Constructors

<a id="s-CSTypeRange-1"></a>
### CSTypeRange(ConfObject, ConfObject, int)

```java
public CSTypeRange(com.tailf.conf.ConfObject lo, com.tailf.conf.ConfObject hi, int flags)
```

Types: [ConfObject](../../conf/ConfObject.md#s-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject lo`
- `com.tailf.conf.ConfObject hi`
- `int flags`


## Fields

<a id="s-CONFD_RANGE_MAX_EXCLUSIVE"></a>
### CONFD_RANGE_MAX_EXCLUSIVE

```java
public static final int CONFD_RANGE_MAX_EXCLUSIVE = 8;
```

<a id="s-CONFD_RANGE_MAX_INCLUSIVE"></a>
### CONFD_RANGE_MAX_INCLUSIVE

```java
public static final int CONFD_RANGE_MAX_INCLUSIVE = 4;
```

<a id="s-CONFD_RANGE_MIN_EXCLUSIVE"></a>
### CONFD_RANGE_MIN_EXCLUSIVE

```java
public static final int CONFD_RANGE_MIN_EXCLUSIVE = 2;
```

<a id="s-CONFD_RANGE_MIN_INCLUSIVE"></a>
### CONFD_RANGE_MIN_INCLUSIVE

```java
public static final int CONFD_RANGE_MIN_INCLUSIVE = 1;
```


## Methods

<a id="s-getFlags"></a>
### getFlags()

```java
public int getFlags()
```

<a id="s-getHigh"></a>
### getHigh()

```java
public com.tailf.conf.ConfObject getHigh()
```

Types: [ConfObject](../../conf/ConfObject.md#s-ConfObject)

<a id="s-getLow"></a>
### getLow()

```java
public com.tailf.conf.ConfObject getLow()
```

Types: [ConfObject](../../conf/ConfObject.md#s-ConfObject)
