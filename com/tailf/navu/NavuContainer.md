# NavuContainer <a href="#navucontainer-8e321756755f" id="navucontainer-8e321756755f"></a>

```java
public class com.tailf.navu.NavuContainer
    extends com.tailf.navu.NavuNode
    implements com.tailf.maapi.MaapiDiffIterate
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [MaapiDiffIterate](../maapi/MaapiDiffIterate.md#maapidiffiterate-199d02e1da37)

`NavuContainer` is a representation of the *yang*
 construct *container,module* and *list-entry*.

 A `NavuContainer` is usually supplied or returned from
 a method call. It can also be created using one of its constructors,
 typically [`NavuContainer(NavuContext)`](NavuContainer.md#navucontainer-5734bf951268).

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
 choose a particular module, the method [`container(Integer)`](NavuContainer.md#container-abb10ecdc3f6)
 must be called with the hash value of the corresponding module
 ([`ConfNamespace#hash()`](../conf/ConfNamespace.md#hash-88880b48029e)).
 This will return a new `NavuContainer` pointing to the root of
 the chosen module.




```
   NavuContainer module = root.container(new Ncs().hash());
```




 To continue further down to the next child, use
 [`container(Integer)`](NavuContainer.md#container-abb10ecdc3f6), [`container(String)`](NavuContainer.md#container-76f5d191b16d),
 [`list(Integer)`](NavuContainer.md#list-7dc96bdbb69a), [`list(String)`](NavuContainer.md#list-2c1a74a3cf07) or [`leaf(Integer)`](NavuContainer.md#leaf-47fda8402c20),
 [`leaf(String)`](NavuContainer.md#leaf-ac189787d67d) as dictated by the YANG model.
 The string version is the corresponding
 [`MaapiSchemas#hashToString(int)`](../maapi/MaapiSchemas.md#hashtostring-54eaaef71976) of the *Integer* parameter
 which is the hash value of the tag name.

 Usually the generated namespace classes static method are used for
 convenience. The absence of underscore (_) at the end of the
 static field name indicates the integer version.

 Then continuing with the devices node:



```
   NavuContainer devicesNode = module.container(Ncs._devices);
```

**Related classes**

- [NavuListEntry](NavuListEntry.md#navulistentry-6c6e1431f291)

## Members

**Constructors**:

- [NavuContainer\(\)](#navucontainer-c89fa906ab01)
- [NavuContainer\(Maapi, int, int\)](#navucontainer-cfcd7f6efb55)
- [NavuContainer\(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object\[\]\)](#navucontainer-eceddc8da3ad)
- [NavuContainer\(NavuContext\)](#navucontainer-5734bf951268)
- [NavuContainer\(NavuContext, CSNode, NavuNode, Formats\)](#navucontainer-9b2631de44b3)
- [NavuContainer\(NavuContext, CSNode, NavuNode, String, Object\[\]\)](#navucontainer-b87ee18b07c9)
- [NavuContainer\(NavuContext, CSSchema, NavuNode, String, Object\[\]\)](#navucontainer-11ce3c1e636b)

**Fields**:

- [arguments](NavuNode.md#arguments-28ffa3c54d2c) from NavuNode
- [change](NavuNode.md#change-470927160c2a) from NavuNode
- [changeMap](#changemap-b5a294491f5a)
- [context](NavuNode.md#context-b9bed500f8c9) from NavuNode
- [criteria](#criteria-2aeaea96dbdb)
- [duplicateSet](#duplicateset-c134c96c9fc5)
- [fmt](NavuNode.md#fmt-94d3250bd2b9) from NavuNode
- [isCreated](#iscreated-783ec1e767bb)
- [isRefreshed](#isrefreshed-17594a091fc4)
- [isRootModulesPopulated](#isrootmodulespopulated-1578b44f189f)
- [key](#key-41a461f20bc2)
- [map](#map-7fec112b12da)
- [mountId](NavuNode.md#mountid-a6b63dedba52) from NavuNode
- [myConfPath](NavuNode.md#myconfpath-cec7a88dfaf3) from NavuNode
- [name2Choice](#name2choice-b90229c2e807)
- [node](NavuNode.md#node-ff68e6a3ebc6) from NavuNode
- [node2Choice](#node2choice-8cbcd28d51b5)
- [parent](NavuNode.md#parent-26ad1434956a) from NavuNode
- [rootHash](#roothash-a5a53d6abd62)
- [sch](#sch-fd99b9646745)

**Methods**:

- [action\(Integer\)](#action-31e90b24df5f)
- [action\(String\)](#action-ac3b339033ab)
- [addModule\(NavuContainer\)](#addmodule-379e17a46072)
- [children\(\)](#children-7d31300d62c3)
- [choice\(String\)](#choice-45a67115903b)
- [container\(ConfNamespace, String\)](#container-31c604ba30e3)
- [container\(Integer\)](#container-abb10ecdc3f6)
- [container\(String\)](#container-76f5d191b16d)
- [containsNode\(NavuNode\)](#containsnode-f554fdc5bf96)
- [containsNode\(String\)](#containsnode-445990dba920)
- [context\(\)](NavuNode.md#context-0990f1a0bb68) from NavuNode
- [create\(\)](#create-06e0ee4a42c2)
- [delete\(\)](#delete-a9e76d49da61)
- [encodeValues\(\)](#encodevalues-7bd911383b1a)
- [encodeXML\(\)](#encodexml-bdbcd52c2505)
- [entrySet\(\)](#entryset-20b678143b7e)
- [equals\(Object\)](#equals-fcd6492e0d6c)
- [exists\(\)](#exists-56968a4c7bda)
- [filterChildren\(CSNode\)](NavuNode.md#filterchildren-e72b7b1ab25d) from NavuNode
- [findChanges\(NavuContext, Integer\[\]\)](#findchanges-e1e823411f98)
- [get\(String\)](#get-e86cd4d90bf3)
- [getChangeFlag\(\)](NavuNode.md#getchangeflag-33cadf5a32ba) from NavuNode
- [getChanges\(NavuContext\)](NavuNode.md#getchanges-c106383f174d) from NavuNode
- [getChanges\(NavuContext, boolean\)](NavuNode.md#getchanges-bcf5b6dbccf2) from NavuNode
- [getChanges\(NavuContext, boolean, DiffIterateOperFlag\[\]\)](NavuNode.md#getchanges-9f13a683b086) from NavuNode
- [getConfPath\(\)](NavuNode.md#getconfpath-c7ca3cb63c17) from NavuNode
- [getInfo\(\)](NavuNode.md#getinfo-259a72b5d74c) from NavuNode
- [getKey\(\)](#getkey-9a8856159458)
- [getKeyPath\(\)](NavuNode.md#getkeypath-4c9200912948) from NavuNode
- [getName\(\)](NavuNode.md#getname-2634b18b4a25) from NavuNode
- [getNavuNode\(ConfPath\)](NavuNode.md#getnavunode-d19ad1dd90fc) from NavuNode
- [getParent\(\)](NavuNode.md#getparent-45c1b196ed70) from NavuNode
- [getRootNS\(\)](#getrootns-3f1d054cecd6)
- [getSchema\(int\)](#getschema-d43ad42eba79)
- [getSelectCaseAsNavuChoice\(String\)](#getselectcaseasnavuchoice-f6626477e806)
- [getSelectCaseAsNavuNode\(String\)](#getselectcaseasnavunode-46fa4e27d61f)
- [getSelectedCase\(String\)](#getselectedcase-3b005e9181ed)
- [getUserSession\(\)](#getusersession-7a9eeeb92f85)
- [getValues\(ConfXMLParam\[\]\)](NavuNode.md#getvalues-1eb02439a757) from NavuNode
- [getValues\(String\)](NavuNode.md#getvalues-c03de090764d) from NavuNode
- [h2str\(Integer\)](#h2str-3096e9ba352b)
- [handleDuplicateChildren\(List\<CSNode\>\)](#handleduplicatechildren-e69c1564b6e7)
- [hashCode\(\)](#hashcode-ef797a217903)
- [isCreated\(\)](#iscreated-bc9b3cb40910)
- [isEmpty\(\)](#isempty-4dde48126244)
- [isListInstance\(\)](#islistinstance-16ea9625f0d2)
- [isNodeNavuLocal\(\)](#isnodenavulocal-3af8ba5398d1)
- [iterate\(ConfObject\[\], DiffIterateOperFlag, ConfObject, ConfObject, Object\)](#iterate-d80a566b7e0a)
- [keySet\(\)](#keyset-66de8917ecb8)
- [leaf\(ConfNamespace, String\)](#leaf-da3758f37f21)
- [leaf\(Integer\)](#leaf-47fda8402c20)
- [leaf\(String\)](#leaf-ac189787d67d)
- [leafList\(ConfNamespace, String\)](#leaflist-a2d5ad836b3e)
- [leafList\(Integer\)](#leaflist-552c8007ecb4)
- [leafList\(String\)](#leaflist-5811cbb534ec)
- [list\(ConfNamespace, String\)](#list-6b15381fd14a)
- [list\(Integer\)](#list-7dc96bdbb69a)
- [list\(String\)](#list-2c1a74a3cf07)
- [namespace\(String\)](#namespace-e29ad62ed095)
- [populateChildren\(List\<CSNode\>\)](#populatechildren-40519dc6bd8c)
- [populateChoices\(\)](#populatechoices-de48df56d517)
- [prefix\(String\)](#prefix-fdd71b8275bb)
- [prepareXMLCall\(String\)](NavuNode.md#preparexmlcall-c22e250f2cac) from NavuNode
- [refresh\(\)](#refresh-3852c3f76c8e)
- [reset\(\)](#reset-6927918ac70a)
- [safeCreate\(\)](#safecreate-8125e14d387f)
- [select\(ConfObject\[\]\)](#select-336dd76cd112)
- [select\(List\<String\>\)](#select-e81f36150174)
- [select\(String\)](#select-5031325154b9)
- [setChange\(List\<ConfObject\>, DiffIterateOperFlag, ConfValue, NavuContext\)](#setchange-0bbeb54ebc15)
- [setKey\(ConfKey\)](#setkey-b8489388971b)
- [setOperFlag\(DiffIterateOperFlag\)](#setoperflag-b50e9a2a8d38)
- [setValues\(ConfXMLParam\[\]\)](NavuNode.md#setvalues-50d8edffa795) from NavuNode
- [setValues\(String\)](NavuNode.md#setvalues-3ec9581ce266) from NavuNode
- [sharedCreate\(\)](#sharedcreate-7aef2e24f04b)
- [sharedSetValues\(ConfXMLParam\[\]\)](NavuNode.md#sharedsetvalues-705549be9df0) from NavuNode
- [sharedSetValues\(String\)](NavuNode.md#sharedsetvalues-ad93c38b671f) from NavuNode
- [size\(\)](#size-c6d8505255fd)
- [stopCdbSession\(\)](NavuNode.md#stopcdbsession-17418252a986) from NavuNode
- [toString\(\)](#tostring-e9d48c5503ef)
- [valueUpdateInd\(NavuNode\)](#valueupdateind-e7cd65f79d78)
- [xPathSelect\(String\)](NavuNode.md#xpathselect-0fb26b9f41e0) from NavuNode
- [xPathSelectIterate\(String, NavuNodeSetIterate\)](NavuNode.md#xpathselectiterate-12547f34f47c) from NavuNode

## Constructors

### NavuContainer() <a href="#navucontainer-c89fa906ab01" id="navucontainer-c89fa906ab01"></a>

```java
public NavuContainer()
```

This constructor creates a *root* container. This container
 holds all loaded schemas as its children.

### NavuContainer(Maapi, int, int) <a href="#navucontainer-cfcd7f6efb55" id="navucontainer-cfcd7f6efb55"></a>

```java
public NavuContainer(com.tailf.maapi.Maapi m, int handle, int rootHash)
```

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e)

Constructor for a single namespace. Bypasses the
 *root* node.

**Parameters**

- `com.tailf.maapi.Maapi m` - *READ* or *READ_WRITE* `MAAPI` socket
- `int handle` - a valid transaction handle
- `int rootHash` - the root hash of the *module*

### NavuContainer(Maapi, int, MaapiSchemas, CSNode, NavuNode, String, Object[]) <a href="#navucontainer-eceddc8da3ad" id="navucontainer-eceddc8da3ad"></a>

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

Types: [Maapi](../maapi/Maapi.md#maapi-67bcbe89c42e), [MaapiSchemas](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.maapi.Maapi m`
- `int handle`
- `com.tailf.maapi.MaapiSchemas sch`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`

### NavuContainer(NavuContext) <a href="#navucontainer-5734bf951268" id="navucontainer-5734bf951268"></a>

```java
public NavuContainer(com.tailf.navu.NavuContext context)
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e)

Creates an *root* `NavuContainer` a starting point of
 which further navigation is performed.

**Parameters**

- `com.tailf.navu.NavuContext context` - determines the Navigation restriction and
        constraints

### NavuContainer(NavuContext, CSNode, NavuNode, Formats) <a href="#navucontainer-9b2631de44b3" id="navucontainer-9b2631de44b3"></a>

```java
protected NavuContainer(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    com.tailf.navu.KeyPath2NavuNode.Formats fs
)
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuNode](NavuNode.md#navunode-73944820c8db), [Formats](KeyPath2NavuNode/Formats.md#formats-699695f9b70f)

KeyPath2NavuNode specific constructor

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `com.tailf.navu.KeyPath2NavuNode.Formats fs`

### NavuContainer(NavuContext, CSNode, NavuNode, String, Object[]) <a href="#navucontainer-b87ee18b07c9" id="navucontainer-b87ee18b07c9"></a>

```java
protected NavuContainer(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSNode node,
    com.tailf.navu.NavuNode parent,
    String fmt,
    Object[] arguments
)
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSNode node`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`

### NavuContainer(NavuContext, CSSchema, NavuNode, String, Object[]) <a href="#navucontainer-11ce3c1e636b" id="navucontainer-11ce3c1e636b"></a>

```java
protected NavuContainer(
    com.tailf.navu.NavuContext context,
    com.tailf.maapi.MaapiSchemas.CSSchema module,
    com.tailf.navu.NavuNode parent,
    String fmt,
    Object[] arguments
)
```

Types: [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [CSSchema](../maapi/MaapiSchemas/CSSchema.md#csschema-f51a58180f67), [NavuNode](NavuNode.md#navunode-73944820c8db)

**Parameters**

- `com.tailf.navu.NavuContext context`
- `com.tailf.maapi.MaapiSchemas.CSSchema module`
- `com.tailf.navu.NavuNode parent`
- `String fmt`
- `Object[] arguments`


## Fields

### changeMap <a href="#changemap-b5a294491f5a" id="changemap-b5a294491f5a"></a>

```java
protected java.util.Map<com.tailf.conf.ConfKey,com.tailf.navu.NavuChange> changeMap = null;
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuChange](NavuChange.md#navuchange-03ae6b7f3c34)

### criteria <a href="#criteria-2aeaea96dbdb" id="criteria-2aeaea96dbdb"></a>

```java
protected Integer[] criteria = null;
```

### duplicateSet <a href="#duplicateset-c134c96c9fc5" id="duplicateset-c134c96c9fc5"></a>

```java
protected java.util.HashSet<String> duplicateSet = null;
```

### isCreated <a href="#iscreated-783ec1e767bb" id="iscreated-783ec1e767bb"></a>

```java
protected boolean isCreated = null;
```

### isRefreshed <a href="#isrefreshed-17594a091fc4" id="isrefreshed-17594a091fc4"></a>

```java
protected boolean isRefreshed = null;
```

### isRootModulesPopulated <a href="#isrootmodulespopulated-1578b44f189f" id="isrootmodulespopulated-1578b44f189f"></a>

```java
protected boolean isRootModulesPopulated = null;
```

### key <a href="#key-41a461f20bc2" id="key-41a461f20bc2"></a>

```java
protected com.tailf.conf.ConfKey key = null;
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)

### map <a href="#map-7fec112b12da" id="map-7fec112b12da"></a>

```java
protected java.util.Map<String,com.tailf.navu.NavuNode> map = null;
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db)

### name2Choice <a href="#name2choice-b90229c2e807" id="name2choice-b90229c2e807"></a>

```java
protected java.util.Map<String,com.tailf.navu.NavuChoice> name2Choice = null;
```

Types: [NavuChoice](NavuChoice.md#navuchoice-e8914a50eee5)

### node2Choice <a href="#node2choice-8cbcd28d51b5" id="node2choice-8cbcd28d51b5"></a>

```java
protected java.util.Map<com.tailf.maapi.MaapiSchemas.CSNode,com.tailf.navu.NavuChoice> node2Choice = null;
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28), [NavuChoice](NavuChoice.md#navuchoice-e8914a50eee5)

### rootHash <a href="#roothash-a5a53d6abd62" id="roothash-a5a53d6abd62"></a>

```java
protected int rootHash = null;
```

### sch <a href="#sch-fd99b9646745" id="sch-fd99b9646745"></a>

```java
protected com.tailf.maapi.MaapiSchemas sch = null;
```

Types: [MaapiSchemas](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7)


## Methods

### action(Integer) <a href="#action-31e90b24df5f" id="action-31e90b24df5f"></a>

```java
public com.tailf.navu.NavuAction action(Integer key) throws com.tailf.navu.NavuException
```

Types: [NavuAction](NavuAction.md#navuaction-d853bc49f0e8), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a reference to a subordinate `action` with
 the hash value `key`.

**Parameters**

- `Integer key` - the name of the subordinate action

**Returns:** reference to a subordinate action node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         an action node or if there is no subordinate node
         with the hash value `key`

### action(String) <a href="#action-ac3b339033ab" id="action-ac3b339033ab"></a>

```java
public com.tailf.navu.NavuAction action(String key) throws com.tailf.navu.NavuException
```

Types: [NavuAction](NavuAction.md#navuaction-d853bc49f0e8), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a reference to a subordinate `action` with
 the name `key`.

**Parameters**

- `String key` - the name of the subordinate action

**Returns:** reference to a subordinate action node

**Throws**

- `NavuException` - if the corresponding subordinate node is not
         a action node or if there is no subordinate node
         with the name `key`

### addModule(NavuContainer) <a href="#addmodule-379e17a46072" id="addmodule-379e17a46072"></a>

```java
protected void addModule(com.tailf.navu.NavuContainer child)
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f)

**Parameters**

- `com.tailf.navu.NavuContainer child`

### children() <a href="#children-7d31300d62c3" id="children-7d31300d62c3"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> children() throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a collection containing the children of this container.

**Returns:** the children of this container

### choice(String) <a href="#choice-45a67115903b" id="choice-45a67115903b"></a>

```java
public com.tailf.navu.NavuChoice choice(String name) throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#navuchoice-e8914a50eee5), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a reference to a subordinate `choice` with
 the name `name`.

**Parameters**

- `String name` - the name of the choice to return

**Returns:** a matching choice

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


 To get the namespace, you can use
 [`ConfNamespace#findNamespace(String)`](../conf/ConfNamespace.md#findnamespace-ffbcd6481b17)
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
 [`MaapiSchemas#stringToHash(String)`](../maapi/MaapiSchemas.md#stringtohash-7c2af24796ac). It is also possible to access
 a container based on its name only, using the overloaded method
 [`container(String)`](NavuContainer.md#container-76f5d191b16d).

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

### containsNode(NavuNode) <a href="#containsnode-f554fdc5bf96" id="containsnode-f554fdc5bf96"></a>

```java
public boolean containsNode(com.tailf.navu.NavuNode node) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Checks if the given node is a direct child of this container according
 to the schema.

**Parameters**

- `com.tailf.navu.NavuNode node`

**Returns:** true if `node` is a child of this container

### containsNode(String) <a href="#containsnode-445990dba920" id="containsnode-445990dba920"></a>

```java
public boolean containsNode(String nodeName) throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Checks if there is a child node in the schema with given name.

**Parameters**

- `String nodeName` - the name of a node to look for

**Returns:** true if there is a match

### create() <a href="#create-06e0ee4a42c2" id="create-06e0ee4a42c2"></a>

```java
public com.tailf.navu.NavuContainer create() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Creates an optional container.

**Returns:** a pointer to self.

**Throws**

- `NavuException`

### delete() <a href="#delete-a9e76d49da61" id="delete-a9e76d49da61"></a>

```java
public com.tailf.navu.NavuContainer delete() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Deletes an optional container.

**Returns:** a pointer to self.

**Throws**

- `NavuException`

### encodeValues() <a href="#encodevalues-7bd911383b1a" id="encodevalues-7bd911383b1a"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeValues() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

### encodeXML() <a href="#encodexml-bdbcd52c2505" id="encodexml-bdbcd52c2505"></a>

```java
public java.util.List<com.tailf.conf.ConfXMLParam> encodeXML() throws com.tailf.navu.NavuException
```

Types: [ConfXMLParam](../conf/ConfXMLParam.md#confxmlparam-f5f4394b46a7), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

### entrySet() <a href="#entryset-20b678143b7e" id="entryset-20b678143b7e"></a>

```java
public java.util.Set<java.util.Map.Entry<String,com.tailf.navu.NavuNode>> entrySet() throws com.tailf.navu.NavuException
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a set of value-pairs.

**Returns:** a set of nodeName-node pairs according to the schema

### equals(Object) <a href="#equals-fcd6492e0d6c" id="equals-fcd6492e0d6c"></a>

```java
public boolean equals(Object o)
```

Compares the specified object with this `NavuContainer`
 for equality. Returns `true` if the specified object
 is also a `NavuContainer` and either of the following
 is true:



- Both nodes are modules according to [`NavuNodeInfo#isModule()`](NavuNodeInfo.md#ismodule-387434ee044f))
 and they have the same namespace URI.

   - The nodes are not modules, and have identical [`ConfPath`](../conf/ConfPath.md#confpath-327831c6fc7d)
 instances.

**Parameters**

- `Object o` - the object to be compared for equality with this
          `NavuContainer`

**Returns:** `true` if the specified object is equal to this
         `NavuContainer`

### exists() <a href="#exists-56968a4c7bda" id="exists-56968a4c7bda"></a>

```java
public boolean exists() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Verifies the existence of container.

**Returns:** boolean

**Throws**

- `NavuException`

### findChanges(NavuContext, Integer[]) <a href="#findchanges-e1e823411f98" id="findchanges-e1e823411f98"></a>

```java
public java.util.Map<com.tailf.conf.ConfKey,com.tailf.navu.NavuChange> findChanges(
    com.tailf.navu.NavuContext delContext,
    Integer[] criteria
)
    throws com.tailf.navu.NavuException
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867), [NavuChange](NavuChange.md#navuchange-03ae6b7f3c34), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### get(String) <a href="#get-e86cd4d90bf3" id="get-e86cd4d90bf3"></a>

```java
public com.tailf.navu.NavuNode get(String nodeName) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a subordinate node with the name `nodeName`.

**Parameters**

- `String nodeName` - a name of a node contained within this container.

**Returns:** a matching node

**Throws**

- `NavuException` - if subordinate node has no matching container
         with the name `nodeName`

### getKey() <a href="#getkey-9a8856159458" id="getkey-9a8856159458"></a>

```java
public com.tailf.conf.ConfKey getKey()
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)

If this container is a list instance this method
 can be used to get the list entry key.
 Otherwise this method returns null.

**Returns:** the key as a ConfKey object

### getRootNS() <a href="#getrootns-3f1d054cecd6" id="getrootns-3f1d054cecd6"></a>

```java
public com.tailf.conf.ConfNamespace getRootNS()
```

Types: [ConfNamespace](../conf/ConfNamespace.md#confnamespace-51b928e168d1)

### getSchema(int) <a href="#getschema-d43ad42eba79" id="getschema-d43ad42eba79"></a>

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getSchema(int rootHash)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `int rootHash`

### getSelectCaseAsNavuChoice(String) <a href="#getselectcaseasnavuchoice-f6626477e806" id="getselectcaseasnavuchoice-f6626477e806"></a>

```java
public java.util.List<com.tailf.navu.NavuChoice> getSelectCaseAsNavuChoice(
    String choice
)
    throws com.tailf.navu.NavuException
```

Types: [NavuChoice](NavuChoice.md#navuchoice-e8914a50eee5), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### getSelectCaseAsNavuNode(String) <a href="#getselectcaseasnavunode-46fa4e27d61f" id="getselectcaseasnavunode-46fa4e27d61f"></a>

```java
public java.util.List<com.tailf.navu.NavuNode> getSelectCaseAsNavuNode(
    String choice
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### getSelectedCase(String) <a href="#getselectedcase-3b005e9181ed" id="getselectedcase-3b005e9181ed"></a>

```java
public com.tailf.maapi.MaapiSchemas.CSCase getSelectedCase(
    String choice
)
    throws com.tailf.navu.NavuException
```

Types: [CSCase](../maapi/MaapiSchemas/CSCase.md#cscase-26937f56b18d), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns the selected cases of  a given choice.

**Parameters**

- `String choice` - of the choice to get selected case for.

**Returns:** - the selected case

### getUserSession() <a href="#getusersession-7a9eeeb92f85" id="getusersession-7a9eeeb92f85"></a>

```java
public int getUserSession() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Get the current Maapi user session if this container context uses
 Maapi. Throws exception if the context is not Maapi.

**Returns:** user session id

**Throws**

- `NavuException`

### h2str(Integer) <a href="#h2str-3096e9ba352b" id="h2str-3096e9ba352b"></a>

```java
protected String h2str(Integer hash)
```

**Parameters**

- `Integer hash`

### handleDuplicateChildren(List&lt;CSNode&gt;) <a href="#handleduplicatechildren-e69c1564b6e7" id="handleduplicatechildren-e69c1564b6e7"></a>

```java
protected void handleDuplicateChildren(java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

**Parameters**

- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children`

### hashCode() <a href="#hashcode-ef797a217903" id="hashcode-ef797a217903"></a>

```java
public int hashCode()
```

### isCreated() <a href="#iscreated-bc9b3cb40910" id="iscreated-bc9b3cb40910"></a>

```java
protected boolean isCreated()
```

Checks if the container has been created.

**Returns:** true if it exists or if minOccurs > 0

### isEmpty() <a href="#isempty-4dde48126244" id="isempty-4dde48126244"></a>

```java
public boolean isEmpty() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Checks if the container has any members.

**Returns:** true if it has 1 or more members.

### isListInstance() <a href="#islistinstance-16ea9625f0d2" id="islistinstance-16ea9625f0d2"></a>

```java
public boolean isListInstance()
```

Returns `true` if this `NavuContainer`
 represents a *list-entry*

**Returns:** `true` if this `NavuContainer`
         is a *list-entry* *false* otherwise

### isNodeNavuLocal() <a href="#isnodenavulocal-3af8ba5398d1" id="isnodenavulocal-3af8ba5398d1"></a>

**Package-private**

```java
boolean isNodeNavuLocal()
```

### iterate(ConfObject[], DiffIterateOperFlag, ConfObject, ConfObject, Object) <a href="#iterate-d80a566b7e0a" id="iterate-d80a566b7e0a"></a>

```java
public com.tailf.conf.DiffIterateResultFlag iterate(
    com.tailf.conf.ConfObject[] kp,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfObject oldValue,
    com.tailf.conf.ConfObject newValue,
    Object state
)
```

Types: [DiffIterateResultFlag](../conf/DiffIterateResultFlag.md#diffiterateresultflag-3bcd05ed3269), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfObject oldValue`
- `com.tailf.conf.ConfObject newValue`
- `Object state`

### keySet() <a href="#keyset-66de8917ecb8" id="keyset-66de8917ecb8"></a>

```java
public java.util.Set<String> keySet() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns a set of nodeNames.

**Returns:** a set of nodeNames

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


 To get the namespace, you can use
 [`ConfNamespace#findNamespace(String)`](../conf/ConfNamespace.md#findnamespace-ffbcd6481b17)
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


 To get the namespace, you can use
 [`ConfNamespace#findNamespace(String)`](../conf/ConfNamespace.md#findnamespace-ffbcd6481b17)
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

### populateChildren(List&lt;CSNode&gt;) <a href="#populatechildren-40519dc6bd8c" id="populatechildren-40519dc6bd8c"></a>

```java
protected void populateChildren(java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children)
```

Types: [CSNode](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

Populates children of this node and place it in the hashmap.

 The first level is handled differently since all children must
 have a prefix at the first level.

**Parameters**

- `java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> children`

### populateChoices() <a href="#populatechoices-de48df56d517" id="populatechoices-de48df56d517"></a>

```java
protected void populateChoices() throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#confexception-baeaab99f7f9)

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

### refresh() <a href="#refresh-3852c3f76c8e" id="refresh-3852c3f76c8e"></a>

```java
protected void refresh() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Reads node member values according to the node schema.

### reset() <a href="#reset-6927918ac70a" id="reset-6927918ac70a"></a>

```java
public void reset()
```

Resets the contained nodes

### safeCreate() <a href="#safecreate-8125e14d387f" id="safecreate-8125e14d387f"></a>

```java
public com.tailf.navu.NavuContainer safeCreate() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Creates an optional container. Will silently ignore the error
 when the container already exists

**Returns:** a pointer to self.

**Throws**

- `NavuException`

### select(ConfObject[]) <a href="#select-336dd76cd112" id="select-336dd76cd112"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    com.tailf.conf.ConfObject[] kp
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `com.tailf.conf.ConfObject[] kp`

### select(List&lt;String&gt;) <a href="#select-e81f36150174" id="select-e81f36150174"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    java.util.List<String> path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `java.util.List<String> path`

### select(String) <a href="#select-5031325154b9" id="select-5031325154b9"></a>

```java
public java.util.Collection<com.tailf.navu.NavuNode> select(
    String path
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `String path`

### setChange(List&lt;ConfObject&gt;, DiffIterateOperFlag, ConfValue, NavuContext) <a href="#setchange-0bbeb54ebc15" id="setchange-0bbeb54ebc15"></a>

```java
public com.tailf.navu.NavuNode setChange(
    java.util.List<com.tailf.conf.ConfObject> path,
    com.tailf.conf.DiffIterateOperFlag op,
    com.tailf.conf.ConfValue oldValue,
    com.tailf.navu.NavuContext delContext
)
    throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [ConfObject](../conf/ConfObject.md#confobject-5433616953b2), [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec), [ConfValue](../conf/ConfValue.md#confvalue-769292781c7d), [NavuContext](NavuContext.md#navucontext-2974e9f92a9e), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

**Parameters**

- `java.util.List<com.tailf.conf.ConfObject> path`
- `com.tailf.conf.DiffIterateOperFlag op`
- `com.tailf.conf.ConfValue oldValue`
- `com.tailf.navu.NavuContext delContext`

### setKey(ConfKey) <a href="#setkey-b8489388971b" id="setkey-b8489388971b"></a>

```java
protected void setKey(com.tailf.conf.ConfKey key)
```

Types: [ConfKey](../conf/ConfKey.md#confkey-e4e1ca98e867)

**Parameters**

- `com.tailf.conf.ConfKey key`

### setOperFlag(DiffIterateOperFlag) <a href="#setoperflag-b50e9a2a8d38" id="setoperflag-b50e9a2a8d38"></a>

```java
protected void setOperFlag(com.tailf.conf.DiffIterateOperFlag flag)
```

Types: [DiffIterateOperFlag](../conf/DiffIterateOperFlag.md#diffiterateoperflag-d1cd8560c2ec)

**Parameters**

- `com.tailf.conf.DiffIterateOperFlag flag`

### sharedCreate() <a href="#sharedcreate-7aef2e24f04b" id="sharedcreate-7aef2e24f04b"></a>

```java
public com.tailf.navu.NavuContainer sharedCreate() throws com.tailf.navu.NavuException
```

Types: [NavuContainer](NavuContainer.md#navucontainer-8e321756755f), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

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

### size() <a href="#size-c6d8505255fd" id="size-c6d8505255fd"></a>

```java
public int size() throws com.tailf.navu.NavuException
```

Types: [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

Returns the number of nodes contained by the container.

**Returns:** the number contained nodes.

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```

### valueUpdateInd(NavuNode) <a href="#valueupdateind-e7cd65f79d78" id="valueupdateind-e7cd65f79d78"></a>

```java
public void valueUpdateInd(com.tailf.navu.NavuNode child) throws com.tailf.navu.NavuException
```

Types: [NavuNode](NavuNode.md#navunode-73944820c8db), [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)

An indication received from a child node. The update indicates
 that a leaf node has been read/set or list node has been read/created
 for the first time. The main purpose of this indication is to trigger
 updates of choice related nodes.

**Parameters**

- `com.tailf.navu.NavuNode child` - the child node doing the update.
