<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getDisplayHint()](#m-getdisplayhint-f9cb8b7f487f)
- [hasDisplayHint()](#m-hasdisplayhint-a0d050b8aab0)

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

<a id="m-getdisplayhint-f9cb8b7f487f"></a>
### getDisplayHint()

```java
public org.capnproto.Data.Reader getDisplayHint()
```

<a id="m-hasdisplayhint-a0d050b8aab0"></a>
### hasDisplayHint()

```java
public boolean hasDisplayHint()
```
