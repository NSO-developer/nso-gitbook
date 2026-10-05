# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.MountPointChildren.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getChildren()](#getchildren-fe2038dff10d)
- [getMountId()](#getmountid-c5175827f949)
- [hasChildren()](#haschildren-94c463ee6541)
- [initChildren(int)](#initchildren-d6b9d98b47bb)
- [initMountId()](#initmountid-43348a54995c)
- [setChildren(Reader<Reader>)](#setchildren-4b50d7817058)
- [setMountId(Reader)](#setmountid-39bac54ac962)

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
public final com.tailf.ncs.maapi.Schema.MountPointChildren.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getChildren() <a href="#getchildren-fe2038dff10d" id="getchildren-fe2038dff10d"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> getChildren()
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

### getMountId() <a href="#getmountid-c5175827f949" id="getmountid-c5175827f949"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder getMountId()
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

### hasChildren() <a href="#haschildren-94c463ee6541" id="haschildren-94c463ee6541"></a>

```java
public final boolean hasChildren()
```

### initChildren(int) <a href="#initchildren-d6b9d98b47bb" id="initchildren-d6b9d98b47bb"></a>

```java
public final org.capnproto.StructList.Builder<com.tailf.ncs.maapi.Schema.QTag.Builder> initChildren(
    int size
)
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

**Parameters**

- `int size`

### initMountId() <a href="#initmountid-43348a54995c" id="initmountid-43348a54995c"></a>

```java
public final com.tailf.ncs.maapi.Schema.QTag.Builder initMountId()
```

Types: [Builder](../QTag/Builder.md#builder-21f09e83781d)

### setChildren(Reader&lt;Reader&gt;) <a href="#setchildren-4b50d7817058" id="setchildren-4b50d7817058"></a>

```java
public final void setChildren(
    org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value
)
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.StructList.Reader<com.tailf.ncs.maapi.Schema.QTag.Reader> value`

### setMountId(Reader) <a href="#setmountid-39bac54ac962" id="setmountid-39bac54ac962"></a>

```java
public final void setMountId(com.tailf.ncs.maapi.Schema.QTag.Reader value)
```

Types: [Reader](../QTag/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.QTag.Reader value`
