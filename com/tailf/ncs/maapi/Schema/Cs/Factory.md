# Factory <a href="#factory-1787784624e8" id="factory-1787784624e8"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.Cs.Builder,com.tailf.ncs.maapi.Schema.Cs.Reader>
```

Types: [Builder](Builder.md#builder-21f09e83781d), [Reader](Reader.md#reader-b2467a96ddff)

## Members

**Constructors**:

- [Factory\(\)](#factory-0e9f9d7f4e84)

**Methods**:

- [asReader\(\)](Builder.md#asreader-b5c0f2a8d115) from Builder
- [asReader\(Builder\)](#asreader-838901f93707)
- [constructBuilder\(SegmentBuilder, int, int, int, short\)](#constructbuilder-5a2abf3209f9)
- [constructReader\(SegmentReader, int, int, int, short, int\)](#constructreader-fbce6f4f912a)
- [getChoices\(\)](Builder.md#getchoices-818fb3fccb86) from Builder
- [getCmp\(\)](Builder.md#getcmp-a9e8116d77d2) from Builder
- [getDefval\(\)](Builder.md#getdefval-561ad5494c47) from Builder
- [getDocDescription\(\)](Builder.md#getdocdescription-08369bbe26a9) from Builder
- [getFlags\(\)](Builder.md#getflags-3c1ca90fd29c) from Builder
- [getHideGroups\(\)](Builder.md#gethidegroups-d566f1e3343e) from Builder
- [getKeys\(\)](Builder.md#getkeys-a24b9d377db7) from Builder
- [getMaxOccur\(\)](Builder.md#getmaxoccur-b4cb09a89559) from Builder
- [getMeta\(\)](Builder.md#getmeta-33b809b5c0be) from Builder
- [getMinOccur\(\)](Builder.md#getminoccur-da22ee8b4e31) from Builder
- [getMountId\(\)](Builder.md#getmountid-c5175827f949) from Builder
- [getPrompt\(\)](Builder.md#getprompt-6a58866a8699) from Builder
- [getShallowType\(\)](Builder.md#getshallowtype-2e2b5f294983) from Builder
- [getType\(\)](Builder.md#gettype-5a52f6f0d4c1) from Builder
- [initChoices\(\)](Builder.md#initchoices-bd85acba2a40) from Builder
- [initDefval\(\)](Builder.md#initdefval-fc211401cea7) from Builder
- [initDocDescription\(\)](Builder.md#initdocdescription-e02d1d7991d3) from Builder
- [initHideGroups\(\)](Builder.md#inithidegroups-e73c27a1f3f0) from Builder
- [initKeys\(\)](Builder.md#initkeys-dbb1fee285c0) from Builder
- [initMeta\(\)](Builder.md#initmeta-38c9843af893) from Builder
- [initMountId\(\)](Builder.md#initmountid-43348a54995c) from Builder
- [initPrompt\(\)](Builder.md#initprompt-e179e0cffc11) from Builder
- [initType\(\)](Builder.md#inittype-9d8086c9965a) from Builder
- [setCmp\(Cmp\)](Builder.md#setcmp-7cb263b886c7) from Builder
- [setFlags\(int\)](Builder.md#setflags-ce4598e4465c) from Builder
- [setMaxOccur\(int\)](Builder.md#setmaxoccur-6939fed85b4a) from Builder
- [setMinOccur\(int\)](Builder.md#setminoccur-e8ca05aa5cf6) from Builder
- [setShallowType\(ShallowType\)](Builder.md#setshallowtype-d21ce22018e7) from Builder
- [setType\(Reader\)](Builder.md#settype-b1128ee37ec1) from Builder
- [structSize\(\)](#structsize-1fa68dcadd21)

## Constructors

### Factory() <a href="#factory-0e9f9d7f4e84" id="factory-0e9f9d7f4e84"></a>

```java
public Factory()
```


## Methods

### asReader(Builder) <a href="#asreader-838901f93707" id="asreader-838901f93707"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Reader asReader(
    com.tailf.ncs.maapi.Schema.Cs.Builder builder
)
```

Types: [Reader](Reader.md#reader-b2467a96ddff), [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cs.Builder builder`

### constructBuilder(SegmentBuilder, int, int, int, short) <a href="#constructbuilder-5a2abf3209f9" id="constructbuilder-5a2abf3209f9"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Builder constructBuilder(
    org.capnproto.SegmentBuilder segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount
)
```

Types: [Builder](Builder.md#builder-21f09e83781d)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

### constructReader(SegmentReader, int, int, int, short, int) <a href="#constructreader-fbce6f4f912a" id="constructreader-fbce6f4f912a"></a>

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

Types: [Reader](Reader.md#reader-b2467a96ddff)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

### structSize() <a href="#structsize-1fa68dcadd21" id="structsize-1fa68dcadd21"></a>

```java
public final org.capnproto.StructSize structSize()
```
