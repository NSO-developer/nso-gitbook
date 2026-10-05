<a id="s-NedMuxManager"></a>
# NedMuxManager

```java
public class com.tailf.ncs.ctrl.NedMuxManager
    extends com.tailf.ncs.ctrl.MuxManager
```

Types: [MuxManager](MuxManager.md#s-MuxManager)

Manager for Ned components

## Members

**Constructors**:

- [NedMuxManager(NcsMain)](#s-NedMuxManager-1)

**Methods**:

- [addToDeployException(NcsCtrlException, String, Throwable)](MuxManager.md#s-addToDeployException) from MuxManager
- [doneLoadingEvent()](#s-doneLoadingEvent)
- [finish()](#s-finish)
- [getNewNeds()](#s-getNewNeds)
- [getPDEntry(String)](#s-getPDEntry)
- [initMux()](#s-initMux)
- [instantiateComponentAction(String, String, Object)](#s-instantiateComponentAction)
- [instantiateComponentEvent(NcsComponentData)](#s-instantiateComponentEvent)
- [listOpenConnections()](#s-listOpenConnections)
- [listPackageComponents()](#s-listPackageComponents)
- [loadPackageEvent(NcsComponentData)](#s-loadPackageEvent)
- [numberOfCachedMountIdPaths()](#s-numberOfCachedMountIdPaths)
- [startMux()](#s-startMux)
- [stopNedMux()](#s-stopNedMux)
- [unloadPackageEvent(NcsComponentData)](#s-unloadPackageEvent)

## Constructors

<a id="s-NedMuxManager-1"></a>
### NedMuxManager(NcsMain)

```java
public NedMuxManager(com.tailf.ncs.NcsMain main)
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

<a id="s-finish"></a>
### finish()

```java
public void finish()
```

<a id="s-getNewNeds"></a>
### getNewNeds()

```java
public com.tailf.proto.ConfEList getNewNeds() throws Exception
```

Types: [ConfEList](../../proto/ConfEList.md#s-ConfEList)

<a id="s-getPDEntry"></a>
### getPDEntry(String)

```java
public com.tailf.ncs.ctrl.NedPDEntry getPDEntry(String uniqueName)
```

Types: [NedPDEntry](NedPDEntry.md#s-NedPDEntry)

**Parameters**

- `String uniqueName`

<a id="s-initMux"></a>
### initMux()

```java
public void initMux()
```

Initialize the NedMux

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
 JVM-Launcher thread will call this from
 NcsMain.instantiateComponentEvent ( )

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data`

<a id="s-listOpenConnections"></a>
### listOpenConnections()

```java
public String[] listOpenConnections()
```

<a id="s-listPackageComponents"></a>
### listPackageComponents()

```java
public String[] listPackageComponents()
```

<a id="s-loadPackageEvent"></a>
### loadPackageEvent(NcsComponentData)

```java
public void loadPackageEvent(com.tailf.ncs.ctrl.NcsComponentData data) throws Exception
```

Types: [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Handling loadPackage events called by JVM-Launcher thread
 from NcsMailn.loadPackage () and redeployPackageCollection()
 thus the method should diffirentiate between a
 initial load of a component ant a reload ( java redeploy )
 this is done by checking the nedMap for existence.

**Parameters**

- `com.tailf.ncs.ctrl.NcsComponentData data` - The component data to be loaded.

<a id="s-numberOfCachedMountIdPaths"></a>
### numberOfCachedMountIdPaths()

```java
public int numberOfCachedMountIdPaths()
```

<a id="s-startMux"></a>
### startMux()

```java
public void startMux()
```

Start the NedMux

<a id="s-stopNedMux"></a>
### stopNedMux()

```java
public void stopNedMux()
```

Stop the NedMux

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
