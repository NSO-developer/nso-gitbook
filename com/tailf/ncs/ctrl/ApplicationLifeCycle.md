<a id="cls-ApplicationLifeCycle"></a>
# ApplicationLifeCycle

```java
public class com.tailf.ncs.ctrl.ApplicationLifeCycle
```

## Members

**Constructors**:

- [ApplicationLifeCycle(NcsMain, ApplicationComponent, String)](#m-applicationlifecycle-a7cd06963a3f)

**Methods**:

- [executeFinish()](#m-executefinish-948f271cdb79)
- [executeInit()](#m-executeinit-90c55b7a9847)
- [executeRun()](#m-executerun-bd9fb2d93200)
- [getFinishThread()](#m-getfinishthread-cafe0239d0c3)
- [getInitError()](#m-getiniterror-db29a0beb4a2)

## Constructors

<a id="m-applicationlifecycle-a7cd06963a3f"></a>
### ApplicationLifeCycle(NcsMain, ApplicationComponent, String)

```java
public ApplicationLifeCycle(
    com.tailf.ncs.NcsMain main,
    com.tailf.ncs.ApplicationComponent appComp,
    String name
)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain), [ApplicationComponent](../ApplicationComponent.md#cls-ApplicationComponent)

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `com.tailf.ncs.ApplicationComponent appComp` - The user component that should be execute
 after the init() has completed
- `String name` - The name of the component that is
 "pkg-name":"component-name" where


## Methods

<a id="m-executefinish-948f271cdb79"></a>
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

<a id="m-executeinit-90c55b7a9847"></a>
### executeInit()

**Package-private**

```java
void executeInit()
```

Triggers the execution of the ApplicationComponent init() method
 Creates a "helper-thread" (new thread) and starts it
 in its Thread.run it executes the init method

<a id="m-executerun-bd9fb2d93200"></a>
### executeRun()

```java
protected void executeRun()
```

Triggers the execution of the ApplicationComponent.run() method.
 Create a new thread and store the reference into helperThread
 and execute executeThread.start within that thread i.e
 calls previously created executeThread ( in constructor ) .

<a id="m-getfinishthread-cafe0239d0c3"></a>
### getFinishThread()

```java
public Thread getFinishThread()
```

<a id="m-getiniterror-db29a0beb4a2"></a>
### getInitError()

```java
protected Throwable getInitError()
```
