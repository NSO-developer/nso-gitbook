<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeIdref.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getRefs()](#m-getrefs-b06b91bf4474)
- [hasRefs()](#m-hasrefs-1092d9d8bb51)

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

<a id="m-getrefs-b06b91bf4474"></a>
### getRefs()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeIdref.Ref.Reader> getRefs()
```

Types: [Reader](Ref/Reader.md#cls-Reader)

<a id="m-hasrefs-1092d9d8bb51"></a>
### hasRefs()

```java
public final boolean hasRefs()
```
