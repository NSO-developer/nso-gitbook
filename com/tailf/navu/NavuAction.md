<a id="s-NavuAction"></a>
# NavuAction

```java
public class com.tailf.navu.NavuAction
    extends com.tailf.navu.NavuNode
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

This class represents a action modeled in the data model.

 Although the `NavuAction` implements `NavuNode`
 the usage of this class only to call the action with given parameters
 and it is limited in functionality specifies in  `NavuNode`.

## Members

**Constructors**:

- [NavuAction(NavuContext, CSNode, NavuNode, Formats)](#s-NavuAction-1)
- [NavuAction(NavuContext, CSNode, NavuNode, String, Object[])](#s-NavuAction-2)

**Fields**:

- [arguments](NavuNode.md#s-arguments) from NavuNode
- [change](NavuNode.md#s-change) from NavuNode
- [context](NavuNode.md#s-context) from NavuNode
- [fmt](NavuNode.md#s-fmt) from NavuNode
- [mountId](NavuNode.md#s-mountId) from NavuNode
- [myConfPath](NavuNode.md#s-myConfPath) from NavuNode
- [node](NavuNode.md#s-node) from NavuNode
- [nodeInfo](#s-nodeInfo)
- [parent](#s-parent)

**Methods**:

- [call()](#s-call)
- [call(ConfXMLParam[])](#s-call-1)
- [call(String)](#s-call-2)
- [children()](#s-children)
- [container(ConfNamespace, String)](NavuNode.md#s-container) from NavuNode
- [container(Integer)](#s-container)
- [container(String)](#s-container-1)
- [container(String, String)](#s-container-2)
- [context()](#s-context)
- [encodeValues()](#s-encodeValues)
- [encodeXML()](#s-encodeXML)
- [equals(Object)](#s-equals)
- [exists()](#s-exists)
- [filterChildren(CSNode)](NavuNode.md#s-filterChildren) from NavuNode
- [getChangeFlag()](#s-getChangeFlag)
- [getChanges()](#s-getChanges)
- [getChanges(boolean)](#s-getChanges-1)
- [getChanges(boolean, DiffIterateOperFlag[])](#s-getChanges-2)
- [getChanges(NavuContext)](#s-getChanges-3)
- [getChanges(NavuContext, boolean)](#s-getChanges-4)
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](#s-getChanges-5)
- [getConfPath()](NavuNode.md#s-getConfPath) from NavuNode
- [getInfo()](#s-getInfo)
- [getKeyPath()](#s-getKeyPath)
- [getName()](#s-getName)
- [getNavuNode(ConfPath)](#s-getNavuNode)
- [getParent()](#s-getParent)
- [getRootNS()](#s-getRootNS)
- [getValues(ConfXMLParam[])](#s-getValues)
- [getValues(String)](#s-getValues-1)
- [hashCode()](#s-hashCode)
- [leaf(ConfNamespace, String)](NavuNode.md#s-leaf) from NavuNode
- [leaf(Integer)](#s-leaf)
- [leaf(String)](#s-leaf-1)
- [leaf(String, String)](#s-leaf-2)
- [leafList(ConfNamespace, String)](NavuNode.md#s-leafList) from NavuNode
- [leafList(Integer)](#s-leafList)
- [leafList(String)](#s-leafList-1)
- [leafList(String, String)](#s-leafList-2)
- [list(ConfNamespace, String)](NavuNode.md#s-list) from NavuNode
- [list(Integer)](#s-list)
- [list(String)](#s-list-1)
- [list(String, String)](#s-list-2)
- [namespace(String)](NavuNode.md#s-namespace) from NavuNode
- [prefix(String)](NavuNode.md#s-prefix) from NavuNode
- [prepareXMLCall(String)](NavuNode.md#s-prepareXMLCall) from NavuNode
- [refresh()](#s-refresh)
- [reset()](#s-reset)
- [select(ConfObject[])](#s-select)
- [select(List<String>)](#s-select-1)
- [select(String)](#s-select-2)
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](#s-setChange)
- [setValues(ConfXMLParam[])](NavuNode.md#s-setValues) from NavuNode
- [setValues(String)](NavuNode.md#s-setValues-1) from NavuNode
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#s-sharedSetValues) from NavuNode
- [sharedSetValues(String)](NavuNode.md#s-sharedSetValues-1) from NavuNode
- [stopCdbSession()](#s-stopCdbSession)
- [toString()](#s-toString)
- [valueUpdateInd(NavuNode)](#s-valueUpdateInd)
- [xPathSelect(String)](#s-xPathSelect)
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#s-xPathSelectIterate) from NavuNode

## Constructors

<a id="s-NavuAction-1"></a>
### NavuAction(NavuContext, CSNode, NavuNode, Formats)

```java
protected NavuAction(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode csNode,
    com.tailf.navu.NavuNode parent,
    com.tailf.navu.KeyPath2NavuNode.Formats fs
)
```

Types: [NavuContext](NavuContext.md#s-NavuContext), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode), [Formats](KeyPath2NavuNode/Formats.md#s-Formats)

KeyPath2NavuNode specific constructor

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode csNode`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.navu.KeyPath2NavuNode.Formats fs`

<a id="s-NavuAction-2"></a>
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

Types: [NavuContext](NavuContext.md#s-NavuContext), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode csNode`
- `com.tailf.navu.NavuNode parent`
- `String pathfmt`
- `Object[] args`


