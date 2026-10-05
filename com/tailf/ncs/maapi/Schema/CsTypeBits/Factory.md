<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsTypeBits.Builder,com.tailf.ncs.maapi.Schema.CsTypeBits.Reader>
```

Types: [Builder](Builder.md#s-Builder), [Reader](Reader.md#s-Reader)

## Members

**Constructors**:

- [Factory()](#s-Factory-1)

**Methods**:

- [asReader()](Builder.md#s-asReader) from Builder
- [asReader(Builder)](#s-asReader)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#s-constructBuilder)
- [constructReader(SegmentReader, int, int, int, short, int)](#s-constructReader)
- [getBits()](Builder.md#s-getBits) from Builder
- [getWidth()](Builder.md#s-getWidth) from Builder
- [hasBits()](Builder.md#s-hasBits) from Builder
- [initBits(int)](Builder.md#s-initBits) from Builder
- [setBits(Reader<Reader>)](Builder.md#s-setBits) from Builder
- [setWidth(byte)](Builder.md#s-setWidth) from Builder
- [structSize()](#s-structSize)

## Constructors

<a id="s-Factory-1"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="s-asReader"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsTypeBits.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeBits.Builder builder`

<a id="s-constructBuilder"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#s-Builder)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

<a id="s-constructReader"></a>
### constructReader(SegmentReader, int, int, int, short, int)

```java
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Reader constructReader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

Types: [Reader](Reader.md#s-Reader)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

<a id="s-structSize"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
