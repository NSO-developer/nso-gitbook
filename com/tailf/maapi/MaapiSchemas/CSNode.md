<a id="s-CSNode"></a>
# CSNode

```java
public static class com.tailf.maapi.MaapiSchemas.CSNode
```

Class representing a Schema node, having references to parent and
 children as well as siblings

**Related classes**

- [MmapCSNode](../../ncs/maapi/MmapCSNode.md#s-MmapCSNode)

## Members

**Constructors**:

- [CSNode()](#s-CSNode-1)
- [CSNode(int, String, CSSchema, CSNodeInfo, CSNode)](#s-CSNode-2)

**Fields**:

- [firstChild](#s-firstChild)
- [nextSibling](#s-nextSibling)
- [parentNode](#s-parentNode)
- [tag](#s-tag)

**Methods**:

- [equals(Object)](#s-equals)
- [getChild(int)](#s-getChild)
- [getChild(int, int)](#s-getChild-1)
- [getChildren()](#s-getChildren)
- [getChildren(List<String>)](#s-getChildren-1)
- [getChoices()](#s-getChoices)
- [getDefval()](#s-getDefval)
- [getFirstChild()](#s-getFirstChild)
- [getKey(int)](#s-getKey)
- [getKeys()](#s-getKeys)
- [getMaxOccurs()](#s-getMaxOccurs)
- [getMinOccurs()](#s-getMinOccurs)
- [getNextSibling()](#s-getNextSibling)
- [getNodeInfo()](#s-getNodeInfo)
- [getNS()](#s-getNS)
- [getNSHash()](#s-getNSHash)
- [getParentNode()](#s-getParentNode)
- [getSchema()](#s-getSchema)
- [getSibling(int)](#s-getSibling)
- [getSiblings()](#s-getSiblings)
- [getTag()](#s-getTag)
- [getTagHash()](#s-getTagHash)
- [getType()](#s-getType)
- [getXmlNS()](#s-getXmlNS)
- [hasChildAction()](#s-hasChildAction)
- [hasChildConfAction()](#s-hasChildConfAction)
- [hasChildOperAction()](#s-hasChildOperAction)
- [hasChildReadOnly()](#s-hasChildReadOnly)
- [hasChildReadWrite()](#s-hasChildReadWrite)
- [hasChildren()](#s-hasChildren)
- [hasDisplayWhen()](#s-hasDisplayWhen)
- [hasDocDescription()](#s-hasDocDescription)
- [hashCode()](#s-hashCode)
- [hasMetaData()](#s-hasMetaData)
- [hasMountPoint()](#s-hasMountPoint)
- [hasPrompt()](#s-hasPrompt)
- [hasServicepoint()](#s-hasServicepoint)
- [hasWhen()](#s-hasWhen)
- [isAction()](#s-isAction)
- [isActionParam()](#s-isActionParam)
- [isActionResult()](#s-isActionResult)
- [isCase()](#s-isCase)
- [isContainer()](#s-isContainer)
- [isEmptyLeaf()](#s-isEmptyLeaf)
- [isHidden()](#s-isHidden)
- [isLeaf()](#s-isLeaf)
- [isLeafList()](#s-isLeafList)
- [isLeafref()](#s-isLeafref)
- [isList()](#s-isList)
- [isNotif()](#s-isNotif)
- [isOper()](#s-isOper)
- [isWritable()](#s-isWritable)
- [printNodeType()](#s-printNodeType)
- [toString()](#s-toString)

## Constructors

<a id="s-CSNode-1"></a>
### CSNode()

```java
protected CSNode()
```

Constructor for CSNode class

<a id="s-CSNode-2"></a>
### CSNode(int, String, CSSchema, CSNodeInfo, CSNode)

```java
protected CSNode(
    int taghash,
    String tag,
    com.tailf.maapi.MaapiSchemas.CSSchema schema,
    com.tailf.maapi.MaapiSchemas.CSNodeInfo info,
    com.tailf.maapi.MaapiSchemas.CSNode parentNode
)
```

Types: [CSSchema](CSSchema.md#s-CSSchema), [CSNodeInfo](CSNodeInfo.md#s-CSNodeInfo), [CSNode](CSNode.md#s-CSNode)

**Parameters**

- `int taghash`
- `String tag`
- `com.tailf.maapi.MaapiSchemas.CSSchema schema`
- `com.tailf.maapi.MaapiSchemas.CSNodeInfo info`
- `com.tailf.maapi.MaapiSchemas.CSNode parentNode`


## Fields

<a id="s-firstChild"></a>
### firstChild

```java
protected com.tailf.maapi.MaapiSchemas.CSNode firstChild = null;
```

Types: [CSNode](CSNode.md#s-CSNode)

<a id="s-nextSibling"></a>
### nextSibling

```java
protected com.tailf.maapi.MaapiSchemas.CSNode nextSibling = null;
```

Types: [CSNode](CSNode.md#s-CSNode)

<a id="s-parentNode"></a>
### parentNode

```java
protected com.tailf.maapi.MaapiSchemas.CSNode parentNode = null;
```

Types: [CSNode](CSNode.md#s-CSNode)

<a id="s-tag"></a>
### tag

```java
protected String tag = null;
```


## Methods

<a id="s-equals"></a>
### equals(Object)

```java
public boolean equals(Object o)
```

Return true if and onlfy if this nodes
 is equal the specified node

**Parameters**

- `Object o`

<a id="s-getChild"></a>
### getChild(int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode getChild(int tagHash)
```

Types: [CSNode](CSNode.md#s-CSNode)

Retrieve a child with the specified tag
 Returns null if no child exists.

**Parameters**

- `int tagHash`

**Returns:** Child node

<a id="s-getChild-1"></a>
### getChild(int, int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode getChild(int nsHash, int tagHash)
```

Types: [CSNode](CSNode.md#s-CSNode)

Retrieve a child with the specified namespace and tag
 Returns null if no child exists.

**Parameters**

- `int nsHash`
- `int tagHash`

**Returns:** Child node

<a id="s-getChildren"></a>
### getChildren()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren()
```

Types: [CSNode](CSNode.md#s-CSNode)

Retrieves children for this node as List or
 null if no children exists.

**Returns:** List of children nodes

<a id="s-getChildren-1"></a>
### getChildren(List<String>)

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getChildren(
    java.util.List<String> mountId
)
```

Types: [CSNode](CSNode.md#s-CSNode)

Retrieves children for this node given a mount id as List or
 null if no children exists.

**Parameters**

- `java.util.List<String> mountId`

**Returns:** List of children nodes

<a id="s-getChoices"></a>
### getChoices()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSChoice> getChoices()
```

Types: [CSChoice](CSChoice.md#s-CSChoice)

get List object of choices for this node. A Choice is represented by
 the CSChoice class, this is a List of CSChoice accordingly

**Returns:** List of Choices

<a id="s-getDefval"></a>
### getDefval()

```java
public com.tailf.conf.ConfObject getDefval()
```

Types: [ConfObject](../../conf/ConfObject.md#s-ConfObject)

get default value represented as a subclass to ConfObject

**Returns:** ConfObject

<a id="s-getFirstChild"></a>
### getFirstChild()

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getFirstChild()
```

Types: [CSNode](CSNode.md#s-CSNode)

<a id="s-getKey"></a>
### getKey(int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode getKey(int index)
```

Types: [CSNode](CSNode.md#s-CSNode)

Return a key at the given index. If no key is found null is
  returned

**Parameters**

- `int index`

**Returns:** return the CSNode of the key

<a id="s-getKeys"></a>
### getKeys()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getKeys()
```

Types: [CSNode](CSNode.md#s-CSNode)

Return a list of keys. If the node is not a YANG list then null
  is returned.

**Returns:** List of CSNodes used as keys

<a id="s-getMaxOccurs"></a>
### getMaxOccurs()

```java
public int getMaxOccurs()
```

get MaxOccurs for the node

**Returns:** int maxOccurs

<a id="s-getMinOccurs"></a>
### getMinOccurs()

```java
public int getMinOccurs()
```

get MinOccurs for the node

**Returns:** int minOccurs

<a id="s-getNextSibling"></a>
### getNextSibling()

```java
protected com.tailf.maapi.MaapiSchemas.CSNode getNextSibling()
```

Types: [CSNode](CSNode.md#s-CSNode)

<a id="s-getNodeInfo"></a>
### getNodeInfo()

```java
public com.tailf.maapi.MaapiSchemas.CSNodeInfo getNodeInfo()
```

Types: [CSNodeInfo](CSNodeInfo.md#s-CSNodeInfo)

Retrieves the node information

**Returns:** CSNodeInfo node information about current (this) node

<a id="s-getNS"></a>
### getNS()

```java
public String getNS()
```

get namespace represented as string

**Returns:** String namespace

<a id="s-getNSHash"></a>
### getNSHash()

```java
public int getNSHash()
```

Retrieves the namespace represented as hash value

**Returns:** hashvalue for the namespace

<a id="s-getParentNode"></a>
### getParentNode()

```java
public com.tailf.maapi.MaapiSchemas.CSNode getParentNode()
```

Types: [CSNode](CSNode.md#s-CSNode)

Retrieves the parent node for this node

**Returns:** CSNode parent or null if this a root node

<a id="s-getSchema"></a>
### getSchema()

```java
public com.tailf.maapi.MaapiSchemas.CSSchema getSchema()
```

Types: [CSSchema](CSSchema.md#s-CSSchema)

Retrieves the schema for the node

**Returns:** schema for the node

<a id="s-getSibling"></a>
### getSibling(int)

```java
public com.tailf.maapi.MaapiSchemas.CSNode getSibling(int tagHash)
```

Types: [CSNode](CSNode.md#s-CSNode)

Retrieves sibling with specified tag or null
 if no sibling exists.

**Parameters**

- `int tagHash`

**Returns:** a node

<a id="s-getSiblings"></a>
### getSiblings()

```java
public java.util.List<com.tailf.maapi.MaapiSchemas.CSNode> getSiblings()
```

Types: [CSNode](CSNode.md#s-CSNode)

Retrieves siblings for this node as List or null
 if no siblings exists.


 Includes the current node in the List.

**Returns:** List of sibling nodes including the current (this)
 node

<a id="s-getTag"></a>
### getTag()

```java
public String getTag()
```

Retrieves the node tag represented as string

**Returns:** string tag

<a id="s-getTagHash"></a>
### getTagHash()

```java
public int getTagHash()
```

Retrieves the node tag represented as hash value

**Returns:** int hashvalue for the tag

<a id="s-getType"></a>
### getType()

```java
public com.tailf.maapi.MaapiSchemas.CSType getType()
```

Types: [CSType](CSType.md#s-CSType)

get type for the node

**Returns:** CSType type for the node

<a id="s-getXmlNS"></a>
### getXmlNS()

```java
public String getXmlNS()
```

get the xml namespace represented as string

**Returns:** String xml namespace

<a id="s-hasChildAction"></a>
### hasChildAction()

```java
public boolean hasChildAction()
```

Checks if the node or any of its descendants has YANG 'tailf:action'
 statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:action' statement(s).

<a id="s-hasChildConfAction"></a>
### hasChildConfAction()

```java
public boolean hasChildConfAction()
```

Checks if the node or any of its descendants has YANG
 'tailf:cli-configure-mode' statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:cli-configure-mode' statement(s).

<a id="s-hasChildOperAction"></a>
### hasChildOperAction()

```java
public boolean hasChildOperAction()
```

Checks if the node or any of its descendants has YANG
 'tailf:cli-operational-mode' statement(s).

**Returns:** true if node or any of its descendants has YANG
 'tailf:cli-operational-mode' statement(s).

<a id="s-hasChildReadOnly"></a>
### hasChildReadOnly()

```java
public boolean hasChildReadOnly()
```

Checks if this node is an operational (read-only) node, or if
 any of its descendants are operational nodes.

**Returns:** true if the subtree contains operational data nodes.

<a id="s-hasChildReadWrite"></a>
### hasChildReadWrite()

```java
public boolean hasChildReadWrite()
```

Checks if this node is a configuration (read-write) node, or if any
 of its descendants are configuration data nodes.

**Returns:** true if the subtree contains configuration data nodes.

<a id="s-hasChildren"></a>
### hasChildren()

```java
public boolean hasChildren()
```

Checks if a node hash children.

**Returns:** true if children exists.

<a id="s-hasDisplayWhen"></a>
### hasDisplayWhen()

```java
public boolean hasDisplayWhen()
```

Checks if the node has YANG 'tailf:display-when' statement(s).

**Returns:** true if node has YANG 'tailf:display-when' statement(s).

<a id="s-hasDocDescription"></a>
### hasDocDescription()

```java
public boolean hasDocDescription()
```

Checks if the node has documentation description.

**Returns:** true if node has documentation description.

<a id="s-hashCode"></a>
### hashCode()

```java
public int hashCode()
```

<a id="s-hasMetaData"></a>
### hasMetaData()

```java
public boolean hasMetaData()
```

Checks if the node has YANG 'tailf:meta-data' statement(s).

**Returns:** true if node has YANG 'tailf:meta-data' statement(s).

<a id="s-hasMountPoint"></a>
### hasMountPoint()

```java
public boolean hasMountPoint()
```

<a id="s-hasPrompt"></a>
### hasPrompt()

```java
public boolean hasPrompt()
```

Checks if the node has YANG 'tailf:prompt' statement(s).

**Returns:** true if node has YANG 'tailf:prompt' statement(s).

<a id="s-hasServicepoint"></a>
### hasServicepoint()

```java
public boolean hasServicepoint()
```

Checks if the node has YANG 'ncs:servicepoint' statement(s).

**Returns:** true if node has YANG 'ncs:servicepoint' statement(s).

<a id="s-hasWhen"></a>
### hasWhen()

```java
public boolean hasWhen()
```

Checks if the node has YANG 'when' statement(s).

**Returns:** true if node has YANG 'when' statement(s).

<a id="s-isAction"></a>
### isAction()

```java
public boolean isAction()
```

Checks if a node is an action.

**Returns:** true if it is an action.

<a id="s-isActionParam"></a>
### isActionParam()

```java
public boolean isActionParam()
```

Checks if a node is an action parameter node.

**Returns:** true if the node is an action parameter node.

<a id="s-isActionResult"></a>
### isActionResult()

```java
public boolean isActionResult()
```

Checks if a node is an action result node.

**Returns:** true if the node is action result node.

<a id="s-isCase"></a>
### isCase()

```java
public boolean isCase()
```

Checks if a node is top level of a case.

**Returns:** true if the node is part of a case.

<a id="s-isContainer"></a>
### isContainer()

```java
public boolean isContainer()
```

Checks if a node is a container node.

**Returns:** true if the node is a container node.

<a id="s-isEmptyLeaf"></a>
### isEmptyLeaf()

```java
public boolean isEmptyLeaf()
```

<a id="s-isHidden"></a>
### isHidden()

```java
public boolean isHidden()
```

Checks if the node is hidden via 'tailf:hidden' statement.

**Returns:** true if node is hidden.

<a id="s-isLeaf"></a>
### isLeaf()

```java
public boolean isLeaf()
```

Checks if a node is a leaf node.

**Returns:** true if the node is leaf node.

<a id="s-isLeafList"></a>
### isLeafList()

```java
public boolean isLeafList()
```

Checks if the node is a leaf-list node.

**Returns:** true if the node is leaf-list node.

<a id="s-isLeafref"></a>
### isLeafref()

```java
public boolean isLeafref()
```

Checks if the node is a YANG 'leafref'.

**Returns:** true if node is a YANG 'leafref'.

<a id="s-isList"></a>
### isList()

```java
public boolean isList()
```

Checks if a node is a list node.

**Returns:** true if the node is list node.

<a id="s-isNotif"></a>
### isNotif()

```java
public boolean isNotif()
```

Checks if the node is a notification

**Returns:** true if the node a notification

<a id="s-isOper"></a>
### isOper()

```java
public boolean isOper()
```

**Returns:** true if node is OPER data.

<a id="s-isWritable"></a>
### isWritable()

```java
public boolean isWritable()
```

Checks if the node is writable.

**Returns:** true if the node is writable.

<a id="s-printNodeType"></a>
### printNodeType()

```java
public String printNodeType()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```

Informative string representation of a CSNode instance

**Returns:** String
