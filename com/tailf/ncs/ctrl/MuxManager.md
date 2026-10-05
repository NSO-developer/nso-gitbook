<a id="s-MuxManager"></a>
# MuxManager

```java
public abstract class com.tailf.ncs.ctrl.MuxManager
```

Base class for Component Managers

**Related classes**

- [ApplicationMuxManager](ApplicationMuxManager.md#s-ApplicationMuxManager)
- [DpMuxManager](DpMuxManager.md#s-DpMuxManager)
- [NedMuxManager](NedMuxManager.md#s-NedMuxManager)

## Members

**Constructors**:

- [MuxManager(String)](#s-MuxManager-1)

**Methods**:

- [addToDeployException(NcsCtrlException, String, Throwable)](#s-addToDeployException)
- [doneLoadingEvent()](#s-doneLoadingEvent)
- [instantiateComponentEvent(NcsComponentData)](#s-instantiateComponentEvent)
- [loadPackageEvent(NcsComponentData)](#s-loadPackageEvent)
- [unloadPackageEvent(NcsComponentData)](#s-unloadPackageEvent)

## Constructors

<a id="s-MuxManager-1"></a>
### MuxManager(String)

```java
public MuxManager(String muxManagerName)
```

**Parameters**

- `String muxManagerName`


## Methods

<a id="s-addToDeployException"></a>
### addToDeployException(NcsCtrlException, String, Throwable)

```java
public static com.tailf.ncs.ctrl.NcsCtrlException addToDeployException(
    com.tailf.ncs.ctrl.NcsCtrlException ncsEx,
    String message,
    Throwable ex
)
```

Types: [NcsCtrlException](NcsCtrlException.md#s-NcsCtrlException)

Convenience method for adding Exception causes in the
 additive NcsCtrlException class

**Parameters**

- `com.tailf.ncs.ctrl.NcsCtrlException ncsEx` - NcsCtrlException to add cause in. If null a new
              NcsCtrlException is created
- `String message` - to be set in the new exception
- `Throwable ex` - the Exception to add as cause

**Returns:** NcsCtrlException the modified NcsCtrlException

<a id="s-doneLoadingEvent"></a>
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

<a id="s-instantiateComponentEvent"></a>
### instantiateComponentEvent(NcsComponentData)

```java
public abstract void instantiateComponentEvent(
    com.tailf.ncs.ctrl.NcsComponentData data
)
    throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Method that should handle instantiateComponent events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

**Throws**

- `Exception`

<a id="s-loadPackageEvent"></a>
### loadPackageEvent(NcsComponentData)

```java
public abstract void loadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Method that should handle loadPackage events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

**Throws**

- `Exception`

<a id="s-unloadPackageEvent"></a>
### unloadPackageEvent(NcsComponentData)

```java
public abstract void unloadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Method that should handle unloadPackage events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

**Throws**

- `Exception`
