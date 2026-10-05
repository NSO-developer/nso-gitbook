# DpThread <a href="#cls-DpThread" id="cls-DpThread"></a>

```java
public class com.tailf.dp.DpThread
    extends Thread
    implements Thread.UncaughtExceptionHandler
```

DpThread with the ability to log more info about
 a thread and that uses a Uncaught exception handler.

## Members

**Constructors**:

- [DpThread(Runnable)](#m-DpThread-9efa3f28cb99)
- [DpThread(Runnable, String)](#m-DpThread-e9bcaa66a795)

**Fields**:

- [DEFAULT_NAME](#m-DEFAULT_NAME)

**Methods**:

- [run()](#m-run-b6dbda048863)
- [uncaughtException(Thread, Throwable)](#m-uncaughtException-ad07d4154b36)

## Constructors

### DpThread(Runnable) <a href="#m-DpThread-9efa3f28cb99" id="m-DpThread-9efa3f28cb99"></a>

```java
public DpThread(Runnable r)
```

**Parameters**

- `Runnable r`

### DpThread(Runnable, String) <a href="#m-DpThread-e9bcaa66a795" id="m-DpThread-e9bcaa66a795"></a>

```java
public DpThread(Runnable r, String name)
```

**Parameters**

- `Runnable r`
- `String name`


## Fields

### DEFAULT_NAME <a href="#m-DEFAULT_NAME" id="m-DEFAULT_NAME"></a>

```java
public static final String DEFAULT_NAME = "DpWorkerPoolThread";
```


## Methods

### run() <a href="#m-run-b6dbda048863" id="m-run-b6dbda048863"></a>

```java
public void run()
```

### uncaughtException(Thread, Throwable) <a href="#m-uncaughtException-ad07d4154b36" id="m-uncaughtException-ad07d4154b36"></a>

```java
public void uncaughtException(Thread t, Throwable e)
```

**Parameters**

- `Thread t`
- `Throwable e`
