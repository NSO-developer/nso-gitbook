<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsValueDecimal64.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getFractionDigits()](#m-getfractiondigits-57dce19c4ffe)
- [getValue()](#m-getvalue-d93864668c40)

## Constructors

<a id="m-reader-cf5e962c3323"></a>
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

<a id="m-getfractiondigits-57dce19c4ffe"></a>
### getFractionDigits()

```java
public final byte getFractionDigits()
```

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public final long getValue()
```
