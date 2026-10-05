# ProxyUtils <a href="#cls-ProxyUtils" id="cls-ProxyUtils"></a>

```java
public class com.tailf.dp.annotations.ProxyUtils
```

Helper class for callback proxys

## Members

**Constructors**:

- [ProxyUtils()](#m-ProxyUtils-58dca161942d)

**Methods**:

- [compareMethods(Method, Method)](#m-compareMethods-ffc443ede70d)
- [invocationTargetCheck(InvocationTargetException)](#m-invocationTargetCheck-20a147521b60)

## Constructors

### ProxyUtils() <a href="#m-ProxyUtils-58dca161942d" id="m-ProxyUtils-58dca161942d"></a>

```java
public ProxyUtils()
```


## Methods

### compareMethods(Method, Method) <a href="#m-compareMethods-ffc443ede70d" id="m-compareMethods-ffc443ede70d"></a>

```java
public static boolean compareMethods(
    java.lang.reflect.Method source,
    java.lang.reflect.Method proposal
)
```

Comparison of method signatures. Compares arguments and return types but
 differences in thrown exceptions are neglected.

**Parameters**

- `java.lang.reflect.Method source` - source method for comparison
- `java.lang.reflect.Method proposal` - target method for comparison

**Returns:** true if arguments and return type of methods coincide

### invocationTargetCheck(InvocationTargetException) <a href="#m-invocationTargetCheck-20a147521b60" id="m-invocationTargetCheck-20a147521b60"></a>

```java
public static com.tailf.dp.DpCallbackException invocationTargetCheck(
    java.lang.reflect.InvocationTargetException ex
)
```

Types: [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `java.lang.reflect.InvocationTargetException ex`
