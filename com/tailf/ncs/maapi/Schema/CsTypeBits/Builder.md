# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getBits()](#m-getBits-032b4694ff31)
- [getWidth()](#m-getWidth-aff9ccaa8b54)
- [hasBits()](#m-hasBits-3d091966c9f9)
- [initBits(int)](#m-initBits-88cbf7cad7aa)
- [setBits(Reader<Reader>)](#m-setBits-70052b8b274c)
- [setWidth(byte)](#m-setWidth-83fbef553fe6)

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
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getBits() <a href="#m-getBits-032b4694ff31" id="m-getBits-032b4694ff31"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Builder> getBits()
```

Types: [Builder](Bit/Builder.md#cls-Builder)

### getWidth() <a href="#m-getWidth-aff9ccaa8b54" id="m-getWidth-aff9ccaa8b54"></a>

```java
public final byte getWidth()
```

### hasBits() <a href="#m-hasBits-3d091966c9f9" id="m-hasBits-3d091966c9f9"></a>

```java
public final boolean hasBits()
```

### initBits(int) <a href="#m-initBits-88cbf7cad7aa" id="m-initBits-88cbf7cad7aa"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Builder> initBits(
    int size
)
```

Types: [Builder](Bit/Builder.md#cls-Builder)

**Parameters**

- `int size`

### setBits(Reader<Reader>) <a href="#m-setBits-70052b8b274c" id="m-setBits-70052b8b274c"></a>

```java
public final void setBits(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> value
)
```

Types: [Reader](Bit/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> value`

### setWidth(byte) <a href="#m-setWidth-83fbef553fe6" id="m-setWidth-83fbef553fe6"></a>

```java
public final void setWidth(byte value)
```

**Parameters**

- `byte value`
