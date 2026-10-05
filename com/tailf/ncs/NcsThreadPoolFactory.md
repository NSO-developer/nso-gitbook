<a id="s-NcsThreadPoolFactory"></a>
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

- [NcsThreadPoolFactory(String)](#s-NcsThreadPoolFactory-1)

**Methods**:

- [getPoolName()](#s-getPoolName)
- [newThread(Runnable)](#s-newThread)

## Constructors

<a id="s-NcsThreadPoolFactory-1"></a>
### NcsThreadPoolFactory(String)

```java
public NcsThreadPoolFactory(String poolName)
```

**Parameters**

- `String poolName`


## Methods

<a id="s-getPoolName"></a>
### getPoolName()

```java
public String getPoolName()
```

<a id="s-newThread"></a>
### newThread(Runnable)

```java
public Thread newThread(Runnable runnable)
```

**Parameters**

- `Runnable runnable`
