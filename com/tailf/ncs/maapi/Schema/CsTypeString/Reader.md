# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeString.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getInvertMatch()](#m-getInvertMatch-323126ccbf2f)
- [getPattern()](#m-getPattern-b471c55bbd3b)
- [getRanges()](#m-getRanges-c1cd383e54a0)
- [hasPattern()](#m-hasPattern-e3fe48944019)
- [hasRanges()](#m-hasRanges-77bc63fe4ea8)

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

### getInvertMatch() <a href="#m-getInvertMatch-323126ccbf2f" id="m-getInvertMatch-323126ccbf2f"></a>

```java
public final boolean getInvertMatch()
```

### getPattern() <a href="#m-getPattern-b471c55bbd3b" id="m-getPattern-b471c55bbd3b"></a>

```java
public org.capnproto.Text.Reader getPattern()
```

### getRanges() <a href="#m-getRanges-c1cd383e54a0" id="m-getRanges-c1cd383e54a0"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> getRanges()
```

Types: [Reader](../Range/Reader.md#cls-Reader)

### hasPattern() <a href="#m-hasPattern-e3fe48944019" id="m-hasPattern-e3fe48944019"></a>

```java
public boolean hasPattern()
```

### hasRanges() <a href="#m-hasRanges-77bc63fe4ea8" id="m-hasRanges-77bc63fe4ea8"></a>

```java
public final boolean hasRanges()
```
