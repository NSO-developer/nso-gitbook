# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMap.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getEntries()](#m-getEntries-f554b7f62e3d)
- [getNsHash()](#m-getNsHash-f6f3e3ae1e6b)
- [getTagHash()](#m-getTagHash-8f057919039c)
- [hasEntries()](#m-hasEntries-ccf5edf194a9)
- [initEntries(int)](#m-initEntries-f2a53bc0911b)
- [setEntries(Reader<Reader>)](#m-setEntries-edf21be99f7c)
- [setNsHash(int)](#m-setNsHash-856e3c88b24a)
- [setTagHash(int)](#m-setTagHash-0e9cfe2575f5)

## Constructors

### Builder(SegmentBuilder, int, int, int, short) <a href="#m-Builder-179fba5038bd" id="m-Builder-179fba5038bd"></a>

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

### asReader() <a href="#m-asReader-b5c0f2a8d115" id="m-asReader-b5c0f2a8d115"></a>

```java
public final com.tailf.ncs.maapi.Schema.MNsMap.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getEntries() <a href="#m-getEntries-f554b7f62e3d" id="m-getEntries-f554b7f62e3d"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder> getEntries()
```

Types: [Builder](../MNsMapEntry/Builder.md#cls-Builder)

### getNsHash() <a href="#m-getNsHash-f6f3e3ae1e6b" id="m-getNsHash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getTagHash() <a href="#m-getTagHash-8f057919039c" id="m-getTagHash-8f057919039c"></a>

```java
public final int getTagHash()
```

### hasEntries() <a href="#m-hasEntries-ccf5edf194a9" id="m-hasEntries-ccf5edf194a9"></a>

```java
public final boolean hasEntries()
```

### initEntries(int) <a href="#m-initEntries-f2a53bc0911b" id="m-initEntries-f2a53bc0911b"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMapEntry.Builder> initEntries(
    int size
)
```

Types: [Builder](../MNsMapEntry/Builder.md#cls-Builder)

**Parameters**

- `int size`

### setEntries(Reader<Reader>) <a href="#m-setEntries-edf21be99f7c" id="m-setEntries-edf21be99f7c"></a>

```java
public final void setEntries(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> value
)
```

Types: [Reader](../MNsMapEntry/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMapEntry.Reader> value`

### setNsHash(int) <a href="#m-setNsHash-856e3c88b24a" id="m-setNsHash-856e3c88b24a"></a>

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

### setTagHash(int) <a href="#m-setTagHash-0e9cfe2575f5" id="m-setTagHash-0e9cfe2575f5"></a>

```java
public final void setTagHash(int value)
```

**Parameters**

- `int value`
