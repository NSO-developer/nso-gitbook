# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDuration.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getDays()](#getdays-046356f0d5f0)
- [getHours()](#gethours-3fa193b38793)
- [getMicros()](#getmicros-062944cf4511)
- [getMins()](#getmins-c1eeffb194a4)
- [getMonths()](#getmonths-980c2a29d103)
- [getSecs()](#getsecs-460472c1be09)
- [getYears()](#getyears-04cc2ca752eb)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#reader-cf5e962c3323" id="reader-cf5e962c3323"></a>

**Package-private**

```java
Reader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`


## Methods

### getDays() <a href="#getdays-046356f0d5f0" id="getdays-046356f0d5f0"></a>

```java
public final int getDays()
```

### getHours() <a href="#gethours-3fa193b38793" id="gethours-3fa193b38793"></a>

```java
public final int getHours()
```

### getMicros() <a href="#getmicros-062944cf4511" id="getmicros-062944cf4511"></a>

```java
public final int getMicros()
```

### getMins() <a href="#getmins-c1eeffb194a4" id="getmins-c1eeffb194a4"></a>

```java
public final int getMins()
```

### getMonths() <a href="#getmonths-980c2a29d103" id="getmonths-980c2a29d103"></a>

```java
public final int getMonths()
```

### getSecs() <a href="#getsecs-460472c1be09" id="getsecs-460472c1be09"></a>

```java
public final int getSecs()
```

### getYears() <a href="#getyears-04cc2ca752eb" id="getyears-04cc2ca752eb"></a>

```java
public final int getYears()
```
