# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder,com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-314d84bae0ea)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getA1()](Builder.md#m-getA1-f8b8009a6bc7) from Builder
- [getA2()](Builder.md#m-getA2-a28d45466763) from Builder
- [getA3()](Builder.md#m-getA3-330abd611894) from Builder
- [getA4()](Builder.md#m-getA4-fce3220b7c51) from Builder
- [getPrefix()](Builder.md#m-getPrefix-9268091e0223) from Builder
- [setA1(byte)](Builder.md#m-setA1-32c52405dfad) from Builder
- [setA2(byte)](Builder.md#m-setA2-303439b65cb0) from Builder
- [setA3(byte)](Builder.md#m-setA3-157e4ab42041) from Builder
- [setA4(byte)](Builder.md#m-setA4-45ac97b7d3a4) from Builder
- [setPrefix(byte)](Builder.md#m-setPrefix-e20c09b64c12) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-314d84bae0ea" id="m-asReader-314d84bae0ea"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader constructReader(
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
