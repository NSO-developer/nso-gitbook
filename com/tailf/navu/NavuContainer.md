<a id="s-NavuContainer"></a>
# NavuContainer

```java
public class com.tailf.navu.NavuContainer
    extends com.tailf.navu.NavuNode
    implements com.tailf.maapi.MaapiDiffIterate
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [MaapiDiffIterate](../maapi/MaapiDiffIterate.md#s-MaapiDiffIterate)

`NavuContainer` is a representation of the *yang*
 construct *container,module* and *list-entry*.

 A `NavuContainer` is usually supplied or returned from
 a method call. It can also be created using one of its constructors,
 typically [`NavuContainer`](NavuContainer.md#s-NavuContainer).

 A `NavuContainer` is created with a `NavuContext`
 initialized with a `Maapi` socket:




```
   NavuContext context = new NavuContext(maapi);
   context.startRunningTrans(Conf.MODE_READ_WRITE);
   NavuContainer root = new NavuContainer(context);
```




 As shown above, a transaction must be started before the context can be
 used for navigating.

 A transaction can alternatively be started for operational data instead:




```
   NavuContext context = new NavuContext(maapi);
   context.startOperationalTrans(Conf.MODE_READ_WRITE);
   NavuContainer root = new NavuContainer(context);
```




 Either way, when a `NavuContainer` is created using the above
 mentioned context, the object pointed to by `root` is the "root"
 of the *NAVU-Tree*.

 The root's children represent all of the loaded *modules*. To
 choose a particular module, the method `#container(Integer)`
 must be called with the hash value of the corresponding module
 ([`ConfNamespace`](../conf/ConfNamespace.md#s-ConfNamespace)).
 This will return a new `NavuContainer` pointing to the root of
 the chosen module.




```
   NavuContainer module = root.container(new Ncs().hash());
```




 To continue further down to the next child, use
 `#container(Integer)`, `#container(String)`,
 `#list(Integer)`, `#list(String)` or `#leaf(Integer)`,
 `#leaf(String)` as dictated by the YANG model.
 The string version is the corresponding
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#s-MaapiSchemas) of the *Integer* parameter
 which is the hash value of the tag name.

 Usually the generated namespace classes static method are used for
 convenience. The absence of underscore (_) at the end of the
 static field name indicates the integer version.

 Then continuing with the devices node:



```
   NavuContainer devicesNode = module.container(Ncs._devices);
```

**Related classes**

- [NavuListEntry](NavuListEntry.md#s-NavuListEntry)

## Members

**Constructors**:

- [NavuContainer()](#s-NavuContainer-1)
- [NavuContainer(Maapi, int, int)](#s-NavuContainer-2)
- [NavuContainer(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])](#s-NavuContainer-3)
- [NavuContainer(NavuContext)](#s-NavuContainer-4)
- [NavuContainer(NavuContext, CSNode, NavuNode, Formats)](#s-NavuContainer-5)
- [NavuContainer(NavuContext, CSNode, NavuNode, String, Object[])](#s-NavuContainer-6)
- [NavuContainer(NavuContext, CSSchema, NavuNode, String, Object[])](#s-NavuContainer-7)

**Fields**:

- [arguments](NavuNode.md#s-arguments) from NavuNode
- [change](NavuNode.md#s-change) from NavuNode
- [changeMap](#s-changeMap)
- [context](NavuNode.md#s-context) from NavuNode
- [criteria](#s-criteria)
- [duplicateSet](#s-duplicateSet)
- [fmt](NavuNode.md#s-fmt) from NavuNode
- [isCreated](#s-isCreated)
- [isRefreshed](#s-isRefreshed)
- [isRootModulesPopulated](#s-isRootModulesPopulated)
- [key](#s-key)
- [map](#s-map)
- [mountId](NavuNode.md#s-mountId) from NavuNode
- [myConfPath](NavuNode.md#s-myConfPath) from NavuNode
- [name2Choice](#s-name2Choice)
- [node](NavuNode.md#s-node) from NavuNode
- [node2Choice](#s-node2Choice)
- [parent](NavuNode.md#s-parent) from NavuNode
- [rootHash](#s-rootHash)
- [sch](#s-sch)

**Methods**:

- [action(Integer)](#s-action)
- [action(String)](#s-action-1)
- [addModule(NavuContainer)](#s-addModule)
- [children()](#s-children)
- [choice(String)](#s-choice)
- [container(ConfNamespace, String)](#s-container)
- [container(Integer)](#s-container-1)
- [container(String)](#s-container-2)
- [containsNode(NavuNode)](#s-containsNode)
- [containsNode(String)](#s-containsNode-1)
- [context()](NavuNode.md#s-context-1) from NavuNode
- [create()](#s-create)
- [delete()](#s-delete)
- [encodeValues()](#s-encodeValues)
- [encodeXML()](#s-encodeXML)
- [entrySet()](#s-entrySet)
- [equals(Object)](#s-equals)
- [exists()](#s-exists)
- [filterChildren(CSNode)](NavuNode.md#s-filterChildren) from NavuNode
- [findChanges(NavuContext, Integer[])](#s-findChanges)
- [get(String)](#s-get)
- [getChangeFlag()](NavuNode.md#s-getChangeFlag) from NavuNode
- [getChanges(NavuContext)](NavuNode.md#s-getChanges) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#s-getChanges-1) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#s-getChanges-2) from NavuNode
- [getConfPath()](NavuNode.md#s-getConfPath) from NavuNode
- [getInfo()](NavuNode.md#s-getInfo) from NavuNode
- [getKey()](#s-getKey)
- [getKeyPath()](NavuNode.md#s-getKeyPath) from NavuNode
- [getName()](NavuNode.md#s-getName) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#s-getNavuNode) from NavuNode
- [getParent()](NavuNode.md#s-getParent) from NavuNode
- [getRootNS()](#s-getRootNS)
- [getSchema(int)](#s-getSchema)
- [getSelectCaseAsNavuChoice(String)](#s-getSelectCaseAsNavuChoice)
- [getSelectCaseAsNavuNode(String)](#s-getSelectCaseAsNavuNode)
- [getSelectedCase(String)](#s-getSelectedCase)
- [getUserSession()](#s-getUserSession)
- [getValues(ConfXMLParam[])](NavuNode.md#s-getValues) from NavuNode
- [getValues(String)](NavuNode.md#s-getValues-1) from NavuNode
- [h2str(Integer)](#s-h2str)
- [handleDuplicateChildren(List<CSNode>)](#s-handleDuplicateChildren)
- [hashCode()](#s-hashCode)
- [isCreated()](#s-isCreated-1)
- [isEmpty()](#s-isEmpty)
- [isListInstance()](#s-isListInstance)
- [isNodeNavuLocal()](#s-isNodeNavuLocal)
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#s-iterate)
- [keySet()](#s-keySet)
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
- [populateChildren(List<CSNode>)](#s-populateChildren)
- [populateChoices()](#s-populateChoices)
- [prefix(String)](#s-prefix)
- [prepareXMLCall(String)](NavuNode.md#s-prepareXMLCall) from NavuNode
- [refresh()](#s-refresh)
- [reset()](#s-reset)
- [safeCreate()](#s-safeCreate)
- [select(ConfObject[])](#s-select)
- [select(List<String>)](#s-select-1)
- [select(String)](#s-select-2)
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](#s-setChange)
- [setKey(ConfKey)](#s-setKey)
- [setOperFlag(DiffIterateOperFlag)](#s-setOperFlag)
- [setValues(ConfXMLParam[])](NavuNode.md#s-setValues) from NavuNode
- [setValues(String)](NavuNode.md#s-setValues-1) from NavuNode
- [sharedCreate()](#s-sharedCreate)
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#s-sharedSetValues) from NavuNode
- [sharedSetValues(String)](NavuNode.md#s-sharedSetValues-1) from NavuNode
- [size()](#s-size)
- [stopCdbSession()](NavuNode.md#s-stopCdbSession) from NavuNode
- [toString()](#s-toString)
- [valueUpdateInd(NavuNode)](#s-valueUpdateInd)
- [xPathSelect(String)](NavuNode.md#s-xPathSelect) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#s-xPathSelectIterate) from NavuNode

## Constructors

<a id="s-NavuContainer-1"></a>
### NavuContainer()

```java
public NavuContainer()
```

This constructor creates a *root* container. This container
 holds all loaded schemas as its children.

<a id="s-NavuContainer-2"></a>
### NavuContainer(Maapi, int, int)

```java
public NavuContainer(com.tailf.maapi.Maapi m, int handle, int rootHash)
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi)

Constructor for a single namespace. Bypasses the
 *root* node.

**Parameters**

- `com.tailf.maapi.Maapi m` - *READ* or *READ_WRITE* `MAAPI` socket
- `int handle` - a valid transaction handle
- `int rootHash` - the root hash of the *module*

<a id="s-NavuContainer-3"></a>
### NavuContainer(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])

```java
protected NavuContainer(
    com.tailf.maapi.Maapi m,
    int handle,
    com.tailf.maapi.MaapiSchemas sch,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    String fmt,
    Object[] arguments
)
```

Types: [Maapi](../maapi/Maapi.md#s-Maapi), [MaapiSchemas](../maapi/MaapiSchemas.md#s-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.maapi.Maapi m`
- `int handle`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`

<a id="s-NavuContainer-4"></a>
### NavuContainer(NavuContext)

```java
public NavuContainer(com.tailf.navu.NavuContext context)
```

Types: [NavuContext](NavuContext.md#s-NavuContext)

Creates an *root* `NavuContainer` a starting point of
 which further navigation is performed.

**Parameters**

- `com.tailf.navu.NavuContext context` - determines the Navigation restriction and
        constraints

<a id="s-NavuContainer-5"></a>
### NavuContainer(NavuContext, CSNode, NavuNode, Formats)

```java
protected NavuContainer(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    com.tailf.navu.KeyPath2NavuNode.Formats fs
)
```

Types: [NavuContext](NavuContext.md#s-NavuContext), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode), [Formats](KeyPath2NavuNode/Formats.md#s-Formats)

KeyPath2NavuNode specific constructor

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.navu.KeyPath2NavuNode.Formats fs`

<a id="s-NavuContainer-6"></a>
### NavuContainer(NavuContext, CSNode, NavuNode, String, Object[])

```java
protected NavuContainer(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    String fmt,
    Object[] arguments
)
```

Types: [NavuContext](NavuContext.md#s-NavuContext), [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`

<a id="s-NavuContainer-7"></a>
### NavuContainer(NavuContext, CSSchema, NavuNode, String, Object[])

```java
protected NavuContainer(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSSchema module,
    com.tailf.navu.NavuNode parent,
    String fmt,
    Object[] arguments
)
```

Types: [NavuContext](NavuContext.md#s-NavuContext), [CSSchema](../maapi/MaapiSchemas/CSSchema.md#s-CSSchema), [NavuNode](NavuNode.md#s-NavuNode)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSSchema module`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`


## Fields

<a id="s-changeMap"></a>
### changeMap

```java
protected java.util.Map<com.tailf.conf.ConfKey,com.tailf.navu.NavuChange> changeMap = null;
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuChange](NavuChange.md#s-NavuChange)

<a id="s-criteria"></a>
### criteria

```java
protected Integer[] criteria = null;
```

<a id="s-duplicateSet"></a>
### duplicateSet

```java
protected java.util.HashSet<String> duplicateSet = null;
```

<a id="s-isCreated"></a>
### isCreated

```java
protected boolean isCreated = null;
```

<a id="s-isRefreshed"></a>
### isRefreshed

```java
protected boolean isRefreshed = null;
```

<a id="s-isRootModulesPopulated"></a>
### isRootModulesPopulated

```java
protected boolean isRootModulesPopulated = null;
```

<a id="s-key"></a>
### key

```java
protected com.tailf.conf.ConfKey key = null;
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey)

<a id="s-map"></a>
### map

```java
protected java.util.Map<String,com.tailf.navu.NavuNode> map = null;
```

Types: [NavuNode](NavuNode.md#s-NavuNode)

<a id="s-name2Choice"></a>
### name2Choice

```java
protected java.util.Map<String,com.tailf.navu.NavuChoice> name2Choice = null;
```

Types: [NavuChoice](NavuChoice.md#s-NavuChoice)

<a id="s-node2Choice"></a>
### node2Choice

```java
protected java.util.Map<com.tailf.maapi.MaapiSchemas.CSNode,com.tailf.navu.NavuChoice> node2Choice = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode), [NavuChoice](NavuChoice.md#s-NavuChoice)

<a id="s-rootHash"></a>
### rootHash

```java
protected int rootHash = null;
```

<a id="s-sch"></a>
### sch

```java
protected com.tailf.maapi.MaapiSchemas sch = null;
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#s-MaapiSchemas)


## Methods

<a id="s-action"></a>
### action(Integer)

```java
public com.tailf.navu.NavuAction action(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuAction](NavuAction.md#s-NavuAction), [NavuException](NavuException.md#s-NavuException)

Returns a reference to a subordinate `action` with
 the hash value `key`.

**Parameters**

- `Integer key` - the name of the subordinate action

**Returns:** reference to a subordinate action node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         an action node or if there is no subordinate node
         with the hash value `key`

<a id="s-action-1"></a>
### action(String)

```java
public com.tailf.navu.NavuAction action(String key) throws com.tailf.navu.NavuException
```

Types: [NavuAction](NavuAction.md#s-NavuAction), [NavuException](NavuException.md#s-NavuException)

Returns a reference to a subordinate `action` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate action

**Returns:** reference to a subordinate action node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a action node or if there is no subordinate node
         with the name `key`

<a id="s-addModule"></a>
### addModule(NavuContainer)

```java
protected void addModule(com.tailf.navu.NavuContainer child)
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer)

**Parameters**

- `com.tailf.navu.NavuContainer child`

<a id="s-children"></a>
### children()

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

Returns a collection containing the children of this container.

**Returns:** the children of this container

<a id="s-choice"></a>
### choice(String)

```java
public com.tailf.navu.NavuChoice choice(String name) throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#s-NavuChoice), [NavuException](NavuException.md#s-NavuException)

Returns a reference to a subordinate `choice` with
 the name `name`.

**Parameters**

- `String name` - the name of the choice to return

**Returns:** a matching choice

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


 To get the namespace, you can use
 [`ConfNamespace`](../conf/ConfNamespace.md#s-ConfNamespace)
 with the namespace identifier or URI.

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
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#s-MaapiSchemas). It is also possible to access
 a container based on its name only, using the overloaded method
 `#container(String)`.

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

<a id="s-containsNode"></a>
### containsNode(NavuNode)

```java
public boolean containsNode(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

Checks if the given node is a direct child of this container according
 to the schema.

**Parameters**

- `com.tailf.navu.NavuNode node`

**Returns:** true if `node` is a child of this container

<a id="s-containsNode-1"></a>
### containsNode(String)

```java
public boolean containsNode(String nodeName) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Checks if there is a child node in the schema with given name.

**Parameters**

- `String nodeName` - the name of a node to look for

**Returns:** true if there is a match

<a id="s-create"></a>
### create()

```java
public com.tailf.navu.NavuContainer create() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Creates an optional container.

**Returns:** a pointer to self.

**Throws**

- `NavuException`

<a id="s-delete"></a>
### delete()

```java
public com.tailf.navu.NavuContainer delete() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Deletes an optional container.

**Returns:** a pointer to self.

**Throws**

- `NavuException`

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

<a id="s-entrySet"></a>
### entrySet()

```java
public java.util.Set<java.util.Map.Entry<String,com.tailf.navu.NavuNode>> entrySet() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

Returns a set of value-pairs.

**Returns:** a set of nodeName-node pairs according to the schema

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuContainer`
 for equality. Returns `true` if the specified object
 is also a `NavuContainer` and either of the following
 is true:



- Both nodes are modules according to [`NavuNodeInfo`](NavuNodeInfo.md#s-NavuNodeInfo))
 and they have the same namespace URI.

   - The nodes are not modules, and have identical [`ConfPath`](../conf/ConfPath.md#s-ConfPath)
 instances.

**Parameters**

- `Object o` - the object to be compared for equality with this
          `NavuContainer`

**Returns:** `true` if the specified object is equal to this
         `NavuContainer`

<a id="s-exists"></a>
### exists()

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Verifies the existence of container.

**Returns:** boolean

**Throws**

- `NavuException`

<a id="s-findChanges"></a>
### findChanges(NavuContext, Integer[])

```java
public java.util.Map<com.tailf.conf.ConfKey,com.tailf.navu.NavuChange> findChanges(
    com.tailf.navu.NavuContext delContext,
    Integer[] criteria
)
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey), [NavuChange](NavuChange.md#s-NavuChange), [NavuContext](NavuContext.md#s-NavuContext), [NavuException](NavuException.md#s-NavuException)

Analyzes what changes has been done within this
 transaction. The prerequisites are: 

- This is the
 container of a module.    - That this container has been
 created using two MAAPI sockets.

 Since deletes are already removed in current transactions a delete
 context is necessary to retrieve information about delete changes.
 The `delContext` is a NavuContext with a read transaction
 on the running database to read deletes. If null delete changes will not
 be able to be retrieved.

**Parameters**

- `com.tailf.navu.NavuContext delContext` - NavuContext to retrieve deleted values with.
- `Integer[] criteria` - a list hash values representing a search
 path. The first element is the module name hash. The analysis
 will be started at the end of the list. List elements are
 represented by 0.

**Returns:** a map between key and NavuChange

**Throws**

- `NavuException`

<a id="s-get"></a>
### get(String)

```java
public com.tailf.navu.NavuNode get(String nodeName) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

Returns a subordinate node with the name `nodeName`.

**Parameters**

- `String nodeName` - a name of a node contained within this container.

**Returns:** a matching node

**Throws**

- `NavuException` - if subordinate node has no matching container
         with the name `nodeName`

<a id="s-getKey"></a>
### getKey()

```java
public com.tailf.conf.ConfKey getKey()
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey)

If this container is a list instance this method
 can be used to get the list entry key.
 Otherwise this method returns null.

**Returns:** the key as a ConfKey object

<a id="s-getRootNS"></a>
### getRootNS()

```java
public com.tailf.conf.ConfNamespace getRootNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#s-ConfNamespace)

<a id="s-getSchema"></a>
### getSchema(int)

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getSchema(int rootHash)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `int rootHash`

<a id="s-getSelectCaseAsNavuChoice"></a>
### getSelectCaseAsNavuChoice(String)

```java
public java.util.List<com.tailf.navu.NavuChoice> getSelectCaseAsNavuChoice(
    String choice
)
    throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#s-NavuChoice), [NavuException](NavuException.md#s-NavuException)

Returns a collection of the "toplevel" choice elements of
 the a current selected case.

 Returns null if no case is selected for the specified `choice` or
 if the selected case contains no choices.

**Parameters**

- `String choice` - the choice name to get selected case for

**Returns:** toplevel NavuChoices's for the selected case or null
 if no selected case is selected.

**Throws**

- `NavuException` - if this container does not contains the
 choice with the specified name `choice`

<a id="s-getSelectCaseAsNavuNode"></a>
### getSelectCaseAsNavuNode(String)

```java
public java.util.List<com.tailf.navu.NavuNode> getSelectCaseAsNavuNode(
    String choice
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

Returns a collection of the top-level node elements of
 the currently selected case of the specified `choice`.

 Returns null if no case is selected for the specified
 `choice` or if the selected case contains no nodes.

 Which of the subclasses NavuContainer, NavuList or NavuLeaf
 that actually constitute this case is defined by the model
 or has to be tested.

**Parameters**

- `String choice` - the choice name to get selected case for

**Returns:** top-level NavuNodes for the selected case or null
 if no case is selected.

**Throws**

- `NavuException` - if this container does not contains the
 choice with the specified name `choice`

<a id="s-getSelectedCase"></a>
### getSelectedCase(String)

```java
public com.tailf.maapi.MaapiSchemas.CSCase getSelectedCase(
    String choice
)
    throws com.tailf.navu.NavuException
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#s-CSCase), [NavuException](NavuException.md#s-NavuException)

Returns the selected cases of  a given choice.

**Parameters**

- `String choice` - of the choice to get selected case for.

**Returns:** - the selected case

<a id="s-getUserSession"></a>
### getUserSession()

```java
public int getUserSession() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Get the current Maapi user session if this container context uses
 Maapi. Throws exception if the context is not Maapi.

**Returns:** user session id

**Throws**

- `NavuException`

<a id="s-h2str"></a>
### h2str(Integer)

```java
protected String h2str(Integer hash)
```

**Parameters**

- `Integer hash`

<a id="s-handleDuplicateChildren"></a>
### handleDuplicateChildren(List<CSNode>)

```java
protected void handleDuplicateChildren(java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

**Parameters**

- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children`

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-isCreated-1"></a>
### isCreated()

```java
protected boolean isCreated()
```

Checks if the container has been created.

**Returns:** true if it exists or if minOccurs > 0

<a id="s-isEmpty"></a>
### isEmpty()

```java
public boolean isEmpty() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Checks if the container has any members.

**Returns:** true if it has 1 or more members.

<a id="s-isListInstance"></a>
### isListInstance()

```java
public boolean isListInstance()
```

Returns `true` if this `NavuContainer`
 represents a *list-entry*

**Returns:** `true` if this `NavuContainer`
         is a *list-entry* *false* otherwise

<a id="s-isNodeNavuLocal"></a>
### isNodeNavuLocal()

**Package-private**

```java
boolean isNodeNavuLocal()
```

<a id="s-iterate"></a>
### iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)

```java
public com.tailf.conf.DiffIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfObject oldValue,
    com.tailf.conf.ConfObject newValue,
    Object state
)
```

Types: [DiffIterateResultFlag](../conf/DiffIterateResultFlag.md#s-DiffIterateResultFlag), [ConfObject](../conf/ConfObject.md#s-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object state`

<a id="s-keySet"></a>
### keySet()

```java
public java.util.Set<String> keySet() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Returns a set of nodeNames.

**Returns:** a set of nodeNames

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


 To get the namespace, you can use
 [`ConfNamespace`](../conf/ConfNamespace.md#s-ConfNamespace)
 with the namespace identifier or URI.

**Parameters**

- `com.tailf.conf.ConfNamespace ns` - the namespace object
- `String leafName` - the name of the subordinate leaf

**Returns:** reference to a subordinate leaf node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf node or if there is no subordinate node
         with the name `key` in the namespace
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


 To get the namespace, you can use
 [`ConfNamespace`](../conf/ConfNamespace.md#s-ConfNamespace)
 with the namespace identifier or URI.

**Parameters**

- `com.tailf.conf.ConfNamespace ns` - the namespace object
- `String leafListName` - the name of the subordinate leaf-list

**Returns:** reference to a subordinate leaf-list node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a leaf-list node or if there is no subordinate node
         with the name `leafListName` in the namespace
         `ns`

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

<a id="s-populateChildren"></a>
### populateChildren(List<CSNode>)

```java
protected void populateChildren(java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#s-CSNode)

Populates children of this node and place it in the hashmap.

 The first level is handled differently since all children must
 have a prefix at the first level.

**Parameters**

- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children`

<a id="s-populateChoices"></a>
### populateChoices()

```java
protected void populateChoices() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#s-ConfException)

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

<a id="s-refresh"></a>
### refresh()

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Reads node member values according to the node schema.

<a id="s-reset"></a>
### reset()

```java
public void reset()
```

Resets the contained nodes

<a id="s-safeCreate"></a>
### safeCreate()

```java
public com.tailf.navu.NavuContainer safeCreate() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Creates an optional container. Will silently ignore the error
 when the container already exists

**Returns:** a pointer to self.

**Throws**

- `NavuException`

<a id="s-select"></a>
### select(ConfObject[])

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [ConfObject](../conf/ConfObject.md#s-ConfObject), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`

<a id="s-select-1"></a>
### select(List<String>)

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `java.util.List<String> path`

<a id="s-select-2"></a>
### select(String)

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    String path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `String path`

<a id="s-setChange"></a>
### setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)

```java
public com.tailf.navu.NavuNode setChange(
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

<a id="s-setKey"></a>
### setKey(ConfKey)

```java
protected void setKey(com.tailf.conf.ConfKey key)
```

Types: [ConfKey](../conf/ConfKey.md#s-ConfKey)

**Parameters**

- `com.tailf.conf.ConfKey key`

<a id="s-setOperFlag"></a>
### setOperFlag(DiffIterateOperFlag)

```java
protected void setOperFlag(com.tailf.conf.DiffIterateOperFlag flag)
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#s-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.DiffIterateOperFlag flag`

<a id="s-sharedCreate"></a>
### sharedCreate()

```java
public com.tailf.navu.NavuContainer sharedCreate() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#s-NavuContainer), [NavuException](NavuException.md#s-NavuException)

Creates an optional container.

 Will silently ignore the error
 when the container is not a presence container. It will also
 maintain a counter (as an attribute) counting how many times
 the same containers has been created. This makes this method very
 useful for NCS fastmap users where sometimes we wish to create
 services where multiple service instances share the seam structure.
 Furthermore, and attribute "Backpointer" will be created on the created
 container indicating which "service" created the object

**Returns:** a pointer to self.

**Throws**

- `NavuException`

<a id="s-size"></a>
### size()

```java
public int size() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#s-NavuException)

Returns the number of nodes contained by the container.

**Returns:** the number contained nodes.

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

<a id="s-valueUpdateInd"></a>
### valueUpdateInd(NavuNode)

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#s-NavuNode), [NavuException](NavuException.md#s-NavuException)

An indication received from a child node. The update indicates
 that a leaf node has been read/set or list node has been read/created
 for the first time. The main purpose of this indication is to trigger
 updates of choice related nodes.

**Parameters**

- `com.tailf.navu.NavuNode child` - the child node doing the update.
