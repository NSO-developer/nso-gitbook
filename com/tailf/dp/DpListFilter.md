# DpListFilter <a href="#cls-DpListFilter" id="cls-DpListFilter"></a>

```java
public class com.tailf.dp.DpListFilter
```

This class represents list filters that may be passed to data providers.

## Members

**Constructors**:

- [DpListFilter(ConfETuple)](#m-DpListFilter-f7d847956d30)

**Fields**:

- [expr1](#m-expr1)
- [expr2](#m-expr2)
- [node](#m-node)
- [op](#m-op)
- [type](#m-type)
- [val](#m-val)
- [values](#m-values)

**Methods**:

- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### DpListFilter(ConfETuple) <a href="#m-DpListFilter-f7d847956d30" id="m-DpListFilter-f7d847956d30"></a>

**Package-private**

```java
DpListFilter(
    com.tailf.proto.ConfETuple et
)
    throws com.tailf.proto.ConfERangeException, com.tailf.conf.ConfException, com.tailf.dp.DpException
```

Types: [ConfETuple](../proto/ConfETuple.md#cls-ConfETuple), [ConfERangeException](../proto/ConfERangeException.md#cls-ConfERangeException), [ConfException](../conf/ConfException.md#cls-ConfException), [DpException](DpException.md#cls-DpException)

**Parameters**

- `com.tailf.proto.ConfETuple et`


## Fields

### expr1 <a href="#m-expr1" id="m-expr1"></a>

```java
public com.tailf.dp.DpListFilter expr1 = null;
```

Types: [DpListFilter](DpListFilter.md#cls-DpListFilter)

Subfilter to use when type is [`ListFilterType#CONFD_LF_OR`](ListFilterType.md#m-CONFD_LF_OR),
 [`ListFilterType#CONFD_LF_AND`](ListFilterType.md#m-CONFD_LF_AND) or
 [`ListFilterType#CONFD_LF_NOT`](ListFilterType.md#m-CONFD_LF_NOT)

### expr2 <a href="#m-expr2" id="m-expr2"></a>

```java
public com.tailf.dp.DpListFilter expr2 = null;
```

Types: [DpListFilter](DpListFilter.md#cls-DpListFilter)

Second subfilter to use when type is [`ListFilterType#CONFD_LF_OR`](ListFilterType.md#m-CONFD_LF_OR)
 or [`ListFilterType#CONFD_LF_AND`](ListFilterType.md#m-CONFD_LF_AND)

### node <a href="#m-node" id="m-node"></a>

```java
public com.tailf.conf.ConfObject[] node = null;
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Node to use when type is [`ListFilterType#CONFD_LF_CMP`](ListFilterType.md#m-CONFD_LF_CMP),
 [`ListFilterType#CONFD_LF_EXEC`](ListFilterType.md#m-CONFD_LF_EXEC) or
 [`ListFilterType#CONFD_LF_EXISTS`](ListFilterType.md#m-CONFD_LF_EXISTS)

### op <a href="#m-op" id="m-op"></a>

```java
public com.tailf.dp.ListFilterExprOp op = null;
```

Types: [ListFilterExprOp](ListFilterExprOp.md#cls-ListFilterExprOp)

Operation or function to use when type is
 [`ListFilterType#CONFD_LF_CMP`](ListFilterType.md#m-CONFD_LF_CMP) or
 [`ListFilterType#CONFD_LF_EXEC`](ListFilterType.md#m-CONFD_LF_EXEC)

### type <a href="#m-type" id="m-type"></a>

```java
public com.tailf.dp.ListFilterType type = null;
```

Types: [ListFilterType](ListFilterType.md#cls-ListFilterType)

The type of filter

### val <a href="#m-val" id="m-val"></a>

```java
public com.tailf.conf.ConfObject val = null;
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Value to use when type is [`ListFilterType#CONFD_LF_CMP`](ListFilterType.md#m-CONFD_LF_CMP) or
 [`ListFilterType#CONFD_LF_EXEC`](ListFilterType.md#m-CONFD_LF_EXEC) or
 [`ListFilterType#CONFD_LF_ORIGIN`](ListFilterType.md#m-CONFD_LF_ORIGIN)

### values <a href="#m-values" id="m-values"></a>

```java
public com.tailf.conf.ConfObject[] values = null;
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)


## Methods

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
