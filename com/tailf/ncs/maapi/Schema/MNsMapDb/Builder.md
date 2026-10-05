# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapDb.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getEntries()](#m-getEntries-f554b7f62e3d)
- [hasEntries()](#m-hasEntries-ccf5edf194a9)
- [initEntries(int)](#m-initEntries-f2a53bc0911b)
- [setEntries(Reader<Reader>)](#m-setEntries-fe9fadec9eeb)

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
public final com.tailf.ncs.maapi.Schema.MNsMapDb.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getEntries() <a href="#m-getEntries-f554b7f62e3d" id="m-getEntries-f554b7f62e3d"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMap.Builder> getEntries()
```

Types: [Builder](../MNsMap/Builder.md#cls-Builder)

### hasEntries() <a href="#m-hasEntries-ccf5edf194a9" id="m-hasEntries-ccf5edf194a9"></a>

```java
public final boolean hasEntries()
```

### initEntries(int) <a href="#m-initEntries-f2a53bc0911b" id="m-initEntries-f2a53bc0911b"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMap.Builder> initEntries(
    int size
)
```

Types: [Builder](../MNsMap/Builder.md#cls-Builder)

**Parameters**

- `int size`

### setEntries(Reader<Reader>) <a href="#m-setEntries-fe9fadec9eeb" id="m-setEntries-fe9fadec9eeb"></a>

```java
public final void setEntries(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMap.Reader> value
)
```

Types: [Reader](../MNsMap/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMap.Reader> value`
