<a id="cls-NavuAction"></a>
# NavuAction

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

- [NavuAction(NavuContext, CSNode, NavuNode, Formats)](#m-navuaction-36aac3975fb6)
- [NavuAction(NavuContext, CSNode, NavuNode, String, Object[])](#m-navuaction-1b629f4351cc)

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
- [encodeValues()](#m-encodevalues-7bd911383b1a)
- [encodeXML()](#m-encodexml-bdbcd52c2505)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [exists()](#m-exists-56968a4c7bda)
- [filterChildren(CSNode)](NavuNode.md#m-filterchildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag()](#m-getchangeflag-33cadf5a32ba)
- [getChanges()](#m-getchanges-9c036516dc6f)
- [getChanges(boolean)](#m-getchanges-5868a18319f7)
- [getChanges(boolean, DiffIterateOperFlag[])](#m-getchanges-71d054341fc5)
- [getChanges(NavuContext)](#m-getchanges-c106383f174d)
- [getChanges(NavuContext, boolean)](#m-getchanges-bcf5b6dbccf2)
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](#m-getchanges-9f13a683b086)
- [getConfPath()](NavuNode.md#m-getconfpath-c7ca3cb63c17) from NavuNode
- [getInfo()](#m-getinfo-259a72b5d74c)
- [getKeyPath()](#m-getkeypath-4c9200912948)
- [getName()](#m-getname-2634b18b4a25)
- [getNavuNode(ConfPath)](#m-getnavunode-d19ad1dd90fc)
- [getParent()](#m-getparent-45c1b196ed70)
- [getRootNS()](#m-getrootns-3f1d054cecd6)
- [getValues(ConfXMLParam[])](#m-getvalues-1eb02439a757)
- [getValues(String)](#m-getvalues-c03de090764d)
- [hashCode()](#m-hashcode-ef797a217903)
- [leaf(ConfNamespace, String)](NavuNode.md#m-leaf-da3758f37f21) from NavuNode
- [leaf(Integer)](#m-leaf-47fda8402c20)
- [leaf(String)](#m-leaf-ac189787d67d)
- [leaf(String, String)](#m-leaf-db53852a70eb)
- [leafList(ConfNamespace, String)](NavuNode.md#m-leaflist-a2d5ad836b3e) from NavuNode
- [leafList(Integer)](#m-leaflist-552c8007ecb4)
- [leafList(String)](#m-leaflist-5811cbb534ec)
- [leafList(String, String)](#m-leaflist-79bb39ee2665)
- [list(ConfNamespace, String)](NavuNode.md#m-list-6b15381fd14a) from NavuNode
- [list(Integer)](#m-list-7dc96bdbb69a)
- [list(String)](#m-list-2c1a74a3cf07)
- [list(String, String)](#m-list-8f28e4f62b19)
- [namespace(String)](NavuNode.md#m-namespace-e29ad62ed095) from NavuNode
- [prefix(String)](NavuNode.md#m-prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall(String)](NavuNode.md#m-preparexmlcall-c22e250f2cac) from NavuNode
- [refresh()](#m-refresh-3852c3f76c8e)
- [reset()](#m-reset-6927918ac70a)
- [select(ConfObject[])](#m-select-336dd76cd112)
- [select(List<String>)](#m-select-e81f36150174)
- [select(String)](#m-select-5031325154b9)
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](#m-setchange-0bbeb54ebc15)
- [setValues(ConfXMLParam[])](NavuNode.md#m-setvalues-50d8edffa795) from NavuNode
- [setValues(String)](NavuNode.md#m-setvalues-3ec9581ce266) from NavuNode
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#m-sharedsetvalues-705549be9df0) from NavuNode
- [sharedSetValues(String)](NavuNode.md#m-sharedsetvalues-ad93c38b671f) from NavuNode
- [stopCdbSession()](#m-stopcdbsession-17418252a986)
- [toString()](#m-tostring-e9d48c5503ef)
- [valueUpdateInd(NavuNode)](#m-valueupdateind-e7cd65f79d78)
- [xPathSelect(String)](#m-xpathselect-0fb26b9f41e0)
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#m-xpathselectiterate-12547f34f47c) from NavuNode

## Constructors

<a id="m-navuaction-36aac3975fb6"></a>
### NavuAction(NavuContext, CSNode, NavuNode, Formats)

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

<a id="m-navuaction-1b629f4351cc"></a>
### NavuAction(NavuContext, CSNode, NavuNode, String, Object[])

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

<a id="m-nodeInfo"></a>
### nodeInfo

```java
protected com.tailf.navu.NavuNodeInfo nodeInfo = null;
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo)

<a id="m-parent"></a>
### parent

```java
protected com.tailf.navu.NavuNode parent = null;
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)


## Methods

<a id="m-call-8169b4e243e4"></a>
### call()

```java
public com.tailf.conf.ConfXMLParam[] call() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Issues an action with empty parameters

**Returns:** result from this action call

**Throws**

- `NavuException`

<a id="m-call-387d37c25830"></a>
### call(ConfXMLParam[])

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

<a id="m-call-803e5e9e2246"></a>
### call(String)

```java
public com.tailf.conf.ConfXMLParam[] call(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Issues an action call with given parameter

**Parameters**

- `String xml` - parameters as corresponding xml string data

**Throws**

- `NavuException`

<a id="m-children-7d31300d62c3"></a>
### children()

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Return the children of this node.

**Returns:** children of this node

<a id="m-container-abb10ecdc3f6"></a>
### container(Integer)

```java
public com.tailf.navu.NavuContainer container(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `Integer key`

<a id="m-container-76f5d191b16d"></a>
### container(String)

```java
public com.tailf.navu.NavuContainer container(String key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String key`

<a id="m-container-b76d38390b19"></a>
### container(String, String)

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

<a id="m-context-0990f1a0bb68"></a>
### context()

```java
public com.tailf.navu.NavuContext context()
```

Types: [NavuContext](NavuContext.md#cls-NavuContext)

Returns the current [`NavuContext`](NavuContext.md#cls-NavuContext) that this node is
 attached to.

**Returns:** current cdbSession().

<a id="m-encodevalues-7bd911383b1a"></a>
### encodeValues()

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeValues() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

<a id="m-encodexml-bdbcd52c2505"></a>
### encodeXML()

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

<a id="m-equals-fcd6492e0d6c"></a>
### equals(Object)

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

<a id="m-exists-56968a4c7bda"></a>
### exists()

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

<a id="m-getchangeflag-33cadf5a32ba"></a>
### getChangeFlag()

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

See: [`NavuNode.getChangeFlag()`](NavuNode.md#m-getchangeflag-33cadf5a32ba)

<a id="m-getchanges-9c036516dc6f"></a>
### getChanges()

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

<a id="m-getchanges-5868a18319f7"></a>
### getChanges(boolean)

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    boolean emitSubtree
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `boolean emitSubtree`

<a id="m-getchanges-71d054341fc5"></a>
### getChanges(boolean, DiffIterateOperFlag[])

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

<a id="m-getchanges-c106383f174d"></a>
### getChanges(NavuContext)

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delcontext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.navu.NavuContext delcontext`

<a id="m-getchanges-bcf5b6dbccf2"></a>
### getChanges(NavuContext, boolean)

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

<a id="m-getchanges-9f13a683b086"></a>
### getChanges(NavuContext, boolean, DiffIterateOperFlag[])

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

<a id="m-getinfo-259a72b5d74c"></a>
### getInfo()

```java
public com.tailf.navu.NavuNodeInfo getInfo()
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo)

<a id="m-getkeypath-4c9200912948"></a>
### getKeyPath()

```java
public String getKeyPath()
```

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public String getName()
```

<a id="m-getnavunode-d19ad1dd90fc"></a>
### getNavuNode(ConfPath)

```java
public com.tailf.navu.NavuNode getNavuNode(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.conf.ConfPath path`

<a id="m-getparent-45c1b196ed70"></a>
### getParent()

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

<a id="m-getrootns-3f1d054cecd6"></a>
### getRootNS()

```java
public com.tailf.conf.ConfNamespace getRootNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

Returns the root namespace of the topmost ancestor.

**Returns:** topmost namespace.

<a id="m-getvalues-1eb02439a757"></a>
### getValues(ConfXMLParam[])

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

<a id="m-getvalues-c03de090764d"></a>
### getValues(String)

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

<a id="m-hashcode-ef797a217903"></a>
### hashCode()

```java
public int hashCode()
```

<a id="m-leaf-47fda8402c20"></a>
### leaf(Integer)

```java
public com.tailf.navu.NavuLeaf leaf(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#cls-NavuLeaf), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `Integer key`

<a id="m-leaf-ac189787d67d"></a>
### leaf(String)

```java
public com.tailf.navu.NavuLeaf leaf(String leaf) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#cls-NavuLeaf), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String leaf`

<a id="m-leaf-db53852a70eb"></a>
### leaf(String, String)

```java
public com.tailf.navu.NavuLeaf leaf(String prefix, String leaf) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#cls-NavuLeaf), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String prefix`
- `String leaf`

<a id="m-leaflist-552c8007ecb4"></a>
### leafList(Integer)

```java
public com.tailf.navu.NavuLeafList leafList(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `Integer key`

<a id="m-leaflist-5811cbb534ec"></a>
### leafList(String)

```java
public com.tailf.navu.NavuLeafList leafList(String leafList) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String leafList`

<a id="m-leaflist-79bb39ee2665"></a>
### leafList(String, String)

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

<a id="m-list-7dc96bdbb69a"></a>
### list(Integer)

```java
public com.tailf.navu.NavuList list(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `Integer key`

<a id="m-list-2c1a74a3cf07"></a>
### list(String)

```java
public com.tailf.navu.NavuList list(String key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String key`

<a id="m-list-8f28e4f62b19"></a>
### list(String, String)

```java
public com.tailf.navu.NavuList list(String prefix, String key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String prefix`
- `String key`

<a id="m-refresh-3852c3f76c8e"></a>
### refresh()

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

<a id="m-reset-6927918ac70a"></a>
### reset()

```java
public void reset()
```

**Not supported does nothing**

<a id="m-select-336dd76cd112"></a>
### select(ConfObject[])

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

<a id="m-select-e81f36150174"></a>
### select(List<String>)

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

<a id="m-select-5031325154b9"></a>
### select(String)

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

<a id="m-setchange-0bbeb54ebc15"></a>
### setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)

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

<a id="m-stopcdbsession-17418252a986"></a>
### stopCdbSession()

```java
public void stopCdbSession()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```

<a id="m-valueupdateind-e7cd65f79d78"></a>
### valueUpdateInd(NavuNode)

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child)
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode child`

<a id="m-xpathselect-0fb26b9f41e0"></a>
### xPathSelect(String)

```java
public java.util.List<com.tailf.navu.NavuNode> xPathSelect(
    String xPath
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String xPath`
