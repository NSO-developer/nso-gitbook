# AppPDEntry

## AppPDEntry

```java
public class com.tailf.ncs.ctrl.AppPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

Application Component metadata

### Members

**Constructors**:

* [AppPDEntry(NcsMain, String, NcsComponentData)](AppPDEntry.md#m-apppdentry-2b6bdd54f444)

**Methods**:

* [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addreplacement-afd0844ae705) from AbstractPDEntry
* [executeInstances()](AppPDEntry.md#m-executeinstances-34bc04c11a64)
* [finishInstances()](AppPDEntry.md#m-finishinstances-43323b43c0d3)
* [getApplicationThreads()](AppPDEntry.md#m-getapplicationthreads-135db5b8bb27)
* [getComponent()](AbstractPDEntry.md#m-getcomponent-f0c33077e458) from AbstractPDEntry
* [getFSM()](AbstractPDEntry.md#m-getfsm-b0d67a77e6e5) from AbstractPDEntry
* [getInstances()](AbstractPDEntry.md#m-getinstances-1d7ff49c0f24) from AbstractPDEntry
* [getName()](AppPDEntry.md#m-getname-2634b18b4a25)
* [initInstances()](AppPDEntry.md#m-initinstances-c63259e06a30)
* [isRunning()](AbstractPDEntry.md#m-isrunning-02db4ec84a8d) from AbstractPDEntry
* [load(List) from AbstractPDEntry from AbstractPDEntry from AbstractPDEntryConstructorsAppPDEntry(NcsMain, String, NcsComponentData)public AppPDEntry(    com.tailf.ncs.NcsMain main,    String name,    com.tailf.ncs.ctrl.NcsComponentData component)Types: , Metadata Constructor for application component**Parameters**`com.tailf.ncs.NcsMain mainString namecom.tailf.ncs.ctrl.NcsComponentData component`MethodsexecuteInstances()public void executeInstances()Start all application componentsfinishInstances()public void finishInstances()Stop and clear all application componentsgetApplicationThreads()public java.util.Map\<com.tailf.ncs.ApplicationComponent,com.tailf.ncs.ctrl.ApplicationLifeCycle> getApplicationThreads()Types: , Get all started application component threads**Returns:** MapApplicationComponent, Thread> map of all threadsgetName()public String getName()Get component name**Returns:** String component nameinitInstances()public void initInstances() throws ExceptionInitialize all application componentstoString()public String toString()](AbstractPDEntry.md#m-load-0a08bc3b9064)
