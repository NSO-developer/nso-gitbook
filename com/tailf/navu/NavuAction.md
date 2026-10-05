# NavuAction <a href="#cls-NavuAction" id="cls-NavuAction"></a>

```java
public class com.tailf.navu.NavuAction
    extends com.tailf.navu.NavuNode
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

This class represents a action modeled in the data model.

 Although the `NavuAction` implements `NavuNode`
 the usage of this class only to call the action with given parameters
 and it is limited in functionality specifies in  `NavuNode`.

## Members

**Constructors**:

- [NavuAction(NavuContext, CSNode, NavuNode, Formats)](#m-NavuAction-36aac3975fb6)
- [NavuAction(NavuContext, CSNode, NavuNode, String, Object[])](#m-NavuAction-1b629f4351cc)

**Fields**:

- [arguments](NavuNode.md#m-arguments) from NavuNode
- [change](NavuNode.md#m-change) from NavuNode
- [context](NavuNode.md#m-context) from NavuNode
- [fmt](NavuNode.md#m-fmt) from NavuNode
- [mountId](NavuNode.md#m-mountId) from NavuNode
- [myConfPath](NavuNode.md#m-myConfPath) from NavuNode
- [node](NavuNode.md#m-node) from NavuNode
- [nodeInfo](#m-nodeInfo)
- [parent](#m-parent)

**Methods**:

- [call()](#m-call-8169b4e243e4)
- [call(ConfXMLParam[])](#m-call-387d37c25830)
- [call(String)](#m-call-803e5e9e2246)
- [children()](#m-children-7d31300d62c3)
- [container(ConfNamespace, String)](NavuNode.md#m-container-31c604ba30e3) from NavuNode
- [container(Integer)](#m-container-abb10ecdc3f6)
- [container(String)](#m-container-76f5d191b16d)
- [container(String, String)](#m-container-b76d38390b19)
- [context()](#m-context-0990f1a0bb68)
- [encodeValues()](#m-encodeValues-7bd911383b1a)
- [encodeXML()](#m-encodeXML-bdbcd52c2505)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [exists()](#m-exists-56968a4c7bda)
- [filterChildren(CSNode)](NavuNode.md#m-filterChildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag()](#m-getChangeFlag-33cadf5a32ba)
- [getChanges()](#m-getChanges-9c036516dc6f)
- [getChanges(boolean)](#m-getChanges-5868a18319f7)
- [getChanges(boolean, DiffIterateOperFlag[])](#m-getChanges-71d054341fc5)
- [getChanges(NavuContext)](#m-getChanges-c106383f174d)
- [getChanges(NavuContext, boolean)](#m-getChanges-bcf5b6dbccf2)
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](#m-getChanges-9f13a683b086)
- [getConfPath()](NavuNode.md#m-getConfPath-c7ca3cb63c17) from NavuNode
- [getInfo()](#m-getInfo-259a72b5d74c)
- [getKeyPath()](#m-getKeyPath-4c9200912948)
- [getName()](#m-getName-2634b18b4a25)
- [getNavuNode(ConfPath)](#m-getNavuNode-d19ad1dd90fc)
- [getParent()](#m-getParent-45c1b196ed70)
- [getRootNS()](#m-getRootNS-3f1d054cecd6)
- [getValues(ConfXMLParam[])](#m-getValues-1eb02439a757)
- [getValues(String)](#m-getValues-c03de090764d)
- [hashCode()](#m-hashCode-ef797a217903)
- [leaf(ConfNamespace, String)](NavuNode.md#m-leaf-da3758f37f21) from NavuNode
- [leaf(Integer)](#m-leaf-47fda8402c20)
- [leaf(String)](#m-leaf-ac189787d67d)
- [leaf(String, String)](#m-leaf-db53852a70eb)
- [leafList(ConfNamespace, String)](NavuNode.md#m-leafList-a2d5ad836b3e) from NavuNode
- [leafList(Integer)](#m-leafList-552c8007ecb4)
- [leafList(String)](#m-leafList-5811cbb534ec)
- [leafList(String, String)](#m-leafList-79bb39ee2665)
- [list(ConfNamespace, String)](NavuNode.md#m-list-6b15381fd14a) from NavuNode
- [list(Integer)](#m-list-7dc96bdbb69a)
- [list(String)](#m-list-2c1a74a3cf07)
- [list(String, String)](#m-list-8f28e4f62b19)
- [namespace(String)](NavuNode.md#m-namespace-e29ad62ed095) from NavuNode
- [prefix(String)](NavuNode.md#m-prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall(String)](NavuNode.md#m-prepareXMLCall-c22e250f2cac) from NavuNode
- [refresh()](#m-refresh-3852c3f76c8e)
- [reset()](#m-reset-6927918ac70a)
- [select(ConfObject[])](#m-select-336dd76cd112)
- [select(List<String>)](#m-select-e81f36150174)
- [select(String)](#m-select-5031325154b9)
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](#m-setChange-0bbeb54ebc15)
- [setValues(ConfXMLParam[])](NavuNode.md#m-setValues-50d8edffa795) from NavuNode
- [setValues(String)](NavuNode.md#m-setValues-3ec9581ce266) from NavuNode
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#m-sharedSetValues-705549be9df0) from NavuNode
- [sharedSetValues(String)](NavuNode.md#m-sharedSetValues-ad93c38b671f) from NavuNode
- [stopCdbSession()](#m-stopCdbSession-17418252a986)
- [toString()](#m-toString-e9d48c5503ef)
- [valueUpdateInd(NavuNode)](#m-valueUpdateInd-e7cd65f79d78)
- [xPathSelect(String)](#m-xPathSelect-0fb26b9f41e0)
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#m-xPathSelectIterate-12547f34f47c) from NavuNode

## Constructors

### NavuAction(NavuContext, CSNode, NavuNode, Formats) <a href="#m-NavuAction-36aac3975fb6" id="m-NavuAction-36aac3975fb6"></a>

```java
protected NavuAction(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode csNode,
    com.tailf.navu.NavuNode parent,
    com.tailf.navu.KeyPath2NavuNode.Formats fs
)
```

Types: [NavuContext](NavuContext.md#cls-NavuContext), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode), [Formats](KeyPath2NavuNode/Formats.md#cls-Formats)

KeyPath2NavuNode specific constructor

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode csNode`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.navu.KeyPath2NavuNode.Formats fs`

### NavuAction(NavuContext, CSNode, NavuNode, String, Object[]) <a href="#m-NavuAction-1b629f4351cc" id="m-NavuAction-1b629f4351cc"></a>

```java
protected NavuAction(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode csNode,
    com.tailf.navu.NavuNode parent,
    String pathfmt,
    Object[] args
)
```

Types: [NavuContext](NavuContext.md#cls-NavuContext), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode csNode`
- `com.tailf.navu.NavuNode parent`
- `String pathfmt`
- `Object[] args`


