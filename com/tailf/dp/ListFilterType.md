# ListFilterType <a href="#listfiltertype-64b4a39256c7" id="listfiltertype-64b4a39256c7"></a>

```java
public enum com.tailf.dp.ListFilterType
```

Enumeration of list filter types

## Members

**Enum Constants**:

- [CONFD\_LF\_AND](#confd_lf_and-21574f054605)
- [CONFD\_LF\_CMP](#confd_lf_cmp-583727db1b1c)
- [CONFD\_LF\_EXEC](#confd_lf_exec-5af1f0461120)
- [CONFD\_LF\_EXISTS](#confd_lf_exists-dfdd2bdabe58)
- [CONFD\_LF\_NOT](#confd_lf_not-303281c57901)
- [CONFD\_LF\_OR](#confd_lf_or-e8352365e0cd)
- [CONFD\_LF\_ORIGIN](#confd_lf_origin-91a898baad60)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CONFD_LF_AND <a href="#confd_lf_and-21574f054605" id="confd_lf_and-21574f054605"></a>

```java
CONFD_LF_AND(1);
```

This filter is the conjunction of the two filters given by expr1 and
 expr2.

### CONFD_LF_CMP <a href="#confd_lf_cmp-583727db1b1c" id="confd_lf_cmp-583727db1b1c"></a>

```java
CONFD_LF_CMP(3);
```

This filter is a comparison between a node and a value.
 The type of comparison is given by the field op, the path to the
 node is given by the field node, and the value is given by the field
 val.

### CONFD_LF_EXEC <a href="#confd_lf_exec-5af1f0461120" id="confd_lf_exec-5af1f0461120"></a>

```java
CONFD_LF_EXEC(5);
```

This filter is a function on a node and a value.
 The exact function is given by the field op, the node is given by
 the field node, and the value is given by the field val.

### CONFD_LF_EXISTS <a href="#confd_lf_exists-dfdd2bdabe58" id="confd_lf_exists-dfdd2bdabe58"></a>

```java
CONFD_LF_EXISTS(4);
```

This filter is an existence check for the path given by the field
 node.

### CONFD_LF_NOT <a href="#confd_lf_not-303281c57901" id="confd_lf_not-303281c57901"></a>

```java
CONFD_LF_NOT(2);
```

This filter is the inverse of another filter given by expr1.

### CONFD_LF_OR <a href="#confd_lf_or-e8352365e0cd" id="confd_lf_or-e8352365e0cd"></a>

```java
CONFD_LF_OR(0);
```

This filter is the inclusive disjunction of the two filters given
 by expr1 and expr2.

### CONFD_LF_ORIGIN <a href="#confd_lf_origin-91a898baad60" id="confd_lf_origin-91a898baad60"></a>

```java
CONFD_LF_ORIGIN(6);
```

This filter is an origin check on a value.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

Get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.dp.ListFilterType valueOf(String name)
```

Types: [ListFilterType](ListFilterType.md#listfiltertype-64b4a39256c7)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.dp.ListFilterType[] values()
```

Types: [ListFilterType](ListFilterType.md#listfiltertype-64b4a39256c7)
