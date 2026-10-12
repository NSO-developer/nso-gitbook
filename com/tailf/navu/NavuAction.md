# NavuAction <a href="#navuaction-d853bc49f0e8" id="navuaction-d853bc49f0e8"></a>

```java
public class com.tailf.navu.NavuAction
    extends com.tailf.navu.NavuNode
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

This class represents a action modeled in the data model.

Although the `NavuAction` implements `NavuNode`
 the usage of this class only to call the action with given parameters
 and it is limited in functionality specifies in  `NavuNode`.

## Members

**Constructors**:

- [NavuAction\(NavuContext, CSNode, NavuNode, Formats\)](#navuaction-36aac3975fb6)
- [NavuAction\(NavuContext, CSNode, NavuNode, String, Object\.\.\.\)](#navuaction-3a0c0b6d216e)

**Fields**:

- [arguments](NavuNode.md#arguments-28ffa3c54d2c) from NavuNode
- [change](NavuNode.md#change-470927160c2a) from NavuNode
- [fmt](NavuNode.md#fmt-94d3250bd2b9) from NavuNode
- [mountId](NavuNode.md#mountid-a6b63dedba52) from NavuNode
- [myConfPath](NavuNode.md#myconfpath-cec7a88dfaf3) from NavuNode
- [node](NavuNode.md#node-ff68e6a3ebc6) from NavuNode
- [nodeInfo](#nodeinfo-3b8feb52b1b1)
- [parent](#parent-26ad1434956a)

**Methods**:

- [call\(\)](#call-8169b4e243e4)
- [call\(ConfXMLParam\[\]\)](#call-387d37c25830)
- [call\(String\)](#call-803e5e9e2246)
- [children\(\)](#children-7d31300d62c3)
- [container\(ConfNamespace, String\)](NavuNode.md#container-31c604ba30e3) from NavuNode
- [container\(Integer\)](#container-abb10ecdc3f6)
- [container\(String\)](#container-76f5d191b16d)
- [container\(String, String\)](#container-b76d38390b19)
- [context\(\)](#context-0990f1a0bb68)
- [encodeValues\(\)](#encodevalues-7bd911383b1a)
- [encodeXML\(\)](#encodexml-bdbcd52c2505)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [exists\(\)](#exists-56968a4c7bda)
- [filterChildren\(CSNode\)](NavuNode.md#filterchildren-e72b7b1ab25d) from NavuNode
- [getChangeFlag\(\)](#getchangeflag-33cadf5a32ba)
- [getChanges\(\)](#getchanges-9c036516dc6f)
- [getChanges\(boolean\)](#getchanges-5868a18319f7)
- [getChanges\(boolean, DiffIterateOperFlag\.\.\.\)](#getchanges-ec69623254ee)
- [getChanges\(NavuContext\)](#getchanges-c106383f174d)
- [getChanges\(NavuContext, boolean\)](#getchanges-bcf5b6dbccf2)
- [getChanges\(NavuContext, boolean, DiffIterateOperFlag\.\.\.\)](#getchanges-944155506885)
- [getConfPath\(\)](NavuNode.md#getconfpath-c7ca3cb63c17) from NavuNode
- [getInfo\(\)](#getinfo-259a72b5d74c)
- [getKeyPath\(\)](#getkeypath-4c9200912948)
- [getName\(\)](#getname-2634b18b4a25)
- [getNavuNode\(ConfPath\)](#getnavunode-d19ad1dd90fc)
- [getParent\(\)](#getparent-45c1b196ed70)
- [getRootNS\(\)](#getrootns-3f1d054cecd6)
- [getValues\(ConfXMLParam\[\]\)](#getvalues-1eb02439a757)
- [getValues\(String\)](#getvalues-c03de090764d)
- [hashCode\(\)](#hashcode-ef797a217903)
- [leaf\(ConfNamespace, String\)](NavuNode.md#leaf-da3758f37f21) from NavuNode
- [leaf\(Integer\)](#leaf-47fda8402c20)
- [leaf\(String\)](#leaf-ac189787d67d)
- [leaf\(String, String\)](#leaf-db53852a70eb)
- [leafList\(ConfNamespace, String\)](NavuNode.md#leaflist-a2d5ad836b3e) from NavuNode
- [leafList\(Integer\)](#leaflist-552c8007ecb4)
- [leafList\(String\)](#leaflist-5811cbb534ec)
- [leafList\(String, String\)](#leaflist-79bb39ee2665)
- [list\(ConfNamespace, String\)](NavuNode.md#list-6b15381fd14a) from NavuNode
- [list\(Integer\)](#list-7dc96bdbb69a)
- [list\(String\)](#list-2c1a74a3cf07)
- [list\(String, String\)](#list-8f28e4f62b19)
- [namespace\(String\)](NavuNode.md#namespace-e29ad62ed095) from NavuNode
- [prefix\(String\)](NavuNode.md#prefix-fdd71b8275bb) from NavuNode
- [prepareXMLCall\(String\)](NavuNode.md#preparexmlcall-c22e250f2cac) from NavuNode
- [refresh\(\)](#refresh-3852c3f76c8e)
- [reset\(\)](#reset-6927918ac70a)
- [select\(ConfObject\[\]\)](#select-336dd76cd112)
- [select\(List\<String\>\)](#select-e81f36150174)
- [select\(String\)](#select-5031325154b9)
- [setChange\(List\<ConfObject\>, DiffIterateOperFlag, ConfValue, NavuContext\)](#setchange-0bbeb54ebc15)
- [setValues\(ConfXMLParam\[\]\)](NavuNode.md#setvalues-50d8edffa795) from NavuNode
- [setValues\(String\)](NavuNode.md#setvalues-3ec9581ce266) from NavuNode
- [sharedSetValues\(ConfXMLParam\[\]\)](NavuNode.md#sharedsetvalues-705549be9df0) from NavuNode
- [sharedSetValues\(String\)](NavuNode.md#sharedsetvalues-ad93c38b671f) from NavuNode
- [stopCdbSession\(\)](#stopcdbsession-17418252a986)
- [toString\(\)](#tostring-e9d48c5503ef)
- [valueUpdateInd\(NavuNode\)](#valueupdateind-e7cd65f79d78)
- [xPathSelect\(String\)](#xpathselect-0fb26b9f41e0)
- [xPathSelectIterate\(String, NavuNodeSetIterate\)](NavuNode.md#xpathselectiterate-12547f34f47c) from NavuNode

## Constructors

### NavuAction(NavuContext, CSNode, NavuNode, Formats) <a href="#navuaction-36aac3975fb6" id="navuaction-36aac3975fb6"></a>

```java
protected NavuAction(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode csNode,
    com.tailf.navu.NavuNode parent,
    com.tailf.navu.KeyPath2NavuNode.Formats fs
)
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuNode](NavuNode.md#navunode-73944820c8db), [Formats](KeyPath2NavuNode/Formats.md#formats-699695f9b70f)

KeyPath2NavuNode specific constructor

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode csNode`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.navu.KeyPath2NavuNode.Formats fs`

### NavuAction(NavuContext, CSNode, NavuNode, String, Object...) <a href="#navuaction-3a0c0b6d216e" id="navuaction-3a0c0b6d216e"></a>

```java
protected NavuAction(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode csNode,
    com.tailf.navu.NavuNode parent,
    String pathfmt,
    Object... args
)
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode csNode`
- `com.tailf.navu.NavuNode parent`
- `String pathfmt`
- `Object... args`


## Fields

### nodeInfo <a href="#nodeinfo-3b8feb52b1b1" id="nodeinfo-3b8feb52b1b1"></a>

```java
protected com.tailf.navu.NavuNodeInfo nodeInfo;
```

Types: [NavuNodeInfo](NavuNodeInfo.md#navunodeinfo-ee275327d410)

### parent <a href="#parent-26ad1434956a" id="parent-26ad1434956a"></a>

```java
protected com.tailf.navu.NavuNode parent;
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)


## Methods

### call() <a href="#call-8169b4e243e4" id="call-8169b4e243e4"></a>

```java
public com.tailf.conf.ConfXMLParam[] call() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Issues an action with empty parameters

**Returns:** result from this action call

**Throws**

- `com.tailf.navu.NavuException`

### call(ConfXMLParam[]) <a href="#call-387d37c25830" id="call-387d37c25830"></a>

```java
public com.tailf.conf.ConfXMLParam[] call(
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Issues an action call with given parameters

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params` - parameters to the action call

**Throws**

- `com.tailf.navu.NavuException` - if the NavuContext is not created with
 Maapi

### call(String) <a href="#call-803e5e9e2246" id="call-803e5e9e2246"></a>

```java
public com.tailf.conf.ConfXMLParam[] call(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Issues an action call with given parameter

**Parameters**

- `String xml` - parameters as corresponding xml string data

**Throws**

- `com.tailf.navu.NavuException`

### children() <a href="#children-7d31300d62c3" id="children-7d31300d62c3"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Return the children of this node.

**Returns:** children of this node

### container(Integer) <a href="#container-abb10ecdc3f6" id="container-abb10ecdc3f6"></a>

```java
public com.tailf.navu.NavuContainer container(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.container(Integer)`](NavuNode.md#container-abb10ecdc3f6)

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

- `com.tailf.navu.NavuException` - if the corresponding subordinate node is not
a container or if there is no subordinate node
with the hash value `key`

### container(String) <a href="#container-76f5d191b16d" id="container-76f5d191b16d"></a>

```java
public com.tailf.navu.NavuContainer container(String key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.container(String)`](NavuNode.md#container-76f5d191b16d)

Returns a reference to a subordinate `container` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate container

**Returns:** reference to a subordinate container node

**Throws**

- `com.tailf.navu.NavuException` - if the corresponding subordinate node is not
a container node or if there is no subordinate node
with the name `key`

### container(String, String) <a href="#container-b76d38390b19" id="container-b76d38390b19"></a>

```java
public com.tailf.navu.NavuContainer container(
    String prefix,
    String key
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String prefix`
- `String key`

### context() <a href="#context-0990f1a0bb68" id="context-0990f1a0bb68"></a>

```java
public com.tailf.navu.NavuContext context()
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e)

Returns the current [`NavuContext`](NavuContext.md#navucontext-2974e9f92a9e) that this node is
 attached to.

**Returns:** current cdbSession().

### encodeValues() <a href="#encodevalues-7bd911383b1a" id="encodevalues-7bd911383b1a"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeValues()
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.encodeValues()`](NavuNode.md#encodevalues-7bd911383b1a)

Encodes the sub-tree including the current `NavuNode`
 as the topmost `NavuNode` as a [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) array.

As opposed to [`encodeXML()`](NavuNode.md#encodexml-bdbcd52c2505), the returned [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)
 array does contain values in the form of
 [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#confxmlparamvalue-9f41fb2668c9)

**Returns:** A list of [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) objects corresponding to the
sub-tree of this node, including all values.

### encodeXML() <a href="#encodexml-bdbcd52c2505" id="encodexml-bdbcd52c2505"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.encodeXML()`](NavuNode.md#encodexml-bdbcd52c2505)

Encodes the sub-tree including the current `NavuNode`
 as the topmost `NavuNode` as a [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) array.

The returned [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) array contains no values except
 for list keys. The leaf elements are encoded as
 [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#confxmlparamleaf-107412653048). Therefore, the returning
 array can be used as a the input parameter to
 [`getValues(ConfXMLParam[])`](NavuNode.md#getvalues-1eb02439a757) on the current node's parent.

> ```
> NavuNode node = ...;
> ConfXMLParam[] cxa = node.encodeXML().toArray(new ConfXMLParam[0]);
> // cxa contains a structure that does not contain values except for
> // keys in list elements
>
> NavuNode parent = node.getParent();
> ConfXMLParam[] cxb = parent.getValues(cxa);
> // cxb contains the same sub-tree with all the values
> ```

**Returns:** A list of [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7) objects
corresponding to the sub-tree of this node, with no
values except list keys.

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuAction`
 for equality.
 Returns `true` if the given object is also a
 `NavuAction` and it has the same [`ConfPath`](../conf/ConfPath.md#confpath-327831c6fc7d) as this
 `NavuAction`.

**Parameters**

- `Object o` - the object to be compared for equality with this
`NavuAction`

**Returns:** `true` if the specified object is equal to this
`NavuAction`

### exists() <a href="#exists-56968a4c7bda" id="exists-56968a4c7bda"></a>

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.exists()`](NavuNode.md#exists-56968a4c7bda)

Generic exists test for Navu navigational elements

**Returns:** boolean

### getChangeFlag() <a href="#getchangeflag-33cadf5a32ba" id="getchangeflag-33cadf5a32ba"></a>

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

See: [`NavuNode.getChangeFlag()`](NavuNode.md#getchangeflag-33cadf5a32ba)

**Returns:** Flag for the latest change

### getChanges() <a href="#getchanges-9c036516dc6f" id="getchanges-9c036516dc6f"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

### getChanges(boolean) <a href="#getchanges-5868a18319f7" id="getchanges-5868a18319f7"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    boolean emitSubtree
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `boolean emitSubtree`

### getChanges(boolean, DiffIterateOperFlag...) <a href="#getchanges-ec69623254ee" id="getchanges-ec69623254ee"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    boolean emitSubtree,
    com.tailf.conf.DiffIterateOperFlag... forOps
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `boolean emitSubtree`
- `com.tailf.conf.DiffIterateOperFlag... forOps`

### getChanges(NavuContext) <a href="#getchanges-c106383f174d" id="getchanges-c106383f174d"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delcontext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.getChanges(com.tailf.navu.NavuContext)`](NavuNode.md#getchanges-c106383f174d)

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
 [`getChanges(NavuContext, boolean, DiffIterateOperFlag...)`](NavuNode.md#getchanges-944155506885)

**Parameters**

- `com.tailf.navu.NavuContext delcontext` - NavuContext to retrieve deleted values with.

**Returns:** A list of `NavuNode`'s that has been affected by
 the changes to the current `MAAPI` transaction.

**Throws**

- `com.tailf.navu.NavuException` - Is returned if we try to iterate on a
transaction which is in the wrong state and not attached.

### getChanges(NavuContext, boolean) <a href="#getchanges-bcf5b6dbccf2" id="getchanges-bcf5b6dbccf2"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delcontext,
    boolean emitSubtree
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.getChanges(com.tailf.navu.NavuContext, boolean)`](NavuNode.md#getchanges-bcf5b6dbccf2)

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

- `com.tailf.navu.NavuContext delcontext` - NavuContext to retrieve deleted values with.
- `boolean emitSubtree` - boolean to control subtree changes

**Returns:** A list of `NavuNode` that has been affected by
changes to the current `MAAPI` transaction.

**Throws**

- `com.tailf.navu.NavuException` - Is returned if we try to iterate on changes on a
transaction which is in the wrong state and not attached.

### getChanges(NavuContext, boolean, DiffIterateOperFlag...) <a href="#getchanges-944155506885" id="getchanges-944155506885"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext,
    boolean emitSubtree,
    com.tailf.conf.DiffIterateOperFlag... forOps
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.getChanges(com.tailf.navu.NavuContext, boolean, com.tailf.conf.DiffIterateOperFlag...)`](NavuNode.md#getchanges-944155506885)

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
- `boolean emitSubtree` - boolean to control subtree changes
- `com.tailf.conf.DiffIterateOperFlag... forOps` - operations for which changes are of interest.

**Returns:** A list of `NavuNode` that has been affected by
changes to the current `MAAPI` transaction.

**Throws**

- `com.tailf.navu.NavuException` - if we try to iterate on a transaction which is in the wrong
state and not attached or if delContext is the same as the
NavuNode context.

### getInfo() <a href="#getinfo-259a72b5d74c" id="getinfo-259a72b5d74c"></a>

```java
public com.tailf.navu.NavuNodeInfo getInfo()
```

Types: [NavuNodeInfo](NavuNodeInfo.md#navunodeinfo-ee275327d410)

*Description from* [`NavuNode.getInfo()`](NavuNode.md#getinfo-259a72b5d74c)

Returns the `NaveNodeInfo` regarding this node.

A `NavuNodeInfo` is an object which further information
 could be retrieved from the current node.

**Returns:** A informational instance about this `NavuNode`

### getKeyPath() <a href="#getkeypath-4c9200912948" id="getkeypath-4c9200912948"></a>

```java
public String getKeyPath()
```

*Description from* [`NavuNode.getKeyPath()`](NavuNode.md#getkeypath-4c9200912948)

Returns the absolute keypath of this node.

**Returns:** A String representing the absolute keypath that this
`NavuNode`

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public String getName()
```

*Description from* [`NavuNode.getName()`](NavuNode.md#getname-2634b18b4a25)

Returns the name of this NavuNode.

**Returns:** \- the node name.

### getNavuNode(ConfPath) <a href="#getnavunode-d19ad1dd90fc" id="getnavunode-d19ad1dd90fc"></a>

```java
public com.tailf.navu.NavuNode getNavuNode(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfPath](../conf/ConfPath.md#confpath-327831c6fc7d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.getNavuNode(com.tailf.conf.ConfPath)`](NavuNode.md#getnavunode-d19ad1dd90fc)

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

- `com.tailf.navu.NavuException` - if the path is invalid according the
 schema or does not lead to a instance node.

### getParent() <a href="#getparent-45c1b196ed70" id="getparent-45c1b196ed70"></a>

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

*Description from* [`NavuNode.getParent()`](NavuNode.md#getparent-45c1b196ed70)

Returns the parent of the node.

**Returns:** \- this node parent or null if this NavuNode represents
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
    com.tailf.conf.ConfXMLParam[] param
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Invokes or *call* an action defined in the data model (see
 `tailf_yang_extensions(5)`).
 The params and values arrays are the
 parameters for and results from the action, respectively, and use the
 [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7).

**Parameters**

- `com.tailf.conf.ConfXMLParam[] param` - pre-populated array of `ConfXMLParam`

**Returns:** Array of `ConfXMLParam` where
`ConfXMLParamLeaf` is replaced with
`ConfXMLParamValue`

**Throws**

- `com.tailf.navu.NavuException` - If the input parameter does
not conform to the current data model or an error
occurs during the read.

### getValues(String) <a href="#getvalues-c03de090764d" id="getvalues-c03de090764d"></a>

```java
public com.tailf.conf.ConfXMLParam[] getValues(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Invokes or *call* an action defined in the data model (see
 `tailf_yang_extensions(5)`).

The *XML* input value to this action is the
 eqvivalent `ConfXMLParam[]` structure.

The retrn uarrays are the parameters for and results
 from the action, respectively, and use the
 [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7).

**Parameters**

- `String xml` - XML string representation as the input values to
 this `action`

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7)

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

*Description from* [`NavuNode.hashCode()`](NavuNode.md#hashcode-ef797a217903)

Return the hashCode of this NavuNode. For most nodes, the hash code is
 based on the [`ConfPath`](../conf/ConfPath.md#confpath-327831c6fc7d) of the node. For module
 root containers there is no `ConfPath` and instead the hash
 code is based on the hash code of the module schema.

**Returns:** The hashCode

### leaf(Integer) <a href="#leaf-47fda8402c20" id="leaf-47fda8402c20"></a>

```java
public com.tailf.navu.NavuLeaf leaf(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#navuleaf-aa68380b180b), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.leaf(Integer)`](NavuNode.md#leaf-47fda8402c20)

Returns a reference to a subordinate `leaf` with
 the hash value `key`.

**Parameters**

- `Integer key` - hashed name of the subordinate leaf

**Returns:** reference to a subordinate container node

**Throws**

- `com.tailf.navu.NavuException` - if the corresponding subordinate node is not
a leaf node or if there is no subordinate node
with the hash value `key`

### leaf(String) <a href="#leaf-ac189787d67d" id="leaf-ac189787d67d"></a>

```java
public com.tailf.navu.NavuLeaf leaf(String leaf) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#navuleaf-aa68380b180b), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.leaf(String)`](NavuNode.md#leaf-ac189787d67d)

Returns a reference to a subordinate `leaf` with
 the name `key`.

**Parameters**

- `String leaf` - the name of the subordinate leaf

**Returns:** reference to a subordinate leaf node

**Throws**

- `com.tailf.navu.NavuException` - if the corresponding subordinate node is not
a leaf node or if there is no subordinate node
with the name `key`

### leaf(String, String) <a href="#leaf-db53852a70eb" id="leaf-db53852a70eb"></a>

```java
public com.tailf.navu.NavuLeaf leaf(String prefix, String leaf) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#navuleaf-aa68380b180b), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String prefix`
- `String leaf`

### leafList(Integer) <a href="#leaflist-552c8007ecb4" id="leaflist-552c8007ecb4"></a>

```java
public com.tailf.navu.NavuLeafList leafList(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#navuleaflist-8d16c43a9b96), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.leafList(Integer)`](NavuNode.md#leaflist-552c8007ecb4)

Returns a reference to a subordinate `leaf-list` with
 the hash value `key`.

**Parameters**

- `Integer key` - hashed name of the subordinate leaf-list

**Returns:** reference to a subordinate leaf-list node

**Throws**

- `com.tailf.navu.NavuException` - if the corresponding subordinate node is not
a leaf-list node or if there is no subordinate node
with the hash value `key`

### leafList(String) <a href="#leaflist-5811cbb534ec" id="leaflist-5811cbb534ec"></a>

```java
public com.tailf.navu.NavuLeafList leafList(String leafList) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#navuleaflist-8d16c43a9b96), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.leafList(String)`](NavuNode.md#leaflist-5811cbb534ec)

Returns a reference to a subordinate `leaf-list` with
 the name `key`.

**Parameters**

- `String leafList` - the name of the subordinate leaf-list

**Returns:** reference to a subordinate leaf-list node

**Throws**

- `com.tailf.navu.NavuException` - if the corresponding subordinate node is not
a leaf-list node or if there is no subordinate node
with the name `key`

### leafList(String, String) <a href="#leaflist-79bb39ee2665" id="leaflist-79bb39ee2665"></a>

```java
public com.tailf.navu.NavuLeafList leafList(
    String prefix,
    String leafList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#navuleaflist-8d16c43a9b96), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String prefix`
- `String leafList`

### list(Integer) <a href="#list-7dc96bdbb69a" id="list-7dc96bdbb69a"></a>

```java
public com.tailf.navu.NavuList list(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#navulist-472e8d6d3745), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.list(Integer)`](NavuNode.md#list-7dc96bdbb69a)

Returns a reference to a subordinate `list` with the
 hash value `key`.

**Parameters**

- `Integer key` - the hashed name of the subordinate list

**Returns:** reference to a subordinate list node

**Throws**

- `com.tailf.navu.NavuException` - if the corresponding subordinate node is not
a list node or if there is no subordinate node
with the hash value `key`

### list(String) <a href="#list-2c1a74a3cf07" id="list-2c1a74a3cf07"></a>

```java
public com.tailf.navu.NavuList list(String key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#navulist-472e8d6d3745), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.list(String)`](NavuNode.md#list-2c1a74a3cf07)

Returns a reference to a subordinate `list` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate list

**Returns:** reference to a subordinate list node

**Throws**

- `com.tailf.navu.NavuException` - if the corresponding subordinate node is not
a list node or if there is no subordinate node
with the name `key`

### list(String, String) <a href="#list-8f28e4f62b19" id="list-8f28e4f62b19"></a>

```java
public com.tailf.navu.NavuList list(String prefix, String key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#navulist-472e8d6d3745), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String prefix`
- `String key`

### refresh() <a href="#refresh-3852c3f76c8e" id="refresh-3852c3f76c8e"></a>

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

### reset() <a href="#reset-6927918ac70a" id="reset-6927918ac70a"></a>

```java
public void reset()
```

**Not supported does nothing**

### select(ConfObject[]) <a href="#select-336dd76cd112" id="select-336dd76cd112"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
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
public java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Not supported returns only an empty Collection**

**Parameters**

- `java.util.List<String> query` - a list of regular expression.

**Returns:** a collection a nodes marching the query

### select(String) <a href="#select-5031325154b9" id="select-5031325154b9"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    String query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Not supported returns only an empty Collection**

**Parameters**

- `String query` - a "/" separated regular expression.

**Returns:** a collection a nodes marching the query

### setChange(List&lt;ConfObject&gt;, DiffIterateOperFlag, ConfValue, NavuContext) <a href="#setchange-0bbeb54ebc15" id="setchange-0bbeb54ebc15"></a>

```java
public com.tailf.navu.NavuNode setChange(
    java.util.List<com.tailf.conf.ConfObject> kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfValue oldValue,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Sets the change type on a node.

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

**Returns:** the actual NavuNode that was updated.

**Throws**

- `com.tailf.navu.NavuException`

### stopCdbSession() <a href="#stopcdbsession-17418252a986" id="stopcdbsession-17418252a986"></a>

```java
public void stopCdbSession()
```

*Description from* [`NavuNode.stopCdbSession()`](NavuNode.md#stopcdbsession-17418252a986)

Closes all CdbSessions for the NavuContainer.  This is only
 necessary the case if the the NavuContainer was created with a
 constructor for CDB access.  In such cases it is important to
 call this method as soon as the NavuContainer has been
 used. The reason for this is to release any locks on the CDB
 database as soon as possible.

 Calling this method several times under the life-cycle of the
 NavuContainer object is supported.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### valueUpdateInd(NavuNode) <a href="#valueupdateind-e7cd65f79d78" id="valueupdateind-e7cd65f79d78"></a>

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child)
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.navu.NavuNode child`

### xPathSelect(String) <a href="#xpathselect-0fb26b9f41e0" id="xpathselect-0fb26b9f41e0"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> xPathSelect(
    String xPath
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

*Description from* [`NavuNode.xPathSelect(String)`](NavuNode.md#xpathselect-0fb26b9f41e0)

Evaluates the XPath path expression `query` and returns
 the resulting node set as list of `NavuNode`'s.

The expression `query` will be evaluated using this
 node as the context node.

Example:

> ```
> NavuContainer =
> root.container(myns._somecontainer1)
>     .container(myns._somecontainer2).container(myns._servers);
>
> // Retrieve all the entries of the server list "server"
> servers.xPathSelect("server");
>
> // Retrieve all child nodes of servers with srv-name = www1
> servers.xPathSelect("server[srv-name='www1']/*");
>
> // Retrieve all leaf ip nodes of servers with srv-name = www1
> servers.xPathSelect("server[srv-name='www1']/ip");
> ```

**Parameters**

- `String xPath` - XPath 1.0 query

**Returns:** a collection a nodes marching the query
