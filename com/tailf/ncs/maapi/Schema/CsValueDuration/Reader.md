<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDuration.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getDays()](#m-getdays-046356f0d5f0)
- [getHours()](#m-gethours-3fa193b38793)
- [getMicros()](#m-getmicros-062944cf4511)
- [getMins()](#m-getmins-c1eeffb194a4)
- [getMonths()](#m-getmonths-980c2a29d103)
- [getSecs()](#m-getsecs-460472c1be09)
- [getYears()](#m-getyears-04cc2ca752eb)

## Constructors

<a id="m-reader-cf5e962c3323"></a>
### Reader(SegmentReader, int, int, int, short, int)

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

<a id="m-getdays-046356f0d5f0"></a>
### getDays()

```java
public final int getDays()
```

<a id="m-gethours-3fa193b38793"></a>
### getHours()

```java
public final int getHours()
```

<a id="m-getmicros-062944cf4511"></a>
### getMicros()

```java
public final int getMicros()
```

<a id="m-getmins-c1eeffb194a4"></a>
### getMins()

```java
public final int getMins()
```

<a id="m-getmonths-980c2a29d103"></a>
### getMonths()

```java
public final int getMonths()
```

<a id="m-getsecs-460472c1be09"></a>
### getSecs()

```java
public final int getSecs()
```

<a id="m-getyears-04cc2ca752eb"></a>
### getYears()

```java
public final int getYears()
```
