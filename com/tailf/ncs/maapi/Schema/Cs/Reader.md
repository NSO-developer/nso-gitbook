# Reader <a href="#cls-Reader" id="cls-Reader"></a>

```java
public static final class com.tailf.ncs.maapi.Schema.Cs.Reader
    extends org.capnproto.StructReader
```

## Members

**Constructors**:

- [Reader(SegmentReader, int, int, int, short, int)](#m-Reader-cf5e962c3323)

**Methods**:

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
- [hasType()](#m-hasType-61dd7b60aacb)

## Constructors

### Reader(SegmentReader, int, int, int, short, int) <a href="#m-Reader-cf5e962c3323" id="m-Reader-cf5e962c3323"></a>

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

### getChoices() <a href="#m-getChoices-818fb3fccb86" id="m-getChoices-818fb3fccb86"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Choices.Reader getChoices()
```

Types: [Reader](Choices/Reader.md#cls-Reader)

### getCmp() <a href="#m-getCmp-a9e8116d77d2" id="m-getCmp-a9e8116d77d2"></a>

```java
public final com.tailf.ncs.maapi.Schema.Cmp getCmp()
```

Types: [Cmp](../Cmp.md#cls-Cmp)

### getDefval() <a href="#m-getDefval-561ad5494c47" id="m-getDefval-561ad5494c47"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Defval.Reader getDefval()
```

Types: [Reader](Defval/Reader.md#cls-Reader)

### getDocDescription() <a href="#m-getDocDescription-08369bbe26a9" id="m-getDocDescription-08369bbe26a9"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.DocDescription.Reader getDocDescription()
```

Types: [Reader](DocDescription/Reader.md#cls-Reader)

### getFlags() <a href="#m-getFlags-3c1ca90fd29c" id="m-getFlags-3c1ca90fd29c"></a>

```java
public final int getFlags()
```

### getHideGroups() <a href="#m-getHideGroups-d566f1e3343e" id="m-getHideGroups-d566f1e3343e"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.HideGroups.Reader getHideGroups()
```

Types: [Reader](HideGroups/Reader.md#cls-Reader)

### getKeys() <a href="#m-getKeys-a24b9d377db7" id="m-getKeys-a24b9d377db7"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Keys.Reader getKeys()
```

Types: [Reader](Keys/Reader.md#cls-Reader)

### getMaxOccur() <a href="#m-getMaxOccur-b4cb09a89559" id="m-getMaxOccur-b4cb09a89559"></a>

```java
public final int getMaxOccur()
```

### getMeta() <a href="#m-getMeta-33b809b5c0be" id="m-getMeta-33b809b5c0be"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Meta.Reader getMeta()
```

Types: [Reader](Meta/Reader.md#cls-Reader)

### getMinOccur() <a href="#m-getMinOccur-da22ee8b4e31" id="m-getMinOccur-da22ee8b4e31"></a>

```java
public final int getMinOccur()
```

### getMountId() <a href="#m-getMountId-c5175827f949" id="m-getMountId-c5175827f949"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.MountId.Reader getMountId()
```

Types: [Reader](MountId/Reader.md#cls-Reader)

### getPrompt() <a href="#m-getPrompt-6a58866a8699" id="m-getPrompt-6a58866a8699"></a>

```java
public com.tailf.ncs.maapi.Schema.Cs.Prompt.Reader getPrompt()
```

Types: [Reader](Prompt/Reader.md#cls-Reader)

### getShallowType() <a href="#m-getShallowType-2e2b5f294983" id="m-getShallowType-2e2b5f294983"></a>

```java
public final com.tailf.ncs.maapi.Schema.ShallowType getShallowType()
```

Types: [ShallowType](../ShallowType.md#cls-ShallowType)

### getType() <a href="#m-getType-5a52f6f0d4c1" id="m-getType-5a52f6f0d4c1"></a>

```java
public com.tailf.ncs.maapi.Schema.CsType.Reader getType()
```

Types: [Reader](../CsType/Reader.md#cls-Reader)

### hasType() <a href="#m-hasType-61dd7b60aacb" id="m-hasType-61dd7b60aacb"></a>

```java
public boolean hasType()
```
