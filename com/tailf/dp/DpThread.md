<a id="s-DpThread"></a>
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

- [DpThread(Runnable)](#s-DpThread-1)
- [DpThread(Runnable, String)](#s-DpThread-2)

**Fields**:

- [DEFAULT_NAME](#s-DEFAULT_NAME)

**Methods**:

- [run()](#s-run)
- [uncaughtException(Thread, Throwable)](#s-uncaughtException)

## Constructors

<a id="s-DpThread-1"></a>
### DpThread(Runnable)

```java
public DpThread(Runnable r)
```

**Parameters**

- `Runnable r`

<a id="s-DpThread-2"></a>
### DpThread(Runnable, String)

```java
public DpThread(Runnable r, String name)
```

**Parameters**

- `Runnable r`
- `String name`


## Fields

<a id="s-DEFAULT_NAME"></a>
### DEFAULT_NAME

```java
public static final String DEFAULT_NAME = "DpWorkerPoolThread";
```


## Methods

<a id="s-run"></a>
### run()

```java
public void run()
```

<a id="s-uncaughtException"></a>
### uncaughtException(Thread, Throwable)

```java
public void uncaughtException(Thread t, Throwable e)
```

**Parameters**

- `Thread t`
- `Throwable e`
