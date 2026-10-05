# AbstractPDEntry <a href="#abstractpdentry-c4b436e626e5" id="abstractpdentry-c4b436e626e5"></a>

```java
public abstract class com.tailf.ncs.ctrl.AbstractPDEntry
```

Base class for Ncs package component meta data
 This class also defines the component Manager finite state machine,
 which has the same state transitions for all types of components

**Related classes**

- [AppPDEntry](AppPDEntry.md#apppdentry-fb5d42b84e3c)
- [DpPDEntry](DpPDEntry.md#dppdentry-3d7fc55c80fc)
- [NedPDEntry](NedPDEntry.md#nedpdentry-af34e0aea42b)
- [ServicePDEntry](ServicePDEntry.md#servicepdentry-4f187dfd4f44)

## Members

**Constructors**:

- [AbstractPDEntry\(NcsMain, NcsComponentData, String\)](#abstractpdentry-19225bf798c9)

**Methods**:

- [addReplacement\(NcsComponentData\)](#addreplacement-afd0844ae705)
- [getComponent\(\)](#getcomponent-f0c33077e458)
- [getFSM\(\)](#getfsm-b0d67a77e6e5)
- [getInstances\(\)](#getinstances-1d7ff49c0f24)
- [isRunning\(\)](#isrunning-02db4ec84a8d)
- [load\(List\<Object\>\)](#load-0a08bc3b9064)
- [reload\(\)](#reload-b0cf67aa2f64)
- [toString\(\)](#tostring-e9d48c5503ef)
- [unload\(AbstractPDEntry\)](#unload-79ee120e7a8a)

## Constructors

### AbstractPDEntry(NcsMain, NcsComponentData, String) <a href="#abstractpdentry-19225bf798c9" id="abstractpdentry-19225bf798c9"></a>

```java
protected AbstractPDEntry(
    com.tailf.ncs.NcsMain main,
    com.tailf.ncs.ctrl.NcsComponentData component,
    String name
)
```

Types: [NcsMain](../NcsMain.md#ncsmain-eb814813aed4), [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

This constructor sets up the component FSM and some general
 state transition actions

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `com.tailf.ncs.ctrl.NcsComponentData component`
- `String name`


## Methods

### addReplacement(NcsComponentData) <a href="#addreplacement-afd0844ae705" id="addreplacement-afd0844ae705"></a>

```java
public void addReplacement(com.tailf.ncs.ctrl.NcsComponentData component)
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Prepare for exchange of this component

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData component`

### getComponent() <a href="#getcomponent-f0c33077e458" id="getcomponent-f0c33077e458"></a>

```java
public com.tailf.ncs.ctrl.NcsComponentData getComponent()
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

### getFSM() <a href="#getfsm-b0d67a77e6e5" id="getfsm-b0d67a77e6e5"></a>

```java
public com.tailf.ncs.ctrl.fsm.FSM getFSM()
```

Types: [FSM](fsm/FSM.md#fsm-255798df5203)

Get this components finite state machine

**Returns:** FSM the finite state machine

### getInstances() <a href="#getinstances-1d7ff49c0f24" id="getinstances-1d7ff49c0f24"></a>

```java
public java.util.List<Object> getInstances()
```

Get class instances for thus component

**Returns:** List current instances

### isRunning() <a href="#isrunning-02db4ec84a8d" id="isrunning-02db4ec84a8d"></a>

```java
public boolean isRunning()
```

Check if this component is running

**Returns:** true if this component is in run mode

### load(List&lt;Object&gt;) <a href="#load-0a08bc3b9064" id="load-0a08bc3b9064"></a>

```java
public void load(java.util.List<Object> instances) throws com.tailf.ncs.NcsException
```

Types: [NcsException](../NcsException.md#ncsexception-d2b40ca98ea5)

Instantiate classes for this component

**Parameters**

- `java.util.List<Object> instances`

**Throws**

- `NcsException`

### reload() <a href="#reload-b0cf67aa2f64" id="reload-b0cf67aa2f64"></a>

```java
public void reload() throws Exception
```

Redeploy this component

**Throws**

- `Exception`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### unload(AbstractPDEntry) <a href="#unload-79ee120e7a8a" id="unload-79ee120e7a8a"></a>

```java
public void unload(com.tailf.ncs.ctrl.AbstractPDEntry data)
```

Types: [AbstractPDEntry](AbstractPDEntry.md#abstractpdentry-c4b436e626e5)

**Parameters**

- `com.tailf.ncs.ctrl.AbstractPDEntry data`
