<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMap.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getEntries()](#m-getentries-f554b7f62e3d)
- [getNsHash()](#m-getnshash-f6f3e3ae1e6b)
- [getTagHash()](#m-gettaghash-8f057919039c)
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
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> getEntries()
```

Types: [Reader](../MNsMapEntry/Reader.md#cls-Reader)

<a id="m-getnshash-f6f3e3ae1e6b"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="m-gettaghash-8f057919039c"></a>
### getTagHash()

```java
public final int getTagHash()
```

<a id="m-hasentries-ccf5edf194a9"></a>
### hasEntries()

```java
public final boolean hasEntries()
```
