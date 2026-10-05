<a id="cls-NedPDEntry"></a>
# NedPDEntry

```java
public class com.tailf.ncs.ctrl.NedPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

Ned Component metadata

## Members

**Constructors**:

- [NedPDEntry(NcsMain, String, String, String, NcsComponentData)](#m-nedpdentry-3f6123b971b9)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addreplacement-afd0844ae705) from AbstractPDEntry
- [getComponent()](AbstractPDEntry.md#m-getcomponent-f0c33077e458) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#m-getfsm-b0d67a77e6e5) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#m-getinstances-1d7ff49c0f24) from AbstractPDEntry
- [getNedIdNS()](#m-getnedidns-6d5bc3028343)
- [getNedIdTag()](#m-getnedidtag-9254c612474d)
- [getNedType()](#m-getnedtype-0f22e3831af4)
- [isRunning()](AbstractPDEntry.md#m-isrunning-02db4ec84a8d) from AbstractPDEntry
- [isStopNedMux()](#m-isstopnedmux-722ddbc26624)
- [load(List<Object>)](AbstractPDEntry.md#m-load-0a08bc3b9064) from AbstractPDEntry
- [reload()](AbstractPDEntry.md#m-reload-b0cf67aa2f64) from AbstractPDEntry
- [setPendingStopNedMux(boolean)](#m-setpendingstopnedmux-3abe713fa588)
- [toString()](#m-tostring-e9d48c5503ef)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#m-unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

<a id="m-nedpdentry-3f6123b971b9"></a>
### NedPDEntry(NcsMain, String, String, String, NcsComponentData)

```java
public NedPDEntry(
    com.tailf.ncs.NcsMain main,
    String nedIdNS,
    String nedIdTag,
    String nedType,
    com.tailf.ncs.ctrl.NcsComponentData component
)
```

Types: [NcsMain](../NcsMain.md#cls-NcsMain), [NcsComponentData](NcsComponentData.md#cls-NcsComponentData)

Metadata Constructor for ned component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String nedIdNS`
- `String nedIdTag`
- `String nedType`
- `com.tailf.ncs.ctrl.NcsComponentData component`


## Methods

<a id="m-getnedidns-6d5bc3028343"></a>
### getNedIdNS()

```java
public String getNedIdNS()
```

Get Ned Id Namespace

**Returns:** String Namespace for Ned Id

<a id="m-getnedidtag-9254c612474d"></a>
### getNedIdTag()

```java
public String getNedIdTag()
```

Get Ned Id Tag

**Returns:** String tag for the Ned Id

<a id="m-getnedtype-0f22e3831af4"></a>
### getNedType()

```java
public String getNedType()
```

Get Ned Type

**Returns:** String Ned Type

<a id="m-isstopnedmux-722ddbc26624"></a>
### isStopNedMux()

```java
public boolean isStopNedMux()
```

<a id="m-setpendingstopnedmux-3abe713fa588"></a>
### setPendingStopNedMux(boolean)

```java
public void setPendingStopNedMux(boolean shouldStop)
```

**Parameters**

- `boolean shouldStop`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
