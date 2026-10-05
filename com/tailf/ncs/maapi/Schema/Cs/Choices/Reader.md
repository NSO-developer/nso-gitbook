<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Choices.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

- [getList()](#m-getlist-bb3f8cbe83be)
- [getNone()](#m-getnone-e31bfdbffa7f)
- [hasList()](#m-haslist-3712d7ce73ac)
- [isList()](#m-islist-c36bce63b506)
- [isNone()](#m-isnone-e8a993ad0453)
- [which()](#m-which-0b2d23db5ed0)

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

<a id="m-getlist-bb3f8cbe83be"></a>
### getList()

```java
public final org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsChoice.Reader> getList()
```

Types: [Reader](../../CsChoice/Reader.md#cls-Reader)

<a id="m-getnone-e31bfdbffa7f"></a>
### getNone()

```java
public final org.capnproto.Void getNone()
```

<a id="m-haslist-3712d7ce73ac"></a>
### hasList()

```java
public final boolean hasList()
```

<a id="m-islist-c36bce63b506"></a>
### isList()

```java
public final boolean isList()
```

<a id="m-isnone-e8a993ad0453"></a>
### isNone()

```java
public final boolean isNone()
```

<a id="m-which-0b2d23db5ed0"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.Cs.Choices.Which which()
```

Types: [Which](Which.md#cls-Which)
