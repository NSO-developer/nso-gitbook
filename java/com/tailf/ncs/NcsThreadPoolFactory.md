# NcsThreadPoolFactory <a href="#ncsthreadpoolfactory-d389c69961d0" id="ncsthreadpoolfactory-d389c69961d0"></a>

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

- [NcsThreadPoolFactory\(String\)](#ncsthreadpoolfactory-118adbedb509)

**Methods**:

- [getPoolName\(\)](#getpoolname-b9fe3e660a7e)
- [newThread\(Runnable\)](#newthread-d68745b22554)

## Constructors

### NcsThreadPoolFactory(String) <a href="#ncsthreadpoolfactory-118adbedb509" id="ncsthreadpoolfactory-118adbedb509"></a>

```java
public NcsThreadPoolFactory(String poolName)
```

**Parameters**

- `String poolName`


## Methods

### getPoolName() <a href="#getpoolname-b9fe3e660a7e" id="getpoolname-b9fe3e660a7e"></a>

```java
public String getPoolName()
```

### newThread(Runnable) <a href="#newthread-d68745b22554" id="newthread-d68745b22554"></a>

```java
public Thread newThread(Runnable runnable)
```

**Parameters**

- `Runnable runnable`
