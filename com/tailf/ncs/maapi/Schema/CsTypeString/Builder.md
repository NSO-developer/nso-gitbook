<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeString.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getInvertMatch()](#m-getinvertmatch-323126ccbf2f)
- [getPattern()](#m-getpattern-b471c55bbd3b)
- [getRanges()](#m-getranges-c1cd383e54a0)
- [hasPattern()](#m-haspattern-e3fe48944019)
- [hasRanges()](#m-hasranges-77bc63fe4ea8)
- [initPattern(int)](#m-initpattern-6928d503a051)
- [initRanges(int)](#m-initranges-d04c09762bd6)
- [setInvertMatch(boolean)](#m-setinvertmatch-e00cbbce7115)
- [setPattern(Reader)](#m-setpattern-e1a344734fbf)
- [setPattern(String)](#m-setpattern-15104080a7b1)
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
public final com.tailf.ncs.maapi.Schema.CsTypeString.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getinvertmatch-323126ccbf2f"></a>
### getInvertMatch()

```java
public final boolean getInvertMatch()
```

<a id="m-getpattern-b471c55bbd3b"></a>
### getPattern()

```java
public final org.capnproto.Text.Builder getPattern()
```

<a id="m-getranges-c1cd383e54a0"></a>
### getRanges()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> getRanges()
```

Types: [Builder](../Range/Builder.md#cls-Builder)

<a id="m-haspattern-e3fe48944019"></a>
### hasPattern()

```java
public final boolean hasPattern()
```

<a id="m-hasranges-77bc63fe4ea8"></a>
### hasRanges()

```java
public final boolean hasRanges()
```

<a id="m-initpattern-6928d503a051"></a>
### initPattern(int)

```java
public final org.capnproto.Text.Builder initPattern(int size)
```

**Parameters**

- `int size`

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

<a id="m-setinvertmatch-e00cbbce7115"></a>
### setInvertMatch(boolean)

```java
public final void setInvertMatch(boolean value)
```

**Parameters**

- `boolean value`

<a id="m-setpattern-e1a344734fbf"></a>
### setPattern(Reader)

```java
public final void setPattern(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

<a id="m-setpattern-15104080a7b1"></a>
### setPattern(String)

```java
public final void setPattern(String value)
```

**Parameters**

- `String value`

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
