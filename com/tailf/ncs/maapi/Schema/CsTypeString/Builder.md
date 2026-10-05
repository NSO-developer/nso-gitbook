# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeString.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getInvertMatch()](#getinvertmatch-323126ccbf2f)
- [getPattern()](#getpattern-b471c55bbd3b)
- [getRanges()](#getranges-c1cd383e54a0)
- [hasPattern()](#haspattern-e3fe48944019)
- [hasRanges()](#hasranges-77bc63fe4ea8)
- [initPattern(int)](#initpattern-6928d503a051)
- [initRanges(int)](#initranges-d04c09762bd6)
- [setInvertMatch(boolean)](#setinvertmatch-e00cbbce7115)
- [setPattern(Reader)](#setpattern-e1a344734fbf)
- [setPattern(String)](#setpattern-15104080a7b1)
- [setRanges(Reader<Reader>)](#setranges-69bbcdb47f71)

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
public final com.tailf.ncs.maapi.Schema.CsTypeString.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getInvertMatch() <a href="#getinvertmatch-323126ccbf2f" id="getinvertmatch-323126ccbf2f"></a>

```java
public final boolean getInvertMatch()
```

### getPattern() <a href="#getpattern-b471c55bbd3b" id="getpattern-b471c55bbd3b"></a>

```java
public final org.capnproto.Text.Builder getPattern()
```

### getRanges() <a href="#getranges-c1cd383e54a0" id="getranges-c1cd383e54a0"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> getRanges()
```

Types: [Builder](../Range/Builder.md#builder-21f09e83781d)

### hasPattern() <a href="#haspattern-e3fe48944019" id="haspattern-e3fe48944019"></a>

```java
public final boolean hasPattern()
```

### hasRanges() <a href="#hasranges-77bc63fe4ea8" id="hasranges-77bc63fe4ea8"></a>

```java
public final boolean hasRanges()
```

### initPattern(int) <a href="#initpattern-6928d503a051" id="initpattern-6928d503a051"></a>

```java
public final org.capnproto.Text.Builder initPattern(int size)
```

**Parameters**

- `int size`

### initRanges(int) <a href="#initranges-d04c09762bd6" id="initranges-d04c09762bd6"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.Range.Builder> initRanges(
    int size
)
```

Types: [Builder](../Range/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### setInvertMatch(boolean) <a href="#setinvertmatch-e00cbbce7115" id="setinvertmatch-e00cbbce7115"></a>

```java
public final void setInvertMatch(boolean value)
```

**Parameters**

- `boolean value`

### setPattern(Reader) <a href="#setpattern-e1a344734fbf" id="setpattern-e1a344734fbf"></a>

```java
public final void setPattern(org.capnproto.Text.Reader value)
```

**Parameters**

- `org.capnproto.Text.Reader value`

### setPattern(String) <a href="#setpattern-15104080a7b1" id="setpattern-15104080a7b1"></a>

```java
public final void setPattern(String value)
```

**Parameters**

- `String value`

### setRanges(Reader&lt;Reader&gt;) <a href="#setranges-69bbcdb47f71" id="setranges-69bbcdb47f71"></a>

```java
public final void setRanges(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value
)
```

Types: [Reader](../Range/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> value`
