<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsMeta.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getKey()](#s-getKey)
- [getValue()](#s-getValue)
- [hasKey()](#s-hasKey)

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

<a id="s-getKey"></a>
### getKey()

```java
public org.capnproto.Text.Reader getKey()
```

<a id="s-getValue"></a>
### getValue()

```java
public com.tailf.ncs.maapi.Schema.CsMeta.Value.Reader getValue()
```

Types: [Reader](Value/Reader.md#s-Reader)

<a id="s-hasKey"></a>
### hasKey()

```java
public boolean hasKey()
```
