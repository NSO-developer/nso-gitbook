# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsCase.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getChoices()](#getchoices-818fb3fccb86)
- [getHns()](#gethns-457afaf41ae6)
- [getHtag()](#gethtag-3a838d71ddf7)
- [getNodes()](#getnodes-0d0e9b3adfd1)
- [hasChoices()](#haschoices-6534dc5f2f55)
- [hasNodes()](#hasnodes-0c3a4b7d62ab)

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

### getChoices() <a href="#getchoices-818fb3fccb86" id="getchoices-818fb3fccb86"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> getChoices()
```

Types: [Reader](../CsChoice/Reader.md#reader-b2467a96ddff)

### getHns() <a href="#gethns-457afaf41ae6" id="gethns-457afaf41ae6"></a>

```java
public final int getHns()
```

### getHtag() <a href="#gethtag-3a838d71ddf7" id="gethtag-3a838d71ddf7"></a>

```java
public final int getHtag()
```

### getNodes() <a href="#getnodes-0d0e9b3adfd1" id="getnodes-0d0e9b3adfd1"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getNodes()
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

### hasChoices() <a href="#haschoices-6534dc5f2f55" id="haschoices-6534dc5f2f55"></a>

```java
public final boolean hasChoices()
```

### hasNodes() <a href="#hasnodes-0c3a4b7d62ab" id="hasnodes-0c3a4b7d62ab"></a>

```java
public final boolean hasNodes()
```
