<a id="cls-XPathNodeIterateResultFlag"></a>
# XPathNodeIterateResultFlag

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

- [getValue()](#m-getvalue-d93864668c40)
- [valueOf(int)](#m-valueof-c0d46d25fc67)
- [valueOf(String)](#m-valueof-ac61b3547613)
- [values()](#m-values-406dfe3ca270)

## Enum Constants

<a id="m-ITER_CONTINUE"></a>
### ITER_CONTINUE

```java
public static final com.tailf.maapi.XPathNodeIterateResultFlag ITER_CONTINUE;
```

The `result` method should return
 `ITER_CONTINUE` when iteration should
 continue with the next resulting node (if any).

<a id="m-ITER_STOP"></a>
### ITER_STOP

```java
public static final com.tailf.maapi.XPathNodeIterateResultFlag ITER_STOP;
```

The `result` method should return `ITER_STOP`
 when no more iteration should be done.


## Methods

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public int getValue()
```

<a id="m-valueof-c0d46d25fc67"></a>
### valueOf(int)

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag valueOf(int i)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#cls-XPathNodeIterateResultFlag)

**Parameters**

- `int i`

<a id="m-valueof-ac61b3547613"></a>
### valueOf(String)

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag valueOf(String name)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#cls-XPathNodeIterateResultFlag)

**Parameters**

- `String name`

<a id="m-values-406dfe3ca270"></a>
### values()

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag[] values()
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#cls-XPathNodeIterateResultFlag)
