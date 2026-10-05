<a id="cls-ServicePDEntry"></a>
# ServicePDEntry

```java
public class com.tailf.ncs.ctrl.ServicePDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

Service Component metadata

## Members

**Constructors**:

- [ServicePDEntry(NcsMain, String, String, NcsComponentData)](#m-servicepdentry-cebf1ec60659)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addreplacement-afd0844ae705) from AbstractPDEntry
- [getCase()](#m-getcase-3adb4a906dd8)
- [getCaseName()](#m-getcasename-430d6c383b25)
- [getComponent()](AbstractPDEntry.md#m-getcomponent-f0c33077e458) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#m-getfsm-b0d67a77e6e5) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#m-getinstances-1d7ff49c0f24) from AbstractPDEntry
- [getServiceName()](#m-getservicename-a052a1088136)
- [isRunning()](AbstractPDEntry.md#m-isrunning-02db4ec84a8d) from AbstractPDEntry
- [load(List<Object>)](AbstractPDEntry.md#m-load-0a08bc3b9064) from AbstractPDEntry
- [reload()](AbstractPDEntry.md#m-reload-b0cf67aa2f64) from AbstractPDEntry
- [toString()](#m-tostring-e9d48c5503ef)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#m-unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

<a id="m-servicepdentry-cebf1ec60659"></a>
### ServicePDEntry(NcsMain, String, String, NcsComponentData)

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

<a id="m-getcase-3adb4a906dd8"></a>
### getCase()

```java
public long getCase()
```

<a id="m-getcasename-430d6c383b25"></a>
### getCaseName()

```java
public String getCaseName()
```

<a id="m-getservicename-a052a1088136"></a>
### getServiceName()

```java
public String getServiceName()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
