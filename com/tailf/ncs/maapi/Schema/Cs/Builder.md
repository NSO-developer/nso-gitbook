<a id="s-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Builder
    extends org.capnproto.StructBuilder
```

**Related classes**

- [Factory](Factory.md#s-Factory)

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#s-Builder-1)

**Methods**:

- [asReader()](#s-asReader)
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
- [initChoices()](#s-initChoices)
- [initDefval()](#s-initDefval)
- [initDocDescription()](#s-initDocDescription)
- [initHideGroups()](#s-initHideGroups)
- [initKeys()](#s-initKeys)
- [initMeta()](#s-initMeta)
- [initMountId()](#s-initMountId)
- [initPrompt()](#s-initPrompt)
- [initType()](#s-initType)
- [setCmp(Cmp)](#s-setCmp)
- [setFlags(int)](#s-setFlags)
- [setMaxOccur(int)](#s-setMaxOccur)
- [setMinOccur(int)](#s-setMinOccur)
- [setShallowType(ShallowType)](#s-setShallowType)
- [setType(Reader)](#s-setType)

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
public final com.tailf.ncs.maapi.Schema.Cs.Reader asReader()
```

Types: [Reader](Reader.md#s-Reader)

<a id="s-getChoices"></a>
### getChoices()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Builder getChoices()
```

Types: [Builder](Choices/Builder.md#s-Builder)

<a id="s-getCmp"></a>
### getCmp()

```java
public final com.tailf.ncs.maapi.Schema.Cmp getCmp()
```

Types: [Cmp](../Cmp.md#s-Cmp)

<a id="s-getDefval"></a>
### getDefval()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Defval.Builder getDefval()
```

Types: [Builder](Defval/Builder.md#s-Builder)

<a id="s-getDocDescription"></a>
### getDocDescription()

```java
public final com.tailf.ncs.maapi.Schema.Cs.DocDescription.Builder getDocDescription()
```

Types: [Builder](DocDescription/Builder.md#s-Builder)

<a id="s-getFlags"></a>
### getFlags()

```java
public final int getFlags()
```

<a id="s-getHideGroups"></a>
### getHideGroups()

```java
public final com.tailf.ncs.maapi.Schema.Cs.HideGroups.Builder getHideGroups()
```

Types: [Builder](HideGroups/Builder.md#s-Builder)

<a id="s-getKeys"></a>
### getKeys()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Keys.Builder getKeys()
```

Types: [Builder](Keys/Builder.md#s-Builder)

<a id="s-getMaxOccur"></a>
### getMaxOccur()

```java
public final int getMaxOccur()
```

<a id="s-getMeta"></a>
### getMeta()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Builder getMeta()
```

Types: [Builder](Meta/Builder.md#s-Builder)

<a id="s-getMinOccur"></a>
### getMinOccur()

```java
public final int getMinOccur()
```

<a id="s-getMountId"></a>
### getMountId()

```java
public final com.tailf.ncs.maapi.Schema.Cs.MountId.Builder getMountId()
```

Types: [Builder](MountId/Builder.md#s-Builder)

<a id="s-getPrompt"></a>
### getPrompt()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder getPrompt()
```

Types: [Builder](Prompt/Builder.md#s-Builder)

<a id="s-getShallowType"></a>
### getShallowType()

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#s-ShallowType)

<a id="s-getType"></a>
### getType()

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder getType()
```

Types: [Builder](../CsType/Builder.md#s-Builder)

<a id="s-initChoices"></a>
### initChoices()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Builder initChoices()
```

Types: [Builder](Choices/Builder.md#s-Builder)

<a id="s-initDefval"></a>
### initDefval()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Defval.Builder initDefval()
```

Types: [Builder](Defval/Builder.md#s-Builder)

<a id="s-initDocDescription"></a>
### initDocDescription()

```java
public final com.tailf.ncs.maapi.Schema.Cs.DocDescription.Builder initDocDescription()
```

Types: [Builder](DocDescription/Builder.md#s-Builder)

<a id="s-initHideGroups"></a>
### initHideGroups()

```java
public final com.tailf.ncs.maapi.Schema.Cs.HideGroups.Builder initHideGroups()
```

Types: [Builder](HideGroups/Builder.md#s-Builder)

<a id="s-initKeys"></a>
### initKeys()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Keys.Builder initKeys()
```

Types: [Builder](Keys/Builder.md#s-Builder)

<a id="s-initMeta"></a>
### initMeta()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Builder initMeta()
```

Types: [Builder](Meta/Builder.md#s-Builder)

<a id="s-initMountId"></a>
### initMountId()

```java
public final com.tailf.ncs.maapi.Schema.Cs.MountId.Builder initMountId()
```

Types: [Builder](MountId/Builder.md#s-Builder)

<a id="s-initPrompt"></a>
### initPrompt()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder initPrompt()
```

Types: [Builder](Prompt/Builder.md#s-Builder)

<a id="s-initType"></a>
### initType()

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder initType()
```

Types: [Builder](../CsType/Builder.md#s-Builder)

<a id="s-setCmp"></a>
### setCmp(Cmp)

```java
public final void setCmp(com.tailf.ncs.maapi.Schema.Cmp value)
```

Types: [Cmp](../Cmp.md#s-Cmp)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cmp value`

<a id="s-setFlags"></a>
### setFlags(int)

```java
public final void setFlags(int value)
```

**Parameters**

- `int value`

<a id="s-setMaxOccur"></a>
### setMaxOccur(int)

```java
public final void setMaxOccur(int value)
```

**Parameters**

- `int value`

<a id="s-setMinOccur"></a>
### setMinOccur(int)

```java
public final void setMinOccur(int value)
```

**Parameters**

- `int value`

<a id="s-setShallowType"></a>
### setShallowType(ShallowType)

```java
public final void setShallowType(com.tailf.ncs.maapi.Schema.ShallowType value)
```

Types: [ShallowType](../ShallowType.md#s-ShallowType)

**Parameters**

- `com.tailf.ncs.maapi.Schema.ShallowType value`

<a id="s-setType"></a>
### setType(Reader)

```java
public final void setType(com.tailf.ncs.maapi.Schema.CsType.Reader value)
```

Types: [Reader](../CsType/Reader.md#s-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsType.Reader value`
