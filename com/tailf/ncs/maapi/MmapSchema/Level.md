# Level <a href="#level-1f9faf6c902d" id="level-1f9faf6c902d"></a>

```java
public class com.tailf.ncs.maapi.MmapSchema.Level
```

Level of data, corresponding to a single node in the schema tree.

## Members

**Constructors**:

- [Level(Source, int)](#level-9cb7eaef780c)

**Methods**:

- [getChild(Source, int)](#getchild-fd813ae0d5e9)
- [getFlags()](#getflags-3c1ca90fd29c)
- [getNumChildren()](#getnumchildren-532d09a62d4c)
- [getNumRecords()](#getnumrecords-03318f72ab23)
- [getOff()](#getoff-578b9943fd00)
- [getRecord(Source, int)](#getrecord-e26482ff7b93)
- [read(Source, int)](#read-c048381a08bd)
- [readChild(Source, int, Child)](#readchild-c2da12eeb9d7)

## Constructors

### Level(Source, int) <a href="#level-9cb7eaef780c" id="level-9cb7eaef780c"></a>

**Package-private**

```java
Level(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#source-12fbee2b6a88)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`


## Methods

### getChild(Source, int) <a href="#getchild-fd813ae0d5e9" id="getchild-fd813ae0d5e9"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Child getChild(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int childIdx
)
```

Types: [Child](Child.md#child-3362e9a5c263), [Source](Source.md#source-12fbee2b6a88)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int childIdx`

### getFlags() <a href="#getflags-3c1ca90fd29c" id="getflags-3c1ca90fd29c"></a>

```java
public short getFlags()
```

### getNumChildren() <a href="#getnumchildren-532d09a62d4c" id="getnumchildren-532d09a62d4c"></a>

```java
public int getNumChildren()
```

### getNumRecords() <a href="#getnumrecords-03318f72ab23" id="getnumrecords-03318f72ab23"></a>

```java
public short getNumRecords()
```

### getOff() <a href="#getoff-578b9943fd00" id="getoff-578b9943fd00"></a>

```java
public int getOff()
```

### getRecord(Source, int) <a href="#getrecord-e26482ff7b93" id="getrecord-e26482ff7b93"></a>

**Package-private**

```java
com.tailf.ncs.maapi.MmapSchema.Record getRecord(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int recordIdx
)
```

Types: [Record](Record.md#record-699adf6da380), [Source](Source.md#source-12fbee2b6a88)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int recordIdx`

### read(Source, int) <a href="#read-c048381a08bd" id="read-c048381a08bd"></a>

**Package-private**

```java
final void read(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#source-12fbee2b6a88)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`

### readChild(Source, int, Child) <a href="#readchild-c2da12eeb9d7" id="readchild-c2da12eeb9d7"></a>

**Package-private**

```java
void readChild(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int childIdx,
    com.tailf.ncs.maapi.MmapSchema.Child child
)
```

Types: [Source](Source.md#source-12fbee2b6a88), [Child](Child.md#child-3362e9a5c263)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int childIdx`
- `com.tailf.ncs.maapi.MmapSchema.Child child`
