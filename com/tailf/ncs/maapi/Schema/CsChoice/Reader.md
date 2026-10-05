<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getCases()](#m-getcases-42abc2944fb1)
- [getDefCase()](#m-getdefcase-593fa181831e)
- [getHns()](#m-gethns-457afaf41ae6)
- [getHtag()](#m-gethtag-3a838d71ddf7)
- [getMinOccurs()](#m-getminoccurs-cac79959dff8)
- [hasCases()](#m-hascases-682cbddafe6a)
- [hasDefCase()](#m-hasdefcase-417dec2577e2)

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

<a id="m-getcases-42abc2944fb1"></a>
### getCases()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> getCases()
```

Types: [Reader](../CsCase/Reader.md#cls-Reader)

<a id="m-getdefcase-593fa181831e"></a>
### getDefCase()

```java
public com.tailf.ncs.maapi.Schema.QTag.Reader getDefCase()
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

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

<a id="m-getminoccurs-cac79959dff8"></a>
### getMinOccurs()

```java
public final int getMinOccurs()
```

<a id="m-hascases-682cbddafe6a"></a>
### hasCases()

```java
public final boolean hasCases()
```

<a id="m-hasdefcase-417dec2577e2"></a>
### hasDefCase()

```java
public boolean hasDefCase()
```
