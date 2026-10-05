<a id="cls-ApplicationMuxManager"></a>
# ApplicationMuxManager

```java
public class com.tailf.ncs.ctrl.ApplicationMuxManager
    extends com.tailf.ncs.ctrl.MuxManager
```

Types: [MuxManager](MuxManager.md#cls-MuxManager)

Manager for Application components

## Members

**Constructors**:

- [ApplicationMuxManager(NcsMain)](#m-applicationmuxmanager-a0e66f3399bd)

**Methods**:

- [addToDeployException(NcsCtrlException, String, Throwable)](MuxManager.md#m-addtodeployexception-90e2cb8f32b2) from MuxManager
- [doneLoadingEvent()](#m-doneloadingevent-b85c1c01738a)
- [finish()](#m-finish-8c785ae2e6bb)
- [getPDEntry(String)](#m-getpdentry-342c37e0891e)
- [instantiateComponentAction(String, String, Object)](#m-instantiatecomponentaction-9e067ecafe91)
- [instantiateComponentEvent(NcsComponentData)](#m-instantiatecomponentevent-9050503646b9)
- [loadPackageEvent(NcsComponentData)](#m-loadpackageevent-4650a75a851a)
- [unloadPackageEvent(NcsComponentData)](#m-unloadpackageevent-f14422e73a47)

## Constructors

<a id="m-applicationmuxmanager-a0e66f3399bd"></a>
### ApplicationMuxManager(NcsMain)

```java
public ApplicationMuxManager(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

<a id="m-doneloadingevent-b85c1c01738a"></a>
### doneLoadingEvent()

```java
public void doneLoadingEvent() throws Exception
```

Handling doneLoading events received by the NcsMain FSM

<a id="m-finish-8c785ae2e6bb"></a>
### finish()

```java
public void finish()
```

Stop and cleanup all components of this type

<a id="m-getpdentry-342c37e0891e"></a>
### getPDEntry(String)

```java
public com.tailf.ncs.ctrl.AppPDEntry getPDEntry(String uniqueName)
```

Types: [AppPDEntry](AppPDEntry.md#cls-AppPDEntry)

Get component for name "package_name:component_name"

**Parameters**

- `String uniqueName`

**Returns:** AppPDEntry metadata for this component

<a id="m-instantiatecomponentaction-9e067ecafe91"></a>
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

<a id="m-instantiatecomponentevent-9050503646b9"></a>
### instantiateComponentEvent(NcsComponentData)

```java
public void instantiateComponentEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Handling instantiateComponent events received by the NcsMain FSM and
 relays to the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

<a id="m-loadpackageevent-4650a75a851a"></a>
### loadPackageEvent(NcsComponentData)

```java
public void loadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Handling loadPackage events received by the NcsMain FSM and relays to
 the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

<a id="m-unloadpackageevent-f14422e73a47"></a>
### unloadPackageEvent(NcsComponentData)

```java
public void unloadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Handling unloadPackage events received by the NcsMain FSM and relays to
 the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`
