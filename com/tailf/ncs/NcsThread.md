<a id="s-NcsThread"></a>
# NcsThread

```java
public class com.tailf.ncs.NcsThread
    extends Thread
```

NcsThread is a subclass of Thread with the ability to log more info about
 a thread and implements an UncaughtExceptionHandler.

## Members

**Constructors**:

- [NcsThread(Runnable)](#s-NcsThread-1)
- [NcsThread(Runnable, String)](#s-NcsThread-2)

**Fields**:

- [DEFAULT_NAME](#s-DEFAULT_NAME)

**Methods**:

- [run()](#s-run)

## Constructors

<a id="s-NcsThread-1"></a>
### NcsThread(Runnable)

```java
public NcsThread(Runnable r)
```

**Parameters**

- `Runnable r`

<a id="s-NcsThread-2"></a>
### NcsThread(Runnable, String)

```java
public NcsThread(Runnable r, String name)
```

**Parameters**

- `Runnable r`
- `String name`


## Fields

<a id="s-DEFAULT_NAME"></a>
### DEFAULT_NAME

```java
public static final String DEFAULT_NAME = "NcsWorkerPoolThread";
```


## Methods

<a id="s-run"></a>
### run()

```java
public void run()
```
