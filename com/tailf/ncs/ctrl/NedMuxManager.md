<a id="cls-NedMuxManager"></a>
# NedMuxManager

```java
public class com.tailf.ncs.ctrl.NedMuxManager
    extends com.tailf.ncs.ctrl.MuxManager
```

Types: [MuxManager](MuxManager.md#cls-MuxManager)

Manager for Ned components

## Members

**Constructors**:

- [NedMuxManager(NcsMain)](#m-nedmuxmanager-bf00c2f19d8f)

**Methods**:

- [addToDeployException(NcsCtrlException, String, Throwable)](MuxManager.md#m-addtodeployexception-90e2cb8f32b2) from MuxManager
- [doneLoadingEvent()](#m-doneloadingevent-b85c1c01738a)
- [finish()](#m-finish-8c785ae2e6bb)
- [getNewNeds()](#m-getnewneds-1ea8feed407d)
- [getPDEntry(String)](#m-getpdentry-342c37e0891e)
- [initMux()](#m-initmux-0da83a337e4c)
- [instantiateComponentAction(String, String, Object)](#m-instantiatecomponentaction-9e067ecafe91)
- [instantiateComponentEvent(NcsComponentData)](#m-instantiatecomponentevent-9050503646b9)
- [listOpenConnections()](#m-listopenconnections-28eee6f299b2)
- [listPackageComponents()](#m-listpackagecomponents-23eafc7a674c)
- [loadPackageEvent(NcsComponentData)](#m-loadpackageevent-4650a75a851a)
- [numberOfCachedMountIdPaths()](#m-numberofcachedmountidpaths-b7e5d13d5dcf)
- [startMux()](#m-startmux-b821d879ccff)
- [stopNedMux()](#m-stopnedmux-84005222c0d3)
- [unloadPackageEvent(NcsComponentData)](#m-unloadpackageevent-f14422e73a47)

## Constructors

<a id="m-nedmuxmanager-bf00c2f19d8f"></a>
### NedMuxManager(NcsMain)

```java
public NedMuxManager(com.tailf.ncs.NcsMain main)
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

<a id="m-finish-8c785ae2e6bb"></a>
### finish()

```java
public void finish()
```

<a id="m-getnewneds-1ea8feed407d"></a>
### getNewNeds()

```java
public com.tailf.proto.ConfEList getNewNeds() throws Exception
```

Types: [ConfEList](../../proto/ConfEList.md#cls-ConfEList)

<a id="m-getpdentry-342c37e0891e"></a>
### getPDEntry(String)

```java
public com.tailf.ncs.ctrl.NedPDEntry getPDEntry(String uniqueName)
```

Types: [NedPDEntry](NedPDEntry.md#cls-NedPDEntry)

**Parameters**

- `String uniqueName`

<a id="m-initmux-0da83a337e4c"></a>
### initMux()

```java
public void initMux()
```

Initialize the NedMux

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
 JVM-Launcher thread will call this from
 NcsMain.instantiateComponentEvent ( )

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

<a id="m-listopenconnections-28eee6f299b2"></a>
### listOpenConnections()

```java
public String[] listOpenConnections()
```

<a id="m-listpackagecomponents-23eafc7a674c"></a>
### listPackageComponents()

```java
public String[] listPackageComponents()
```

<a id="m-loadpackageevent-4650a75a851a"></a>
### loadPackageEvent(NcsComponentData)

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

<a id="m-numberofcachedmountidpaths-b7e5d13d5dcf"></a>
### numberOfCachedMountIdPaths()

```java
public int numberOfCachedMountIdPaths()
```

<a id="m-startmux-b821d879ccff"></a>
### startMux()

```java
public void startMux()
```

Start the NedMux

<a id="m-stopnedmux-84005222c0d3"></a>
### stopNedMux()

```java
public void stopNedMux()
```

Stop the NedMux

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
