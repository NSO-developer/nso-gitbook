# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeString.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsTypeString.Builder,com.tailf.ncs.maapi.Schema.CsTypeString.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-72d454c9d11f)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getInvertMatch()](Builder.md#m-getInvertMatch-323126ccbf2f) from Builder
- [getPattern()](Builder.md#m-getPattern-b471c55bbd3b) from Builder
- [getRanges()](Builder.md#m-getRanges-c1cd383e54a0) from Builder
- [hasPattern()](Builder.md#m-hasPattern-e3fe48944019) from Builder
- [hasRanges()](Builder.md#m-hasRanges-77bc63fe4ea8) from Builder
- [initPattern(int)](Builder.md#m-initPattern-6928d503a051) from Builder
- [initRanges(int)](Builder.md#m-initRanges-d04c09762bd6) from Builder
- [setInvertMatch(boolean)](Builder.md#m-setInvertMatch-e00cbbce7115) from Builder
- [setPattern(Reader)](Builder.md#m-setPattern-e1a344734fbf) from Builder
- [setPattern(String)](Builder.md#m-setPattern-15104080a7b1) from Builder
- [setRanges(Reader<Reader>)](Builder.md#m-setRanges-69bbcdb47f71) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-72d454c9d11f" id="m-asReader-72d454c9d11f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsTypeString.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsTypeString.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsTypeString.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsTypeString.Reader constructReader(
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
