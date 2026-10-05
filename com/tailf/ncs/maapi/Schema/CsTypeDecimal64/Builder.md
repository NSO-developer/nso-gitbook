<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getFractionDigits()](#s-getFractionDigits)
- [getRanges()](#s-getRanges)
- [hasRanges()](#s-hasRanges)
- [initRanges(int)](#s-initRanges)
- [setFractionDigits(byte)](#s-setFractionDigits)
- [setRanges(Reader<Reader>)](#s-setRanges)

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
public final com.tailf.ncs.maapi.Schema.CsTypeDecimal64.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getFractionDigits"></a>
### getFractionDigits()

```java
public final byte getFractionDigits()
```

<a id="s-getRanges"></a>
### getRanges()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> getRanges()
```

Types: [Builder](../Range/Builder.md#s-Builder)

<a id="s-hasRanges"></a>
### hasRanges()

```java
public final boolean hasRanges()
```

<a id="s-initRanges"></a>
### initRanges(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> initRanges(
    int size
)
```

Types: [Builder](../Range/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-setFractionDigits"></a>
### setFractionDigits(byte)

```java
public final void setFractionDigits(byte value)
```

**Parameters**

- `byte value`

<a id="s-setRanges"></a>
### setRanges(Reader<Reader>)

```java
public final void setRanges(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value
)
```

Types: [Reader](../Range/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value`
