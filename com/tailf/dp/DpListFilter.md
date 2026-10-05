# DpListFilter <a href="#dplistfilter-fe6aac67a14c" id="dplistfilter-fe6aac67a14c"></a>

```java
public class com.tailf.dp.DpListFilter
```

This class represents list filters that may be passed to data providers.

## Members

**Constructors**:

- [DpListFilter\(ConfETuple\)](#dplistfilter-f7d847956d30)

**Fields**:

- [expr1](#expr1-0e9b89997dfd)
- [expr2](#expr2-17c5ad710412)
- [node](#node-ff68e6a3ebc6)
- [op](#op-7ac7f5ec86b1)
- [type](#type-6ebb3673fbb6)
- [val](#val-a02e160da60f)
- [values](#values-785122778feb)

**Methods**:

- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### DpListFilter(ConfETuple) <a href="#dplistfilter-f7d847956d30" id="dplistfilter-f7d847956d30"></a>

**Package-private**

```java
DpListFilter(
    com.tailf.proto.ConfETuple et
)
    throws com.tailf.proto.ConfERangeException, com.tailf.conf.ConfException, com.tailf.dp.DpException
```

Types: [ConfETuple](../proto/ConfETuple.md#confetuple-b1f9702a82a1), [ConfERangeException](../proto/ConfERangeException.md#conferangeexception-3f566066d5e7), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9), [DpException](DpException.md#dpexception-79c01c670be8)

**Parameters**

- `com.tailf.proto.ConfETuple et`


## Fields

### expr1 <a href="#expr1-0e9b89997dfd" id="expr1-0e9b89997dfd"></a>

```java
public com.tailf.dp.DpListFilter expr1 = null;
```

Types: [DpListFilter](DpListFilter.md#dplistfilter-fe6aac67a14c)

Subfilter to use when type is [`ListFilterType#CONFD_LF_OR`](ListFilterType.md#confd_lf_or-e8352365e0cd),
 [`ListFilterType#CONFD_LF_AND`](ListFilterType.md#confd_lf_and-21574f054605) or
 [`ListFilterType#CONFD_LF_NOT`](ListFilterType.md#confd_lf_not-303281c57901)

### expr2 <a href="#expr2-17c5ad710412" id="expr2-17c5ad710412"></a>

```java
public com.tailf.dp.DpListFilter expr2 = null;
```

Types: [DpListFilter](DpListFilter.md#dplistfilter-fe6aac67a14c)

Second subfilter to use when type is [`ListFilterType#CONFD_LF_OR`](ListFilterType.md#confd_lf_or-e8352365e0cd)
 or [`ListFilterType#CONFD_LF_AND`](ListFilterType.md#confd_lf_and-21574f054605)

### node <a href="#node-ff68e6a3ebc6" id="node-ff68e6a3ebc6"></a>

```java
public com.tailf.conf.ConfObject[] node = null;
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

Node to use when type is [`ListFilterType#CONFD_LF_CMP`](ListFilterType.md#confd_lf_cmp-583727db1b1c),
 [`ListFilterType#CONFD_LF_EXEC`](ListFilterType.md#confd_lf_exec-5af1f0461120) or
 [`ListFilterType#CONFD_LF_EXISTS`](ListFilterType.md#confd_lf_exists-dfdd2bdabe58)

### op <a href="#op-7ac7f5ec86b1" id="op-7ac7f5ec86b1"></a>

```java
public com.tailf.dp.ListFilterExprOp op = null;
```

Types: [ListFilterExprOp](ListFilterExprOp.md#listfilterexprop-7e720d295cdf)

Operation or function to use when type is
 [`ListFilterType#CONFD_LF_CMP`](ListFilterType.md#confd_lf_cmp-583727db1b1c) or
 [`ListFilterType#CONFD_LF_EXEC`](ListFilterType.md#confd_lf_exec-5af1f0461120)

### type <a href="#type-6ebb3673fbb6" id="type-6ebb3673fbb6"></a>

```java
public com.tailf.dp.ListFilterType type = null;
```

Types: [ListFilterType](ListFilterType.md#listfiltertype-64b4a39256c7)

The type of filter

### val <a href="#val-a02e160da60f" id="val-a02e160da60f"></a>

```java
public com.tailf.conf.ConfObject val = null;
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)

Value to use when type is [`ListFilterType#CONFD_LF_CMP`](ListFilterType.md#confd_lf_cmp-583727db1b1c) or
 [`ListFilterType#CONFD_LF_EXEC`](ListFilterType.md#confd_lf_exec-5af1f0461120) or
 [`ListFilterType#CONFD_LF_ORIGIN`](ListFilterType.md#confd_lf_origin-91a898baad60)

### values <a href="#values-785122778feb" id="values-785122778feb"></a>

```java
public com.tailf.conf.ConfObject[] values = null;
```

Types: [ConfObject](../conf/ConfObject.md#confobject-5433616953b2)


## Methods

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
