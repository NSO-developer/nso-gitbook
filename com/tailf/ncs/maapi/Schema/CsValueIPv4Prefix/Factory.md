# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder,com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory()](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#asreader-314d84bae0ea)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#constructreader-fbce6f4f912a)
- [getA1()](Builder.md#geta1-f8b8009a6bc7) from Builder
- [getA2()](Builder.md#geta2-a28d45466763) from Builder
- [getA3()](Builder.md#geta3-330abd611894) from Builder
- [getA4()](Builder.md#geta4-fce3220b7c51) from Builder
- [getPrefix()](Builder.md#getprefix-9268091e0223) from Builder
- [setA1(byte)](Builder.md#seta1-32c52405dfad) from Builder
- [setA2(byte)](Builder.md#seta2-303439b65cb0) from Builder
- [setA3(byte)](Builder.md#seta3-157e4ab42041) from Builder
- [setA4(byte)](Builder.md#seta4-45ac97b7d3a4) from Builder
- [setPrefix(byte)](Builder.md#setprefix-e20c09b64c12) from Builder
- [structSize()](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-314d84bae0ea" id="asreader-314d84bae0ea"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueIPv4Prefix.Reader constructReader(
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
