<a id="s-ProxyUtils"></a>
# ProxyUtils

```java
public class com.tailf.dp.annotations.ProxyUtils
```

Helper class for callback proxys

## Members

**Constructors**:

- [ProxyUtils()](#s-ProxyUtils-1)

**Methods**:

- [compareMethods(Method, Method)](#s-compareMethods)
- [invocationTargetCheck(InvocationTargetException)](#s-invocationTargetCheck)

## Constructors

<a id="s-ProxyUtils-1"></a>
### ProxyUtils()

```java
public ProxyUtils()
```


## Methods

<a id="s-compareMethods"></a>
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

<a id="s-invocationTargetCheck"></a>
### invocationTargetCheck(InvocationTargetException)

```java
public static com.tailf.dp.DpCallbackException invocationTargetCheck(
    java.lang.reflect.InvocationTargetException ex
)
```

Types: [DpCallbackException](../DpCallbackException.md#s-DpCallbackException)

**Parameters**

- `java.lang.reflect.InvocationTargetException ex`
