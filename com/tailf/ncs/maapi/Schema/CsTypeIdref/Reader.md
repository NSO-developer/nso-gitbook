# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getRefs()](#m-getRefs-b06b91bf4474)
- [hasRefs()](#m-hasRefs-1092d9d8bb51)

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

### getRefs() <a href="#m-getRefs-b06b91bf4474" id="m-getRefs-b06b91bf4474"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader> getRefs()
```

Types: [Reader](Ref/Reader.md#cls-Reader)

### hasRefs() <a href="#m-hasRefs-1092d9d8bb51" id="m-hasRefs-1092d9d8bb51"></a>

```java
public final boolean hasRefs()
```
