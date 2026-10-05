# ConfHaNode <a href="#confhanode-6a79a4c8e218" id="confhanode-6a79a4c8e218"></a>

```java
public class com.tailf.conf.ConfHaNode
```

ConfHaNode represents a HA node by identity and IP address

## Members

**Constructors**:

- [ConfHaNode(ConfValue, ConfValue)](#confhanode-7146bae77a19)

**Methods**:

- [getAddr()](#getaddr-7643cf1deb7b)
- [getNodeId()](#getnodeid-1bc8b2feefac)
- [pack_ha_node(ConfHaNode)](#pack_ha_node-dc74c8785624)
- [toString()](#tostring-e9d48c5503ef)
- [unpack_ha_node(ConfEObject)](#unpack_ha_node-25b6274287f0)

## Constructors

### ConfHaNode(ConfValue, ConfValue) <a href="#confhanode-7146bae77a19" id="confhanode-7146bae77a19"></a>

```java
public ConfHaNode(com.tailf.conf.ConfValue nodeid, com.tailf.conf.ConfValue addr)
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d)

Constructor for a HA node

**Parameters**

- `com.tailf.conf.ConfValue nodeid` - ConfValue carrying the identity of the HA node
- `com.tailf.conf.ConfValue addr` - IP address for the node as ConfIPv4 or ConfIPv6


## Methods

### getAddr() <a href="#getaddr-7643cf1deb7b" id="getaddr-7643cf1deb7b"></a>

```java
public com.tailf.conf.ConfValue getAddr()
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d)

Get the IP address for the node as ConfIPv4 or ConfIPv6

**Returns:** ConfValue which is either ConfIPv4 or ConfIPv6

### getNodeId() <a href="#getnodeid-1bc8b2feefac" id="getnodeid-1bc8b2feefac"></a>

```java
public com.tailf.conf.ConfValue getNodeId()
```

Types: [ConfValue](ConfValue.md#confvalue-769292781c7d)

Get the nodeid which is the identity of the HA node

**Returns:** ConfValue nodeid

### pack_ha_node(ConfHaNode) <a href="#pack_ha_node-dc74c8785624" id="pack_ha_node-dc74c8785624"></a>

```java
public static com.tailf.proto.ConfEObject pack_ha_node(com.tailf.conf.ConfHaNode node)
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfHaNode](ConfHaNode.md#confhanode-6a79a4c8e218)

Encodes a ConfHaNode into a ConfEObject to be transported by the
 protocol. This method is used internally by the api.

**Parameters**

- `com.tailf.conf.ConfHaNode node`

**Returns:** ConfEObject

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### unpack_ha_node(ConfEObject) <a href="#unpack_ha_node-25b6274287f0" id="unpack_ha_node-25b6274287f0"></a>

```java
public static com.tailf.conf.ConfHaNode unpack_ha_node(
    com.tailf.proto.ConfEObject term
)
    throws com.tailf.conf.ConfException
```

Types: [ConfHaNode](ConfHaNode.md#confhanode-6a79a4c8e218), [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [ConfException](ConfException.md#confexception-baeaab99f7f9)

Decodes a ConfEObject into a ConfHaNode. This method is used internally
 by the api.

**Parameters**

- `com.tailf.proto.ConfEObject term`

**Returns:** ConfHaNode

**Throws**

- `ConfException`
