# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMap.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getEntries()](#getentries-f554b7f62e3d)
- [getNsHash()](#getnshash-f6f3e3ae1e6b)
- [getTagHash()](#gettaghash-8f057919039c)
- [hasEntries()](#hasentries-ccf5edf194a9)

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
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> getEntries()
```

Types: [Reader](../MNsMapEntry/Reader.md#reader-b2467a96ddff)

### getNsHash() <a href="#getnshash-f6f3e3ae1e6b" id="getnshash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getTagHash() <a href="#gettaghash-8f057919039c" id="gettaghash-8f057919039c"></a>

```java
public final int getTagHash()
```

### hasEntries() <a href="#hasentries-ccf5edf194a9" id="hasentries-ccf5edf194a9"></a>

```java
public final boolean hasEntries()
```
