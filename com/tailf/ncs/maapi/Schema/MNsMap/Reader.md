# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMap.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getEntries()](#m-getEntries-f554b7f62e3d)
- [getNsHash()](#m-getNsHash-f6f3e3ae1e6b)
- [getTagHash()](#m-getTagHash-8f057919039c)
- [hasEntries()](#m-hasEntries-ccf5edf194a9)

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
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> getEntries()
```

Types: [Reader](../MNsMapEntry/Reader.md#cls-Reader)

### getNsHash() <a href="#m-getNsHash-f6f3e3ae1e6b" id="m-getNsHash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getTagHash() <a href="#m-getTagHash-8f057919039c" id="m-getTagHash-8f057919039c"></a>

```java
public final int getTagHash()
```

### hasEntries() <a href="#m-hasEntries-ccf5edf194a9" id="m-hasEntries-ccf5edf194a9"></a>

```java
public final boolean hasEntries()
```
