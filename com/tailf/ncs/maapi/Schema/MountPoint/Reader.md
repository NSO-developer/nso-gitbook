# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getEntries()](#m-getEntries-f554b7f62e3d)
- [getNsHash()](#m-getNsHash-f6f3e3ae1e6b)
- [getPath()](#m-getPath-88fb21895561)
- [getPathHash()](#m-getPathHash-14d7d9222b28)
- [hasEntries()](#m-hasEntries-ccf5edf194a9)
- [hasPath()](#m-hasPath-c0f486b47df7)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#m-Reader-cf5e962c3323" id="m-Reader-cf5e962c3323"></a>

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

### getEntries() <a href="#m-getEntries-f554b7f62e3d" id="m-getEntries-f554b7f62e3d"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> getEntries()
```

Types: [Reader](../MountPointChildren/Reader.md#cls-Reader)

### getNsHash() <a href="#m-getNsHash-f6f3e3ae1e6b" id="m-getNsHash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getPath() <a href="#m-getPath-88fb21895561" id="m-getPath-88fb21895561"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getPath()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

### getPathHash() <a href="#m-getPathHash-14d7d9222b28" id="m-getPathHash-14d7d9222b28"></a>

```java
public final int getPathHash()
```

### hasEntries() <a href="#m-hasEntries-ccf5edf194a9" id="m-hasEntries-ccf5edf194a9"></a>

```java
public final boolean hasEntries()
```

### hasPath() <a href="#m-hasPath-c0f486b47df7" id="m-hasPath-c0f486b47df7"></a>

```java
public final boolean hasPath()
```
