<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.MountPointChildren.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getChildren()](#s-getChildren)
- [getMountId()](#s-getMountId)
- [hasChildren()](#s-hasChildren)
- [hasMountId()](#s-hasMountId)

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

<a id="s-getChildren"></a>
### getChildren()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getChildren()
```

Types: [Reader](../QTag/Reader.md#s-Reader)

<a id="s-getMountId"></a>
### getMountId()

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getMountId()
```

Types: [Reader](../QTag/Reader.md#s-Reader)

<a id="s-hasChildren"></a>
### hasChildren()

```java
public final boolean hasChildren()
```

<a id="s-hasMountId"></a>
### hasMountId()

```java
public boolean hasMountId()
```
