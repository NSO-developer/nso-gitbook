<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getBits()](#m-getbits-032b4694ff31)
- [getWidth()](#m-getwidth-aff9ccaa8b54)
- [hasBits()](#m-hasbits-3d091966c9f9)

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

<a id="m-getbits-032b4694ff31"></a>
### getBits()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> getBits()
```

Types: [Reader](Bit/Reader.md#cls-Reader)

<a id="m-getwidth-aff9ccaa8b54"></a>
### getWidth()

```java
public final byte getWidth()
```

<a id="m-hasbits-3d091966c9f9"></a>
### hasBits()

```java
public final boolean hasBits()
```
