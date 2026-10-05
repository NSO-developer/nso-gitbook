<a id="cls-Reader"></a>
# Reader

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-reader-cf5e962c3323)

**Methods**:

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
- [hasType()](#m-hastype-61dd7b60aacb)

## Constructors

<a id="m-reader-cf5e962c3323"></a>
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

<a id="m-getchoices-818fb3fccb86"></a>
### getChoices()

```java
public com.tailf.ncs.maapi.Schema.Cs.Choices.Reader getChoices()
```

Types: [Reader](Choices/Reader.md#cls-Reader)

<a id="m-getcmp-a9e8116d77d2"></a>
### getCmp()

```java
public final com.tailf.ncs.maapi.Schema.Cmp getCmp()
```

Types: [Cmp](../Cmp.md#cls-Cmp)

<a id="m-getdefval-561ad5494c47"></a>
### getDefval()

```java
public com.tailf.ncs.maapi.Schema.Cs.Defval.Reader getDefval()
```

Types: [Reader](Defval/Reader.md#cls-Reader)

<a id="m-getdocdescription-08369bbe26a9"></a>
### getDocDescription()

```java
public com.tailf.ncs.maapi.Schema.Cs.DocDescription.Reader getDocDescription()
```

Types: [Reader](DocDescription/Reader.md#cls-Reader)

<a id="m-getflags-3c1ca90fd29c"></a>
### getFlags()

```java
public final int getFlags()
```

<a id="m-gethidegroups-d566f1e3343e"></a>
### getHideGroups()

```java
public com.tailf.ncs.maapi.Schema.Cs.HideGroups.Reader getHideGroups()
```

Types: [Reader](HideGroups/Reader.md#cls-Reader)

<a id="m-getkeys-a24b9d377db7"></a>
### getKeys()

```java
public com.tailf.ncs.maapi.Schema.Cs.Keys.Reader getKeys()
```

Types: [Reader](Keys/Reader.md#cls-Reader)

<a id="m-getmaxoccur-b4cb09a89559"></a>
### getMaxOccur()

```java
public final int getMaxOccur()
```

<a id="m-getmeta-33b809b5c0be"></a>
### getMeta()

```java
public com.tailf.ncs.maapi.Schema.Cs.Meta.Reader getMeta()
```

Types: [Reader](Meta/Reader.md#cls-Reader)

<a id="m-getminoccur-da22ee8b4e31"></a>
### getMinOccur()

```java
public final int getMinOccur()
```

<a id="m-getmountid-c5175827f949"></a>
### getMountId()

```java
public com.tailf.ncs.maapi.Schema.Cs.MountId.Reader getMountId()
```

Types: [Reader](MountId/Reader.md#cls-Reader)

<a id="m-getprompt-6a58866a8699"></a>
### getPrompt()

```java
public com.tailf.ncs.maapi.Schema.Cs.Prompt.Reader getPrompt()
```

Types: [Reader](Prompt/Reader.md#cls-Reader)

<a id="m-getshallowtype-2e2b5f294983"></a>
### getShallowType()

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

<a id="m-gettype-5a52f6f0d4c1"></a>
### getType()

```java
public com.tailf.ncs.maapi.Schema.CsType.Reader getType()
```

Types: [Reader](../CsType/Reader.md#cls-Reader)

<a id="m-hastype-61dd7b60aacb"></a>
### hasType()

```java
public boolean hasType()
```
