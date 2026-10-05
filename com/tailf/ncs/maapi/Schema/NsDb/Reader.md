<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.NsDb.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getEntries()](#s-getEntries)
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
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NsInfo.Reader> getEntries()
```

Types: [Reader](../NsInfo/Reader.md#s-Reader)

<a id="s-hasEntries"></a>
### hasEntries()

```java
public final boolean hasEntries()
```
