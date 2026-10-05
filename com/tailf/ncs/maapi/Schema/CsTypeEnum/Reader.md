<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getValues()](#m-getvalues-06542a92d7fa)
- [hasValues()](#m-hasvalues-64d4a87b971a)

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

<a id="m-getvalues-06542a92d7fa"></a>
### getValues()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> getValues()
```

Types: [Reader](../NameToHash/Reader.md#cls-Reader)

<a id="m-hasvalues-64d4a87b971a"></a>
### hasValues()

```java
public final boolean hasValues()
```
