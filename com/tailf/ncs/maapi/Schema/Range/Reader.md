<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.Range.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getFlags()](#s-getFlags)
- [getHi()](#s-getHi)
- [getLo()](#s-getLo)
- [hasHi()](#s-hasHi)
- [hasLo()](#s-hasLo)

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

<a id="s-getFlags"></a>
### getFlags()

```java
public final byte getFlags()
```

<a id="s-getHi"></a>
### getHi()

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getHi()
```

Types: [Reader](../CsValue/Reader.md#s-Reader)

<a id="s-getLo"></a>
### getLo()

```java
public com.tailf.ncs.maapi.Schema.CsValue.Reader getLo()
```

Types: [Reader](../CsValue/Reader.md#s-Reader)

<a id="s-hasHi"></a>
### hasHi()

```java
public boolean hasHi()
```

<a id="s-hasLo"></a>
### hasLo()

```java
public boolean hasLo()
```
