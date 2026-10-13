# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

- [getTypeReferences\(\)](#gettypereferences-ba94c4f34d9c)
- [hasTypeReferences\(\)](#hastypereferences-8e6b59641fe0)

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

### getTypeReferences() <a href="#gettypereferences-ba94c4f34d9c" id="gettypereferences-ba94c4f34d9c"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> getTypeReferences()
```

Types: [Reader](../CsTypeReference/Reader.md#reader-b2467a96ddff)

### hasTypeReferences() <a href="#hastypereferences-8e6b59641fe0" id="hastypereferences-8e6b59641fe0"></a>

```java
public final boolean hasTypeReferences()
```
