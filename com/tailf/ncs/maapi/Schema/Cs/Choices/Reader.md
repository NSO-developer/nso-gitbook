<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Choices.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getList()](#s-getList)
- [getNone()](#s-getNone)
- [hasList()](#s-hasList)
- [isList()](#s-isList)
- [isNone()](#s-isNone)
- [which()](#s-which)

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

<a id="s-getList"></a>
### getList()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> getList()
```

Types: [Reader](../../CsChoice/Reader.md#s-Reader)

<a id="s-getNone"></a>
### getNone()

```java
public final org.capnproto.Void getNone()
```

<a id="s-hasList"></a>
### hasList()

```java
public final boolean hasList()
```

<a id="s-isList"></a>
### isList()

```java
public final boolean isList()
```

<a id="s-isNone"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="s-which"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.Cs.Choices.Which which()
```

Types: [Which](Which.md#s-Which)
