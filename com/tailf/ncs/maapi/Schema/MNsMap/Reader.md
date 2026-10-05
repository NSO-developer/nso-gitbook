<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMap.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getEntries()](#s-getEntries)
- [getNsHash()](#s-getNsHash)
- [getTagHash()](#s-getTagHash)
- [hasEntries()](#s-hasEntries)

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
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> getEntries()
```

Types: [Reader](../MNsMapEntry/Reader.md#s-Reader)

<a id="s-getNsHash"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="s-getTagHash"></a>
### getTagHash()

```java
public final int getTagHash()
```

<a id="s-hasEntries"></a>
### hasEntries()

```java
public final boolean hasEntries()
```
