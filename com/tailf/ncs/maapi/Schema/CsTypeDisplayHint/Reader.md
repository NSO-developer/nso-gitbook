<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsTypeDisplayHint.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getDisplayHint()](#s-getDisplayHint)
- [hasDisplayHint()](#s-hasDisplayHint)

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

<a id="s-getDisplayHint"></a>
### getDisplayHint()

```java
public org.capnproto.Data.Reader getDisplayHint()
```

<a id="s-hasDisplayHint"></a>
### hasDisplayHint()

```java
public boolean hasDisplayHint()
```
