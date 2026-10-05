<a id="cls-DpPDEntry"></a>
# DpPDEntry

**Package-private**

```java
class com.tailf.ncs.ctrl.DpPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

Callback Component metadata

## Members

**Constructors**:

- [DpPDEntry(NcsMain, String, NcsComponentData, NcsDpMux)](#m-dppdentry-3127984997df)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addreplacement-afd0844ae705) from AbstractPDEntry
- [finish()](#m-finish-8c785ae2e6bb)
- [getComponent()](AbstractPDEntry.md#m-getcomponent-f0c33077e458) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#m-getfsm-b0d67a77e6e5) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#m-getinstances-1d7ff49c0f24) from AbstractPDEntry
- [getMux()](#m-getmux-25b4e620ee6b)
- [getName()](#m-getname-2634b18b4a25)
- [isRunning()](AbstractPDEntry.md#m-isrunning-02db4ec84a8d) from AbstractPDEntry
- [load(List<Object>)](AbstractPDEntry.md#m-load-0a08bc3b9064) from AbstractPDEntry
- [register()](#m-register-d785206fca28)
- [reload()](AbstractPDEntry.md#m-reload-b0cf67aa2f64) from AbstractPDEntry
- [reRegister()](#m-reregister-af1fdc504a91)
- [setMux(NcsDpMux)](#m-setmux-fd073aed34cc)
- [toString()](#m-tostring-e9d48c5503ef)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#m-unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

<a id="m-dppdentry-3127984997df"></a>
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

Types: [NcsMain](../NcsMain.md#cls-NcsMain), [NcsComponentData](NcsComponentData.md#cls-NcsComponentData), [NcsDpMux](NcsDpMux.md#cls-NcsDpMux)

Metadata Constructor for callback component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String name`
- `com.tailf.ncs.ctrl.NcsComponentData component`
- `com.tailf.ncs.ctrl.NcsDpMux mux`


## Methods

<a id="m-finish-8c785ae2e6bb"></a>
### finish()

```java
public void finish()
```

Stop and clear all application components

<a id="m-getmux-25b4e620ee6b"></a>
### getMux()

```java
public com.tailf.ncs.ctrl.NcsDpMux getMux()
```

Types: [NcsDpMux](NcsDpMux.md#cls-NcsDpMux)

Get Assigned NcsDpMux for this component

**Returns:** NcsDpMux

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public String getName()
```

Get component name

**Returns:** String component name

<a id="m-register-d785206fca28"></a>
### register()

```java
public void register()
```

Register all instances for this callback component

<a id="m-reregister-af1fdc504a91"></a>
### reRegister()

```java
public void reRegister()
```

reRegister all instances for this callback component

<a id="m-setmux-fd073aed34cc"></a>
### setMux(NcsDpMux)

```java
public void setMux(com.tailf.ncs.ctrl.NcsDpMux mux)
```

Types: [NcsDpMux](NcsDpMux.md#cls-NcsDpMux)

Set NcsDpMux for this component

**Parameters**

- `com.tailf.ncs.ctrl.NcsDpMux mux`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
