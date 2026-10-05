<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.Range.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getFlags()](#m-getflags-3c1ca90fd29c)
- [getHi()](#m-gethi-f8fa4dcfe431)
- [getLo()](#m-getlo-bfe1c987d87a)
- [initHi()](#m-inithi-2c3dde583bd6)
- [initLo()](#m-initlo-62ec30618451)
- [setFlags(byte)](#m-setflags-920848b8d655)
- [setHi(Reader)](#m-sethi-550fb8729c56)
- [setLo(Reader)](#m-setlo-584c3fb11cf5)

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
public final com.tailf.ncs.maapi.Schema.Range.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getflags-3c1ca90fd29c"></a>
### getFlags()

```java
public final byte getFlags()
```

<a id="m-gethi-f8fa4dcfe431"></a>
### getHi()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getHi()
```

Types: [Builder](../CsValue/Builder.md#cls-Builder)

<a id="m-getlo-bfe1c987d87a"></a>
### getLo()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder getLo()
```

Types: [Builder](../CsValue/Builder.md#cls-Builder)

<a id="m-inithi-2c3dde583bd6"></a>
### initHi()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initHi()
```

Types: [Builder](../CsValue/Builder.md#cls-Builder)

<a id="m-initlo-62ec30618451"></a>
### initLo()

```java
public final com.tailf.ncs.maapi.Schema.CsValue.Builder initLo()
```

Types: [Builder](../CsValue/Builder.md#cls-Builder)

<a id="m-setflags-920848b8d655"></a>
### setFlags(byte)

```java
public final void setFlags(byte value)
```

**Parameters**

- `byte value`

<a id="m-sethi-550fb8729c56"></a>
### setHi(Reader)

```java
public final void setHi(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](../CsValue/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`

<a id="m-setlo-584c3fb11cf5"></a>
### setLo(Reader)

```java
public final void setLo(com.tailf.ncs.maapi.Schema.CsValue.Reader value)
```

Types: [Reader](../CsValue/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsValue.Reader value`
