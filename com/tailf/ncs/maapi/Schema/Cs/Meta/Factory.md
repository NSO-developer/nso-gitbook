# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Meta.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.Cs.Meta.Builder,com.tailf.ncs.maapi.Schema.Cs.Meta.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-1ca430c3c281)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getList()](Builder.md#m-getList-bb3f8cbe83be) from Builder
- [getNone()](Builder.md#m-getNone-e31bfdbffa7f) from Builder
- [hasList()](Builder.md#m-hasList-3712d7ce73ac) from Builder
- [initList(int)](Builder.md#m-initList-619d59db076f) from Builder
- [isList()](Builder.md#m-isList-c36bce63b506) from Builder
- [isNone()](Builder.md#m-isNone-e8a993ad0453) from Builder
- [setList(Reader<Reader>)](Builder.md#m-setList-a943e0056004) from Builder
- [setNone(Void)](Builder.md#m-setNone-46764db867d5) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)
- [which()](Builder.md#m-which-0b2d23db5ed0) from Builder

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-1ca430c3c281" id="m-asReader-1ca430c3c281"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Reader asReader(
    com.tailf.ncs.maapi.Schema.Cs.Meta.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cs.Meta.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Builder constructBuilder(
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

### constructReader(SegmentReader, int, int, int, short, int) <a href="#m-constructReader-fbce6f4f912a" id="m-constructReader-fbce6f4f912a"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Reader constructReader(
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

### structSize() <a href="#m-structSize-1fa68dcadd21" id="m-structSize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
