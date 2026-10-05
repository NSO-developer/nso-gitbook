# Record <a href="#record-699adf6da380" id="record-699adf6da380"></a>

**Package-private**

```java
class com.tailf.ncs.maapi.MmapSchema.Record
```

Pointer to a unique schema record.

## Members

**Constructors**:

- [Record(Source, int)](#record-b0cdb48ebc6b)

**Methods**:

- [getCsIdx()](#getcsidx-c6cc07a1d6c3)
- [getFlags()](#getflags-3c1ca90fd29c)
- [getOff()](#getoff-578b9943fd00)
- [read(Source, int)](#read-c048381a08bd)

## Constructors

### Record(Source, int) <a href="#record-b0cdb48ebc6b" id="record-b0cdb48ebc6b"></a>

**Package-private**

```java
Record(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#source-12fbee2b6a88)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`


## Methods

### getCsIdx() <a href="#getcsidx-c6cc07a1d6c3" id="getcsidx-c6cc07a1d6c3"></a>

```java
public int getCsIdx()
```

### getFlags() <a href="#getflags-3c1ca90fd29c" id="getflags-3c1ca90fd29c"></a>

```java
public short getFlags()
```

### getOff() <a href="#getoff-578b9943fd00" id="getoff-578b9943fd00"></a>

```java
public int getOff()
```

### read(Source, int) <a href="#read-c048381a08bd" id="read-c048381a08bd"></a>

**Package-private**

```java
final void read(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#source-12fbee2b6a88)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`
