<a id="cls-Level"></a>
# Level

```java
public class com.tailf.ncs.maapi.MmapSchema.Level
```

Level of data, corresponding to a single node in the schema tree.

## Members

**Constructors**:

- [Level(Source, int)](#m-level-9cb7eaef780c)

**Methods**:

- [getChild(Source, int)](#m-getchild-fd813ae0d5e9)
- [getFlags()](#m-getflags-3c1ca90fd29c)
- [getNumChildren()](#m-getnumchildren-532d09a62d4c)
- [getNumRecords()](#m-getnumrecords-03318f72ab23)
- [getOff()](#m-getoff-578b9943fd00)
- [getRecord(Source, int)](#m-getrecord-e26482ff7b93)
- [read(Source, int)](#m-read-c048381a08bd)
- [readChild(Source, int, Child)](#m-readchild-c2da12eeb9d7)

## Constructors

<a id="m-level-9cb7eaef780c"></a>
### Level(Source, int)

**Package-private**

```java
Level(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`


## Methods

<a id="m-getchild-fd813ae0d5e9"></a>
### getChild(Source, int)

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child getChild(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int childIdx
)
```

Types: [Child](Child.md#cls-Child), [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int childIdx`

<a id="m-getflags-3c1ca90fd29c"></a>
### getFlags()

```java
public short getFlags()
```

<a id="m-getnumchildren-532d09a62d4c"></a>
### getNumChildren()

```java
public int getNumChildren()
```

<a id="m-getnumrecords-03318f72ab23"></a>
### getNumRecords()

```java
public short getNumRecords()
```

<a id="m-getoff-578b9943fd00"></a>
### getOff()

```java
public int getOff()
```

<a id="m-getrecord-e26482ff7b93"></a>
### getRecord(Source, int)

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Record getRecord(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int recordIdx
)
```

Types: [Record](Record.md#cls-Record), [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int recordIdx`

<a id="m-read-c048381a08bd"></a>
### read(Source, int)

**Package-private**

```java
final void read(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`

<a id="m-readchild-c2da12eeb9d7"></a>
### readChild(Source, int, Child)

**Package-private**

```java
void readChild(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int childIdx,
    com.tailf.ncs.maapi.MmapSchema.Child child
)
```

Types: [Source](Source.md#cls-Source), [Child](Child.md#cls-Child)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int childIdx`
- `com.tailf.ncs.maapi.MmapSchema.Child child`
