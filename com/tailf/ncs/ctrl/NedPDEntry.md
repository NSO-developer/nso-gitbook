<a id="s-NedPDEntry"></a>
# NedPDEntry

```java
public class com.tailf.ncs.ctrl.NedPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#s-AbstractPDEntry)

Ned Component metadata

## Members

**Constructors**:

- [NedPDEntry(NcsMain, String, String, String, NcsComponentData)](#s-NedPDEntry-1)

**Methods**:

- [addReplacement(NcsComponentData)](AbstractPDEntry.md#s-addReplacement) from AbstractPDEntry
- [getComponent()](AbstractPDEntry.md#s-getComponent) from AbstractPDEntry
- [getFSM()](AbstractPDEntry.md#s-getFSM) from AbstractPDEntry
- [getInstances()](AbstractPDEntry.md#s-getInstances) from AbstractPDEntry
- [getNedIdNS()](#s-getNedIdNS)
- [getNedIdTag()](#s-getNedIdTag)
- [getNedType()](#s-getNedType)
- [isRunning()](AbstractPDEntry.md#s-isRunning) from AbstractPDEntry
- [isStopNedMux()](#s-isStopNedMux)
- [load(List<Object>)](AbstractPDEntry.md#s-load) from AbstractPDEntry
- [reload()](AbstractPDEntry.md#s-reload) from AbstractPDEntry
- [setPendingStopNedMux(boolean)](#s-setPendingStopNedMux)
- [toString()](#s-toString)
- [unload(AbstractPDEntry)](AbstractPDEntry.md#s-unload) from AbstractPDEntry

## Constructors

<a id="s-NedPDEntry-1"></a>
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

Types: [NcsMain](../NcsMain.md#s-NcsMain), [NcsComponentData](NcsComponentData.md#s-NcsComponentData)

Metadata Constructor for ned component

**Parameters**

- `com.tailf.ncs.NcsMain main`
- `String nedIdNS`
- `String nedIdTag`
- `String nedType`
- `com.tailf.ncs.ctrl.NcsComponentData component`


## Methods

<a id="s-getNedIdNS"></a>
### getNedIdNS()

```java
public String getNedIdNS()
```

Get Ned Id Namespace

**Returns:** String Namespace for Ned Id

<a id="s-getNedIdTag"></a>
### getNedIdTag()

```java
public String getNedIdTag()
```

Get Ned Id Tag

**Returns:** String tag for the Ned Id

<a id="s-getNedType"></a>
### getNedType()

```java
public String getNedType()
```

Get Ned Type

**Returns:** String Ned Type

<a id="s-isStopNedMux"></a>
### isStopNedMux()

```java
public boolean isStopNedMux()
```

<a id="s-setPendingStopNedMux"></a>
### setPendingStopNedMux(boolean)

```java
public void setPendingStopNedMux(boolean shouldStop)
```

**Parameters**

- `boolean shouldStop`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
