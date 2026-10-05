# DpThreadPoolFactory <a href="#dpthreadpoolfactory-12e7e9f74c4d" id="dpthreadpoolfactory-12e7e9f74c4d"></a>

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

- [DpThreadPoolFactory(String)](#dpthreadpoolfactory-210774692872)

**Fields**:

- [poolName](#poolname-1912413bc821)

**Methods**:

- [newThread(Runnable)](#newthread-d68745b22554)

## Constructors

### DpThreadPoolFactory(String) <a href="#dpthreadpoolfactory-210774692872" id="dpthreadpoolfactory-210774692872"></a>

```java
public DpThreadPoolFactory(String poolName)
```

**Parameters**

- `String poolName`


## Fields

### poolName <a href="#poolname-1912413bc821" id="poolname-1912413bc821"></a>

**Package-private**

```java
String poolName = null;
```


## Methods

### newThread(Runnable) <a href="#newthread-d68745b22554" id="newthread-d68745b22554"></a>

```java
public Thread newThread(Runnable runnable)
```

**Parameters**

- `Runnable runnable`
