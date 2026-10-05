# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getKey()](#m-getKey-9a8856159458)
- [getValue()](#m-getValue-d93864668c40)
- [hasKey()](#m-hasKey-feb6e0de2bc0)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#m-Reader-cf5e962c3323" id="m-Reader-cf5e962c3323"></a>

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

### getKey() <a href="#m-getKey-9a8856159458" id="m-getKey-9a8856159458"></a>

```java
public org.capnproto.Text.Reader getKey()
```

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader getValue()
```

Types: [Reader](Value/Reader.md#cls-Reader)

### hasKey() <a href="#m-hasKey-feb6e0de2bc0" id="m-hasKey-feb6e0de2bc0"></a>

```java
public boolean hasKey()
```
