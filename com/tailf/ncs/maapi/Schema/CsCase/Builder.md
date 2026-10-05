<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsCase.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getChoices()](#m-getchoices-818fb3fccb86)
- [getHns()](#m-gethns-457afaf41ae6)
- [getHtag()](#m-gethtag-3a838d71ddf7)
- [getNodes()](#m-getnodes-0d0e9b3adfd1)
- [hasChoices()](#m-haschoices-6534dc5f2f55)
- [hasNodes()](#m-hasnodes-0c3a4b7d62ab)
- [initChoices(int)](#m-initchoices-6d6ca0d6d87e)
- [initNodes(int)](#m-initnodes-ae27813ecc84)
- [setChoices(Reader<Reader>)](#m-setchoices-6c56beb14596)
- [setHns(int)](#m-sethns-7405e78f40fe)
- [setHtag(int)](#m-sethtag-d40f4d76b210)
- [setNodes(Reader<Reader>)](#m-setnodes-1a7a637d61d9)

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
public final com.tailf.ncs.maapi.Schema.CsCase.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getchoices-818fb3fccb86"></a>
### getChoices()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsChoice.Builder> getChoices()
```

Types: [Builder](../CsChoice/Builder.md#cls-Builder)

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
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getNodes()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

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

<a id="m-initchoices-6d6ca0d6d87e"></a>
### initChoices(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsChoice.Builder> initChoices(
    int size
)
```

Types: [Builder](../CsChoice/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-initnodes-ae27813ecc84"></a>
### initNodes(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initNodes(
    int size
)
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-setchoices-6c56beb14596"></a>
### setChoices(Reader<Reader>)

```java
public final void setChoices(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> value
)
```

Types: [Reader](../CsChoice/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> value`

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

<a id="m-setnodes-1a7a637d61d9"></a>
### setNodes(Reader<Reader>)

```java
public final void setNodes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`
