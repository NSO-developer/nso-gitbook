<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.NsDb.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getEntries()](#m-getentries-f554b7f62e3d)
- [hasEntries()](#m-hasentries-ccf5edf194a9)
- [initEntries(int)](#m-initentries-f2a53bc0911b)
- [setEntries(Reader<Reader>)](#m-setentries-6549377e8c73)

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
public final com.tailf.ncs.maapi.Schema.NsDb.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getentries-f554b7f62e3d"></a>
### getEntries()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NsInfo.Builder> getEntries()
```

Types: [Builder](../NsInfo/Builder.md#cls-Builder)

<a id="m-hasentries-ccf5edf194a9"></a>
### hasEntries()

```java
public final boolean hasEntries()
```

<a id="m-initentries-f2a53bc0911b"></a>
### initEntries(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.NsInfo.Builder> initEntries(
    int size
)
```

Types: [Builder](../NsInfo/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-setentries-6549377e8c73"></a>
### setEntries(Reader<Reader>)

```java
public final void setEntries(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NsInfo.Reader> value
)
```

Types: [Reader](../NsInfo/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.NsInfo.Reader> value`
