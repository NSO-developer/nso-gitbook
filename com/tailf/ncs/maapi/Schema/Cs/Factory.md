<a id="cls-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.Cs.Builder,com.tailf.ncs.maapi.Schema.Cs.Reader>
```

Types: [Builder](Builder.md#cls-Builder), [Reader](Reader.md#cls-Reader)

## Members

**Constructors**:

- [Factory()](#m-factory-0e9f9d7f4e84)

**Methods**:

- [asReader()](Builder.md#m-asreader-b5c0f2a8d115) from Builder
- [asReader(Builder)](#m-asreader-838901f93707)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#m-constructbuilder-5a2abf3209f9)
- [constructReader(SegmentReader, int, int, int, short, int)](#m-constructreader-fbce6f4f912a)
- [getChoices()](Builder.md#m-getchoices-818fb3fccb86) from Builder
- [getCmp()](Builder.md#m-getcmp-a9e8116d77d2) from Builder
- [getDefval()](Builder.md#m-getdefval-561ad5494c47) from Builder
- [getDocDescription()](Builder.md#m-getdocdescription-08369bbe26a9) from Builder
- [getFlags()](Builder.md#m-getflags-3c1ca90fd29c) from Builder
- [getHideGroups()](Builder.md#m-gethidegroups-d566f1e3343e) from Builder
- [getKeys()](Builder.md#m-getkeys-a24b9d377db7) from Builder
- [getMaxOccur()](Builder.md#m-getmaxoccur-b4cb09a89559) from Builder
- [getMeta()](Builder.md#m-getmeta-33b809b5c0be) from Builder
- [getMinOccur()](Builder.md#m-getminoccur-da22ee8b4e31) from Builder
- [getMountId()](Builder.md#m-getmountid-c5175827f949) from Builder
- [getPrompt()](Builder.md#m-getprompt-6a58866a8699) from Builder
- [getShallowType()](Builder.md#m-getshallowtype-2e2b5f294983) from Builder
- [getType()](Builder.md#m-gettype-5a52f6f0d4c1) from Builder
- [initChoices()](Builder.md#m-initchoices-bd85acba2a40) from Builder
- [initDefval()](Builder.md#m-initdefval-fc211401cea7) from Builder
- [initDocDescription()](Builder.md#m-initdocdescription-e02d1d7991d3) from Builder
- [initHideGroups()](Builder.md#m-inithidegroups-e73c27a1f3f0) from Builder
- [initKeys()](Builder.md#m-initkeys-dbb1fee285c0) from Builder
- [initMeta()](Builder.md#m-initmeta-38c9843af893) from Builder
- [initMountId()](Builder.md#m-initmountid-43348a54995c) from Builder
- [initPrompt()](Builder.md#m-initprompt-e179e0cffc11) from Builder
- [initType()](Builder.md#m-inittype-9d8086c9965a) from Builder
- [setCmp(Cmp)](Builder.md#m-setcmp-7cb263b886c7) from Builder
- [setFlags(int)](Builder.md#m-setflags-ce4598e4465c) from Builder
- [setMaxOccur(int)](Builder.md#m-setmaxoccur-6939fed85b4a) from Builder
- [setMinOccur(int)](Builder.md#m-setminoccur-e8ca05aa5cf6) from Builder
- [setShallowType(ShallowType)](Builder.md#m-setshallowtype-d21ce22018e7) from Builder
- [setType(Reader)](Builder.md#m-settype-b1128ee37ec1) from Builder
- [structSize()](#m-structsize-1fa68dcadd21)

## Constructors

<a id="m-factory-0e9f9d7f4e84"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="m-asreader-838901f93707"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.Cs.Reader asReader(
    com.tailf.ncs.maapi.Schema.Cs.Builder builder
)
```

Types: [Reader](Reader.md#cls-Reader), [Builder](Builder.md#cls-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cs.Builder builder`

<a id="m-constructbuilder-5a2abf3209f9"></a>
### constructBuilder(SegmentBuilder, int, int, int, short)

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

<a id="m-constructreader-fbce6f4f912a"></a>
### constructReader(SegmentReader, int, int, int, short, int)

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

<a id="m-structsize-1fa68dcadd21"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
