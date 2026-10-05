<a id="s-DiffIterateResultFlag"></a>
# DiffIterateResultFlag

```java
public enum com.tailf.conf.DiffIterateResultFlag
```

Types: [DiffIterateResultFlag](DiffIterateResultFlag.md#s-DiffIterateResultFlag)

flags us by DiffIterate interface The iterate() method should return any
 of the following constants

**Related classes**

- [DiffIterateResultFlag](DiffIterateResultFlag.md#s-DiffIterateResultFlag)

## Members

**Enum Constants**:

- [ITER_CONTINUE](#s-ITER_CONTINUE)
- [ITER_RECURSE](#s-ITER_RECURSE)
- [ITER_STOP](#s-ITER_STOP)
- [ITER_SUSPEND](#s-ITER_SUSPEND)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-ITER_CONTINUE"></a>
### ITER_CONTINUE

```java
public static final com.tailf.conf.DiffIterateResultFlag ITER_CONTINUE;
```

The iterate() method should return ITER_CONTINUE when iteration should
 continue with the nodes siblings. (if any)

<a id="s-ITER_RECURSE"></a>
### ITER_RECURSE

```java
public static final com.tailf.conf.DiffIterateResultFlag ITER_RECURSE;
```

The iterate() method should return ITER_RECURSE when iteration should
 continue on all the nodes children. (if any)

<a id="s-ITER_STOP"></a>
### ITER_STOP

```java
public static final com.tailf.conf.DiffIterateResultFlag ITER_STOP;
```

The iterate() method should return ITER_STOP when no more iteration
 should be done.

<a id="s-ITER_SUSPEND"></a>
### ITER_SUSPEND

```java
public static final com.tailf.conf.DiffIterateResultFlag ITER_SUSPEND;
```


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.conf.DiffIterateResultFlag valueOf(int i)
```

Types: [DiffIterateResultFlag](DiffIterateResultFlag.md#s-DiffIterateResultFlag)

**Parameters**

- `int i`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.conf.DiffIterateResultFlag valueOf(String name)
```

Types: [DiffIterateResultFlag](DiffIterateResultFlag.md#s-DiffIterateResultFlag)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.conf.DiffIterateResultFlag[] values()
```

Types: [DiffIterateResultFlag](DiffIterateResultFlag.md#s-DiffIterateResultFlag)
