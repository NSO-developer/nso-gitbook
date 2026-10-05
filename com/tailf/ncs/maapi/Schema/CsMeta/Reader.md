<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getKey()](#m-getkey-9a8856159458)
- [getValue()](#m-getvalue-d93864668c40)
- [hasKey()](#m-haskey-feb6e0de2bc0)

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

<a id="m-getkey-9a8856159458"></a>
### getKey()

```java
public org.capnproto.Text.Reader getKey()
```

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader getValue()
```

Types: [Reader](Value/Reader.md#cls-Reader)

<a id="m-haskey-feb6e0de2bc0"></a>
### hasKey()

```java
public boolean hasKey()
```
