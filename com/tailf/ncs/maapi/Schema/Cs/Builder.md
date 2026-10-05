# Builder <a href="#cls-Builder" id="cls-Builder"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-Builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asReader-b5c0f2a8d115)
- [getChoices()](#m-getChoices-818fb3fccb86)
- [getCmp()](#m-getCmp-a9e8116d77d2)
- [getDefval()](#m-getDefval-561ad5494c47)
- [getDocDescription()](#m-getDocDescription-08369bbe26a9)
- [getFlags()](#m-getFlags-3c1ca90fd29c)
- [getHideGroups()](#m-getHideGroups-d566f1e3343e)
- [getKeys()](#m-getKeys-a24b9d377db7)
- [getMaxOccur()](#m-getMaxOccur-b4cb09a89559)
- [getMeta()](#m-getMeta-33b809b5c0be)
- [getMinOccur()](#m-getMinOccur-da22ee8b4e31)
- [getMountId()](#m-getMountId-c5175827f949)
- [getPrompt()](#m-getPrompt-6a58866a8699)
- [getShallowType()](#m-getShallowType-2e2b5f294983)
- [getType()](#m-getType-5a52f6f0d4c1)
- [initChoices()](#m-initChoices-bd85acba2a40)
- [initDefval()](#m-initDefval-fc211401cea7)
- [initDocDescription()](#m-initDocDescription-e02d1d7991d3)
- [initHideGroups()](#m-initHideGroups-e73c27a1f3f0)
- [initKeys()](#m-initKeys-dbb1fee285c0)
- [initMeta()](#m-initMeta-38c9843af893)
- [initMountId()](#m-initMountId-43348a54995c)
- [initPrompt()](#m-initPrompt-e179e0cffc11)
- [initType()](#m-initType-9d8086c9965a)
- [setCmp(Cmp)](#m-setCmp-7cb263b886c7)
- [setFlags(int)](#m-setFlags-ce4598e4465c)
- [setMaxOccur(int)](#m-setMaxOccur-6939fed85b4a)
- [setMinOccur(int)](#m-setMinOccur-e8ca05aa5cf6)
- [setShallowType(ShallowType)](#m-setShallowType-d21ce22018e7)
- [setType(Reader)](#m-setType-b1128ee37ec1)

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
public final com.tailf.ncs.maapi.Schema.Cs.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

### getChoices() <a href="#m-getChoices-818fb3fccb86" id="m-getChoices-818fb3fccb86"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Builder getChoices()
```

Types: [Builder](Choices/Builder.md#cls-Builder)

### getCmp() <a href="#m-getCmp-a9e8116d77d2" id="m-getCmp-a9e8116d77d2"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cmp getCmp()
```

Types: [Cmp](../Cmp.md#cls-Cmp)

### getDefval() <a href="#m-getDefval-561ad5494c47" id="m-getDefval-561ad5494c47"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Defval.Builder getDefval()
```

Types: [Builder](Defval/Builder.md#cls-Builder)

### getDocDescription() <a href="#m-getDocDescription-08369bbe26a9" id="m-getDocDescription-08369bbe26a9"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.DocDescription.Builder getDocDescription()
```

Types: [Builder](DocDescription/Builder.md#cls-Builder)

### getFlags() <a href="#m-getFlags-3c1ca90fd29c" id="m-getFlags-3c1ca90fd29c"></a>

```java
public final int getFlags()
```

### getHideGroups() <a href="#m-getHideGroups-d566f1e3343e" id="m-getHideGroups-d566f1e3343e"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.HideGroups.Builder getHideGroups()
```

Types: [Builder](HideGroups/Builder.md#cls-Builder)

### getKeys() <a href="#m-getKeys-a24b9d377db7" id="m-getKeys-a24b9d377db7"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Keys.Builder getKeys()
```

Types: [Builder](Keys/Builder.md#cls-Builder)

### getMaxOccur() <a href="#m-getMaxOccur-b4cb09a89559" id="m-getMaxOccur-b4cb09a89559"></a>

```java
public final int getMaxOccur()
```

### getMeta() <a href="#m-getMeta-33b809b5c0be" id="m-getMeta-33b809b5c0be"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Builder getMeta()
```

Types: [Builder](Meta/Builder.md#cls-Builder)

### getMinOccur() <a href="#m-getMinOccur-da22ee8b4e31" id="m-getMinOccur-da22ee8b4e31"></a>

```java
public final int getMinOccur()
```

### getMountId() <a href="#m-getMountId-c5175827f949" id="m-getMountId-c5175827f949"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.MountId.Builder getMountId()
```

Types: [Builder](MountId/Builder.md#cls-Builder)

### getPrompt() <a href="#m-getPrompt-6a58866a8699" id="m-getPrompt-6a58866a8699"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder getPrompt()
```

Types: [Builder](Prompt/Builder.md#cls-Builder)

### getShallowType() <a href="#m-getShallowType-2e2b5f294983" id="m-getShallowType-2e2b5f294983"></a>

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder getType()
```

Types: [Builder](../CsType/Builder.md#cls-Builder)

### initChoices() <a href="#m-initChoices-bd85acba2a40" id="m-initChoices-bd85acba2a40"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Builder initChoices()
```

Types: [Builder](Choices/Builder.md#cls-Builder)

### initDefval() <a href="#m-initDefval-fc211401cea7" id="m-initDefval-fc211401cea7"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Defval.Builder initDefval()
```

Types: [Builder](Defval/Builder.md#cls-Builder)

### initDocDescription() <a href="#m-initDocDescription-e02d1d7991d3" id="m-initDocDescription-e02d1d7991d3"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.DocDescription.Builder initDocDescription()
```

Types: [Builder](DocDescription/Builder.md#cls-Builder)

### initHideGroups() <a href="#m-initHideGroups-e73c27a1f3f0" id="m-initHideGroups-e73c27a1f3f0"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.HideGroups.Builder initHideGroups()
```

Types: [Builder](HideGroups/Builder.md#cls-Builder)

### initKeys() <a href="#m-initKeys-dbb1fee285c0" id="m-initKeys-dbb1fee285c0"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Keys.Builder initKeys()
```

Types: [Builder](Keys/Builder.md#cls-Builder)

### initMeta() <a href="#m-initMeta-38c9843af893" id="m-initMeta-38c9843af893"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Builder initMeta()
```

Types: [Builder](Meta/Builder.md#cls-Builder)

### initMountId() <a href="#m-initMountId-43348a54995c" id="m-initMountId-43348a54995c"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.MountId.Builder initMountId()
```

Types: [Builder](MountId/Builder.md#cls-Builder)

### initPrompt() <a href="#m-initPrompt-e179e0cffc11" id="m-initPrompt-e179e0cffc11"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder initPrompt()
```

Types: [Builder](Prompt/Builder.md#cls-Builder)

### initType() <a href="#m-initType-9d8086c9965a" id="m-initType-9d8086c9965a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder initType()
```

Types: [Builder](../CsType/Builder.md#cls-Builder)

### setCmp(Cmp) <a href="#m-setCmp-7cb263b886c7" id="m-setCmp-7cb263b886c7"></a>

```java
public final void setCmp(com.tailf.ncs.maapi.Schema.Cmp value)
```

Types: [Cmp](../Cmp.md#cls-Cmp)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cmp value`

### setFlags(int) <a href="#m-setFlags-ce4598e4465c" id="m-setFlags-ce4598e4465c"></a>

```java
public final void setFlags(int value)
```

**Parameters**

- `int value`

### setMaxOccur(int) <a href="#m-setMaxOccur-6939fed85b4a" id="m-setMaxOccur-6939fed85b4a"></a>

```java
public final void setMaxOccur(int value)
```

**Parameters**

- `int value`

### setMinOccur(int) <a href="#m-setMinOccur-e8ca05aa5cf6" id="m-setMinOccur-e8ca05aa5cf6"></a>

```java
public final void setMinOccur(int value)
```

**Parameters**

- `int value`

### setShallowType(ShallowType) <a href="#m-setShallowType-d21ce22018e7" id="m-setShallowType-d21ce22018e7"></a>

```java
public final void setShallowType(com.tailf.ncs.maapi.Schema.ShallowType value)
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

**Parameters**

- `com.tailf.ncs.maapi.Schema.ShallowType value`

### setType(Reader) <a href="#m-setType-b1128ee37ec1" id="m-setType-b1128ee37ec1"></a>

```java
public final void setType(com.tailf.ncs.maapi.Schema.CsType.Reader value)
```

Types: [Reader](../CsType/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsType.Reader value`
