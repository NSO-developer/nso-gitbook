<a id="s-IllegalParentNavuNodeException"></a>
# IllegalParentNavuNodeException

```java
public class com.tailf.navu.IllegalParentNavuNodeException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

## Members

**Constructors**:

- [IllegalParentNavuNodeException(String, CSNode, NavuList, String)](#s-IllegalParentNavuNodeException-1)

**Methods**:

- [children()](#s-children)
- [getErrorCode()](../conf/ConfException.md#s-getErrorCode) from ConfException
- [getOpaque()](../conf/ConfException.md#s-getOpaque) from ConfException
- [mk(ConfResponse)](NavuException.md#s-mk) from NavuException
- [mk(ConfResponse, ConfPath)](../conf/ConfException.md#s-mk-1) from ConfException
- [mk(String, CSNode, NavuList)](#s-mk)

## Constructors

<a id="s-IllegalParentNavuNodeException-1"></a>
### IllegalParentNavuNodeException(String, CSNode, NavuList, String)

```java
protected IllegalParentNavuNodeException(
    String path,
    com.tailf.maapi.MaapiSchemas.CSNode child,
    com.tailf.navu.NavuList parentNode,
    String parentMsg
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuList](NavuList.md#s-NavuList)

**Parameters**

- `String path`
- `com.tailf.maapi.MaapiSchemas.CSNode child`
- `com.tailf.navu.NavuList parentNode`
- `String parentMsg`


## Methods

<a id="s-children"></a>
### children()

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

<a id="s-mk"></a>
### mk(String, CSNode, NavuList)

```java
public static com.tailf.navu.IllegalParentNavuNodeException mk(
    String path,
    com.tailf.maapi.MaapiSchemas.CSNode child,
    com.tailf.navu.NavuList navuList
)
```

Types: [IllegalParentNavuNodeException](IllegalParentNavuNodeException.md#s-IllegalParentNavuNodeException), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuList](NavuList.md#s-NavuList)

**Parameters**

- `String path`
- `com.tailf.maapi.MaapiSchemas.CSNode child`
- `com.tailf.navu.NavuList navuList`
