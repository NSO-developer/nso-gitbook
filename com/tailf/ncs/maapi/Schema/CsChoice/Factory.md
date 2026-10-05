<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsChoice.Builder,com.tailf.ncs.maapi.Schema.CsChoice.Reader>
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
- [getCases()](Builder.md#s-getCases) from Builder
- [getDefCase()](Builder.md#s-getDefCase) from Builder
- [getHns()](Builder.md#s-getHns) from Builder
- [getHtag()](Builder.md#s-getHtag) from Builder
- [getMinOccurs()](Builder.md#s-getMinOccurs) from Builder
- [hasCases()](Builder.md#s-hasCases) from Builder
- [initCases(int)](Builder.md#s-initCases) from Builder
- [initDefCase()](Builder.md#s-initDefCase) from Builder
- [setCases(Reader<Reader>)](Builder.md#s-setCases) from Builder
- [setDefCase(Reader)](Builder.md#s-setDefCase) from Builder
- [setHns(int)](Builder.md#s-setHns) from Builder
- [setHtag(int)](Builder.md#s-setHtag) from Builder
- [setMinOccurs(int)](Builder.md#s-setMinOccurs) from Builder
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
public final com.tailf.ncs.maapi.Schema.CsChoice.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsChoice.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsChoice.Builder builder`

<a id="s-constructBuilder"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.CsChoice.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsChoice.Reader constructReader(
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
