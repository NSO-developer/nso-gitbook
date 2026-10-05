<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMap.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getEntries()](#s-getEntries)
- [getNsHash()](#s-getNsHash)
- [getTagHash()](#s-getTagHash)
- [hasEntries()](#s-hasEntries)
- [initEntries(int)](#s-initEntries)
- [setEntries(Reader<Reader>)](#s-setEntries)
- [setNsHash(int)](#s-setNsHash)
- [setTagHash(int)](#s-setTagHash)

## Constructors

<a id="s-Builder-1"></a>
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

<a id="s-asReader"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.MNsMap.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getEntries"></a>
### getEntries()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder> getEntries()
```

Types: [Builder](../MNsMapEntry/Builder.md#s-Builder)

<a id="s-getNsHash"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="s-getTagHash"></a>
### getTagHash()

```java
public final int getTagHash()
```

<a id="s-hasEntries"></a>
### hasEntries()

```java
public final boolean hasEntries()
```

<a id="s-initEntries"></a>
### initEntries(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder> initEntries(
    int size
)
```

Types: [Builder](../MNsMapEntry/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-setEntries"></a>
### setEntries(Reader<Reader>)

```java
public final void setEntries(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> value
)
```

Types: [Reader](../MNsMapEntry/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> value`

<a id="s-setNsHash"></a>
### setNsHash(int)

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

<a id="s-setTagHash"></a>
### setTagHash(int)

```java
public final void setTagHash(int value)
```

**Parameters**

- `int value`
