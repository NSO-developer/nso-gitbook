# Level <a href="#cls-Level" id="cls-Level"></a>

```java
public class com.tailf.ncs.maapi.MmapSchema.Level
```

Level of data, corresponding to a single node in the schema tree.

## Members

**Constructors**:

- [Level(Source, int)](#m-Level-9cb7eaef780c)

**Methods**:

- [getChild(Source, int)](#m-getChild-fd813ae0d5e9)
- [getFlags()](#m-getFlags-3c1ca90fd29c)
- [getNumChildren()](#m-getNumChildren-532d09a62d4c)
- [getNumRecords()](#m-getNumRecords-03318f72ab23)
- [getOff()](#m-getOff-578b9943fd00)
- [getRecord(Source, int)](#m-getRecord-e26482ff7b93)
- [read(Source, int)](#m-read-c048381a08bd)
- [readChild(Source, int, Child)](#m-readChild-c2da12eeb9d7)

## Constructors

### Level(Source, int) <a href="#m-Level-9cb7eaef780c" id="m-Level-9cb7eaef780c"></a>

**Package-private**

```java
Level(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`


## Methods

### getChild(Source, int) <a href="#m-getChild-fd813ae0d5e9" id="m-getChild-fd813ae0d5e9"></a>

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

### getFlags() <a href="#m-getFlags-3c1ca90fd29c" id="m-getFlags-3c1ca90fd29c"></a>

```java
public short getFlags()
```

### getNumChildren() <a href="#m-getNumChildren-532d09a62d4c" id="m-getNumChildren-532d09a62d4c"></a>

```java
public int getNumChildren()
```

### getNumRecords() <a href="#m-getNumRecords-03318f72ab23" id="m-getNumRecords-03318f72ab23"></a>

```java
public short getNumRecords()
```

### getOff() <a href="#m-getOff-578b9943fd00" id="m-getOff-578b9943fd00"></a>

```java
public int getOff()
```

### getRecord(Source, int) <a href="#m-getRecord-e26482ff7b93" id="m-getRecord-e26482ff7b93"></a>

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

### read(Source, int) <a href="#m-read-c048381a08bd" id="m-read-c048381a08bd"></a>

**Package-private**

```java
final void read(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`

### readChild(Source, int, Child) <a href="#m-readChild-c2da12eeb9d7" id="m-readChild-c2da12eeb9d7"></a>

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
