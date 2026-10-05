# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getValues()](#m-getValues-06542a92d7fa)
- [hasValues()](#m-hasValues-64d4a87b971a)

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

### getValues() <a href="#m-getValues-06542a92d7fa" id="m-getValues-06542a92d7fa"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> getValues()
```

Types: [Reader](../NameToHash/Reader.md#cls-Reader)

### hasValues() <a href="#m-hasValues-64d4a87b971a" id="m-hasValues-64d4a87b971a"></a>

```java
public final boolean hasValues()
```
