# XPathNodeIterateResultFlag <a href="#xpathnodeiterateresultflag-a264e20c01cd" id="xpathnodeiterateresultflag-a264e20c01cd"></a>

```java
public enum com.tailf.maapi.XPathNodeIterateResultFlag
```

The [result\(ConfObject\[\],ConfValue,Object\)](MaapiXPathEvalResult.md#maapixpathevalresult-e5a539712098) method
 should return any of the following two constants

## Members

**Enum Constants**:

- [ITER\_CONTINUE](#iter_continue-987b3f3577df)
- [ITER\_STOP](#iter_stop-1b807e9343da)

**Methods**:

- [getValue\(\)](#getvalue-d93864668c40)
- [valueOf\(int\)](#valueof-c0d46d25fc67)
- [valueOf\(String\)](#valueof-ac61b3547613)
- [values\(\)](#values-406dfe3ca270)

## Enum Constants

### ITER_CONTINUE <a href="#iter_continue-987b3f3577df" id="iter_continue-987b3f3577df"></a>

```java
public static final com.tailf.maapi.XPathNodeIterateResultFlag ITER_CONTINUE;
```

The `result` method should return
 `ITER_CONTINUE` when iteration should
 continue with the next resulting node (if any).

### ITER_STOP <a href="#iter_stop-1b807e9343da" id="iter_stop-1b807e9343da"></a>

```java
public static final com.tailf.maapi.XPathNodeIterateResultFlag ITER_STOP;
```

The `result` method should return `ITER_STOP`
 when no more iteration should be done.


## Methods

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public int getValue()
```

### valueOf(int) <a href="#valueof-c0d46d25fc67" id="valueof-c0d46d25fc67"></a>

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag valueOf(int i)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#xpathnodeiterateresultflag-a264e20c01cd)

**Parameters**

- `int i`

### valueOf(String) <a href="#valueof-ac61b3547613" id="valueof-ac61b3547613"></a>

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag valueOf(String name)
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#xpathnodeiterateresultflag-a264e20c01cd)

**Parameters**

- `String name`

### values() <a href="#values-406dfe3ca270" id="values-406dfe3ca270"></a>

```java
public static com.tailf.maapi.XPathNodeIterateResultFlag[] values()
```

Types: [XPathNodeIterateResultFlag](XPathNodeIterateResultFlag.md#xpathnodeiterateresultflag-a264e20c01cd)
