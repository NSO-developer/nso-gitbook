# NavuContainer <a href="#cls-NavuContainer" id="cls-NavuContainer"></a>

```java
public class com.tailf.navu.NavuContainer
    extends com.tailf.navu.NavuNode
    implements com.tailf.maapi.MaapiDiffIterate
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [MaapiDiffIterate](../maapi/MaapiDiffIterate.md#cls-MaapiDiffIterate)

`NavuContainer` is a representation of the *yang*
 construct *container,module* and *list-entry*.

 A `NavuContainer` is usually supplied or returned from
 a method call. It can also be created using one of its constructors,
 typically [`NavuContainer(NavuContext)`](NavuContainer.md#m-NavuContainer-5734bf951268).

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
 choose a particular module, the method [`container(Integer)`](NavuContainer.md#m-container-abb10ecdc3f6)
 must be called with the hash value of the corresponding module
 ([`ConfNamespace#hash()`](../conf/ConfNamespace.md#m-hash-88880b48029e)).
 This will return a new `NavuContainer` pointing to the root of
 the chosen module.




```
   NavuContainer module = root.container(new Ncs().hash());
```




 To continue further down to the next child, use
 [`container(Integer)`](NavuContainer.md#m-container-abb10ecdc3f6), [`container(String)`](NavuContainer.md#m-container-76f5d191b16d),
 [`list(Integer)`](NavuContainer.md#m-list-7dc96bdbb69a), [`list(String)`](NavuContainer.md#m-list-2c1a74a3cf07) or [`leaf(Integer)`](NavuContainer.md#m-leaf-47fda8402c20),
 [`leaf(String)`](NavuContainer.md#m-leaf-ac189787d67d) as dictated by the YANG model.
 The string version is the corresponding
 [`MaapiSchemas#hashToString(int)`](../maapi/MaapiSchemas.md#m-hashToString-54eaaef71976) of the *Integer* parameter
 which is the hash value of the tag name.

 Usually the generated namespace classes static method are used for
 convenience. The absence of underscore (_) at the end of the
 static field name indicates the integer version.

 Then continuing with the devices node:



```
   NavuContainer devicesNode = module.container(Ncs._devices);
```

**Related classes**

- [NavuListEntry](NavuListEntry.md#cls-NavuListEntry)

## Members

**Constructors**:

- [NavuContainer()](#m-NavuContainer-c89fa906ab01)
- [NavuContainer(Maapi, int, int)](#m-NavuContainer-cfcd7f6efb55)
- [NavuContainer(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[])](#m-NavuContainer-eceddc8da3ad)
- [NavuContainer(NavuContext)](#m-NavuContainer-5734bf951268)
- [NavuContainer(NavuContext, CSNode, NavuNode, Formats)](#m-NavuContainer-9b2631de44b3)
- [NavuContainer(NavuContext, CSNode, NavuNode, String, Object[])](#m-NavuContainer-b87ee18b07c9)
- [NavuContainer(NavuContext, CSSchema, NavuNode, String, Object[])](#m-NavuContainer-11ce3c1e636b)

**Fields**:

- [arguments](NavuNode.md#m-arguments) from NavuNode
- [change](NavuNode.md#m-change) from NavuNode
- [changeMap](#m-changeMap)
- [context](NavuNode.md#m-context) from NavuNode
- [criteria](#m-criteria)
- [duplicateSet](#m-duplicateSet)
- [fmt](NavuNode.md#m-fmt) from NavuNode
- [isCreated](#m-isCreated)
- [isRefreshed](#m-isRefreshed)
- [isRootModulesPopulated](#m-isRootModulesPopulated)
- [key](#m-key)
- [map](#m-map)
- [mountId](NavuNode.md#m-mountId) from NavuNode
- [myConfPath](NavuNode.md#m-myConfPath) from NavuNode
- [name2Choice](#m-name2Choice)
- [node](NavuNode.md#m-node) from NavuNode
- [node2Choice](#m-node2Choice)
- [parent](NavuNode.md#m-parent) from NavuNode
- [rootHash](#m-rootHash)
- [sch](#m-sch)

**Methods**:

- [action(Integer)](#m-action-31e90b24df5f)
- [action(String)](#m-action-ac3b339033ab)
- [addModule(NavuContainer)](#m-addModule-379e17a46072)
- [children()](#m-children-7d31300d62c3)
- [choice(String)](#m-choice-45a67115903b)
- [container(ConfNamespace, String)](#m-container-31c604ba30e3)
- [container(Integer)](#m-container-abb10ecdc3f6)
- [container(String)](#m-container-76f5d191b16d)
- [containsNode(NavuNode)](#m-containsNode-f554fdc5bf96)
- [containsNode(String)](#m-containsNode-445990dba920)
- [context()](NavuNode.md#m-context-0990f1a0bb68) from NavuNode
- [create()](#m-create-06e0ee4a42c2)
- [delete()](#m-delete-a9e76d49da61)
- [encodeValues()](#m-encodeValues-7bd911383b1a)
- [encodeXML()](#m-encodeXML-bdbcd52c2505)
- [entrySet()](#m-entrySet-20b678143b7e)
- [equals(Object)](#m-equals-fcd6492e0d6c)
- [exists()](#m-exists-56968a4c7bda)
- [filterChildren(CSNode)](NavuNode.md#m-filterChildren-e72b7b1ab25d) from NavuNode
- [findChanges(NavuContext, Integer[])](#m-findChanges-e1e823411f98)
- [get(String)](#m-get-e86cd4d90bf3)
- [getChangeFlag()](NavuNode.md#m-getChangeFlag-33cadf5a32ba) from NavuNode
- [getChanges(NavuContext)](NavuNode.md#m-getChanges-c106383f174d) from NavuNode
- [getChanges(NavuContext, boolean)](NavuNode.md#m-getChanges-bcf5b6dbccf2) from NavuNode
- [getChanges(NavuContext, boolean, DiffIterateOperFlag[])](NavuNode.md#m-getChanges-9f13a683b086) from NavuNode
- [getConfPath()](NavuNode.md#m-getConfPath-c7ca3cb63c17) from NavuNode
- [getInfo()](NavuNode.md#m-getInfo-259a72b5d74c) from NavuNode
- [getKey()](#m-getKey-9a8856159458)
- [getKeyPath()](NavuNode.md#m-getKeyPath-4c9200912948) from NavuNode
- [getName()](NavuNode.md#m-getName-2634b18b4a25) from NavuNode
- [getNavuNode(ConfPath)](NavuNode.md#m-getNavuNode-d19ad1dd90fc) from NavuNode
- [getParent()](NavuNode.md#m-getParent-45c1b196ed70) from NavuNode
- [getRootNS()](#m-getRootNS-3f1d054cecd6)
- [getSchema(int)](#m-getSchema-d43ad42eba79)
- [getSelectCaseAsNavuChoice(String)](#m-getSelectCaseAsNavuChoice-f6626477e806)
- [getSelectCaseAsNavuNode(String)](#m-getSelectCaseAsNavuNode-46fa4e27d61f)
- [getSelectedCase(String)](#m-getSelectedCase-3b005e9181ed)
- [getUserSession()](#m-getUserSession-7a9eeeb92f85)
- [getValues(ConfXMLParam[])](NavuNode.md#m-getValues-1eb02439a757) from NavuNode
- [getValues(String)](NavuNode.md#m-getValues-c03de090764d) from NavuNode
- [h2str(Integer)](#m-h2str-3096e9ba352b)
- [handleDuplicateChildren(List<CSNode>)](#m-handleDuplicateChildren-e69c1564b6e7)
- [hashCode()](#m-hashCode-ef797a217903)
- [isCreated()](#m-isCreated-bc9b3cb40910)
- [isEmpty()](#m-isEmpty-4dde48126244)
- [isListInstance()](#m-isListInstance-16ea9625f0d2)
- [isNodeNavuLocal()](#m-isNodeNavuLocal-3af8ba5398d1)
- [iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object)](#m-iterate-d80a566b7e0a)
- [keySet()](#m-keySet-66de8917ecb8)
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
- [populateChildren(List<CSNode>)](#m-populateChildren-40519dc6bd8c)
- [populateChoices()](#m-populateChoices-de48df56d517)
- [prefix(String)](#m-prefix-fdd71b8275bb)
- [prepareXMLCall(String)](NavuNode.md#m-prepareXMLCall-c22e250f2cac) from NavuNode
- [refresh()](#m-refresh-3852c3f76c8e)
- [reset()](#m-reset-6927918ac70a)
- [safeCreate()](#m-safeCreate-8125e14d387f)
- [select(ConfObject[])](#m-select-336dd76cd112)
- [select(List<String>)](#m-select-e81f36150174)
- [select(String)](#m-select-5031325154b9)
- [setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext)](#m-setChange-0bbeb54ebc15)
- [setKey(ConfKey)](#m-setKey-b8489388971b)
- [setOperFlag(DiffIterateOperFlag)](#m-setOperFlag-b50e9a2a8d38)
- [setValues(ConfXMLParam[])](NavuNode.md#m-setValues-50d8edffa795) from NavuNode
- [setValues(String)](NavuNode.md#m-setValues-3ec9581ce266) from NavuNode
- [sharedCreate()](#m-sharedCreate-7aef2e24f04b)
- [sharedSetValues(ConfXMLParam[])](NavuNode.md#m-sharedSetValues-705549be9df0) from NavuNode
- [sharedSetValues(String)](NavuNode.md#m-sharedSetValues-ad93c38b671f) from NavuNode
- [size()](#m-size-c6d8505255fd)
- [stopCdbSession()](NavuNode.md#m-stopCdbSession-17418252a986) from NavuNode
- [toString()](#m-toString-e9d48c5503ef)
- [valueUpdateInd(NavuNode)](#m-valueUpdateInd-e7cd65f79d78)
- [xPathSelect(String)](NavuNode.md#m-xPathSelect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate(String, NavuNodeSetIterate)](NavuNode.md#m-xPathSelectIterate-12547f34f47c) from NavuNode

## Constructors

### NavuContainer() <a href="#m-NavuContainer-c89fa906ab01" id="m-NavuContainer-c89fa906ab01"></a>

```java
public NavuContainer()
```

This constructor creates a *root* container. This container
 holds all loaded schemas as its children.

### NavuContainer(Maapi, int, int) <a href="#m-NavuContainer-cfcd7f6efb55" id="m-NavuContainer-cfcd7f6efb55"></a>

```java
public NavuContainer(com.tailf.maapi.Maapi m, int handle, int rootHash)
```

Types: [Maapi](../maapi/Maapi.md#cls-Maapi)

Constructor for a single namespace. Bypasses the
 *root* node.

**Parameters**

- `com.tailf.maapi.Maapi m` - *READ* or *READ_WRITE* `MAAPI` socket
- `int handle` - a valid transaction handle
- `int rootHash` - the root hash of the *module*

### NavuContainer(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#m-NavuContainer-eceddc8da3ad" id="m-NavuContainer-eceddc8da3ad"></a>

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

Types: [Maapi](../maapi/Maapi.md#cls-Maapi), [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.maapi.Maapi m`
- `int handle`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`

### NavuContainer(NavuContext) <a href="#m-NavuContainer-5734bf951268" id="m-NavuContainer-5734bf951268"></a>

```java
public NavuContainer(com.tailf.navu.NavuContext context)
```

Types: [NavuContext](NavuContext.md#cls-NavuContext)

Creates an *root* `NavuContainer` a starting point of
 which further navigation is performed.

**Parameters**

- `com.tailf.navu.NavuContext context` - determines the Navigation restriction and
        constraints

### NavuContainer(NavuContext, CSNode, NavuNode, Formats) <a href="#m-NavuContainer-9b2631de44b3" id="m-NavuContainer-9b2631de44b3"></a>

```java
protected NavuContainer(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    com.tailf.navu.KeyPath2NavuNode.Formats fs
)
```

Types: [NavuContext](NavuContext.md#cls-NavuContext), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode), [Formats](KeyPath2NavuNode/Formats.md#cls-Formats)

KeyPath2NavuNode specific constructor

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.navu.KeyPath2NavuNode.Formats fs`

### NavuContainer(NavuContext, CSNode, NavuNode, String, Object[]) <a href="#m-NavuContainer-b87ee18b07c9" id="m-NavuContainer-b87ee18b07c9"></a>

```java
protected NavuContainer(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    String fmt,
    Object[] arguments
)
```

Types: [NavuContext](NavuContext.md#cls-NavuContext), [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`

### NavuContainer(NavuContext, CSSchema, NavuNode, String, Object[]) <a href="#m-NavuContainer-11ce3c1e636b" id="m-NavuContainer-11ce3c1e636b"></a>

```java
protected NavuContainer(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSSchema module,
    com.tailf.navu.NavuNode parent,
    String fmt,
    Object[] arguments
)
```

Types: [NavuContext](NavuContext.md#cls-NavuContext), [CSSchema](../maapi/MaapiSchemas/CSSchema.md#cls-CSSchema), [NavuNode](NavuNode.md#cls-NavuNode)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSSchema module`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`


## Fields

### changeMap <a href="#m-changeMap" id="m-changeMap"></a>

```java
protected java.util.Map<com.tailf.conf.ConfKey,com.tailf.navu.NavuChange> changeMap = null;
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuChange](NavuChange.md#cls-NavuChange)

### criteria <a href="#m-criteria" id="m-criteria"></a>

```java
protected Integer[] criteria = null;
```

### duplicateSet <a href="#m-duplicateSet" id="m-duplicateSet"></a>

```java
protected java.util.HashSet<String> duplicateSet = null;
```

### isCreated <a href="#m-isCreated" id="m-isCreated"></a>

```java
protected boolean isCreated = null;
```

### isRefreshed <a href="#m-isRefreshed" id="m-isRefreshed"></a>

```java
protected boolean isRefreshed = null;
```

### isRootModulesPopulated <a href="#m-isRootModulesPopulated" id="m-isRootModulesPopulated"></a>

```java
protected boolean isRootModulesPopulated = null;
```

### key <a href="#m-key" id="m-key"></a>

```java
protected com.tailf.conf.ConfKey key = null;
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey)

### map <a href="#m-map" id="m-map"></a>

```java
protected java.util.Map<String,com.tailf.navu.NavuNode> map = null;
```

Types: [NavuNode](NavuNode.md#cls-NavuNode)

### name2Choice <a href="#m-name2Choice" id="m-name2Choice"></a>

```java
protected java.util.Map<String,com.tailf.navu.NavuChoice> name2Choice = null;
```

Types: [NavuChoice](NavuChoice.md#cls-NavuChoice)

### node2Choice <a href="#m-node2Choice" id="m-node2Choice"></a>

```java
protected java.util.Map<com.tailf.maapi.MaapiSchemas.CSNode,com.tailf.navu.NavuChoice> node2Choice = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode), [NavuChoice](NavuChoice.md#cls-NavuChoice)

### rootHash <a href="#m-rootHash" id="m-rootHash"></a>

```java
protected int rootHash = null;
```

### sch <a href="#m-sch" id="m-sch"></a>

```java
protected com.tailf.maapi.MaapiSchemas sch = null;
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#cls-MaapiSchemas)


## Methods

### action(Integer) <a href="#m-action-31e90b24df5f" id="m-action-31e90b24df5f"></a>

```java
public com.tailf.navu.NavuAction action(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuAction](NavuAction.md#cls-NavuAction), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `action` with
 the hash value `key`.

**Parameters**

- `Integer key` - the name of the subordinate action

**Returns:** reference to a subordinate action node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         an action node or if there is no subordinate node
         with the hash value `key`

### action(String) <a href="#m-action-ac3b339033ab" id="m-action-ac3b339033ab"></a>

```java
public com.tailf.navu.NavuAction action(String key) throws com.tailf.navu.NavuException
```

Types: [NavuAction](NavuAction.md#cls-NavuAction), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `action` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate action

**Returns:** reference to a subordinate action node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a action node or if there is no subordinate node
         with the name `key`

### addModule(NavuContainer) <a href="#m-addModule-379e17a46072" id="m-addModule-379e17a46072"></a>

```java
protected void addModule(com.tailf.navu.NavuContainer child)
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer)

**Parameters**

- `com.tailf.navu.NavuContainer child`

### children() <a href="#m-children-7d31300d62c3" id="m-children-7d31300d62c3"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Returns a collection containing the children of this container.

**Returns:** the children of this container

### choice(String) <a href="#m-choice-45a67115903b" id="m-choice-45a67115903b"></a>

```java
public com.tailf.navu.NavuChoice choice(String name) throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#cls-NavuChoice), [NavuException](NavuException.md#cls-NavuException)

Returns a reference to a subordinate `choice` with
 the name `name`.

**Parameters**

- `String name` - the name of the choice to return

**Returns:** a matching choice

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


 To get the namespace, you can use
 [`ConfNamespace#findNamespace(String)`](../conf/ConfNamespace.md#m-findNamespace-ffbcd6481b17)
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
 [`MaapiSchemas#stringToHash(String)`](../maapi/MaapiSchemas.md#m-stringToHash-7c2af24796ac). It is also possible to access
 a container based on its name only, using the overloaded method
 [`container(String)`](NavuContainer.md#m-container-76f5d191b16d).

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

### containsNode(NavuNode) <a href="#m-containsNode-f554fdc5bf96" id="m-containsNode-f554fdc5bf96"></a>

```java
public boolean containsNode(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Checks if the given node is a direct child of this container according
 to the schema.

**Parameters**

- `com.tailf.navu.NavuNode node`

**Returns:** true if `node` is a child of this container

### containsNode(String) <a href="#m-containsNode-445990dba920" id="m-containsNode-445990dba920"></a>

```java
public boolean containsNode(String nodeName) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Checks if there is a child node in the schema with given name.

**Parameters**

- `String nodeName` - the name of a node to look for

**Returns:** true if there is a match

### create() <a href="#m-create-06e0ee4a42c2" id="m-create-06e0ee4a42c2"></a>

```java
public com.tailf.navu.NavuContainer create() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Creates an optional container.

**Returns:** a pointer to self.

**Throws**

- `NavuException`

### delete() <a href="#m-delete-a9e76d49da61" id="m-delete-a9e76d49da61"></a>

```java
public com.tailf.navu.NavuContainer delete() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Deletes an optional container.

**Returns:** a pointer to self.

**Throws**

- `NavuException`

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

### entrySet() <a href="#m-entrySet-20b678143b7e" id="m-entrySet-20b678143b7e"></a>

```java
public java.util.Set<java.util.Map.Entry<String,com.tailf.navu.NavuNode>> entrySet() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Returns a set of value-pairs.

**Returns:** a set of nodeName-node pairs according to the schema

### equals(Object) <a href="#m-equals-fcd6492e0d6c" id="m-equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuContainer`
 for equality. Returns `true` if the specified object
 is also a `NavuContainer` and either of the following
 is true:



- Both nodes are modules according to [`NavuNodeInfo#isModule()`](NavuNodeInfo.md#m-isModule-387434ee044f))
 and they have the same namespace URI.

   - The nodes are not modules, and have identical [`ConfPath`](../conf/ConfPath.md#cls-ConfPath)
 instances.

**Parameters**

- `Object o` - the object to be compared for equality with this
          `NavuContainer`

**Returns:** `true` if the specified object is equal to this
         `NavuContainer`

### exists() <a href="#m-exists-56968a4c7bda" id="m-exists-56968a4c7bda"></a>

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Verifies the existence of container.

**Returns:** boolean

**Throws**

- `NavuException`

### findChanges(NavuContext, Integer[]) <a href="#m-findChanges-e1e823411f98" id="m-findChanges-e1e823411f98"></a>

```java
public java.util.Map<com.tailf.conf.ConfKey,com.tailf.navu.NavuChange> findChanges(
    com.tailf.navu.NavuContext delContext,
    Integer[] criteria
)
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey), [NavuChange](NavuChange.md#cls-NavuChange), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

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

### get(String) <a href="#m-get-e86cd4d90bf3" id="m-get-e86cd4d90bf3"></a>

```java
public com.tailf.navu.NavuNode get(String nodeName) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

Returns a subordinate node with the name `nodeName`.

**Parameters**

- `String nodeName` - a name of a node contained within this container.

**Returns:** a matching node

**Throws**

- `NavuException` - if subordinate node has no matching container
         with the name `nodeName`

### getKey() <a href="#m-getKey-9a8856159458" id="m-getKey-9a8856159458"></a>

```java
public com.tailf.conf.ConfKey getKey()
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey)

If this container is a list instance this method
 can be used to get the list entry key.
 Otherwise this method returns null.

**Returns:** the key as a ConfKey object

### getRootNS() <a href="#m-getRootNS-3f1d054cecd6" id="m-getRootNS-3f1d054cecd6"></a>

```java
public com.tailf.conf.ConfNamespace getRootNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#cls-ConfNamespace)

### getSchema(int) <a href="#m-getSchema-d43ad42eba79" id="m-getSchema-d43ad42eba79"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getSchema(int rootHash)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `int rootHash`

### getSelectCaseAsNavuChoice(String) <a href="#m-getSelectCaseAsNavuChoice-f6626477e806" id="m-getSelectCaseAsNavuChoice-f6626477e806"></a>

```java
public java.util.List<com.tailf.navu.NavuChoice> getSelectCaseAsNavuChoice(
    String choice
)
    throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#cls-NavuChoice), [NavuException](NavuException.md#cls-NavuException)

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

### getSelectCaseAsNavuNode(String) <a href="#m-getSelectCaseAsNavuNode-46fa4e27d61f" id="m-getSelectCaseAsNavuNode-46fa4e27d61f"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getSelectCaseAsNavuNode(
    String choice
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

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

### getSelectedCase(String) <a href="#m-getSelectedCase-3b005e9181ed" id="m-getSelectedCase-3b005e9181ed"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSCase getSelectedCase(
    String choice
)
    throws com.tailf.navu.NavuException
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cls-CSCase), [NavuException](NavuException.md#cls-NavuException)

Returns the selected cases of  a given choice.

**Parameters**

- `String choice` - of the choice to get selected case for.

**Returns:** - the selected case

### getUserSession() <a href="#m-getUserSession-7a9eeeb92f85" id="m-getUserSession-7a9eeeb92f85"></a>

```java
public int getUserSession() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Get the current Maapi user session if this container context uses
 Maapi. Throws exception if the context is not Maapi.

**Returns:** user session id

**Throws**

- `NavuException`

### h2str(Integer) <a href="#m-h2str-3096e9ba352b" id="m-h2str-3096e9ba352b"></a>

```java
protected String h2str(Integer hash)
```

**Parameters**

- `Integer hash`

### handleDuplicateChildren(List<CSNode>) <a href="#m-handleDuplicateChildren-e69c1564b6e7" id="m-handleDuplicateChildren-e69c1564b6e7"></a>

```java
protected void handleDuplicateChildren(java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

**Parameters**

- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children`

### hashCode() <a href="#m-hashCode-ef797a217903" id="m-hashCode-ef797a217903"></a>

```java
public int hashCode()
```

### isCreated() <a href="#m-isCreated-bc9b3cb40910" id="m-isCreated-bc9b3cb40910"></a>

```java
protected boolean isCreated()
```

Checks if the container has been created.

**Returns:** true if it exists or if minOccurs > 0

### isEmpty() <a href="#m-isEmpty-4dde48126244" id="m-isEmpty-4dde48126244"></a>

```java
public boolean isEmpty() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Checks if the container has any members.

**Returns:** true if it has 1 or more members.

### isListInstance() <a href="#m-isListInstance-16ea9625f0d2" id="m-isListInstance-16ea9625f0d2"></a>

```java
public boolean isListInstance()
```

Returns `true` if this `NavuContainer`
 represents a *list-entry*

**Returns:** `true` if this `NavuContainer`
         is a *list-entry* *false* otherwise

### isNodeNavuLocal() <a href="#m-isNodeNavuLocal-3af8ba5398d1" id="m-isNodeNavuLocal-3af8ba5398d1"></a>

**Package-private**

```java
boolean isNodeNavuLocal()
```

### iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object) <a href="#m-iterate-d80a566b7e0a" id="m-iterate-d80a566b7e0a"></a>

```java
public com.tailf.conf.DiffIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfObject oldValue,
    com.tailf.conf.ConfObject newValue,
    Object state
)
```

Types: [DiffIterateResultFlag](../conf/DiffIterateResultFlag.md#cls-DiffIterateResultFlag), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object state`

### keySet() <a href="#m-keySet-66de8917ecb8" id="m-keySet-66de8917ecb8"></a>

```java
public java.util.Set<String> keySet() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Returns a set of nodeNames.

**Returns:** a set of nodeNames

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


 To get the namespace, you can use
 [`ConfNamespace#findNamespace(String)`](../conf/ConfNamespace.md#m-findNamespace-ffbcd6481b17)
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


 To get the namespace, you can use
 [`ConfNamespace#findNamespace(String)`](../conf/ConfNamespace.md#m-findNamespace-ffbcd6481b17)
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

### populateChildren(List<CSNode>) <a href="#m-populateChildren-40519dc6bd8c" id="m-populateChildren-40519dc6bd8c"></a>

```java
protected void populateChildren(java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#cls-CSNode)

Populates children of this node and place it in the hashmap.

 The first level is handled differently since all children must
 have a prefix at the first level.

**Parameters**

- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children`

### populateChoices() <a href="#m-populateChoices-de48df56d517" id="m-populateChoices-de48df56d517"></a>

```java
protected void populateChoices() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

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

### refresh() <a href="#m-refresh-3852c3f76c8e" id="m-refresh-3852c3f76c8e"></a>

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Reads node member values according to the node schema.

### reset() <a href="#m-reset-6927918ac70a" id="m-reset-6927918ac70a"></a>

```java
public void reset()
```

Resets the contained nodes

### safeCreate() <a href="#m-safeCreate-8125e14d387f" id="m-safeCreate-8125e14d387f"></a>

```java
public com.tailf.navu.NavuContainer safeCreate() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

Creates an optional container. Will silently ignore the error
 when the container already exists

**Returns:** a pointer to self.

**Throws**

- `NavuException`

### select(ConfObject[]) <a href="#m-select-336dd76cd112" id="m-select-336dd76cd112"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`

### select(List<String>) <a href="#m-select-e81f36150174" id="m-select-e81f36150174"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `java.util.List<String> path`

### select(String) <a href="#m-select-5031325154b9" id="m-select-5031325154b9"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    String path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `String path`

### setChange(List<ConfObject>, DiffIterateOperFlag, ConfValue, NavuContext) <a href="#m-setChange-0bbeb54ebc15" id="m-setChange-0bbeb54ebc15"></a>

```java
public com.tailf.navu.NavuNode setChange(
    java.util.List<com.tailf.conf.ConfObject> path,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfValue oldValue,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [ConfObject](../conf/ConfObject.md#cls-ConfObject), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag), [ConfValue](../conf/ConfValue.md#cls-ConfValue), [NavuContext](NavuContext.md#cls-NavuContext), [NavuException](NavuException.md#cls-NavuException)

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> path`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

### setKey(ConfKey) <a href="#m-setKey-b8489388971b" id="m-setKey-b8489388971b"></a>

```java
protected void setKey(com.tailf.conf.ConfKey key)
```

Types: [ConfKey](../conf/ConfKey.md#cls-ConfKey)

**Parameters**

- `com.tailf.conf.ConfKey key`

### setOperFlag(DiffIterateOperFlag) <a href="#m-setOperFlag-b50e9a2a8d38" id="m-setOperFlag-b50e9a2a8d38"></a>

```java
protected void setOperFlag(com.tailf.conf.DiffIterateOperFlag flag)
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#cls-DiffIterateOperFlag)

**Parameters**

- `com.tailf.conf.DiffIterateOperFlag flag`

### sharedCreate() <a href="#m-sharedCreate-7aef2e24f04b" id="m-sharedCreate-7aef2e24f04b"></a>

```java
public com.tailf.navu.NavuContainer sharedCreate() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#cls-NavuContainer), [NavuException](NavuException.md#cls-NavuException)

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

### size() <a href="#m-size-c6d8505255fd" id="m-size-c6d8505255fd"></a>

```java
public int size() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#cls-NavuException)

Returns the number of nodes contained by the container.

**Returns:** the number contained nodes.

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```

### valueUpdateInd(NavuNode) <a href="#m-valueUpdateInd-e7cd65f79d78" id="m-valueUpdateInd-e7cd65f79d78"></a>

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#cls-NavuNode), [NavuException](NavuException.md#cls-NavuException)

An indication received from a child node. The update indicates
 that a leaf node has been read/set or list node has been read/created
 for the first time. The main purpose of this indication is to trigger
 updates of choice related nodes.

**Parameters**

- `com.tailf.navu.NavuNode child` - the child node doing the update.
