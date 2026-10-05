# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getTypeReferences()](#m-getTypeReferences-ba94c4f34d9c)
- [hasTypeReferences()](#m-hasTypeReferences-8e6b59641fe0)

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

### getTypeReferences() <a href="#m-getTypeReferences-ba94c4f34d9c" id="m-getTypeReferences-ba94c4f34d9c"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> getTypeReferences()
```

Types: [Reader](../CsTypeReference/Reader.md#cls-Reader)

### hasTypeReferences() <a href="#m-hasTypeReferences-8e6b59641fe0" id="m-hasTypeReferences-8e6b59641fe0"></a>

```java
public final boolean hasTypeReferences()
```
