<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeNumber.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getRanges()](#m-getranges-c1cd383e54a0)
- [hasRanges()](#m-hasranges-77bc63fe4ea8)
- [initRanges(int)](#m-initranges-d04c09762bd6)
- [setRanges(Reader<Reader>)](#m-setranges-69bbcdb47f71)

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
public final com.tailf.ncs.maapi.Schema.CsTypeNumber.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getranges-c1cd383e54a0"></a>
### getRanges()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> getRanges()
```

Types: [Builder](../Range/Builder.md#cls-Builder)

<a id="m-hasranges-77bc63fe4ea8"></a>
### hasRanges()

```java
public final boolean hasRanges()
```

<a id="m-initranges-d04c09762bd6"></a>
### initRanges(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> initRanges(
    int size
)
```

Types: [Builder](../Range/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-setranges-69bbcdb47f71"></a>
### setRanges(Reader<Reader>)

```java
public final void setRanges(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value
)
```

Types: [Reader](../Range/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value`
