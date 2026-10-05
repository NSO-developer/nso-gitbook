<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.MountPoint.Builder,com.tailf.ncs.maapi.Schema.MountPoint.Reader>
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
- [getEntries()](Builder.md#s-getEntries) from Builder
- [getNsHash()](Builder.md#s-getNsHash) from Builder
- [getPath()](Builder.md#s-getPath) from Builder
- [getPathHash()](Builder.md#s-getPathHash) from Builder
- [hasEntries()](Builder.md#s-hasEntries) from Builder
- [hasPath()](Builder.md#s-hasPath) from Builder
- [initEntries(int)](Builder.md#s-initEntries) from Builder
- [initPath(int)](Builder.md#s-initPath) from Builder
- [setEntries(Reader<Reader>)](Builder.md#s-setEntries) from Builder
- [setNsHash(int)](Builder.md#s-setNsHash) from Builder
- [setPath(Reader<Reader>)](Builder.md#s-setPath) from Builder
- [setPathHash(int)](Builder.md#s-setPathHash) from Builder
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
public final com.tailf.ncs.maapi.Schema.MountPoint.Reader asReader(
    com.tailf.ncs.maapi.Schema.MountPoint.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.MountPoint.Builder builder`

<a id="s-constructBuilder"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.MountPoint.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.MountPoint.Reader constructReader(
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
