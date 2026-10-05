# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.QTag.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getHns()](#m-getHns-457afaf41ae6)
- [getHtag()](#m-getHtag-3a838d71ddf7)

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

### getHns() <a href="#m-getHns-457afaf41ae6" id="m-getHns-457afaf41ae6"></a>

```java
public final int getHns()
```

### getHtag() <a href="#m-getHtag-3a838d71ddf7" id="m-getHtag-3a838d71ddf7"></a>

```java
public final int getHtag()
```
