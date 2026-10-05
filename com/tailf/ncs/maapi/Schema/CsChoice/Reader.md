# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getCases()](#m-getCases-42abc2944fb1)
- [getDefCase()](#m-getDefCase-593fa181831e)
- [getHns()](#m-getHns-457afaf41ae6)
- [getHtag()](#m-getHtag-3a838d71ddf7)
- [getMinOccurs()](#m-getMinOccurs-cac79959dff8)
- [hasCases()](#m-hasCases-682cbddafe6a)
- [hasDefCase()](#m-hasDefCase-417dec2577e2)

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

### getCases() <a href="#m-getCases-42abc2944fb1" id="m-getCases-42abc2944fb1"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> getCases()
```

Types: [Reader](../CsCase/Reader.md#cls-Reader)

### getDefCase() <a href="#m-getDefCase-593fa181831e" id="m-getDefCase-593fa181831e"></a>

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getDefCase()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

### getHns() <a href="#m-getHns-457afaf41ae6" id="m-getHns-457afaf41ae6"></a>

```java
public final int getHns()
```

### getHtag() <a href="#m-getHtag-3a838d71ddf7" id="m-getHtag-3a838d71ddf7"></a>

```java
public final int getHtag()
```

### getMinOccurs() <a href="#m-getMinOccurs-cac79959dff8" id="m-getMinOccurs-cac79959dff8"></a>

```java
public final int getMinOccurs()
```

### hasCases() <a href="#m-hasCases-682cbddafe6a" id="m-hasCases-682cbddafe6a"></a>

```java
public final boolean hasCases()
```

### hasDefCase() <a href="#m-hasDefCase-417dec2577e2" id="m-hasDefCase-417dec2577e2"></a>

```java
public boolean hasDefCase()
```
