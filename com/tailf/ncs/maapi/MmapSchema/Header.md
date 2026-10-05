<a id="cls-Header"></a>
# Header

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

- [Header(Source, int)](#m-header-7e393d717b0e)

**Fields**:

- [BYTE_ORDER_EXPECTED](#m-BYTE_ORDER_EXPECTED)
- [BYTE_ORDER_REVERSE](#m-BYTE_ORDER_REVERSE)
- [EXPECTED_MAGIC](#m-EXPECTED_MAGIC)

**Methods**:

- [getTreeLen()](#m-gettreelen-f0ab2ff698f1)
- [getTreeOff()](#m-gettreeoff-37a8f3ff6546)
- [read(Source, int)](#m-read-c048381a08bd)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-header-7e393d717b0e"></a>
### Header(Source, int)

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

<a id="m-BYTE_ORDER_EXPECTED"></a>
### BYTE_ORDER_EXPECTED

**Package-private**

```java
static final int BYTE_ORDER_EXPECTED = 1;
```

<a id="m-BYTE_ORDER_REVERSE"></a>
### BYTE_ORDER_REVERSE

**Package-private**

```java
static final int BYTE_ORDER_REVERSE = 16777216;
```

<a id="m-EXPECTED_MAGIC"></a>
### EXPECTED_MAGIC

**Package-private**

```java
static final String EXPECTED_MAGIC = "SCHEMA00";
```


## Methods

<a id="m-gettreelen-f0ab2ff698f1"></a>
### getTreeLen()

```java
public int getTreeLen()
```

<a id="m-gettreeoff-37a8f3ff6546"></a>
### getTreeOff()

```java
public int getTreeOff()
```

<a id="m-read-c048381a08bd"></a>
### read(Source, int)

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

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
