# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MNsMapDb.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getEntries\(\)](#getentries-f554b7f62e3d)
- [hasEntries\(\)](#hasentries-ccf5edf194a9)
- [initEntries\(int\)](#initentries-f2a53bc0911b)
- [setEntries\(Reader\<Reader\>\)](#setentries-fe9fadec9eeb)

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
public final com.tailf.ncs.maapi.Schema.MNsMapDb.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getEntries() <a href="#getentries-f554b7f62e3d" id="getentries-f554b7f62e3d"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMap.Builder> getEntries()
```

Types: [Builder](../MNsMap/Builder.md#builder-21f09e83781d)

### hasEntries() <a href="#hasentries-ccf5edf194a9" id="hasentries-ccf5edf194a9"></a>

```java
public final boolean hasEntries()
```

### initEntries(int) <a href="#initentries-f2a53bc0911b" id="initentries-f2a53bc0911b"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MNsMap.Builder> initEntries(
    int size
)
```

Types: [Builder](../MNsMap/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### setEntries(Reader&lt;Reader&gt;) <a href="#setentries-fe9fadec9eeb" id="setentries-fe9fadec9eeb"></a>

```java
public final void setEntries(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMap.Reader> value
)
```

Types: [Reader](../MNsMap/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MNsMap.Reader> value`
