# DpThreadPoolFactory <a href="#cls-DpThreadPoolFactory" id="cls-DpThreadPoolFactory"></a>

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

- [DpThreadPoolFactory(String)](#m-DpThreadPoolFactory-210774692872)

**Fields**:

- [poolName](#m-poolName)

**Methods**:

- [newThread(Runnable)](#m-newThread-d68745b22554)

## Constructors

### DpThreadPoolFactory(String) <a href="#m-DpThreadPoolFactory-210774692872" id="m-DpThreadPoolFactory-210774692872"></a>

```java
public DpThreadPoolFactory(String poolName)
```

**Parameters**

- `String poolName`


## Fields

### poolName <a href="#m-poolName" id="m-poolName"></a>

**Package-private**

```java
String poolName = null;
```


## Methods

### newThread(Runnable) <a href="#m-newThread-d68745b22554" id="m-newThread-d68745b22554"></a>

```java
public Thread newThread(Runnable runnable)
```

**Parameters**

- `Runnable runnable`
