<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Value.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder,com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-de6df5863fd3)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getNone()](Builder.md#m-getnone-e31bfdbffa7f) from Builder
- [getText()](Builder.md#m-gettext-e63d55fcdcbd) from Builder
- [hasText()](Builder.md#m-hastext-9f49522a4f5a) from Builder
- [initText(int)](Builder.md#m-inittext-6175682972e5) from Builder
- [isNone()](Builder.md#m-isnone-e8a993ad0453) from Builder
- [isText()](Builder.md#m-istext-98869fdb86ee) from Builder
- [setNone(Void)](Builder.md#m-setnone-46764db867d5) from Builder
- [setText(Reader)](Builder.md#m-settext-e072baf7bad6) from Builder
- [setText(String)](Builder.md#m-settext-bb5093080571) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)
- [which()](Builder.md#m-which-0b2d23db5ed0) from Builder

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-de6df5863fd3"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader asReader(
    com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsMeta.Value.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

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

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
