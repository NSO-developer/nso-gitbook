# KeyPath2NavuNode <a href="#keypath2navunode-6efe0ae690fd" id="keypath2navunode-6efe0ae690fd"></a>

```java
public class com.tailf.navu.KeyPath2NavuNode
```

Utility class for creating [`NavuNode`](NavuNode.md#navunode-73944820c8db) from [`ConfObject`](../conf/ConfObject.md#confobject-5433616953b2) array.

## Members

**Methods**:

- [getList\(CSNode, ConfObject\[\]\)](#getlist-059f57e4e042)
- [getListOrListEntry\(CSNode, ConfObject\[\]\)](#getlistorlistentry-2d3a88ed873b)
- [getNode\(ConfObject\[\], NavuContext\)](#getnode-0dbf03f5ea6c)
- [getNode\(ConfPath, NavuContext\)](#getnode-440eaae488b9)
- [getParent\(CSNode, ConfObject\[\]\)](#getparent-c4f035d88579)

**Nested Types**:

- [Formats](KeyPath2NavuNode/Formats.md#formats-699695f9b70f)

## Methods

### getList(CSNode, ConfObject[]) <a href="#getlist-059f57e4e042" id="getlist-059f57e4e042"></a>

```java
protected com.tailf.navu.NavuList getList(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfObject[] kpx
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#navulist-472e8d6d3745), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfObject[] kpx`

### getListOrListEntry(CSNode, ConfObject[]) <a href="#getlistorlistentry-2d3a88ed873b" id="getlistorlistentry-2d3a88ed873b"></a>

```java
protected com.tailf.navu.NavuNode getListOrListEntry(
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.conf.ConfObject[] kpx
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.conf.ConfObject[] kpx`

### getNode(ConfObject[], NavuContext) <a href="#getnode-0dbf03f5ea6c" id="getnode-0dbf03f5ea6c"></a>

```java
public static com.tailf.navu.NavuNode getNode(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.navu.NavuContext ctx
)
    throws com.tailf.conf.ConfException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.navu.NavuContext ctx`

### getNode(ConfPath, NavuContext) <a href="#getnode-440eaae488b9" id="getnode-440eaae488b9"></a>

```java
public static com.tailf.navu.NavuNode getNode(
    com.tailf.conf.ConfPath path,
    com.tailf.navu.NavuContext ctx
)
    throws com.tailf.conf.ConfException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

**Parameters**

- `com.tailf.conf.ConfPath path`
- `com.tailf.navu.NavuContext ctx`

### getParent(CSNode, ConfObject[]) <a href="#getparent-c4f035d88579" id="getparent-c4f035d88579"></a>

```java
protected com.tailf.navu.NavuNode getParent(
    com.tailf.maapi.MaapiSchemas.CSNode child,
    com.tailf.conf.ConfObject[] kpx
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Create a NavuNode from the parameter `child`
   and corresponding `kp`
  recursively. The returned parent should
  contain the parent chain to the topmost super-root

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode child` - - The child CSNode that
- `com.tailf.conf.ConfObject[] kpx`


## Nested Types

- [Formats](KeyPath2NavuNode/Formats.md#formats-699695f9b70f)