## Fields

### nodeInfo <a href="#m-nodeInfo" id="m-nodeInfo"></a>

```java
protected com.tailf.navu.NavuNodeInfo nodeInfo = null;
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo)

### parent <a href="#m-parent" id="m-parent"></a>

```java
protected com.tailf.navu.NavuNode parent = null;
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)


## Methods

### call() <a href="#m-call-8169b4e243e4" id="m-call-8169b4e243e4"></a>

```java
public com.tailf.conf.ConfXMLParam[] call() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Issues an action with empty parameters

**Returns:** result from this action call

**Throws**

- `NavuException`

### call(ConfXMLParam[]) <a href="#m-call-387d37c25830" id="m-call-387d37c25830"></a>

```java
public com.tailf.conf.ConfXMLParam[] call(
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Issues an action call with given parameters

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params` - parameters to the action call

**Throws**

- `NavuException` - if the NavuContext is not created with
 Maapi

### call(String) <a href="#m-call-803e5e9e2246" id="m-call-803e5e9e2246"></a>

```java
public com.tailf.conf.ConfXMLParam[] call(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Issues an action call with given parameter

**Parameters**

- `String xml` - parameters as corresponding xml string data

**Throws**

- `NavuException`

### children() <a href="#m-children-7d31300d62c3" id="m-children-7d31300d62c3"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Return the children of this node.

**Returns:** children of this node

### container(Integer) <a href="#m-container-abb10ecdc3f6" id="m-container-abb10ecdc3f6"></a>

```java
public com.tailf.navu.NavuContainer container(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `Integer key`

### container(String) <a href="#m-container-76f5d191b16d" id="m-container-76f5d191b16d"></a>

```java
public com.tailf.navu.NavuContainer container(String key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String key`

### container(String, String) <a href="#m-container-b76d38390b19" id="m-container-b76d38390b19"></a>

```java
public com.tailf.navu.NavuContainer container(
    String prefix,
    String key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String prefix`
- `String key`

### context() <a href="#m-context-0990f1a0bb68" id="m-context-0990f1a0bb68"></a>

```java
public com.tailf.navu.NavuContext context()
```

Types: [NavuContext](NavuContext.md#cls-NavuContext)

Returns the current [`NavuContext`](NavuContext.md#cls-NavuContext) that this node is
 attached to.

**Returns:** current cdbSession().

### encodeValues() <a href="#m-encodeValues-7bd911383b1a" id="m-encodeValues-7bd911383b1a"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeValues() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

### encodeXML() <a href="#m-encodeXML-bdbcd52c2505" id="m-encodeXML-bdbcd52c2505"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuAction`
 for equality.
 Returns `true` if the given object is also a
 `NavuAction` and it has the same [`ConfPath`](../conf/ConfPath.md#cls-ConfPath) as this
 `NavuAction`.

**Parameters**

- `Object o` - the object to be compared for equality with this
          `NavuAction`

**Returns:** `true` if the specified object is equal to this
         `NavuAction`

### exists() <a href="#m-exists-56968a4c7bda" id="m-exists-56968a4c7bda"></a>

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

### getChangeFlag() <a href="#m-getChangeFlag-33cadf5a32ba" id="m-getChangeFlag-33cadf5a32ba"></a>

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

See: [`NavuNode.getChangeFlag()`](NavuNode.md#m-getChangeFlag-33cadf5a32ba)

### getChanges() <a href="#m-getChanges-9c036516dc6f" id="m-getChanges-9c036516dc6f"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

### getChanges(boolean) <a href="#m-getChanges-5868a18319f7" id="m-getChanges-5868a18319f7"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    boolean emitSubtree
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `boolean emitSubtree`

### getChanges(boolean, DiffIterateOperFlag[]) <a href="#m-getChanges-71d054341fc5" id="m-getChanges-71d054341fc5"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    boolean emitSubtree,
    com.tailf.conf.DiffIterateOperFlag[] forOps
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `boolean emitSubtree`
- `com.tailf.conf.DiffIterateOperFlag[] forOps`

### getChanges(NavuContext) <a href="#m-getChanges-c106383f174d" id="m-getChanges-c106383f174d"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delcontext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuContext delcontext`

### getChanges(NavuContext, boolean) <a href="#m-getChanges-bcf5b6dbccf2" id="m-getChanges-bcf5b6dbccf2"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delcontext,
    boolean emitSubtree
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuContext delcontext`
- `boolean emitSubtree`

### getChanges(NavuContext, boolean, DiffIterateOperFlag[]) <a href="#m-getChanges-9f13a683b086" id="m-getChanges-9f13a683b086"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext,
    boolean emitSubtree,
    com.tailf.conf.DiffIterateOperFlag[] forOps
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuContext](NavuContext.md#cls-NavuContext), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuContext delContext`
- `boolean emitSubtree`
- `com.tailf.conf.DiffIterateOperFlag[] forOps`

### getInfo() <a href="#m-getInfo-259a72b5d74c" id="m-getInfo-259a72b5d74c"></a>

```java
public com.tailf.navu.NavuNodeInfo getInfo()
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo)

### getKeyPath() <a href="#m-getKeyPath-4c9200912948" id="m-getKeyPath-4c9200912948"></a>

```java
public String getKeyPath()
```

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public String getName()
```

### getNavuNode(ConfPath) <a href="#m-getNavuNode-d19ad1dd90fc" id="m-getNavuNode-d19ad1dd90fc"></a>

```java
public com.tailf.navu.NavuNode getNavuNode(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.conf.ConfPath path`

### getParent() <a href="#m-getParent-45c1b196ed70" id="m-getParent-45c1b196ed70"></a>

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

### getRootNS() <a href="#m-getRootNS-3f1d054cecd6" id="m-getRootNS-3f1d054cecd6"></a>

```java
public com.tailf.conf.ConfNamespace getRootNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

Returns the root namespace of the topmost ancestor.

**Returns:** topmost namespace.

### getValues(ConfXMLParam[]) <a href="#m-getValues-1eb02439a757" id="m-getValues-1eb02439a757"></a>

```java
public com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] param
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Invokes or *call* an action defined in the data model (see
 `tailf_yang_extensions(5)`).
 The params and values arrays are the
 parameters for and results from the action, respectively, and use the
 [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam).

**Parameters**

- `com.tailf.conf.ConfXMLParam[] param`

### getValues(String) <a href="#m-getValues-c03de090764d" id="m-getValues-c03de090764d"></a>

```java
public com.tailf.conf.ConfXMLParam[] getValues(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Invokes or *call* an action defined in the data model (see
 `tailf_yang_extensions(5)`).

 The *XML* input value to this action is the
 eqvivalent `ConfXMLParam[]` structure.

 The retrn uarrays are the parameters for and results
 from the action, respectively, and use the
 [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam).

**Parameters**

- `String xml` - XML string representation as the input values to
 this `action`

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam)

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### leaf(Integer) <a href="#m-leaf-47fda8402c20" id="m-leaf-47fda8402c20"></a>

```java
public com.tailf.navu.NavuLeaf leaf(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#cls-NavuLeaf), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `Integer key`

### leaf(String) <a href="#m-leaf-ac189787d67d" id="m-leaf-ac189787d67d"></a>

```java
public com.tailf.navu.NavuLeaf leaf(String leaf) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#cls-NavuLeaf), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String leaf`

### leaf(String, String) <a href="#m-leaf-db53852a70eb" id="m-leaf-db53852a70eb"></a>

```java
public com.tailf.navu.NavuLeaf leaf(String prefix, String leaf) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#cls-NavuLeaf), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String prefix`
- `String leaf`

### leafList(Integer) <a href="#m-leafList-552c8007ecb4" id="m-leafList-552c8007ecb4"></a>

```java
public com.tailf.navu.NavuLeafList leafList(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `Integer key`

### leafList(String) <a href="#m-leafList-5811cbb534ec" id="m-leafList-5811cbb534ec"></a>

```java
public com.tailf.navu.NavuLeafList leafList(String leafList) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String leafList`

### leafList(String, String) <a href="#m-leafList-79bb39ee2665" id="m-leafList-79bb39ee2665"></a>

```java
public com.tailf.navu.NavuLeafList leafList(
    String prefix,
    String leafList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String prefix`
- `String leafList`

### list(Integer) <a href="#m-list-7dc96bdbb69a" id="m-list-7dc96bdbb69a"></a>

```java
public com.tailf.navu.NavuList list(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `Integer key`

### list(String) <a href="#m-list-2c1a74a3cf07" id="m-list-2c1a74a3cf07"></a>

```java
public com.tailf.navu.NavuList list(String key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String key`

### list(String, String) <a href="#m-list-8f28e4f62b19" id="m-list-8f28e4f62b19"></a>

```java
public com.tailf.navu.NavuList list(String prefix, String key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String prefix`
- `String key`

### refresh() <a href="#m-refresh-3852c3f76c8e" id="m-refresh-3852c3f76c8e"></a>

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

### reset() <a href="#m-reset-6927918ac70a" id="m-reset-6927918ac70a"></a>

```java
public void reset()
```

**Not supported does nothing**

### select(ConfObject[]) <a href="#m-select-336dd76cd112" id="m-select-336dd76cd112"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    com.tailf.conf.ConfObject[] query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.conf.ConfObject[] query`

**Returns:** a collection a nodes matching a Regular Expression query

### select(List<String>) <a href="#m-select-e81f36150174" id="m-select-e81f36150174"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Not supported returns only an empty Collection**

**Parameters**

- `java.util.List<String> query`

### select(String) <a href="#m-select-5031325154b9" id="m-select-5031325154b9"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    String query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Not supported returns only an empty Collection**

**Parameters**

- `String query`

### setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext) <a href="#m-setChange-0bbeb54ebc15" id="m-setChange-0bbeb54ebc15"></a>

```java
public com.tailf.navu.NavuNode setChange(
    java.util.List<com.tailf.conf.ConfObject> kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfValue oldValue,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag), [ConfValue](../conf/ConfValue.md#cls-ConfValue), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

Sets the change type on a node.

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

**Returns:** the actual NavuNode that was updated.

**Throws**

- `NavuException`

### stopCdbSession() <a href="#m-stopCdbSession-17418252a986" id="m-stopCdbSession-17418252a986"></a>

```java
public void stopCdbSession()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### valueUpdateInd(NavuNode) <a href="#m-valueUpdateInd-e7cd65f79d78" id="m-valueUpdateInd-e7cd65f79d78"></a>

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode child`

### xPathSelect(String) <a href="#m-xPathSelect-0fb26b9f41e0" id="m-xPathSelect-0fb26b9f41e0"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> xPathSelect(
    String xPath
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String xPath`
