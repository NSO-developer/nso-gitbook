# MuxManager <a href="#muxmanager-aab4b7a029ee" id="muxmanager-aab4b7a029ee"></a>

```java
public abstract class com.tailf.ncs.ctrl.MuxManager
```

Base class for Component Managers

**Related classes**

- [ApplicationMuxManager](ApplicationMuxManager.md#applicationmuxmanager-1cb698beb331)
- [DpMuxManager](DpMuxManager.md#dpmuxmanager-a830918ce722)
- [NedMuxManager](NedMuxManager.md#nedmuxmanager-2d9fb7e9f093)

## Members

**Constructors**:

- [MuxManager\(String\)](#muxmanager-4f412e8b0cf6)

**Methods**:

- [addToDeployException\(NcsCtrlException, String, Throwable\)](#addtodeployexception-90e2cb8f32b2)
- [doneLoadingEvent\(\)](#doneloadingevent-b85c1c01738a)
- [instantiateComponentEvent\(NcsComponentData\)](#instantiatecomponentevent-9050503646b9)
- [loadPackageEvent\(NcsComponentData\)](#loadpackageevent-4650a75a851a)
- [unloadPackageEvent\(NcsComponentData\)](#unloadpackageevent-f14422e73a47)

## Constructors

### MuxManager(String) <a href="#muxmanager-4f412e8b0cf6" id="muxmanager-4f412e8b0cf6"></a>

```java
public MuxManager(String muxManagerName)
```

**Parameters**

- `String muxManagerName`


## Methods

### addToDeployException(NcsCtrlException, String, Throwable) <a href="#addtodeployexception-90e2cb8f32b2" id="addtodeployexception-90e2cb8f32b2"></a>

```java
public static com.tailf.ncs.ctrl.NcsCtrlException addToDeployException(
    com.tailf.ncs.ctrl.NcsCtrlException ncsEx,
    String message,
    Throwable ex
)
```

Types: [NcsCtrlException](NcsCtrlException.md#ncsctrlexception-5ca72987a4d7)

Convenience method for adding Exception causes in the
 additive NcsCtrlException class

**Parameters**

- `com.tailf.ncs.ctrl.NcsCtrlException ncsEx` - NcsCtrlException to add cause in. If null a new
              NcsCtrlException is created
- `String message` - to be set in the new exception
- `Throwable ex` - the Exception to add as cause

**Returns:** NcsCtrlException the modified NcsCtrlException

### doneLoadingEvent() <a href="#doneloadingevent-b85c1c01738a" id="doneloadingevent-b85c1c01738a"></a>

```java
public abstract void doneLoadingEvent() throws Exception
```

Method that should handle doneLoading events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Throws**

- `Exception`

### instantiateComponentEvent(NcsComponentData) <a href="#instantiatecomponentevent-9050503646b9" id="instantiatecomponentevent-9050503646b9"></a>

```java
public abstract void instantiateComponentEvent(
    com.tailf.ncs.ctrl.NcsComponentData data
)
    throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Method that should handle instantiateComponent events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

**Throws**

- `Exception`

### loadPackageEvent(NcsComponentData) <a href="#loadpackageevent-4650a75a851a" id="loadpackageevent-4650a75a851a"></a>

```java
public abstract void loadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Method that should handle loadPackage events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

**Throws**

- `Exception`

### unloadPackageEvent(NcsComponentData) <a href="#unloadpackageevent-f14422e73a47" id="unloadpackageevent-f14422e73a47"></a>

```java
public abstract void unloadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Method that should handle unloadPackage events received by
 the NcsMain FSM.
 The subclassed component manager is responsible to relay
 this as events to corresponding component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

**Throws**

- `Exception`
