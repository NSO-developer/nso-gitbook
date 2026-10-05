<a id="s-KeyPath2NavuNode"></a>
# KeyPath2NavuNode

```java
public class com.tailf.navu.KeyPath2NavuNode
```

Utility class for creating [`NavuNode`](NavuNode.md#s-NavuNode) from [`ConfObject`](../conf/ConfObject.md#s-ConfObject) array.

## Members

**Methods**:

- [getList(CSNode, ConfObject[])](#s-getList)
- [getListOrListEntry(CSNode, ConfObject[])](#s-getListOrListEntry)
- [getNode(ConfObject[], NavuContext)](#s-getNode)
- [getNode(ConfPath, NavuContext)](#s-getNode-1)
- [getParent(CSNode, ConfObject[])](#s-getParent)

**Nested Types**:

- [Formats](KeyPath2NavuNode/Formats.md#s-Formats)

## Methods

<a id="s-getList"></a>
### getList(CSNode, ConfObject[])

```java
protected com.tailf.navu.NavuList getList(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfObject[] kpx
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#s-NavuList), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfObject](../conf/ConfObject.md#s-ConfObject), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfObject[] kpx`

<a id="s-getListOrListEntry"></a>
### getListOrListEntry(CSNode, ConfObject[])

```java
protected com.tailf.navu.NavuNode getListOrListEntry(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfObject[] kpx
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfObject](../conf/ConfObject.md#s-ConfObject), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfObject[] kpx`

<a id="s-getNode"></a>
### getNode(ConfObject[], NavuContext)

```java
public static com.tailf.navu.NavuNode getNode(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.navu.NavuContext ctx
)
    throws com.tailf.conf.ConfException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfObject](../conf/ConfObject.md#s-ConfObject), [NavuContext](NavuContext.md#s-NavuContext), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.navu.NavuContext ctx`

<a id="s-getNode-1"></a>
### getNode(ConfPath, NavuContext)

```java
public static com.tailf.navu.NavuNode getNode(
    com.tailf.conf.ConfPath path,
    com.tailf.navu.NavuContext ctx
)
    throws com.tailf.conf.ConfException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfPath](../conf/ConfPath.md#s-ConfPath), [NavuContext](NavuContext.md#s-NavuContext), [ConfException](../conf/ConfException.md#s-ConfException)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.navu.NavuContext ctx`

<a id="s-getParent"></a>
### getParent(CSNode, ConfObject[])

```java
protected com.tailf.navu.NavuNode getParent(
    com.tailf.maapi.MaapiSchemas.CSNode child,
    com.tailf.conf.ConfObject[] kpx
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [ConfObject](../conf/ConfObject.md#s-ConfObject), [NavuException](NavuException.md#s-NavuException)

Create a NavuNode from the parameter `child`
   and corresponding `kp`
  recursively. The returned parent should
  contain the parent chain to the topmost super-root

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode child` - - The child CSNode that
- `com.tailf.conf.ConfObject[] kpx`


## Nested Types

- [Formats](KeyPath2NavuNode/Formats.md)
