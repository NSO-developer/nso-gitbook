# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsCase.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getChoices()](#m-getChoices-818fb3fccb86)
- [getHns()](#m-getHns-457afaf41ae6)
- [getHtag()](#m-getHtag-3a838d71ddf7)
- [getNodes()](#m-getNodes-0d0e9b3adfd1)
- [hasChoices()](#m-hasChoices-6534dc5f2f55)
- [hasNodes()](#m-hasNodes-0c3a4b7d62ab)

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

### getChoices() <a href="#m-getChoices-818fb3fccb86" id="m-getChoices-818fb3fccb86"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> getChoices()
```

Types: [Reader](../CsChoice/Reader.md#cls-Reader)

### getHns() <a href="#m-getHns-457afaf41ae6" id="m-getHns-457afaf41ae6"></a>

```java
public final int getHns()
```

### getHtag() <a href="#m-getHtag-3a838d71ddf7" id="m-getHtag-3a838d71ddf7"></a>

```java
public final int getHtag()
```

### getNodes() <a href="#m-getNodes-0d0e9b3adfd1" id="m-getNodes-0d0e9b3adfd1"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getNodes()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

### hasChoices() <a href="#m-hasChoices-6534dc5f2f55" id="m-hasChoices-6534dc5f2f55"></a>

```java
public final boolean hasChoices()
```

### hasNodes() <a href="#m-hasNodes-0c3a4b7d62ab" id="m-hasNodes-0c3a4b7d62ab"></a>

```java
public final boolean hasNodes()
```
