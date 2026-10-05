# Factory <a href="#cls-Factory" id="cls-Factory"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.Cs.Builder,com.tailf.ncs.maapi.Schema.Cs.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-Factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asReader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asReader-838901f93707)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructBuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructReader-fbce6f4f912a)
- [getChoices()](Builder.md#m-getChoices-818fb3fccb86) from Builder
- [getCmp()](Builder.md#m-getCmp-a9e8116d77d2) from Builder
- [getDefval()](Builder.md#m-getDefval-561ad5494c47) from Builder
- [getDocDescription()](Builder.md#m-getDocDescription-08369bbe26a9) from Builder
- [getFlags()](Builder.md#m-getFlags-3c1ca90fd29c) from Builder
- [getHideGroups()](Builder.md#m-getHideGroups-d566f1e3343e) from Builder
- [getKeys()](Builder.md#m-getKeys-a24b9d377db7) from Builder
- [getMaxOccur()](Builder.md#m-getMaxOccur-b4cb09a89559) from Builder
- [getMeta()](Builder.md#m-getMeta-33b809b5c0be) from Builder
- [getMinOccur()](Builder.md#m-getMinOccur-da22ee8b4e31) from Builder
- [getMountId()](Builder.md#m-getMountId-c5175827f949) from Builder
- [getPrompt()](Builder.md#m-getPrompt-6a58866a8699) from Builder
- [getShallowType()](Builder.md#m-getShallowType-2e2b5f294983) from Builder
- [getType()](Builder.md#m-getType-5a52f6f0d4c1) from Builder
- [initChoices()](Builder.md#m-initChoices-bd85acba2a40) from Builder
- [initDefval()](Builder.md#m-initDefval-fc211401cea7) from Builder
- [initDocDescription()](Builder.md#m-initDocDescription-e02d1d7991d3) from Builder
- [initHideGroups()](Builder.md#m-initHideGroups-e73c27a1f3f0) from Builder
- [initKeys()](Builder.md#m-initKeys-dbb1fee285c0) from Builder
- [initMeta()](Builder.md#m-initMeta-38c9843af893) from Builder
- [initMountId()](Builder.md#m-initMountId-43348a54995c) from Builder
- [initPrompt()](Builder.md#m-initPrompt-e179e0cffc11) from Builder
- [initType()](Builder.md#m-initType-9d8086c9965a) from Builder
- [setCmp(Cmp)](Builder.md#m-setCmp-7cb263b886c7) from Builder
- [setFlags(int)](Builder.md#m-setFlags-ce4598e4465c) from Builder
- [setMaxOccur(int)](Builder.md#m-setMaxOccur-6939fed85b4a) from Builder
- [setMinOccur(int)](Builder.md#m-setMinOccur-e8ca05aa5cf6) from Builder
- [setShallowType(ShallowType)](Builder.md#m-setShallowType-d21ce22018e7) from Builder
- [setType(Reader)](Builder.md#m-setType-b1128ee37ec1) from Builder
- [structSize()](#m-structSize-1fa68dcadd21)

## Constructors

### Factory() <a href="#m-Factory-0e9f9d7f4e84" id="m-Factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#m-asReader-838901f93707" id="m-asReader-838901f93707"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Reader asReader(
    com.tailf.ncs.maapi.Schema.Cs.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cs.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#m-constructBuilder-5a2abf3209f9" id="m-constructBuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Builder constructBuilder(
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

### constructReader(SegmentReader, int, int, int, short, int) <a href="#m-constructReader-fbce6f4f912a" id="m-constructReader-fbce6f4f912a"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Reader constructReader(
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

### structSize() <a href="#m-structSize-1fa68dcadd21" id="m-structSize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
