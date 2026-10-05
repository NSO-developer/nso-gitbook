# DpPDEntry

## DpPDEntry

**Package-private**

```java
class com.tailf.ncs.ctrl.DpPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

Callback Component metadata

### Members

**Constructors**:

* [DpPDEntry(NcsMain, String, NcsComponentData, NcsDpMux)](DpPDEntry.md#m-dppdentry-3127984997df)

**Methods**:

* [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addreplacement-afd0844ae705) from AbstractPDEntry
* [finish()](DpPDEntry.md#m-finish-8c785ae2e6bb)
* [getComponent()](AbstractPDEntry.md#m-getcomponent-f0c33077e458) from AbstractPDEntry
* [getFSM()](AbstractPDEntry.md#m-getfsm-b0d67a77e6e5) from AbstractPDEntry
* [getInstances()](AbstractPDEntry.md#m-getinstances-1d7ff49c0f24) from AbstractPDEntry
* [getMux()](DpPDEntry.md#m-getmux-25b4e620ee6b)
* [getName()](DpPDEntry.md#m-getname-2634b18b4a25)
* [isRunning()](AbstractPDEntry.md#m-isrunning-02db4ec84a8d) from AbstractPDEntry
* [load(List) from AbstractPDEntry from AbstractPDEntry from AbstractPDEntryConstructorsDpPDEntry(NcsMain, String, NcsComponentData, NcsDpMux)**Package-private**DpPDEntry(    com.tailf.ncs.NcsMain main,    String name,    com.tailf.ncs.ctrl.NcsComponentData component,    com.tailf.ncs.ctrl.NcsDpMux mux)Types: , , Metadata Constructor for callback component**Parameters**`com.tailf.ncs.NcsMain mainString namecom.tailf.ncs.ctrl.NcsComponentData componentcom.tailf.ncs.ctrl.NcsDpMux mux`Methodsfinish()public void finish()Stop and clear all application componentsgetMux()public com.tailf.ncs.ctrl.NcsDpMux getMux()Types: Get Assigned NcsDpMux for this component**Returns:** NcsDpMuxgetName()public String getName()Get component name**Returns:** String component nameregister()public void register()Register all instances for this callback componentreRegister()public void reRegister()reRegister all instances for this callback componentsetMux(NcsDpMux)public void setMux(com.tailf.ncs.ctrl.NcsDpMux mux)Types: Set NcsDpMux for this component**Parameters**`com.tailf.ncs.ctrl.NcsDpMux mux`toString()public String toString()](AbstractPDEntry.md#m-load-0a08bc3b9064)
