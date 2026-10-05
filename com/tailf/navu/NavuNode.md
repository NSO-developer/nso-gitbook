# NavuNode <a href="#navunode-73944820c8db" id="navunode-73944820c8db"></a>

```java
public abstract class com.tailf.navu.NavuNode
```

NavuNode is the base class for all navigation classes like
 [`NavuContainer`](NavuContainer.md#navucontainer-8e321756755f), [`NavuList`](NavuList.md#navulist-472e8d6d3745), [`NavuLeaf`](NavuLeaf.md#navuleaf-aa68380b180b) etc.

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
 methods [`container(String)`](NavuNode.md#container-76f5d191b16d), [`leaf(String)`](NavuNode.md#leaf-ac189787d67d),
 [`list(String)`](NavuNode.md#list-2c1a74a3cf07)
 each retrieves a `NavuNode` on the next level.

 [`getParent()`](NavuNode.md#getparent-45c1b196ed70) retrieves the `NavuNode`
 for the previous level (parent node). To retrieve all the child elements
 on the next level for a given `NavuNode`, [`children()`](NavuNode.md#children-7d31300d62c3)
 returns a `Collection` of `NavuNode`s.

 To retrieve descendants of a `NavuNode` based on a regular
 expression, [`select(String)`](NavuNode.md#select-5031325154b9) (or an overloaded variant) can be used.
- *Informational methods*. Provide information for a
 `NavuNode`.
 [`getInfo()`](NavuNode.md#getinfo-259a72b5d74c), [`getKeyPath()`](NavuNode.md#getkeypath-4c9200912948), [`getName()`](NavuNode.md#getname-2634b18b4a25),
 [`getRootNS()`](NavuNode.md#getrootns-3f1d054cecd6).
- *Context specific methods*. Certain methods are only useful
 depending on the currently attached context.
 The current context is retrieved through `context()` method.

 Some MAAPI-specific methods are [`NavuNode#getChangeFlag()`](NavuNode.md#getchangeflag-33cadf5a32ba),
 `getChanges(NavuContext)` and [`xPathSelect(String)`](NavuNode.md#xpathselect-0fb26b9f41e0).
- *Data reading/writing methods*. Methods such as
 [`getValues(String)`](NavuNode.md#getvalues-c03de090764d) and [`setValues(String)`](NavuNode.md#setvalues-3ec9581ce266).



 There are also methods that does not fall into the above categories,
 such as [`encodeXML()`](NavuNode.md#encodexml-bdbcd52c2505) which is a helpful method in conjunction
 with `getValues()` to extract a sub-tree.

**Related classes**

- [NavuAction](NavuAction.md#navuaction-d853bc49f0e8)
- [NavuContainer](NavuContainer.md#navucontainer-8e321756755f)
- [NavuLeaf](NavuLeaf.md#navuleaf-aa68380b180b)
- [NavuList](NavuList.md#navulist-472e8d6d3745)

## Members

**Constructors**:

- [NavuNode()](#navunode-ecdbaac8b891)

**Fields**:

- [arguments](#arguments-28ffa3c54d2c)
- [change](#change-470927160c2a)
- [context](#context-b9bed500f8c9)
- [fmt](#fmt-94d3250bd2b9)
- [mountId](#mountid-a6b63dedba52)
- [myConfPath](#myconfpath-cec7a88dfaf3)
- [node](#node-ff68e6a3ebc6)
- [parent](#parent-26ad1434956a)

**Methods**:

- [children()](#children-7d31300d62c3)
- [container(ConfNamespace, String)](#container-31c604ba30e3)
- [container(Integer)](#container-abb10ecdc3f6)
- [container(String)](#container-76f5d191b16d)
- [context()](#context-0990f1a0bb68)
- [encodeValues()](#encodevalues-7bd911383b1a)
- [encodeXML()](#encodexml-bdbcd52c2505)
- [equals(Object)](#equals-fcd6492e0d6c)
- [exists()](#exists-56968a4c7bda)
- [filterChildren(CSNode)](#filterchildren-e72b7b1ab25d)
- [getChangeFlag()](#getchangeflag-33cadf5a32ba)
- [getChanges(NavuContext)](#getchanges-c106383f174d)
- [getChanges(NavuContext, boolean)](#getchanges-bcf5b6dbccf2)
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](#getchanges-9f13a683b086)
- [getConfPath()](#getconfpath-c7ca3cb63c17)
- [getInfo()](#getinfo-259a72b5d74c)
- [getKeyPath()](#getkeypath-4c9200912948)
- [getName()](#getname-2634b18b4a25)
- [getNavuNode(ConfPath)](#getnavunode-d19ad1dd90fc)
- [getParent()](#getparent-45c1b196ed70)
- [getRootNS()](#getrootns-3f1d054cecd6)
- [getValues(ConfXMLParam[])](#getvalues-1eb02439a757)
- [getValues(String)](#getvalues-c03de090764d)
- [hashCode()](#hashcode-ef797a217903)
- [leaf(ConfNamespace, String)](#leaf-da3758f37f21)
- [leaf(Integer)](#leaf-47fda8402c20)
- [leaf(String)](#leaf-ac189787d67d)
- [leafList(ConfNamespace, String)](#leaflist-a2d5ad836b3e)
- [leafList(Integer)](#leaflist-552c8007ecb4)
- [leafList(String)](#leaflist-5811cbb534ec)
- [list(ConfNamespace, String)](#list-6b15381fd14a)
- [list(Integer)](#list-7dc96bdbb69a)
- [list(String)](#list-2c1a74a3cf07)
- [namespace(String)](#namespace-e29ad62ed095)
- [prefix(String)](#prefix-fdd71b8275bb)
- [prepareXMLCall(String)](#preparexmlcall-c22e250f2cac)
- [reset()](#reset-6927918ac70a)
- [select(ConfObject[])](#select-336dd76cd112)
- [select(List<String>)](#select-e81f36150174)
- [select(String)](#select-5031325154b9)
- [setValues(ConfXMLParam[])](#setvalues-50d8edffa795)
- [setValues(String)](#setvalues-3ec9581ce266)
- [sharedSetValues(ConfXMLParam[])](#sharedsetvalues-705549be9df0)
- [sharedSetValues(String)](#sharedsetvalues-ad93c38b671f)
- [stopCdbSession()](#stopcdbsession-17418252a986)
- [xPathSelect(String)](#xpathselect-0fb26b9f41e0)
- [xPathSelectIterate(String, NavuNodeSetIterate)](#xpathselectiterate-12547f34f47c)

## Constructors

### NavuNode() <a href="#navunode-ecdbaac8b891" id="navunode-ecdbaac8b891"></a>

```java
public NavuNode()
```


## Fields

### arguments <a href="#arguments-28ffa3c54d2c" id="arguments-28ffa3c54d2c"></a>

```java
protected Object[] arguments = null;
```

### change <a href="#change-470927160c2a" id="change-470927160c2a"></a>

```java
protected com.tailf.conf.DiffIterateOperFlag change = null;
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

### context <a href="#context-b9bed500f8c9" id="context-b9bed500f8c9"></a>

```java
protected com.tailf.navu.NavuContext context = null;
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e)

### fmt <a href="#fmt-94d3250bd2b9" id="fmt-94d3250bd2b9"></a>

```java
protected String fmt = null;
```

### mountId <a href="#mountid-a6b63dedba52" id="mountid-a6b63dedba52"></a>

```java
protected java.util.List<String> mountId = null;
```

### myConfPath <a href="#myconfpath-cec7a88dfaf3" id="myconfpath-cec7a88dfaf3"></a>

```java
protected com.tailf.conf.ConfPath myConfPath = null;
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

### node <a href="#node-ff68e6a3ebc6" id="node-ff68e6a3ebc6"></a>

```java
protected com.tailf.navu.NavuNodeInfo node = null;
```

Types: [NavuNodeInfo](NavuNodeInfo.md#navunodeinfo-ee275327d410)

### parent <a href="#parent-26ad1434956a" id="parent-26ad1434956a"></a>

```java
protected com.tailf.navu.NavuNode parent = null;
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)


## Methods

### children() <a href="#children-7d31300d62c3" id="children-7d31300d62c3"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a collection containing the children of this node.
 For container nodes, the returned collection can contain nodes
 of any type.
 For list nodes, the children are the elements of the list.
 Leaf nodes have no children and will return an empty collection.

**Returns:** the children of this node

### container(ConfNamespace, String) <a href="#container-31c604ba30e3" id="container-31c604ba30e3"></a>

```java
public com.tailf.navu.NavuContainer container(
    com.tailf.conf.ConfNamespace ns,
    String containerName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### container(Integer) <a href="#container-abb10ecdc3f6" id="container-abb10ecdc3f6"></a>

```java
public com.tailf.navu.NavuContainer container(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a reference to a subordinate `container` with
 the hash value `key`.

 The `container` hash value can be obtained as a constant
 from a namespace file generated by `confdc` or
 `ncsc`, or retrieved with one of the methods
 [`ConfNamespace#stringToHash(String)`](../conf/ConfNamespace.md#stringtohash-7c2af24796ac) or
 [`MaapiSchemas#stringToHash(String)`](../maapi/MaapiSchemas.md#stringtohash-7c2af24796ac).
 It is also possible to access a container based on its name only,
 using the overloaded method [`container(String)`](NavuNode.md#container-76f5d191b16d).

**Parameters**

- `Integer key` - hashed name of the container to return

**Returns:** reference to a subordinate container node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a container or if there is no subordinate node
         with the hash value `key`

### container(String) <a href="#container-76f5d191b16d" id="container-76f5d191b16d"></a>

```java
public com.tailf.navu.NavuContainer container(String key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a reference to a subordinate `container` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate container

**Returns:** reference to a subordinate container node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a container node or if there is no subordinate node
         with the name `key`

### context() <a href="#context-0990f1a0bb68" id="context-0990f1a0bb68"></a>

```java
public com.tailf.navu.NavuContext context()
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e)

Returns the current [`NavuContext`](NavuContext.md#navucontext-2974e9f92a9e) that this node is
 attached to.

**Returns:** The current `NavuContext`.

### encodeValues() <a href="#encodevalues-7bd911383b1a" id="encodevalues-7bd911383b1a"></a>

```java
public abstract java.util.List<com.tailf.conf.ConfXMLParam> encodeValues() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Encodes the sub-tree including the current `NavuNode`
 as the topmost `NavuNode` as a [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) array.

 As opposed to [`encodeXML()`](NavuNode.md#encodexml-bdbcd52c2505), the returned [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)
 array does contain values in the form of
 [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9)

**Returns:** A list of [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) objects corresponding to the
          sub-tree of this node, including all values.

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9)

### encodeXML() <a href="#encodexml-bdbcd52c2505" id="encodexml-bdbcd52c2505"></a>

```java
public abstract java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Encodes the sub-tree including the current `NavuNode`
 as the topmost `NavuNode` as a [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) array.

 The returned [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) array contains no values except
 for list keys. The leaf elements are encoded as
 [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#confxmlparamleaf-107412653048). Therefore, the returning
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

**Returns:** A list of [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) objects
          corresponding to the sub-tree of this node, with no
          values except list keys.

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9)

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Check the equality of this NavuNode against the targeted
 NavuNode.

**Parameters**

- `Object o`

**Returns:** true if this NavuNode represents the same node as
         the targeted NavuNode

### exists() <a href="#exists-56968a4c7bda" id="exists-56968a4c7bda"></a>

```java
public abstract boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Generic exists test for Navu navigational elements

**Returns:** boolean

**Throws**

- `NavuException`

### filterChildren(CSNode) <a href="#filterchildren-e72b7b1ab25d" id="filterchildren-e72b7b1ab25d"></a>

```java
protected java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> filterChildren(
    com.tailf.maapi.MaapiSchemas.CSNode node
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

### getChangeFlag() <a href="#getchangeflag-33cadf5a32ba" id="getchangeflag-33cadf5a32ba"></a>

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

Returns the latest change that this `NavuNode` has
 been a subject to by a transaction.

**Returns:** Flag for the latest change

**See also:** [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

### getChanges(NavuContext) <a href="#getchanges-c106383f174d" id="getchanges-c106383f174d"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### getChanges(NavuContext, boolean) <a href="#getchanges-bcf5b6dbccf2" id="getchanges-bcf5b6dbccf2"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext,
    boolean emitSubTree
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### getChanges(NavuContext, boolean, DiffIterateOperFlag[]) <a href="#getchanges-9f13a683b086" id="getchanges-9f13a683b086"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext,
    boolean emitSubTree,
    com.tailf.conf.DiffIterateOperFlag[] forOps
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### getConfPath() <a href="#getconfpath-c7ca3cb63c17" id="getconfpath-c7ca3cb63c17"></a>

```java
public com.tailf.conf.ConfPath getConfPath()
```

Types: [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d)

Returns the corresponding ConfPath for the corresponding NavuNode.

 If the NavuNode is the root schema NavuNode i.e the root
 NavuContainer constructed from the schema hash, this node has no
 corresponding ConfPath and null is returned.

**Returns:** ConfPath

### getInfo() <a href="#getinfo-259a72b5d74c" id="getinfo-259a72b5d74c"></a>

```java
public com.tailf.navu.NavuNodeInfo getInfo()
```

Types: [NavuNodeInfo](NavuNodeInfo.md#navunodeinfo-ee275327d410)

Returns the `NaveNodeInfo` regarding this node.

 A `NavuNodeInfo` is an object which further information
 could be retrieved from the current node.

**Returns:** A informational instance about this `NavuNode`

### getKeyPath() <a href="#getkeypath-4c9200912948" id="getkeypath-4c9200912948"></a>

```java
public String getKeyPath()
```

Returns the absolute keypath of this node.

**Returns:** A String representing the absolute keypath that this
         `NavuNode`

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public String getName()
```

Returns the name of this NavuNode.

**Returns:** - the node name.

### getNavuNode(ConfPath) <a href="#getnavunode-d19ad1dd90fc" id="getnavunode-d19ad1dd90fc"></a>

```java
public com.tailf.navu.NavuNode getNavuNode(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### getParent() <a href="#getparent-45c1b196ed70" id="getparent-45c1b196ed70"></a>

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

Returns the parent of the node.

**Returns:** - this node parent or null if this NavuNode represents
 the root node.

### getRootNS() <a href="#getrootns-3f1d054cecd6" id="getrootns-3f1d054cecd6"></a>

```java
public com.tailf.conf.ConfNamespace getRootNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

Returns the root namespace of the topmost ancestor.

**Returns:** topmost namespace.

### getValues(ConfXMLParam[]) <a href="#getvalues-1eb02439a757" id="getvalues-1eb02439a757"></a>

```java
public com.tailf.conf.ConfXMLParam[] getValues(
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Read an arbitrary set of sub-elements from this `NavuNode`.

 Input array of [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)
 where desired values to be extracted should be replaced with
 [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#confxmlparamleaf-107412653048) in the ConfXMLParam array.

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

### getValues(String) <a href="#getvalues-c03de090764d" id="getvalues-c03de090764d"></a>

```java
public com.tailf.conf.ConfXMLParam[] getValues(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

Return the hashCode of this NavuNode. For most nodes, the hash code is
 based on the [`ConfPath`](../conf/ConfPath.md#confpath-327831c6fc7d) of the node. For module
 root containers there is no `ConfPath` and instead the hash
 code is based on the hash code of the module schema.

**Returns:** The hashCode

### leaf(ConfNamespace, String) <a href="#leaf-da3758f37f21" id="leaf-da3758f37f21"></a>

```java
public com.tailf.navu.NavuLeaf leaf(
    com.tailf.conf.ConfNamespace ns,
    String leafName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#navuleaf-aa68380b180b), [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### leaf(Integer) <a href="#leaf-47fda8402c20" id="leaf-47fda8402c20"></a>

```java
public com.tailf.navu.NavuLeaf leaf(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#navuleaf-aa68380b180b), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a reference to a subordinate `leaf` with
 the hash value `key`.

**Parameters**

- `Integer key` - hashed name of the subordinate leaf

**Returns:** reference to a subordinate container node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf node or if there is no subordinate node
         with the hash value `key`

### leaf(String) <a href="#leaf-ac189787d67d" id="leaf-ac189787d67d"></a>

```java
public com.tailf.navu.NavuLeaf leaf(String key) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#navuleaf-aa68380b180b), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a reference to a subordinate `leaf` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate leaf

**Returns:** reference to a subordinate leaf node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf node or if there is no subordinate node
         with the name `key`

### leafList(ConfNamespace, String) <a href="#leaflist-a2d5ad836b3e" id="leaflist-a2d5ad836b3e"></a>

```java
public com.tailf.navu.NavuLeafList leafList(
    com.tailf.conf.ConfNamespace ns,
    String leafListName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#navuleaflist-8d16c43a9b96), [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### leafList(Integer) <a href="#leaflist-552c8007ecb4" id="leaflist-552c8007ecb4"></a>

```java
public com.tailf.navu.NavuLeafList leafList(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#navuleaflist-8d16c43a9b96), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a reference to a subordinate `leaf-list` with
 the hash value `key`.

**Parameters**

- `Integer key` - hashed name of the subordinate leaf-list

**Returns:** reference to a subordinate leaf-list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf-list node or if there is no subordinate node
         with the hash value `key`

### leafList(String) <a href="#leaflist-5811cbb534ec" id="leaflist-5811cbb534ec"></a>

```java
public com.tailf.navu.NavuLeafList leafList(String key) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#navuleaflist-8d16c43a9b96), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a reference to a subordinate `leaf-list` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate leaf-list

**Returns:** reference to a subordinate leaf-list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf-list node or if there is no subordinate node
         with the name `key`

### list(ConfNamespace, String) <a href="#list-6b15381fd14a" id="list-6b15381fd14a"></a>

```java
public com.tailf.navu.NavuList list(
    com.tailf.conf.ConfNamespace ns,
    String listName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#navulist-472e8d6d3745), [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### list(Integer) <a href="#list-7dc96bdbb69a" id="list-7dc96bdbb69a"></a>

```java
public com.tailf.navu.NavuList list(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#navulist-472e8d6d3745), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a reference to a subordinate `list` with the
 hash value `key`.

**Parameters**

- `Integer key` - the hashed name of the subordinate list

**Returns:** reference to a subordinate list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a list node or if there is no subordinate node
         with the hash value `key`

### list(String) <a href="#list-2c1a74a3cf07" id="list-2c1a74a3cf07"></a>

```java
public com.tailf.navu.NavuList list(String key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#navulist-472e8d6d3745), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a reference to a subordinate `list` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate list

**Returns:** reference to a subordinate list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a list node or if there is no subordinate node
         with the name `key`

### namespace(String) <a href="#namespace-e29ad62ed095" id="namespace-e29ad62ed095"></a>

```java
public com.tailf.navu.NavuContainer namespace(String ns) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

The namespace specified here will be used when selecting a child
 to this NavuContainer and returns a reference to this NavuContainer
 object according to the given namespace id `ns`.

**Parameters**

- `String ns` - the namespace id

**Returns:** reference to this NavuContainer object

### prefix(String) <a href="#prefix-fdd71b8275bb" id="prefix-fdd71b8275bb"></a>

```java
public com.tailf.navu.NavuContainer prefix(String nsPrefix) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### prepareXMLCall(String) <a href="#preparexmlcall-c22e250f2cac" id="preparexmlcall-c22e250f2cac"></a>

```java
public com.tailf.navu.PreparedXMLStatement prepareXMLCall(
    String xml
)
    throws com.tailf.navu.NavuException
```

Types: [PreparedXMLStatement](PreparedXMLStatement.md#preparedxmlstatement-abf8aaf04b3a), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Creates a parameterized configuration xml in the style of a
 [`setValues(String)`](NavuNode.md#setvalues-3ec9581ce266) argument. The string "?" denotes a
 parameterized value.

 When the values that correspond to ? are known, they can be set
 using [`PreparedXMLStatement#put(int, String)`](PreparedXMLStatement.md#put-f549d0ea766e)
 or [`PreparedXMLStatement#put(int, ConfObject)`](PreparedXMLStatement.md#put-472f1342b5b7).

 Once all parameters have been set, the entire xml can be written using
 [`PreparedXMLStatement#setValues()`](PreparedXMLStatement.md#setvalues-da0bc3c468bf).

 Any parameterized value that is not populated by `put` before
 `setValues` is called, is treated as a
 [`ConfDefault`](../conf/ConfDefault.md#confdefault-2e2c2aa1733d).




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

**See also:** [`PreparedXMLStatement`](PreparedXMLStatement.md#preparedxmlstatement-abf8aaf04b3a)

### reset() <a href="#reset-6927918ac70a" id="reset-6927918ac70a"></a>

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

### select(ConfObject[]) <a href="#select-336dd76cd112" id="select-336dd76cd112"></a>

```java
public abstract java.util.Collection<com.tailf.navu.NavuNode> select(
    com.tailf.conf.ConfObject[] query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.conf.ConfObject[] query`

**Returns:** a collection a nodes matching a Regular Expression query

### select(List&lt;String&gt;) <a href="#select-e81f36150174" id="select-e81f36150174"></a>

```java
public abstract java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `java.util.List<String> query` - a list of regular expression.

**Returns:** a collection a nodes marching the query

### select(String) <a href="#select-5031325154b9" id="select-5031325154b9"></a>

```java
public abstract java.util.Collection<com.tailf.navu.NavuNode> select(
    String query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String query` - a "/" separated regular expression.

**Returns:** a collection a nodes marching the query

### setValues(ConfXMLParam[]) <a href="#setvalues-50d8edffa795" id="setvalues-50d8edffa795"></a>

```java
public void setValues(com.tailf.conf.ConfXMLParam[] params) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Set arbitrary sub-elements of a container or list entry.

 The [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) array must be populated with values
 according to the specification of the `ConfXMLParam`
 array structure.

 If the container or list entry itself, or any sub-elements
 that are specified as existing, do not exist before this
 call, they will be created, otherwise the existing values will
 be updated.

 Both mandatory and optional elements may be
 omitted from the array, and all omitted elements are left unchanged.

 To actually delete a non-mandatory leaf or presence container,
 [`ConfNoExists`](../conf/ConfNoExists.md#confnoexists-bdcf8f2c7ab9) should be used in the corresponding
 [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9).

 For a list entry, the key values can be specified either in the
 path or via key elements in `ConfXMLParamValue` -
 if the values are in the path, the key elements can be omitted
 from the array. For sub-lists present in the array, the key elements
 must of course always also be present though,
 immediately following the [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#confxmlparamstart-05eace141688)
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

### setValues(String) <a href="#setvalues-3ec9581ce266" id="setvalues-3ec9581ce266"></a>

```java
public void setValues(String xml) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Set arbitrary sub-elements of a container or list entry.

 This method shares the same behavior as
 `setValues(ConfXMLParam[])` but the input parameter is
 an *XML* string.

 The *XML* string passed as the input parameter
 should reflect the equivalent [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) array structure.

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

**See also:** [`setValues(ConfXMLParam[])`](NavuNode.md#setvalues-50d8edffa795), [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

### sharedSetValues(ConfXMLParam[]) <a href="#sharedsetvalues-705549be9df0" id="sharedsetvalues-705549be9df0"></a>

```java
public void sharedSetValues(
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Set arbitrary sub-elements of a container or list entry
 with FastMap support, creating backpointers and reference counter.
 All FastMap code shall (in principle) always use this method instead
 of setValues().

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

### sharedSetValues(String) <a href="#sharedsetvalues-ad93c38b671f" id="sharedsetvalues-ad93c38b671f"></a>

```java
public void sharedSetValues(String xml) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Set arbitrary sub-elements of a container or list entry
 with FastMap support, creating backpointers and reference counter.
 All FastMap code shall (in principle) always use this method instead
 of setValues().

 This method shares the same behavior as
 `sharedSetValues(ConfXMLParam[])` but the input parameter is
 an *XML* string.

**Parameters**

- `String xml`

### stopCdbSession() <a href="#stopcdbsession-17418252a986" id="stopcdbsession-17418252a986"></a>

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

### xPathSelect(String) <a href="#xpathselect-0fb26b9f41e0" id="xpathselect-0fb26b9f41e0"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> xPathSelect(
    String query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### xPathSelectIterate(String, NavuNodeSetIterate) <a href="#xpathselectiterate-12547f34f47c" id="xpathselectiterate-12547f34f47c"></a>

```java
public void xPathSelectIterate(
    String query,
    com.tailf.navu.NavuNodeSetIterate iterate
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNodeSetIterate](NavuNodeSetIterate.md#navunodesetiterate-6793a6b9b4c2), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Iterate through a NodeSet based on a supplied XPath query.
 Instead of retrieving a list of nodes as with
 [`xPathSelect(String)`](NavuNode.md#xpathselect-0fb26b9f41e0) in this method a supplied
 callback is called for each node in the result set.
 See [`NavuNodeSetIterate`](NavuNodeSetIterate.md#navunodesetiterate-6793a6b9b4c2).

**Parameters**

- `String query` - XPath 1.0 query
- `com.tailf.navu.NavuNodeSetIterate iterate` - supplied user code

**Throws**

- `NavuException`
