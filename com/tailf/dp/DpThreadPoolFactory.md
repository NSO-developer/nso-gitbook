<a id="s-DpThreadPoolFactory"></a>
# DpThreadPoolFactory

```java
public class com.tailf.dp.DpThreadPoolFactory
    implements java.util.concurrent.ThreadFactory
```

The customized thread Factory
 this is used for creating customized threads
 that uses UncaughtExceptionHandler and for thread
 that performs debug logging message so we could
 interpret the thread dumps and error logs.

## Members

**Constructors**:

- [DpThreadPoolFactory(String)](#s-DpThreadPoolFactory-1)

**Fields**:

- [poolName](#s-poolName)

**Methods**:

- [newThread(Runnable)](#s-newThread)

## Constructors

<a id="s-DpThreadPoolFactory-1"></a>
### DpThreadPoolFactory(String)

```java
public DpThreadPoolFactory(String poolName)
```

**Parameters**

- `String poolName`


## Fields

<a id="s-poolName"></a>
### poolName

**Package-private**

```java
String poolName = null;
```


## Methods

<a id="s-newThread"></a>
### newThread(Runnable)

```java
public Thread newThread(Runnable runnable)
```

**Parameters**

- `Runnable runnable`
