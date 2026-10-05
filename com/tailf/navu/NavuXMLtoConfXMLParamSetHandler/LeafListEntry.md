<a id="s-LeafListEntry"></a>
# LeafListEntry

```java
protected class com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry
```

Inner class representing a leaf-list

## Members

**Constructors**:

- [LeafListEntry(CSNode)](#s-LeafListEntry-1)

**Fields**:

- [node](#s-node)
- [values](#s-values)

**Methods**:

- [addValue(ConfValue)](#s-addValue)
- [getNode()](#s-getNode)
- [getSize()](#s-getSize)
- [getValue()](#s-getValue)

## Constructors

<a id="s-LeafListEntry-1"></a>
### LeafListEntry(CSNode)

```java
public LeafListEntry(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`


## Fields

<a id="s-node"></a>
### node

**Package-private**

```java
com.tailf.maapi.MaapiSchemas.CSNode node = null;
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-values"></a>
### values

**Package-private**

```java
java.util.List<com.tailf.conf.ConfValue> values = null;
```

Types: [ConfValue](../../conf/ConfValue.md#s-ConfValue)


## Methods

<a id="s-addValue"></a>
### addValue(ConfValue)

```java
public void addValue(com.tailf.conf.ConfValue value)
```

Types: [ConfValue](../../conf/ConfValue.md#s-ConfValue)

**Parameters**

- `com.tailf.conf.ConfValue value`

<a id="s-getNode"></a>
### getNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getNode()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#s-CSNode)

<a id="s-getSize"></a>
### getSize()

```java
public int getSize()
```

<a id="s-getValue"></a>
### getValue()

```java
public com.tailf.conf.ConfList getValue()
```

Types: [ConfList](../../conf/ConfList.md#s-ConfList)
