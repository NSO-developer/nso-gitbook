# KeyPath2NavuNode <a href="#cls-KeyPath2NavuNode" id="cls-KeyPath2NavuNode"></a>

```java
public class com.tailf.navu.KeyPath2NavuNode
```

Utility class for creating [`NavuNode`](NavuNode.md#cls-NavuNode) from [`ConfObject`](../conf/ConfObject.md#cls-ConfObject) array.

## Members

**Methods**:

- [getList(CSNode, ConfObject[])](#m-getList-059f57e4e042)
- [getListOrListEntry(CSNode, ConfObject[])](#m-getListOrListEntry-2d3a88ed873b)
- [getNode(ConfObject[], NavuContext)](#m-getNode-0dbf03f5ea6c)
- [getNode(ConfPath, NavuContext)](#m-getNode-440eaae488b9)
- [getParent(CSNode, ConfObject[])](#m-getParent-c4f035d88579)

**Nested Types**:

- [Formats](KeyPath2NavuNode/Formats.md#cls-Formats)

## Methods

### getList(CSNode, ConfObject[]) <a href="#m-getList-059f57e4e042" id="m-getList-059f57e4e042"></a>

```java
protected com.tailf.navu.NavuList getList(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfObject[] kpx
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfObject[] kpx`

### getListOrListEntry(CSNode, ConfObject[]) <a href="#m-getListOrListEntry-2d3a88ed873b" id="m-getListOrListEntry-2d3a88ed873b"></a>

```java
protected com.tailf.navu.NavuNode getListOrListEntry(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfObject[] kpx
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfObject[] kpx`

### getNode(ConfObject[], NavuContext) <a href="#m-getNode-0dbf03f5ea6c" id="m-getNode-0dbf03f5ea6c"></a>

```java
public static com.tailf.navu.NavuNode getNode(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.navu.NavuContext ctx
)
    throws com.tailf.conf.ConfException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [NavuContext](NavuContext.md#cls-NavuContext), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.navu.NavuContext ctx`

### getNode(ConfPath, NavuContext) <a href="#m-getNode-440eaae488b9" id="m-getNode-440eaae488b9"></a>

```java
public static com.tailf.navu.NavuNode getNode(
    com.tailf.conf.ConfPath path,
    com.tailf.navu.NavuContext ctx
)
    throws com.tailf.conf.ConfException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuContext](NavuContext.md#cls-NavuContext), [ConfException](../conf/ConfException.md#cls-ConfException)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.navu.NavuContext ctx`

### getParent(CSNode, ConfObject[]) <a href="#m-getParent-c4f035d88579" id="m-getParent-c4f035d88579"></a>

```java
protected com.tailf.navu.NavuNode getParent(
    com.tailf.maapi.MaapiSchemas.CSNode child,
    com.tailf.conf.ConfObject[] kpx
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [NavuException](NavuException.md#cls-NavuException)

Create a NavuNode from the parameter `child`
   and corresponding `kp`
  recursively. The returned parent should
  contain the parent chain to the topmost super-root

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode child` - - The child CSNode that
- `com.tailf.conf.ConfObject[] kpx`


## Nested Types

- [Formats](KeyPath2NavuNode/Formats.md#cls-Formats)
