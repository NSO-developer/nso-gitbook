# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getDisplayHint()](#m-getDisplayHint-f9cb8b7f487f)
- [hasDisplayHint()](#m-hasDisplayHint-a0d050b8aab0)

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

### getDisplayHint() <a href="#m-getDisplayHint-f9cb8b7f487f" id="m-getDisplayHint-f9cb8b7f487f"></a>

```java
public org.capnproto.Data.Reader getDisplayHint()
```

### hasDisplayHint() <a href="#m-hasDisplayHint-a0d050b8aab0" id="m-hasDisplayHint-a0d050b8aab0"></a>

```java
public boolean hasDisplayHint()
```
