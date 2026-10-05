<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.MountPoint.Builder
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
- [getPath()](#s-getPath)
- [getPathHash()](#s-getPathHash)
- [hasEntries()](#s-hasEntries)
- [hasPath()](#s-hasPath)
- [initEntries(int)](#s-initEntries)
- [initPath(int)](#s-initPath)
- [setEntries(Reader<Reader>)](#s-setEntries)
- [setNsHash(int)](#s-setNsHash)
- [setPath(Reader<Reader>)](#s-setPath)
- [setPathHash(int)](#s-setPathHash)

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
public final com.tailf.ncs.maapi.Schema.MountPoint.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getEntries"></a>
### getEntries()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MountPointChildren.Builder> getEntries()
```

Types: [Builder](../MountPointChildren/Builder.md#s-Builder)

<a id="s-getNsHash"></a>
### getNsHash()

```java
public final int getNsHash()
```

<a id="s-getPath"></a>
### getPath()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getPath()
```

Types: [Builder](../QTag/Builder.md#s-Builder)

<a id="s-getPathHash"></a>
### getPathHash()

```java
public final int getPathHash()
```

<a id="s-hasEntries"></a>
### hasEntries()

```java
public final boolean hasEntries()
```

<a id="s-hasPath"></a>
### hasPath()

```java
public final boolean hasPath()
```

<a id="s-initEntries"></a>
### initEntries(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.MountPointChildren.Builder> initEntries(
    int size
)
```

Types: [Builder](../MountPointChildren/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-initPath"></a>
### initPath(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initPath(
    int size
)
```

Types: [Builder](../QTag/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-setEntries"></a>
### setEntries(Reader<Reader>)

```java
public final void setEntries(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> value
)
```

Types: [Reader](../MountPointChildren/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.MountPointChildren.Reader> value`

<a id="s-setNsHash"></a>
### setNsHash(int)

```java
public final void setNsHash(int value)
```

**Parameters**

- `int value`

<a id="s-setPath"></a>
### setPath(Reader<Reader>)

```java
public final void setPath(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

<a id="s-setPathHash"></a>
### setPathHash(int)

```java
public final void setPathHash(int value)
```

**Parameters**

- `int value`
