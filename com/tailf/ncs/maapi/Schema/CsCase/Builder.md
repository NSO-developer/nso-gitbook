# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsCase.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getChoices()](#m-getChoices-818fb3fccb86)
- [getHns()](#m-getHns-457afaf41ae6)
- [getHtag()](#m-getHtag-3a838d71ddf7)
- [getNodes()](#m-getNodes-0d0e9b3adfd1)
- [hasChoices()](#m-hasChoices-6534dc5f2f55)
- [hasNodes()](#m-hasNodes-0c3a4b7d62ab)
- [initChoices(int)](#m-initChoices-6d6ca0d6d87e)
- [initNodes(int)](#m-initNodes-ae27813ecc84)
- [setChoices(Reader<Reader>)](#m-setChoices-6c56beb14596)
- [setHns(int)](#m-setHns-7405e78f40fe)
- [setHtag(int)](#m-setHtag-d40f4d76b210)
- [setNodes(Reader<Reader>)](#m-setNodes-1a7a637d61d9)

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
public final com.tailf.ncs.maapi.Schema.CsCase.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getChoices() <a href="#m-getChoices-818fb3fccb86" id="m-getChoices-818fb3fccb86"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsChoice.Builder> getChoices()
```

Types: [Builder](../CsChoice/Builder.md#cls-Builder)

### getHns() <a href="#m-getHns-457afaf41ae6" id="m-getHns-457afaf41ae6"></a>

```java
public final int getHns()
```

### getHtag() <a href="#m-getHtag-3a838d71ddf7" id="m-getHtag-3a838d71ddf7"></a>

```java
public final int getHtag()
```

### getNodes() <a href="#m-getNodes-0d0e9b3adfd1" id="m-getNodes-0d0e9b3adfd1"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getNodes()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

### hasChoices() <a href="#m-hasChoices-6534dc5f2f55" id="m-hasChoices-6534dc5f2f55"></a>

```java
public final boolean hasChoices()
```

### hasNodes() <a href="#m-hasNodes-0c3a4b7d62ab" id="m-hasNodes-0c3a4b7d62ab"></a>

```java
public final boolean hasNodes()
```

### initChoices(int) <a href="#m-initChoices-6d6ca0d6d87e" id="m-initChoices-6d6ca0d6d87e"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsChoice.Builder> initChoices(
    int size
)
```

Types: [Builder](../CsChoice/Builder.md#cls-Builder)

**Parameters**

- `int size`

### initNodes(int) <a href="#m-initNodes-ae27813ecc84" id="m-initNodes-ae27813ecc84"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initNodes(
    int size
)
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

**Parameters**

- `int size`

### setChoices(Reader<Reader>) <a href="#m-setChoices-6c56beb14596" id="m-setChoices-6c56beb14596"></a>

```java
public final void setChoices(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> value
)
```

Types: [Reader](../CsChoice/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> value`

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

### setNodes(Reader<Reader>) <a href="#m-setNodes-1a7a637d61d9" id="m-setNodes-1a7a637d61d9"></a>

```java
public final void setNodes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`
