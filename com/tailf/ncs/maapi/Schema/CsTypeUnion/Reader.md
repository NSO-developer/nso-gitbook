<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeUnion.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getTypeReferences()](#m-gettypereferences-ba94c4f34d9c)
- [hasTypeReferences()](#m-hastypereferences-8e6b59641fe0)

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

<a id="m-gettypereferences-ba94c4f34d9c"></a>
### getTypeReferences()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeReference.Reader> getTypeReferences()
```

Types: [Reader](../CsTypeReference/Reader.md#cls-Reader)

<a id="m-hastypereferences-8e6b59641fe0"></a>
### hasTypeReferences()

```java
public final boolean hasTypeReferences()
```
