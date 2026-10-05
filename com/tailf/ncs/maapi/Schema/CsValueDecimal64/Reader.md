<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getFractionDigits()](#s-getFractionDigits)
- [getValue()](#s-getValue)

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

<a id="s-getFractionDigits"></a>
### getFractionDigits()

```java
public final byte getFractionDigits()
```

<a id="s-getValue"></a>
### getValue()

```java
public final long getValue()
```
