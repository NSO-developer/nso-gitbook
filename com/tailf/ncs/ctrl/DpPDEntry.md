# DpPDEntry <a href="#dppdentry-3d7fc55c80fc" id="dppdentry-3d7fc55c80fc"></a>

**Package-private**

```java
class com.tailf.ncs.ctrl.DpPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#abstractpdentry-c4b436e626e5)

Callback Component metadata

## Members

**Constructors**:

- [DpPDEntry\(NcsMain, String, NcsComponentData, NcsDpMux\)](#dppdentry-3127984997df)

**Methods**:

- [addReplacement\(NcsComponentData\)](AbstractPDEntry.md#addreplacement-afd0844ae705) from AbstractPDEntry
- [finish\(\)](#finish-8c785ae2e6bb)
- [getComponent\(\)](AbstractPDEntry.md#getcomponent-f0c33077e458) from AbstractPDEntry
- [getFSM\(\)](AbstractPDEntry.md#getfsm-b0d67a77e6e5) from AbstractPDEntry
- [getInstances\(\)](AbstractPDEntry.md#getinstances-1d7ff49c0f24) from AbstractPDEntry
- [getMux\(\)](#getmux-25b4e620ee6b)
- [getName\(\)](#getname-2634b18b4a25)
- [isRunning\(\)](AbstractPDEntry.md#isrunning-02db4ec84a8d) from AbstractPDEntry
- [load\(List\<Object\>\)](AbstractPDEntry.md#load-0a08bc3b9064) from AbstractPDEntry
- [register\(\)](#register-d785206fca28)
- [reload\(\)](AbstractPDEntry.md#reload-b0cf67aa2f64) from AbstractPDEntry
- [reRegister\(\)](#reregister-af1fdc504a91)
- [setMux\(NcsDpMux\)](#setmux-fd073aed34cc)
- [toString\(\)](#tostring-e9d48c5503ef)
- [unload\(AbstractPDEntry\)](AbstractPDEntry.md#unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

### DpPDEntry(NcsMain, String, NcsComponentData, NcsDpMux) <a href="#dppdentry-3127984997df" id="dppdentry-3127984997df"></a>

**Package-private**

```java
DpPDEntry(
    com.tailf.ncs.NcsMain main,
    String name,
    com.tailf.ncs.ctrl.NcsComponentData component,
    com.tailf.ncs.ctrl.NcsDpMux mux
)
```

Types: [NcsMain](../NcsMain.md#ncsmain-eb814813aed4), [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023), [NcsDpMux](NcsDpMux.md#ncsdpmux-e720f4e4e4fe)

Metadata Constructor for callback component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String name`
- `com.tailf.ncs.ctrl.NcsComponentData component`
- `com.tailf.ncs.ctrl.NcsDpMux mux`


## Methods

### finish() <a href="#finish-8c785ae2e6bb" id="finish-8c785ae2e6bb"></a>

```java
public void finish()
```

Stop and clear all application components

### getMux() <a href="#getmux-25b4e620ee6b" id="getmux-25b4e620ee6b"></a>

```java
public com.tailf.ncs.ctrl.NcsDpMux getMux()
```

Types: [NcsDpMux](NcsDpMux.md#ncsdpmux-e720f4e4e4fe)

Get Assigned NcsDpMux for this component

**Returns:** NcsDpMux

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public String getName()
```

Get component name

**Returns:** String component name

### register() <a href="#register-d785206fca28" id="register-d785206fca28"></a>

```java
public void register()
```

Register all instances for this callback component

### reRegister() <a href="#reregister-af1fdc504a91" id="reregister-af1fdc504a91"></a>

```java
public void reRegister()
```

reRegister all instances for this callback component

### setMux(NcsDpMux) <a href="#setmux-fd073aed34cc" id="setmux-fd073aed34cc"></a>

```java
public void setMux(com.tailf.ncs.ctrl.NcsDpMux mux)
```

Types: [NcsDpMux](NcsDpMux.md#ncsdpmux-e720f4e4e4fe)

Set NcsDpMux for this component

**Parameters**

- `com.tailf.ncs.ctrl.NcsDpMux mux`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
