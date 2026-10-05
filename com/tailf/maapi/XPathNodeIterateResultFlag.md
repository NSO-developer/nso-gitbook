# XPathNodeIterateResultFlag <a href="#cls-XPathNodeIterateResultFlag" id="cls-XPathNodeIterateResultFlag"></a>

```java
public enum com.tailf.maapi.XPathNodeIterateResultFlag
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#cls-XPathNodeIterateResultFlag)

The [result(ConfObject[],ConfValue,Object)](MaapiXPathEvalResult.md#cls-MaapiXPathEvalResult) method
 should return any of the following two constants

## Members

**Enum Constants**:

- [ITER_CONTINUE](#m-ITER_CONTINUE)
- [ITER_STOP](#m-ITER_STOP)

**Methods**:

- [getValue()](#m-getValue-d93864668c40)
- [valueOf(int)](#m-valueOf-c0d46d25fc67)
- [valueOf(String)](#m-valueOf-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

### ITER_CONTINUE <a href="#m-ITER_CONTINUE" id="m-ITER_CONTINUE"></a>

```java
public static final com.tailf.maapi.XPathNodeIterateResultFlag ITER_CONTINUE;
```

The `result` method should return
 `ITER_CONTINUE` when iteration should
 continue with the next resulting node (if any).

### ITER_STOP <a href="#m-ITER_STOP" id="m-ITER_STOP"></a>

```java
public static final com.tailf.maapi.XPathNodeIterateResultFlag ITER_STOP;
```

The `result` method should return `ITER_STOP`
 when no more iteration should be done.


## Methods

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#m-valueOf-c0d46d25fc67" id="m-valueOf-c0d46d25fc67"></a>

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag valueOf(int i)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#cls-XPathNodeIterateResultFlag)

**Parameters**

- `int i`

### valueOf(String) <a href="#m-valueOf-ac61b3547613" id="m-valueOf-ac61b3547613"></a>

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag valueOf(String name)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#cls-XPathNodeIterateResultFlag)

**Parameters**

- `String name`

### values() <a href="#m-values-406dfe3ca270" id="m-values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag[] values()
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#cls-XPathNodeIterateResultFlag)
