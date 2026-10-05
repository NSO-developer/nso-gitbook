# NavuNode <a href="#cls-NavuNode" id="cls-NavuNode"></a>

```java
public abstract class com.tailf.navu.NavuNode
```

NavuNode is the base class for all navigation classes like
 [`NavuContainer`](NavuContainer.md#cls-NavuContainer), [`NavuList`](NavuList.md#cls-NavuList), [`NavuLeaf`](NavuLeaf.md#cls-NavuLeaf) etc.

 A `NavuNode` can be explicitly retrieved
 through `NavuContainer#getNavuNode(ConfPath)`.




```
 //attach to MAAPI context
 NavuContainer root = new NavuContainer(new NavuContext(maapi, th));
 NavuNode node =
     root.getNavuNode(new ConfPath("/ncs:devices/device{device0}/config"));
```




 a subclass of NanvuNode represents a *YANG* constructs that
 is either a containment element, (i.e., *container*, *list*),
 a *leaf* that holds a value, or `tailf:action` which
 represents an *action* in the data model.

 The interface specifies the minimum requirement that a
 `NavuNode` should implement. To extend the functionality of the
 `NavuNode` an explicit cast must be performed.




```
 NavuNode node = ...;
 if(node.getInfo().isAction()) {
     NavuAction theAction = (NavuAction)node;
     theAction.call();
 }

 // or
 if(node instanceof NavuAction) {
     NavuAction theAction = (NavuAction)node;
     theAction.call();
 }
```





 The methods in this interface can be divided into four different
 categories.



- *Navigational methods*. Basic navigational
 methods [`container(String)`](NavuNode.md#m-container-76f5d191b16d), [`leaf(String)`](NavuNode.md#m-leaf-ac189787d67d),
 [`list(String)`](NavuNode.md#m-list-2c1a74a3cf07)
 each retrieves a `NavuNode` on the next level.

 [`getParent()`](NavuNode.md#m-getParent-45c1b196ed70) retrieves the `NavuNode`
 for the previous level (parent node). To retrieve all the child elements
 on the next level for a given `NavuNode`, [`children()`](NavuNode.md#m-children-7d31300d62c3)
 returns a `Collection` of `NavuNode`s.

 To retrieve descendants of a `NavuNode` based on a regular
 expression, [`select(String)`](NavuNode.md#m-select-5031325154b9) (or an overloaded variant) can be used.
- *Informational methods*. Provide information for a
 `NavuNode`.
 [`getInfo()`](NavuNode.md#m-getInfo-259a72b5d74c), [`getKeyPath()`](NavuNode.md#m-getKeyPath-4c9200912948), [`getName()`](NavuNode.md#m-getName-2634b18b4a25),
 [`getRootNS()`](NavuNode.md#m-getRootNS-3f1d054cecd6).
- *Context specific methods*. Certain methods are only useful
 depending on the currently attached context.
 The current context is retrieved through `context()` method.

 Some MAAPI-specific methods are [`NavuNode#getChangeFlag()`](NavuNode.md#m-getChangeFlag-33cadf5a32ba),
 `getChanges(NavuContext)` and [`xPathSelect(String)`](NavuNode.md#m-xPathSelect-0fb26b9f41e0).
- *Data reading/writing methods*. Methods such as
 [`getValues(String)`](NavuNode.md#m-getValues-c03de090764d) and [`setValues(String)`](NavuNode.md#m-setValues-3ec9581ce266).



 There are also methods that does not fall into the above categories,
 such as [`encodeXML()`](NavuNode.md#m-encodeXML-bdbcd52c2505) which is a helpful method in conjunction
 with `getValues()` to extract a sub-tree.

**Related classes**

- [NavuAction](NavuAction.md#cls-NavuAction)
- [NavuContainer](NavuContainer.md#cls-NavuContainer)
- [NavuLeaf](NavuLeaf.md#cls-NavuLeaf)
- [NavuList](NavuList.md#cls-NavuList)

## Members

**Constructors**:

- [NavuNode()](#m-NavuNode-ecdbaac8b891)

**Fields**:

- [arguments](#m-arguments)
- [change](#m-change)
- [context](#m-context)
- [fmt](#m-fmt)
- [mountId](#m-mountId)
- [myConfPath](#m-myConfPath)
- [node](#m-node)
- [parent](#m-parent)

**Methods**:

- [children()](#m-children-7d31300d62c3)
- [container(ConfNamespace, String)](#m-container-31c604ba30e3)
- [container(Integer)](#m-container-abb10ecdc3f6)
- [container(String)](#m-container-76f5d191b16d)
- [context()](#m-context-0990f1a0bb68)
- [encodeValues()](#m-encodeValues-7bd911383b1a)
- [encodeXML()](#m-encodeXML-bdbcd52c2505)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [exists()](#m-exists-56968a4c7bda)
- [filterChildren(CSNode)](#m-filterChildren-e72b7b1ab25d)
- [getChangeFlag()](#m-getChangeFlag-33cadf5a32ba)
- [getChanges(NavuContext)](#m-getChanges-c106383f174d)
- [getChanges(NavuContext, boolean)](#m-getChanges-bcf5b6dbccf2)
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](#m-getChanges-9f13a683b086)
- [getConfPath()](#m-getConfPath-c7ca3cb63c17)
- [getInfo()](#m-getInfo-259a72b5d74c)
- [getKeyPath()](#m-getKeyPath-4c9200912948)
- [getName()](#m-getName-2634b18b4a25)
- [getNavuNode(ConfPath)](#m-getNavuNode-d19ad1dd90fc)
- [getParent()](#m-getParent-45c1b196ed70)
- [getRootNS()](#m-getRootNS-3f1d054cecd6)
- [getValues(ConfXMLParam[])](#m-getValues-1eb02439a757)
- [getValues(String)](#m-getValues-c03de090764d)
- [hashCode()](#m-hashCode-ef797a217903)
- [leaf(ConfNamespace, String)](#m-leaf-da3758f37f21)
- [leaf(Integer)](#m-leaf-47fda8402c20)
- [leaf(String)](#m-leaf-ac189787d67d)
- [leafList(ConfNamespace, String)](#m-leafList-a2d5ad836b3e)
- [leafList(Integer)](#m-leafList-552c8007ecb4)
- [leafList(String)](#m-leafList-5811cbb534ec)
- [list(ConfNamespace, String)](#m-list-6b15381fd14a)
- [list(Integer)](#m-list-7dc96bdbb69a)
- [list(String)](#m-list-2c1a74a3cf07)
- [namespace(String)](#m-namespace-e29ad62ed095)
- [prefix(String)](#m-prefix-fdd71b8275bb)
- [prepareXMLCall(String)](#m-prepareXMLCall-c22e250f2cac)
- [reset()](#m-reset-6927918ac70a)
- [select(ConfObject[])](#m-select-336dd76cd112)
- [select(List<String>)](#m-select-e81f36150174)
- [select(String)](#m-select-5031325154b9)
- [setValues(ConfXMLParam[])](#m-setValues-50d8edffa795)
- [setValues(String)](#m-setValues-3ec9581ce266)
- [sharedSetValues(ConfXMLParam[])](#m-sharedSetValues-705549be9df0)
- [sharedSetValues(String)](#m-sharedSetValues-ad93c38b671f)
- [stopCdbSession()](#m-stopCdbSession-17418252a986)
- [xPathSelect(String)](#m-xPathSelect-0fb26b9f41e0)
- [xPathSelectIterate(String, NavuNodeSetIterate)](#m-xPathSelectIterate-12547f34f47c)

## Constructors

### NavuNode() <a href="#m-NavuNode-ecdbaac8b891" id="m-NavuNode-ecdbaac8b891"></a>

```java
public NavuNode()
```


## Fields

### arguments <a href="#m-arguments" id="m-arguments"></a>

```java
protected Object[] arguments = null;
```

### change <a href="#m-change" id="m-change"></a>

```java
protected com.tailf.conf.DiffIterateOperFlag change = null;
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

### context <a href="#m-context" id="m-context"></a>

```java
protected com.tailf.navu.NavuContext context = null;
```

Types: [NavuContext](NavuContext.md#cls-NavuContext)

### fmt <a href="#m-fmt" id="m-fmt"></a>

```java
protected String fmt = null;
```

### mountId <a href="#m-mountId" id="m-mountId"></a>

```java
protected java.util.List<String> mountId = null;
```

### myConfPath <a href="#m-myConfPath" id="m-myConfPath"></a>

```java
protected com.tailf.conf.ConfPath myConfPath = null;
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

### node <a href="#m-node" id="m-node"></a>

```java
protected com.tailf.navu.NavuNodeInfo node = null;
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo)

### parent <a href="#m-parent" id="m-parent"></a>

```java
protected com.tailf.navu.NavuNode parent = null;
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)


## Methods

### children() <a href="#m-children-7d31300d62c3" id="m-children-7d31300d62c3"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Returns a collection containing the children of this node.
 For container nodes, the returned collection can contain nodes
 of any type.
 For list nodes, the children are the elements of the list.
 Leaf nodes have no children and will return an empty collection.

**Returns:** the children of this node

### container(ConfNamespace, String) <a href="#m-container-31c604ba30e3" id="m-container-31c604ba30e3"></a>

```java
public com.tailf.navu.NavuContainer container(
    com.tailf.conf.ConfNamespace ns,
    String containerName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `container` with
 the name `containerName`, belonging to the namespace
 `ns`.


 Note that if `containerName` by itself uniquely identifies a
 subordinate container, that container will still have to belong to the
 namespace `ns` contrary to the functionality of the previous
 method using prefix and containerName.

**Parameters**

- `com.tailf.conf.ConfNamespace ns` - the namespace object
- `String containerName` - the name of the subordinate container

**Returns:** reference to a subordinate container node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a container node or if there is no subordinate node
         with the name `containerName` in the namespace
         `ns`

### container(Integer) <a href="#m-container-abb10ecdc3f6" id="m-container-abb10ecdc3f6"></a>

```java
public com.tailf.navu.NavuContainer container(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `container` with
 the hash value `key`.

 The `container` hash value can be obtained as a constant
 from a namespace file generated by `confdc` or
 `ncsc`, or retrieved with one of the methods
 [`ConfNamespace#stringToHash(String)`](../conf/ConfNamespace.md#m-stringToHash-7c2af24796ac) or
 [`MaapiSchemas#stringToHash(String)`](../maapi/MaapiSchemas.md#m-stringToHash-7c2af24796ac).
 It is also possible to access a container based on its name only,
 using the overloaded method [`container(String)`](NavuNode.md#m-container-76f5d191b16d).

**Parameters**

- `Integer key` - hashed name of the container to return

**Returns:** reference to a subordinate container node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a container or if there is no subordinate node
         with the hash value `key`

### container(String) <a href="#m-container-76f5d191b16d" id="m-container-76f5d191b16d"></a>

```java
public com.tailf.navu.NavuContainer container(String key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `container` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate container

**Returns:** reference to a subordinate container node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a container node or if there is no subordinate node
         with the name `key`

### context() <a href="#m-context-0990f1a0bb68" id="m-context-0990f1a0bb68"></a>

```java
public com.tailf.navu.NavuContext context()
```

Types: [NavuContext](NavuContext.md#cls-NavuContext)

Returns the current [`NavuContext`](NavuContext.md#cls-NavuContext) that this node is
 attached to.

**Returns:** The current `NavuContext`.

### encodeValues() <a href="#m-encodeValues-7bd911383b1a" id="m-encodeValues-7bd911383b1a"></a>

```java
public abstract java.util.List<com.tailf.conf.ConfXMLParam> encodeValues() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Encodes the sub-tree including the current `NavuNode`
 as the topmost `NavuNode` as a [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam) array.

 As opposed to [`encodeXML()`](NavuNode.md#m-encodeXML-bdbcd52c2505), the returned [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam)
 array does contain values in the form of
 [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#cls-ConfXMLParamValue)

**Returns:** A list of [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam) objects corresponding to the
          sub-tree of this node, including all values.

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam), [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#cls-ConfXMLParamValue)

### encodeXML() <a href="#m-encodeXML-bdbcd52c2505" id="m-encodeXML-bdbcd52c2505"></a>

```java
public abstract java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Encodes the sub-tree including the current `NavuNode`
 as the topmost `NavuNode` as a [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam) array.

 The returned [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam) array contains no values except
 for list keys. The leaf elements are encoded as
 [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#cls-ConfXMLParamLeaf). Therefore, the returning
 array can be used as a the input parameter to
 `getValues(ConfXMLParam[])` on the current node's parent.




```
 NavuNode node = ...;
 ConfXMLParam[] cxa = node.encodeXML().toArray(new ConfXMLParam[0]);
 // cxa contains a structure that does not contain values except for
 // keys in list elements

 NavuNode parent = node.getParent();
 ConfXMLParam[] cxb = parent.getValues(cxa);
 // cxb contains the same sub-tree with all the values
```

**Returns:** A list of [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam) objects
          corresponding to the sub-tree of this node, with no
          values except list keys.

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam), [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#cls-ConfXMLParamValue)

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Check the equality of this NavuNode against the targeted
 NavuNode.

**Parameters**

- `Object o`

**Returns:** true if this NavuNode represents the same node as
         the targeted NavuNode

### exists() <a href="#m-exists-56968a4c7bda" id="m-exists-56968a4c7bda"></a>

```java
public abstract boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Generic exists test for Navu navigational elements

**Returns:** boolean

**Throws**

- `NavuException`

### filterChildren(CSNode) <a href="#m-filterChildren-e72b7b1ab25d" id="m-filterChildren-e72b7b1ab25d"></a>

```java
protected java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> filterChildren(
    com.tailf.maapi.MaapiSchemas.CSNode node
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### getChangeFlag() <a href="#m-getChangeFlag-33cadf5a32ba" id="m-getChangeFlag-33cadf5a32ba"></a>

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

Returns the latest change that this `NavuNode` has
 been a subject to by a transaction.

**Returns:** Flag for the latest change

**See also:** [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

### getChanges(NavuContext) <a href="#m-getChanges-c106383f174d" id="m-getChanges-c106383f174d"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

Return the descendant `NavuNode`'s
 (including this element) that has been affected by
 changes to the `MAAPI` transaction.

 Since deletes are already removed in current transactions a delete
 context is necessary to retrieve information about delete changes.
 The `delContext` is a NavuContext with a read transaction
 on the running database to read deletes. If null delete changes will not
 be able to be retrieved.

 The default behavior is to emit the affected descendant and
 include all the affected `NavuNode`'s regardless of
 type of change.

 To filter out specific type of change use the methods
 `getChanges(NavuContext, boolean, DiffIterateOperFlag...)`

**Parameters**

- `com.tailf.navu.NavuContext delContext` - NavuContext to retrieve deleted values with.

**Returns:** A list of `NavuNode`'s that has been affected by
 the changes to the current `MAAPI` transaction.

**Throws**

- `NavuException` - Is returned if we try to iterate on a
         transaction which is in the wrong state and not attached.

### getChanges(NavuContext, boolean) <a href="#m-getChanges-bcf5b6dbccf2" id="m-getChanges-bcf5b6dbccf2"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext,
    boolean emitSubTree
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

Return the descendant `NavuNode` including this
 `NavuNode` that has been affected by the
 current *MAAPI* transaction.

 Since deletes are already removed in current transactions a delete
 context is necessary to retrieve information about delete changes.
 The `delContext` is a NavuContext with a read transaction
 on the running database to read deletes. If null delete changes will not
 be able to be retrieved.

 The `emitSubtree` flag specified if the desired sub-tree
 should be included in the return set. If set to `true`
 then the behavior is to include the whole sub-tree of affected
 `NavuNode`'s.

 If set to `false` the sibling changes to the current
 transaction is to only included.

**Parameters**

- `com.tailf.navu.NavuContext delContext` - NavuContext to retrieve deleted values with.
- `boolean emitSubTree` - boolean to control subtree changes

**Returns:** A list of `NavuNode` that has been affected by
          changes to the current `MAAPI` transaction.

**Throws**

- `NavuException` - Is returned if we try to iterate on changes on a
         transaction which is in the wrong state and not attached.

### getChanges(NavuContext, boolean, DiffIterateOperFlag[]) <a href="#m-getChanges-9f13a683b086" id="m-getChanges-9f13a683b086"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext,
    boolean emitSubTree,
    com.tailf.conf.DiffIterateOperFlag[] forOps
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuContext](NavuContext.md#cls-NavuContext), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag), [NavuException](NavuException.md#cls-NavuException)

Return the descendant `NavuNode` including this
 `NavuNode` that has been affected by the
 current *MAAPI* transaction.

 Since deletes are already removed in current transactions a delete
 context is necessary to retrieve information about delete changes.
 The `delContext` is a NavuContext with a read transaction
 on the running database to read deletes. If null delete changes will not
 be able to be retrieved.

 The `emitSubtree` flag specified if the desired sub-tree
 should be included in the return set. If set to `true`
 then the behavior is to include the whole sub-tree of affected
 `NavuNode`'s.

 If set to `false` the sibling `NavuNode`
 that has been affected by changes to the current
 transaction is to be included.

 The `forOps` argument specifies those specific changes
 that the NavuNode previously `NavuNode`'s to be
 included filter out the set
 that does not match the specified arguments.

**Parameters**

- `com.tailf.navu.NavuContext delContext` - NavuContext to retrieve deleted values with.
- `boolean emitSubTree` - boolean to control subtree changes
- `com.tailf.conf.DiffIterateOperFlag[] forOps` - operations for which changes are of interest.

**Returns:** A list of `NavuNode` that has been affected by
          changes to the current `MAAPI` transaction.

**Throws**

- `NavuException` - if we try to iterate on a transaction which is in the wrong
         state and not attached or if delContext is the same as the
         NavuNode context.

### getConfPath() <a href="#m-getConfPath-c7ca3cb63c17" id="m-getConfPath-c7ca3cb63c17"></a>

```java
public com.tailf.conf.ConfPath getConfPath()
```

Types: [ConfPath](../conf/ConfPath.md#cls-ConfPath)

Returns the corresponding ConfPath for the corresponding NavuNode.

 If the NavuNode is the root schema NavuNode i.e the root
 NavuContainer constructed from the schema hash, this node has no
 corresponding ConfPath and null is returned.

**Returns:** ConfPath

### getInfo() <a href="#m-getInfo-259a72b5d74c" id="m-getInfo-259a72b5d74c"></a>

```java
public com.tailf.navu.NavuNodeInfo getInfo()
```

Types: [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo)

Returns the `NaveNodeInfo` regarding this node.

 A `NavuNodeInfo` is an object which further information
 could be retrieved from the current node.

**Returns:** A informational instance about this `NavuNode`

### getKeyPath() <a href="#m-getKeyPath-4c9200912948" id="m-getKeyPath-4c9200912948"></a>

```java
public String getKeyPath()
```

Returns the absolute keypath of this node.

**Returns:** A String representing the absolute keypath that this
         `NavuNode`

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public String getName()
```

Returns the name of this NavuNode.

**Returns:** - the node name.

### getNavuNode(ConfPath) <a href="#m-getNavuNode-d19ad1dd90fc" id="m-getNavuNode-d19ad1dd90fc"></a>

```java
public com.tailf.navu.NavuNode getNavuNode(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfPath](../conf/ConfPath.md#cls-ConfPath), [NavuException](NavuException.md#cls-NavuException)

Retrieve a NavuNode based on the given absolute or relative
 `path`.

 If the `path` is relative it is relative this
 `NavuNode` .

**Parameters**

- `com.tailf.conf.ConfPath path`

**Returns:** `NavuNode` pointed by `path` if it is absolute or
 if relative the `NavuNode` pointed by `path` relative
 this `NavuNode`

**Throws**

- `NavuException` - if the path is invalid according the
 schema or does not lead to a instance node.

### getParent() <a href="#m-getParent-45c1b196ed70" id="m-getParent-45c1b196ed70"></a>

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

Returns the parent of the node.

**Returns:** - this node parent or null if this NavuNode represents
 the root node.

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
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Read an arbitrary set of sub-elements from this `NavuNode`.

 Input array of [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam)
 where desired values to be extracted should be replaced with
 [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#cls-ConfXMLParamLeaf) in the ConfXMLParam array.

 The return value is a copy of the input `ConfXMLParam`
 where instances of `ConfXMLParamLeaf` have been replaced with
 `ConfXMLParamValue`.

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params` - pre-populated array of `ConfXMLParam`

**Returns:** Array of `ConfXMLParam` where
         `ConfXMLParamLeaf` is replaced with
         `ConfXMLParamValue`

**Throws**

- `NavuException` - If the input parameter does
         not conform to the current data model or an error
         occurs during the read.

### getValues(String) <a href="#m-getValues-c03de090764d" id="m-getValues-c03de090764d"></a>

```java
public com.tailf.conf.ConfXMLParam[] getValues(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Read an arbitrary set of sub-elements of a container or list entry.

 The xml string must be pre-populated with tags
 and parameterized values ("?") which indicate that
 the operation should read the values of the corresponding tags.




 NOTE: The specified xml string should not contain the version tag
 (?xml version="1.0" encoding="UTF-8"?) and do not wrap
 xml string with current node tag.

 Example - Get tree in a service model:



```
 list buzz-service {
   key name;
   leaf name {
     type string;
   }
   uses ncs:service-data;
   ncs:servicepoint buzz-service-servicepoint;
   container buzz {
     container servers {
       list server {
         key "srv-name";
         max-elements "64";
         leaf srv-name {
           type string;
         }
         leaf ip {
           type inet:host;
           mandatory true;
         }
         leaf port {
           type inet:port-number;
           default "80";
         }
         container foo {
           leaf bar {
             type int64;
             default "42";
           }
           leaf baz {
             type int64;
             default "7";
           }
         }
         list interface {
           key "if-name";
           max-elements "8";
           leaf if-name {
             type string;
           }
           leaf mtu {
             type int64;
             default "1500";
           }
         }
       }
     }
   }
 }

 NavuContainer buzz =
     ncsRoot.container(buzzService.hash)
            .list(buzzService._buzz_service)
            .elem("service1")
            .container(buzzService._buzz);

 ConfXMLParam[] param =
     buzz.getValues("<buzz xmlns=\"http://com/example/buzzservice\">"
                    + "<servers><server><srv-name>www1</srv-name>"
                    + "<ip>?</ip></server><server>"
                    + "<srv-name>www2</srv-name><ip>?</ip>"
                    + "</server></servers></buzz>");
```

**Parameters**

- `String xml` - XML structure corresponding to the part of the configuration
            tree that is to be fetched. May optionally include the
            root element matching this node, or just the children.

**Throws**

- `NavuException`

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

Return the hashCode of this NavuNode. For most nodes, the hash code is
 based on the [`ConfPath`](../conf/ConfPath.md#cls-ConfPath) of the node. For module
 root containers there is no `ConfPath` and instead the hash
 code is based on the hash code of the module schema.

**Returns:** The hashCode

### leaf(ConfNamespace, String) <a href="#m-leaf-da3758f37f21" id="m-leaf-da3758f37f21"></a>

```java
public com.tailf.navu.NavuLeaf leaf(
    com.tailf.conf.ConfNamespace ns,
    String leafName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#cls-NavuLeaf), [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `leaf` with
 the name `leafName`, belonging to the namespace
 `ns`.


 Note that if `leafName` by itself uniquely identifies a
 subordinate leaf, that leaf will still have to belong to the
 namespace `ns` contrary to the functionality of the previous
 method using prefix and leafName.

**Parameters**

- `com.tailf.conf.ConfNamespace ns` - the namespace object
- `String leafName` - the name of the subordinate leaf

**Returns:** reference to a subordinate leaf node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf node or if there is no subordinate node
         with the name `leafName` in the namespace
         `ns`

### leaf(Integer) <a href="#m-leaf-47fda8402c20" id="m-leaf-47fda8402c20"></a>

```java
public com.tailf.navu.NavuLeaf leaf(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#cls-NavuLeaf), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `leaf` with
 the hash value `key`.

**Parameters**

- `Integer key` - hashed name of the subordinate leaf

**Returns:** reference to a subordinate container node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf node or if there is no subordinate node
         with the hash value `key`

### leaf(String) <a href="#m-leaf-ac189787d67d" id="m-leaf-ac189787d67d"></a>

```java
public com.tailf.navu.NavuLeaf leaf(String key) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#cls-NavuLeaf), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `leaf` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate leaf

**Returns:** reference to a subordinate leaf node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf node or if there is no subordinate node
         with the name `key`

### leafList(ConfNamespace, String) <a href="#m-leafList-a2d5ad836b3e" id="m-leafList-a2d5ad836b3e"></a>

```java
public com.tailf.navu.NavuLeafList leafList(
    com.tailf.conf.ConfNamespace ns,
    String leafListName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `leaf-list` with
 the name `leafListName`, belonging to the namespace
 `ns`.


 Note that if `leafListName` by itself uniquely identifies a
 subordinate leaf-list, that leaf-list will still have to belong to the
 namespace `ns` contrary to the functionality of the previous
 method using prefix and leafListName.

**Parameters**

- `com.tailf.conf.ConfNamespace ns` - the namespace object
- `String leafListName` - the name of the subordinate leaf-list

**Returns:** reference to a subordinate leaf-list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf-list node or if there is no subordinate node
         with the name `leafListName` and `ns`

### leafList(Integer) <a href="#m-leafList-552c8007ecb4" id="m-leafList-552c8007ecb4"></a>

```java
public com.tailf.navu.NavuLeafList leafList(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `leaf-list` with
 the hash value `key`.

**Parameters**

- `Integer key` - hashed name of the subordinate leaf-list

**Returns:** reference to a subordinate leaf-list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf-list node or if there is no subordinate node
         with the hash value `key`

### leafList(String) <a href="#m-leafList-5811cbb534ec" id="m-leafList-5811cbb534ec"></a>

```java
public com.tailf.navu.NavuLeafList leafList(String key) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#cls-NavuLeafList), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `leaf-list` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate leaf-list

**Returns:** reference to a subordinate leaf-list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf-list node or if there is no subordinate node
         with the name `key`

### list(ConfNamespace, String) <a href="#m-list-6b15381fd14a" id="m-list-6b15381fd14a"></a>

```java
public com.tailf.navu.NavuList list(
    com.tailf.conf.ConfNamespace ns,
    String listName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `list` with
 the name `listName`, belonging to the namespace
 `ns`.


 Note that if `listName` by itself uniquely identifies a
 subordinate list, that list will still have to belong to the
 namespace `ns` contrary to the functionality of the previous
 method using prefix and listName.

**Parameters**

- `com.tailf.conf.ConfNamespace ns` - the namespace object
- `String listName` - the name of the subordinate list

**Returns:** reference to a subordinate list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a list node or if there is no subordinate node
         with the name `listName` in the namespace
         `ns`

### list(Integer) <a href="#m-list-7dc96bdbb69a" id="m-list-7dc96bdbb69a"></a>

```java
public com.tailf.navu.NavuList list(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `list` with the
 hash value `key`.

**Parameters**

- `Integer key` - the hashed name of the subordinate list

**Returns:** reference to a subordinate list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a list node or if there is no subordinate node
         with the hash value `key`

### list(String) <a href="#m-list-2c1a74a3cf07" id="m-list-2c1a74a3cf07"></a>

```java
public com.tailf.navu.NavuList list(String key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#cls-NavuList), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `list` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate list

**Returns:** reference to a subordinate list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a list node or if there is no subordinate node
         with the name `key`

### namespace(String) <a href="#m-namespace-e29ad62ed095" id="m-namespace-e29ad62ed095"></a>

```java
public com.tailf.navu.NavuContainer namespace(String ns) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

The namespace specified here will be used when selecting a child
 to this NavuContainer and returns a reference to this NavuContainer
 object according to the given namespace id `ns`.

**Parameters**

- `String ns` - the namespace id

**Returns:** reference to this NavuContainer object

### prefix(String) <a href="#m-prefix-fdd71b8275bb" id="m-prefix-fdd71b8275bb"></a>

```java
public com.tailf.navu.NavuContainer prefix(String nsPrefix) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

The prefix specified here will be used when selecting a child
 to this NavuContainer and returns a reference to this NavuContainer
 object according to the given namespace prefix `nsPrefix`.

 Use this method when only the YANG prefix is known.

**Parameters**

- `String nsPrefix` - the namespace prefix

**Returns:** reference to this NavuContainer object

**Throws**

- `NavuException` - if the namespace for the given prefix
         cannot be found

### prepareXMLCall(String) <a href="#m-prepareXMLCall-c22e250f2cac" id="m-prepareXMLCall-c22e250f2cac"></a>

```java
public com.tailf.navu.PreparedXMLStatement prepareXMLCall(
    String xml
)
    throws com.tailf.navu.NavuException
```

Types: [PreparedXMLStatement](PreparedXMLStatement.md#cls-PreparedXMLStatement), [NavuException](NavuException.md#cls-NavuException)

Creates a parameterized configuration xml in the style of a
 [`setValues(String)`](NavuNode.md#m-setValues-3ec9581ce266) argument. The string "?" denotes a
 parameterized value.

 When the values that correspond to ? are known, they can be set
 using [`PreparedXMLStatement#put(int, String)`](PreparedXMLStatement.md#m-put-f549d0ea766e)
 or [`PreparedXMLStatement#put(int, ConfObject)`](PreparedXMLStatement.md#m-put-472f1342b5b7).

 Once all parameters have been set, the entire xml can be written using
 [`PreparedXMLStatement#setValues()`](PreparedXMLStatement.md#m-setValues-da0bc3c468bf).

 Any parameterized value that is not populated by `put` before
 `setValues` is called, is treated as a
 [`ConfDefault`](../conf/ConfDefault.md#cls-ConfDefault).




```

 PreparedXMLStatement xmlst =
     node.prepareXMLCall("<server><srv-name>?</srv-name>"
                         + "<ip>?</ip>"
                         + "<port>?</port>"
                         + "</server>");

 xmlst.put(0, new ConfBuf("www1"));
 xmlst.put(1, new ConfIPv4(new int[] { 192, 168, 10, 12 });
 xmlst.put(2, new ConfUInt16(80));
 xmlst.setValues();
```

**Parameters**

- `String xml` - Parameterized xml string.

**See also:** [`PreparedXMLStatement`](PreparedXMLStatement.md#cls-PreparedXMLStatement)

### reset() <a href="#m-reset-6927918ac70a" id="m-reset-6927918ac70a"></a>

```java
public abstract void reset()
```

When navigating through NAVU to a certain location. The sub-tree
 from a NavuNode start to finish is populated in a lazy fashion.
 It does that only once and caches the data as available paths.

 To clear this cache and indicating NAVU that the underlying
 store has been altered by a second transaction  the reset method
 is used to result in further invocation of the NavuNode operations
 re-read the values or possible paths to the cache.

### select(ConfObject[]) <a href="#m-select-336dd76cd112" id="m-select-336dd76cd112"></a>

```java
public abstract java.util.Collection<com.tailf.navu.NavuNode> select(
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
public abstract java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `java.util.List<String> query` - a list of regular expression.

**Returns:** a collection a nodes marching the query

### select(String) <a href="#m-select-5031325154b9" id="m-select-5031325154b9"></a>

```java
public abstract java.util.Collection<com.tailf.navu.NavuNode> select(
    String query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String query` - a "/" separated regular expression.

**Returns:** a collection a nodes marching the query

### setValues(ConfXMLParam[]) <a href="#m-setValues-50d8edffa795" id="m-setValues-50d8edffa795"></a>

```java
public void setValues(com.tailf.conf.ConfXMLParam[] params) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Set arbitrary sub-elements of a container or list entry.

 The [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam) array must be populated with values
 according to the specification of the `ConfXMLParam`
 array structure.

 If the container or list entry itself, or any sub-elements
 that are specified as existing, do not exist before this
 call, they will be created, otherwise the existing values will
 be updated.

 Both mandatory and optional elements may be
 omitted from the array, and all omitted elements are left unchanged.

 To actually delete a non-mandatory leaf or presence container,
 [`ConfNoExists`](../conf/ConfNoExists.md#cls-ConfNoExists) should be used in the corresponding
 [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#cls-ConfXMLParamValue).

 For a list entry, the key values can be specified either in the
 path or via key elements in `ConfXMLParamValue` -
 if the values are in the path, the key elements can be omitted
 from the array. For sub-lists present in the array, the key elements
 must of course always also be present though,
 immediately following the [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#cls-ConfXMLParamStart)
 element and in the order defined by the data model.

 For a list without keys the "pseudo" key may (or in some cases must)
 be present in the array, but of
 course there is no tag value for it, since it isn't present in the
 data model. In this case we must use a tag value of
 0, i.e., it can be set with code like:




```
 ConfXMLParam[] p = new ConfXMLParam[7];

 p[1] = new ConfXMLParam(hash, 0, new ConfInt64(42));
```

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params` - `ConfXMLParam` array containing configuration to be set.

**Throws**

- `NavuException`

### setValues(String) <a href="#m-setValues-3ec9581ce266" id="m-setValues-3ec9581ce266"></a>

```java
public void setValues(String xml) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Set arbitrary sub-elements of a container or list entry.

 This method shares the same behavior as
 `setValues(ConfXMLParam[])` but the input parameter is
 an *XML* string.

 The *XML* string passed as the input parameter
 should reflect the equivalent [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam) array structure.

 Example ConfXMLParam array:



```

 ConfXMLParam[] p = new ConfXMLParam[12];
 final int hash = new Ncs().hash();
 p[0] = new ConfXMLParamStart(hash, Ncs._config);
 final int hash2 = new Foo().hash();
 p[1] = new ConfXMLParamStart(hash2, Foo._interface);
 p[2] = new ConfXMLParamStart(hash2, Foo._buzz);
 p[3] = new ConfXMLParamStart(hash2, Foo._servers);
 p[4] = new ConfXMLParamStart(hash2, Foo._server);
 p[5] = new ConfXMLParamValue(hash2, Foo._srv_name, new ConfBuf("www"));
 p[6] = new ConfXMLParamValue(hash2, Foo._port, new ConfUInt16(80));
 p[7] = new ConfXMLParamStop(hash2, Foo._server);
 p[8] = new ConfXMLParamStop(hash2, Foo._servers);
 p[9] = new ConfXMLParamStop(hash2, Foo._buzz);
 p[10] = new ConfXMLParamStop(hash2, Foo._interface);
 p[11] = new ConfXMLParamStop(hash, Ncs._config);
```



 And its XML string representation:



```

 <ncs:config xmlns:ncs="http://tail-f.com/ns/ncs">
   <foo:interface xmlns:foo="http://acme.com/foo">
     <foo:buzz>
       <foo:servers>
         <foo:server>
           <foo:srv-name>www</foo:srv-name>
           <foo:port>80</foo:port>
         </foo:server>
       </foo:servers>
     </foo:buzz>
   </foo:interface>
 </ncs:config>
```




 The specified *XML* string should not contain the "version" tag
 *(?xml version="1.0" encoding="UTF-8"?)*, the method will
 append it.

 The values that are to be set must be legal string representations
 according to their respective types. The value strings will be validated
 against the current the schema and the operation will fail if the string
 representations are incorrect.

 Example - Populate tree in a service model:



```
 list buzz-service {
   key name;
   leaf name {
     type string;
   }
   uses ncs:service-data;
   ncs:servicepoint buzz-service-servicepoint;
   container buzz {
     container servers {
       list server {
         key "srv-name";
         max-elements "64";
         leaf srv-name {
           type string;
         }
         leaf ip {
           type inet:host;
           mandatory true;
         }
         leaf port {
           type inet:port-number;
           default "80";
         }
         container foo {
           leaf bar {
             type int64;
             default "42";
           }
           leaf baz {
             type int64;
             default "7";
           }
         }
         list interface {
           key "if-name";
           max-elements "8";
           leaf if-name {
             type string;
           }
           leaf mtu {
             type int64;
             default "1500";
           }
         }
       }
     }
   }
 }

 NavuContainer buzz =
     ncsRoot.container(buzzService.hash)
            .list(buzzService._buzz_service)
            .create("service1")
            .container(buzzService._buzz);


 buzz.setValues("<servers><server><srv-name>www1</srv-name>"
                + "<ip>192.178.0.1</ip>"
                + "<port>80</port>"
                + "<foo><bar>55</bar>"
                + "<baz>44</baz></foo>"
                + "<interface><if-name>eth0</if-name>"
                + "<mtu>1500</mtu></interface>"
                + "<interface><if-name>eth1</if-name>"
                + "<mtu>1600</mtu></interface></server>"
                + "<server><srv-name>www2</srv-name>"
                + "<ip>192.178.0.2</ip>"
                + "<port>8080</port>"
                + "<foo><bar>66</bar>"
                + "<baz>55</baz></foo>"
                + "<interface><if-name>eth0</if-name>"
                + "<mtu>1500</mtu></interface>"
                + "<interface><if-name>eth1</if-name>"
                + "<mtu>1600</mtu>"
                + "</interface></server></servers>");
```




 For operational data with lists without keys, list instances cannot be
 created without passing a pseudo-key. This pseudo-key is
 used to identify which item in the list to set or update.
 The pseudo-key has to be specified in the supplied xml-string and is
 identified by the
 tailf-navu-pseudo-key1/tailf-navu-pseudo-key
 tag. Internally the pseudo-key value is represented as a ConfInt64 type.

**Parameters**

- `String xml` - XML structure corresponding values that will be set.
            May optionally include the root element matching this
            node, or just the children.

**See also:** [`setValues(ConfXMLParam[])`](NavuNode.md#m-setValues-50d8edffa795), [`ConfXMLParam`](../conf/ConfXMLParam.md#cls-ConfXMLParam)

### sharedSetValues(ConfXMLParam[]) <a href="#m-sharedSetValues-705549be9df0" id="m-sharedSetValues-705549be9df0"></a>

```java
public void sharedSetValues(
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#cls-ConfXMLParam), [NavuException](NavuException.md#cls-NavuException)

Set arbitrary sub-elements of a container or list entry
 with FastMap support, creating backpointers and reference counter.
 All FastMap code shall (in principle) always use this method instead
 of setValues().

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

### sharedSetValues(String) <a href="#m-sharedSetValues-ad93c38b671f" id="m-sharedSetValues-ad93c38b671f"></a>

```java
public void sharedSetValues(String xml) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Set arbitrary sub-elements of a container or list entry
 with FastMap support, creating backpointers and reference counter.
 All FastMap code shall (in principle) always use this method instead
 of setValues().

 This method shares the same behavior as
 `sharedSetValues(ConfXMLParam[])` but the input parameter is
 an *XML* string.

**Parameters**

- `String xml`

### stopCdbSession() <a href="#m-stopCdbSession-17418252a986" id="m-stopCdbSession-17418252a986"></a>

```java
public void stopCdbSession()
```

Closes all CdbSessions for the NavuContainer.  This is only
 necessary the case if the the NavuContainer was created with a
 constructor for CDB access.  In such cases it is important to
 call this method as soon as the NavuContainer has been
 used. The reason for this is to release any locks on the CDB
 database as soon as possible.

 Calling this method several times under the life-cycle of the
 NavuContainer object is supported.

### xPathSelect(String) <a href="#m-xPathSelect-0fb26b9f41e0" id="m-xPathSelect-0fb26b9f41e0"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> xPathSelect(
    String query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Evaluates the XPath path expression `query` and returns
 the resulting node set as list of `NavuNode`'s.

 The expression `query` will be evaluated using this
 node as the context node.

 Example:



```
 NavuContainer =
 root.container(myns._somecontainer1)
     .container(myns._somecontainer2).container(myns._servers);

 // Retrieve all the entries of the server list "server"
 servers.xPathSelect("server");

 // Retrieve all child nodes of servers with srv-name = www1
 servers.xPathSelect("server[srv-name='www1']/*");

 // Retrieve all leaf ip nodes of servers with srv-name = www1
 servers.xPathSelect("server[srv-name='www1']/ip");
```

**Parameters**

- `String query` - XPath 1.0 query

**Returns:** a collection a nodes marching the query

### xPathSelectIterate(String, NavuNodeSetIterate) <a href="#m-xPathSelectIterate-12547f34f47c" id="m-xPathSelectIterate-12547f34f47c"></a>

```java
public void xPathSelectIterate(
    String query,
    com.tailf.navu.NavuNodeSetIterate iterate
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNodeSetIterate](NavuNodeSetIterate.md#cls-NavuNodeSetIterate), [NavuException](NavuException.md#cls-NavuException)

Iterate through a NodeSet based on a supplied XPath query.
 Instead of retrieving a list of nodes as with
 [`xPathSelect(String)`](NavuNode.md#m-xPathSelect-0fb26b9f41e0) in this method a supplied
 callback is called for each node in the result set.
 See [`NavuNodeSetIterate`](NavuNodeSetIterate.md#cls-NavuNodeSetIterate).

**Parameters**

- `String query` - XPath 1.0 query
- `com.tailf.navu.NavuNodeSetIterate iterate` - supplied user code

**Throws**

- `NavuException`
