# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getRanges\(\)](#getranges-c1cd383e54a0)
- [hasRanges\(\)](#hasranges-77bc63fe4ea8)
- [initRanges\(int\)](#initranges-d04c09762bd6)
- [setRanges\(Reader\<Reader\>\)](#setranges-69bbcdb47f71)

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
public final com.tailf.ncs.maapi.Schema.CsTypeListRestriction.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getRanges() <a href="#getranges-c1cd383e54a0" id="getranges-c1cd383e54a0"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> getRanges()
```

Types: [Builder](../Range/Builder.md#builder-21f09e83781d)

### hasRanges() <a href="#hasranges-77bc63fe4ea8" id="hasranges-77bc63fe4ea8"></a>

```java
public final boolean hasRanges()
```

### initRanges(int) <a href="#initranges-d04c09762bd6" id="initranges-d04c09762bd6"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> initRanges(
    int size
)
```

Types: [Builder](../Range/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### setRanges(Reader&lt;Reader&gt;) <a href="#setranges-69bbcdb47f71" id="setranges-69bbcdb47f71"></a>

```java
public final void setRanges(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value
)
```

Types: [Reader](../Range/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value`
