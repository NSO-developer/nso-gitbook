# ConfIterateResultFlag <a href="#confiterateresultflag-47d57f8165d1" id="confiterateresultflag-47d57f8165d1"></a>

```java
public enum com.tailf.conf.ConfIterateResultFlag
```

flags us by DiffIterate interface The iterate() method should return any
 of the following constants

## Members

**Enum Constants**:

- [ITER\_CONTINUE](#iter_continue-987b3f3577df)
- [ITER\_RECURSE](#iter_recurse-691241795ec1)
- [ITER\_STOP](#iter_stop-1b807e9343da)
- [ITER\_SUSPEND](#iter_suspend-575a3c5be208)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### ITER_CONTINUE <a href="#iter_continue-987b3f3577df" id="iter_continue-987b3f3577df"></a>

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_CONTINUE;
```

The iterate() method should return ITER_CONTINUE when iteration should
 continue with the nodes siblings. (if any)

### ITER_RECURSE <a href="#iter_recurse-691241795ec1" id="iter_recurse-691241795ec1"></a>

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_RECURSE;
```

The iterate() method should return ITER_RECURSE when iteration should
 continue on all the nodes children. (if any)

### ITER_STOP <a href="#iter_stop-1b807e9343da" id="iter_stop-1b807e9343da"></a>

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_STOP;
```

The iterate() method should return ITER_STOP when no more iteration
 should be done.

### ITER_SUSPEND <a href="#iter_suspend-575a3c5be208" id="iter_suspend-575a3c5be208"></a>

```java
public static final com.tailf.conf.ConfIterateResultFlag ITER_SUSPEND;
```


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.conf.ConfIterateResultFlag valueOf(int i)
```

Types: [ConfIterateResultFlag](ConfIterateResultFlag.md#confiterateresultflag-47d57f8165d1)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.conf.ConfIterateResultFlag valueOf(String name)
```

Types: [ConfIterateResultFlag](ConfIterateResultFlag.md#confiterateresultflag-47d57f8165d1)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.conf.ConfIterateResultFlag[] values()
```

Types: [ConfIterateResultFlag](ConfIterateResultFlag.md#confiterateresultflag-47d57f8165d1)
