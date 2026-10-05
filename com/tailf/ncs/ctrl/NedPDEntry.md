# NedPDEntry <a href="#cls-NedPDEntry" id="cls-NedPDEntry"></a>

```java
public class com.tailf.ncs.ctrl.NedPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

Ned Component metadata

## Members

**Constructors**:

- [NedPDEntry(NcsMain, String, String, String, NcsComponentData)](#m-NedPDEntry-3f6123b971b9)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addReplacement-afd0844ae705) from AbstractPDEntry
- [getComponent()](AbstractPDEntry.md#m-getComponent-f0c33077e458) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#m-getFSM-b0d67a77e6e5) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#m-getInstances-1d7ff49c0f24) from AbstractPDEntry
- [getNedIdNS()](#m-getNedIdNS-6d5bc3028343)
- [getNedIdTag()](#m-getNedIdTag-9254c612474d)
- [getNedType()](#m-getNedType-0f22e3831af4)
- [isRunning()](AbstractPDEntry.md#m-isRunning-02db4ec84a8d) from AbstractPDEntry
- [isStopNedMux()](#m-isStopNedMux-722ddbc26624)
- [load(List<Object>)](AbstractPDEntry.md#m-load-0a08bc3b9064) from AbstractPDEntry
- [reload()](AbstractPDEntry.md#m-reload-b0cf67aa2f64) from AbstractPDEntry
- [setPendingStopNedMux(boolean)](#m-setPendingStopNedMux-3abe713fa588)
- [toString()](#m-toString-e9d48c5503ef)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#m-unload-79ee120e7a8a) from AbstractPDEntry

## Constructors

### NedPDEntry(NcsMain, String, String, String, NcsComponentData) <a href="#m-NedPDEntry-3f6123b971b9" id="m-NedPDEntry-3f6123b971b9"></a>

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

### getNedIdNS() <a href="#m-getNedIdNS-6d5bc3028343" id="m-getNedIdNS-6d5bc3028343"></a>

```java
public String getNedIdNS()
```

Get Ned Id Namespace

**Returns:** String Namespace for Ned Id

### getNedIdTag() <a href="#m-getNedIdTag-9254c612474d" id="m-getNedIdTag-9254c612474d"></a>

```java
public String getNedIdTag()
```

Get Ned Id Tag

**Returns:** String tag for the Ned Id

### getNedType() <a href="#m-getNedType-0f22e3831af4" id="m-getNedType-0f22e3831af4"></a>

```java
public String getNedType()
```

Get Ned Type

**Returns:** String Ned Type

### isStopNedMux() <a href="#m-isStopNedMux-722ddbc26624" id="m-isStopNedMux-722ddbc26624"></a>

```java
public boolean isStopNedMux()
```

### setPendingStopNedMux(boolean) <a href="#m-setPendingStopNedMux-3abe713fa588" id="m-setPendingStopNedMux-3abe713fa588"></a>

```java
public void setPendingStopNedMux(boolean shouldStop)
```

**Parameters**

- `boolean shouldStop`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
