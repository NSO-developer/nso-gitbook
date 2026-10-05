# AppPDEntry <a href="#cls-AppPDEntry" id="cls-AppPDEntry"></a>

```java
public class com.tailf.ncs.ctrl.AppPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

Application Component metadata

## Members

**Constructors**:

- [AppPDEntry(NcsMain, String, NcsComponentData)](#m-AppPDEntry-2b6bdd54f444)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addReplacement-afd0844ae705) from AbstractPDEntry
- [executeInstances()](#m-executeInstances-34bc04c11a64)
- [finishInstances()](#m-finishInstances-43323b43c0d3)
- [getApplicationThreads()](#m-getApplicationThreads-135db5b8bb27)
- [getComponent()](AbstractPDEntry.md#m-getComponent-f0c33077e458) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#m-getFSM-b0d67a77e6e5) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#m-getInstances-1d7ff49c0f24) from AbstractPDEntry
- [getName()](#m-getName-2634b18b4a25)
- [initInstances()](#m-initInstances-c63259e06a30)
- [isRunning()](AbstractPDEntry.md#m-isRunning-02db4ec84a8d) from AbstractPDEntry
- [load(List<Object>)](AbstractPDEntry.md#m-load-0a08bc3b9064) from AbstractPDEntry
- [reload()](AbstractPDEntry.md#m-reload-b0cf67aa2f64) from AbstractPDEntry
- [toString()](#m-toString-e9d48c5503ef)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#m-unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

### AppPDEntry(NcsMain, String, NcsComponentData) <a href="#m-AppPDEntry-2b6bdd54f444" id="m-AppPDEntry-2b6bdd54f444"></a>

```java
public AppPDEntry(
    com.tailf.ncs.NcsMain main,
    String name,
    com.tailf.ncs.ctrl.NcsComponentData component
)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain), [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Metadata Constructor for application component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String name`
- `com.tailf.ncs.ctrl.NcsComponentData component`


## Methods

### executeInstances() <a href="#m-executeInstances-34bc04c11a64" id="m-executeInstances-34bc04c11a64"></a>

```java
public void executeInstances()
```

Start all application components

### finishInstances() <a href="#m-finishInstances-43323b43c0d3" id="m-finishInstances-43323b43c0d3"></a>

```java
public void finishInstances()
```

Stop and clear all application components

### getApplicationThreads() <a href="#m-getApplicationThreads-135db5b8bb27" id="m-getApplicationThreads-135db5b8bb27"></a>

```java
public java.util.Map<com.tailf.ncs.ApplicationComponent,com.tailf.ncs.ctrl.ApplicationLifeCycle> getApplicationThreads()
```

Types: [ApplicationComponent](../ApplicationComponent.md#cls-ApplicationComponent), [ApplicationLifeCycle](ApplicationLifeCycle.md#cls-ApplicationLifeCycle)

Get all started application component threads

**Returns:** MapApplicationComponent, Thread> map of all threads

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public String getName()
```

Get component name

**Returns:** String component name

### initInstances() <a href="#m-initInstances-c63259e06a30" id="m-initInstances-c63259e06a30"></a>

```java
public void initInstances() throws Exception
```

Initialize all application components

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
