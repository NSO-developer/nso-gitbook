<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.NsInfo.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.NsInfo.Builder,com.tailf.ncs.maapi.Schema.NsInfo.Reader>
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
- [getModule()](Builder.md#s-getModule) from Builder
- [getNshash()](Builder.md#s-getNshash) from Builder
- [getPrefix()](Builder.md#s-getPrefix) from Builder
- [getRevision()](Builder.md#s-getRevision) from Builder
- [getRootNodes()](Builder.md#s-getRootNodes) from Builder
- [getTypes()](Builder.md#s-getTypes) from Builder
- [getUri()](Builder.md#s-getUri) from Builder
- [hasModule()](Builder.md#s-hasModule) from Builder
- [hasPrefix()](Builder.md#s-hasPrefix) from Builder
- [hasRevision()](Builder.md#s-hasRevision) from Builder
- [hasRootNodes()](Builder.md#s-hasRootNodes) from Builder
- [hasTypes()](Builder.md#s-hasTypes) from Builder
- [hasUri()](Builder.md#s-hasUri) from Builder
- [initModule(int)](Builder.md#s-initModule) from Builder
- [initPrefix(int)](Builder.md#s-initPrefix) from Builder
- [initRevision(int)](Builder.md#s-initRevision) from Builder
- [initRootNodes(int)](Builder.md#s-initRootNodes) from Builder
- [initTypes(int)](Builder.md#s-initTypes) from Builder
- [initUri(int)](Builder.md#s-initUri) from Builder
- [setModule(Reader)](Builder.md#s-setModule) from Builder
- [setModule(String)](Builder.md#s-setModule-1) from Builder
- [setNshash(int)](Builder.md#s-setNshash) from Builder
- [setPrefix(Reader)](Builder.md#s-setPrefix) from Builder
- [setPrefix(String)](Builder.md#s-setPrefix-1) from Builder
- [setRevision(Reader)](Builder.md#s-setRevision) from Builder
- [setRevision(String)](Builder.md#s-setRevision-1) from Builder
- [setRootNodes(Reader<Reader>)](Builder.md#s-setRootNodes) from Builder
- [setTypes(Reader<Reader>)](Builder.md#s-setTypes) from Builder
- [setUri(Reader)](Builder.md#s-setUri) from Builder
- [setUri(String)](Builder.md#s-setUri-1) from Builder
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
public final com.tailf.ncs.maapi.Schema.NsInfo.Reader asReader(
    com.tailf.ncs.maapi.Schema.NsInfo.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.NsInfo.Builder builder`

<a id="s-constructBuilder"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.NsInfo.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.NsInfo.Reader constructReader(
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
