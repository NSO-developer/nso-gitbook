<a id="s-NavuNode"></a>
# NavuNode

```java
public abstract class com.tailf.navu.NavuNode
```

NavuNode is the base class for all navigation classes like
 [`NavuContainer`](NavuContainer.md#s-NavuContainer), [`NavuList`](NavuList.md#s-NavuList), [`NavuLeaf`](NavuLeaf.md#s-NavuLeaf) etc.

 A `NavuNode` can be explicitly retrieved
 through [`NavuContainer`](NavuContainer.md#s-NavuContainer).




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
 methods `#container(String)`, `#leaf(String)`,
 `#list(String)`
 each retrieves a `NavuNode` on the next level.

 `#getParent()` retrieves the `NavuNode`
 for the previous level (parent node). To retrieve all the child elements
 on the next level for a given `NavuNode`, `#children()`
 returns a `Collection` of `NavuNode`s.

 To retrieve descendants of a `NavuNode` based on a regular
 expression, `#select(String)` (or an overloaded variant) can be used.
- *Informational methods*. Provide information for a
 `NavuNode`.
 `#getInfo()`, `#getKeyPath()`, `#getName()`,
 `#getRootNS()`.
- *Context specific methods*. Certain methods are only useful
 depending on the currently attached context.
 The current context is retrieved through `context()` method.

 Some MAAPI-specific methods are [`NavuNode`](NavuNode.md#s-NavuNode),
 [`NavuContext`](NavuContext.md#s-NavuContext) and `#xPathSelect(String)`.
- *Data reading/writing methods*. Methods such as
 `#getValues(String)` and `#setValues(String)`.



 There are also methods that does not fall into the above categories,
 such as `#encodeXML()` which is a helpful method in conjunction
 with `getValues()` to extract a sub-tree.

**Related classes**

- [NavuAction](NavuAction.md#s-NavuAction)
- [NavuContainer](NavuContainer.md#s-NavuContainer)
- [NavuLeaf](NavuLeaf.md#s-NavuLeaf)
- [NavuList](NavuList.md#s-NavuList)

## Members

**Constructors**:

- [NavuNode()](#s-NavuNode-1)

**Fields**:

- [arguments](#s-arguments)
- [change](#s-change)
- [context](#s-context)
- [fmt](#s-fmt)
- [mountId](#s-mountId)
- [myConfPath](#s-myConfPath)
- [node](#s-node)
- [parent](#s-parent)

**Methods**:

- [children()](#s-children)
- [container(ConfNamespace, String)](#s-container)
- [container(Integer)](#s-container-1)
- [container(String)](#s-container-2)
- [context()](#s-context-1)
- [encodeValues()](#s-encodeValues)
- [encodeXML()](#s-encodeXML)
- [equals(Object)](#s-equals)
- [exists()](#s-exists)
- [filterChildren(CSNode)](#s-filterChildren)
- [getChangeFlag()](#s-getChangeFlag)
- [getChanges(NavuContext)](#s-getChanges)
- [getChanges(NavuContext, boolean)](#s-getChanges-1)
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](#s-getChanges-2)
- [getConfPath()](#s-getConfPath)
- [getInfo()](#s-getInfo)
- [getKeyPath()](#s-getKeyPath)
- [getName()](#s-getName)
- [getNavuNode(ConfPath)](#s-getNavuNode)
- [getParent()](#s-getParent)
- [getRootNS()](#s-getRootNS)
- [getValues(ConfXMLParam[])](#s-getValues)
- [getValues(String)](#s-getValues-1)
- [hashCode()](#s-hashCode)
- [leaf(ConfNamespace, String)](#s-leaf)
- [leaf(Integer)](#s-leaf-1)
- [leaf(String)](#s-leaf-2)
- [leafList(ConfNamespace, String)](#s-leafList)
- [leafList(Integer)](#s-leafList-1)
- [leafList(String)](#s-leafList-2)
- [list(ConfNamespace, String)](#s-list)
- [list(Integer)](#s-list-1)
- [list(String)](#s-list-2)
- [namespace(String)](#s-namespace)
- [prefix(String)](#s-prefix)
- [prepareXMLCall(String)](#s-prepareXMLCall)
- [refresh()](#s-refresh)
- [reset()](#s-reset)
- [select(ConfObject[])](#s-select)
- [select(List<String>)](#s-select-1)
- [select(String)](#s-select-2)
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](#s-setChange)
- [setValues(ConfXMLParam[])](#s-setValues)
- [setValues(String)](#s-setValues-1)
- [sharedSetValues(ConfXMLParam[])](#s-sharedSetValues)
- [sharedSetValues(String)](#s-sharedSetValues-1)
- [stopCdbSession()](#s-stopCdbSession)
- [valueUpdateInd(NavuNode)](#s-valueUpdateInd)
- [xPathSelect(String)](#s-xPathSelect)
- [xPathSelectIterate(String, NavuNodeSetIterate)](#s-xPathSelectIterate)

## Constructors

<a id="s-NavuNode-1"></a>
### NavuNode()

```java
public NavuNode()
```


## Fields

<a id="s-arguments"></a>
### arguments

```java
protected Object[] arguments = null;
```

<a id="s-change"></a>
### change

```java
protected com.tailf.conf.DiffIterateOperFlag change = null;
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

<a id="s-context"></a>
### context

```java
protected com.tailf.navu.NavuContext context = null;
```

Types: [NavuContext](NavuContext.md#s-NavuContext)

<a id="s-fmt"></a>
### fmt

```java
protected String fmt = null;
```

<a id="s-mountId"></a>
### mountId

```java
protected java.util.List<String> mountId = null;
```

<a id="s-myConfPath"></a>
### myConfPath

```java
protected com.tailf.conf.ConfPath myConfPath = null;
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

<a id="s-node"></a>
### node

```java
protected com.tailf.navu.NavuNodeInfo node = null;
```

Types: [NavuNodeInfo](NavuNodeInfo.md#s-NavuNodeInfo)

<a id="s-parent"></a>
### parent

```java
protected com.tailf.navu.NavuNode parent = null;
```

Types: [NavuNode](NavuNode.md#s-NavuNode)


## Methods

<a id="s-children"></a>
### children()

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

Returns a collection containing the children of this node.
 For container nodes, the returned collection can contain nodes
 of any type.
 For list nodes, the children are the elements of the list.
 Leaf nodes have no children and will return an empty collection.

**Returns:** the children of this node

<a id="s-container"></a>
### container(ConfNamespace, String)

```java
public com.tailf.navu.NavuContainer container(
    com.tailf.conf.ConfNamespace ns,
    String containerName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-container-1"></a>
### container(Integer)

```java
public com.tailf.navu.NavuContainer container(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Returns a reference to a subordinate `container` with
 the hash value `key`.

 The `container` hash value can be obtained as a constant
 from a namespace file generated by `confdc` or
 `ncsc`, or retrieved with one of the methods
 [`ConfNamespace`](../conf/ConfNamespace.md#s-ConfNamespace) or
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#s-MaapiSchemas).
 It is also possible to access a container based on its name only,
 using the overloaded method `#container(String)`.

**Parameters**

- `Integer key` - hashed name of the container to return

**Returns:** reference to a subordinate container node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a container or if there is no subordinate node
         with the hash value `key`

<a id="s-container-2"></a>
### container(String)

```java
public com.tailf.navu.NavuContainer container(String key) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Returns a reference to a subordinate `container` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate container

**Returns:** reference to a subordinate container node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a container node or if there is no subordinate node
         with the name `key`

<a id="s-context-1"></a>
### context()

```java
public com.tailf.navu.NavuContext context()
```

Types: [NavuContext](NavuContext.md#s-NavuContext)

Returns the current [`NavuContext`](NavuContext.md#s-NavuContext) that this node is
 attached to.

**Returns:** The current `NavuContext`.

<a id="s-encodeValues"></a>
### encodeValues()

```java
public abstract java.util.List<com.tailf.conf.ConfXMLParam> encodeValues() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

Encodes the sub-tree including the current `NavuNode`
 as the topmost `NavuNode` as a [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) array.

 As opposed to `#encodeXML()`, the returned [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam)
 array does contain values in the form of
 [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#s-ConfXMLParamValue)

**Returns:** A list of [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) objects corresponding to the
          sub-tree of this node, including all values.

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam), [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#s-ConfXMLParamValue)

<a id="s-encodeXML"></a>
### encodeXML()

```java
public abstract java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

Encodes the sub-tree including the current `NavuNode`
 as the topmost `NavuNode` as a [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) array.

 The returned [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) array contains no values except
 for list keys. The leaf elements are encoded as
 [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#s-ConfXMLParamLeaf). Therefore, the returning
 array can be used as a the input parameter to
 [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) on the current node's parent.




```
 NavuNode node = ...;
 ConfXMLParam[] cxa = node.encodeXML().toArray(new ConfXMLParam[0]);
 // cxa contains a structure that does not contain values except for
 // keys in list elements

 NavuNode parent = node.getParent();
 ConfXMLParam[] cxb = parent.getValues(cxa);
 // cxb contains the same sub-tree with all the values
```

**Returns:** A list of [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) objects
          corresponding to the sub-tree of this node, with no
          values except list keys.

**See also:** [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam), [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#s-ConfXMLParamValue)

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Check the equality of this NavuNode against the targeted
 NavuNode.

**Parameters**

- `Object o`

**Returns:** true if this NavuNode represents the same node as
         the targeted NavuNode

<a id="s-exists"></a>
### exists()

```java
public abstract boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Generic exists test for Navu navigational elements

**Returns:** boolean

**Throws**

- `NavuException`

<a id="s-filterChildren"></a>
### filterChildren(CSNode)

```java
protected java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> filterChildren(
    com.tailf.maapi.MaapiSchemas.CSNode node
)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `com.tailf.maapi.MaapiSchemas.CSNode node`

<a id="s-getChangeFlag"></a>
### getChangeFlag()

```java
public com.tailf.conf.DiffIterateOperFlag getChangeFlag()
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

Returns the latest change that this `NavuNode` has
 been a subject to by a transaction.

**Returns:** Flag for the latest change

**See also:** [`DiffIterateOperFlag`](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

<a id="s-getChanges"></a>
### getChanges(NavuContext)

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuContext](NavuContext.md#s-NavuContext), [NavuException](NavuException.md#s-NavuException)

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
 [`NavuContext`](NavuContext.md#s-NavuContext)

**Parameters**

- `com.tailf.navu.NavuContext delContext` - NavuContext to retrieve deleted values with.

**Returns:** A list of `NavuNode`'s that has been affected by
 the changes to the current `MAAPI` transaction.

**Throws**

- `NavuException` - Is returned if we try to iterate on a
         transaction which is in the wrong state and not attached.

<a id="s-getChanges-1"></a>
### getChanges(NavuContext, boolean)

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext,
    boolean emitSubTree
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuContext](NavuContext.md#s-NavuContext), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-getChanges-2"></a>
### getChanges(NavuContext, boolean, DiffIterateOperFlag[])

```java
public java.util.List<com.tailf.navu.NavuNode> getChanges(
    com.tailf.navu.NavuContext delContext,
    boolean emitSubTree,
    com.tailf.conf.DiffIterateOperFlag[] forOps
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuContext](NavuContext.md#s-NavuContext), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-getConfPath"></a>
### getConfPath()

```java
public com.tailf.conf.ConfPath getConfPath()
```

Types: [ConfPath](../conf/ConfPath.md#s-ConfPath)

Returns the corresponding ConfPath for the corresponding NavuNode.

 If the NavuNode is the root schema NavuNode i.e the root
 NavuContainer constructed from the schema hash, this node has no
 corresponding ConfPath and null is returned.

**Returns:** ConfPath

<a id="s-getInfo"></a>
### getInfo()

```java
public com.tailf.navu.NavuNodeInfo getInfo()
```

Types: [NavuNodeInfo](NavuNodeInfo.md#s-NavuNodeInfo)

Returns the `NaveNodeInfo` regarding this node.

 A `NavuNodeInfo` is an object which further information
 could be retrieved from the current node.

**Returns:** A informational instance about this `NavuNode`

<a id="s-getKeyPath"></a>
### getKeyPath()

```java
public String getKeyPath()
```

Returns the absolute keypath of this node.

**Returns:** A String representing the absolute keypath that this
         `NavuNode`

<a id="s-getName"></a>
### getName()

```java
public String getName()
```

Returns the name of this NavuNode.

**Returns:** - the node name.

<a id="s-getNavuNode"></a>
### getNavuNode(ConfPath)

```java
public com.tailf.navu.NavuNode getNavuNode(
    com.tailf.conf.ConfPath path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfPath](../conf/ConfPath.md#s-ConfPath), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-getParent"></a>
### getParent()

```java
public com.tailf.navu.NavuNode getParent()
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

Returns the parent of the node.

**Returns:** - this node parent or null if this NavuNode represents
 the root node.

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
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

Read an arbitrary set of sub-elements from this `NavuNode`.

 Input array of [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam)
 where desired values to be extracted should be replaced with
 [`ConfXMLParamLeaf`](../conf/ConfXMLParamLeaf.md#s-ConfXMLParamLeaf) in the ConfXMLParam array.

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

<a id="s-getValues-1"></a>
### getValues(String)

```java
public com.tailf.conf.ConfXMLParam[] getValues(String xml) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

Return the hashCode of this NavuNode. For most nodes, the hash code is
 based on the [`ConfPath`](../conf/ConfPath.md#s-ConfPath) of the node. For module
 root containers there is no `ConfPath` and instead the hash
 code is based on the hash code of the module schema.

**Returns:** The hashCode

<a id="s-leaf"></a>
### leaf(ConfNamespace, String)

```java
public com.tailf.navu.NavuLeaf leaf(
    com.tailf.conf.ConfNamespace ns,
    String leafName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#s-NavuLeaf), [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-leaf-1"></a>
### leaf(Integer)

```java
public com.tailf.navu.NavuLeaf leaf(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#s-NavuLeaf), [NavuException](NavuException.md#s-NavuException)

Returns a reference to a subordinate `leaf` with
 the hash value `key`.

**Parameters**

- `Integer key` - hashed name of the subordinate leaf

**Returns:** reference to a subordinate container node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf node or if there is no subordinate node
         with the hash value `key`

<a id="s-leaf-2"></a>
### leaf(String)

```java
public com.tailf.navu.NavuLeaf leaf(String key) throws com.tailf.navu.NavuException
```

Types: [NavuLeaf](NavuLeaf.md#s-NavuLeaf), [NavuException](NavuException.md#s-NavuException)

Returns a reference to a subordinate `leaf` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate leaf

**Returns:** reference to a subordinate leaf node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf node or if there is no subordinate node
         with the name `key`

<a id="s-leafList"></a>
### leafList(ConfNamespace, String)

```java
public com.tailf.navu.NavuLeafList leafList(
    com.tailf.conf.ConfNamespace ns,
    String leafListName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#s-NavuLeafList), [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-leafList-1"></a>
### leafList(Integer)

```java
public com.tailf.navu.NavuLeafList leafList(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#s-NavuLeafList), [NavuException](NavuException.md#s-NavuException)

Returns a reference to a subordinate `leaf-list` with
 the hash value `key`.

**Parameters**

- `Integer key` - hashed name of the subordinate leaf-list

**Returns:** reference to a subordinate leaf-list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf-list node or if there is no subordinate node
         with the hash value `key`

<a id="s-leafList-2"></a>
### leafList(String)

```java
public com.tailf.navu.NavuLeafList leafList(String key) throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#s-NavuLeafList), [NavuException](NavuException.md#s-NavuException)

Returns a reference to a subordinate `leaf-list` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate leaf-list

**Returns:** reference to a subordinate leaf-list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf-list node or if there is no subordinate node
         with the name `key`

<a id="s-list"></a>
### list(ConfNamespace, String)

```java
public com.tailf.navu.NavuList list(
    com.tailf.conf.ConfNamespace ns,
    String listName
)
    throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#s-NavuList), [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-list-1"></a>
### list(Integer)

```java
public com.tailf.navu.NavuList list(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#s-NavuList), [NavuException](NavuException.md#s-NavuException)

Returns a reference to a subordinate `list` with the
 hash value `key`.

**Parameters**

- `Integer key` - the hashed name of the subordinate list

**Returns:** reference to a subordinate list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a list node or if there is no subordinate node
         with the hash value `key`

<a id="s-list-2"></a>
### list(String)

```java
public com.tailf.navu.NavuList list(String key) throws com.tailf.navu.NavuException
```

Types: [NavuList](NavuList.md#s-NavuList), [NavuException](NavuException.md#s-NavuException)

Returns a reference to a subordinate `list` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate list

**Returns:** reference to a subordinate list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a list node or if there is no subordinate node
         with the name `key`

<a id="s-namespace"></a>
### namespace(String)

```java
public com.tailf.navu.NavuContainer namespace(String ns) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

The namespace specified here will be used when selecting a child
 to this NavuContainer and returns a reference to this NavuContainer
 object according to the given namespace id `ns`.

**Parameters**

- `String ns` - the namespace id

**Returns:** reference to this NavuContainer object

<a id="s-prefix"></a>
### prefix(String)

```java
public com.tailf.navu.NavuContainer prefix(String nsPrefix) throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-prepareXMLCall"></a>
### prepareXMLCall(String)

```java
public com.tailf.navu.PreparedXMLStatement prepareXMLCall(
    String xml
)
    throws com.tailf.navu.NavuException
```

Types: [PreparedXMLStatement](PreparedXMLStatement.md#s-PreparedXMLStatement), [NavuException](NavuException.md#s-NavuException)

Creates a parameterized configuration xml in the style of a
 `#setValues(String)` argument. The string "?" denotes a
 parameterized value.

 When the values that correspond to ? are known, they can be set
 using [`PreparedXMLStatement`](PreparedXMLStatement.md#s-PreparedXMLStatement)
 or [`PreparedXMLStatement`](PreparedXMLStatement.md#s-PreparedXMLStatement).

 Once all parameters have been set, the entire xml can be written using
 [`PreparedXMLStatement`](PreparedXMLStatement.md#s-PreparedXMLStatement).

 Any parameterized value that is not populated by `put` before
 `setValues` is called, is treated as a
 [`ConfDefault`](../conf/ConfDefault.md#s-ConfDefault).




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

**See also:** [`PreparedXMLStatement`](PreparedXMLStatement.md#s-PreparedXMLStatement)

<a id="s-refresh"></a>
### refresh()

```java
protected abstract void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

<a id="s-reset"></a>
### reset()

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

<a id="s-select"></a>
### select(ConfObject[])

```java
public abstract java.util.Collection<com.tailf.navu.NavuNode> select(
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
public abstract java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `java.util.List<String> query` - a list of regular expression.

**Returns:** a collection a nodes marching the query

<a id="s-select-2"></a>
### select(String)

```java
public abstract java.util.Collection<com.tailf.navu.NavuNode> select(
    String query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String query` - a "/" separated regular expression.

**Returns:** a collection a nodes marching the query

<a id="s-setChange"></a>
### setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)

```java
public abstract com.tailf.navu.NavuNode setChange(
    java.util.List<com.tailf.conf.ConfObject> path,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfValue oldValue,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfObject](../conf/ConfObject.md#s-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag), [ConfValue](../conf/ConfValue.md#s-ConfValue), [NavuContext](NavuContext.md#s-NavuContext), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> path`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

<a id="s-setValues"></a>
### setValues(ConfXMLParam[])

```java
public void setValues(com.tailf.conf.ConfXMLParam[] params) throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

Set arbitrary sub-elements of a container or list entry.

 The [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) array must be populated with values
 according to the specification of the `ConfXMLParam`
 array structure.

 If the container or list entry itself, or any sub-elements
 that are specified as existing, do not exist before this
 call, they will be created, otherwise the existing values will
 be updated.

 Both mandatory and optional elements may be
 omitted from the array, and all omitted elements are left unchanged.

 To actually delete a non-mandatory leaf or presence container,
 [`ConfNoExists`](../conf/ConfNoExists.md#s-ConfNoExists) should be used in the corresponding
 [`ConfXMLParamValue`](../conf/ConfXMLParamValue.md#s-ConfXMLParamValue).

 For a list entry, the key values can be specified either in the
 path or via key elements in `ConfXMLParamValue` -
 if the values are in the path, the key elements can be omitted
 from the array. For sub-lists present in the array, the key elements
 must of course always also be present though,
 immediately following the [`ConfXMLParamStart`](../conf/ConfXMLParamStart.md#s-ConfXMLParamStart)
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

<a id="s-setValues-1"></a>
### setValues(String)

```java
public void setValues(String xml) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Set arbitrary sub-elements of a container or list entry.

 This method shares the same behavior as
 [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) but the input parameter is
 an *XML* string.

 The *XML* string passed as the input parameter
 should reflect the equivalent [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) array structure.

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

**See also:** [`setValues(ConfXMLParam[])`](NavuNode.md#s-setValues), [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam)

<a id="s-sharedSetValues"></a>
### sharedSetValues(ConfXMLParam[])

```java
public void sharedSetValues(
    com.tailf.conf.ConfXMLParam[] params
)
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#s-ConfXMLParam), [NavuException](NavuException.md#s-NavuException)

Set arbitrary sub-elements of a container or list entry
 with FastMap support, creating backpointers and reference counter.
 All FastMap code shall (in principle) always use this method instead
 of setValues().

**Parameters**

- `com.tailf.conf.ConfXMLParam[] params`

<a id="s-sharedSetValues-1"></a>
### sharedSetValues(String)

```java
public void sharedSetValues(String xml) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Set arbitrary sub-elements of a container or list entry
 with FastMap support, creating backpointers and reference counter.
 All FastMap code shall (in principle) always use this method instead
 of setValues().

 This method shares the same behavior as
 [`ConfXMLParam`](../conf/ConfXMLParam.md#s-ConfXMLParam) but the input parameter is
 an *XML* string.

**Parameters**

- `String xml`

<a id="s-stopCdbSession"></a>
### stopCdbSession()

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

<a id="s-valueUpdateInd"></a>
### valueUpdateInd(NavuNode)

```java
public abstract void valueUpdateInd(
    com.tailf.navu.NavuNode child
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuNode child`

<a id="s-xPathSelect"></a>
### xPathSelect(String)

```java
public java.util.List<com.tailf.navu.NavuNode> xPathSelect(
    String query
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

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

<a id="s-xPathSelectIterate"></a>
### xPathSelectIterate(String, NavuNodeSetIterate)

```java
public void xPathSelectIterate(
    String query,
    com.tailf.navu.NavuNodeSetIterate iterate
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNodeSetIterate](NavuNodeSetIterate.md#s-NavuNodeSetIterate), [NavuException](NavuException.md#s-NavuException)

Iterate through a NodeSet based on a supplied XPath query.
 Instead of retrieving a list of nodes as with
 `#xPathSelect(String)` in this method a supplied
 callback is called for each node in the result set.
 See [`NavuNodeSetIterate`](NavuNodeSetIterate.md#s-NavuNodeSetIterate).

**Parameters**

- `String query` - XPath 1.0 query
- `com.tailf.navu.NavuNodeSetIterate iterate` - supplied user code

**Throws**

- `NavuException`
