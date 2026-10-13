# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

- [getDisplayHint\(\)](#getdisplayhint-f9cb8b7f487f)
- [hasDisplayHint\(\)](#hasdisplayhint-a0d050b8aab0)

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

### getDisplayHint() <a href="#getdisplayhint-f9cb8b7f487f" id="getdisplayhint-f9cb8b7f487f"></a>

```java
public org.capnproto.Data.Reader getDisplayHint()
```

### hasDisplayHint() <a href="#hasdisplayhint-a0d050b8aab0" id="hasdisplayhint-a0d050b8aab0"></a>

```java
public boolean hasDisplayHint()
```
