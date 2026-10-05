# NedMuxManager <a href="#nedmuxmanager-2d9fb7e9f093" id="nedmuxmanager-2d9fb7e9f093"></a>

```java
public class com.tailf.ncs.ctrl.NedMuxManager
    extends com.tailf.ncs.ctrl.MuxManager
```

Types: [MuxManager](MuxManager.md#muxmanager-aab4b7a029ee)

Manager for Ned components

## Members

**Constructors**:

- [NedMuxManager(NcsMain)](#nedmuxmanager-bf00c2f19d8f)

**Methods**:

- [addToDeployException(NcsCtrlException, String, Throwable)](MuxManager.md#addtodeployexception-90e2cb8f32b2) from MuxManager
- [doneLoadingEvent()](#doneloadingevent-b85c1c01738a)
- [finish()](#finish-8c785ae2e6bb)
- [getNewNeds()](#getnewneds-1ea8feed407d)
- [getPDEntry(String)](#getpdentry-342c37e0891e)
- [initMux()](#initmux-0da83a337e4c)
- [instantiateComponentAction(String, String, Object)](#instantiatecomponentaction-9e067ecafe91)
- [instantiateComponentEvent(NcsComponentData)](#instantiatecomponentevent-9050503646b9)
- [listOpenConnections()](#listopenconnections-28eee6f299b2)
- [listPackageComponents()](#listpackagecomponents-23eafc7a674c)
- [loadPackageEvent(NcsComponentData)](#loadpackageevent-4650a75a851a)
- [numberOfCachedMountIdPaths()](#numberofcachedmountidpaths-b7e5d13d5dcf)
- [startMux()](#startmux-b821d879ccff)
- [stopNedMux()](#stopnedmux-84005222c0d3)
- [unloadPackageEvent(NcsComponentData)](#unloadpackageevent-f14422e73a47)

## Constructors

### NedMuxManager(NcsMain) <a href="#nedmuxmanager-bf00c2f19d8f" id="nedmuxmanager-bf00c2f19d8f"></a>

```java
public NedMuxManager(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](../NcsMain.md#ncsmain-eb814813aed4)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

### doneLoadingEvent() <a href="#doneloadingevent-b85c1c01738a" id="doneloadingevent-b85c1c01738a"></a>

```java
public void doneLoadingEvent() throws Exception
```

### finish() <a href="#finish-8c785ae2e6bb" id="finish-8c785ae2e6bb"></a>

```java
public void finish()
```

### getNewNeds() <a href="#getnewneds-1ea8feed407d" id="getnewneds-1ea8feed407d"></a>

```java
public com.tailf.proto.ConfEList getNewNeds() throws Exception
```

Types: [ConfEList](../../proto/ConfEList.md#confelist-78fa4ba3b3a8)

### getPDEntry(String) <a href="#getpdentry-342c37e0891e" id="getpdentry-342c37e0891e"></a>

```java
public com.tailf.ncs.ctrl.NedPDEntry getPDEntry(String uniqueName)
```

Types: [NedPDEntry](NedPDEntry.md#nedpdentry-af34e0aea42b)

**Parameters**

- `String uniqueName`

### initMux() <a href="#initmux-0da83a337e4c" id="initmux-0da83a337e4c"></a>

```java
public void initMux()
```

Initialize the NedMux

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
 JVM-Launcher thread will call this from
 NcsMain.instantiateComponentEvent ( )

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

### listOpenConnections() <a href="#listopenconnections-28eee6f299b2" id="listopenconnections-28eee6f299b2"></a>

```java
public String[] listOpenConnections()
```

### listPackageComponents() <a href="#listpackagecomponents-23eafc7a674c" id="listpackagecomponents-23eafc7a674c"></a>

```java
public String[] listPackageComponents()
```

### loadPackageEvent(NcsComponentData) <a href="#loadpackageevent-4650a75a851a" id="loadpackageevent-4650a75a851a"></a>

```java
public void loadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Handling loadPackage events called by JVM-Launcher thread
 from NcsMailn.loadPackage () and redeployPackageCollection()
 thus the method should diffirentiate between a
 initial load of a component ant a reload ( java redeploy )
 this is done by checking the nedMap for existence.

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data` - The component data to be loaded.

### numberOfCachedMountIdPaths() <a href="#numberofcachedmountidpaths-b7e5d13d5dcf" id="numberofcachedmountidpaths-b7e5d13d5dcf"></a>

```java
public int numberOfCachedMountIdPaths()
```

### startMux() <a href="#startmux-b821d879ccff" id="startmux-b821d879ccff"></a>

```java
public void startMux()
```

Start the NedMux

### stopNedMux() <a href="#stopnedmux-84005222c0d3" id="stopnedmux-84005222c0d3"></a>

```java
public void stopNedMux()
```

Stop the NedMux

### unloadPackageEvent(NcsComponentData) <a href="#unloadpackageevent-f14422e73a47" id="unloadpackageevent-f14422e73a47"></a>

```java
public void unloadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Handling unloadPackage events received by the NcsMain FSM and relays to
 the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`
