# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder\(SegmentBuilder, int, int, int, short\)](#builder-179fba5038bd)

**Methods**:

- [asReader\(\)](#asreader-b5c0f2a8d115)
- [getEntries\(\)](#getentries-f554b7f62e3d)
- [getNsHash\(\)](#getnshash-f6f3e3ae1e6b)
- [getPath\(\)](#getpath-88fb21895561)
- [getPathHash\(\)](#getpathhash-14d7d9222b28)
- [hasEntries\(\)](#hasentries-ccf5edf194a9)
- [hasPath\(\)](#haspath-c0f486b47df7)
- [initEntries\(int\)](#initentries-f2a53bc0911b)
- [initPath\(int\)](#initpath-efcaee2c9a10)
- [setEntries\(Reader\<Reader\>\)](#setentries-65d42e9eb737)
- [setNsHash\(int\)](#setnshash-856e3c88b24a)
- [setPath\(Reader\<Reader\>\)](#setpath-3ceb96b4eeae)
- [setPathHash\(int\)](#setpathhash-5447341695d9)

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
public final com.tailf.ncs.maapi.Schema.MountPoint.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getEntries() <a href="#getentries-f554b7f62e3d" id="getentries-f554b7f62e3d"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MountPointChildren.Builder> getEntries()
```

Types: [Builder](../MountPointChildren/Builder.md#builder-21f09e83781d)

### getNsHash() <a href="#getnshash-f6f3e3ae1e6b" id="getnshash-f6f3e3ae1e6b"></a>

```java
public final int getNsHash()
```

### getPath() <a href="#getpath-88fb21895561" id="getpath-88fb21895561"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getPath()
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

### getPathHash() <a href="#getpathhash-14d7d9222b28" id="getpathhash-14d7d9222b28"></a>

```java
public final int getPathHash()
```

### hasEntries() <a href="#hasentries-ccf5edf194a9" id="hasentries-ccf5edf194a9"></a>

```java
public final boolean hasEntries()
```

### hasPath() <a href="#haspath-c0f486b47df7" id="haspath-c0f486b47df7"></a>

```java
public final boolean hasPath()
```

### initEntries(int) <a href="#initentries-f2a53bc0911b" id="initentries-f2a53bc0911b"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MountPointChildren.Builder> initEntries(
    int size
)
```

Types: [Builder](../MountPointChildren/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### initPath(int) <a href="#initpath-efcaee2c9a10" id="initpath-efcaee2c9a10"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initPath(
    int size
)
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### setEntries(Reader&lt;Reader&gt;) <a href="#setentries-65d42e9eb737" id="setentries-65d42e9eb737"></a>

```java
public final void setEntries(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> value
)
```

Types: [Reader](../MountPointChildren/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> value`

### setNsHash(int) <a href="#setnshash-856e3c88b24a" id="setnshash-856e3c88b24a"></a>

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

### setPath(Reader&lt;Reader&gt;) <a href="#setpath-3ceb96b4eeae" id="setpath-3ceb96b4eeae"></a>

```java
public final void setPath(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

### setPathHash(int) <a href="#setpathhash-5447341695d9" id="setpathhash-5447341695d9"></a>

```java
public final void setPathHash(int value)
```

**Parameters**

- `int value`
