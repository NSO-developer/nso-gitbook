<a id="cls-ConfHaNode"></a>
# ConfHaNode

```java
public class com.tailf.conf.ConfHaNode
```

ConfHaNode represents a HA node by identity and IP address

## Members

**Constructors**:

- [ConfHaNode(ConfValue, ConfValue)](#m-confhanode-7146bae77a19)

**Methods**:

- [getAddr()](#m-getaddr-7643cf1deb7b)
- [getNodeId()](#m-getnodeid-1bc8b2feefac)
- [pack_ha_node(ConfHaNode)](#m-pack_ha_node-dc74c8785624)
- [toString()](#m-tostring-e9d48c5503ef)
- [unpack_ha_node(ConfEObject)](#m-unpack_ha_node-25b6274287f0)

## Constructors

<a id="m-confhanode-7146bae77a19"></a>
### ConfHaNode(ConfValue, ConfValue)

```java
public ConfHaNode(com.tailf.conf.ConfValue nodeid, com.tailf.conf.ConfValue addr)
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Constructor for a HA node

**Parameters**

- `com.tailf.conf.ConfValue nodeid` - ConfValue carrying the identity of the HA node
- `com.tailf.conf.ConfValue addr` - IP address for the node as ConfIPv4 or ConfIPv6


## Methods

<a id="m-getaddr-7643cf1deb7b"></a>
### getAddr()

```java
public com.tailf.conf.ConfValue getAddr()
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Get the IP address for the node as ConfIPv4 or ConfIPv6

**Returns:** ConfValue which is either ConfIPv4 or ConfIPv6

<a id="m-getnodeid-1bc8b2feefac"></a>
### getNodeId()

```java
public com.tailf.conf.ConfValue getNodeId()
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Get the nodeid which is the identity of the HA node

**Returns:** ConfValue nodeid

<a id="m-pack_ha_node-dc74c8785624"></a>
### pack_ha_node(ConfHaNode)

```java
public static com.tailf.proto.ConfEObject pack_ha_node(com.tailf.conf.ConfHaNode node)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfHaNode](ConfHaNode.md#cls-ConfHaNode)

Encodes a ConfHaNode into a ConfEObject to be transported by the
 protocol. This method is used internally by the api.

**Parameters**

- `com.tailf.conf.ConfHaNode node`

**Returns:** ConfEObject

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-unpack_ha_node-25b6274287f0"></a>
### unpack_ha_node(ConfEObject)

```java
public static com.tailf.conf.ConfHaNode unpack_ha_node(
    com.tailf.proto.ConfEObject term
)
    throws com.tailf.conf.ConfException
```

Types: [ConfHaNode](ConfHaNode.md#cls-ConfHaNode), [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfException](ConfException.md#cls-ConfException)

Decodes a ConfEObject into a ConfHaNode. This method is used internally
 by the api.

**Parameters**

- `com.tailf.proto.ConfEObject term`

**Returns:** ConfHaNode

**Throws**

- `ConfException`
