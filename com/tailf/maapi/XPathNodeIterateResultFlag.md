<a id="s-XPathNodeIterateResultFlag"></a>
# XPathNodeIterateResultFlag

```java
public enum com.tailf.maapi.XPathNodeIterateResultFlag
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag)

The [result(ConfObject[],ConfValue,Object)](MaapiXPathEvalResult.md#s-MaapiXPathEvalResult) method
 should return any of the following two constants

**Related classes**

- [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag)

## Members

**Enum Constants**:

- [ITER_CONTINUE](#s-ITER_CONTINUE)
- [ITER_STOP](#s-ITER_STOP)

**Methods**:

- [getValue()](#s-getValue)
- [valueOf(int)](#s-valueOf)
- [valueOf(String)](#s-valueOf-1)
- [values()](#s-values)

## Enum Constants

<a id="s-ITER_CONTINUE"></a>
### ITER_CONTINUE

```java
public static final com.tailf.maapi.XPathNodeIterateResultFlag ITER_CONTINUE;
```

The `result` method should return
 `ITER_CONTINUE` when iteration should
 continue with the next resulting node (if any).

<a id="s-ITER_STOP"></a>
### ITER_STOP

```java
public static final com.tailf.maapi.XPathNodeIterateResultFlag ITER_STOP;
```

The `result` method should return `ITER_STOP`
 when no more iteration should be done.


## Methods

<a id="s-getValue"></a>
### getValue()

```java
public int getValue()
```

<a id="s-valueOf"></a>
### valueOf(int)

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag valueOf(int i)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag)

**Parameters**

- `int i`

<a id="s-valueOf-1"></a>
### valueOf(String)

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag valueOf(String name)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag)

**Parameters**

- `String name`

<a id="s-values"></a>
### values()

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag[] values()
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#s-XPathNodeIterateResultFlag)
