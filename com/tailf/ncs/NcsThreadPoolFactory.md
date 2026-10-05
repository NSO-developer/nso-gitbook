# NcsThreadPoolFactory <a href="#cls-NcsThreadPoolFactory" id="cls-NcsThreadPoolFactory"></a>

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

- [NcsThreadPoolFactory(String)](#m-NcsThreadPoolFactory-118adbedb509)

**Methods**:

- [getPoolName()](#m-getPoolName-b9fe3e660a7e)
- [newThread(Runnable)](#m-newThread-d68745b22554)

## Constructors

### NcsThreadPoolFactory(String) <a href="#m-NcsThreadPoolFactory-118adbedb509" id="m-NcsThreadPoolFactory-118adbedb509"></a>

```java
public NcsThreadPoolFactory(String poolName)
```

**Parameters**

- `String poolName`


## Methods

### getPoolName() <a href="#m-getPoolName-b9fe3e660a7e" id="m-getPoolName-b9fe3e660a7e"></a>

```java
public String getPoolName()
```

### newThread(Runnable) <a href="#m-newThread-d68745b22554" id="m-newThread-d68745b22554"></a>

```java
public Thread newThread(Runnable runnable)
```

**Parameters**

- `Runnable runnable`
