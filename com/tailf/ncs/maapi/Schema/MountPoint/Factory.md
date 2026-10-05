<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.MountPoint.Builder,com.tailf.ncs.maapi.Schema.MountPoint.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-82fffbec489c)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getEntries()](Builder.md#m-getentries-f554b7f62e3d) from Builder
- [getNsHash()](Builder.md#m-getnshash-f6f3e3ae1e6b) from Builder
- [getPath()](Builder.md#m-getpath-88fb21895561) from Builder
- [getPathHash()](Builder.md#m-getpathhash-14d7d9222b28) from Builder
- [hasEntries()](Builder.md#m-hasentries-ccf5edf194a9) from Builder
- [hasPath()](Builder.md#m-haspath-c0f486b47df7) from Builder
- [initEntries(int)](Builder.md#m-initentries-f2a53bc0911b) from Builder
- [initPath(int)](Builder.md#m-initpath-efcaee2c9a10) from Builder
- [setEntries(Reader<Reader>)](Builder.md#m-setentries-65d42e9eb737) from Builder
- [setNsHash(int)](Builder.md#m-setnshash-856e3c88b24a) from Builder
- [setPath(Reader<Reader>)](Builder.md#m-setpath-3ceb96b4eeae) from Builder
- [setPathHash(int)](Builder.md#m-setpathhash-5447341695d9) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-82fffbec489c"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.MountPoint.Reader asReader(
    com.tailf.ncs.maapi.Schema.MountPoint.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.MountPoint.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
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
public final com.tailf.ncs.maapi.Schema.MountPoint.Reader constructReader(
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
