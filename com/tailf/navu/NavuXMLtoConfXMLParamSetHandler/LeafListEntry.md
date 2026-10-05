# LeafListEntry <a href="#leaflistentry-6e9f05db5809" id="leaflistentry-6e9f05db5809"></a>

```java
protected class com.tailf.navu.NavuXMLtoConfXMLParamSetHandler.LeafListEntry
```

Inner class representing a leaf-list

## Members

**Constructors**:

- [LeafListEntry\(CSNode\)](#leaflistentry-86fab3e87b87)

**Fields**:

- [node](#node-ff68e6a3ebc6)
- [values](#values-785122778feb)

**Methods**:

- [addValue\(ConfValue\)](#addvalue-abe2bc760531)
- [getNode\(\)](#getnode-52e3d8224b48)
- [getSize\(\)](#getsize-572b3725211f)
- [getValue\(\)](#getvalue-d93864668c40)

## Constructors

### LeafListEntry(CSNode) <a href="#leaflistentry-86fab3e87b87" id="leaflistentry-86fab3e87b87"></a>

```java
public LeafListEntry(com.tailf.maapi.MaapiSchemas.CSNode node)
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`


## Fields

### node <a href="#node-ff68e6a3ebc6" id="node-ff68e6a3ebc6"></a>

**Package-private**

```java
com.tailf.maapi.MaapiSchemas.CSNode node = null;
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

### values <a href="#values-785122778feb" id="values-785122778feb"></a>

**Package-private**

```java
java.util.List<com.tailf.conf.ConfValue> values = null;
```

Types: [ConfValue](../../conf/ConfValue.md#confvalue-769292781c7d)


## Methods

### addValue(ConfValue) <a href="#addvalue-abe2bc760531" id="addvalue-abe2bc760531"></a>

```java
public void addValue(com.tailf.conf.ConfValue value)
```

Types: [ConfValue](../../conf/ConfValue.md#confvalue-769292781c7d)

**Parameters**

- `com.tailf.conf.ConfValue value`

### getNode() <a href="#getnode-52e3d8224b48" id="getnode-52e3d8224b48"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSNode getNode()
```

Types: [CSNode](../../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

### getSize() <a href="#getsize-572b3725211f" id="getsize-572b3725211f"></a>

```java
public int getSize()
```

### getValue() <a href="#getvalue-d93864668c40" id="getvalue-d93864668c40"></a>

```java
public com.tailf.conf.ConfList getValue()
```

Types: [ConfList](../../conf/ConfList.md#conflist-a9c192ad3c99)
