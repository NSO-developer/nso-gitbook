<a id="cls-LeafListEntry"></a>
# LeafListEntry

```java
protected class com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry
```

Inner class representing a leaf-list

## Members

**Constructors**:

- [LeafListEntry(CSNode)](#m-leaflistentry-86fab3e87b87)

**Fields**:

- [node](#m-node)
- [values](#m-values)

**Methods**:

- [addValue(ConfValue)](#m-addvalue-abe2bc760531)
- [getNode()](#m-getnode-52e3d8224b48)
- [getSize()](#m-getsize-572b3725211f)
- [getValue()](#m-getvalue-d93864668c40)

## Constructors

<a id="m-leaflistentry-86fab3e87b87"></a>
### LeafListEntry(CSNode)

```java
public LeafListEntry(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`


## Fields

<a id="m-node"></a>
### node

**Package-private**

```java
com.tailf.maapi.MaapiSchemas.CSNode node = null;
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

<a id="m-values"></a>
### values

**Package-private**

```java
java.util.List<com.tailf.conf.ConfValue> values = null;
```

Types: [ConfValue](../../conf/ConfValue.md#cls-ConfValue)


## Methods

<a id="m-addvalue-abe2bc760531"></a>
### addValue(ConfValue)

```java
public void addValue(com.tailf.conf.ConfValue value)
```

Types: [ConfValue](../../conf/ConfValue.md#cls-ConfValue)

**Parameters**

- `com.tailf.conf.ConfValue value`

<a id="m-getnode-52e3d8224b48"></a>
### getNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getNode()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

<a id="m-getsize-572b3725211f"></a>
### getSize()

```java
public int getSize()
```

<a id="m-getvalue-d93864668c40"></a>
### getValue()

```java
public com.tailf.conf.ConfList getValue()
```

Types: [ConfList](../../conf/ConfList.md#cls-ConfList)
