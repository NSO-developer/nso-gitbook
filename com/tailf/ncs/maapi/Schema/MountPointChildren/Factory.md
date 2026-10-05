<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.MountPointChildren.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.MountPointChildren.Builder,com.tailf.ncs.maapi.Schema.MountPointChildren.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-404ca8020a02)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getChildren()](Builder.md#m-getchildren-fe2038dff10d) from Builder
- [getMountId()](Builder.md#m-getmountid-c5175827f949) from Builder
- [hasChildren()](Builder.md#m-haschildren-94c463ee6541) from Builder
- [initChildren(int)](Builder.md#m-initchildren-d6b9d98b47bb) from Builder
- [initMountId()](Builder.md#m-initmountid-43348a54995c) from Builder
- [setChildren(Reader<Reader>)](Builder.md#m-setchildren-4b50d7817058) from Builder
- [setMountId(Reader)](Builder.md#m-setmountid-39bac54ac962) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-404ca8020a02"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.MountPointChildren.Reader asReader(
    com.tailf.ncs.maapi.Schema.MountPointChildren.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.MountPointChildren.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

```java
public final com.tailf.ncs.maapi.Schema.MountPointChildren.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#cls-Builder)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

```java
public final com.tailf.ncs.maapi.Schema.MountPointChildren.Reader constructReader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

Types: [Reader](Reader.md#cls-Reader)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
