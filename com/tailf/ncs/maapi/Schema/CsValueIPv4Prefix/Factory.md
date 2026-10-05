<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder,com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-314d84bae0ea)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getA1()](Builder.md#m-geta1-f8b8009a6bc7) from Builder
- [getA2()](Builder.md#m-geta2-a28d45466763) from Builder
- [getA3()](Builder.md#m-geta3-330abd611894) from Builder
- [getA4()](Builder.md#m-geta4-fce3220b7c51) from Builder
- [getPrefix()](Builder.md#m-getprefix-9268091e0223) from Builder
- [setA1(byte)](Builder.md#m-seta1-32c52405dfad) from Builder
- [setA2(byte)](Builder.md#m-seta2-303439b65cb0) from Builder
- [setA3(byte)](Builder.md#m-seta3-157e4ab42041) from Builder
- [setA4(byte)](Builder.md#m-seta4-45ac97b7d3a4) from Builder
- [setPrefix(byte)](Builder.md#m-setprefix-e20c09b64c12) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-314d84bae0ea"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

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

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
