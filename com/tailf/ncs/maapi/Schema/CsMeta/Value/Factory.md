# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Value.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder,com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-de6df5863fd3)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getNone()](Builder.md#m-getNone-e31bfdbffa7f) from Builder
- [getText()](Builder.md#m-getText-e63d55fcdcbd) from Builder
- [hasText()](Builder.md#m-hasText-9f49522a4f5a) from Builder
- [initText(int)](Builder.md#m-initText-6175682972e5) from Builder
- [isNone()](Builder.md#m-isNone-e8a993ad0453) from Builder
- [isText()](Builder.md#m-isText-98869fdb86ee) from Builder
- [setNone(Void)](Builder.md#m-setNone-46764db867d5) from Builder
- [setText(Reader)](Builder.md#m-setText-e072baf7bad6) from Builder
- [setText(String)](Builder.md#m-setText-bb5093080571) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)
- [which()](Builder.md#m-which-0b2d23db5ed0) from Builder

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-de6df5863fd3" id="m-asReader-de6df5863fd3"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader constructReader(
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
