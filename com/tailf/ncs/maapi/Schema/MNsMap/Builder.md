<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMap.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getEntries()](#m-getentries-f554b7f62e3d)
- [getNsHash()](#m-getnshash-f6f3e3ae1e6b)
- [getTagHash()](#m-gettaghash-8f057919039c)
- [hasEntries()](#m-hasentries-ccf5edf194a9)
- [initEntries(int)](#m-initentries-f2a53bc0911b)
- [setEntries(Reader<Reader>)](#m-setentries-edf21be99f7c)
- [setNsHash(int)](#m-setnshash-856e3c88b24a)
- [setTagHash(int)](#m-settaghash-0e9cfe2575f5)

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
public final com.tailf.ncs.maapi.Schema.MNsMap.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getentries-f554b7f62e3d"></a>
### getEntries()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder> getEntries()
```

Types: [Builder](../MNsMapEntry/Builder.md#cls-Builder)

<a id="m-getnshash-f6f3e3ae1e6b"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="m-gettaghash-8f057919039c"></a>
### getTagHash()

```java
public final int getTagHash()
```

<a id="m-hasentries-ccf5edf194a9"></a>
### hasEntries()

```java
public final boolean hasEntries()
```

<a id="m-initentries-f2a53bc0911b"></a>
### initEntries(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder> initEntries(
    int size
)
```

Types: [Builder](../MNsMapEntry/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-setentries-edf21be99f7c"></a>
### setEntries(Reader<Reader>)

```java
public final void setEntries(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> value
)
```

Types: [Reader](../MNsMapEntry/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> value`

<a id="m-setnshash-856e3c88b24a"></a>
### setNsHash(int)

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

<a id="m-settaghash-0e9cfe2575f5"></a>
### setTagHash(int)

```java
public final void setTagHash(int value)
```

**Parameters**

- `int value`
