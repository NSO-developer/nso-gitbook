<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDQuad.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder,com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-abbd59648836)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getD1()](Builder.md#m-getd1-1ccbbca0d18f) from Builder
- [getD2()](Builder.md#m-getd2-93b8c43fe331) from Builder
- [getD3()](Builder.md#m-getd3-1982f3560cd6) from Builder
- [getD4()](Builder.md#m-getd4-a7608deae360) from Builder
- [setD1(byte)](Builder.md#m-setd1-123e1073562a) from Builder
- [setD2(byte)](Builder.md#m-setd2-7e3edbd83eb9) from Builder
- [setD3(byte)](Builder.md#m-setd3-304a3b391ac1) from Builder
- [setD4(byte)](Builder.md#m-setd4-fad28190aa51) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-abbd59648836"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValueDQuad.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
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
public final com.tailf.ncs.maapi.Schema.CsValueDQuad.Reader constructReader(
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
