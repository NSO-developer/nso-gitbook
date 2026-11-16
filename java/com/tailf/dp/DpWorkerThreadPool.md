# DpWorkerThreadPool <a href="#dpworkerthreadpool-05106327e3a1" id="dpworkerthreadpool-05106327e3a1"></a>

```java
public class com.tailf.dp.DpWorkerThreadPool
    extends java.util.concurrent.ThreadPoolExecutor
```

Dp Thread pool of worker thread. These threads are assigned an worker socket
 and reads requests from these sockets.

## Members

**Constructors**:

- [DpWorkerThreadPool\(int, int, long, TimeUnit, BlockingQueue\<Runnable\>\)](#dpworkerthreadpool-9e7692937746)

## Constructors

### DpWorkerThreadPool(int, int, long, TimeUnit, BlockingQueue&lt;Runnable&gt;) <a href="#dpworkerthreadpool-9e7692937746" id="dpworkerthreadpool-9e7692937746"></a>

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

- `int corePoolSize` - \- initial number of threads in the pool
- `int maximumPoolSize` - \- maximal number of threads in the pool
- `long keepAliveTime` - \- time in TimeUnit to wait for work,
 if over corePoolSize
- `java.util.concurrent.TimeUnit unit` - \- The TimeUnit for keepAliveTime
- `java.util.concurrent.BlockingQueue<Runnable> workQueue` - \- queue for work waiting to process
