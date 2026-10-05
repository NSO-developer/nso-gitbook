# DpPDEntry <a href="#cls-DpPDEntry" id="cls-DpPDEntry"></a>

**Package-private**

```java
class com.tailf.ncs.ctrl.DpPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

Callback Component metadata

## Members

**Constructors**:

- [DpPDEntry(NcsMain, String, NcsComponentData, NcsDpMux)](#m-DpPDEntry-3127984997df)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addReplacement-afd0844ae705) from AbstractPDEntry
- [finish()](#m-finish-8c785ae2e6bb)
- [getComponent()](AbstractPDEntry.md#m-getComponent-f0c33077e458) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#m-getFSM-b0d67a77e6e5) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#m-getInstances-1d7ff49c0f24) from AbstractPDEntry
- [getMux()](#m-getMux-25b4e620ee6b)
- [getName()](#m-getName-2634b18b4a25)
- [isRunning()](AbstractPDEntry.md#m-isRunning-02db4ec84a8d) from AbstractPDEntry
- [load(List<Object>)](AbstractPDEntry.md#m-load-0a08bc3b9064) from AbstractPDEntry
- [register()](#m-register-d785206fca28)
- [reload()](AbstractPDEntry.md#m-reload-b0cf67aa2f64) from AbstractPDEntry
- [reRegister()](#m-reRegister-af1fdc504a91)
- [setMux(NcsDpMux)](#m-setMux-fd073aed34cc)
- [toString()](#m-toString-e9d48c5503ef)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#m-unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

### DpPDEntry(NcsMain, String, NcsComponentData, NcsDpMux) <a href="#m-DpPDEntry-3127984997df" id="m-DpPDEntry-3127984997df"></a>

**Package-private**

```java
DpPDEntry(
    com.tailf.ncs.NcsMain main,
    String name,
    com.tailf.ncs.ctrl.NcsComponentData component,
    com.tailf.ncs.ctrl.NcsDpMux mux
)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain), [NcsComponentData](NcsComponentData.md#cls-NcsComponentData), [NcsDpMux](NcsDpMux.md#cls-NcsDpMux)

Metadata Constructor for callback component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String name`
- `com.tailf.ncs.ctrl.NcsComponentData component`
- `com.tailf.ncs.ctrl.NcsDpMux mux`


## Methods

### finish() <a href="#m-finish-8c785ae2e6bb" id="m-finish-8c785ae2e6bb"></a>

```java
public void finish()
```

Stop and clear all application components

### getMux() <a href="#m-getMux-25b4e620ee6b" id="m-getMux-25b4e620ee6b"></a>

```java
public com.tailf.ncs.ctrl.NcsDpMux getMux()
```

Types: [NcsDpMux](NcsDpMux.md#cls-NcsDpMux)

Get Assigned NcsDpMux for this component

**Returns:** NcsDpMux

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public String getName()
```

Get component name

**Returns:** String component name

### register() <a href="#m-register-d785206fca28" id="m-register-d785206fca28"></a>

```java
public void register()
```

Register all instances for this callback component

### reRegister() <a href="#m-reRegister-af1fdc504a91" id="m-reRegister-af1fdc504a91"></a>

```java
public void reRegister()
```

reRegister all instances for this callback component

### setMux(NcsDpMux) <a href="#m-setMux-fd073aed34cc" id="m-setMux-fd073aed34cc"></a>

```java
public void setMux(com.tailf.ncs.ctrl.NcsDpMux mux)
```

Types: [NcsDpMux](NcsDpMux.md#cls-NcsDpMux)

Set NcsDpMux for this component

**Parameters**

- `com.tailf.ncs.ctrl.NcsDpMux mux`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
