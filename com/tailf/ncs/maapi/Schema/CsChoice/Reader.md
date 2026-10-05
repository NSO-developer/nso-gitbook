<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getCases()](#s-getCases)
- [getDefCase()](#s-getDefCase)
- [getHns()](#s-getHns)
- [getHtag()](#s-getHtag)
- [getMinOccurs()](#s-getMinOccurs)
- [hasCases()](#s-hasCases)
- [hasDefCase()](#s-hasDefCase)

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

<a id="s-getCases"></a>
### getCases()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> getCases()
```

Types: [Reader](../CsCase/Reader.md#s-Reader)

<a id="s-getDefCase"></a>
### getDefCase()

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getDefCase()
```

Types: [Reader](../QTag/Reader.md#s-Reader)

<a id="s-getHns"></a>
### getHns()

```java
public final int getHns()
```

<a id="s-getHtag"></a>
### getHtag()

```java
public final int getHtag()
```

<a id="s-getMinOccurs"></a>
### getMinOccurs()

```java
public final int getMinOccurs()
```

<a id="s-hasCases"></a>
### hasCases()

```java
public final boolean hasCases()
```

<a id="s-hasDefCase"></a>
### hasDefCase()

```java
public boolean hasDefCase()
```
