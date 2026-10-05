# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getFractionDigits()](#m-getFractionDigits-57dce19c4ffe)
- [getRanges()](#m-getRanges-c1cd383e54a0)
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

### getFractionDigits() <a href="#m-getFractionDigits-57dce19c4ffe" id="m-getFractionDigits-57dce19c4ffe"></a>

```java
public final byte getFractionDigits()
```

### getRanges() <a href="#m-getRanges-c1cd383e54a0" id="m-getRanges-c1cd383e54a0"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> getRanges()
```

Types: [Reader](../Range/Reader.md#cls-Reader)

### hasRanges() <a href="#m-hasRanges-77bc63fe4ea8" id="m-hasRanges-77bc63fe4ea8"></a>

```java
public final boolean hasRanges()
```
