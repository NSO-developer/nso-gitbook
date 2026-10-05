# ConfHaNode <a href="#cls-ConfHaNode" id="cls-ConfHaNode"></a>

```java
public class com.tailf.conf.ConfHaNode
```

ConfHaNode represents a HA node by identity and IP address

## Members

**Constructors**:

- [ConfHaNode(ConfValue, ConfValue)](#m-ConfHaNode-7146bae77a19)

**Methods**:

- [getAddr()](#m-getAddr-7643cf1deb7b)
- [getNodeId()](#m-getNodeId-1bc8b2feefac)
- [pack_ha_node(ConfHaNode)](#m-pack_ha_node-dc74c8785624)
- [toString()](#m-toString-e9d48c5503ef)
- [unpack_ha_node(ConfEObject)](#m-unpack_ha_node-25b6274287f0)

## Constructors

### ConfHaNode(ConfValue, ConfValue) <a href="#m-ConfHaNode-7146bae77a19" id="m-ConfHaNode-7146bae77a19"></a>

```java
public ConfHaNode(com.tailf.conf.ConfValue nodeid, com.tailf.conf.ConfValue addr)
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Constructor for a HA node

**Parameters**

- `com.tailf.conf.ConfValue nodeid` - ConfValue carrying the identity of the HA node
- `com.tailf.conf.ConfValue addr` - IP address for the node as ConfIPv4 or ConfIPv6


## Methods

### getAddr() <a href="#m-getAddr-7643cf1deb7b" id="m-getAddr-7643cf1deb7b"></a>

```java
public com.tailf.conf.ConfValue getAddr()
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Get the IP address for the node as ConfIPv4 or ConfIPv6

**Returns:** ConfValue which is either ConfIPv4 or ConfIPv6

### getNodeId() <a href="#m-getNodeId-1bc8b2feefac" id="m-getNodeId-1bc8b2feefac"></a>

```java
public com.tailf.conf.ConfValue getNodeId()
```

Types: [ConfValue](ConfValue.md#cls-ConfValue)

Get the nodeid which is the identity of the HA node

**Returns:** ConfValue nodeid

### pack_ha_node(ConfHaNode) <a href="#m-pack_ha_node-dc74c8785624" id="m-pack_ha_node-dc74c8785624"></a>

```java
public static com.tailf.proto.ConfEObject pack_ha_node(com.tailf.conf.ConfHaNode node)
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [ConfHaNode](ConfHaNode.md#cls-ConfHaNode)

Encodes a ConfHaNode into a ConfEObject to be transported by the
 protocol. This method is used internally by the api.

**Parameters**

- `com.tailf.conf.ConfHaNode node`

**Returns:** ConfEObject

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### unpack_ha_node(ConfEObject) <a href="#m-unpack_ha_node-25b6274287f0" id="m-unpack_ha_node-25b6274287f0"></a>

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
