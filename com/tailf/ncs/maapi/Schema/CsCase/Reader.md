<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsCase.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getChoices()](#m-getchoices-818fb3fccb86)
- [getHns()](#m-gethns-457afaf41ae6)
- [getHtag()](#m-gethtag-3a838d71ddf7)
- [getNodes()](#m-getnodes-0d0e9b3adfd1)
- [hasChoices()](#m-haschoices-6534dc5f2f55)
- [hasNodes()](#m-hasnodes-0c3a4b7d62ab)

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

<a id="m-getchoices-818fb3fccb86"></a>
### getChoices()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> getChoices()
```

Types: [Reader](../CsChoice/Reader.md#cls-Reader)

<a id="m-gethns-457afaf41ae6"></a>
### getHns()

```java
public final int getHns()
```

<a id="m-gethtag-3a838d71ddf7"></a>
### getHtag()

```java
public final int getHtag()
```

<a id="m-getnodes-0d0e9b3adfd1"></a>
### getNodes()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getNodes()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

<a id="m-haschoices-6534dc5f2f55"></a>
### hasChoices()

```java
public final boolean hasChoices()
```

<a id="m-hasnodes-0c3a4b7d62ab"></a>
### hasNodes()

```java
public final boolean hasNodes()
```
