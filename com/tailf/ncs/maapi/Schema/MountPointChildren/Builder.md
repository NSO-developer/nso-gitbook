# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MountPointChildren.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getChildren()](#m-getChildren-fe2038dff10d)
- [getMountId()](#m-getMountId-c5175827f949)
- [hasChildren()](#m-hasChildren-94c463ee6541)
- [initChildren(int)](#m-initChildren-d6b9d98b47bb)
- [initMountId()](#m-initMountId-43348a54995c)
- [setChildren(Reader<Reader>)](#m-setChildren-4b50d7817058)
- [setMountId(Reader)](#m-setMountId-39bac54ac962)

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
public final com.tailf.ncs.maapi.Schema.MountPointChildren.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getChildren() <a href="#m-getChildren-fe2038dff10d" id="m-getChildren-fe2038dff10d"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getChildren()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

### getMountId() <a href="#m-getMountId-c5175827f949" id="m-getMountId-c5175827f949"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getMountId()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

### hasChildren() <a href="#m-hasChildren-94c463ee6541" id="m-hasChildren-94c463ee6541"></a>

```java
public final boolean hasChildren()
```

### initChildren(int) <a href="#m-initChildren-d6b9d98b47bb" id="m-initChildren-d6b9d98b47bb"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initChildren(
    int size
)
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

**Parameters**

- `int size`

### initMountId() <a href="#m-initMountId-43348a54995c" id="m-initMountId-43348a54995c"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initMountId()
```

Types: [Builder](../QTag/Builder.md#cls-Builder)

### setChildren(Reader<Reader>) <a href="#m-setChildren-4b50d7817058" id="m-setChildren-4b50d7817058"></a>

```java
public final void setChildren(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

### setMountId(Reader) <a href="#m-setMountId-39bac54ac962" id="m-setMountId-39bac54ac962"></a>

```java
public final void setMountId(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`
