# NedPDEntry <a href="#nedpdentry-af34e0aea42b" id="nedpdentry-af34e0aea42b"></a>

```java
public class com.tailf.ncs.ctrl.NedPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#abstractpdentry-c4b436e626e5)

Ned Component metadata

## Members

**Constructors**:

- [NedPDEntry(NcsMain, String, String, String, NcsComponentData)](#nedpdentry-3f6123b971b9)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#addreplacement-afd0844ae705) from AbstractPDEntry
- [getComponent()](AbstractPDEntry.md#getcomponent-f0c33077e458) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#getfsm-b0d67a77e6e5) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#getinstances-1d7ff49c0f24) from AbstractPDEntry
- [getNedIdNS()](#getnedidns-6d5bc3028343)
- [getNedIdTag()](#getnedidtag-9254c612474d)
- [getNedType()](#getnedtype-0f22e3831af4)
- [isRunning()](AbstractPDEntry.md#isrunning-02db4ec84a8d) from AbstractPDEntry
- [isStopNedMux()](#isstopnedmux-722ddbc26624)
- [load(List<Object>)](AbstractPDEntry.md#load-0a08bc3b9064) from AbstractPDEntry
- [reload()](AbstractPDEntry.md#reload-b0cf67aa2f64) from AbstractPDEntry
- [setPendingStopNedMux(boolean)](#setpendingstopnedmux-3abe713fa588)
- [toString()](#tostring-e9d48c5503ef)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

### NedPDEntry(NcsMain, String, String, String, NcsComponentData) <a href="#nedpdentry-3f6123b971b9" id="nedpdentry-3f6123b971b9"></a>

```java
public NedPDEntry(
    com.tailf.ncs.NcsMain main,
    String nedIdNS,
    String nedIdTag,
    String nedType,
    com.tailf.ncs.ctrl.NcsComponentData component
)
```

Types: [NcsMain](../NcsMain.md#ncsmain-eb814813aed4), [NcsComponentData](NcsComponentData.md#ncscomponentdata-b345f6915023)

Metadata Constructor for ned component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String nedIdNS`
- `String nedIdTag`
- `String nedType`
- `com.tailf.ncs.ctrl.NcsComponentData component`


## Methods

### getNedIdNS() <a href="#getnedidns-6d5bc3028343" id="getnedidns-6d5bc3028343"></a>

```java
public String getNedIdNS()
```

Get Ned Id Namespace

**Returns:** String Namespace for Ned Id

### getNedIdTag() <a href="#getnedidtag-9254c612474d" id="getnedidtag-9254c612474d"></a>

```java
public String getNedIdTag()
```

Get Ned Id Tag

**Returns:** String tag for the Ned Id

### getNedType() <a href="#getnedtype-0f22e3831af4" id="getnedtype-0f22e3831af4"></a>

```java
public String getNedType()
```

Get Ned Type

**Returns:** String Ned Type

### isStopNedMux() <a href="#isstopnedmux-722ddbc26624" id="isstopnedmux-722ddbc26624"></a>

```java
public boolean isStopNedMux()
```

### setPendingStopNedMux(boolean) <a href="#setpendingstopnedmux-3abe713fa588" id="setpendingstopnedmux-3abe713fa588"></a>

```java
public void setPendingStopNedMux(boolean shouldStop)
```

**Parameters**

- `boolean shouldStop`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
