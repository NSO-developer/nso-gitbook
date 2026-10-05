# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getCases()](#m-getCases-42abc2944fb1)
- [getDefCase()](#m-getDefCase-593fa181831e)
- [getHns()](#m-getHns-457afaf41ae6)
- [getHtag()](#m-getHtag-3a838d71ddf7)
- [getMinOccurs()](#m-getMinOccurs-cac79959dff8)
- [hasCases()](#m-hasCases-682cbddafe6a)
- [initCases(int)](#m-initCases-102f13b140b1)
- [initDefCase()](#m-initDefCase-ddb954b8162e)
- [setCases(Reader<Reader>)](#m-setCases-0a50d2d330ee)
- [setDefCase(Reader)](#m-setDefCase-aa1695d9bbde)
- [setHns(int)](#m-setHns-7405e78f40fe)
- [setHtag(int)](#m-setHtag-d40f4d76b210)
- [setMinOccurs(int)](#m-setMinOccurs-2cb1f96150f8)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#m-Builder-179fba5038bd" id="m-Builder-179fba5038bd"></a>

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

### asReader() <a href="#m-asReader-b5c0f2a8d115" id="m-asReader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsChoice.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getCases() <a href="#m-getCases-42abc2944fb1" id="m-getCases-42abc2944fb1"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsCase.Builder> getCases()
```

Types: [Builder](../CsCase/Builder.md#cls-Builder)

### getDefCase() <a href="#m-getDefCase-593fa181831e" id="m-getDefCase-593fa181831e"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getDefCase()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

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

### initCases(int) <a href="#m-initCases-102f13b140b1" id="m-initCases-102f13b140b1"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsCase.Builder> initCases(
    int size
)
```

Types: [Builder](../CsCase/Builder.md#cls-Builder)

**Parameters**

- `int size`

### initDefCase() <a href="#m-initDefCase-ddb954b8162e" id="m-initDefCase-ddb954b8162e"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initDefCase()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

### setCases(Reader<Reader>) <a href="#m-setCases-0a50d2d330ee" id="m-setCases-0a50d2d330ee"></a>

```java
public final void setCases(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> value
)
```

Types: [Reader](../CsCase/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> value`

### setDefCase(Reader) <a href="#m-setDefCase-aa1695d9bbde" id="m-setDefCase-aa1695d9bbde"></a>

```java
public final void setDefCase(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`

### setHns(int) <a href="#m-setHns-7405e78f40fe" id="m-setHns-7405e78f40fe"></a>

```java
public final void setHns(int value)
```

**Parameters**

- `int value`

### setHtag(int) <a href="#m-setHtag-d40f4d76b210" id="m-setHtag-d40f4d76b210"></a>

```java
public final void setHtag(int value)
```

**Parameters**

- `int value`

### setMinOccurs(int) <a href="#m-setMinOccurs-2cb1f96150f8" id="m-setMinOccurs-2cb1f96150f8"></a>

```java
public final void setMinOccurs(int value)
```

**Parameters**

- `int value`
