<a id="s-Factory"></a>
# Factory

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Factory
    extends org.capnproto.StructFactory<com.tailf.ncs.maapi.Schema.Cs.Builder,com.tailf.ncs.maapi.Schema.Cs.Reader>
```

Types: [Builder](Builder.md#s-Builder), [Reader](Reader.md#s-Reader)

## Members

**Constructors**:

- [Factory()](#s-Factory-1)

**Methods**:

- [asReader()](Builder.md#s-asReader) from Builder
- [asReader(Builder)](#s-asReader)
- [constructBuilder(SegmentBuilder, int, int, int, short)](#s-constructBuilder)
- [constructReader(SegmentReader, int, int, int, short, int)](#s-constructReader)
- [getChoices()](Builder.md#s-getChoices) from Builder
- [getCmp()](Builder.md#s-getCmp) from Builder
- [getDefval()](Builder.md#s-getDefval) from Builder
- [getDocDescription()](Builder.md#s-getDocDescription) from Builder
- [getFlags()](Builder.md#s-getFlags) from Builder
- [getHideGroups()](Builder.md#s-getHideGroups) from Builder
- [getKeys()](Builder.md#s-getKeys) from Builder
- [getMaxOccur()](Builder.md#s-getMaxOccur) from Builder
- [getMeta()](Builder.md#s-getMeta) from Builder
- [getMinOccur()](Builder.md#s-getMinOccur) from Builder
- [getMountId()](Builder.md#s-getMountId) from Builder
- [getPrompt()](Builder.md#s-getPrompt) from Builder
- [getShallowType()](Builder.md#s-getShallowType) from Builder
- [getType()](Builder.md#s-getType) from Builder
- [initChoices()](Builder.md#s-initChoices) from Builder
- [initDefval()](Builder.md#s-initDefval) from Builder
- [initDocDescription()](Builder.md#s-initDocDescription) from Builder
- [initHideGroups()](Builder.md#s-initHideGroups) from Builder
- [initKeys()](Builder.md#s-initKeys) from Builder
- [initMeta()](Builder.md#s-initMeta) from Builder
- [initMountId()](Builder.md#s-initMountId) from Builder
- [initPrompt()](Builder.md#s-initPrompt) from Builder
- [initType()](Builder.md#s-initType) from Builder
- [setCmp(Cmp)](Builder.md#s-setCmp) from Builder
- [setFlags(int)](Builder.md#s-setFlags) from Builder
- [setMaxOccur(int)](Builder.md#s-setMaxOccur) from Builder
- [setMinOccur(int)](Builder.md#s-setMinOccur) from Builder
- [setShallowType(ShallowType)](Builder.md#s-setShallowType) from Builder
- [setType(Reader)](Builder.md#s-setType) from Builder
- [structSize()](#s-structSize)

## Constructors

<a id="s-Factory-1"></a>
### Factory()

```java
public Factory()
```


## Methods

<a id="s-asReader"></a>
### asReader(Builder)

```java
public final com.tailf.ncs.maapi.Schema.Cs.Reader asReader(
    com.tailf.ncs.maapi.Schema.Cs.Builder builder
)
```

Types: [Reader](Reader.md#s-Reader), [Builder](Builder.md#s-Builder)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cs.Builder builder`

<a id="s-constructBuilder"></a>
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

Types: [Builder](Builder.md#s-Builder)

**Parameters**

- `org.capnproto.SegmentBuilder segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`

<a id="s-constructReader"></a>
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

Types: [Reader](Reader.md#s-Reader)

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`

<a id="s-structSize"></a>
### structSize()

```java
public final org.capnproto.StructSize structSize()
```
