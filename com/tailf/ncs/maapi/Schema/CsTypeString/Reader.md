<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeString.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getInvertMatch()](#s-getInvertMatch)
- [getPattern()](#s-getPattern)
- [getRanges()](#s-getRanges)
- [hasPattern()](#s-hasPattern)
- [hasRanges()](#s-hasRanges)

## Constructors

<a id="s-Reader-1"></a>
### Reader(SegmentReader, int, int, int, short, int)

**Package-private**

```java
Reader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`


## Methods

<a id="s-getInvertMatch"></a>
### getInvertMatch()

```java
public final boolean getInvertMatch()
```

<a id="s-getPattern"></a>
### getPattern()

```java
public org.capnproto.Text.Reader getPattern()
```

<a id="s-getRanges"></a>
### getRanges()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> getRanges()
```

Types: [Reader](../Range/Reader.md#s-Reader)

<a id="s-hasPattern"></a>
### hasPattern()

```java
public boolean hasPattern()
```

<a id="s-hasRanges"></a>
### hasRanges()

```java
public final boolean hasRanges()
```
