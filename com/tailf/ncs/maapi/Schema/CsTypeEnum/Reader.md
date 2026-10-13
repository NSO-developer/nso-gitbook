# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

- [getValues\(\)](#getvalues-06542a92d7fa)
- [hasValues\(\)](#hasvalues-64d4a87b971a)

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

### getValues() <a href="#getvalues-06542a92d7fa" id="getvalues-06542a92d7fa"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> getValues()
```

Types: [Reader](../NameToHash/Reader.md#reader-b2467a96ddff)

### hasValues() <a href="#hasvalues-64d4a87b971a" id="hasvalues-64d4a87b971a"></a>

```java
public final boolean hasValues()
```
