# AbstractPDEntry

## AbstractPDEntry

```java
public abstract class com.tailf.ncs.ctrl.AbstractPDEntry
```

Base class for Ncs package component meta data This class also defines the component Manager finite state machine, which has the same state transitions for all types of components

**Related classes**

* [AppPDEntry](AppPDEntry.md#cls-AppPDEntry)
* [DpPDEntry](DpPDEntry.md#cls-DpPDEntry)
* [NedPDEntry](NedPDEntry.md#cls-NedPDEntry)
* [ServicePDEntry](ServicePDEntry.md#cls-ServicePDEntry)

### Members

**Constructors**:

* [AbstractPDEntry(NcsMain, NcsComponentData, String)](AbstractPDEntry.md#m-abstractpdentry-19225bf798c9)

**Methods**:

* [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addreplacement-afd0844ae705)
* [getComponent()](AbstractPDEntry.md#m-getcomponent-f0c33077e458)
* [getFSM()](AbstractPDEntry.md#m-getfsm-b0d67a77e6e5)
* [getInstances()](AbstractPDEntry.md#m-getinstances-1d7ff49c0f24)
* [isRunning()](AbstractPDEntry.md#m-isrunning-02db4ec84a8d)
* [load(List)ConstructorsAbstractPDEntry(NcsMain, NcsComponentData, String)protected AbstractPDEntry(    com.tailf.ncs.NcsMain main,    com.tailf.ncs.ctrl.NcsComponentData component,    String name)Types: , This constructor sets up the component FSM and some general state transition actions**Parameters**`com.tailf.ncs.NcsMain maincom.tailf.ncs.ctrl.NcsComponentData componentString name`MethodsaddReplacement(NcsComponentData)public void addReplacement(com.tailf.ncs.ctrl.NcsComponentData component)Types: Prepare for exchange of this component**Parameters**`com.tailf.ncs.ctrl.NcsComponentData component`getComponent()public com.tailf.ncs.ctrl.NcsComponentData getComponent()Types: getFSM()public com.tailf.ncs.ctrl.fsm.FSM getFSM()Types: Get this components finite state machine**Returns:** FSM the finite state machinegetInstances()public java.util.List\<Object> getInstances()Get class instances for thus component**Returns:** List current instancesisRunning()public boolean isRunning()Check if this component is running**Returns:** true if this component is in run modeload(List)public void load(java.util.List\<Object> instances) throws com.tailf.ncs.NcsExceptionTypes: Instantiate classes for this component**Parameters**`java.util.List<Object> instances`**Throws**`NcsException`reload()public void reload() throws ExceptionRedeploy this component**Throws**`Exception`toString()public String toString()unload(AbstractPDEntry)public void unload(com.tailf.ncs.ctrl.AbstractPDEntry data)Types: **Parameters**`com.tailf.ncs.ctrl.AbstractPDEntry data`](AbstractPDEntry.md#m-load-0a08bc3b9064)
