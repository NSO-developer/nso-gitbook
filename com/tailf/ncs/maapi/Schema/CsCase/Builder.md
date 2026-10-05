# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsCase.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getChoices\(\)](#getchoices-818fb3fccb86)
- [getHns\(\)](#gethns-457afaf41ae6)
- [getHtag\(\)](#gethtag-3a838d71ddf7)
- [getNodes\(\)](#getnodes-0d0e9b3adfd1)
- [hasChoices\(\)](#haschoices-6534dc5f2f55)
- [hasNodes\(\)](#hasnodes-0c3a4b7d62ab)
- [initChoices\(int\)](#initchoices-6d6ca0d6d87e)
- [initNodes\(int\)](#initnodes-ae27813ecc84)
- [setChoices\(Reader\<Reader\>\)](#setchoices-6c56beb14596)
- [setHns\(int\)](#sethns-7405e78f40fe)
- [setHtag\(int\)](#sethtag-d40f4d76b210)
- [setNodes\(Reader\<Reader\>\)](#setnodes-1a7a637d61d9)

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
public final com.tailf.ncs.maapi.Schema.CsCase.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getChoices() <a href="#getchoices-818fb3fccb86" id="getchoices-818fb3fccb86"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsChoice.Builder> getChoices()
```

Types: [Builder](../CsChoice/Builder.md#builder-21f09e83781d)

### getHns() <a href="#gethns-457afaf41ae6" id="gethns-457afaf41ae6"></a>

```java
public final int getHns()
```

### getHtag() <a href="#gethtag-3a838d71ddf7" id="gethtag-3a838d71ddf7"></a>

```java
public final int getHtag()
```

### getNodes() <a href="#getnodes-0d0e9b3adfd1" id="getnodes-0d0e9b3adfd1"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getNodes()
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

### hasChoices() <a href="#haschoices-6534dc5f2f55" id="haschoices-6534dc5f2f55"></a>

```java
public final boolean hasChoices()
```

### hasNodes() <a href="#hasnodes-0c3a4b7d62ab" id="hasnodes-0c3a4b7d62ab"></a>

```java
public final boolean hasNodes()
```

### initChoices(int) <a href="#initchoices-6d6ca0d6d87e" id="initchoices-6d6ca0d6d87e"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsChoice.Builder> initChoices(
    int size
)
```

Types: [Builder](../CsChoice/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### initNodes(int) <a href="#initnodes-ae27813ecc84" id="initnodes-ae27813ecc84"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initNodes(
    int size
)
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### setChoices(Reader&lt;Reader&gt;) <a href="#setchoices-6c56beb14596" id="setchoices-6c56beb14596"></a>

```java
public final void setChoices(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> value
)
```

Types: [Reader](../CsChoice/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> value`

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

### setNodes(Reader&lt;Reader&gt;) <a href="#setnodes-1a7a637d61d9" id="setnodes-1a7a637d61d9"></a>

```java
public final void setNodes(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`
