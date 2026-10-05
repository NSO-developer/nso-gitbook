<a id="cls-AppPDEntry"></a>
# AppPDEntry

```java
public class com.tailf.ncs.ctrl.AppPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

Application Component metadata

## Members

**Constructors**:

- [AppPDEntry(NcsMain, String, NcsComponentData)](#m-apppdentry-2b6bdd54f444)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addreplacement-afd0844ae705) from AbstractPDEntry
- [executeInstances()](#m-executeinstances-34bc04c11a64)
- [finishInstances()](#m-finishinstances-43323b43c0d3)
- [getApplicationThreads()](#m-getapplicationthreads-135db5b8bb27)
- [getComponent()](AbstractPDEntry.md#m-getcomponent-f0c33077e458) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#m-getfsm-b0d67a77e6e5) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#m-getinstances-1d7ff49c0f24) from AbstractPDEntry
- [getName()](#m-getname-2634b18b4a25)
- [initInstances()](#m-initinstances-c63259e06a30)
- [isRunning()](AbstractPDEntry.md#m-isrunning-02db4ec84a8d) from AbstractPDEntry
- [load(List<Object>)](AbstractPDEntry.md#m-load-0a08bc3b9064) from AbstractPDEntry
- [reload()](AbstractPDEntry.md#m-reload-b0cf67aa2f64) from AbstractPDEntry
- [toString()](#m-tostring-e9d48c5503ef)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#m-unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

<a id="m-apppdentry-2b6bdd54f444"></a>
### AppPDEntry(NcsMain, String, NcsComponentData)

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

<a id="m-executeinstances-34bc04c11a64"></a>
### executeInstances()

```java
public void executeInstances()
```

Start all application components

<a id="m-finishinstances-43323b43c0d3"></a>
### finishInstances()

```java
public void finishInstances()
```

Stop and clear all application components

<a id="m-getapplicationthreads-135db5b8bb27"></a>
### getApplicationThreads()

```java
public java.util.Map<com.tailf.ncs.ApplicationComponent,com.tailf.ncs.ctrl.ApplicationLifeCycle> getApplicationThreads()
```

Types: [ApplicationComponent](../ApplicationComponent.md#cls-ApplicationComponent), [ApplicationLifeCycle](ApplicationLifeCycle.md#cls-ApplicationLifeCycle)

Get all started application component threads

**Returns:** MapApplicationComponent, Thread> map of all threads

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public String getName()
```

Get component name

**Returns:** String component name

<a id="m-initinstances-c63259e06a30"></a>
### initInstances()

```java
public void initInstances() throws Exception
```

Initialize all application components

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
