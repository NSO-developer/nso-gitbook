<a id="cls-MuxManager"></a>
# MuxManager

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

- [MuxManager(String)](#m-muxmanager-4f412e8b0cf6)

**Methods**:

- [addToDeployException(NcsCtrlException, String, Throwable)](#m-addtodeployexception-90e2cb8f32b2)
- [doneLoadingEvent()](#m-doneloadingevent-b85c1c01738a)
- [instantiateComponentEvent(NcsComponentData)](#m-instantiatecomponentevent-9050503646b9)
- [loadPackageEvent(NcsComponentData)](#m-loadpackageevent-4650a75a851a)
- [unloadPackageEvent(NcsComponentData)](#m-unloadpackageevent-f14422e73a47)

## Constructors

<a id="m-muxmanager-4f412e8b0cf6"></a>
### MuxManager(String)

```java
public MuxManager(String muxManagerName)
```

**Parameters**

- `String muxManagerName`


## Methods

<a id="m-addtodeployexception-90e2cb8f32b2"></a>
### addToDeployException(NcsCtrlException, String, Throwable)

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

<a id="m-doneloadingevent-b85c1c01738a"></a>
### doneLoadingEvent()

```java
public abstract void doneLoadingEvent() throws Exception
```

Method that should handle doneLoading events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Throws**

- `Exception`

<a id="m-instantiatecomponentevent-9050503646b9"></a>
### instantiateComponentEvent(NcsComponentData)

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

<a id="m-loadpackageevent-4650a75a851a"></a>
### loadPackageEvent(NcsComponentData)

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

<a id="m-unloadpackageevent-f14422e73a47"></a>
### unloadPackageEvent(NcsComponentData)

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
