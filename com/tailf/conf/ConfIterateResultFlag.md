# ConfIterateResultFlag <a href="#cls-ConfIterateResultFlag" id="cls-ConfIterateResultFlag"></a>

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

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### ITER_CONTINUE <a href="#m-ITER_CONTINUE" id="m-ITER_CONTINUE"></a>

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_CONTINUE;
```

The iterate() method should return ITER_CONTINUE when iteration should
 continue with the nodes siblings. (if any)

### ITER_RECURSE <a href="#m-ITER_RECURSE" id="m-ITER_RECURSE"></a>

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_RECURSE;
```

The iterate() method should return ITER_RECURSE when iteration should
 continue on all the nodes children. (if any)

### ITER_STOP <a href="#m-ITER_STOP" id="m-ITER_STOP"></a>

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_STOP;
```

The iterate() method should return ITER_STOP when no more iteration
 should be done.

### ITER_SUSPEND <a href="#m-ITER_SUSPEND" id="m-ITER_SUSPEND"></a>

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_SUSPEND;
```


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.conf.ConfIterateResultFlag valueOf(int i)
```

Types: [ConfIterateResultFlag](ConfIterateResultFlag.md#cls-ConfIterateResultFlag)

**Parameters**

- `int i`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.conf.ConfIterateResultFlag valueOf(String name)
```

Types: [ConfIterateResultFlag](ConfIterateResultFlag.md#cls-ConfIterateResultFlag)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.conf.ConfIterateResultFlag[] values()
```

Types: [ConfIterateResultFlag](ConfIterateResultFlag.md#cls-ConfIterateResultFlag)
