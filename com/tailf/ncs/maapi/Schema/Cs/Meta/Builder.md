<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Meta.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getList()](#m-getlist-bb3f8cbe83be)
- [getNone()](#m-getnone-e31bfdbffa7f)
- [hasList()](#m-haslist-3712d7ce73ac)
- [initList(int)](#m-initlist-619d59db076f)
- [isList()](#m-islist-c36bce63b506)
- [isNone()](#m-isnone-e8a993ad0453)
- [setList(Reader<Reader>)](#m-setlist-a943e0056004)
- [setNone(Void)](#m-setnone-46764db867d5)
- [which()](#m-which-0b2d23db5ed0)

## Constructors

<a id="m-builder-179fba5038bd"></a>
### Builder(SegmentBuilder, int, int, int, short)

**Package-private**

```java
Builder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`


## Methods

<a id="m-asreader-b5c0f2a8d115"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getlist-bb3f8cbe83be"></a>
### getList()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsMeta.Builder> getList()
```

Types: [Builder](../../CsMeta/Builder.md#cls-Builder)

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

<a id="m-initlist-619d59db076f"></a>
### initList(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.CsMeta.Builder> initList(
    int size
)
```

Types: [Builder](../../CsMeta/Builder.md#cls-Builder)

**Parameters**

- `int size`

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

<a id="m-setlist-a943e0056004"></a>
### setList(Reader<Reader>)

```java
public final void setList(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsMeta.Reader> value
)
```

Types: [Reader](../../CsMeta/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.CsMeta.Reader> value`

<a id="m-setnone-46764db867d5"></a>
### setNone(Void)

```java
public final void setNone(org.capnproto.Void value)
```

**Parameters**

- `org.capnproto.Void value`

<a id="m-which-0b2d23db5ed0"></a>
### which()

```java
public com.tailf.ncs.maapi.Schema.Cs.Meta.Which which()
```

Types: [Which](Which.md#cls-Which)
