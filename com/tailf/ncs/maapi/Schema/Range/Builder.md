# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Range.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getFlags()](#getflags-3c1ca90fd29c)
- [getHi()](#gethi-f8fa4dcfe431)
- [getLo()](#getlo-bfe1c987d87a)
- [initHi()](#inithi-2c3dde583bd6)
- [initLo()](#initlo-62ec30618451)
- [setFlags(byte)](#setflags-920848b8d655)
- [setHi(Reader)](#sethi-550fb8729c56)
- [setLo(Reader)](#setlo-584c3fb11cf5)

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
public final com.tailf.ncs.maapi.Schema.Range.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getFlags() <a href="#getflags-3c1ca90fd29c" id="getflags-3c1ca90fd29c"></a>

```java
public final byte getFlags()
```

### getHi() <a href="#gethi-f8fa4dcfe431" id="gethi-f8fa4dcfe431"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getHi()
```

Types: [Builder](../CsValue/Builder.md#builder-21f09e83781d)

### getLo() <a href="#getlo-bfe1c987d87a" id="getlo-bfe1c987d87a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getLo()
```

Types: [Builder](../CsValue/Builder.md#builder-21f09e83781d)

### initHi() <a href="#inithi-2c3dde583bd6" id="inithi-2c3dde583bd6"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initHi()
```

Types: [Builder](../CsValue/Builder.md#builder-21f09e83781d)

### initLo() <a href="#initlo-62ec30618451" id="initlo-62ec30618451"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initLo()
```

Types: [Builder](../CsValue/Builder.md#builder-21f09e83781d)

### setFlags(byte) <a href="#setflags-920848b8d655" id="setflags-920848b8d655"></a>

```java
public final void setFlags(byte value)
```

**Parameters**

- `byte value`

### setHi(Reader) <a href="#sethi-550fb8729c56" id="sethi-550fb8729c56"></a>

```java
public final void setHi(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](../CsValue/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`

### setLo(Reader) <a href="#setlo-584c3fb11cf5" id="setlo-584c3fb11cf5"></a>

```java
public final void setLo(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](../CsValue/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`
