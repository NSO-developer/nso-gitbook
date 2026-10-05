<a id="cls-DpThread"></a>
# DpThread

```java
public class com.tailf.dp.DpThread
    extends Thread
    implements Thread.UncaughtExceptionHandler
```

DpThread with the ability to log more info about
 a thread and that uses a Uncaught exception handler.

## Members

**Constructors**:

- [DpThread(Runnable)](#m-dpthread-9efa3f28cb99)
- [DpThread(Runnable, String)](#m-dpthread-e9bcaa66a795)

**Fields**:

- [DEFAULT_NAME](#m-DEFAULT_NAME)

**Methods**:

- [run()](#m-run-b6dbda048863)
- [uncaughtException(Thread, Throwable)](#m-uncaughtexception-ad07d4154b36)

## Constructors

<a id="m-dpthread-9efa3f28cb99"></a>
### DpThread(Runnable)

```java
public DpThread(Runnable r)
```

**Parameters**

- `Runnable r`

<a id="m-dpthread-e9bcaa66a795"></a>
### DpThread(Runnable, String)

```java
public DpThread(Runnable r, String name)
```

**Parameters**

- `Runnable r`
- `String name`


## Fields

<a id="m-DEFAULT_NAME"></a>
### DEFAULT_NAME

```java
public static final String DEFAULT_NAME = "DpWorkerPoolThread";
```


## Methods

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```

<a id="m-uncaughtexception-ad07d4154b36"></a>
### uncaughtException(Thread, Throwable)

```java
public void uncaughtException(Thread t, Throwable e)
```

**Parameters**

- `Thread t`
- `Throwable e`
