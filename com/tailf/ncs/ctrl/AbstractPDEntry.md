<a id="cls-AbstractPDEntry"></a>
# AbstractPDEntry

```java
public abstract class com.tailf.ncs.ctrl.AbstractPDEntry
```

Base class for Ncs package component meta data
 This class also defines the component Manager finite state machine,
 which has the same state transitions for all types of components

**Related classes**

- [AppPDEntry](AppPDEntry.md#cls-AppPDEntry)
- [DpPDEntry](DpPDEntry.md#cls-DpPDEntry)
- [NedPDEntry](NedPDEntry.md#cls-NedPDEntry)
- [ServicePDEntry](ServicePDEntry.md#cls-ServicePDEntry)

## Members

**Constructors**:

- [AbstractPDEntry(NcsMain, NcsComponentData, String)](#m-abstractpdentry-19225bf798c9)

**Methods**:

- [addReplacement(NcsComponentData)](#m-addreplacement-afd0844ae705)
- [getComponent()](#m-getcomponent-f0c33077e458)
- [getFSM()](#m-getfsm-b0d67a77e6e5)
- [getInstances()](#m-getinstances-1d7ff49c0f24)
- [isRunning()](#m-isrunning-02db4ec84a8d)
- [load(List<Object>)](#m-load-0a08bc3b9064)
- [reload()](#m-reload-b0cf67aa2f64)
- [toString()](#m-tostring-e9d48c5503ef)
- [unload(AbstractPDEntry)](#m-unload-79ee120e7a8a)

## Constructors

<a id="m-abstractpdentry-19225bf798c9"></a>
### AbstractPDEntry(NcsMain, NcsComponentData, String)

```java
protected AbstractPDEntry(
    com.tailf.ncs.NcsMain main,
    com.tailf.ncs.ctrl.NcsComponentData component,
    String name
)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain), [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

This constructor sets up the component FSM and some general
 state transition actions

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `com.tailf.ncs.ctrl.NcsComponentData component`
- `String name`


## Methods

<a id="m-addreplacement-afd0844ae705"></a>
### addReplacement(NcsComponentData)

```java
public void addReplacement(com.tailf.ncs.ctrl.NcsComponentData component)
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Prepare for exchange of this component

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData component`

<a id="m-getcomponent-f0c33077e458"></a>
### getComponent()

```java
public com.tailf.ncs.ctrl.NcsComponentData getComponent()
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

<a id="m-getfsm-b0d67a77e6e5"></a>
### getFSM()

```java
public com.tailf.ncs.ctrl.fsm.FSM getFSM()
```

Types: [FSM](fsm/FSM.md#cls-FSM)

Get this components finite state machine

**Returns:** FSM the finite state machine

<a id="m-getinstances-1d7ff49c0f24"></a>
### getInstances()

```java
public java.util.List<Object> getInstances()
```

Get class instances for thus component

**Returns:** List current instances

<a id="m-isrunning-02db4ec84a8d"></a>
### isRunning()

```java
public boolean isRunning()
```

Check if this component is running

**Returns:** true if this component is in run mode

<a id="m-load-0a08bc3b9064"></a>
### load(List<Object>)

```java
public void load(java.util.List<Object> instances) throws com.tailf.ncs.NcsException
```

Types: [NcsException](../NcsException.md#cls-NcsException)

Instantiate classes for this component

**Parameters**

- `java.util.List<Object> instances`

**Throws**

- `NcsException`

<a id="m-reload-b0cf67aa2f64"></a>
### reload()

```java
public void reload() throws Exception
```

Redeploy this component

**Throws**

- `Exception`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-unload-79ee120e7a8a"></a>
### unload(AbstractPDEntry)

```java
public void unload(com.tailf.ncs.ctrl.AbstractPDEntry data)
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

**Parameters**

- `com.tailf.ncs.ctrl.AbstractPDEntry data`
