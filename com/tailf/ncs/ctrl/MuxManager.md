# MuxManager <a href="#cls-MuxManager" id="cls-MuxManager"></a>

```java
public abstract class com.tailf.ncs.ctrl.MuxManager
```

Base class for Component Managers

**Related classes**

- [ApplicationMuxManager](ApplicationMuxManager.md#cls-ApplicationMuxManager)
- [DpMuxManager](DpMuxManager.md#cls-DpMuxManager)
- [NedMuxManager](NedMuxManager.md#cls-NedMuxManager)

## Members

**Constructors**:

- [MuxManager(String)](#m-MuxManager-4f412e8b0cf6)

**Methods**:

- [addToDeployException(NcsCtrlException, String, Throwable)](#m-addToDeployException-90e2cb8f32b2)
- [doneLoadingEvent()](#m-doneLoadingEvent-b85c1c01738a)
- [instantiateComponentEvent(NcsComponentData)](#m-instantiateComponentEvent-9050503646b9)
- [loadPackageEvent(NcsComponentData)](#m-loadPackageEvent-4650a75a851a)
- [unloadPackageEvent(NcsComponentData)](#m-unloadPackageEvent-f14422e73a47)

## Constructors

### MuxManager(String) <a href="#m-MuxManager-4f412e8b0cf6" id="m-MuxManager-4f412e8b0cf6"></a>

```java
public MuxManager(String muxManagerName)
```

**Parameters**

- `String muxManagerName`


## Methods

### addToDeployException(NcsCtrlException, String, Throwable) <a href="#m-addToDeployException-90e2cb8f32b2" id="m-addToDeployException-90e2cb8f32b2"></a>

```java
public static com.tailf.ncs.ctrl.NcsCtrlException addToDeployException(
    com.tailf.ncs.ctrl.NcsCtrlException ncsEx,
    String message,
    Throwable ex
)
```

Types: [NcsCtrlException](NcsCtrlException.md#cls-NcsCtrlException)

Convenience method for adding Exception causes in the
 additive NcsCtrlException class

**Parameters**

- `com.tailf.ncs.ctrl.NcsCtrlException ncsEx` - NcsCtrlException to add cause in. If null a new
              NcsCtrlException is created
- `String message` - to be set in the new exception
- `Throwable ex` - the Exception to add as cause

**Returns:** NcsCtrlException the modified NcsCtrlException

### doneLoadingEvent() <a href="#m-doneLoadingEvent-b85c1c01738a" id="m-doneLoadingEvent-b85c1c01738a"></a>

```java
public abstract void doneLoadingEvent() throws Exception
```

Method that should handle doneLoading events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Throws**

- `Exception`

### instantiateComponentEvent(NcsComponentData) <a href="#m-instantiateComponentEvent-9050503646b9" id="m-instantiateComponentEvent-9050503646b9"></a>

```java
public abstract void instantiateComponentEvent(
    com.tailf.ncs.ctrl.NcsComponentData data
)
    throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Method that should handle instantiateComponent events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

**Throws**

- `Exception`

### loadPackageEvent(NcsComponentData) <a href="#m-loadPackageEvent-4650a75a851a" id="m-loadPackageEvent-4650a75a851a"></a>

```java
public abstract void loadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Method that should handle loadPackage events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

**Throws**

- `Exception`

### unloadPackageEvent(NcsComponentData) <a href="#m-unloadPackageEvent-f14422e73a47" id="m-unloadPackageEvent-f14422e73a47"></a>

```java
public abstract void unloadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Method that should handle unloadPackage events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

**Throws**

- `Exception`
