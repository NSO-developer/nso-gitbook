<a id="s-AbstractPDEntry"></a>
# AbstractPDEntry

```java
public abstract class com.tailf.ncs.ctrl.AbstractPDEntry
```

Base class for Ncs package component meta data
 This class also defines the component Manager finite state machine,
 which has the same state transitions for all types of components

**Related classes**

- [AppPDEntry](AppPDEntry.md#s-AppPDEntry)
- [DpPDEntry](DpPDEntry.md#s-DpPDEntry)
- [NedPDEntry](NedPDEntry.md#s-NedPDEntry)
- [ServicePDEntry](ServicePDEntry.md#s-ServicePDEntry)

## Members

**Constructors**:

- [AbstractPDEntry(NcsMain, NcsComponentData, String)](#s-AbstractPDEntry-1)

**Methods**:

- [addReplacement(NcsComponentData)](#s-addReplacement)
- [getComponent()](#s-getComponent)
- [getFSM()](#s-getFSM)
- [getInstances()](#s-getInstances)
- [isRunning()](#s-isRunning)
- [load(List<Object>)](#s-load)
- [reload()](#s-reload)
- [toString()](#s-toString)
- [unload(AbstractPDEntry)](#s-unload)

## Constructors

<a id="s-AbstractPDEntry-1"></a>
### AbstractPDEntry(NcsMain, NcsComponentData, String)

```java
protected AbstractPDEntry(
    com.tailf.ncs.NcsMain main,
    com.tailf.ncs.ctrl.NcsComponentData component,
    String name
)
```

Types: [NcsMain](../NcsMain.md#s-NcsMain), [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

This constructor sets up the component FSM and some general
 state transition actions

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `com.tailf.ncs.ctrl.NcsComponentData component`
- `String name`


## Methods

<a id="s-addReplacement"></a>
### addReplacement(NcsComponentData)

```java
public void addReplacement(com.tailf.ncs.ctrl.NcsComponentData component)
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Prepare for exchange of this component

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData component`

<a id="s-getComponent"></a>
### getComponent()

```java
public com.tailf.ncs.ctrl.NcsComponentData getComponent()
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

<a id="s-getFSM"></a>
### getFSM()

```java
public com.tailf.ncs.ctrl.fsm.FSM getFSM()
```

Types: [FSM](fsm/FSM.md#s-FSM)

Get this components finite state machine

**Returns:** FSM the finite state machine

<a id="s-getInstances"></a>
### getInstances()

```java
public java.util.List<Object> getInstances()
```

Get class instances for thus component

**Returns:** List current instances

<a id="s-isRunning"></a>
### isRunning()

```java
public boolean isRunning()
```

Check if this component is running

**Returns:** true if this component is in run mode

<a id="s-load"></a>
### load(List<Object>)

```java
public void load(java.util.List<Object> instances) throws com.tailf.ncs.NcsException
```

Types: [NcsException](../NcsException.md#s-NcsException)

Instantiate classes for this component

**Parameters**

- `java.util.List<Object> instances`

**Throws**

- `NcsException`

<a id="s-reload"></a>
### reload()

```java
public void reload() throws Exception
```

Redeploy this component

**Throws**

- `Exception`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-unload"></a>
### unload(AbstractPDEntry)

```java
public void unload(com.tailf.ncs.ctrl.AbstractPDEntry data)
```

Types: [AbstractPDEntry](AbstractPDEntry.md#s-AbstractPDEntry)

**Parameters**

- `com.tailf.ncs.ctrl.AbstractPDEntry data`
