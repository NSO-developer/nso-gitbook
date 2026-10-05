<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getBits()](#s-getBits)
- [getWidth()](#s-getWidth)
- [hasBits()](#s-hasBits)
- [initBits(int)](#s-initBits)
- [setBits(Reader<Reader>)](#s-setBits)
- [setWidth(byte)](#s-setWidth)

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
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getBits"></a>
### getBits()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Builder> getBits()
```

Types: [Builder](Bit/Builder.md#s-Builder)

<a id="s-getWidth"></a>
### getWidth()

```java
public final byte getWidth()
```

<a id="s-hasBits"></a>
### hasBits()

```java
public final boolean hasBits()
```

<a id="s-initBits"></a>
### initBits(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Builder> initBits(
    int size
)
```

Types: [Builder](Bit/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-setBits"></a>
### setBits(Reader<Reader>)

```java
public final void setBits(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> value
)
```

Types: [Reader](Bit/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> value`

<a id="s-setWidth"></a>
### setWidth(byte)

```java
public final void setWidth(byte value)
```

**Parameters**

- `byte value`
