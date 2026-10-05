# Header <a href="#header-abbb82929f2a" id="header-abbb82929f2a"></a>

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

- [Header(Source, int)](#header-7e393d717b0e)

**Fields**:

- [BYTE_ORDER_EXPECTED](#byte_order_expected-4d149330e9d2)
- [BYTE_ORDER_REVERSE](#byte_order_reverse-fb2c2407e2fe)
- [EXPECTED_MAGIC](#expected_magic-5e236c1543e1)

**Methods**:

- [getTreeLen()](#gettreelen-f0ab2ff698f1)
- [getTreeOff()](#gettreeoff-37a8f3ff6546)
- [read(Source, int)](#read-c048381a08bd)
- [toString()](#tostring-e9d48c5503ef)

## Constructors

### Header(Source, int) <a href="#header-7e393d717b0e" id="header-7e393d717b0e"></a>

**Package-private**

```java
Header(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int pos
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Source](Source.md#source-12fbee2b6a88), [MmapSchemaException](../MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`


## Fields

### BYTE_ORDER_EXPECTED <a href="#byte_order_expected-4d149330e9d2" id="byte_order_expected-4d149330e9d2"></a>

**Package-private**

```java
static final int BYTE_ORDER_EXPECTED = 1;
```

### BYTE_ORDER_REVERSE <a href="#byte_order_reverse-fb2c2407e2fe" id="byte_order_reverse-fb2c2407e2fe"></a>

**Package-private**

```java
static final int BYTE_ORDER_REVERSE = 16777216;
```

### EXPECTED_MAGIC <a href="#expected_magic-5e236c1543e1" id="expected_magic-5e236c1543e1"></a>

**Package-private**

```java
static final String EXPECTED_MAGIC = "SCHEMA00";
```


## Methods

### getTreeLen() <a href="#gettreelen-f0ab2ff698f1" id="gettreelen-f0ab2ff698f1"></a>

```java
public int getTreeLen()
```

### getTreeOff() <a href="#gettreeoff-37a8f3ff6546" id="gettreeoff-37a8f3ff6546"></a>

```java
public int getTreeOff()
```

### read(Source, int) <a href="#read-c048381a08bd" id="read-c048381a08bd"></a>

**Package-private**

```java
final void read(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int pos0
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Source](Source.md#source-12fbee2b6a88), [MmapSchemaException](../MmapSchemaException.md#mmapschemaexception-d3943c962514)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos0`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
