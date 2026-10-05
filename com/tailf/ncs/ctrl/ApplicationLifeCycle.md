<a id="s-ApplicationLifeCycle"></a>
# ApplicationLifeCycle

```java
public class com.tailf.ncs.ctrl.ApplicationLifeCycle
```

## Members

**Constructors**:

- [ApplicationLifeCycle(NcsMain, ApplicationComponent, String)](#s-ApplicationLifeCycle-1)

**Methods**:

- [executeFinish()](#s-executeFinish)
- [executeInit()](#s-executeInit)
- [executeRun()](#s-executeRun)
- [getFinishThread()](#s-getFinishThread)
- [getInitError()](#s-getInitError)

## Constructors

<a id="s-ApplicationLifeCycle-1"></a>
### ApplicationLifeCycle(NcsMain, ApplicationComponent, String)

```java
public ApplicationLifeCycle(
    com.tailf.ncs.NcsMain main,
    com.tailf.ncs.ApplicationComponent appComp,
    String name
)
```

Types: [NcsMain](../NcsMain.md#s-NcsMain), [ApplicationComponent](../ApplicationComponent.md#s-ApplicationComponent)

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `com.tailf.ncs.ApplicationComponent appComp` - The user component that should be execute
 after the init() has completed
- `String name` - The name of the component that is
 "pkg-name":"component-name" where


## Methods

<a id="s-executeFinish"></a>
### executeFinish()

**Package-private**

```java
void executeFinish()
```

Triggers the execution of the ApplicationComponent.finish() method.
 Creates a "finish-thread" (new thread) and execute
 ApplicationComponent.finish() method on it.
 The finish threads purpose is to release the executeThread and also
 calls interrupt on it.

<a id="s-executeInit"></a>
### executeInit()

**Package-private**

```java
void executeInit()
```

Triggers the execution of the ApplicationComponent init() method
 Creates a "helper-thread" (new thread) and starts it
 in its Thread.run it executes the init method

<a id="s-executeRun"></a>
### executeRun()

```java
protected void executeRun()
```

Triggers the execution of the ApplicationComponent.run() method.
 Create a new thread and store the reference into helperThread
 and execute executeThread.start within that thread i.e
 calls previously created executeThread ( in constructor ) .

<a id="s-getFinishThread"></a>
### getFinishThread()

```java
public Thread getFinishThread()
```

<a id="s-getInitError"></a>
### getInitError()

```java
protected Throwable getInitError()
```
