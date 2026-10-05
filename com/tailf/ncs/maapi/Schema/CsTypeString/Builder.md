<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeString.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getInvertMatch()](#s-getInvertMatch)
- [getPattern()](#s-getPattern)
- [getRanges()](#s-getRanges)
- [hasPattern()](#s-hasPattern)
- [hasRanges()](#s-hasRanges)
- [initPattern(int)](#s-initPattern)
- [initRanges(int)](#s-initRanges)
- [setInvertMatch(boolean)](#s-setInvertMatch)
- [setPattern(Reader)](#s-setPattern)
- [setPattern(String)](#s-setPattern-1)
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
public final com.tailf.ncs.maapi.Schema.CsTypeString.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getInvertMatch"></a>
### getInvertMatch()

```java
public final boolean getInvertMatch()
```

<a id="s-getPattern"></a>
### getPattern()

```java
public final org.capnproto.Text.Builder getPattern()
```

<a id="s-getRanges"></a>
### getRanges()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> getRanges()
```

Types: [Builder](../Range/Builder.md#s-Builder)

<a id="s-hasPattern"></a>
### hasPattern()

```java
public final boolean hasPattern()
```

<a id="s-hasRanges"></a>
### hasRanges()

```java
public final boolean hasRanges()
```

<a id="s-initPattern"></a>
### initPattern(int)

```java
public final org.capnproto.Text.Builder initPattern(int size)
```

**Parameters**

- `int size`

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

<a id="s-setInvertMatch"></a>
### setInvertMatch(boolean)

```java
public final void setInvertMatch(boolean value)
```

**Parameters**

- `boolean value`

<a id="s-setPattern"></a>
### setPattern(Reader)

```java
public final void setPattern(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="s-setPattern-1"></a>
### setPattern(String)

```java
public final void setPattern(String value)
```

**Parameters**

- `String value`

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
