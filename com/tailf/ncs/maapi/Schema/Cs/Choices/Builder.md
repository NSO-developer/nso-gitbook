# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Choices.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getList()](#m-getList-bb3f8cbe83be)
- [getNone()](#m-getNone-e31bfdbffa7f)
- [hasList()](#m-hasList-3712d7ce73ac)
- [initList(int)](#m-initList-619d59db076f)
- [isList()](#m-isList-c36bce63b506)
- [isNone()](#m-isNone-e8a993ad0453)
- [setList(Reader<Reader>)](#m-setList-fb6135ecf56c)
- [setNone(Void)](#m-setNone-46764db867d5)
- [which()](#m-which-0b2d23db5ed0)

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
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getList() <a href="#m-getList-bb3f8cbe83be" id="m-getList-bb3f8cbe83be"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsChoice.Builder> getList()
```

Types: [Builder](../../CsChoice/Builder.md#cls-Builder)

### getNone() <a href="#m-getNone-e31bfdbffa7f" id="m-getNone-e31bfdbffa7f"></a>

```java
public final org.capnproto.Void getNone()
```

### hasList() <a href="#m-hasList-3712d7ce73ac" id="m-hasList-3712d7ce73ac"></a>

```java
public final boolean hasList()
```

### initList(int) <a href="#m-initList-619d59db076f" id="m-initList-619d59db076f"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsChoice.Builder> initList(
    int size
)
```

Types: [Builder](../../CsChoice/Builder.md#cls-Builder)

**Parameters**

- `int size`

### isList() <a href="#m-isList-c36bce63b506" id="m-isList-c36bce63b506"></a>

```java
public final boolean isList()
```

### isNone() <a href="#m-isNone-e8a993ad0453" id="m-isNone-e8a993ad0453"></a>

```java
public final boolean isNone()
```

### setList(Reader<Reader>) <a href="#m-setList-fb6135ecf56c" id="m-setList-fb6135ecf56c"></a>

```java
public final void setList(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> value
)
```

Types: [Reader](../../CsChoice/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> value`

### setNone(Void) <a href="#m-setNone-46764db867d5" id="m-setNone-46764db867d5"></a>

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

### which() <a href="#m-which-0b2d23db5ed0" id="m-which-0b2d23db5ed0"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Choices.Which which()
```

Types: [Which](Which.md#cls-Which)
