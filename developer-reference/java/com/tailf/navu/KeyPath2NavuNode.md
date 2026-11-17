# KeyPath2NavuNode <a href="#keypath2navunode-6efe0ae690fd" id="keypath2navunode-6efe0ae690fd"></a>

```java
public class com.tailf.navu.KeyPath2NavuNode
```

Utility class for creating [`NavuNode`](NavuNode.md#navunode-73944820c8db) from [`ConfObject`](../conf/ConfObject.md#confobject-5433616953b2) array.

## Members

**Methods**:

- [getNode\(ConfObject\[\], NavuContext\)](#getnode-0dbf03f5ea6c)
- [getNode\(ConfPath, NavuContext\)](#getnode-440eaae488b9)

## Methods

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
