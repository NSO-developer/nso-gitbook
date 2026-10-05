# ListFilterExprOp <a href="#listfilterexprop-7e720d295cdf" id="listfilterexprop-7e720d295cdf"></a>

```java
public enum com.tailf.dp.ListFilterExprOp
```

Types: [ListFilterExprOp](ListFilterExprOp.md#listfilterexprop-7e720d295cdf)

The type of comparison or function to employ when the filter type is
 [`ListFilterType#CONFD_LF_CMP`](ListFilterType.md#confd_lf_cmp-583727db1b1c) or [`ListFilterType#CONFD_LF_EXEC`](ListFilterType.md#confd_lf_exec-5af1f0461120).

## Members

**Enum Constants**:

- [CONFD\_CMP\_EQ](#confd_cmp_eq-332b4448fb0b)
- [CONFD\_CMP\_GT](#confd_cmp_gt-ceabc5eebdaa)
- [CONFD\_CMP\_GTE](#confd_cmp_gte-17a7fc0ae59d)
- [CONFD\_CMP\_LT](#confd_cmp_lt-2b3a94accb8e)
- [CONFD\_CMP\_LTE](#confd_cmp_lte-3e74f2fe4da2)
- [CONFD\_CMP\_NEQ](#confd_cmp_neq-33fb0499d0d8)
- [CONFD\_CMP\_NOP](#confd_cmp_nop-7a2b3b30fe2f)
- [CONFD\_EXEC\_COMPARE](#confd_exec_compare-c0037182c849)
- [CONFD\_EXEC\_CONTAINS](#confd_exec_contains-106a13bdce5f)
- [CONFD\_EXEC\_DERIVED\_FROM](#confd_exec_derived_from-a67889e0504c)
- [CONFD\_EXEC\_DERIVED\_FROM\_OR\_SELF](#confd_exec_derived_from_or_self-d3f85307a1e8)
- [CONFD\_EXEC\_RE\_MATCH](#confd_exec_re_match-861818357283)
- [CONFD\_EXEC\_STARTS\_WITH](#confd_exec_starts_with-d5e15acec3a3)
- [CONFD\_EXEC\_STRING\_COMPARE](#confd_exec_string_compare-d4bf1b4c2d15)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### CONFD_CMP_EQ <a href="#confd_cmp_eq-332b4448fb0b" id="confd_cmp_eq-332b4448fb0b"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_EQ;
```

Equality

### CONFD_CMP_GT <a href="#confd_cmp_gt-ceabc5eebdaa" id="confd_cmp_gt-ceabc5eebdaa"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_GT;
```

Greater than

### CONFD_CMP_GTE <a href="#confd_cmp_gte-17a7fc0ae59d" id="confd_cmp_gte-17a7fc0ae59d"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_GTE;
```

Greater than or equal

### CONFD_CMP_LT <a href="#confd_cmp_lt-2b3a94accb8e" id="confd_cmp_lt-2b3a94accb8e"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_LT;
```

Less than

### CONFD_CMP_LTE <a href="#confd_cmp_lte-3e74f2fe4da2" id="confd_cmp_lte-3e74f2fe4da2"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_LTE;
```

Less than or equal

### CONFD_CMP_NEQ <a href="#confd_cmp_neq-33fb0499d0d8" id="confd_cmp_neq-33fb0499d0d8"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_NEQ;
```

Inequality

### CONFD_CMP_NOP <a href="#confd_cmp_nop-7a2b3b30fe2f" id="confd_cmp_nop-7a2b3b30fe2f"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_NOP;
```

No operation.

### CONFD_EXEC_COMPARE <a href="#confd_exec_compare-c0037182c849" id="confd_exec_compare-c0037182c849"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_COMPARE;
```

compare function

### CONFD_EXEC_CONTAINS <a href="#confd_exec_contains-106a13bdce5f" id="confd_exec_contains-106a13bdce5f"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_CONTAINS;
```

contains function

### CONFD_EXEC_DERIVED_FROM <a href="#confd_exec_derived_from-a67889e0504c" id="confd_exec_derived_from-a67889e0504c"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_DERIVED_FROM;
```

derived-from function

### CONFD_EXEC_DERIVED_FROM_OR_SELF <a href="#confd_exec_derived_from_or_self-d3f85307a1e8" id="confd_exec_derived_from_or_self-d3f85307a1e8"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_DERIVED_FROM_OR_SELF;
```

derived-from-or-self function

### CONFD_EXEC_RE_MATCH <a href="#confd_exec_re_match-861818357283" id="confd_exec_re_match-861818357283"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_RE_MATCH;
```

re-match function

### CONFD_EXEC_STARTS_WITH <a href="#confd_exec_starts_with-d5e15acec3a3" id="confd_exec_starts_with-d5e15acec3a3"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_STARTS_WITH;
```

starts-with function

### CONFD_EXEC_STRING_COMPARE <a href="#confd_exec_string_compare-d4bf1b4c2d15" id="confd_exec_string_compare-d4bf1b4c2d15"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_STRING_COMPARE;
```

string-compare function


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

Get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.dp.ListFilterExprOp valueOf(String name)
```

Types: [ListFilterExprOp](ListFilterExprOp.md#listfilterexprop-7e720d295cdf)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.dp.ListFilterExprOp[] values()
```

Types: [ListFilterExprOp](ListFilterExprOp.md#listfilterexprop-7e720d295cdf)
