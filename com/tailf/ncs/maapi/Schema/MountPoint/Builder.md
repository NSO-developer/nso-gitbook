# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getEntries()](#m-getEntries-f554b7f62e3d)
- [getNsHash()](#m-getNsHash-f6f3e3ae1e6b)
- [getPath()](#m-getPath-88fb21895561)
- [getPathHash()](#m-getPathHash-14d7d9222b28)
- [hasEntries()](#m-hasEntries-ccf5edf194a9)
- [hasPath()](#m-hasPath-c0f486b47df7)
- [initEntries(int)](#m-initEntries-f2a53bc0911b)
- [initPath(int)](#m-initPath-efcaee2c9a10)
- [setEntries(Reader<Reader>)](#m-setEntries-65d42e9eb737)
- [setNsHash(int)](#m-setNsHash-856e3c88b24a)
- [setPath(Reader<Reader>)](#m-setPath-3ceb96b4eeae)
- [setPathHash(int)](#m-setPathHash-5447341695d9)

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
public final com.tailf.ncs.maapi.Schema.MountPoint.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getEntries() <a href="#m-getEntries-f554b7f62e3d" id="m-getEntries-f554b7f62e3d"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MountPointChildren.Builder> getEntries()
```

Types: [Builder](../MountPointChildren/Builder.md#cls-Builder)

### getNsHash() <a href="#m-getNsHash-f6f3e3ae1e6b" id="m-getNsHash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getPath() <a href="#m-getPath-88fb21895561" id="m-getPath-88fb21895561"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getPath()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

### getPathHash() <a href="#m-getPathHash-14d7d9222b28" id="m-getPathHash-14d7d9222b28"></a>

```java
public final int getPathHash()
```

### hasEntries() <a href="#m-hasEntries-ccf5edf194a9" id="m-hasEntries-ccf5edf194a9"></a>

```java
public final boolean hasEntries()
```

### hasPath() <a href="#m-hasPath-c0f486b47df7" id="m-hasPath-c0f486b47df7"></a>

```java
public final boolean hasPath()
```

### initEntries(int) <a href="#m-initEntries-f2a53bc0911b" id="m-initEntries-f2a53bc0911b"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MountPointChildren.Builder> initEntries(
    int size
)
```

Types: [Builder](../MountPointChildren/Builder.md#cls-Builder)

**Parameters**

- `int size`

### initPath(int) <a href="#m-initPath-efcaee2c9a10" id="m-initPath-efcaee2c9a10"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initPath(
    int size
)
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

**Parameters**

- `int size`

### setEntries(Reader<Reader>) <a href="#m-setEntries-65d42e9eb737" id="m-setEntries-65d42e9eb737"></a>

```java
public final void setEntries(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> value
)
```

Types: [Reader](../MountPointChildren/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> value`

### setNsHash(int) <a href="#m-setNsHash-856e3c88b24a" id="m-setNsHash-856e3c88b24a"></a>

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

### setPath(Reader<Reader>) <a href="#m-setPath-3ceb96b4eeae" id="m-setPath-3ceb96b4eeae"></a>

```java
public final void setPath(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

### setPathHash(int) <a href="#m-setPathHash-5447341695d9" id="m-setPathHash-5447341695d9"></a>

```java
public final void setPathHash(int value)
```

**Parameters**

- `int value`
