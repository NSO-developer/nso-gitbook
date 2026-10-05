# ApplicationLifeCycle <a href="#applicationlifecycle-6326c7f41655" id="applicationlifecycle-6326c7f41655"></a>

```java
public class com.tailf.ncs.ctrl.ApplicationLifeCycle
```

## Members

**Constructors**:

- [ApplicationLifeCycle(NcsMain, ApplicationComponent, String)](#applicationlifecycle-a7cd06963a3f)

**Methods**:

- [executeFinish()](#executefinish-948f271cdb79)
- [executeInit()](#executeinit-90c55b7a9847)
- [executeRun()](#executerun-bd9fb2d93200)
- [getFinishThread()](#getfinishthread-cafe0239d0c3)
- [getInitError()](#getiniterror-db29a0beb4a2)

## Constructors

### ApplicationLifeCycle(NcsMain, ApplicationComponent, String) <a href="#applicationlifecycle-a7cd06963a3f" id="applicationlifecycle-a7cd06963a3f"></a>

```java
public ApplicationLifeCycle(
    com.tailf.ncs.NcsMain main,
    com.tailf.ncs.ApplicationComponent appComp,
    String name
)
```

Types: [NcsMain](../NcsMain.md#ncsmain-eb814813aed4), [ApplicationComponent](../ApplicationComponent.md#applicationcomponent-05ae0996aaa3)

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `com.tailf.ncs.ApplicationComponent appComp` - The user component that should be execute
 after the init() has completed
- `String name` - The name of the component that is
 "pkg-name":"component-name" where


## Methods

### executeFinish() <a href="#executefinish-948f271cdb79" id="executefinish-948f271cdb79"></a>

**Package-private**

```java
void executeFinish()
```

Triggers the execution of the ApplicationComponent.finish() method.
 Creates a "finish-thread" (new thread) and execute
 ApplicationComponent.finish() method on it.
 The finish threads purpose is to release the executeThread and also
 calls interrupt on it.

### executeInit() <a href="#executeinit-90c55b7a9847" id="executeinit-90c55b7a9847"></a>

**Package-private**

```java
void executeInit()
```

Triggers the execution of the ApplicationComponent init() method
 Creates a "helper-thread" (new thread) and starts it
 in its Thread.run it executes the init method

### executeRun() <a href="#executerun-bd9fb2d93200" id="executerun-bd9fb2d93200"></a>

```java
protected void executeRun()
```

Triggers the execution of the ApplicationComponent.run() method.
 Create a new thread and store the reference into helperThread
 and execute executeThread.start within that thread i.e
 calls previously created executeThread ( in constructor ) .

### getFinishThread() <a href="#getfinishthread-cafe0239d0c3" id="getfinishthread-cafe0239d0c3"></a>

```java
public Thread getFinishThread()
```

### getInitError() <a href="#getiniterror-db29a0beb4a2" id="getiniterror-db29a0beb4a2"></a>

```java
protected Throwable getInitError()
```
