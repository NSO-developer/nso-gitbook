# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getCases\(\)](#getcases-42abc2944fb1)
- [getDefCase\(\)](#getdefcase-593fa181831e)
- [getHns\(\)](#gethns-457afaf41ae6)
- [getHtag\(\)](#gethtag-3a838d71ddf7)
- [getMinOccurs\(\)](#getminoccurs-cac79959dff8)
- [hasCases\(\)](#hascases-682cbddafe6a)
- [initCases\(int\)](#initcases-102f13b140b1)
- [initDefCase\(\)](#initdefcase-ddb954b8162e)
- [setCases\(Reader\<Reader\>\)](#setcases-0a50d2d330ee)
- [setDefCase\(Reader\)](#setdefcase-aa1695d9bbde)
- [setHns\(int\)](#sethns-7405e78f40fe)
- [setHtag\(int\)](#sethtag-d40f4d76b210)
- [setMinOccurs\(int\)](#setminoccurs-2cb1f96150f8)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#builder-179fba5038bd" id="builder-179fba5038bd"></a>

**Package-private**

```java
Builder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`


## Methods

### asReader() <a href="#asreader-b5c0f2a8d115" id="asreader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsChoice.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getCases() <a href="#getcases-42abc2944fb1" id="getcases-42abc2944fb1"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsCase.Builder> getCases()
```

Types: [Builder](../CsCase/Builder.md#builder-21f09e83781d)

### getDefCase() <a href="#getdefcase-593fa181831e" id="getdefcase-593fa181831e"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getDefCase()
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

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

### initCases(int) <a href="#initcases-102f13b140b1" id="initcases-102f13b140b1"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsCase.Builder> initCases(
    int size
)
```

Types: [Builder](../CsCase/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### initDefCase() <a href="#initdefcase-ddb954b8162e" id="initdefcase-ddb954b8162e"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initDefCase()
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

### setCases(Reader&lt;Reader&gt;) <a href="#setcases-0a50d2d330ee" id="setcases-0a50d2d330ee"></a>

```java
public final void setCases(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> value
)
```

Types: [Reader](../CsCase/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> value`

### setDefCase(Reader) <a href="#setdefcase-aa1695d9bbde" id="setdefcase-aa1695d9bbde"></a>

```java
public final void setDefCase(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`

### setHns(int) <a href="#sethns-7405e78f40fe" id="sethns-7405e78f40fe"></a>

```java
public final void setHns(int value)
```

**Parameters**

- `int value`

### setHtag(int) <a href="#sethtag-d40f4d76b210" id="sethtag-d40f4d76b210"></a>

```java
public final void setHtag(int value)
```

**Parameters**

- `int value`

### setMinOccurs(int) <a href="#setminoccurs-2cb1f96150f8" id="setminoccurs-2cb1f96150f8"></a>

```java
public final void setMinOccurs(int value)
```

**Parameters**

- `int value`
