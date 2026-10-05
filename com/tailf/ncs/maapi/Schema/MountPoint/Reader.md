<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getEntries()](#s-getEntries)
- [getNsHash()](#s-getNsHash)
- [getPath()](#s-getPath)
- [getPathHash()](#s-getPathHash)
- [hasEntries()](#s-hasEntries)
- [hasPath()](#s-hasPath)

## Constructors

<a id="s-Reader-1"></a>
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

<a id="s-getEntries"></a>
### getEntries()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> getEntries()
```

Types: [Reader](../MountPointChildren/Reader.md#s-Reader)

<a id="s-getNsHash"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="s-getPath"></a>
### getPath()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getPath()
```

Types: [Reader](../QTag/Reader.md#s-Reader)

<a id="s-getPathHash"></a>
### getPathHash()

```java
public final int getPathHash()
```

<a id="s-hasEntries"></a>
### hasEntries()

```java
public final boolean hasEntries()
```

<a id="s-hasPath"></a>
### hasPath()

```java
public final boolean hasPath()
```
