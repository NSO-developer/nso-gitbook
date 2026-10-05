<a id="cls-CSTypeRange"></a>
# CSTypeRange

```java
public static class com.tailf.maapi.MaapiSchemas.CSTypeRange
```

## Members

**Constructors**:

- [CSTypeRange(ConfObject, ConfObject, int)](#m-cstyperange-67ad31ef6a41)

**Fields**:

- [CONFD_RANGE_MAX_EXCLUSIVE](#m-CONFD_RANGE_MAX_EXCLUSIVE)
- [CONFD_RANGE_MAX_INCLUSIVE](#m-CONFD_RANGE_MAX_INCLUSIVE)
- [CONFD_RANGE_MIN_EXCLUSIVE](#m-CONFD_RANGE_MIN_EXCLUSIVE)
- [CONFD_RANGE_MIN_INCLUSIVE](#m-CONFD_RANGE_MIN_INCLUSIVE)

**Methods**:

- [getFlags()](#m-getflags-3c1ca90fd29c)
- [getHigh()](#m-gethigh-92e6b3d5438b)
- [getLow()](#m-getlow-70f61b401781)

## Constructors

<a id="m-cstyperange-67ad31ef6a41"></a>
### CSTypeRange(ConfObject, ConfObject, int)

```java
public CSTypeRange(com.tailf.conf.ConfObject lo, com.tailf.conf.ConfObject hi, int flags)
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject lo`
- `com.tailf.conf.ConfObject hi`
- `int flags`


## Fields

<a id="m-CONFD_RANGE_MAX_EXCLUSIVE"></a>
### CONFD_RANGE_MAX_EXCLUSIVE

```java
public static final int CONFD_RANGE_MAX_EXCLUSIVE = 8;
```

<a id="m-CONFD_RANGE_MAX_INCLUSIVE"></a>
### CONFD_RANGE_MAX_INCLUSIVE

```java
public static final int CONFD_RANGE_MAX_INCLUSIVE = 4;
```

<a id="m-CONFD_RANGE_MIN_EXCLUSIVE"></a>
### CONFD_RANGE_MIN_EXCLUSIVE

```java
public static final int CONFD_RANGE_MIN_EXCLUSIVE = 2;
```

<a id="m-CONFD_RANGE_MIN_INCLUSIVE"></a>
### CONFD_RANGE_MIN_INCLUSIVE

```java
public static final int CONFD_RANGE_MIN_INCLUSIVE = 1;
```


## Methods

<a id="m-getflags-3c1ca90fd29c"></a>
### getFlags()

```java
public int getFlags()
```

<a id="m-gethigh-92e6b3d5438b"></a>
### getHigh()

```java
public com.tailf.conf.ConfObject getHigh()
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)

<a id="m-getlow-70f61b401781"></a>
### getLow()

```java
public com.tailf.conf.ConfObject getLow()
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)
