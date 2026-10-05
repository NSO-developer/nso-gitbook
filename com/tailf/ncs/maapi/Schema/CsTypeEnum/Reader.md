<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeEnum.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getValues()](#s-getValues)
- [hasValues()](#s-hasValues)

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

<a id="s-getValues"></a>
### getValues()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NameToHash.Reader> getValues()
```

Types: [Reader](../NameToHash/Reader.md#s-Reader)

<a id="s-hasValues"></a>
### hasValues()

```java
public final boolean hasValues()
```
