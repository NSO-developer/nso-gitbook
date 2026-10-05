# Reader <a href="#reader-b2467a96ddff" id="reader-b2467a96ddff"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#reader-cf5e962c3323)

**Methods**:

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
- [hasType()](#hastype-61dd7b60aacb)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#reader-cf5e962c3323" id="reader-cf5e962c3323"></a>

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

### getChoices() <a href="#getchoices-818fb3fccb86" id="getchoices-818fb3fccb86"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Choices.Reader getChoices()
```

Types: [Reader](Choices/Reader.md#reader-b2467a96ddff)

### getCmp() <a href="#getcmp-a9e8116d77d2" id="getcmp-a9e8116d77d2"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cmp getCmp()
```

Types: [Cmp](../Cmp.md#cmp-99bade45503f)

### getDefval() <a href="#getdefval-561ad5494c47" id="getdefval-561ad5494c47"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Defval.Reader getDefval()
```

Types: [Reader](Defval/Reader.md#reader-b2467a96ddff)

### getDocDescription() <a href="#getdocdescription-08369bbe26a9" id="getdocdescription-08369bbe26a9"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.DocDescription.Reader getDocDescription()
```

Types: [Reader](DocDescription/Reader.md#reader-b2467a96ddff)

### getFlags() <a href="#getflags-3c1ca90fd29c" id="getflags-3c1ca90fd29c"></a>

```java
public final int getFlags()
```

### getHideGroups() <a href="#gethidegroups-d566f1e3343e" id="gethidegroups-d566f1e3343e"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.HideGroups.Reader getHideGroups()
```

Types: [Reader](HideGroups/Reader.md#reader-b2467a96ddff)

### getKeys() <a href="#getkeys-a24b9d377db7" id="getkeys-a24b9d377db7"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Keys.Reader getKeys()
```

Types: [Reader](Keys/Reader.md#reader-b2467a96ddff)

### getMaxOccur() <a href="#getmaxoccur-b4cb09a89559" id="getmaxoccur-b4cb09a89559"></a>

```java
public final int getMaxOccur()
```

### getMeta() <a href="#getmeta-33b809b5c0be" id="getmeta-33b809b5c0be"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Meta.Reader getMeta()
```

Types: [Reader](Meta/Reader.md#reader-b2467a96ddff)

### getMinOccur() <a href="#getminoccur-da22ee8b4e31" id="getminoccur-da22ee8b4e31"></a>

```java
public final int getMinOccur()
```

### getMountId() <a href="#getmountid-c5175827f949" id="getmountid-c5175827f949"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.MountId.Reader getMountId()
```

Types: [Reader](MountId/Reader.md#reader-b2467a96ddff)

### getPrompt() <a href="#getprompt-6a58866a8699" id="getprompt-6a58866a8699"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Prompt.Reader getPrompt()
```

Types: [Reader](Prompt/Reader.md#reader-b2467a96ddff)

### getShallowType() <a href="#getshallowtype-2e2b5f294983" id="getshallowtype-2e2b5f294983"></a>

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#shallowtype-736a38acb289)

### getType() <a href="#gettype-5a52f6f0d4c1" id="gettype-5a52f6f0d4c1"></a>

```java
public com.tailf.ncs.maapi.Schema.CsType.Reader getType()
```

Types: [Reader](../CsType/Reader.md#reader-b2467a96ddff)

### hasType() <a href="#hastype-61dd7b60aacb" id="hastype-61dd7b60aacb"></a>

```java
public boolean hasType()
```
