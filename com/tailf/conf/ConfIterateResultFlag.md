<a id="cls-ConfIterateResultFlag"></a>
# ConfIterateResultFlag

```java
public enum com.tailf.conf.ConfIterateResultFlag
```

Types: [ConfIterateResultFlag](ConfIterateResultFlag.md#cls-ConfIterateResultFlag)

flags us by DiffIterate interface The iterate() method should return any
 of the following constants

## Members

**Enum Constants**:

- [ITER_CONTINUE](#m-ITER_CONTINUE)
- [ITER_RECURSE](#m-ITER_RECURSE)
- [ITER_STOP](#m-ITER_STOP)
- [ITER_SUSPEND](#m-ITER_SUSPEND)

**Methods**:

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-ITER_CONTINUE"></a>
### ITER_CONTINUE

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_CONTINUE;
```

The iterate() method should return ITER_CONTINUE when iteration should
 continue with the nodes siblings. (if any)

<a id="m-ITER_RECURSE"></a>
### ITER_RECURSE

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_RECURSE;
```

The iterate() method should return ITER_RECURSE when iteration should
 continue on all the nodes children. (if any)

<a id="m-ITER_STOP"></a>
### ITER_STOP

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_STOP;
```

The iterate() method should return ITER_STOP when no more iteration
 should be done.

<a id="m-ITER_SUSPEND"></a>
### ITER_SUSPEND

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_SUSPEND;
```


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.conf.ConfIterateResultFlag valueOf(int i)
```

Types: [ConfIterateResultFlag](ConfIterateResultFlag.md#cls-ConfIterateResultFlag)

**Parameters**

- `int i`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.conf.ConfIterateResultFlag valueOf(String name)
```

Types: [ConfIterateResultFlag](ConfIterateResultFlag.md#cls-ConfIterateResultFlag)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.conf.ConfIterateResultFlag[] values()
```

Types: [ConfIterateResultFlag](ConfIterateResultFlag.md#cls-ConfIterateResultFlag)
