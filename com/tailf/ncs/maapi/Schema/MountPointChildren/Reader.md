<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.MountPointChildren.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getChildren()](#m-getchildren-fe2038dff10d)
- [getMountId()](#m-getmountid-c5175827f949)
- [hasChildren()](#m-haschildren-94c463ee6541)
- [hasMountId()](#m-hasmountid-cfc15a094ddc)

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

<a id="m-getchildren-fe2038dff10d"></a>
### getChildren()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getChildren()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

<a id="m-getmountid-c5175827f949"></a>
### getMountId()

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getMountId()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

<a id="m-haschildren-94c463ee6541"></a>
### hasChildren()

```java
public final boolean hasChildren()
```

<a id="m-hasmountid-cfc15a094ddc"></a>
### hasMountId()

```java
public boolean hasMountId()
```
