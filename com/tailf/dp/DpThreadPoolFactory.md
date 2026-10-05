<a id="cls-DpThreadPoolFactory"></a>
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

- [DpThreadPoolFactory(String)](#m-dpthreadpoolfactory-210774692872)

**Fields**:

- [poolName](#m-poolName)

**Methods**:

- [newThread(Runnable)](#m-newthread-d68745b22554)

## Constructors

<a id="m-dpthreadpoolfactory-210774692872"></a>
### DpThreadPoolFactory(String)

```java
public DpThreadPoolFactory(String poolName)
```

**Parameters**

- `String poolName`


## Fields

<a id="m-poolName"></a>
### poolName

**Package-private**

```java
String poolName = null;
```


## Methods

<a id="m-newthread-d68745b22554"></a>
### newThread(Runnable)

```java
public Thread newThread(Runnable runnable)
```

**Parameters**

- `Runnable runnable`
