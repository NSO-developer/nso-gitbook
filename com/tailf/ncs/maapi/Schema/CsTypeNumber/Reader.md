<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getRanges()](#m-getranges-c1cd383e54a0)
- [hasRanges()](#m-hasranges-77bc63fe4ea8)

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

<a id="m-getranges-c1cd383e54a0"></a>
### getRanges()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> getRanges()
```

Types: [Reader](../Range/Reader.md#cls-Reader)

<a id="m-hasranges-77bc63fe4ea8"></a>
### hasRanges()

```java
public final boolean hasRanges()
```
