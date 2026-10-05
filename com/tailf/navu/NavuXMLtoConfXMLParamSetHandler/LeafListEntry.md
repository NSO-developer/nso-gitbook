# LeafListEntry <a href="#cls-LeafListEntry" id="cls-LeafListEntry"></a>

```java
protected class com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry
```

Inner class representing a leaf-list

## Members

**Constructors**:

- [LeafListEntry(CSNode)](#m-LeafListEntry-86fab3e87b87)

**Fields**:

- [node](#m-node)
- [values](#m-values)

**Methods**:

- [addValue(ConfValue)](#m-addValue-abe2bc760531)
- [getNode()](#m-getNode-52e3d8224b48)
- [getSize()](#m-getSize-572b3725211f)
- [getValue()](#m-getValue-d93864668c40)

## Constructors

### LeafListEntry(CSNode) <a href="#m-LeafListEntry-86fab3e87b87" id="m-LeafListEntry-86fab3e87b87"></a>

```java
public LeafListEntry(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`


## Fields

### node <a href="#m-node" id="m-node"></a>

**Package-private**

```java
com.tailf.maapi.MaapiSchemas.CSNode node = null;
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

### values <a href="#m-values" id="m-values"></a>

**Package-private**

```java
java.util.List<com.tailf.conf.ConfValue> values = null;
```

Types: [ConfValue](../../conf/ConfValue.md#cls-ConfValue)


## Methods

### addValue(ConfValue) <a href="#m-addValue-abe2bc760531" id="m-addValue-abe2bc760531"></a>

```java
public void addValue(com.tailf.conf.ConfValue value)
```

Types: [ConfValue](../../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.conf.ConfValue value`

### getNode() <a href="#m-getNode-52e3d8224b48" id="m-getNode-52e3d8224b48"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getNode()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

### getSize() <a href="#m-getSize-572b3725211f" id="m-getSize-572b3725211f"></a>

```java
public int getSize()
```

### getValue() <a href="#m-getValue-d93864668c40" id="m-getValue-d93864668c40"></a>

```java
public com.tailf.conf.ConfList getValue()
```

Types: [ConfList](../../conf/ConfList.md#cls-ConfList)
