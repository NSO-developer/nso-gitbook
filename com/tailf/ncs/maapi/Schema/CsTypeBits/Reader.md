# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

- [getBits\(\)](#getbits-032b4694ff31)
- [getWidth\(\)](#getwidth-aff9ccaa8b54)
- [hasBits\(\)](#hasbits-3d091966c9f9)

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

### getBits() <a href="#getbits-032b4694ff31" id="getbits-032b4694ff31"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> getBits()
```

Types: [Reader](Bit/Reader.md#reader-b2467a96ddff)

### getWidth() <a href="#getwidth-aff9ccaa8b54" id="getwidth-aff9ccaa8b54"></a>

```java
public final byte getWidth()
```

### hasBits() <a href="#hasbits-3d091966c9f9" id="hasbits-3d091966c9f9"></a>

```java
public final boolean hasBits()
```
