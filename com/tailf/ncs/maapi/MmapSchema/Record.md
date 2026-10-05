# Record <a href="#cls-Record" id="cls-Record"></a>

**Package-private**

```java
class com.tailf.ncs.maapi.MmapSchema.Record
```

Pointer to a unique schema record.

## Members

**Constructors**:

- [Record(Source, int)](#m-Record-b0cdb48ebc6b)

**Methods**:

- [getCsIdx()](#m-getCsIdx-c6cc07a1d6c3)
- [getFlags()](#m-getFlags-3c1ca90fd29c)
- [getOff()](#m-getOff-578b9943fd00)
- [read(Source, int)](#m-read-c048381a08bd)

## Constructors

### Record(Source, int) <a href="#m-Record-b0cdb48ebc6b" id="m-Record-b0cdb48ebc6b"></a>

**Package-private**

```java
Record(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`


## Methods

### getCsIdx() <a href="#m-getCsIdx-c6cc07a1d6c3" id="m-getCsIdx-c6cc07a1d6c3"></a>

```java
public int getCsIdx()
```

### getFlags() <a href="#m-getFlags-3c1ca90fd29c" id="m-getFlags-3c1ca90fd29c"></a>

```java
public short getFlags()
```

### getOff() <a href="#m-getOff-578b9943fd00" id="m-getOff-578b9943fd00"></a>

```java
public int getOff()
```

### read(Source, int) <a href="#m-read-c048381a08bd" id="m-read-c048381a08bd"></a>

**Package-private**

```java
final void read(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`
