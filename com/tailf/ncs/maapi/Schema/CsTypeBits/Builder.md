<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getBits()](#m-getbits-032b4694ff31)
- [getWidth()](#m-getwidth-aff9ccaa8b54)
- [hasBits()](#m-hasbits-3d091966c9f9)
- [initBits(int)](#m-initbits-88cbf7cad7aa)
- [setBits(Reader<Reader>)](#m-setbits-70052b8b274c)
- [setWidth(byte)](#m-setwidth-83fbef553fe6)

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
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getbits-032b4694ff31"></a>
### getBits()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Builder> getBits()
```

Types: [Builder](Bit/Builder.md#cls-Builder)

<a id="m-getwidth-aff9ccaa8b54"></a>
### getWidth()

```java
public final byte getWidth()
```

<a id="m-hasbits-3d091966c9f9"></a>
### hasBits()

```java
public final boolean hasBits()
```

<a id="m-initbits-88cbf7cad7aa"></a>
### initBits(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Builder> initBits(
    int size
)
```

Types: [Builder](Bit/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-setbits-70052b8b274c"></a>
### setBits(Reader<Reader>)

```java
public final void setBits(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> value
)
```

Types: [Reader](Bit/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> value`

<a id="m-setwidth-83fbef553fe6"></a>
### setWidth(byte)

```java
public final void setWidth(byte value)
```

**Parameters**

- `byte value`
