<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.Range.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getFlags()](#m-getflags-3c1ca90fd29c)
- [getHi()](#m-gethi-f8fa4dcfe431)
- [getLo()](#m-getlo-bfe1c987d87a)
- [hasHi()](#m-hashi-5d9a1cd214ca)
- [hasLo()](#m-haslo-5c413cde5b09)

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

<a id="m-getflags-3c1ca90fd29c"></a>
### getFlags()

```java
public final byte getFlags()
```

<a id="m-gethi-f8fa4dcfe431"></a>
### getHi()

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getHi()
```

Types: [Reader](../CsValue/Reader.md#cls-Reader)

<a id="m-getlo-bfe1c987d87a"></a>
### getLo()

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getLo()
```

Types: [Reader](../CsValue/Reader.md#cls-Reader)

<a id="m-hashi-5d9a1cd214ca"></a>
### hasHi()

```java
public boolean hasHi()
```

<a id="m-haslo-5c413cde5b09"></a>
### hasLo()

```java
public boolean hasLo()
```
