# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMap.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getEntries()](#getentries-f554b7f62e3d)
- [getNsHash()](#getnshash-f6f3e3ae1e6b)
- [getTagHash()](#gettaghash-8f057919039c)
- [hasEntries()](#hasentries-ccf5edf194a9)
- [initEntries(int)](#initentries-f2a53bc0911b)
- [setEntries(Reader<Reader>)](#setentries-edf21be99f7c)
- [setNsHash(int)](#setnshash-856e3c88b24a)
- [setTagHash(int)](#settaghash-0e9cfe2575f5)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#builder-179fba5038bd" id="builder-179fba5038bd"></a>

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

### asReader() <a href="#asreader-b5c0f2a8d115" id="asreader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.MNsMap.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getEntries() <a href="#getentries-f554b7f62e3d" id="getentries-f554b7f62e3d"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder> getEntries()
```

Types: [Builder](../MNsMapEntry/Builder.md#builder-21f09e83781d)

### getNsHash() <a href="#getnshash-f6f3e3ae1e6b" id="getnshash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getTagHash() <a href="#gettaghash-8f057919039c" id="gettaghash-8f057919039c"></a>

```java
public final int getTagHash()
```

### hasEntries() <a href="#hasentries-ccf5edf194a9" id="hasentries-ccf5edf194a9"></a>

```java
public final boolean hasEntries()
```

### initEntries(int) <a href="#initentries-f2a53bc0911b" id="initentries-f2a53bc0911b"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder> initEntries(
    int size
)
```

Types: [Builder](../MNsMapEntry/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### setEntries(Reader&lt;Reader&gt;) <a href="#setentries-edf21be99f7c" id="setentries-edf21be99f7c"></a>

```java
public final void setEntries(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> value
)
```

Types: [Reader](../MNsMapEntry/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> value`

### setNsHash(int) <a href="#setnshash-856e3c88b24a" id="setnshash-856e3c88b24a"></a>

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

### setTagHash(int) <a href="#settaghash-0e9cfe2575f5" id="settaghash-0e9cfe2575f5"></a>

```java
public final void setTagHash(int value)
```

**Parameters**

- `int value`
