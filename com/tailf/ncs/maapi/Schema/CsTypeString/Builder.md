# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeString.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getInvertMatch()](#m-getInvertMatch-323126ccbf2f)
- [getPattern()](#m-getPattern-b471c55bbd3b)
- [getRanges()](#m-getRanges-c1cd383e54a0)
- [hasPattern()](#m-hasPattern-e3fe48944019)
- [hasRanges()](#m-hasRanges-77bc63fe4ea8)
- [initPattern(int)](#m-initPattern-6928d503a051)
- [initRanges(int)](#m-initRanges-d04c09762bd6)
- [setInvertMatch(boolean)](#m-setInvertMatch-e00cbbce7115)
- [setPattern(Reader)](#m-setPattern-e1a344734fbf)
- [setPattern(String)](#m-setPattern-15104080a7b1)
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
public final com.tailf.ncs.maapi.Schema.CsTypeString.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getInvertMatch() <a href="#m-getInvertMatch-323126ccbf2f" id="m-getInvertMatch-323126ccbf2f"></a>

```java
public final boolean getInvertMatch()
```

### getPattern() <a href="#m-getPattern-b471c55bbd3b" id="m-getPattern-b471c55bbd3b"></a>

```java
public final org.capnproto.Text.Builder getPattern()
```

### getRanges() <a href="#m-getRanges-c1cd383e54a0" id="m-getRanges-c1cd383e54a0"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> getRanges()
```

Types: [Builder](../Range/Builder.md#cls-Builder)

### hasPattern() <a href="#m-hasPattern-e3fe48944019" id="m-hasPattern-e3fe48944019"></a>

```java
public final boolean hasPattern()
```

### hasRanges() <a href="#m-hasRanges-77bc63fe4ea8" id="m-hasRanges-77bc63fe4ea8"></a>

```java
public final boolean hasRanges()
```

### initPattern(int) <a href="#m-initPattern-6928d503a051" id="m-initPattern-6928d503a051"></a>

```java
public final org.capnproto.Text.Builder initPattern(int size)
```

**Parameters**

- `int size`

### initRanges(int) <a href="#m-initRanges-d04c09762bd6" id="m-initRanges-d04c09762bd6"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> initRanges(
    int size
)
```

Types: [Builder](../Range/Builder.md#cls-Builder)

**Parameters**

- `int size`

### setInvertMatch(boolean) <a href="#m-setInvertMatch-e00cbbce7115" id="m-setInvertMatch-e00cbbce7115"></a>

```java
public final void setInvertMatch(boolean value)
```

**Parameters**

- `boolean value`

### setPattern(Reader) <a href="#m-setPattern-e1a344734fbf" id="m-setPattern-e1a344734fbf"></a>

```java
public final void setPattern(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setPattern(String) <a href="#m-setPattern-15104080a7b1" id="m-setPattern-15104080a7b1"></a>

```java
public final void setPattern(String value)
```

**Parameters**

- `String value`

### setRanges(Reader<Reader>) <a href="#m-setRanges-69bbcdb47f71" id="m-setRanges-69bbcdb47f71"></a>

```java
public final void setRanges(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value
)
```

Types: [Reader](../Range/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value`
