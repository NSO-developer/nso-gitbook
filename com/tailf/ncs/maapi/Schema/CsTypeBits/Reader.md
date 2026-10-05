# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getBits()](#m-getBits-032b4694ff31)
- [getWidth()](#m-getWidth-aff9ccaa8b54)
- [hasBits()](#m-hasBits-3d091966c9f9)

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

### getBits() <a href="#m-getBits-032b4694ff31" id="m-getBits-032b4694ff31"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> getBits()
```

Types: [Reader](Bit/Reader.md#cls-Reader)

### getWidth() <a href="#m-getWidth-aff9ccaa8b54" id="m-getWidth-aff9ccaa8b54"></a>

```java
public final byte getWidth()
```

### hasBits() <a href="#m-hasBits-3d091966c9f9" id="m-hasBits-3d091966c9f9"></a>

```java
public final boolean hasBits()
```
