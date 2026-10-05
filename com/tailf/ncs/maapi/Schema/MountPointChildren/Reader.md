# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MountPointChildren.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getChildren()](#getchildren-fe2038dff10d)
- [getMountId()](#getmountid-c5175827f949)
- [hasChildren()](#haschildren-94c463ee6541)
- [hasMountId()](#hasmountid-cfc15a094ddc)

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

### getChildren() <a href="#getchildren-fe2038dff10d" id="getchildren-fe2038dff10d"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getChildren()
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

### getMountId() <a href="#getmountid-c5175827f949" id="getmountid-c5175827f949"></a>

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getMountId()
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

### hasChildren() <a href="#haschildren-94c463ee6541" id="haschildren-94c463ee6541"></a>

```java
public final boolean hasChildren()
```

### hasMountId() <a href="#hasmountid-cfc15a094ddc" id="hasmountid-cfc15a094ddc"></a>

```java
public boolean hasMountId()
```
