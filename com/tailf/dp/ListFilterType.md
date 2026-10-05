# ListFilterType <a href="#cls-ListFilterType" id="cls-ListFilterType"></a>

```java
public enum com.tailf.dp.ListFilterType
```

Types: [ListFilterType](ListFilterType.md#cls-ListFilterType)

Enumeration of list filter types

## Members

**Enum Constants**:

- [CONFD_LF_AND](#m-CONFD_LF_AND)
- [CONFD_LF_CMP](#m-CONFD_LF_CMP)
- [CONFD_LF_EXEC](#m-CONFD_LF_EXEC)
- [CONFD_LF_EXISTS](#m-CONFD_LF_EXISTS)
- [CONFD_LF_NOT](#m-CONFD_LF_NOT)
- [CONFD_LF_OR](#m-CONFD_LF_OR)
- [CONFD_LF_ORIGIN](#m-CONFD_LF_ORIGIN)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CONFD_LF_AND <a href="#m-CONFD_LF_AND" id="m-CONFD_LF_AND"></a>

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_AND;
```

This filter is the conjunction of the two filters given by expr1 and
 expr2.

### CONFD_LF_CMP <a href="#m-CONFD_LF_CMP" id="m-CONFD_LF_CMP"></a>

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_CMP;
```

This filter is a comparison between a node and a value.
 The type of comparison is given by the field op, the path to the
 node is given by the field node, and the value is given by the field
 val.

### CONFD_LF_EXEC <a href="#m-CONFD_LF_EXEC" id="m-CONFD_LF_EXEC"></a>

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_EXEC;
```

This filter is a function on a node and a value.
 The exact function is given by the field op, the node is given by
 the field node, and the value is given by the field val.

### CONFD_LF_EXISTS <a href="#m-CONFD_LF_EXISTS" id="m-CONFD_LF_EXISTS"></a>

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_EXISTS;
```

This filter is an existence check for the path given by the field
 node.

### CONFD_LF_NOT <a href="#m-CONFD_LF_NOT" id="m-CONFD_LF_NOT"></a>

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_NOT;
```

This filter is the inverse of another filter given by expr1.

### CONFD_LF_OR <a href="#m-CONFD_LF_OR" id="m-CONFD_LF_OR"></a>

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_OR;
```

This filter is the inclusive disjunction of the two filters given
 by expr1 and expr2.

### CONFD_LF_ORIGIN <a href="#m-CONFD_LF_ORIGIN" id="m-CONFD_LF_ORIGIN"></a>

```java
public static final com.tailf.dp.ListFilterType CONFD_LF_ORIGIN;
```

This filter is an origin check on a value.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

Get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.dp.ListFilterType valueOf(String name)
```

Types: [ListFilterType](ListFilterType.md#cls-ListFilterType)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.dp.ListFilterType[] values()
```

Types: [ListFilterType](ListFilterType.md#cls-ListFilterType)
