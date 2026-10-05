# ServicePDEntry <a href="#cls-ServicePDEntry" id="cls-ServicePDEntry"></a>

```java
public class com.tailf.ncs.ctrl.ServicePDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

Service Component metadata

## Members

**Constructors**:

- [ServicePDEntry(NcsMain, String, String, NcsComponentData)](#m-ServicePDEntry-cebf1ec60659)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addReplacement-afd0844ae705) from AbstractPDEntry
- [getCase()](#m-getCase-3adb4a906dd8)
- [getCaseName()](#m-getCaseName-430d6c383b25)
- [getComponent()](AbstractPDEntry.md#m-getComponent-f0c33077e458) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#m-getFSM-b0d67a77e6e5) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#m-getInstances-1d7ff49c0f24) from AbstractPDEntry
- [getServiceName()](#m-getServiceName-a052a1088136)
- [isRunning()](AbstractPDEntry.md#m-isRunning-02db4ec84a8d) from AbstractPDEntry
- [load(List<Object>)](AbstractPDEntry.md#m-load-0a08bc3b9064) from AbstractPDEntry
- [reload()](AbstractPDEntry.md#m-reload-b0cf67aa2f64) from AbstractPDEntry
- [toString()](#m-toString-e9d48c5503ef)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#m-unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

### ServicePDEntry(NcsMain, String, String, NcsComponentData) <a href="#m-ServicePDEntry-cebf1ec60659" id="m-ServicePDEntry-cebf1ec60659"></a>

```java
public ServicePDEntry(
    com.tailf.ncs.NcsMain main,
    String serviceName,
    String serviceCase,
    com.tailf.ncs.ctrl.NcsComponentData component
)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain), [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Metadata Constructor for application component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String serviceName`
- `String serviceCase`
- `com.tailf.ncs.ctrl.NcsComponentData component`


## Methods

### getCase() <a href="#m-getCase-3adb4a906dd8" id="m-getCase-3adb4a906dd8"></a>

```java
public long getCase()
```

### getCaseName() <a href="#m-getCaseName-430d6c383b25" id="m-getCaseName-430d6c383b25"></a>

```java
public String getCaseName()
```

### getServiceName() <a href="#m-getServiceName-a052a1088136" id="m-getServiceName-a052a1088136"></a>

```java
public String getServiceName()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
