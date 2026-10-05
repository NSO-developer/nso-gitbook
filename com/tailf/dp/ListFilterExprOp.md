<a id="s-ListFilterExprOp"></a>
# ListFilterExprOp

```java
public enum com.tailf.dp.ListFilterExprOp
```

Types: [ListFilterExprOp](ListFilterExprOp.md#s-ListFilterExprOp)

The type of comparison or function to employ when the filter type is
 [`ListFilterType`](ListFilterType.md#s-ListFilterType) or [`ListFilterType`](ListFilterType.md#s-ListFilterType).

**Related classes**

- [ListFilterExprOp](ListFilterExprOp.md#s-ListFilterExprOp)

## Members

**Enum Constants**:

- [CONFD_CMP_EQ](#s-CONFD_CMP_EQ)
- [CONFD_CMP_GT](#s-CONFD_CMP_GT)
- [CONFD_CMP_GTE](#s-CONFD_CMP_GTE)
- [CONFD_CMP_LT](#s-CONFD_CMP_LT)
- [CONFD_CMP_LTE](#s-CONFD_CMP_LTE)
- [CONFD_CMP_NEQ](#s-CONFD_CMP_NEQ)
- [CONFD_CMP_NOP](#s-CONFD_CMP_NOP)
- [CONFD_EXEC_COMPARE](#s-CONFD_EXEC_COMPARE)
- [CONFD_EXEC_CONTAINS](#s-CONFD_EXEC_CONTAINS)
- [CONFD_EXEC_DERIVED_FROM](#s-CONFD_EXEC_DERIVED_FROM)
- [CONFD_EXEC_DERIVED_FROM_OR_SELF](#s-CONFD_EXEC_DERIVED_FROM_OR_SELF)
- [CONFD_EXEC_RE_MATCH](#s-CONFD_EXEC_RE_MATCH)
- [CONFD_EXEC_STARTS_WITH](#s-CONFD_EXEC_STARTS_WITH)
- [CONFD_EXEC_STRING_COMPARE](#s-CONFD_EXEC_STRING_COMPARE)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(String)](#s-valueOf)
- [values()](#s-values)

## Enum Constants

<a id="s-CONFD_CMP_EQ"></a>
### CONFD_CMP_EQ

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_EQ;
```

Equality

<a id="s-CONFD_CMP_GT"></a>
### CONFD_CMP_GT

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_GT;
```

Greater than

<a id="s-CONFD_CMP_GTE"></a>
### CONFD_CMP_GTE

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_GTE;
```

Greater than or equal

<a id="s-CONFD_CMP_LT"></a>
### CONFD_CMP_LT

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_LT;
```

Less than

<a id="s-CONFD_CMP_LTE"></a>
### CONFD_CMP_LTE

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_LTE;
```

Less than or equal

<a id="s-CONFD_CMP_NEQ"></a>
### CONFD_CMP_NEQ

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_NEQ;
```

Inequality

<a id="s-CONFD_CMP_NOP"></a>
### CONFD_CMP_NOP

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_CMP_NOP;
```

No operation.

<a id="s-CONFD_EXEC_COMPARE"></a>
### CONFD_EXEC_COMPARE

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_COMPARE;
```

compare function

<a id="s-CONFD_EXEC_CONTAINS"></a>
### CONFD_EXEC_CONTAINS

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_CONTAINS;
```

contains function

<a id="s-CONFD_EXEC_DERIVED_FROM"></a>
### CONFD_EXEC_DERIVED_FROM

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_DERIVED_FROM;
```

derived-from function

<a id="s-CONFD_EXEC_DERIVED_FROM_OR_SELF"></a>
### CONFD_EXEC_DERIVED_FROM_OR_SELF

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_DERIVED_FROM_OR_SELF;
```

derived-from-or-self function

<a id="s-CONFD_EXEC_RE_MATCH"></a>
### CONFD_EXEC_RE_MATCH

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_RE_MATCH;
```

re-match function

<a id="s-CONFD_EXEC_STARTS_WITH"></a>
### CONFD_EXEC_STARTS_WITH

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_STARTS_WITH;
```

starts-with function

<a id="s-CONFD_EXEC_STRING_COMPARE"></a>
### CONFD_EXEC_STRING_COMPARE

```java
public static final com.tailf.dp.ListFilterExprOp CONFD_EXEC_STRING_COMPARE;
```

string-compare function


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
public static com.tailf.dp.ListFilterExprOp valueOf(String name)
```

Types: [ListFilterExprOp](ListFilterExprOp.md#s-ListFilterExprOp)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.dp.ListFilterExprOp[] values()
```

Types: [ListFilterExprOp](ListFilterExprOp.md#s-ListFilterExprOp)
