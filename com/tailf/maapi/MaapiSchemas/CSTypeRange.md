# CSTypeRange <a href="#cstyperange-3ed2b19cd40b" id="cstyperange-3ed2b19cd40b"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSTypeRange
```

## Members

**Constructors**:

- [CSTypeRange(ConfObject, ConfObject, int)](#cstyperange-67ad31ef6a41)

**Fields**:

- [CONFD_RANGE_MAX_EXCLUSIVE](#confd_range_max_exclusive-2890dfee8f22)
- [CONFD_RANGE_MAX_INCLUSIVE](#confd_range_max_inclusive-f33fbb91799c)
- [CONFD_RANGE_MIN_EXCLUSIVE](#confd_range_min_exclusive-ce3ab3351f83)
- [CONFD_RANGE_MIN_INCLUSIVE](#confd_range_min_inclusive-e9e4be7babaa)

**Methods**:

- [getFlags()](#getflags-3c1ca90fd29c)
- [getHigh()](#gethigh-92e6b3d5438b)
- [getLow()](#getlow-70f61b401781)

## Constructors

### CSTypeRange(ConfObject, ConfObject, int) <a href="#cstyperange-67ad31ef6a41" id="cstyperange-67ad31ef6a41"></a>

```java
public CSTypeRange(com.tailf.conf.ConfObject lo, com.tailf.conf.ConfObject hi, int flags)
```

Types: [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2)

**Parameters**

- `com.tailf.conf.ConfObject lo`
- `com.tailf.conf.ConfObject hi`
- `int flags`


## Fields

### CONFD_RANGE_MAX_EXCLUSIVE <a href="#confd_range_max_exclusive-2890dfee8f22" id="confd_range_max_exclusive-2890dfee8f22"></a>

```java
public static final int CONFD_RANGE_MAX_EXCLUSIVE = 8;
```

### CONFD_RANGE_MAX_INCLUSIVE <a href="#confd_range_max_inclusive-f33fbb91799c" id="confd_range_max_inclusive-f33fbb91799c"></a>

```java
public static final int CONFD_RANGE_MAX_INCLUSIVE = 4;
```

### CONFD_RANGE_MIN_EXCLUSIVE <a href="#confd_range_min_exclusive-ce3ab3351f83" id="confd_range_min_exclusive-ce3ab3351f83"></a>

```java
public static final int CONFD_RANGE_MIN_EXCLUSIVE = 2;
```

### CONFD_RANGE_MIN_INCLUSIVE <a href="#confd_range_min_inclusive-e9e4be7babaa" id="confd_range_min_inclusive-e9e4be7babaa"></a>

```java
public static final int CONFD_RANGE_MIN_INCLUSIVE = 1;
```


## Methods

### getFlags() <a href="#getflags-3c1ca90fd29c" id="getflags-3c1ca90fd29c"></a>

```java
public int getFlags()
```

### getHigh() <a href="#gethigh-92e6b3d5438b" id="gethigh-92e6b3d5438b"></a>

```java
public com.tailf.conf.ConfObject getHigh()
```

Types: [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2)

### getLow() <a href="#getlow-70f61b401781" id="getlow-70f61b401781"></a>

```java
public com.tailf.conf.ConfObject getLow()
```

Types: [ConfObject](../../conf/ConfObject.md#confobject-5433616953b2)
