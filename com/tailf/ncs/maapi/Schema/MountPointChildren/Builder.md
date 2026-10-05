<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.MountPointChildren.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
- [getChildren()](#s-getChildren)
- [getMountId()](#s-getMountId)
- [hasChildren()](#s-hasChildren)
- [initChildren(int)](#s-initChildren)
- [initMountId()](#s-initMountId)
- [setChildren(Reader<Reader>)](#s-setChildren)
- [setMountId(Reader)](#s-setMountId)

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
public final com.tailf.ncs.maapi.Schema.MountPointChildren.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getChildren"></a>
### getChildren()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getChildren()
```

Types: [Builder](../QTag/Builder.md#s-Builder)

<a id="s-getMountId"></a>
### getMountId()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getMountId()
```

Types: [Builder](../QTag/Builder.md#s-Builder)

<a id="s-hasChildren"></a>
### hasChildren()

```java
public final boolean hasChildren()
```

<a id="s-initChildren"></a>
### initChildren(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initChildren(
    int size
)
```

Types: [Builder](../QTag/Builder.md#s-Builder)

**Parameters**

- `int size`

<a id="s-initMountId"></a>
### initMountId()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initMountId()
```

Types: [Builder](../QTag/Builder.md#s-Builder)

<a id="s-setChildren"></a>
### setChildren(Reader<Reader>)

```java
public final void setChildren(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#s-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

<a id="s-setMountId"></a>
### setMountId(Reader)

```java
public final void setMountId(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`
