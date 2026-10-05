# CSTypeRange <a href="#cls-CSTypeRange" id="cls-CSTypeRange"></a>

```java
public static class com.tailf.maapi.MaapiSchemas.CSTypeRange
```

## Members

**Constructors**:

- [CSTypeRange(ConfObject, ConfObject, int)](#m-CSTypeRange-67ad31ef6a41)

**Fields**:

- [CONFD_RANGE_MAX_EXCLUSIVE](#m-CONFD_RANGE_MAX_EXCLUSIVE)
- [CONFD_RANGE_MAX_INCLUSIVE](#m-CONFD_RANGE_MAX_INCLUSIVE)
- [CONFD_RANGE_MIN_EXCLUSIVE](#m-CONFD_RANGE_MIN_EXCLUSIVE)
- [CONFD_RANGE_MIN_INCLUSIVE](#m-CONFD_RANGE_MIN_INCLUSIVE)

**Methods**:

- [getFlags()](#m-getFlags-3c1ca90fd29c)
- [getHigh()](#m-getHigh-92e6b3d5438b)
- [getLow()](#m-getLow-70f61b401781)

## Constructors

### CSTypeRange(ConfObject, ConfObject, int) <a href="#m-CSTypeRange-67ad31ef6a41" id="m-CSTypeRange-67ad31ef6a41"></a>

```java
public CSTypeRange(com.tailf.conf.ConfObject lo, com.tailf.conf.ConfObject hi, int flags)
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)

**Parameters**

- `com.tailf.conf.ConfObject lo`
- `com.tailf.conf.ConfObject hi`
- `int flags`


## Fields

### CONFD_RANGE_MAX_EXCLUSIVE <a href="#m-CONFD_RANGE_MAX_EXCLUSIVE" id="m-CONFD_RANGE_MAX_EXCLUSIVE"></a>

```java
public static final int CONFD_RANGE_MAX_EXCLUSIVE = 8;
```

### CONFD_RANGE_MAX_INCLUSIVE <a href="#m-CONFD_RANGE_MAX_INCLUSIVE" id="m-CONFD_RANGE_MAX_INCLUSIVE"></a>

```java
public static final int CONFD_RANGE_MAX_INCLUSIVE = 4;
```

### CONFD_RANGE_MIN_EXCLUSIVE <a href="#m-CONFD_RANGE_MIN_EXCLUSIVE" id="m-CONFD_RANGE_MIN_EXCLUSIVE"></a>

```java
public static final int CONFD_RANGE_MIN_EXCLUSIVE = 2;
```

### CONFD_RANGE_MIN_INCLUSIVE <a href="#m-CONFD_RANGE_MIN_INCLUSIVE" id="m-CONFD_RANGE_MIN_INCLUSIVE"></a>

```java
public static final int CONFD_RANGE_MIN_INCLUSIVE = 1;
```


## Methods

### getFlags() <a href="#m-getFlags-3c1ca90fd29c" id="m-getFlags-3c1ca90fd29c"></a>

```java
public int getFlags()
```

### getHigh() <a href="#m-getHigh-92e6b3d5438b" id="m-getHigh-92e6b3d5438b"></a>

```java
public com.tailf.conf.ConfObject getHigh()
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)

### getLow() <a href="#m-getLow-70f61b401781" id="m-getLow-70f61b401781"></a>

```java
public com.tailf.conf.ConfObject getLow()
```

Types: [ConfObject](../../conf/ConfObject.md#cls-ConfObject)
