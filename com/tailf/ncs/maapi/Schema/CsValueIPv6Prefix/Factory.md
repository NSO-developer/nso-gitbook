# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder,com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-cc88ed63c93f)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getA1()](Builder.md#m-getA1-f8b8009a6bc7) from Builder
- [getA2()](Builder.md#m-getA2-a28d45466763) from Builder
- [getA3()](Builder.md#m-getA3-330abd611894) from Builder
- [getA4()](Builder.md#m-getA4-fce3220b7c51) from Builder
- [getA5()](Builder.md#m-getA5-c33c7ae5b8bf) from Builder
- [getA6()](Builder.md#m-getA6-50491e3e5ce6) from Builder
- [getA7()](Builder.md#m-getA7-84843d409266) from Builder
- [getA8()](Builder.md#m-getA8-c03708d8a2bb) from Builder
- [getPrefix()](Builder.md#m-getPrefix-9268091e0223) from Builder
- [setA1(short)](Builder.md#m-setA1-86087d00f76b) from Builder
- [setA2(short)](Builder.md#m-setA2-8b4919257927) from Builder
- [setA3(short)](Builder.md#m-setA3-26923be51f72) from Builder
- [setA4(short)](Builder.md#m-setA4-cb477f744e5c) from Builder
- [setA5(short)](Builder.md#m-setA5-79ab4d5ba84f) from Builder
- [setA6(short)](Builder.md#m-setA6-a49761b267d3) from Builder
- [setA7(short)](Builder.md#m-setA7-6bbb104d9e3a) from Builder
- [setA8(short)](Builder.md#m-setA8-7bc7b767c00a) from Builder
- [setPrefix(byte)](Builder.md#m-setPrefix-e20c09b64c12) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-cc88ed63c93f" id="m-asReader-cc88ed63c93f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader constructReader(
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
