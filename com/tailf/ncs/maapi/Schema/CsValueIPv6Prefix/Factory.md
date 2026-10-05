<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder,com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader>
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
- [getA1()](Builder.md#s-getA1) from Builder
- [getA2()](Builder.md#s-getA2) from Builder
- [getA3()](Builder.md#s-getA3) from Builder
- [getA4()](Builder.md#s-getA4) from Builder
- [getA5()](Builder.md#s-getA5) from Builder
- [getA6()](Builder.md#s-getA6) from Builder
- [getA7()](Builder.md#s-getA7) from Builder
- [getA8()](Builder.md#s-getA8) from Builder
- [getPrefix()](Builder.md#s-getPrefix) from Builder
- [setA1(short)](Builder.md#s-setA1) from Builder
- [setA2(short)](Builder.md#s-setA2) from Builder
- [setA3(short)](Builder.md#s-setA3) from Builder
- [setA4(short)](Builder.md#s-setA4) from Builder
- [setA5(short)](Builder.md#s-setA5) from Builder
- [setA6(short)](Builder.md#s-setA6) from Builder
- [setA7(short)](Builder.md#s-setA7) from Builder
- [setA8(short)](Builder.md#s-setA8) from Builder
- [setPrefix(byte)](Builder.md#s-setPrefix) from Builder
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
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Builder builder`

<a id="s-constructBuilder"></a>
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
public final com.tailf.ncs.maapi.Schema.CsValueIPv6Prefix.Reader constructReader(
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
