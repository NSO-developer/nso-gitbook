<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsChoice.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getCases()](#s-getCases)
- [getDefCase()](#s-getDefCase)
- [getHns()](#s-getHns)
- [getHtag()](#s-getHtag)
- [getMinOccurs()](#s-getMinOccurs)
- [hasCases()](#s-hasCases)
- [initCases(int)](#s-initCases)
- [initDefCase()](#s-initDefCase)
- [setCases(Reader<Reader>)](#s-setCases)
- [setDefCase(Reader)](#s-setDefCase)
- [setHns(int)](#s-setHns)
- [setHtag(int)](#s-setHtag)
- [setMinOccurs(int)](#s-setMinOccurs)

## Constructors

<a id="s-Builder-1"></a>
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

<a id="s-asReader"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.CsChoice.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getCases"></a>
### getCases()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsCase.Builder> getCases()
```

Types: [Builder](../CsCase/Builder.md#s-Builder)

<a id="s-getDefCase"></a>
### getDefCase()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getDefCase()
```

Types: [Builder](../QTag/Builder.md#s-Builder)

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

<a id="s-initCases"></a>
### initCases(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsCase.Builder> initCases(
    int size
)
```

Types: [Builder](../CsCase/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-initDefCase"></a>
### initDefCase()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initDefCase()
```

Types: [Builder](../QTag/Builder.md#s-Builder)

<a id="s-setCases"></a>
### setCases(Reader<Reader>)

```java
public final void setCases(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> value
)
```

Types: [Reader](../CsCase/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsCase.Reader> value`

<a id="s-setDefCase"></a>
### setDefCase(Reader)

```java
public final void setDefCase(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`

<a id="s-setHns"></a>
### setHns(int)

```java
public final void setHns(int value)
```

**Parameters**

- `int value`

<a id="s-setHtag"></a>
### setHtag(int)

```java
public final void setHtag(int value)
```

**Parameters**

- `int value`

<a id="s-setMinOccurs"></a>
### setMinOccurs(int)

```java
public final void setMinOccurs(int value)
```

**Parameters**

- `int value`
