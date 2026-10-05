# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Range.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.Range.Builder,com.tailf.ncs.maapi.Schema.Range.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-3696e26ad968)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getFlags()](Builder.md#m-getFlags-3c1ca90fd29c) from Builder
- [getHi()](Builder.md#m-getHi-f8fa4dcfe431) from Builder
- [getLo()](Builder.md#m-getLo-bfe1c987d87a) from Builder
- [initHi()](Builder.md#m-initHi-2c3dde583bd6) from Builder
- [initLo()](Builder.md#m-initLo-62ec30618451) from Builder
- [setFlags(byte)](Builder.md#m-setFlags-920848b8d655) from Builder
- [setHi(Reader)](Builder.md#m-setHi-550fb8729c56) from Builder
- [setLo(Reader)](Builder.md#m-setLo-584c3fb11cf5) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-3696e26ad968" id="m-asReader-3696e26ad968"></a>

```java
public final com.tailf.ncs.maapi.Schema.Range.Reader asReader(
    com.tailf.ncs.maapi.Schema.Range.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Range.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.Range.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#cls-Builder)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

### constructReader(SegmentReader, int, int, int, short, int) <a href="#m-constructReader-fbce6f4f912a" id="m-constructReader-fbce6f4f912a"></a>

```java
public final com.tailf.ncs.maapi.Schema.Range.Reader constructReader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

### structSize() <a href="#m-structSize-1fa68dcadd21" id="m-structSize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
