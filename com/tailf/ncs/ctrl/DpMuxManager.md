# DpMuxManager <a href="#dpmuxmanager-a830918ce722" id="dpmuxmanager-a830918ce722"></a>

```java
public class com.tailf.ncs.ctrl.DpMuxManager
    extends com.tailf.ncs.ctrl.MuxManager
```

Types: [MuxManager](MuxManager.md#muxmanager-aab4b7a029ee)

Manager for callback components

## Members

**Constructors**:

- [DpMuxManager\(NcsMain\)](#dpmuxmanager-b39489c68b51)

**Methods**:

- [addToDeployException\(NcsCtrlException, String, Throwable\)](MuxManager.md#addtodeployexception-90e2cb8f32b2) from MuxManager
- [doneLoadingEvent\(\)](#doneloadingevent-b85c1c01738a)
- [finish\(\)](#finish-8c785ae2e6bb)
- [getPDEntry\(String\)](#getpdentry-342c37e0891e)
- [instantiateComponentAction\(String, String, Object\)](#instantiatecomponentaction-9e067ecafe91)
- [instantiateComponentEvent\(NcsComponentData\)](#instantiatecomponentevent-9050503646b9)
- [loadPackageEvent\(NcsComponentData\)](#loadpackageevent-4650a75a851a)
- [unloadPackageEvent\(NcsComponentData\)](#unloadpackageevent-f14422e73a47)

## Constructors

### DpMuxManager(NcsMain) <a href="#dpmuxmanager-b39489c68b51" id="dpmuxmanager-b39489c68b51"></a>

```java
public DpMuxManager(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](../NcsMain.md#ncsmain-eb814813aed4)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

### doneLoadingEvent() <a href="#doneloadingevent-b85c1c01738a" id="doneloadingevent-b85c1c01738a"></a>

```java
public void doneLoadingEvent() throws Exception
```

Handling doneLoading events received by the NcsMain FSM

### finish() <a href="#finish-8c785ae2e6bb" id="finish-8c785ae2e6bb"></a>

```java
public void finish()
```

Stop and cleanup all components of this type

### getPDEntry(String) <a href="#getpdentry-342c37e0891e" id="getpdentry-342c37e0891e"></a>

```java
public com.tailf.ncs.ctrl.DpPDEntry getPDEntry(String uniqueName)
```

Types: [DpPDEntry](DpPDEntry.md#dppdentry-3d7fc55c80fc)

Get component for name "package_name:component_name"

**Parameters**

- `String uniqueName`

**Returns:** DpPDEntry metadata for this component

### instantiateComponentAction(String, String, Object) <a href="#instantiatecomponentaction-9e067ecafe91" id="instantiatecomponentaction-9e067ecafe91"></a>

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

### instantiateComponentEvent(NcsComponentData) <a href="#instantiatecomponentevent-9050503646b9" id="instantiatecomponentevent-9050503646b9"></a>

```java
public void instantiateComponentEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Handling instantiateComponent events received by the NcsMain FSM and
 relays to the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

### loadPackageEvent(NcsComponentData) <a href="#loadpackageevent-4650a75a851a" id="loadpackageevent-4650a75a851a"></a>

```java
public void loadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Handling loadPackage events received by the NcsMain FSM and relays to
 the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

### unloadPackageEvent(NcsComponentData) <a href="#unloadpackageevent-f14422e73a47" id="unloadpackageevent-f14422e73a47"></a>

```java
public void unloadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Handling unloadPackage events received by the NcsMain FSM and relays to
 the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`
