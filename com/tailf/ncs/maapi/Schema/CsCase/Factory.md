<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsCase.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsCase.Builder,com.tailf.ncs.maapi.Schema.CsCase.Reader>
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
- [getChoices()](Builder.md#s-getChoices) from Builder
- [getHns()](Builder.md#s-getHns) from Builder
- [getHtag()](Builder.md#s-getHtag) from Builder
- [getNodes()](Builder.md#s-getNodes) from Builder
- [hasChoices()](Builder.md#s-hasChoices) from Builder
- [hasNodes()](Builder.md#s-hasNodes) from Builder
- [initChoices(int)](Builder.md#s-initChoices) from Builder
- [initNodes(int)](Builder.md#s-initNodes) from Builder
- [setChoices(Reader<Reader>)](Builder.md#s-setChoices) from Builder
- [setHns(int)](Builder.md#s-setHns) from Builder
- [setHtag(int)](Builder.md#s-setHtag) from Builder
- [setNodes(Reader<Reader>)](Builder.md#s-setNodes) from Builder
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
public final com.tailf.ncs.maapi.Schema.CsCase.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsCase.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsCase.Builder builder`

<a id="s-constructBuilder"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.CsCase.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsCase.Reader constructReader(
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
