# HaStatus <a href="#hastatus-b26e458a9864" id="hastatus-b26e458a9864"></a>

```java
public class com.tailf.ha.HaStatus
```

This class represents a status for an HA node in an HA cluster. First, the
 state says if the node is PRIMARY/SECONDARY/SECONDARY_RELAY or NONE.

 If the node is primary the nodes array contains representations of all the
 secondary nodes in the cluster.

## Members

**Constructors**:

- [HaStatus\(HaStateType, ConfHaNode\[\]\)](#hastatus-e22b8611269d)

**Methods**:

- [getHaState\(\)](#gethastate-2f8260e75c6b)
- [getNodes\(\)](#getnodes-0d0e9b3adfd1)

## Constructors

### HaStatus(HaStateType, ConfHaNode[]) <a href="#hastatus-e22b8611269d" id="hastatus-e22b8611269d"></a>

```java
public HaStatus(com.tailf.ha.HaStateType state, com.tailf.conf.ConfHaNode[] nodes)
```

Types: [HaStateType](HaStateType.md#hastatetype-8f5797940a11), [ConfHaNode](../conf/ConfHaNode.md#confhanode-6a79a4c8e218)

**Parameters**

- `com.tailf.ha.HaStateType state`
- `com.tailf.conf.ConfHaNode[] nodes`


## Methods

### getHaState() <a href="#gethastate-2f8260e75c6b" id="gethastate-2f8260e75c6b"></a>

```java
public com.tailf.ha.HaStateType getHaState()
```

Types: [HaStateType](HaStateType.md#hastatetype-8f5797940a11)

Get the HA node state - PRIMARY/SECONDARY/SECONDARY_RELAY/NONE

**Returns:** HaStateType

### getNodes() <a href="#getnodes-0d0e9b3adfd1" id="getnodes-0d0e9b3adfd1"></a>

```java
public com.tailf.conf.ConfHaNode[] getNodes()
```

Types: [ConfHaNode](../conf/ConfHaNode.md#confhanode-6a79a4c8e218)

Get the array of secondaries for a PRIMARY HA node, the PRIMARY node
 for a SECONDARY HA node, or the PRIMARY and the "sub-secondaries" for
 a SECONDARY_RELAY HA node. When SECONDARY_RELAY nodes are used, the
 PRIMARY for a SECONDARY or SECONDARY_RELAY node is actually the
 immediate/parent, which may not be the actual cluster primary. Returns
 null for NONE HA nodes.

**Returns:** array of ConfHaNode
