# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.MountPoint.Builder,com.tailf.ncs.maapi.Schema.MountPoint.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory()](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#asreader-82fffbec489c)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#constructreader-fbce6f4f912a)
- [getEntries()](Builder.md#getentries-f554b7f62e3d) from Builder
- [getNsHash()](Builder.md#getnshash-f6f3e3ae1e6b) from Builder
- [getPath()](Builder.md#getpath-88fb21895561) from Builder
- [getPathHash()](Builder.md#getpathhash-14d7d9222b28) from Builder
- [hasEntries()](Builder.md#hasentries-ccf5edf194a9) from Builder
- [hasPath()](Builder.md#haspath-c0f486b47df7) from Builder
- [initEntries(int)](Builder.md#initentries-f2a53bc0911b) from Builder
- [initPath(int)](Builder.md#initpath-efcaee2c9a10) from Builder
- [setEntries(Reader<Reader>)](Builder.md#setentries-65d42e9eb737) from Builder
- [setNsHash(int)](Builder.md#setnshash-856e3c88b24a) from Builder
- [setPath(Reader<Reader>)](Builder.md#setpath-3ceb96b4eeae) from Builder
- [setPathHash(int)](Builder.md#setpathhash-5447341695d9) from Builder
- [structSize()](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-82fffbec489c" id="asreader-82fffbec489c"></a>

```java
public final com.tailf.ncs.maapi.Schema.MountPoint.Reader asReader(
    com.tailf.ncs.maapi.Schema.MountPoint.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.MountPoint.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.MountPoint.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

### constructReader(SegmentReader, int, int, int, short, int) <a href="#constructreader-fbce6f4f912a" id="constructreader-fbce6f4f912a"></a>

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

Types: [Reader](Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

### structSize() <a href="#structsize-1fa68dcadd21" id="structsize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
