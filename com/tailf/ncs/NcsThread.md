# NcsThread <a href="#cls-NcsThread" id="cls-NcsThread"></a>

```java
public class com.tailf.ncs.NcsThread
    extends Thread
```

NcsThread is a subclass of Thread with the ability to log more info about
 a thread and implements an UncaughtExceptionHandler.

## Members

**Constructors**:

- [NcsThread(Runnable)](#m-NcsThread-2da10fc87e4c)
- [NcsThread(Runnable, String)](#m-NcsThread-ff60b8717078)

**Fields**:

- [DEFAULT_NAME](#m-DEFAULT_NAME)

**Methods**:

- [run()](#m-run-b6dbda048863)

## Constructors

### NcsThread(Runnable) <a href="#m-NcsThread-2da10fc87e4c" id="m-NcsThread-2da10fc87e4c"></a>

```java
public NcsThread(Runnable r)
```

**Parameters**

- `Runnable r`

### NcsThread(Runnable, String) <a href="#m-NcsThread-ff60b8717078" id="m-NcsThread-ff60b8717078"></a>

```java
public NcsThread(Runnable r, String name)
```

**Parameters**

- `Runnable r`
- `String name`


## Fields

### DEFAULT_NAME <a href="#m-DEFAULT_NAME" id="m-DEFAULT_NAME"></a>

```java
public static final String DEFAULT_NAME = "NcsWorkerPoolThread";
```


## Methods

### run() <a href="#m-run-b6dbda048863" id="m-run-b6dbda048863"></a>

```java
public void run()
```
