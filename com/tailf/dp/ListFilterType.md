<a id="s-ListFilterType"></a>
# ListFilterType

```java
public enum com.tailf.dp.ListFilterType
```

Types: [ListFilterType](ListFilterType.md#s-ListFilterType)

Enumeration of list filter types

**Related classes**

- [ListFilterType](ListFilterType.md#s-ListFilterType)

## Members

**Enum Constants**:

- [CONFD_LF_AND](#s-CONFD_LF_AND)
- [CONFD_LF_CMP](#s-CONFD_LF_CMP)
- [CONFD_LF_EXEC](#s-CONFD_LF_EXEC)
- [CONFD_LF_EXISTS](#s-CONFD_LF_EXISTS)
- [CONFD_LF_NOT](#s-CONFD_LF_NOT)
- [CONFD_LF_OR](#s-CONFD_LF_OR)
- [CONFD_LF_ORIGIN](#s-CONFD_LF_ORIGIN)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-CONFD_LF_AND"></a>
### CONFD_LF_AND

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_AND;
```

This filter is the conjunction of the two filters given by expr1 and
 expr2.

<a id="s-CONFD_LF_CMP"></a>
### CONFD_LF_CMP

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_CMP;
```

This filter is a comparison between a node and a value.
 The type of comparison is given by the field op, the path to the
 node is given by the field node, and the value is given by the field
 val.

<a id="s-CONFD_LF_EXEC"></a>
### CONFD_LF_EXEC

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_EXEC;
```

This filter is a function on a node and a value.
 The exact function is given by the field op, the node is given by
 the field node, and the value is given by the field val.

<a id="s-CONFD_LF_EXISTS"></a>
### CONFD_LF_EXISTS

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_EXISTS;
```

This filter is an existence check for the path given by the field
 node.

<a id="s-CONFD_LF_NOT"></a>
### CONFD_LF_NOT

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_NOT;
```

This filter is the inverse of another filter given by expr1.

<a id="s-CONFD_LF_OR"></a>
### CONFD_LF_OR

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_OR;
```

This filter is the inclusive disjunction of the two filters given
 by expr1 and expr2.

<a id="s-CONFD_LF_ORIGIN"></a>
### CONFD_LF_ORIGIN

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_ORIGIN;
```

This filter is an origin check on a value.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

Get integer value for enum

**Returns:** int value

<a id="s-valueOf"></a>
### valueOf(String)

```java
public static com.tailf.dp.ListFilterType valueOf(String name)
```

Types: [ListFilterType](ListFilterType.md#s-ListFilterType)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.dp.ListFilterType[] values()
```

Types: [ListFilterType](ListFilterType.md#s-ListFilterType)
