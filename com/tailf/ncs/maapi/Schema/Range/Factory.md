<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.Range.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.Range.Builder,com.tailf.ncs.maapi.Schema.Range.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-3696e26ad968)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getFlags()](Builder.md#m-getflags-3c1ca90fd29c) from Builder
- [getHi()](Builder.md#m-gethi-f8fa4dcfe431) from Builder
- [getLo()](Builder.md#m-getlo-bfe1c987d87a) from Builder
- [initHi()](Builder.md#m-inithi-2c3dde583bd6) from Builder
- [initLo()](Builder.md#m-initlo-62ec30618451) from Builder
- [setFlags(byte)](Builder.md#m-setflags-920848b8d655) from Builder
- [setHi(Reader)](Builder.md#m-sethi-550fb8729c56) from Builder
- [setLo(Reader)](Builder.md#m-setlo-584c3fb11cf5) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-3696e26ad968"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.Range.Reader asReader(
    com.tailf.ncs.maapi.Schema.Range.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Range.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

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

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
