<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.CsCase.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getChoices()](#s-getChoices)
- [getHns()](#s-getHns)
- [getHtag()](#s-getHtag)
- [getNodes()](#s-getNodes)
- [hasChoices()](#s-hasChoices)
- [hasNodes()](#s-hasNodes)

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

<a id="s-getChoices"></a>
### getChoices()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> getChoices()
```

Types: [Reader](../CsChoice/Reader.md#s-Reader)

<a id="s-getHns"></a>
### getHns()

```java
public final int getHns()
```

<a id="s-getHtag"></a>
### getHtag()

```java
public final int getHtag()
```

<a id="s-getNodes"></a>
### getNodes()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> getNodes()
```

Types: [Reader](../QTag/Reader.md#s-Reader)

<a id="s-hasChoices"></a>
### hasChoices()

```java
public final boolean hasChoices()
```

<a id="s-hasNodes"></a>
### hasNodes()

```java
public final boolean hasNodes()
```
