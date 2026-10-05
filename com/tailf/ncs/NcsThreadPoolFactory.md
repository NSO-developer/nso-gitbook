<a id="cls-NcsThreadPoolFactory"></a>
# NcsThreadPoolFactory

```java
public class com.tailf.ncs.NcsThreadPoolFactory
    implements java.util.concurrent.ThreadFactory
```

The customized thread Factory
 this is used for creating customized threads
 that uses UncaughtExceptionHandler and for thread
 that performs debug logging msg so we could
 interpret the thread dumps and error logs.

## Members

**Constructors**:

- [NcsThreadPoolFactory(String)](#m-ncsthreadpoolfactory-118adbedb509)

**Methods**:

- [getPoolName()](#m-getpoolname-b9fe3e660a7e)
- [newThread(Runnable)](#m-newthread-d68745b22554)

## Constructors

<a id="m-ncsthreadpoolfactory-118adbedb509"></a>
### NcsThreadPoolFactory(String)

```java
public NcsThreadPoolFactory(String poolName)
```

**Parameters**

- `String poolName`


## Methods

<a id="m-getpoolname-b9fe3e660a7e"></a>
### getPoolName()

```java
public String getPoolName()
```

<a id="m-newthread-d68745b22554"></a>
### newThread(Runnable)

```java
public Thread newThread(Runnable runnable)
```

**Parameters**

- `Runnable runnable`
