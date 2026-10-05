<a id="cls-DpListFilter"></a>
# DpListFilter

```java
public class com.tailf.dp.DpListFilter
```

This class represents list filters that may be passed to data providers.

## Members

**Constructors**:

- [DpListFilter(ConfETuple)](#m-dplistfilter-f7d847956d30)

**Fields**:

- [expr1](#m-expr1)
- [expr2](#m-expr2)
- [node](#m-node)
- [op](#m-op)
- [type](#m-type)
- [val](#m-val)
- [values](#m-values)

**Methods**:

- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-dplistfilter-f7d847956d30"></a>
### DpListFilter(ConfETuple)

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

<a id="m-expr1"></a>
### expr1

```java
public com.tailf.dp.DpListFilter expr1 = null;
```

Types: [DpListFilter](DpListFilter.md#cls-DpListFilter)

Subfilter to use when type is [`ListFilterType#CONFD_LF_OR`](ListFilterType.md#m-CONFD_LF_OR),
 [`ListFilterType#CONFD_LF_AND`](ListFilterType.md#m-CONFD_LF_AND) or
 [`ListFilterType#CONFD_LF_NOT`](ListFilterType.md#m-CONFD_LF_NOT)

<a id="m-expr2"></a>
### expr2

```java
public com.tailf.dp.DpListFilter expr2 = null;
```

Types: [DpListFilter](DpListFilter.md#cls-DpListFilter)

Second subfilter to use when type is [`ListFilterType#CONFD_LF_OR`](ListFilterType.md#m-CONFD_LF_OR)
 or [`ListFilterType#CONFD_LF_AND`](ListFilterType.md#m-CONFD_LF_AND)

<a id="m-node"></a>
### node

```java
public com.tailf.conf.ConfObject[] node = null;
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Node to use when type is [`ListFilterType#CONFD_LF_CMP`](ListFilterType.md#m-CONFD_LF_CMP),
 [`ListFilterType#CONFD_LF_EXEC`](ListFilterType.md#m-CONFD_LF_EXEC) or
 [`ListFilterType#CONFD_LF_EXISTS`](ListFilterType.md#m-CONFD_LF_EXISTS)

<a id="m-op"></a>
### op

```java
public com.tailf.dp.ListFilterExprOp op = null;
```

Types: [ListFilterExprOp](ListFilterExprOp.md#cls-ListFilterExprOp)

Operation or function to use when type is
 [`ListFilterType#CONFD_LF_CMP`](ListFilterType.md#m-CONFD_LF_CMP) or
 [`ListFilterType#CONFD_LF_EXEC`](ListFilterType.md#m-CONFD_LF_EXEC)

<a id="m-type"></a>
### type

```java
public com.tailf.dp.ListFilterType type = null;
```

Types: [ListFilterType](ListFilterType.md#cls-ListFilterType)

The type of filter

<a id="m-val"></a>
### val

```java
public com.tailf.conf.ConfObject val = null;
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)

Value to use when type is [`ListFilterType#CONFD_LF_CMP`](ListFilterType.md#m-CONFD_LF_CMP) or
 [`ListFilterType#CONFD_LF_EXEC`](ListFilterType.md#m-CONFD_LF_EXEC) or
 [`ListFilterType#CONFD_LF_ORIGIN`](ListFilterType.md#m-CONFD_LF_ORIGIN)

<a id="m-values"></a>
### values

```java
public com.tailf.conf.ConfObject[] values = null;
```

Types: [ConfObject](../conf/ConfObject.md#cls-ConfObject)


## Methods

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
