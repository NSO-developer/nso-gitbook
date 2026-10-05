<a id="s-AppPDEntry"></a>
# AppPDEntry

```java
public class com.tailf.ncs.ctrl.AppPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#s-AbstractPDEntry)

Application Component metadata

## Members

**Constructors**:

- [AppPDEntry(NcsMain, String, NcsComponentData)](#s-AppPDEntry-1)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#s-addReplacement) from AbstractPDEntry
- [executeInstances()](#s-executeInstances)
- [finishInstances()](#s-finishInstances)
- [getApplicationThreads()](#s-getApplicationThreads)
- [getComponent()](AbstractPDEntry.md#s-getComponent) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#s-getFSM) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#s-getInstances) from AbstractPDEntry
- [getName()](#s-getName)
- [initInstances()](#s-initInstances)
- [isRunning()](AbstractPDEntry.md#s-isRunning) from AbstractPDEntry
- [load(List<Object>)](AbstractPDEntry.md#s-load) from AbstractPDEntry
- [reload()](AbstractPDEntry.md#s-reload) from AbstractPDEntry
- [toString()](#s-toString)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#s-unload) from AbstractPDEntry

## Constructors

<a id="s-AppPDEntry-1"></a>
### AppPDEntry(NcsMain, String, NcsComponentData)

```java
public AppPDEntry(
    com.tailf.ncs.NcsMain main,
    String name,
    com.tailf.ncs.ctrl.NcsComponentData component
)
```

Types: [NcsMain](../NcsMain.md#s-NcsMain), [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Metadata Constructor for application component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String name`
- `com.tailf.ncs.ctrl.NcsComponentData component`


## Methods

<a id="s-executeInstances"></a>
### executeInstances()

```java
public void executeInstances()
```

Start all application components

<a id="s-finishInstances"></a>
### finishInstances()

```java
public void finishInstances()
```

Stop and clear all application components

<a id="s-getApplicationThreads"></a>
### getApplicationThreads()

```java
public java.util.Map<com.tailf.ncs.ApplicationComponent,com.tailf.ncs.ctrl.ApplicationLifeCycle> getApplicationThreads()
```

Types: [ApplicationComponent](../ApplicationComponent.md#s-ApplicationComponent), [ApplicationLifeCycle](ApplicationLifeCycle.md#s-ApplicationLifeCycle)

Get all started application component threads

**Returns:** MapApplicationComponent, Thread> map of all threads

<a id="s-getName"></a>
### getName()

```java
public String getName()
```

Get component name

**Returns:** String component name

<a id="s-initInstances"></a>
### initInstances()

```java
public void initInstances() throws Exception
```

Initialize all application components

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