## Fields

<a id="s-nodeInfo"></a>
### nodeInfo

```java
protected com.tailf.navu.NavuNodeInfo nodeInfo = null;
```

Types: [NavuNodeInfo](NavuNodeInfo.md#s-NavuNodeInfo)

<a id="s-parent"></a>
### parent

```java
protected com.tailf.navu.NavuNode parent = null;
```

Types: [NavuNode](NavuNode.md#s-NavuNode)


## Methods

<a id="s-call"></a>
### call()

```java
public com.tailf.conf.ConfXMLParam[] call() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

Issues an action with empty parameters

**Returns:** result from this action call

**Throws**

- `NavuException`

<a id="s-call-1"></a>
### call(ConfXMLParam[])

```java
public com.tailf.conf.ConfXMLParam[] call(
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

Issues an action call with given parameters

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params` - parameters to the action call

**Throws**

- `NavuException` - if the NavuContext is not created with
 Maapi

<a id="s-call-2"></a>
### call(String)

```java
public com.tailf.conf.ConfXMLParam[] call(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

Issues an action call with given parameter

**Parameters**

- `String xml` - parameters as corresponding xml string data

**Throws**

- `NavuException`

<a id="s-children"></a>
### children()

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

Return the children of this node.

**Returns:** children of this node

<a id="s-container"></a>
### container(Integer)

```java
public com.tailf.navu.NavuContainer container(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `Integer key`

<a id="s-container-1"></a>
### container(String)

```java
public com.tailf.navu.NavuContainer container(String key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String key`

<a id="s-container-2"></a>
### container(String, String)

```java
public com.tailf.navu.NavuContainer container(
    String prefix,
    String key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String prefix`
- `String key`

<a id="s-context"></a>
### context()

```java
public com.tailf.navu.NavuContext context()
```

Types: [NavuContext](NavuContext.md#s-NavuContext)

Returns the current [`NavuContext`](NavuContext.md#s-NavuContext) that this node is
 attached to.

**Returns:** current cdbSession().

<a id="s-encodeValues"></a>
### encodeValues()

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeValues() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

<a id="s-encodeXML"></a>
### encodeXML()

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuAction`
 for equality.
 Returns `true` if the given object is also a
 `NavuAction` and it has the same [`ConfPath`](../conf/ConfPath.md#s-ConfPath) as this
 `NavuAction`.

**Parameters**

- `Object o` - the object to be compared for equality with this
          `NavuAction`

**Returns:** `true` if the specified object is equal to this
         `NavuAction`

<a id="s-exists"></a>
### exists()

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

<a id="s-getChangeFlag"></a>
### getChangeFlag()

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

See: [`NavuNode.getChangeFlag()`](NavuNode.md#s-getChangeFlag)

<a id="s-getChanges"></a>
### getChanges()

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

<a id="s-getChanges-1"></a>
### getChanges(boolean)

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    boolean emitSubtree
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `boolean emitSubtree`

<a id="s-getChanges-2"></a>
### getChanges(boolean, DiffIterateOperFlag[])

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    boolean emitSubtree,
    com.tailf.conf.DiffIterateOperFlag[] forOps
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `boolean emitSubtree`
- `com.tailf.conf.DiffIterateOperFlag[] forOps`

<a id="s-getChanges-3"></a>
### getChanges(NavuContext)

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delcontext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuContext](NavuContext.md#s-NavuContext), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuContext delcontext`

<a id="s-getChanges-4"></a>
### getChanges(NavuContext, boolean)

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delcontext,
    boolean emitSubtree
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuContext](NavuContext.md#s-NavuContext), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuContext delcontext`
- `boolean emitSubtree`

<a id="s-getChanges-5"></a>
### getChanges(NavuContext, boolean, DiffIterateOperFlag[])

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext,
    boolean emitSubtree,
    com.tailf.conf.DiffIterateOperFlag[] forOps
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuContext](NavuContext.md#s-NavuContext), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuContext delContext`
- `boolean emitSubtree`
- `com.tailf.conf.DiffIterateOperFlag[] forOps`

<a id="s-getInfo"></a>
### getInfo()

```java
public com.tailf.navu.NavuNodeInfo getInfo()
```

Types: [NavuNodeInfo](NavuNodeInfo.md#s-NavuNodeInfo)

<a id="s-getKeyPath"></a>
### getKeyPath()

```java
public String getKeyPath()
```

<a id="s-getName"></a>
### getName()

```java
public String getName()
```

<a id="s-getNavuNode"></a>
### getNavuNode(ConfPath)

```java
public com.tailf.navu.NavuNode getNavuNode(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfPath](../conf/ConfPath.md#s-ConfPath), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.conf.ConfPath path`

<a id="s-getParent"></a>
### getParent()

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

<a id="s-getRootNS"></a>
### getRootNS()

```java
public com.tailf.conf.ConfNamespace getRootNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

Returns the root namespace of the topmost ancestor.

**Returns:** topmost namespace.

<a id="s-getValues"></a>
### getValues(ConfXMLParam[])

```java
public com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] param
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

Invokes or *call* an action defined in the data model (see
 `tailf_yang_extensions(5)`).
 The params and values arrays are the
 parameters for and results from the action, respectively, and use the
 [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam).

**Parameters**

- `com.tailf.conf.ConfXMLParam[] param`

<a id="s-getValues-1"></a>
### getValues(String)

```java
public com.tailf.conf.ConfXMLParam[] getValues(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

Invokes or *call* an action defined in the data model (see
 `tailf_yang_extensions(5)`).

 The *XML* input value to this action is the
 eqvivalent `ConfXMLParam[]` structure.

 The retrn uarrays are the parameters for and results
 from the action, respectively, and use the
 [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam).

**Parameters**

- `String xml` - XML string representation as the input values to
 this `action`

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam)

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-leaf"></a>
### leaf(Integer)

```java
public com.tailf.navu.NavuLeaf leaf(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#s-NavuLeaf), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `Integer key`

<a id="s-leaf-1"></a>
### leaf(String)

```java
public com.tailf.navu.NavuLeaf leaf(String leaf) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#s-NavuLeaf), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String leaf`

<a id="s-leaf-2"></a>
### leaf(String, String)

```java
public com.tailf.navu.NavuLeaf leaf(String prefix, String leaf) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#s-NavuLeaf), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String prefix`
- `String leaf`

<a id="s-leafList"></a>
### leafList(Integer)

```java
public com.tailf.navu.NavuLeafList leafList(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#s-NavuLeafList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `Integer key`

<a id="s-leafList-1"></a>
### leafList(String)

```java
public com.tailf.navu.NavuLeafList leafList(String leafList) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#s-NavuLeafList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String leafList`

<a id="s-leafList-2"></a>
### leafList(String, String)

```java
public com.tailf.navu.NavuLeafList leafList(
    String prefix,
    String leafList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#s-NavuLeafList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String prefix`
- `String leafList`

<a id="s-list"></a>
### list(Integer)

```java
public com.tailf.navu.NavuList list(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#s-NavuList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `Integer key`

<a id="s-list-1"></a>
### list(String)

```java
public com.tailf.navu.NavuList list(String key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#s-NavuList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String key`

<a id="s-list-2"></a>
### list(String, String)

```java
public com.tailf.navu.NavuList list(String prefix, String key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#s-NavuList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String prefix`
- `String key`

<a id="s-refresh"></a>
### refresh()

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

<a id="s-reset"></a>
### reset()

```java
public void reset()
```

**Not supported does nothing**

<a id="s-select"></a>
### select(ConfObject[])

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    com.tailf.conf.ConfObject[] query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfObject](../conf/ConfObject.md#s-ConfObject), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.conf.ConfObject[] query`

**Returns:** a collection a nodes matching a Regular Expression query

<a id="s-select-1"></a>
### select(List<String>)

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Not supported returns only an empty Collection**

**Parameters**

- `java.util.List<String> query`

<a id="s-select-2"></a>
### select(String)

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    String query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Not supported returns only an empty Collection**

**Parameters**

- `String query`

<a id="s-setChange"></a>
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

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfObject](../conf/ConfObject.md#s-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag), [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuContext](NavuContext.md#s-NavuContext), [NavuException](NavuException.md#s-NavuException)

Sets the change type on a node.

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

**Returns:** the actual NavuNode that was updated.

**Throws**

- `NavuException`

<a id="s-stopCdbSession"></a>
### stopCdbSession()

```java
public void stopCdbSession()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-valueUpdateInd"></a>
### valueUpdateInd(NavuNode)

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child)
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuNode child`

<a id="s-xPathSelect"></a>
### xPathSelect(String)

```java
public java.util.List<com.tailf.navu.NavuNode> xPathSelect(
    String xPath
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String xPath`
