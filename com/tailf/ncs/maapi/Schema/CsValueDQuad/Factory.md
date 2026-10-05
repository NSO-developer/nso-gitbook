<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDQuad.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder,com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader>
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
- [getD1()](Builder.md#s-getD1) from Builder
- [getD2()](Builder.md#s-getD2) from Builder
- [getD3()](Builder.md#s-getD3) from Builder
- [getD4()](Builder.md#s-getD4) from Builder
- [setD1(byte)](Builder.md#s-setD1) from Builder
- [setD2(byte)](Builder.md#s-setD2) from Builder
- [setD3(byte)](Builder.md#s-setD3) from Builder
- [setD4(byte)](Builder.md#s-setD4) from Builder
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
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder builder`

<a id="s-constructBuilder"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader constructReader(
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
