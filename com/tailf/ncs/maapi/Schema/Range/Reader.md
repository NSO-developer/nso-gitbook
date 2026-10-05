# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Range.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

- [getFlags()](#getflags-3c1ca90fd29c)
- [getHi()](#gethi-f8fa4dcfe431)
- [getLo()](#getlo-bfe1c987d87a)
- [hasHi()](#hashi-5d9a1cd214ca)
- [hasLo()](#haslo-5c413cde5b09)

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

### getFlags() <a href="#getflags-3c1ca90fd29c" id="getflags-3c1ca90fd29c"></a>

```java
public final byte getFlags()
```

### getHi() <a href="#gethi-f8fa4dcfe431" id="gethi-f8fa4dcfe431"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getHi()
```

Types: [Reader](../CsValue/Reader.md#reader-b2467a96ddff)

### getLo() <a href="#getlo-bfe1c987d87a" id="getlo-bfe1c987d87a"></a>

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getLo()
```

Types: [Reader](../CsValue/Reader.md#reader-b2467a96ddff)

### hasHi() <a href="#hashi-5d9a1cd214ca" id="hashi-5d9a1cd214ca"></a>

```java
public boolean hasHi()
```

### hasLo() <a href="#haslo-5c413cde5b09" id="haslo-5c413cde5b09"></a>

```java
public boolean hasLo()
```
