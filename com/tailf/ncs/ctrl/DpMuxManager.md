# DpMuxManager <a href="#cls-DpMuxManager" id="cls-DpMuxManager"></a>

```java
public class com.tailf.ncs.ctrl.DpMuxManager
    extends com.tailf.ncs.ctrl.MuxManager
```

Types: [MuxManager](MuxManager.md#cls-MuxManager)

Manager for callback components

## Members

**Constructors**:

- [DpMuxManager(NcsMain)](#m-DpMuxManager-b39489c68b51)

**Methods**:

- [addToDeployException(NcsCtrlException, String, Throwable)](MuxManager.md#m-addToDeployException-90e2cb8f32b2) from MuxManager
- [doneLoadingEvent()](#m-doneLoadingEvent-b85c1c01738a)
- [finish()](#m-finish-8c785ae2e6bb)
- [getPDEntry(String)](#m-getPDEntry-342c37e0891e)
- [instantiateComponentAction(String, String, Object)](#m-instantiateComponentAction-9e067ecafe91)
- [instantiateComponentEvent(NcsComponentData)](#m-instantiateComponentEvent-9050503646b9)
- [loadPackageEvent(NcsComponentData)](#m-loadPackageEvent-4650a75a851a)
- [unloadPackageEvent(NcsComponentData)](#m-unloadPackageEvent-f14422e73a47)

## Constructors

### DpMuxManager(NcsMain) <a href="#m-DpMuxManager-b39489c68b51" id="m-DpMuxManager-b39489c68b51"></a>

```java
public DpMuxManager(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

### doneLoadingEvent() <a href="#m-doneLoadingEvent-b85c1c01738a" id="m-doneLoadingEvent-b85c1c01738a"></a>

```java
public void doneLoadingEvent() throws Exception
```

Handling doneLoading events received by the NcsMain FSM

### finish() <a href="#m-finish-8c785ae2e6bb" id="m-finish-8c785ae2e6bb"></a>

```java
public void finish()
```

Stop and cleanup all components of this type

### getPDEntry(String) <a href="#m-getPDEntry-342c37e0891e" id="m-getPDEntry-342c37e0891e"></a>

```java
public com.tailf.ncs.ctrl.DpPDEntry getPDEntry(String uniqueName)
```

Types: [DpPDEntry](DpPDEntry.md#cls-DpPDEntry)

Get component for name "package_name:component_name"

**Parameters**

- `String uniqueName`

**Returns:** DpPDEntry metadata for this component

### instantiateComponentAction(String, String, Object) <a href="#m-instantiateComponentAction-9e067ecafe91" id="m-instantiateComponentAction-9e067ecafe91"></a>

```java
public void instantiateComponentAction(
    String currentState,
    String newState,
    Object opaque
)
    throws Exception
```

Handles instantiateComponent events received by the
 Component FSM.

**Parameters**

- `String currentState`
- `String newState`
- `Object opaque`

**Throws**

- `Exception`

### instantiateComponentEvent(NcsComponentData) <a href="#m-instantiateComponentEvent-9050503646b9" id="m-instantiateComponentEvent-9050503646b9"></a>

```java
public void instantiateComponentEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Handling instantiateComponent events received by the NcsMain FSM and
 relays to the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

### loadPackageEvent(NcsComponentData) <a href="#m-loadPackageEvent-4650a75a851a" id="m-loadPackageEvent-4650a75a851a"></a>

```java
public void loadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Handling loadPackage events received by the NcsMain FSM and relays to
 the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

### unloadPackageEvent(NcsComponentData) <a href="#m-unloadPackageEvent-f14422e73a47" id="m-unloadPackageEvent-f14422e73a47"></a>

```java
public void unloadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Handling unloadPackage events received by the NcsMain FSM and relays to
 the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`
