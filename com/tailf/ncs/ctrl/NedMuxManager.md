# NedMuxManager <a href="#cls-NedMuxManager" id="cls-NedMuxManager"></a>

```java
public class com.tailf.ncs.ctrl.NedMuxManager
    extends com.tailf.ncs.ctrl.MuxManager
```

Types: [MuxManager](MuxManager.md#cls-MuxManager)

Manager for Ned components

## Members

**Constructors**:

- [NedMuxManager(NcsMain)](#m-NedMuxManager-bf00c2f19d8f)

**Methods**:

- [addToDeployException(NcsCtrlException, String, Throwable)](MuxManager.md#m-addToDeployException-90e2cb8f32b2) from MuxManager
- [doneLoadingEvent()](#m-doneLoadingEvent-b85c1c01738a)
- [finish()](#m-finish-8c785ae2e6bb)
- [getNewNeds()](#m-getNewNeds-1ea8feed407d)
- [getPDEntry(String)](#m-getPDEntry-342c37e0891e)
- [initMux()](#m-initMux-0da83a337e4c)
- [instantiateComponentAction(String, String, Object)](#m-instantiateComponentAction-9e067ecafe91)
- [instantiateComponentEvent(NcsComponentData)](#m-instantiateComponentEvent-9050503646b9)
- [listOpenConnections()](#m-listOpenConnections-28eee6f299b2)
- [listPackageComponents()](#m-listPackageComponents-23eafc7a674c)
- [loadPackageEvent(NcsComponentData)](#m-loadPackageEvent-4650a75a851a)
- [numberOfCachedMountIdPaths()](#m-numberOfCachedMountIdPaths-b7e5d13d5dcf)
- [startMux()](#m-startMux-b821d879ccff)
- [stopNedMux()](#m-stopNedMux-84005222c0d3)
- [unloadPackageEvent(NcsComponentData)](#m-unloadPackageEvent-f14422e73a47)

## Constructors

### NedMuxManager(NcsMain) <a href="#m-NedMuxManager-bf00c2f19d8f" id="m-NedMuxManager-bf00c2f19d8f"></a>

```java
public NedMuxManager(com.tailf.ncs.NcsMain main)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain)

**Parameters**

- `com.tailf.ncs.NcsMain main`


## Methods

### doneLoadingEvent() <a href="#m-doneLoadingEvent-b85c1c01738a" id="m-doneLoadingEvent-b85c1c01738a"></a>

```java
public void doneLoadingEvent() throws Exception
```

### finish() <a href="#m-finish-8c785ae2e6bb" id="m-finish-8c785ae2e6bb"></a>

```java
public void finish()
```

### getNewNeds() <a href="#m-getNewNeds-1ea8feed407d" id="m-getNewNeds-1ea8feed407d"></a>

```java
public com.tailf.proto.ConfEList getNewNeds() throws Exception
```

Types: [ConfEList](../../proto/ConfEList.md#cls-ConfEList)

### getPDEntry(String) <a href="#m-getPDEntry-342c37e0891e" id="m-getPDEntry-342c37e0891e"></a>

```java
public com.tailf.ncs.ctrl.NedPDEntry getPDEntry(String uniqueName)
```

Types: [NedPDEntry](NedPDEntry.md#cls-NedPDEntry)

**Parameters**

- `String uniqueName`

### initMux() <a href="#m-initMux-0da83a337e4c" id="m-initMux-0da83a337e4c"></a>

```java
public void initMux()
```

Initialize the NedMux

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
 JVM-Launcher thread will call this from
 NcsMain.instantiateComponentEvent ( )

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

### listOpenConnections() <a href="#m-listOpenConnections-28eee6f299b2" id="m-listOpenConnections-28eee6f299b2"></a>

```java
public String[] listOpenConnections()
```

### listPackageComponents() <a href="#m-listPackageComponents-23eafc7a674c" id="m-listPackageComponents-23eafc7a674c"></a>

```java
public String[] listPackageComponents()
```

### loadPackageEvent(NcsComponentData) <a href="#m-loadPackageEvent-4650a75a851a" id="m-loadPackageEvent-4650a75a851a"></a>

```java
public void loadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Handling loadPackage events called by JVM-Launcher thread
 from NcsMailn.loadPackage () and redeployPackageCollection()
 thus the method should diffirentiate between a
 initial load of a component ant a reload ( java redeploy )
 this is done by checking the nedMap for existence.

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data` - The component data to be loaded.

### numberOfCachedMountIdPaths() <a href="#m-numberOfCachedMountIdPaths-b7e5d13d5dcf" id="m-numberOfCachedMountIdPaths-b7e5d13d5dcf"></a>

```java
public int numberOfCachedMountIdPaths()
```

### startMux() <a href="#m-startMux-b821d879ccff" id="m-startMux-b821d879ccff"></a>

```java
public void startMux()
```

Start the NedMux

### stopNedMux() <a href="#m-stopNedMux-84005222c0d3" id="m-stopNedMux-84005222c0d3"></a>

```java
public void stopNedMux()
```

Stop the NedMux

### unloadPackageEvent(NcsComponentData) <a href="#m-unloadPackageEvent-f14422e73a47" id="m-unloadPackageEvent-f14422e73a47"></a>

```java
public void unloadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Handling unloadPackage events received by the NcsMain FSM and relays to
 the relevant component FSMs

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`
