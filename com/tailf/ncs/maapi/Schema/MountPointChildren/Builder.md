<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.MountPointChildren.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getChildren()](#m-getchildren-fe2038dff10d)
- [getMountId()](#m-getmountid-c5175827f949)
- [hasChildren()](#m-haschildren-94c463ee6541)
- [initChildren(int)](#m-initchildren-d6b9d98b47bb)
- [initMountId()](#m-initmountid-43348a54995c)
- [setChildren(Reader<Reader>)](#m-setchildren-4b50d7817058)
- [setMountId(Reader)](#m-setmountid-39bac54ac962)

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
public final com.tailf.ncs.maapi.Schema.MountPointChildren.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getchildren-fe2038dff10d"></a>
### getChildren()

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getChildren()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

<a id="m-getmountid-c5175827f949"></a>
### getMountId()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getMountId()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

<a id="m-haschildren-94c463ee6541"></a>
### hasChildren()

```java
public final boolean hasChildren()
```

<a id="m-initchildren-d6b9d98b47bb"></a>
### initChildren(int)

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initChildren(
    int size
)
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

**Parameters**

- `int size`

<a id="m-initmountid-43348a54995c"></a>
### initMountId()

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initMountId()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

<a id="m-setchildren-4b50d7817058"></a>
### setChildren(Reader<Reader>)

```java
public final void setChildren(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

<a id="m-setmountid-39bac54ac962"></a>
### setMountId(Reader)

```java
public final void setMountId(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`
