<a id="s-HaStatus"></a>
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

- [HaStatus(HaStateType, ConfHaNode[])](#s-HaStatus-1)

**Methods**:

- [getHaState()](#s-getHaState)
- [getNodes()](#s-getNodes)

## Constructors

<a id="s-HaStatus-1"></a>
### HaStatus(HaStateType, ConfHaNode[])

```java
public HaStatus(com.tailf.ha.HaStateType state, com.tailf.conf.ConfHaNode[] nodes)
```

Types: [HaStateType](HaStateType.md#s-HaStateType), [ConfHaNode](../conf/ConfHaNode.md#s-ConfHaNode)

**Parameters**

- `com.tailf.ha.HaStateType state`
- `com.tailf.conf.ConfHaNode[] nodes`


## Methods

<a id="s-getHaState"></a>
### getHaState()

```java
public com.tailf.ha.HaStateType getHaState()
```

Types: [HaStateType](HaStateType.md#s-HaStateType)

Get the HA node state - PRIMARY/SECONDARY/SECONDARY_RELAY/NONE

**Returns:** HaStateType

<a id="s-getNodes"></a>
### getNodes()

```java
public com.tailf.conf.ConfHaNode[] getNodes()
```

Types: [ConfHaNode](../conf/ConfHaNode.md#s-ConfHaNode)

Get the array of secondaries for a PRIMARY HA node, the PRIMARY node
 for a SECONDARY HA node, or the PRIMARY and the "sub-secondaries" for
 a SECONDARY_RELAY HA node. When SECONDARY_RELAY nodes are used, the
 PRIMARY for a SECONDARY or SECONDARY_RELAY node is actually the
 immediate/parent, which may not be the actual cluster primary. Returns
 null for NONE HA nodes.

**Returns:** array of ConfHaNode
