<a id="s-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#s-Reader-1)

**Methods**:

- [getChoices()](#s-getChoices)
- [getCmp()](#s-getCmp)
- [getDefval()](#s-getDefval)
- [getDocDescription()](#s-getDocDescription)
- [getFlags()](#s-getFlags)
- [getHideGroups()](#s-getHideGroups)
- [getKeys()](#s-getKeys)
- [getMaxOccur()](#s-getMaxOccur)
- [getMeta()](#s-getMeta)
- [getMinOccur()](#s-getMinOccur)
- [getMountId()](#s-getMountId)
- [getPrompt()](#s-getPrompt)
- [getShallowType()](#s-getShallowType)
- [getType()](#s-getType)
- [hasType()](#s-hasType)

## Constructors

<a id="s-Reader-1"></a>
### Reader(SegmentReader, int, int, int, short, int)

**Package-private**

```java
Reader(
    org.capnproto.SegmentReader segment,
    int data,
    int pointers,
    int dataSize,
    short pointerCount,
    int nestingLimit
)
```

**Parameters**

- `org.capnproto.SegmentReader segment`
- `int data`
- `int pointers`
- `int dataSize`
- `short pointerCount`
- `int nestingLimit`


## Methods

<a id="s-getChoices"></a>
### getChoices()

```java
public com.tailf.ncs.maapi.Schema.Cs.Choices.Reader getChoices()
```

Types: [Reader](Choices/Reader.md#s-Reader)

<a id="s-getCmp"></a>
### getCmp()

```java
public final com.tailf.ncs.maapi.Schema.Cmp getCmp()
```

Types: [Cmp](../Cmp.md#s-Cmp)

<a id="s-getDefval"></a>
### getDefval()

```java
public com.tailf.ncs.maapi.Schema.Cs.Defval.Reader getDefval()
```

Types: [Reader](Defval/Reader.md#s-Reader)

<a id="s-getDocDescription"></a>
### getDocDescription()

```java
public com.tailf.ncs.maapi.Schema.Cs.DocDescription.Reader getDocDescription()
```

Types: [Reader](DocDescription/Reader.md#s-Reader)

<a id="s-getFlags"></a>
### getFlags()

```java
public final int getFlags()
```

<a id="s-getHideGroups"></a>
### getHideGroups()

```java
public com.tailf.ncs.maapi.Schema.Cs.HideGroups.Reader getHideGroups()
```

Types: [Reader](HideGroups/Reader.md#s-Reader)

<a id="s-getKeys"></a>
### getKeys()

```java
public com.tailf.ncs.maapi.Schema.Cs.Keys.Reader getKeys()
```

Types: [Reader](Keys/Reader.md#s-Reader)

<a id="s-getMaxOccur"></a>
### getMaxOccur()

```java
public final int getMaxOccur()
```

<a id="s-getMeta"></a>
### getMeta()

```java
public com.tailf.ncs.maapi.Schema.Cs.Meta.Reader getMeta()
```

Types: [Reader](Meta/Reader.md#s-Reader)

<a id="s-getMinOccur"></a>
### getMinOccur()

```java
public final int getMinOccur()
```

<a id="s-getMountId"></a>
### getMountId()

```java
public com.tailf.ncs.maapi.Schema.Cs.MountId.Reader getMountId()
```

Types: [Reader](MountId/Reader.md#s-Reader)

<a id="s-getPrompt"></a>
### getPrompt()

```java
public com.tailf.ncs.maapi.Schema.Cs.Prompt.Reader getPrompt()
```

Types: [Reader](Prompt/Reader.md#s-Reader)

<a id="s-getShallowType"></a>
### getShallowType()

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#s-ShallowType)

<a id="s-getType"></a>
### getType()

```java
public com.tailf.ncs.maapi.Schema.CsType.Reader getType()
```

Types: [Reader](../CsType/Reader.md#s-Reader)

<a id="s-hasType"></a>
### hasType()

```java
public boolean hasType()
```
