# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Range.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getFlags()](#m-getFlags-3c1ca90fd29c)
- [getHi()](#m-getHi-f8fa4dcfe431)
- [getLo()](#m-getLo-bfe1c987d87a)
- [initHi()](#m-initHi-2c3dde583bd6)
- [initLo()](#m-initLo-62ec30618451)
- [setFlags(byte)](#m-setFlags-920848b8d655)
- [setHi(Reader)](#m-setHi-550fb8729c56)
- [setLo(Reader)](#m-setLo-584c3fb11cf5)

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
public final com.tailf.ncs.maapi.Schema.Range.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getFlags() <a href="#m-getFlags-3c1ca90fd29c" id="m-getFlags-3c1ca90fd29c"></a>

```java
public final byte getFlags()
```

### getHi() <a href="#m-getHi-f8fa4dcfe431" id="m-getHi-f8fa4dcfe431"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getHi()
```

Types: [Builder](../CsValue/Builder.md#cls-Builder)

### getLo() <a href="#m-getLo-bfe1c987d87a" id="m-getLo-bfe1c987d87a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getLo()
```

Types: [Builder](../CsValue/Builder.md#cls-Builder)

### initHi() <a href="#m-initHi-2c3dde583bd6" id="m-initHi-2c3dde583bd6"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initHi()
```

Types: [Builder](../CsValue/Builder.md#cls-Builder)

### initLo() <a href="#m-initLo-62ec30618451" id="m-initLo-62ec30618451"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initLo()
```

Types: [Builder](../CsValue/Builder.md#cls-Builder)

### setFlags(byte) <a href="#m-setFlags-920848b8d655" id="m-setFlags-920848b8d655"></a>

```java
public final void setFlags(byte value)
```

**Parameters**

- `byte value`

### setHi(Reader) <a href="#m-setHi-550fb8729c56" id="m-setHi-550fb8729c56"></a>

```java
public final void setHi(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](../CsValue/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`

### setLo(Reader) <a href="#m-setLo-584c3fb11cf5" id="m-setLo-584c3fb11cf5"></a>

```java
public final void setLo(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](../CsValue/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`
