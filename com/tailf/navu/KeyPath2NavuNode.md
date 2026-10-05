<a id="cls-KeyPath2NavuNode"></a>
# KeyPath2NavuNode

```java
public class com.tailf.navu.KeyPath2NavuNode
```

Utility class for creating [`NavuNode`](NavuNode.md#cls-NavuNode) from [`ConfObject`](../conf/ConfObject.md#cls-ConfObject) array.

## Members

**Methods**:

- [getList(CSNode, ConfObject[])](#m-getlist-059f57e4e042)
- [getListOrListEntry(CSNode, ConfObject[])](#m-getlistorlistentry-2d3a88ed873b)
- [getNode(ConfObject[], NavuContext)](#m-getnode-0dbf03f5ea6c)
- [getNode(ConfPath, NavuContext)](#m-getnode-440eaae488b9)
- [getParent(CSNode, ConfObject[])](#m-getparent-c4f035d88579)

**Nested Types**:

- [Formats](KeyPath2NavuNode/Formats.md#cls-Formats)

## Methods

<a id="m-getlist-059f57e4e042"></a>
### getList(CSNode, ConfObject[])

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

<a id="m-getlistorlistentry-2d3a88ed873b"></a>
### getListOrListEntry(CSNode, ConfObject[])

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

<a id="m-getnode-0dbf03f5ea6c"></a>
### getNode(ConfObject[], NavuContext)

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

<a id="m-getnode-440eaae488b9"></a>
### getNode(ConfPath, NavuContext)

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

<a id="m-getparent-c4f035d88579"></a>
### getParent(CSNode, ConfObject[])

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
