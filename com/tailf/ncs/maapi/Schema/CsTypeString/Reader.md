# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeString.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getInvertMatch()](#getinvertmatch-323126ccbf2f)
- [getPattern()](#getpattern-b471c55bbd3b)
- [getRanges()](#getranges-c1cd383e54a0)
- [hasPattern()](#haspattern-e3fe48944019)
- [hasRanges()](#hasranges-77bc63fe4ea8)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#reader-cf5e962c3323" id="reader-cf5e962c3323"></a>

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

### getInvertMatch() <a href="#getinvertmatch-323126ccbf2f" id="getinvertmatch-323126ccbf2f"></a>

```java
public final boolean getInvertMatch()
```

### getPattern() <a href="#getpattern-b471c55bbd3b" id="getpattern-b471c55bbd3b"></a>

```java
public org.capnproto.Text.Reader getPattern()
```

### getRanges() <a href="#getranges-c1cd383e54a0" id="getranges-c1cd383e54a0"></a>

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.Range.Reader> getRanges()
```

Types: [Reader](../Range/Reader.md#reader-b2467a96ddff)

### hasPattern() <a href="#haspattern-e3fe48944019" id="haspattern-e3fe48944019"></a>

```java
public boolean hasPattern()
```

### hasRanges() <a href="#hasranges-77bc63fe4ea8" id="hasranges-77bc63fe4ea8"></a>

```java
public final boolean hasRanges()
```
