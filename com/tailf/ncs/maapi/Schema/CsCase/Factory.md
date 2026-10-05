<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsCase.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsCase.Builder,com.tailf.ncs.maapi.Schema.CsCase.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-c95af3b17623)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getChoices()](Builder.md#m-getchoices-818fb3fccb86) from Builder
- [getHns()](Builder.md#m-gethns-457afaf41ae6) from Builder
- [getHtag()](Builder.md#m-gethtag-3a838d71ddf7) from Builder
- [getNodes()](Builder.md#m-getnodes-0d0e9b3adfd1) from Builder
- [hasChoices()](Builder.md#m-haschoices-6534dc5f2f55) from Builder
- [hasNodes()](Builder.md#m-hasnodes-0c3a4b7d62ab) from Builder
- [initChoices(int)](Builder.md#m-initchoices-6d6ca0d6d87e) from Builder
- [initNodes(int)](Builder.md#m-initnodes-ae27813ecc84) from Builder
- [setChoices(Reader<Reader>)](Builder.md#m-setchoices-6c56beb14596) from Builder
- [setHns(int)](Builder.md#m-sethns-7405e78f40fe) from Builder
- [setHtag(int)](Builder.md#m-sethtag-d40f4d76b210) from Builder
- [setNodes(Reader<Reader>)](Builder.md#m-setnodes-1a7a637d61d9) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-c95af3b17623"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsCase.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsCase.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsCase.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
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
public final com.tailf.ncs.maapi.Schema.CsCase.Reader constructReader(
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
