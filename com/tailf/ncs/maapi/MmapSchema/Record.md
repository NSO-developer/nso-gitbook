<a id="s-Record"></a>
# Record

**Package-private**

```java
class com.tailf.ncs.maapi.MmapSchema.Record
```

Pointer to a unique schema record.

## Members

**Constructors**:

- [Record(Source, int)](#s-Record-1)

**Methods**:

- [getCsIdx()](#s-getCsIdx)
- [getFlags()](#s-getFlags)
- [getOff()](#s-getOff)
- [read(Source, int)](#s-read)

## Constructors

<a id="s-Record-1"></a>
### Record(Source, int)

**Package-private**

```java
Record(com.tailf.ncs.maapi.MmapSchema.Source src, int pos)
```

Types: [Source](Source.md#s-Source)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`


## Methods

<a id="s-getCsIdx"></a>
### getCsIdx()

```java
public int getCsIdx()
```

<a id="s-getFlags"></a>
### getFlags()

```java
public short getFlags()
```

<a id="s-getOff"></a>
### getOff()

```java
public int getOff()
```

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
