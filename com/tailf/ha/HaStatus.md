<a id="cls-HaStatus"></a>
# HaStatus

```java
public class com.tailf.ha.HaStatus
```

This class represents a status for an HA node in an HA cluster. First, the
 state says if the node is PRIMARY/SECONDARY/SECONDARY_RELAY or NONE.

 If the node is primary the nodes array contains representations of all the
 secondary nodes in the cluster.

## Members

**Constructors**:

- [HaStatus(HaStateType, ConfHaNode[])](#m-hastatus-e22b8611269d)

**Methods**:

- [getHaState()](#m-gethastate-2f8260e75c6b)
- [getNodes()](#m-getnodes-0d0e9b3adfd1)

## Constructors

<a id="m-hastatus-e22b8611269d"></a>
### HaStatus(HaStateType, ConfHaNode[])

```java
public HaStatus(com.tailf.ha.HaStateType state, com.tailf.conf.ConfHaNode[] nodes)
```

Types: [HaStateType](HaStateType.md#cls-HaStateType), [ConfHaNode](../conf/ConfHaNode.md#cls-ConfHaNode)

**Parameters**

- `com.tailf.ha.HaStateType state`
- `com.tailf.conf.ConfHaNode[] nodes`


## Methods

<a id="m-gethastate-2f8260e75c6b"></a>
### getHaState()

```java
public com.tailf.ha.HaStateType getHaState()
```

Types: [HaStateType](HaStateType.md#cls-HaStateType)

Get the HA node state - PRIMARY/SECONDARY/SECONDARY_RELAY/NONE

**Returns:** HaStateType

<a id="m-getnodes-0d0e9b3adfd1"></a>
### getNodes()

```java
public com.tailf.conf.ConfHaNode[] getNodes()
```

Types: [ConfHaNode](../conf/ConfHaNode.md#cls-ConfHaNode)

Get the array of secondaries for a PRIMARY HA node, the PRIMARY node
 for a SECONDARY HA node, or the PRIMARY and the "sub-secondaries" for
 a SECONDARY_RELAY HA node. When SECONDARY_RELAY nodes are used, the
 PRIMARY for a SECONDARY or SECONDARY_RELAY node is actually the
 immediate/parent, which may not be the actual cluster primary. Returns
 null for NONE HA nodes.

**Returns:** array of ConfHaNode
