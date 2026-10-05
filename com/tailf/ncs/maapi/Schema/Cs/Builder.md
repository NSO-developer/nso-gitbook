<a id="cls-Builder"></a>
# Builder

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#m-builder-179fba5038bd)

**Methods**:

- [asReader()](#m-asreader-b5c0f2a8d115)
- [getChoices()](#m-getchoices-818fb3fccb86)
- [getCmp()](#m-getcmp-a9e8116d77d2)
- [getDefval()](#m-getdefval-561ad5494c47)
- [getDocDescription()](#m-getdocdescription-08369bbe26a9)
- [getFlags()](#m-getflags-3c1ca90fd29c)
- [getHideGroups()](#m-gethidegroups-d566f1e3343e)
- [getKeys()](#m-getkeys-a24b9d377db7)
- [getMaxOccur()](#m-getmaxoccur-b4cb09a89559)
- [getMeta()](#m-getmeta-33b809b5c0be)
- [getMinOccur()](#m-getminoccur-da22ee8b4e31)
- [getMountId()](#m-getmountid-c5175827f949)
- [getPrompt()](#m-getprompt-6a58866a8699)
- [getShallowType()](#m-getshallowtype-2e2b5f294983)
- [getType()](#m-gettype-5a52f6f0d4c1)
- [initChoices()](#m-initchoices-bd85acba2a40)
- [initDefval()](#m-initdefval-fc211401cea7)
- [initDocDescription()](#m-initdocdescription-e02d1d7991d3)
- [initHideGroups()](#m-inithidegroups-e73c27a1f3f0)
- [initKeys()](#m-initkeys-dbb1fee285c0)
- [initMeta()](#m-initmeta-38c9843af893)
- [initMountId()](#m-initmountid-43348a54995c)
- [initPrompt()](#m-initprompt-e179e0cffc11)
- [initType()](#m-inittype-9d8086c9965a)
- [setCmp(Cmp)](#m-setcmp-7cb263b886c7)
- [setFlags(int)](#m-setflags-ce4598e4465c)
- [setMaxOccur(int)](#m-setmaxoccur-6939fed85b4a)
- [setMinOccur(int)](#m-setminoccur-e8ca05aa5cf6)
- [setShallowType(ShallowType)](#m-setshallowtype-d21ce22018e7)
- [setType(Reader)](#m-settype-b1128ee37ec1)

## Constructors

<a id="m-builder-179fba5038bd"></a>
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

<a id="m-asreader-b5c0f2a8d115"></a>
### asReader()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Reader asReader()
```

Types: [Reader](Reader.md#cls-Reader)

<a id="m-getchoices-818fb3fccb86"></a>
### getChoices()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Builder getChoices()
```

Types: [Builder](Choices/Builder.md#cls-Builder)

<a id="m-getcmp-a9e8116d77d2"></a>
### getCmp()

```java
public final com.tailf.ncs.maapi.Schema.Cmp getCmp()
```

Types: [Cmp](../Cmp.md#cls-Cmp)

<a id="m-getdefval-561ad5494c47"></a>
### getDefval()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Defval.Builder getDefval()
```

Types: [Builder](Defval/Builder.md#cls-Builder)

<a id="m-getdocdescription-08369bbe26a9"></a>
### getDocDescription()

```java
public final com.tailf.ncs.maapi.Schema.Cs.DocDescription.Builder getDocDescription()
```

Types: [Builder](DocDescription/Builder.md#cls-Builder)

<a id="m-getflags-3c1ca90fd29c"></a>
### getFlags()

```java
public final int getFlags()
```

<a id="m-gethidegroups-d566f1e3343e"></a>
### getHideGroups()

```java
public final com.tailf.ncs.maapi.Schema.Cs.HideGroups.Builder getHideGroups()
```

Types: [Builder](HideGroups/Builder.md#cls-Builder)

<a id="m-getkeys-a24b9d377db7"></a>
### getKeys()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Keys.Builder getKeys()
```

Types: [Builder](Keys/Builder.md#cls-Builder)

<a id="m-getmaxoccur-b4cb09a89559"></a>
### getMaxOccur()

```java
public final int getMaxOccur()
```

<a id="m-getmeta-33b809b5c0be"></a>
### getMeta()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Builder getMeta()
```

Types: [Builder](Meta/Builder.md#cls-Builder)

<a id="m-getminoccur-da22ee8b4e31"></a>
### getMinOccur()

```java
public final int getMinOccur()
```

<a id="m-getmountid-c5175827f949"></a>
### getMountId()

```java
public final com.tailf.ncs.maapi.Schema.Cs.MountId.Builder getMountId()
```

Types: [Builder](MountId/Builder.md#cls-Builder)

<a id="m-getprompt-6a58866a8699"></a>
### getPrompt()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder getPrompt()
```

Types: [Builder](Prompt/Builder.md#cls-Builder)

<a id="m-getshallowtype-2e2b5f294983"></a>
### getShallowType()

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

<a id="m-gettype-5a52f6f0d4c1"></a>
### getType()

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder getType()
```

Types: [Builder](../CsType/Builder.md#cls-Builder)

<a id="m-initchoices-bd85acba2a40"></a>
### initChoices()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Builder initChoices()
```

Types: [Builder](Choices/Builder.md#cls-Builder)

<a id="m-initdefval-fc211401cea7"></a>
### initDefval()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Defval.Builder initDefval()
```

Types: [Builder](Defval/Builder.md#cls-Builder)

<a id="m-initdocdescription-e02d1d7991d3"></a>
### initDocDescription()

```java
public final com.tailf.ncs.maapi.Schema.Cs.DocDescription.Builder initDocDescription()
```

Types: [Builder](DocDescription/Builder.md#cls-Builder)

<a id="m-inithidegroups-e73c27a1f3f0"></a>
### initHideGroups()

```java
public final com.tailf.ncs.maapi.Schema.Cs.HideGroups.Builder initHideGroups()
```

Types: [Builder](HideGroups/Builder.md#cls-Builder)

<a id="m-initkeys-dbb1fee285c0"></a>
### initKeys()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Keys.Builder initKeys()
```

Types: [Builder](Keys/Builder.md#cls-Builder)

<a id="m-initmeta-38c9843af893"></a>
### initMeta()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Builder initMeta()
```

Types: [Builder](Meta/Builder.md#cls-Builder)

<a id="m-initmountid-43348a54995c"></a>
### initMountId()

```java
public final com.tailf.ncs.maapi.Schema.Cs.MountId.Builder initMountId()
```

Types: [Builder](MountId/Builder.md#cls-Builder)

<a id="m-initprompt-e179e0cffc11"></a>
### initPrompt()

```java
public final com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder initPrompt()
```

Types: [Builder](Prompt/Builder.md#cls-Builder)

<a id="m-inittype-9d8086c9965a"></a>
### initType()

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder initType()
```

Types: [Builder](../CsType/Builder.md#cls-Builder)

<a id="m-setcmp-7cb263b886c7"></a>
### setCmp(Cmp)

```java
public final void setCmp(com.tailf.ncs.maapi.Schema.Cmp value)
```

Types: [Cmp](../Cmp.md#cls-Cmp)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cmp value`

<a id="m-setflags-ce4598e4465c"></a>
### setFlags(int)

```java
public final void setFlags(int value)
```

**Parameters**

- `int value`

<a id="m-setmaxoccur-6939fed85b4a"></a>
### setMaxOccur(int)

```java
public final void setMaxOccur(int value)
```

**Parameters**

- `int value`

<a id="m-setminoccur-e8ca05aa5cf6"></a>
### setMinOccur(int)

```java
public final void setMinOccur(int value)
```

**Parameters**

- `int value`

<a id="m-setshallowtype-d21ce22018e7"></a>
### setShallowType(ShallowType)

```java
public final void setShallowType(com.tailf.ncs.maapi.Schema.ShallowType value)
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

**Parameters**

- `com.tailf.ncs.maapi.Schema.ShallowType value`

<a id="m-settype-b1128ee37ec1"></a>
### setType(Reader)

```java
public final void setType(com.tailf.ncs.maapi.Schema.CsType.Reader value)
```

Types: [Reader](../CsType/Reader.md#cls-Reader)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsType.Reader value`
