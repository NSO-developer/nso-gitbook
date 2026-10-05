# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder,com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory()](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#asreader-cc88ed63c93f)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#constructreader-fbce6f4f912a)
- [getA1()](Builder.md#geta1-f8b8009a6bc7) from Builder
- [getA2()](Builder.md#geta2-a28d45466763) from Builder
- [getA3()](Builder.md#geta3-330abd611894) from Builder
- [getA4()](Builder.md#geta4-fce3220b7c51) from Builder
- [getA5()](Builder.md#geta5-c33c7ae5b8bf) from Builder
- [getA6()](Builder.md#geta6-50491e3e5ce6) from Builder
- [getA7()](Builder.md#geta7-84843d409266) from Builder
- [getA8()](Builder.md#geta8-c03708d8a2bb) from Builder
- [getPrefix()](Builder.md#getprefix-9268091e0223) from Builder
- [setA1(short)](Builder.md#seta1-86087d00f76b) from Builder
- [setA2(short)](Builder.md#seta2-8b4919257927) from Builder
- [setA3(short)](Builder.md#seta3-26923be51f72) from Builder
- [setA4(short)](Builder.md#seta4-cb477f744e5c) from Builder
- [setA5(short)](Builder.md#seta5-79ab4d5ba84f) from Builder
- [setA6(short)](Builder.md#seta6-a49761b267d3) from Builder
- [setA7(short)](Builder.md#seta7-6bbb104d9e3a) from Builder
- [setA8(short)](Builder.md#seta8-7bc7b767c00a) from Builder
- [setPrefix(byte)](Builder.md#setprefix-e20c09b64c12) from Builder
- [structSize()](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-cc88ed63c93f" id="asreader-cc88ed63c93f"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

### constructReader(SegmentReader, int, int, int, short, int) <a href="#constructreader-fbce6f4f912a" id="constructreader-fbce6f4f912a"></a>

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

Types: [Reader](Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

### structSize() <a href="#structsize-1fa68dcadd21" id="structsize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
