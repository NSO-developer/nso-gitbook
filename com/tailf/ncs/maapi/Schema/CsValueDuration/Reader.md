# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDuration.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getDays()](#m-getDays-046356f0d5f0)
- [getHours()](#m-getHours-3fa193b38793)
- [getMicros()](#m-getMicros-062944cf4511)
- [getMins()](#m-getMins-c1eeffb194a4)
- [getMonths()](#m-getMonths-980c2a29d103)
- [getSecs()](#m-getSecs-460472c1be09)
- [getYears()](#m-getYears-04cc2ca752eb)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#m-Reader-cf5e962c3323" id="m-Reader-cf5e962c3323"></a>

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

### getDays() <a href="#m-getDays-046356f0d5f0" id="m-getDays-046356f0d5f0"></a>

```java
public final int getDays()
```

### getHours() <a href="#m-getHours-3fa193b38793" id="m-getHours-3fa193b38793"></a>

```java
public final int getHours()
```

### getMicros() <a href="#m-getMicros-062944cf4511" id="m-getMicros-062944cf4511"></a>

```java
public final int getMicros()
```

### getMins() <a href="#m-getMins-c1eeffb194a4" id="m-getMins-c1eeffb194a4"></a>

```java
public final int getMins()
```

### getMonths() <a href="#m-getMonths-980c2a29d103" id="m-getMonths-980c2a29d103"></a>

```java
public final int getMonths()
```

### getSecs() <a href="#m-getSecs-460472c1be09" id="m-getSecs-460472c1be09"></a>

```java
public final int getSecs()
```

### getYears() <a href="#m-getYears-04cc2ca752eb" id="m-getYears-04cc2ca752eb"></a>

```java
public final int getYears()
```
