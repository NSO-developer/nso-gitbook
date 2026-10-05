<a id="s-DpPDEntry"></a>
# DpPDEntry

**Package-private**

```java
class com.tailf.ncs.ctrl.DpPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#s-AbstractPDEntry)

Callback Component metadata

## Members

**Constructors**:

- [DpPDEntry(NcsMain, String, NcsComponentData, NcsDpMux)](#s-DpPDEntry-1)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#s-addReplacement) from AbstractPDEntry
- [finish()](#s-finish)
- [getComponent()](AbstractPDEntry.md#s-getComponent) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#s-getFSM) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#s-getInstances) from AbstractPDEntry
- [getMux()](#s-getMux)
- [getName()](#s-getName)
- [isRunning()](AbstractPDEntry.md#s-isRunning) from AbstractPDEntry
- [load(List<Object>)](AbstractPDEntry.md#s-load) from AbstractPDEntry
- [register()](#s-register)
- [reload()](AbstractPDEntry.md#s-reload) from AbstractPDEntry
- [reRegister()](#s-reRegister)
- [setMux(NcsDpMux)](#s-setMux)
- [toString()](#s-toString)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#s-unload) from AbstractPDEntry

## Constructors

<a id="s-DpPDEntry-1"></a>
### DpPDEntry(NcsMain, String, NcsComponentData, NcsDpMux)

**Package-private**

```java
DpPDEntry(
    com.tailf.ncs.NcsMain main,
    String name,
    com.tailf.ncs.ctrl.NcsComponentData component,
    com.tailf.ncs.ctrl.NcsDpMux mux
)
```

Types: [NcsMain](../NcsMain.md#s-NcsMain), [NcsComponentData](NcsComponentData.md#s-NcsComponentData), [NcsDpMux](NcsDpMux.md#s-NcsDpMux)

Metadata Constructor for callback component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String name`
- `com.tailf.ncs.ctrl.NcsComponentData component`
- `com.tailf.ncs.ctrl.NcsDpMux mux`


## Methods

<a id="s-finish"></a>
### finish()

```java
public void finish()
```

Stop and clear all application components

<a id="s-getMux"></a>
### getMux()

```java
public com.tailf.ncs.ctrl.NcsDpMux getMux()
```

Types: [NcsDpMux](NcsDpMux.md#s-NcsDpMux)

Get Assigned NcsDpMux for this component

**Returns:** NcsDpMux

<a id="s-getName"></a>
### getName()

```java
public String getName()
```

Get component name

**Returns:** String component name

<a id="s-register"></a>
### register()

```java
public void register()
```

Register all instances for this callback component

<a id="s-reRegister"></a>
### reRegister()

```java
public void reRegister()
```

reRegister all instances for this callback component

<a id="s-setMux"></a>
### setMux(NcsDpMux)

```java
public void setMux(com.tailf.ncs.ctrl.NcsDpMux mux)
```

Types: [NcsDpMux](NcsDpMux.md#s-NcsDpMux)

Set NcsDpMux for this component

**Parameters**

- `com.tailf.ncs.ctrl.NcsDpMux mux`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
