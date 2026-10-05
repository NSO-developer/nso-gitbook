# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getKey()](#getkey-9a8856159458)
- [getValue()](#getvalue-d93864668c40)
- [hasKey()](#haskey-feb6e0de2bc0)

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

### getKey() <a href="#getkey-9a8856159458" id="getkey-9a8856159458"></a>

```java
public org.capnproto.Text.Reader getKey()
```

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader getValue()
```

Types: [Reader](Value/Reader.md#reader-b2467a96ddff)

### hasKey() <a href="#haskey-feb6e0de2bc0" id="haskey-feb6e0de2bc0"></a>

```java
public boolean hasKey()
```
