# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.MountPoint.Builder,com.tailf.ncs.maapi.Schema.MountPoint.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-82fffbec489c)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getEntries()](Builder.md#m-getEntries-f554b7f62e3d) from Builder
- [getNsHash()](Builder.md#m-getNsHash-f6f3e3ae1e6b) from Builder
- [getPath()](Builder.md#m-getPath-88fb21895561) from Builder
- [getPathHash()](Builder.md#m-getPathHash-14d7d9222b28) from Builder
- [hasEntries()](Builder.md#m-hasEntries-ccf5edf194a9) from Builder
- [hasPath()](Builder.md#m-hasPath-c0f486b47df7) from Builder
- [initEntries(int)](Builder.md#m-initEntries-f2a53bc0911b) from Builder
- [initPath(int)](Builder.md#m-initPath-efcaee2c9a10) from Builder
- [setEntries(Reader<Reader>)](Builder.md#m-setEntries-65d42e9eb737) from Builder
- [setNsHash(int)](Builder.md#m-setNsHash-856e3c88b24a) from Builder
- [setPath(Reader<Reader>)](Builder.md#m-setPath-3ceb96b4eeae) from Builder
- [setPathHash(int)](Builder.md#m-setPathHash-5447341695d9) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-82fffbec489c" id="m-asReader-82fffbec489c"></a>

```java
public final com.tailf.ncs.maapi.Schema.MountPoint.Reader asReader(
    com.tailf.ncs.maapi.Schema.MountPoint.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.MountPoint.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

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

### constructReader(SegmentReader, int, int, int, short, int) <a href="#m-constructReader-fbce6f4f912a" id="m-constructReader-fbce6f4f912a"></a>

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

### structSize() <a href="#m-structSize-1fa68dcadd21" id="m-structSize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
