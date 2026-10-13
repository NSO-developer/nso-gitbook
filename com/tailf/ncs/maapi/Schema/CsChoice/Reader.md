# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader\(SegmentReader, int, int, int, short, int\)](#reader-cf5e962c3323)

**Methods**:

- [getCases\(\)](#getcases-42abc2944fb1)
- [getDefCase\(\)](#getdefcase-593fa181831e)
- [getHns\(\)](#gethns-457afaf41ae6)
- [getHtag\(\)](#gethtag-3a838d71ddf7)
- [getMinOccurs\(\)](#getminoccurs-cac79959dff8)
- [hasCases\(\)](#hascases-682cbddafe6a)
- [hasDefCase\(\)](#hasdefcase-417dec2577e2)

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

### getCases() <a href="#getcases-42abc2944fb1" id="getcases-42abc2944fb1"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> getCases()
```

Types: [Reader](../CsCase/Reader.md#reader-b2467a96ddff)

### getDefCase() <a href="#getdefcase-593fa181831e" id="getdefcase-593fa181831e"></a>

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getDefCase()
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

### getHns() <a href="#gethns-457afaf41ae6" id="gethns-457afaf41ae6"></a>

```java
public final int getHns()
```

### getHtag() <a href="#gethtag-3a838d71ddf7" id="gethtag-3a838d71ddf7"></a>

```java
public final int getHtag()
```

### getMinOccurs() <a href="#getminoccurs-cac79959dff8" id="getminoccurs-cac79959dff8"></a>

```java
public final int getMinOccurs()
```

### hasCases() <a href="#hascases-682cbddafe6a" id="hascases-682cbddafe6a"></a>

```java
public final boolean hasCases()
```

### hasDefCase() <a href="#hasdefcase-417dec2577e2" id="hasdefcase-417dec2577e2"></a>

```java
public boolean hasDefCase()
```
