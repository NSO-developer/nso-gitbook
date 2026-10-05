<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getBits()](#s-getBits)
- [getWidth()](#s-getWidth)
- [hasBits()](#s-hasBits)

## Constructors

<a id="s-Reader-1"></a>
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

<a id="s-getBits"></a>
### getBits()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> getBits()
```

Types: [Reader](Bit/Reader.md#s-Reader)

<a id="s-getWidth"></a>
### getWidth()

```java
public final byte getWidth()
```

<a id="s-hasBits"></a>
### hasBits()

```java
public final boolean hasBits()
```
