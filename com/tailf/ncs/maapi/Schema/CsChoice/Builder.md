<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getCases()](#m-getcases-42abc2944fb1)
- [getDefCase()](#m-getdefcase-593fa181831e)
- [getHns()](#m-gethns-457afaf41ae6)
- [getHtag()](#m-gethtag-3a838d71ddf7)
- [getMinOccurs()](#m-getminoccurs-cac79959dff8)
- [hasCases()](#m-hascases-682cbddafe6a)
- [initCases(int)](#m-initcases-102f13b140b1)
- [initDefCase()](#m-initdefcase-ddb954b8162e)
- [setCases(Reader<Reader>)](#m-setcases-0a50d2d330ee)
- [setDefCase(Reader)](#m-setdefcase-aa1695d9bbde)
- [setHns(int)](#m-sethns-7405e78f40fe)
- [setHtag(int)](#m-sethtag-d40f4d76b210)
- [setMinOccurs(int)](#m-setminoccurs-2cb1f96150f8)

## Constructors

<a id="m-builder-179fba5038bd"></a>
### Builder(SegmentBuilder, int, int, int, short)

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

<a id="m-asreader-b5c0f2a8d115"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsChoice.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getcases-42abc2944fb1"></a>
### getCases()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsCase.Builder> getCases()
```

Types: [Builder](../CsCase/Builder.md#cls-Builder)

<a id="m-getdefcase-593fa181831e"></a>
### getDefCase()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getDefCase()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

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

<a id="m-initcases-102f13b140b1"></a>
### initCases(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsCase.Builder> initCases(
    int size
)
```

Types: [Builder](../CsCase/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-initdefcase-ddb954b8162e"></a>
### initDefCase()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initDefCase()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

<a id="m-setcases-0a50d2d330ee"></a>
### setCases(Reader<Reader>)

```java
public final void setCases(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> value
)
```

Types: [Reader](../CsCase/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> value`

<a id="m-setdefcase-aa1695d9bbde"></a>
### setDefCase(Reader)

```java
public final void setDefCase(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`

<a id="m-sethns-7405e78f40fe"></a>
### setHns(int)

```java
public final void setHns(int value)
```

**Parameters**

- `int value`

<a id="m-sethtag-d40f4d76b210"></a>
### setHtag(int)

```java
public final void setHtag(int value)
```

**Parameters**

- `int value`

<a id="m-setminoccurs-2cb1f96150f8"></a>
### setMinOccurs(int)

```java
public final void setMinOccurs(int value)
```

**Parameters**

- `int value`
