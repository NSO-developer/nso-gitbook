# ServicePDEntry <a href="#servicepdentry-4f187dfd4f44" id="servicepdentry-4f187dfd4f44"></a>

```java
public class com.tailf.ncs.ctrl.ServicePDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#abstractpdentry-c4b436e626e5)

Service Component metadata

## Members

**Constructors**:

- [ServicePDEntry\(NcsMain, String, String, NcsComponentData\)](#servicepdentry-cebf1ec60659)

**Methods**:

- [addReplacement\(NcsComponentData\)](AbstractPDEntry.md#addreplacement-afd0844ae705) from AbstractPDEntry
- [getCase\(\)](#getcase-3adb4a906dd8)
- [getCaseName\(\)](#getcasename-430d6c383b25)
- [getComponent\(\)](AbstractPDEntry.md#getcomponent-f0c33077e458) from AbstractPDEntry
- [getFSM\(\)](AbstractPDEntry.md#getfsm-b0d67a77e6e5) from AbstractPDEntry
- [getInstances\(\)](AbstractPDEntry.md#getinstances-1d7ff49c0f24) from AbstractPDEntry
- [getServiceName\(\)](#getservicename-a052a1088136)
- [isRunning\(\)](AbstractPDEntry.md#isrunning-02db4ec84a8d) from AbstractPDEntry
- [load\(List\<Object\>\)](AbstractPDEntry.md#load-0a08bc3b9064) from AbstractPDEntry
- [reload\(\)](AbstractPDEntry.md#reload-b0cf67aa2f64) from AbstractPDEntry
- [toString\(\)](#tostring-e9d48c5503ef)
- [unload\(AbstractPDEntry\)](AbstractPDEntry.md#unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

### ServicePDEntry(NcsMain, String, String, NcsComponentData) <a href="#servicepdentry-cebf1ec60659" id="servicepdentry-cebf1ec60659"></a>

```java
public ServicePDEntry(
    com.tailf.ncs.NcsMain main,
    String serviceName,
    String serviceCase,
    com.tailf.ncs.ctrl.NcsComponentData component
)
```

Types: [NcsMain](../NcsMain.md#ncsmain-eb814813aed4), [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Metadata Constructor for application component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String serviceName`
- `String serviceCase`
- `com.tailf.ncs.ctrl.NcsComponentData component`


## Methods

### getCase() <a href="#getcase-3adb4a906dd8" id="getcase-3adb4a906dd8"></a>

```java
public long getCase()
```

### getCaseName() <a href="#getcasename-430d6c383b25" id="getcasename-430d6c383b25"></a>

```java
public String getCaseName()
```

### getServiceName() <a href="#getservicename-a052a1088136" id="getservicename-a052a1088136"></a>

```java
public String getServiceName()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
