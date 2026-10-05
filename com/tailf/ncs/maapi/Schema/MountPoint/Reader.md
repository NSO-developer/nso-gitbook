# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getEntries()](#getentries-f554b7f62e3d)
- [getNsHash()](#getnshash-f6f3e3ae1e6b)
- [getPath()](#getpath-88fb21895561)
- [getPathHash()](#getpathhash-14d7d9222b28)
- [hasEntries()](#hasentries-ccf5edf194a9)
- [hasPath()](#haspath-c0f486b47df7)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#reader-cf5e962c3323" id="reader-cf5e962c3323"></a>

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

### getEntries() <a href="#getentries-f554b7f62e3d" id="getentries-f554b7f62e3d"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> getEntries()
```

Types: [Reader](../MountPointChildren/Reader.md#reader-b2467a96ddff)

### getNsHash() <a href="#getnshash-f6f3e3ae1e6b" id="getnshash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getPath() <a href="#getpath-88fb21895561" id="getpath-88fb21895561"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getPath()
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

### getPathHash() <a href="#getpathhash-14d7d9222b28" id="getpathhash-14d7d9222b28"></a>

```java
public final int getPathHash()
```

### hasEntries() <a href="#hasentries-ccf5edf194a9" id="hasentries-ccf5edf194a9"></a>

```java
public final boolean hasEntries()
```

### hasPath() <a href="#haspath-c0f486b47df7" id="haspath-c0f486b47df7"></a>

```java
public final boolean hasPath()
```
