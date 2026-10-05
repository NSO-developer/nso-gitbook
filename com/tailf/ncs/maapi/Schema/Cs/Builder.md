# Builder <a href="#builder-21f09e83781d" id="builder-21f09e83781d"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Builder
    extends org.capnproto.StructBuilder
```

## Members

**Constructors**:

- [Builder(SegmentBuilder, int, int, int, short)](#builder-179fba5038bd)

**Methods**:

- [asReader()](#asreader-b5c0f2a8d115)
- [getChoices()](#getchoices-818fb3fccb86)
- [getCmp()](#getcmp-a9e8116d77d2)
- [getDefval()](#getdefval-561ad5494c47)
- [getDocDescription()](#getdocdescription-08369bbe26a9)
- [getFlags()](#getflags-3c1ca90fd29c)
- [getHideGroups()](#gethidegroups-d566f1e3343e)
- [getKeys()](#getkeys-a24b9d377db7)
- [getMaxOccur()](#getmaxoccur-b4cb09a89559)
- [getMeta()](#getmeta-33b809b5c0be)
- [getMinOccur()](#getminoccur-da22ee8b4e31)
- [getMountId()](#getmountid-c5175827f949)
- [getPrompt()](#getprompt-6a58866a8699)
- [getShallowType()](#getshallowtype-2e2b5f294983)
- [getType()](#gettype-5a52f6f0d4c1)
- [initChoices()](#initchoices-bd85acba2a40)
- [initDefval()](#initdefval-fc211401cea7)
- [initDocDescription()](#initdocdescription-e02d1d7991d3)
- [initHideGroups()](#inithidegroups-e73c27a1f3f0)
- [initKeys()](#initkeys-dbb1fee285c0)
- [initMeta()](#initmeta-38c9843af893)
- [initMountId()](#initmountid-43348a54995c)
- [initPrompt()](#initprompt-e179e0cffc11)
- [initType()](#inittype-9d8086c9965a)
- [setCmp(Cmp)](#setcmp-7cb263b886c7)
- [setFlags(int)](#setflags-ce4598e4465c)
- [setMaxOccur(int)](#setmaxoccur-6939fed85b4a)
- [setMinOccur(int)](#setminoccur-e8ca05aa5cf6)
- [setShallowType(ShallowType)](#setshallowtype-d21ce22018e7)
- [setType(Reader)](#settype-b1128ee37ec1)

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
public final com.tailf.ncs.maapi.Schema.Cs.Reader asReader()
```

