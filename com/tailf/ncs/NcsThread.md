# NcsThread <a href="#ncsthread-abffbbd3cdbc" id="ncsthread-abffbbd3cdbc"></a>

```java
public class com.tailf.ncs.NcsThread
    extends Thread
```

NcsThread is a subclass of Thread with the ability to log more info about
 a thread and implements an UncaughtExceptionHandler.

## Members

**Constructors**:

- [NcsThread\(Runnable\)](#ncsthread-2da10fc87e4c)
- [NcsThread\(Runnable, String\)](#ncsthread-ff60b8717078)

**Fields**:

- [DEFAULT\_NAME](#default_name-176b69b4d69f)

**Methods**:

- [run\(\)](#run-b6dbda048863)

## Constructors

### NcsThread(Runnable) <a href="#ncsthread-2da10fc87e4c" id="ncsthread-2da10fc87e4c"></a>

```java
public NcsThread(Runnable r)
```

**Parameters**

- `Runnable r`

### NcsThread(Runnable, String) <a href="#ncsthread-ff60b8717078" id="ncsthread-ff60b8717078"></a>

```java
public NcsThread(Runnable r, String name)
```

**Parameters**

- `Runnable r`
- `String name`


## Fields

### DEFAULT_NAME <a href="#default_name-176b69b4d69f" id="default_name-176b69b4d69f"></a>

```java
public static final String DEFAULT_NAME = "NcsWorkerPoolThread";
```


## Methods

### run() <a href="#run-b6dbda048863" id="run-b6dbda048863"></a>

```java
public void run()
```
