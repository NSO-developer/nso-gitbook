<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapEntry.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder,com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader>
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
- [getModname()](Builder.md#s-getModname) from Builder
- [getNs()](Builder.md#s-getNs) from Builder
- [getNsHash()](Builder.md#s-getNsHash) from Builder
- [getPrefix()](Builder.md#s-getPrefix) from Builder
- [getXmlns()](Builder.md#s-getXmlns) from Builder
- [hasModname()](Builder.md#s-hasModname) from Builder
- [hasNs()](Builder.md#s-hasNs) from Builder
- [hasPrefix()](Builder.md#s-hasPrefix) from Builder
- [hasXmlns()](Builder.md#s-hasXmlns) from Builder
- [initModname(int)](Builder.md#s-initModname) from Builder
- [initNs(int)](Builder.md#s-initNs) from Builder
- [initPrefix(int)](Builder.md#s-initPrefix) from Builder
- [initXmlns(int)](Builder.md#s-initXmlns) from Builder
- [setModname(Reader)](Builder.md#s-setModname) from Builder
- [setModname(String)](Builder.md#s-setModname-1) from Builder
- [setNs(Reader)](Builder.md#s-setNs) from Builder
- [setNs(String)](Builder.md#s-setNs-1) from Builder
- [setNsHash(int)](Builder.md#s-setNsHash) from Builder
- [setPrefix(Reader)](Builder.md#s-setPrefix) from Builder
- [setPrefix(String)](Builder.md#s-setPrefix-1) from Builder
- [setXmlns(Reader)](Builder.md#s-setXmlns) from Builder
- [setXmlns(String)](Builder.md#s-setXmlns-1) from Builder
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
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader asReader(
    com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder builder`

<a id="s-constructBuilder"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder constructBuilder(
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
public final com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader constructReader(
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
