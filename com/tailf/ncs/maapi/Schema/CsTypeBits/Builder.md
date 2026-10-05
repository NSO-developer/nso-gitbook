# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeBits.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getBits\(\)](#getbits-032b4694ff31)
- [getWidth\(\)](#getwidth-aff9ccaa8b54)
- [hasBits\(\)](#hasbits-3d091966c9f9)
- [initBits\(int\)](#initbits-88cbf7cad7aa)
- [setBits\(Reader\<Reader\>\)](#setbits-70052b8b274c)
- [setWidth\(byte\)](#setwidth-83fbef553fe6)

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
public final com.tailf.ncs.maapi.Schema.CsTypeBits.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getBits() <a href="#getbits-032b4694ff31" id="getbits-032b4694ff31"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Builder> getBits()
```

Types: [Builder](Bit/Builder.md#builder-21f09e83781d)

### getWidth() <a href="#getwidth-aff9ccaa8b54" id="getwidth-aff9ccaa8b54"></a>

```java
public final byte getWidth()
```

### hasBits() <a href="#hasbits-3d091966c9f9" id="hasbits-3d091966c9f9"></a>

```java
public final boolean hasBits()
```

### initBits(int) <a href="#initbits-88cbf7cad7aa" id="initbits-88cbf7cad7aa"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Builder> initBits(
    int size
)
```

Types: [Builder](Bit/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### setBits(Reader&lt;Reader&gt;) <a href="#setbits-70052b8b274c" id="setbits-70052b8b274c"></a>

```java
public final void setBits(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> value
)
```

Types: [Reader](Bit/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsTypeBits.Bit.Reader> value`

### setWidth(byte) <a href="#setwidth-83fbef553fe6" id="setwidth-83fbef553fe6"></a>

```java
public final void setWidth(byte value)
```

**Parameters**

- `byte value`