Types: [Reader](Reader.md#reader-b2467a96ddff)

### getChoices() <a href="#getchoices-818fb3fccb86" id="getchoices-818fb3fccb86"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Builder getChoices()
```

Types: [Builder](Choices/Builder.md#builder-21f09e83781d)

### getCmp() <a href="#getcmp-a9e8116d77d2" id="getcmp-a9e8116d77d2"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cmp getCmp()
```

Types: [Cmp](../Cmp.md#cmp-99bade45503f)

### getDefval() <a href="#getdefval-561ad5494c47" id="getdefval-561ad5494c47"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Defval.Builder getDefval()
```

Types: [Builder](Defval/Builder.md#builder-21f09e83781d)

### getDocDescription() <a href="#getdocdescription-08369bbe26a9" id="getdocdescription-08369bbe26a9"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.DocDescription.Builder getDocDescription()
```

Types: [Builder](DocDescription/Builder.md#builder-21f09e83781d)

### getFlags() <a href="#getflags-3c1ca90fd29c" id="getflags-3c1ca90fd29c"></a>

```java
public final int getFlags()
```

### getHideGroups() <a href="#gethidegroups-d566f1e3343e" id="gethidegroups-d566f1e3343e"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.HideGroups.Builder getHideGroups()
```

Types: [Builder](HideGroups/Builder.md#builder-21f09e83781d)

### getKeys() <a href="#getkeys-a24b9d377db7" id="getkeys-a24b9d377db7"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Keys.Builder getKeys()
```

Types: [Builder](Keys/Builder.md#builder-21f09e83781d)

### getMaxOccur() <a href="#getmaxoccur-b4cb09a89559" id="getmaxoccur-b4cb09a89559"></a>

```java
public final int getMaxOccur()
```

### getMeta() <a href="#getmeta-33b809b5c0be" id="getmeta-33b809b5c0be"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Builder getMeta()
```

Types: [Builder](Meta/Builder.md#builder-21f09e83781d)

### getMinOccur() <a href="#getminoccur-da22ee8b4e31" id="getminoccur-da22ee8b4e31"></a>

```java
public final int getMinOccur()
```

### getMountId() <a href="#getmountid-c5175827f949" id="getmountid-c5175827f949"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.MountId.Builder getMountId()
```

Types: [Builder](MountId/Builder.md#builder-21f09e83781d)

### getPrompt() <a href="#getprompt-6a58866a8699" id="getprompt-6a58866a8699"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder getPrompt()
```

Types: [Builder](Prompt/Builder.md#builder-21f09e83781d)

### getShallowType() <a href="#getshallowtype-2e2b5f294983" id="getshallowtype-2e2b5f294983"></a>

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#shallowtype-736a38acb289)

### getType() <a href="#gettype-5a52f6f0d4c1" id="gettype-5a52f6f0d4c1"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder getType()
```

Types: [Builder](../CsType/Builder.md#builder-21f09e83781d)

### initChoices() <a href="#initchoices-bd85acba2a40" id="initchoices-bd85acba2a40"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Choices.Builder initChoices()
```

Types: [Builder](Choices/Builder.md#builder-21f09e83781d)

### initDefval() <a href="#initdefval-fc211401cea7" id="initdefval-fc211401cea7"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Defval.Builder initDefval()
```

Types: [Builder](Defval/Builder.md#builder-21f09e83781d)

### initDocDescription() <a href="#initdocdescription-e02d1d7991d3" id="initdocdescription-e02d1d7991d3"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.DocDescription.Builder initDocDescription()
```

Types: [Builder](DocDescription/Builder.md#builder-21f09e83781d)

### initHideGroups() <a href="#inithidegroups-e73c27a1f3f0" id="inithidegroups-e73c27a1f3f0"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.HideGroups.Builder initHideGroups()
```

Types: [Builder](HideGroups/Builder.md#builder-21f09e83781d)

### initKeys() <a href="#initkeys-dbb1fee285c0" id="initkeys-dbb1fee285c0"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Keys.Builder initKeys()
```

Types: [Builder](Keys/Builder.md#builder-21f09e83781d)

### initMeta() <a href="#initmeta-38c9843af893" id="initmeta-38c9843af893"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Meta.Builder initMeta()
```

Types: [Builder](Meta/Builder.md#builder-21f09e83781d)

### initMountId() <a href="#initmountid-43348a54995c" id="initmountid-43348a54995c"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.MountId.Builder initMountId()
```

Types: [Builder](MountId/Builder.md#builder-21f09e83781d)

### initPrompt() <a href="#initprompt-e179e0cffc11" id="initprompt-e179e0cffc11"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cs.Prompt.Builder initPrompt()
```

Types: [Builder](Prompt/Builder.md#builder-21f09e83781d)

### initType() <a href="#inittype-9d8086c9965a" id="inittype-9d8086c9965a"></a>

```java
public final com.tailf.ncs.maapi.Schema.CsType.Builder initType()
```

Types: [Builder](../CsType/Builder.md#builder-21f09e83781d)

### setCmp(Cmp) <a href="#setcmp-7cb263b886c7" id="setcmp-7cb263b886c7"></a>

```java
public final void setCmp(com.tailf.ncs.maapi.Schema.Cmp value)
```

Types: [Cmp](../Cmp.md#cmp-99bade45503f)

**Parameters**

- `com.tailf.ncs.maapi.Schema.Cmp value`

### setFlags(int) <a href="#setflags-ce4598e4465c" id="setflags-ce4598e4465c"></a>

```java
public final void setFlags(int value)
```

**Parameters**

- `int value`

### setMaxOccur(int) <a href="#setmaxoccur-6939fed85b4a" id="setmaxoccur-6939fed85b4a"></a>

```java
public final void setMaxOccur(int value)
```

**Parameters**

- `int value`

### setMinOccur(int) <a href="#setminoccur-e8ca05aa5cf6" id="setminoccur-e8ca05aa5cf6"></a>

```java
public final void setMinOccur(int value)
```

**Parameters**

- `int value`

### setShallowType(ShallowType) <a href="#setshallowtype-d21ce22018e7" id="setshallowtype-d21ce22018e7"></a>

```java
public final void setShallowType(com.tailf.ncs.maapi.Schema.ShallowType value)
```

Types: [ShallowType](../ShallowType.md#shallowtype-736a38acb289)

**Parameters**

- `com.tailf.ncs.maapi.Schema.ShallowType value`

### setType(Reader) <a href="#settype-b1128ee37ec1" id="settype-b1128ee37ec1"></a>

```java
public final void setType(com.tailf.ncs.maapi.Schema.CsType.Reader value)
```

Types: [Reader](../CsType/Reader.md#reader-b2467a96ddff)

**Parameters**

- `com.tailf.ncs.maapi.Schema.CsType.Reader value`
