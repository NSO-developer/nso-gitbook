# ListFilterExprOp <a href="#cls-ListFilterExprOp" id="cls-ListFilterExprOp"></a>

```java
public enum com.tailf.dp.ListFilterExprOp
```

Types: [ListFilterExprOp](ListFilterExprOp.md#cls-ListFilterExprOp)

The type of comparison or function to employ when the filter type is
 [`ListFilterType#CONFD_LF_CMP`](ListFilterType.md#m-CONFD_LF_CMP) or [`ListFilterType#CONFD_LF_EXEC`](ListFilterType.md#m-CONFD_LF_EXEC).

## Members

**Enum Constants**:

- [CONFD_CMP_EQ](#m-CONFD_CMP_EQ)
- [CONFD_CMP_GT](#m-CONFD_CMP_GT)
- [CONFD_CMP_GTE](#m-CONFD_CMP_GTE)
- [CONFD_CMP_LT](#m-CONFD_CMP_LT)
- [CONFD_CMP_LTE](#m-CONFD_CMP_LTE)
- [CONFD_CMP_NEQ](#m-CONFD_CMP_NEQ)
- [CONFD_CMP_NOP](#m-CONFD_CMP_NOP)
- [CONFD_EXEC_COMPARE](#m-CONFD_EXEC_COMPARE)
- [CONFD_EXEC_CONTAINS](#m-CONFD_EXEC_CONTAINS)
- [CONFD_EXEC_DERIVED_FROM](#m-CONFD_EXEC_DERIVED_FROM)
- [CONFD_EXEC_DERIVED_FROM_OR_SELF](#m-CONFD_EXEC_DERIVED_FROM_OR_SELF)
- [CONFD_EXEC_RE_MATCH](#m-CONFD_EXEC_RE_MATCH)
- [CONFD_EXEC_STARTS_WITH](#m-CONFD_EXEC_STARTS_WITH)
- [CONFD_EXEC_STRING_COMPARE](#m-CONFD_EXEC_STRING_COMPARE)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### CONFD_CMP_EQ <a href="#m-CONFD_CMP_EQ" id="m-CONFD_CMP_EQ"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_EQ;
```

Equality

### CONFD_CMP_GT <a href="#m-CONFD_CMP_GT" id="m-CONFD_CMP_GT"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_GT;
```

Greater than

### CONFD_CMP_GTE <a href="#m-CONFD_CMP_GTE" id="m-CONFD_CMP_GTE"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_GTE;
```

Greater than or equal

### CONFD_CMP_LT <a href="#m-CONFD_CMP_LT" id="m-CONFD_CMP_LT"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_LT;
```

Less than

### CONFD_CMP_LTE <a href="#m-CONFD_CMP_LTE" id="m-CONFD_CMP_LTE"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_LTE;
```

Less than or equal

### CONFD_CMP_NEQ <a href="#m-CONFD_CMP_NEQ" id="m-CONFD_CMP_NEQ"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_NEQ;
```

Inequality

### CONFD_CMP_NOP <a href="#m-CONFD_CMP_NOP" id="m-CONFD_CMP_NOP"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_NOP;
```

No operation.

### CONFD_EXEC_COMPARE <a href="#m-CONFD_EXEC_COMPARE" id="m-CONFD_EXEC_COMPARE"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_COMPARE;
```

compare function

### CONFD_EXEC_CONTAINS <a href="#m-CONFD_EXEC_CONTAINS" id="m-CONFD_EXEC_CONTAINS"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_CONTAINS;
```

contains function

### CONFD_EXEC_DERIVED_FROM <a href="#m-CONFD_EXEC_DERIVED_FROM" id="m-CONFD_EXEC_DERIVED_FROM"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_DERIVED_FROM;
```

derived-from function

### CONFD_EXEC_DERIVED_FROM_OR_SELF <a href="#m-CONFD_EXEC_DERIVED_FROM_OR_SELF" id="m-CONFD_EXEC_DERIVED_FROM_OR_SELF"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_DERIVED_FROM_OR_SELF;
```

derived-from-or-self function

### CONFD_EXEC_RE_MATCH <a href="#m-CONFD_EXEC_RE_MATCH" id="m-CONFD_EXEC_RE_MATCH"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_RE_MATCH;
```

re-match function

### CONFD_EXEC_STARTS_WITH <a href="#m-CONFD_EXEC_STARTS_WITH" id="m-CONFD_EXEC_STARTS_WITH"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_STARTS_WITH;
```

starts-with function

### CONFD_EXEC_STRING_COMPARE <a href="#m-CONFD_EXEC_STRING_COMPARE" id="m-CONFD_EXEC_STRING_COMPARE"></a>

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_STRING_COMPARE;
```

string-compare function


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

Get integer value for enum

**Returns:** int value

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.dp.ListFilterExprOp valueOf(String name)
```

Types: [ListFilterExprOp](ListFilterExprOp.md#cls-ListFilterExprOp)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.dp.ListFilterExprOp[] values()
```

Types: [ListFilterExprOp](ListFilterExprOp.md#cls-ListFilterExprOp)
