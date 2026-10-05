<a id="cls-NcsThread"></a>
# NcsThread

```java
public class com.tailf.ncs.NcsThread
    extends Thread
```

NcsThread is a subclass of Thread with the ability to log more info about
 a thread and implements an UncaughtExceptionHandler.

## Members

**Constructors**:

- [NcsThread(Runnable)](#m-ncsthread-2da10fc87e4c)
- [NcsThread(Runnable, String)](#m-ncsthread-ff60b8717078)

**Fields**:

- [DEFAULT_NAME](#m-DEFAULT_NAME)

**Methods**:

- [run()](#m-run-b6dbda048863)

## Constructors

<a id="m-ncsthread-2da10fc87e4c"></a>
### NcsThread(Runnable)

```java
public NcsThread(Runnable r)
```

**Parameters**

- `Runnable r`

<a id="m-ncsthread-ff60b8717078"></a>
### NcsThread(Runnable, String)

```java
public NcsThread(Runnable r, String name)
```

**Parameters**

- `Runnable r`
- `String name`


## Fields

<a id="m-DEFAULT_NAME"></a>
### DEFAULT_NAME

```java
public static final String DEFAULT_NAME = "NcsWorkerPoolThread";
```


## Methods

<a id="m-run-b6dbda048863"></a>
### run()

```java
public void run()
```
