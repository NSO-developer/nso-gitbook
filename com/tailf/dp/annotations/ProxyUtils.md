<a id="cls-ProxyUtils"></a>
# ProxyUtils

```java
public class com.tailf.dp.annotations.ProxyUtils
```

Helper class for callback proxys

## Members

**Constructors**:

- [ProxyUtils()](#m-proxyutils-58dca161942d)

**Methods**:

- [compareMethods(Method, Method)](#m-comparemethods-ffc443ede70d)
- [invocationTargetCheck(InvocationTargetException)](#m-invocationtargetcheck-20a147521b60)

## Constructors

<a id="m-proxyutils-58dca161942d"></a>
### ProxyUtils()

```java
public ProxyUtils()
```


## Methods

<a id="m-comparemethods-ffc443ede70d"></a>
### compareMethods(Method, Method)

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

<a id="m-invocationtargetcheck-20a147521b60"></a>
### invocationTargetCheck(InvocationTargetException)

```java
public static com.tailf.dp.DpCallbackException invocationTargetCheck(
    java.lang.reflect.InvocationTargetException ex
)
```

Types: [DpCallbackException](../DpCallbackException.md#cls-DpCallbackException)

**Parameters**

- `java.lang.reflect.InvocationTargetException ex`
