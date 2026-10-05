# Header <a href="#cls-Header" id="cls-Header"></a>

**Package-private**

```java
class com.tailf.ncs.maapi.MmapSchema.Header
```

Schema header, comes first in the schema file with a magic identifying
 the schema file, then stats from the file and offsets to where tree and
 data starts.

 The read code of this class must be kept in sync with the schema file
 generation code.

## Members

**Constructors**:

- [Header(Source, int)](#m-Header-7e393d717b0e)

**Fields**:

- [BYTE_ORDER_EXPECTED](#m-BYTE_ORDER_EXPECTED)
- [BYTE_ORDER_REVERSE](#m-BYTE_ORDER_REVERSE)
- [EXPECTED_MAGIC](#m-EXPECTED_MAGIC)

**Methods**:

- [getTreeLen()](#m-getTreeLen-f0ab2ff698f1)
- [getTreeOff()](#m-getTreeOff-37a8f3ff6546)
- [read(Source, int)](#m-read-c048381a08bd)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### Header(Source, int) <a href="#m-Header-7e393d717b0e" id="m-Header-7e393d717b0e"></a>

**Package-private**

```java
Header(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int pos
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Source](Source.md#cls-Source), [MmapSchemaException](../MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`


## Fields

### BYTE_ORDER_EXPECTED <a href="#m-BYTE_ORDER_EXPECTED" id="m-BYTE_ORDER_EXPECTED"></a>

**Package-private**

```java
static final int BYTE_ORDER_EXPECTED = 1;
```

### BYTE_ORDER_REVERSE <a href="#m-BYTE_ORDER_REVERSE" id="m-BYTE_ORDER_REVERSE"></a>

**Package-private**

```java
static final int BYTE_ORDER_REVERSE = 16777216;
```

### EXPECTED_MAGIC <a href="#m-EXPECTED_MAGIC" id="m-EXPECTED_MAGIC"></a>

**Package-private**

```java
static final String EXPECTED_MAGIC = "SCHEMA00";
```


## Methods

### getTreeLen() <a href="#m-getTreeLen-f0ab2ff698f1" id="m-getTreeLen-f0ab2ff698f1"></a>

```java
public int getTreeLen()
```

### getTreeOff() <a href="#m-getTreeOff-37a8f3ff6546" id="m-getTreeOff-37a8f3ff6546"></a>

```java
public int getTreeOff()
```

### read(Source, int) <a href="#m-read-c048381a08bd" id="m-read-c048381a08bd"></a>

**Package-private**

```java
final void read(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int pos0
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Source](Source.md#cls-Source), [MmapSchemaException](../MmapSchemaException.md#cls-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos0`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
