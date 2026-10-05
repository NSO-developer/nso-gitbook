# NedPDEntry

## NedPDEntry

```java
public class com.tailf.ncs.ctrl.NedPDEntry
    extends com.tailf.ncs.ctrl.AbstractPDEntry
```

Types: [AbstractPDEntry](AbstractPDEntry.md#cls-AbstractPDEntry)

Ned Component metadata

### Members

**Constructors**:

* [NedPDEntry(NcsMain, String, String, String, NcsComponentData)](NedPDEntry.md#m-nedpdentry-3f6123b971b9)

**Methods**:

* [addReplacement(NcsComponentData)](AbstractPDEntry.md#m-addreplacement-afd0844ae705) from AbstractPDEntry
* [getComponent()](AbstractPDEntry.md#m-getcomponent-f0c33077e458) from AbstractPDEntry
* [getFSM()](AbstractPDEntry.md#m-getfsm-b0d67a77e6e5) from AbstractPDEntry
* [getInstances()](AbstractPDEntry.md#m-getinstances-1d7ff49c0f24) from AbstractPDEntry
* [getNedIdNS()](NedPDEntry.md#m-getnedidns-6d5bc3028343)
* [getNedIdTag()](NedPDEntry.md#m-getnedidtag-9254c612474d)
* [getNedType()](NedPDEntry.md#m-getnedtype-0f22e3831af4)
* [isRunning()](AbstractPDEntry.md#m-isrunning-02db4ec84a8d) from AbstractPDEntry
* [isStopNedMux()](NedPDEntry.md#m-isstopnedmux-722ddbc26624)
* [load(List) from AbstractPDEntry from AbstractPDEntry from AbstractPDEntryConstructorsNedPDEntry(NcsMain, String, String, String, NcsComponentData)public NedPDEntry(    com.tailf.ncs.NcsMain main,    String nedIdNS,    String nedIdTag,    String nedType,    com.tailf.ncs.ctrl.NcsComponentData component)Types: , Metadata Constructor for ned component**Parameters**`com.tailf.ncs.NcsMain mainString nedIdNSString nedIdTagString nedTypecom.tailf.ncs.ctrl.NcsComponentData component`MethodsgetNedIdNS()public String getNedIdNS()Get Ned Id Namespace**Returns:** String Namespace for Ned IdgetNedIdTag()public String getNedIdTag()Get Ned Id Tag**Returns:** String tag for the Ned IdgetNedType()public String getNedType()Get Ned Type**Returns:** String Ned TypeisStopNedMux()public boolean isStopNedMux()setPendingStopNedMux(boolean)public void setPendingStopNedMux(boolean shouldStop)**Parameters**`boolean shouldStop`toString()public String toString()](AbstractPDEntry.md#m-load-0a08bc3b9064)
