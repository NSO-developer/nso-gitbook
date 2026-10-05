<a id="cls-DpWorkerThreadPool"></a>
# DpWorkerThreadPool

```java
public class com.tailf.dp.DpWorkerThreadPool
    extends java.util.concurrent.ThreadPoolExecutor
```

Dp Thread pool of worker thread. These threads are assigned an worker socket
 and reads requests from these sockets.

## Members

**Constructors**:

- [DpWorkerThreadPool(int, int, long, TimeUnit, BlockingQueue<Runnable>)](#m-dpworkerthreadpool-9e7692937746)

**Methods**:

- [afterExecute(Runnable, Throwable)](#m-afterexecute-a83013fcd608)
- [beforeExecute(Thread, Runnable)](#m-beforeexecute-2f1192278f1c)
- [terminated()](#m-terminated-af4b426ad284)

## Constructors

<a id="m-dpworkerthreadpool-9e7692937746"></a>
### DpWorkerThreadPool(int, int, long, TimeUnit, BlockingQueue<Runnable>)

```java
public DpWorkerThreadPool(
    int corePoolSize,
    int maximumPoolSize,
    long keepAliveTime,
    java.util.concurrent.TimeUnit unit,
    java.util.concurrent.BlockingQueue<Runnable> workQueue
)
```

Constructor for Thread pool.

**Parameters**

- `int corePoolSize` - - initial number of threads in the pool
- `int maximumPoolSize` - - maximal number of threads in the pool
- `long keepAliveTime` - - time in TimeUnit to wait for work,
 if over corePoolSize
- `java.util.concurrent.TimeUnit unit` - - The TimeUnit for keepAliveTime
- `java.util.concurrent.BlockingQueue<Runnable> workQueue` - - queue for work waiting to process


## Methods

<a id="m-afterexecute-a83013fcd608"></a>
### afterExecute(Runnable, Throwable)

```java
protected void afterExecute(Runnable r, Throwable t)
```

**Parameters**

- `Runnable r`
- `Throwable t`

<a id="m-beforeexecute-2f1192278f1c"></a>
### beforeExecute(Thread, Runnable)

```java
protected void beforeExecute(Thread t, Runnable r)
```

**Parameters**

- `Thread t`
- `Runnable r`

<a id="m-terminated-af4b426ad284"></a>
### terminated()

```java
protected void terminated()
```
