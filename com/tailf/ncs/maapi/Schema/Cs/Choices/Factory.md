<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Choices.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.Cs.Choices.Builder,com.tailf.ncs.maapi.Schema.Cs.Choices.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-4adc31133354)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getList()](Builder.md#m-getlist-bb3f8cbe83be) from Builder
- [getNone()](Builder.md#m-getnone-e31bfdbffa7f) from Builder
- [hasList()](Builder.md#m-haslist-3712d7ce73ac) from Builder
- [initList(int)](Builder.md#m-initlist-619d59db076f) from Builder
- [isList()](Builder.md#m-islist-c36bce63b506) from Builder
- [isNone()](Builder.md#m-isnone-e8a993ad0453) from Builder
- [setList(Reader<Reader>)](Builder.md#m-setlist-fb6135ecf56c) from Builder
- [setNone(Void)](Builder.md#m-setnone-46764db867d5) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)
- [which()](Builder.md#m-which-0b2d23db5ed0) from Builder

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-4adc31133354"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Reader asReader(
    com.tailf.ncs.maapi.Schema.Cs.Choices.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cs.Choices.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
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
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Reader constructReader(
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
