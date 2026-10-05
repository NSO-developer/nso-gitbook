<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getEntries()](#m-getentries-f554b7f62e3d)
- [getNsHash()](#m-getnshash-f6f3e3ae1e6b)
- [getPath()](#m-getpath-88fb21895561)
- [getPathHash()](#m-getpathhash-14d7d9222b28)
- [hasEntries()](#m-hasentries-ccf5edf194a9)
- [hasPath()](#m-haspath-c0f486b47df7)

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
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> getEntries()
```

Types: [Reader](../MountPointChildren/Reader.md#cls-Reader)

<a id="m-getnshash-f6f3e3ae1e6b"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="m-getpath-88fb21895561"></a>
### getPath()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getPath()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

<a id="m-getpathhash-14d7d9222b28"></a>
### getPathHash()

```java
public final int getPathHash()
```

<a id="m-hasentries-ccf5edf194a9"></a>
### hasEntries()

```java
public final boolean hasEntries()
```

<a id="m-haspath-c0f486b47df7"></a>
### hasPath()

```java
public final boolean hasPath()
```
