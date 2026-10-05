<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.MountPointDb.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getEntries()](#m-getentries-f554b7f62e3d)
- [hasEntries()](#m-hasentries-ccf5edf194a9)

## Constructors

<a id="m-reader-cf5e962c3323"></a>
### Reader(SegmentReader, int, int, int, short, int)

**Package-private**

```java
Reader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`


## Methods

<a id="m-getentries-f554b7f62e3d"></a>
### getEntries()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPoint.Reader> getEntries()
```

Types: [Reader](../MountPoint/Reader.md#cls-Reader)

<a id="m-hasentries-ccf5edf194a9"></a>
### hasEntries()

```java
public final boolean hasEntries()
```
