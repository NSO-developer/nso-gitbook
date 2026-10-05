<a id="s-Level"></a>
# Level

```java
public class com.tailf.ncs.maapi.MmapSchema.Level
```

Level of data, corresponding to a single node in the schema tree.

## Members

**Constructors**:

- [Level(Source, int)](#s-Level-1)

**Methods**:

- [getChild(Source, int)](#s-getChild)
- [getFlags()](#s-getFlags)
- [getNumChildren()](#s-getNumChildren)
- [getNumRecords()](#s-getNumRecords)
- [getOff()](#s-getOff)
- [getRecord(Source, int)](#s-getRecord)
- [read(Source, int)](#s-read)
- [readChild(Source, int, Child)](#s-readChild)

## Constructors

<a id="s-Level-1"></a>
### Level(Source, int)

**Package-private**

```java
Level(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#s-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`


## Methods

<a id="s-getChild"></a>
### getChild(Source, int)

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child getChild(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int childIdx
)
```

Types: [Child](Child.md#s-Child), [Source](Source.md#s-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int childIdx`

<a id="s-getFlags"></a>
### getFlags()

```java
public short getFlags()
```

<a id="s-getNumChildren"></a>
### getNumChildren()

```java
public int getNumChildren()
```

<a id="s-getNumRecords"></a>
### getNumRecords()

```java
public short getNumRecords()
```

<a id="s-getOff"></a>
### getOff()

```java
public int getOff()
```

<a id="s-getRecord"></a>
### getRecord(Source, int)

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Record getRecord(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int recordIdx
)
```

Types: [Record](Record.md#s-Record), [Source](Source.md#s-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int recordIdx`

<a id="s-read"></a>
### read(Source, int)

**Package-private**

```java
final void read(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#s-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`

<a id="s-readChild"></a>
### readChild(Source, int, Child)

**Package-private**

```java
void readChild(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int childIdx,
    com.tailf.ncs.maapi.MmapSchema.Child child
)
```

Types: [Source](Source.md#s-Source), [Child](Child.md#s-Child)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int childIdx`
- `com.tailf.ncs.maapi.MmapSchema.Child child`
