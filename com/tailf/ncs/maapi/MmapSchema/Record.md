<a id="cls-Record"></a>
# Record

**Package-private**

```java
class com.tailf.ncs.maapi.MmapSchema.Record
```

Pointer to a unique schema record.

## Members

**Constructors**:

- [Record(Source, int)](#m-record-b0cdb48ebc6b)

**Methods**:

- [getCsIdx()](#m-getcsidx-c6cc07a1d6c3)
- [getFlags()](#m-getflags-3c1ca90fd29c)
- [getOff()](#m-getoff-578b9943fd00)
- [read(Source, int)](#m-read-c048381a08bd)

## Constructors

<a id="m-record-b0cdb48ebc6b"></a>
### Record(Source, int)

**Package-private**

```java
Record(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#cls-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`


## Methods

<a id="m-getcsidx-c6cc07a1d6c3"></a>
### getCsIdx()

```java
public int getCsIdx()
```

<a id="m-getflags-3c1ca90fd29c"></a>
### getFlags()

```java
public short getFlags()
```

<a id="m-getoff-578b9943fd00"></a>
### getOff()

```java
public int getOff()
```

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
