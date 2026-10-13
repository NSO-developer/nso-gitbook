# IllegalParentNavuNodeException <a href="#illegalparentnavunodeexception-a74e9b9f6d4a" id="illegalparentnavunodeexception-a74e9b9f6d4a"></a>

```java
public class com.tailf.navu.IllegalParentNavuNodeException
    extends com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

## Members

**Constructors**:

- [IllegalParentNavuNodeException\(String, CSNode, NavuList, String\)](#illegalparentnavunodeexception-cce18948ed49)

**Methods**:

- [children\(\)](#children-7d31300d62c3)
- [getErrorCode\(\)](../conf/ConfException.md#geterrorcode-812152fc083a) from ConfException
- [getOpaque\(\)](../conf/ConfException.md#getopaque-92e4945ec92d) from ConfException
- [mk\(ConfResponse\)](NavuException.md#mk-de1cedfc6ea8) from NavuException
- [mk\(ConfResponse, ConfPath\)](../conf/ConfException.md#mk-79e69ffbc022) from ConfException
- [mk\(String, CSNode, NavuList\)](#mk-ec0196cd6485)

## Constructors

### IllegalParentNavuNodeException(String, CSNode, NavuList, String) <a href="#illegalparentnavunodeexception-cce18948ed49" id="illegalparentnavunodeexception-cce18948ed49"></a>

```java
protected IllegalParentNavuNodeException(
    String path,
    com.tailf.maapi.MaapiSchemas.CSNode child,
    com.tailf.navu.NavuList parentNode,
    String parentMsg
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuList](NavuList.md#navulist-472e8d6d3745)

**Parameters**

- `String path`
- `com.tailf.maapi.MaapiSchemas.CSNode child`
- `com.tailf.navu.NavuList parentNode`
- `String parentMsg`


## Methods

### children() <a href="#children-7d31300d62c3" id="children-7d31300d62c3"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

### mk(String, CSNode, NavuList) <a href="#mk-ec0196cd6485" id="mk-ec0196cd6485"></a>

```java
public static com.tailf.navu.IllegalParentNavuNodeException mk(
    String path,
    com.tailf.maapi.MaapiSchemas.CSNode child,
    com.tailf.navu.NavuList navuList
)
```

Types: [IllegalParentNavuNodeException](IllegalParentNavuNodeException.md#illegalparentnavunodeexception-a74e9b9f6d4a), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuList](NavuList.md#navulist-472e8d6d3745)

**Parameters**

- `String path`
- `com.tailf.maapi.MaapiSchemas.CSNode child`
- `com.tailf.navu.NavuList navuList`
