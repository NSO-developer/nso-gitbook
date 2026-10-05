<a id="s-Header"></a>
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

- [Header(Source, int)](#s-Header-1)

**Fields**:

- [BYTE_ORDER_EXPECTED](#s-BYTE_ORDER_EXPECTED)
- [BYTE_ORDER_REVERSE](#s-BYTE_ORDER_REVERSE)
- [EXPECTED_MAGIC](#s-EXPECTED_MAGIC)

**Methods**:

- [getTreeLen()](#s-getTreeLen)
- [getTreeOff()](#s-getTreeOff)
- [read(Source, int)](#s-read)
- [toString()](#s-toString)

## Constructors

<a id="s-Header-1"></a>
### Header(Source, int)

**Package-private**

```java
Header(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int pos
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Source](Source.md#s-Source), [MmapSchemaException](../MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos`


## Fields

<a id="s-BYTE_ORDER_EXPECTED"></a>
### BYTE_ORDER_EXPECTED

**Package-private**

```java
static final int BYTE_ORDER_EXPECTED = 1;
```

<a id="s-BYTE_ORDER_REVERSE"></a>
### BYTE_ORDER_REVERSE

**Package-private**

```java
static final int BYTE_ORDER_REVERSE = 16777216;
```

<a id="s-EXPECTED_MAGIC"></a>
### EXPECTED_MAGIC

**Package-private**

```java
static final String EXPECTED_MAGIC = "SCHEMA00";
```


## Methods

<a id="s-getTreeLen"></a>
### getTreeLen()

```java
public int getTreeLen()
```

<a id="s-getTreeOff"></a>
### getTreeOff()

```java
public int getTreeOff()
```

<a id="s-read"></a>
### read(Source, int)

**Package-private**

```java
final void read(
    com.tailf.ncs.maapi.MmapSchema.Source src,
    int pos0
)
    throws com.tailf.ncs.maapi.MmapSchemaException
```

Types: [Source](Source.md#s-Source), [MmapSchemaException](../MmapSchemaException.md#s-MmapSchemaException)

**Parameters**

- `com.tailf.ncs.maapi.MmapSchema.Source src`
- `int pos0`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
