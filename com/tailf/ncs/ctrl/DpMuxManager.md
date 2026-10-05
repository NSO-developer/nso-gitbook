<a id="s-DpMuxManager"></a>
# DpMuxManager

```java
public class com.tailf.ncs.ctrl.DpMuxManager
    extends com.tailf.ncs.ctrl.MuxManager
```

Types: [MuxManager](MuxManager.md#s-MuxManager)

Manager for callback components

## Members

**Constructors**:

- [DpMuxManager(NcsMain)](#s-DpMuxManager-1)

**Methods**:

- [addToDeployException(NcsCtrlException, String, Throwable)](MuxManager.md#s-addToDeployException) from MuxManager
- [doneLoadingEvent()](#s-doneLoadingEvent)
- [finish()](#s-finish)
- [getPDEntry(String)](#s-getPDEntry)
- [instantiateComponentAction(String, String, Object)](#s-instantiateComponentAction)
- [instantiateComponentEvent(NcsComponentData)](#s-instantiateComponentEvent)
- [loadPackageEvent(NcsComponentData)](#s-loadPackageEvent)
- [unloadPackageEvent(NcsComponentData)](#s-unloadPackageEvent)

## Constructors

<a id="s-DpMuxManager-1"></a>
### DpMuxManager(NcsMain)

```java
public DpMuxManager(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](../NcsMain.md#s-NcsMain)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

<a id="s-doneLoadingEvent"></a>
### doneLoadingEvent()

```java
public void doneLoadingEvent() throws Exception
```

Handling doneLoading events received by the NcsMain FSM

<a id="s-finish"></a>
### finish()

```java
public void finish()
```

Stop and cleanup all components of this type

<a id="s-getPDEntry"></a>
### getPDEntry(String)

```java
public com.tailf.ncs.ctrl.DpPDEntry getPDEntry(String uniqueName)
```

Types: [DpPDEntry](DpPDEntry.md#s-DpPDEntry)

Get component for name "package_name:component_name"

**Parameters**

- `String uniqueName`

**Returns:** DpPDEntry metadata for this component

<a id="s-instantiateComponentAction"></a>
### instantiateComponentAction(String, String, Object)

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

<a id="s-instantiateComponentEvent"></a>
### instantiateComponentEvent(NcsComponentData)

```java
public void instantiateComponentEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Handling instantiateComponent events received by the NcsMain FSM and
 relays to the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

<a id="s-loadPackageEvent"></a>
### loadPackageEvent(NcsComponentData)

```java
public void loadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Handling loadPackage events received by the NcsMain FSM and relays to
 the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

<a id="s-unloadPackageEvent"></a>
### unloadPackageEvent(NcsComponentData)

```java
public void unloadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Handling unloadPackage events received by the NcsMain FSM and relays to
 the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`
