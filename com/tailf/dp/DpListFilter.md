<a id="s-DpListFilter"></a>
# DpListFilter

```java
public class com.tailf.dp.DpListFilter
```

This class represents list filters that may be passed to data providers.

## Members

**Constructors**:

- [DpListFilter(ConfETuple)](#s-DpListFilter-1)

**Fields**:

- [expr1](#s-expr1)
- [expr2](#s-expr2)
- [node](#s-node)
- [op](#s-op)
- [type](#s-type)
- [val](#s-val)
- [values](#s-values)

**Methods**:

- [toString()](#s-toString)

## Constructors

<a id="s-DpListFilter-1"></a>
### DpListFilter(ConfETuple)

**Package-private**

```java
DpListFilter(
    com.tailf.proto.ConfETuple et
)
    throws com.tailf.proto.ConfERangeException, com.tailf.conf.ConfException, com.tailf.dp.DpException
```

Types: [ConfETuple](../proto/ConfETuple.md#s-ConfETuple), [ConfERangeException](../proto/ConfERangeException.md#s-ConfERangeException), [ConfException](../conf/ConfException.md#s-ConfException), [DpException](DpException.md#s-DpException)

**Parameters**

- `com.tailf.proto.ConfETuple et`


## Fields

<a id="s-expr1"></a>
### expr1

```java
public com.tailf.dp.DpListFilter expr1 = null;
```

Types: [DpListFilter](DpListFilter.md#s-DpListFilter)

Subfilter to use when type is [`ListFilterType`](ListFilterType.md#s-ListFilterType),
 [`ListFilterType`](ListFilterType.md#s-ListFilterType) or
 [`ListFilterType`](ListFilterType.md#s-ListFilterType)

<a id="s-expr2"></a>
### expr2

```java
public com.tailf.dp.DpListFilter expr2 = null;
```

Types: [DpListFilter](DpListFilter.md#s-DpListFilter)

Second subfilter to use when type is [`ListFilterType`](ListFilterType.md#s-ListFilterType)
 or [`ListFilterType`](ListFilterType.md#s-ListFilterType)

<a id="s-node"></a>
### node

```java
public com.tailf.conf.ConfObject[] node = null;
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)

Node to use when type is [`ListFilterType`](ListFilterType.md#s-ListFilterType),
 [`ListFilterType`](ListFilterType.md#s-ListFilterType) or
 [`ListFilterType`](ListFilterType.md#s-ListFilterType)

<a id="s-op"></a>
### op

```java
public com.tailf.dp.ListFilterExprOp op = null;
```

Types: [ListFilterExprOp](ListFilterExprOp.md#s-ListFilterExprOp)

Operation or function to use when type is
 [`ListFilterType`](ListFilterType.md#s-ListFilterType) or
 [`ListFilterType`](ListFilterType.md#s-ListFilterType)

<a id="s-type"></a>
### type

```java
public com.tailf.dp.ListFilterType type = null;
```

Types: [ListFilterType](ListFilterType.md#s-ListFilterType)

The type of filter

<a id="s-val"></a>
### val

```java
public com.tailf.conf.ConfObject val = null;
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)

Value to use when type is [`ListFilterType`](ListFilterType.md#s-ListFilterType) or
 [`ListFilterType`](ListFilterType.md#s-ListFilterType) or
 [`ListFilterType`](ListFilterType.md#s-ListFilterType)

<a id="s-values"></a>
### values

```java
public com.tailf.conf.ConfObject[] values = null;
```

Types: [ConfObject](../conf/ConfObject.md#s-ConfObject)


## Methods

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
