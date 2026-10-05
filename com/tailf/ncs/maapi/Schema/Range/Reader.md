# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Range.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

- [getFlags()](#m-getFlags-3c1ca90fd29c)
- [getHi()](#m-getHi-f8fa4dcfe431)
- [getLo()](#m-getLo-bfe1c987d87a)
- [hasHi()](#m-hasHi-5d9a1cd214ca)
- [hasLo()](#m-hasLo-5c413cde5b09)

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

### getFlags() <a href="#m-getFlags-3c1ca90fd29c" id="m-getFlags-3c1ca90fd29c"></a>

```java
public final byte getFlags()
```

### getHi() <a href="#m-getHi-f8fa4dcfe431" id="m-getHi-f8fa4dcfe431"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getHi()
```

Types: [Reader](../CsValue/Reader.md#cls-Reader)

### getLo() <a href="#m-getLo-bfe1c987d87a" id="m-getLo-bfe1c987d87a"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getLo()
```

Types: [Reader](../CsValue/Reader.md#cls-Reader)

### hasHi() <a href="#m-hasHi-5d9a1cd214ca" id="m-hasHi-5d9a1cd214ca"></a>

```java
public boolean hasHi()
```

### hasLo() <a href="#m-hasLo-5c413cde5b09" id="m-hasLo-5c413cde5b09"></a>

```java
public boolean hasLo()
```
