# AbstractPDEntry <a href="#cls-AbstractPDEntry" id="cls-AbstractPDEntry"></a>

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

- [AbstractPDEntry(NcsMain, NcsComponentData, String)](#m-AbstractPDEntry-19225bf798c9)

**Methods**:

- [addReplacement(NcsComponentData)](#m-addReplacement-afd0844ae705)
- [getComponent()](#m-getComponent-f0c33077e458)
- [getFSM()](#m-getFSM-b0d67a77e6e5)
- [getInstances()](#m-getInstances-1d7ff49c0f24)
- [isRunning()](#m-isRunning-02db4ec84a8d)
- [load(List<Object>)](#m-load-0a08bc3b9064)
- [reload()](#m-reload-b0cf67aa2f64)
- [toString()](#m-toString-e9d48c5503ef)
- [unload(AbstractPDEntry)](#m-unload-79ee120e7a8a)

## Constructors

### AbstractPDEntry(NcsMain, NcsComponentData, String) <a href="#m-AbstractPDEntry-19225bf798c9" id="m-AbstractPDEntry-19225bf798c9"></a>

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

### addReplacement(NcsComponentData) <a href="#m-addReplacement-afd0844ae705" id="m-addReplacement-afd0844ae705"></a>

```java
public void addReplacement(com.tailf.ncs.ctrl.NcsComponentData component)
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Prepare for exchange of this component

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData component`

### getComponent() <a href="#m-getComponent-f0c33077e458" id="m-getComponent-f0c33077e458"></a>

```java
public com.tailf.ncs.ctrl.NcsComponentData getComponent()
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

### getFSM() <a href="#m-getFSM-b0d67a77e6e5" id="m-getFSM-b0d67a77e6e5"></a>

```java
public com.tailf.ncs.ctrl.fsm.FSM getFSM()
```

Types: [FSM](fsm/FSM.md#cls-FSM)

Get this components finite state machine

**Returns:** FSM the finite state machine

### getInstances() <a href="#m-getInstances-1d7ff49c0f24" id="m-getInstances-1d7ff49c0f24"></a>

```java
public java.util.List<Object> getInstances()
```

Get class instances for thus component

**Returns:** List current instances

### isRunning() <a href="#m-isRunning-02db4ec84a8d" id="m-isRunning-02db4ec84a8d"></a>

```java
public boolean isRunning()
```

Check if this component is running

**Returns:** true if this component is in run mode

### load(List<Object>) <a href="#m-load-0a08bc3b9064" id="m-load-0a08bc3b9064"></a>

```java
public void load(java.util.List<Object> instances) throws com.tailf.ncs.NcsException
```

Types: [NcsException](../NcsException.md#cls-NcsException)

Instantiate classes for this component

**Parameters**

- `java.util.List<Object> instances`

**Throws**

- `NcsException`

### reload() <a href="#m-reload-b0cf67aa2f64" id="m-reload-b0cf67aa2f64"></a>

```java
public void reload() throws Exception
```

Redeploy this component

**Throws**

- `Exception`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### unload(AbstractPDEntry) <a href="#m-unload-79ee120e7a8a" id="m-unload-79ee120e7a8a"></a>

```java
public void unload(com.tailf.ncs.ctrl.AbstractPDEntry data)
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

**Parameters**

- `com.tailf.ncs.ctrl.AbstractPDEntry data`
