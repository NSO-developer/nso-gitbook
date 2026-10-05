# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeNumber.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getRanges()](#m-getRanges-c1cd383e54a0)
- [hasRanges()](#m-hasRanges-77bc63fe4ea8)
- [initRanges(int)](#m-initRanges-d04c09762bd6)
- [setRanges(Reader<Reader>)](#m-setRanges-69bbcdb47f71)

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
public final com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getRanges() <a href="#m-getRanges-c1cd383e54a0" id="m-getRanges-c1cd383e54a0"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> getRanges()
```

Types: [Builder](../Range/Builder.md#cls-Builder)

### hasRanges() <a href="#m-hasRanges-77bc63fe4ea8" id="m-hasRanges-77bc63fe4ea8"></a>

```java
public final boolean hasRanges()
```

### initRanges(int) <a href="#m-initRanges-d04c09762bd6" id="m-initRanges-d04c09762bd6"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> initRanges(
    int size
)
```

Types: [Builder](../Range/Builder.md#cls-Builder)

**Parameters**

- `int size`

### setRanges(Reader<Reader>) <a href="#m-setRanges-69bbcdb47f71" id="m-setRanges-69bbcdb47f71"></a>

```java
public final void setRanges(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value
)
```

Types: [Reader](../Range/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value`
