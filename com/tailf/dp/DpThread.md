# DpThread <a href="#dpthread-3c3d056fe2ad" id="dpthread-3c3d056fe2ad"></a>

```java
public class com.tailf.dp.DpThread
    extends Thread
    implements Thread.UncaughtExceptionHandler
```

DpThread with the ability to log more info about
 a thread and that uses a Uncaught exception handler.

## Members

**Constructors**:

- [DpThread(Runnable)](#dpthread-9efa3f28cb99)
- [DpThread(Runnable, String)](#dpthread-e9bcaa66a795)

**Fields**:

- [DEFAULT_NAME](#default_name-176b69b4d69f)

**Methods**:

- [run()](#run-b6dbda048863)
- [uncaughtException(Thread, Throwable)](#uncaughtexception-ad07d4154b36)

## Constructors

### DpThread(Runnable) <a href="#dpthread-9efa3f28cb99" id="dpthread-9efa3f28cb99"></a>

```java
public DpThread(Runnable r)
```

**Parameters**

- `Runnable r`

### DpThread(Runnable, String) <a href="#dpthread-e9bcaa66a795" id="dpthread-e9bcaa66a795"></a>

```java
public DpThread(Runnable r, String name)
```

**Parameters**

- `Runnable r`
- `String name`


## Fields

### DEFAULT_NAME <a href="#default_name-176b69b4d69f" id="default_name-176b69b4d69f"></a>

```java
public static final String DEFAULT_NAME = "DpWorkerPoolThread";
```


## Methods

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```

### uncaughtException(Thread, Throwable) <a href="#uncaughtexception-ad07d4154b36" id="uncaughtexception-ad07d4154b36"></a>

```java
public void uncaughtException(Thread t, Throwable e)
```

**Parameters**

- `Thread t`
- `Throwable e`
