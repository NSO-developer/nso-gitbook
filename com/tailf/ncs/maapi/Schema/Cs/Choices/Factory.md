<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Choices.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.Cs.Choices.Builder,com.tailf.ncs.maapi.Schema.Cs.Choices.Reader>
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
- [getList()](Builder.md#s-getList) from Builder
- [getNone()](Builder.md#s-getNone) from Builder
- [hasList()](Builder.md#s-hasList) from Builder
- [initList(int)](Builder.md#s-initList) from Builder
- [isList()](Builder.md#s-isList) from Builder
- [isNone()](Builder.md#s-isNone) from Builder
- [setList(Reader<Reader>)](Builder.md#s-setList) from Builder
- [setNone(Void)](Builder.md#s-setNone) from Builder
- [structSize()](#s-structSize)
- [which()](Builder.md#s-which) from Builder

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
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Reader asReader(
    com.tailf.ncs.maapi.Schema.Cs.Choices.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cs.Choices.Builder builder`

<a id="s-constructBuilder"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Reader constructReader(
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
