<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getEntries()](#m-getentries-f554b7f62e3d)
- [getNsHash()](#m-getnshash-f6f3e3ae1e6b)
- [getPath()](#m-getpath-88fb21895561)
- [getPathHash()](#m-getpathhash-14d7d9222b28)
- [hasEntries()](#m-hasentries-ccf5edf194a9)
- [hasPath()](#m-haspath-c0f486b47df7)
- [initEntries(int)](#m-initentries-f2a53bc0911b)
- [initPath(int)](#m-initpath-efcaee2c9a10)
- [setEntries(Reader<Reader>)](#m-setentries-65d42e9eb737)
- [setNsHash(int)](#m-setnshash-856e3c88b24a)
- [setPath(Reader<Reader>)](#m-setpath-3ceb96b4eeae)
- [setPathHash(int)](#m-setpathhash-5447341695d9)

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
public final com.tailf.ncs.maapi.Schema.MountPoint.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getentries-f554b7f62e3d"></a>
### getEntries()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MountPointChildren.Builder> getEntries()
```

Types: [Builder](../MountPointChildren/Builder.md#cls-Builder)

<a id="m-getnshash-f6f3e3ae1e6b"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="m-getpath-88fb21895561"></a>
### getPath()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getPath()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

<a id="m-getpathhash-14d7d9222b28"></a>
### getPathHash()

```java
public final int getPathHash()
```

<a id="m-hasentries-ccf5edf194a9"></a>
### hasEntries()

```java
public final boolean hasEntries()
```

<a id="m-haspath-c0f486b47df7"></a>
### hasPath()

```java
public final boolean hasPath()
```

<a id="m-initentries-f2a53bc0911b"></a>
### initEntries(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MountPointChildren.Builder> initEntries(
    int size
)
```

Types: [Builder](../MountPointChildren/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-initpath-efcaee2c9a10"></a>
### initPath(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initPath(
    int size
)
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-setentries-65d42e9eb737"></a>
### setEntries(Reader<Reader>)

```java
public final void setEntries(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> value
)
```

Types: [Reader](../MountPointChildren/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> value`

<a id="m-setnshash-856e3c88b24a"></a>
### setNsHash(int)

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

<a id="m-setpath-3ceb96b4eeae"></a>
### setPath(Reader<Reader>)

```java
public final void setPath(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

<a id="m-setpathhash-5447341695d9"></a>
### setPathHash(int)

```java
public final void setPathHash(int value)
```

**Parameters**

- `int value`
