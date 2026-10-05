# DpWorkerThreadPool <a href="#cls-DpWorkerThreadPool" id="cls-DpWorkerThreadPool"></a>

```java
public class com.tailf.dp.DpWorkerThreadPool
    extends java.util.concurrent.ThreadPoolExecutor
```

Dp Thread pool of worker thread. These threads are assigned an worker socket
 and reads requests from these sockets.

## Members

**Constructors**:

- [DpWorkerThreadPool(int, int, long, TimeUnit, BlockingQueue<Runnable>)](#m-DpWorkerThreadPool-9e7692937746)

**Methods**:

- [afterExecute(Runnable, Throwable)](#m-afterExecute-a83013fcd608)
- [beforeExecute(Thread, Runnable)](#m-beforeExecute-2f1192278f1c)
- [terminated()](#m-terminated-af4b426ad284)

## Constructors

### DpWorkerThreadPool(int, int, long, TimeUnit, BlockingQueue<Runnable>) <a href="#m-DpWorkerThreadPool-9e7692937746" id="m-DpWorkerThreadPool-9e7692937746"></a>

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

### afterExecute(Runnable, Throwable) <a href="#m-afterExecute-a83013fcd608" id="m-afterExecute-a83013fcd608"></a>

```java
protected void afterExecute(Runnable r, Throwable t)
```

**Parameters**

- `Runnable r`
- `Throwable t`

### beforeExecute(Thread, Runnable) <a href="#m-beforeExecute-2f1192278f1c" id="m-beforeExecute-2f1192278f1c"></a>

```java
protected void beforeExecute(Thread t, Runnable r)
```

**Parameters**

- `Thread t`
- `Runnable r`

### terminated() <a href="#m-terminated-af4b426ad284" id="m-terminated-af4b426ad284"></a>

```java
protected void terminated()
```
