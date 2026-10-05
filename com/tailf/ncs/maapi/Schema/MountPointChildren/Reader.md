# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MountPointChildren.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getChildren()](#m-getChildren-fe2038dff10d)
- [getMountId()](#m-getMountId-c5175827f949)
- [hasChildren()](#m-hasChildren-94c463ee6541)
- [hasMountId()](#m-hasMountId-cfc15a094ddc)

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

### getChildren() <a href="#m-getChildren-fe2038dff10d" id="m-getChildren-fe2038dff10d"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getChildren()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

### getMountId() <a href="#m-getMountId-c5175827f949" id="m-getMountId-c5175827f949"></a>

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getMountId()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

### hasChildren() <a href="#m-hasChildren-94c463ee6541" id="m-hasChildren-94c463ee6541"></a>

```java
public final boolean hasChildren()
```

### hasMountId() <a href="#m-hasMountId-cfc15a094ddc" id="m-hasMountId-cfc15a094ddc"></a>

```java
public boolean hasMountId()
```
