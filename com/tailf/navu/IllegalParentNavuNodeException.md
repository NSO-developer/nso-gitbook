# IllegalParentNavuNodeException <a href="#cls-IllegalParentNavuNodeException" id="cls-IllegalParentNavuNodeException"></a>

```java
public class com.tailf.navu.IllegalParentNavuNodeException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

## Members

**Constructors**:

- [IllegalParentNavuNodeException(String, CSNode, NavuList, String)](#m-IllegalParentNavuNodeException-cce18948ed49)

**Methods**:

- [children()](#m-children-7d31300d62c3)
- [getErrorCode()](../conf/ConfException.md#m-getErrorCode-812152fc083a) from ConfException
- [getOpaque()](../conf/ConfException.md#m-getOpaque-92e4945ec92d) from ConfException
- [mk(ConfResponse)](NavuException.md#m-mk-de1cedfc6ea8) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#m-mk-79e69ffbc022) from ConfException
- [mk(String, CSNode, NavuList)](#m-mk-ec0196cd6485)

## Constructors

### IllegalParentNavuNodeException(String, CSNode, NavuList, String) <a href="#m-IllegalParentNavuNodeException-cce18948ed49" id="m-IllegalParentNavuNodeException-cce18948ed49"></a>

```java
protected IllegalParentNavuNodeException(
    String path,
    com.tailf.maapi.MaapiSchemas.CSNode child,
    com.tailf.navu.NavuList parentNode,
    String parentMsg
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuList](NavuList.md#cls-NavuList)

**Parameters**

- `String path`
- `com.tailf.maapi.MaapiSchemas.CSNode child`
- `com.tailf.navu.NavuList parentNode`
- `String parentMsg`


## Methods

### children() <a href="#m-children-7d31300d62c3" id="m-children-7d31300d62c3"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

### mk(String, CSNode, NavuList) <a href="#m-mk-ec0196cd6485" id="m-mk-ec0196cd6485"></a>

```java
public static com.tailf.navu.IllegalParentNavuNodeException mk(
    String path,
    com.tailf.maapi.MaapiSchemas.CSNode child,
    com.tailf.navu.NavuList navuList
)
```

Types: [IllegalParentNavuNodeException](IllegalParentNavuNodeException.md#cls-IllegalParentNavuNodeException), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuList](NavuList.md#cls-NavuList)

**Parameters**

- `String path`
- `com.tailf.maapi.MaapiSchemas.CSNode child`
- `com.tailf.navu.NavuList navuList`
