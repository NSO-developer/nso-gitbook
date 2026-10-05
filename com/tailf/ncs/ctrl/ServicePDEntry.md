<a id="s-ServicePDEntry"></a>
# ServicePDEntry

```java
public class com.tailf.ncs.ctrl.ServicePDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#s-AbstractPDEntry)

Service Component metadata

## Members

**Constructors**:

- [ServicePDEntry(NcsMain, String, String, NcsComponentData)](#s-ServicePDEntry-1)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#s-addReplacement) from AbstractPDEntry
- [getCase()](#s-getCase)
- [getCaseName()](#s-getCaseName)
- [getComponent()](AbstractPDEntry.md#s-getComponent) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#s-getFSM) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#s-getInstances) from AbstractPDEntry
- [getServiceName()](#s-getServiceName)
- [isRunning()](AbstractPDEntry.md#s-isRunning) from AbstractPDEntry
- [load(List<Object>)](AbstractPDEntry.md#s-load) from AbstractPDEntry
- [reload()](AbstractPDEntry.md#s-reload) from AbstractPDEntry
- [toString()](#s-toString)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#s-unload) from AbstractPDEntry

## Constructors

<a id="s-ServicePDEntry-1"></a>
### ServicePDEntry(NcsMain, String, String, NcsComponentData)

```java
public ServicePDEntry(
    com.tailf.ncs.NcsMain main,
    String serviceName,
    String serviceCase,
    com.tailf.ncs.ctrl.NcsComponentData component
)
```

Types: [NcsMain](../NcsMain.md#s-NcsMain), [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Metadata Constructor for application component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String serviceName`
- `String serviceCase`
- `com.tailf.ncs.ctrl.NcsComponentData component`


## Methods

<a id="s-getCase"></a>
### getCase()

```java
public long getCase()
```

<a id="s-getCaseName"></a>
### getCaseName()

```java
public String getCaseName()
```

<a id="s-getServiceName"></a>
### getServiceName()

```java
public String getServiceName()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
