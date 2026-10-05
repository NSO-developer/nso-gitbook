# AppPDEntry <a href="#apppdentry-fb5d42b84e3c" id="apppdentry-fb5d42b84e3c"></a>

```java
public class com.tailf.ncs.ctrl.AppPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#abstractpdentry-c4b436e626e5)

Application Component metadata

## Members

**Constructors**:

- [AppPDEntry(NcsMain, String, NcsComponentData)](#apppdentry-2b6bdd54f444)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#addreplacement-afd0844ae705) from AbstractPDEntry
- [executeInstances()](#executeinstances-34bc04c11a64)
- [finishInstances()](#finishinstances-43323b43c0d3)
- [getApplicationThreads()](#getapplicationthreads-135db5b8bb27)
- [getComponent()](AbstractPDEntry.md#getcomponent-f0c33077e458) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#getfsm-b0d67a77e6e5) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#getinstances-1d7ff49c0f24) from AbstractPDEntry
- [getName()](#getname-2634b18b4a25)
- [initInstances()](#initinstances-c63259e06a30)
- [isRunning()](AbstractPDEntry.md#isrunning-02db4ec84a8d) from AbstractPDEntry
- [load(List<Object>)](AbstractPDEntry.md#load-0a08bc3b9064) from AbstractPDEntry
- [reload()](AbstractPDEntry.md#reload-b0cf67aa2f64) from AbstractPDEntry
- [toString()](#tostring-e9d48c5503ef)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

### AppPDEntry(NcsMain, String, NcsComponentData) <a href="#apppdentry-2b6bdd54f444" id="apppdentry-2b6bdd54f444"></a>

```java
public AppPDEntry(
    com.tailf.ncs.NcsMain main,
    String name,
    com.tailf.ncs.ctrl.NcsComponentData component
)
```

Types: [NcsMain](../NcsMain.md#ncsmain-eb814813aed4), [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Metadata Constructor for application component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String name`
- `com.tailf.ncs.ctrl.NcsComponentData component`


## Methods

### executeInstances() <a href="#executeinstances-34bc04c11a64" id="executeinstances-34bc04c11a64"></a>

```java
public void executeInstances()
```

Start all application components

### finishInstances() <a href="#finishinstances-43323b43c0d3" id="finishinstances-43323b43c0d3"></a>

```java
public void finishInstances()
```

Stop and clear all application components

### getApplicationThreads() <a href="#getapplicationthreads-135db5b8bb27" id="getapplicationthreads-135db5b8bb27"></a>

```java
public java.util.Map<com.tailf.ncs.ApplicationComponent,com.tailf.ncs.ctrl.ApplicationLifeCycle> getApplicationThreads()
```

Types: [ApplicationComponent](../ApplicationComponent.md#applicationcomponent-05ae0996aaa3), [ApplicationLifeCycle](ApplicationLifeCycle.md#applicationlifecycle-6326c7f41655)

Get all started application component threads

**Returns:** MapApplicationComponent, Thread> map of all threads

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public String getName()
```

Get component name

**Returns:** String component name

### initInstances() <a href="#initinstances-c63259e06a30" id="initinstances-c63259e06a30"></a>

```java
public void initInstances() throws Exception
```

Initialize all application components

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
