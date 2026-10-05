<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder,com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-cc88ed63c93f)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getA1()](Builder.md#m-geta1-f8b8009a6bc7) from Builder
- [getA2()](Builder.md#m-geta2-a28d45466763) from Builder
- [getA3()](Builder.md#m-geta3-330abd611894) from Builder
- [getA4()](Builder.md#m-geta4-fce3220b7c51) from Builder
- [getA5()](Builder.md#m-geta5-c33c7ae5b8bf) from Builder
- [getA6()](Builder.md#m-geta6-50491e3e5ce6) from Builder
- [getA7()](Builder.md#m-geta7-84843d409266) from Builder
- [getA8()](Builder.md#m-geta8-c03708d8a2bb) from Builder
- [getPrefix()](Builder.md#m-getprefix-9268091e0223) from Builder
- [setA1(short)](Builder.md#m-seta1-86087d00f76b) from Builder
- [setA2(short)](Builder.md#m-seta2-8b4919257927) from Builder
- [setA3(short)](Builder.md#m-seta3-26923be51f72) from Builder
- [setA4(short)](Builder.md#m-seta4-cb477f744e5c) from Builder
- [setA5(short)](Builder.md#m-seta5-79ab4d5ba84f) from Builder
- [setA6(short)](Builder.md#m-seta6-a49761b267d3) from Builder
- [setA7(short)](Builder.md#m-seta7-6bbb104d9e3a) from Builder
- [setA8(short)](Builder.md#m-seta8-7bc7b767c00a) from Builder
- [setPrefix(byte)](Builder.md#m-setprefix-e20c09b64c12) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-cc88ed63c93f"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

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

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
